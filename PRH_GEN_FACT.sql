create or replace PROCEDURE PRH_GEN_FACT( VcCliDocumento       Clientes.DOCUMENTO%type,
										  VcCliTipDoc      	   Clientes.TIPO_DOCUMENTO%type,
										  VcPlaca       	   Vehiculos.placa%type,
										  vcError        		OUT NoCopy Varchar2)
IS
/***********************************************************************************************************************************************************
APLICACION :    CARCENTER
NOMBRE OBJETO : PRH_GEN_FACT
PROPOSITO :     GENERACION DE FACTURA DE LOS MANTENIMIENTOS APLICADOS A UN CLIENTE. 
PARAMETROS:
      ENTRADA:
				VcCliDocumento     : Documento del Cliente. 
				VcCliTipDoc		   : Tipo de Documento del Cliente.
				VcPlaca     	   : Placa del cliente.
      SALIDA:
			    vcError      : Mensaje de error, cuando este  ocurra.

TABLAS ASOCIADAS :   
				CLIENTES
				VEHICULOS
				MANTENIMIENTOS
				SERVICIO_X_MANTENIMIENTOS
				REPUESTOS_X_MANTENIMIENTOS

EJEMPLO DE LLAMADA : PRH_GEN_FACT('1022412324','CC','MLT513');
DESARROLLO :    Cesar A. Forero Tejada 
FECHA :         2022-09-24
VERSION:  0.1.
***********************************************************************************************************************************************************/

	/*Declaración de Variables*/

		EX_ERROR    		EXCEPTION;
		VCSQLERRM 			VARCHAR2(10000);

		VcIndicador 		Varchar2(100); 			--Variable para de Control/Verificación.
		CodFact  			Number(6);				--Almacenamos el codigo de la Factura.
		VcPresupuesto		Number(12);				--Almacena el valor del presupuesto del cliente.
		VcDescuento 		Varchar2(1);			--Indicador para saber si aplica Descuento al cliente.
		VcValorRep	 		Number(12);				--Almacena el Valor de los Repuestos.
		VcValorServ		 	Number(12);				--Alamcena el valor de los Servicios.
		VcValorSinDesc		Number(12);				--Almacena el valor de la factura sin descuentos.
		VcValorIVA			Number(12);				--Almacena el valor del IVA.
		VcValorDesc			Number(12);				--Almacena el valor del descuento.
		VcValorFact 		Number(12);				--Almacena el valor total de la Factura.
        VcExiste            Varchar2(1);			--Indicador si el cliente tiene mantenimientos en estado Terminado.
BEGIN

		VcIndicador :=  'Generación de Código de Factura';

		SELECT NVL(MAX(CODIGO),0)+1 
		INTO CodFact
		FROM FACTURA;

		VcIndicador :=  'Almacenamiento del valor del presupuesto';
		
		SELECT NVL(PRESUPUESTO,99999999999)
		INTO VcPresupuesto
		FROM CLIENTES CL
		INNER JOIN VEHICULOS VH ON (CL.DOCUMENTO = VH.CLI_DOCUMENTO AND CL.TIPO_DOCUMENTO = VH.CLI_TIPO_DOCUMENTO)
		WHERE CL.DOCUMENTO = VcCliDocumento
		AND VH.PLACA = VcPlaca;

		VcIndicador :=  'Validacion si el cliente tiene Mantenimientos';

		BEGIN
			SELECT 'S'
			INTO VcExiste
			FROM MANTENIMIENTOS MN 
			INNER JOIN VEHICULOS VH ON (VH.PLACA = MN.COD_PLACA)
			INNER JOIN CLIENTES CL ON (CL.DOCUMENTO = VH.CLI_DOCUMENTO AND CL.TIPO_DOCUMENTO = VH.CLI_TIPO_DOCUMENTO)
			WHERE CL.DOCUMENTO = VcCliDocumento
			AND MN.COD_PLACA = VcPlaca
			AND MN.ESTADO = 3;
		EXCEPTION
        WHEN NO_DATA_FOUND THEN
			VcIndicador :=  '000: No tiene mantenimientos este cliente';
        RAISE EX_ERROR;		
		END;

		VcIndicador :=  'Validacion si aplica Descuento y Generacion de valor de los repuestos';

			SELECT 
			CASE WHEN SUM(RM.UNIDADES  * RP.PRECIO_UNITARIO) > 3000000
			THEN  'S'
			ELSE  'N'
			END Descuento, 
			SUM(RM.Unidades  * RP.Precio_Unitario) ValorRepuestos
			INTO VcDescuento, VcValorRep
			FROM MANTENIMIENTOS MN 
			INNER JOIN VEHICULOS VH ON (VH.PLACA = MN.COD_PLACA)
			INNER JOIN CLIENTES CL ON (CL.DOCUMENTO = VH.CLI_DOCUMENTO AND CL.TIPO_DOCUMENTO = VH.CLI_TIPO_DOCUMENTO)
			INNER JOIN REPUESTOS_X_MANTENIMIENTOS RM ON (MN.CODIGO = RM.COD_MANTENIMIENTO)
			INNER JOIN REPUESTOS RP ON (RP.CODIGO = RM.COD_REPUESTO)
			WHERE CL.DOCUMENTO = VcCliDocumento
			AND MN.COD_PLACA = VcPlaca
			AND MN.ESTADO = 3;

		VcIndicador :=  'Generacion del Valor del Servicio';

			SELECT 
			SUM(SM.VALOR_SERV_MAN)
			INTO VcValorServ
			FROM MANTENIMIENTOS MN 
			INNER JOIN VEHICULOS VH ON (VH.PLACA = MN.COD_PLACA)
			INNER JOIN CLIENTES CL ON (CL.DOCUMENTO = VH.CLI_DOCUMENTO AND CL.TIPO_DOCUMENTO = VH.CLI_TIPO_DOCUMENTO)
			INNER JOIN SERVICIO_X_MANTENIMIENTOS SM ON (SM.COD_MANTENIMIENTO = MN.CODIGO)
			WHERE CL.DOCUMENTO = VcCliDocumento
			AND MN.COD_PLACA = VcPlaca
			AND MN.ESTADO = 3;

		VcIndicador :=  'Generando Valor del descuento';

		IF VcDescuento = 'S'
		THEN  VcValorDesc := VcValorServ*(50/100);
		ELSE VcValorDesc := 0;
		END IF;

		VcIndicador :=  'Recalculando Valor del descuento';
		VcValorServ := VcValorServ- VcValorDesc;

		VcIndicador :=  'Calculando el valor de IVA';
		VcValorIVA:= (VcValorServ + VcValorRep)*(19/100);

		VcIndicador :=  'Valor total del servicio sin Descuentos';
		VcValorSinDesc := VcValorServ + VcValorRep +VcValorIVA ;

		VcIndicador :=  'Calculando el valor Total de la Factura';
		VcValorFact := VcValorSinDesc - VcValorDesc;

		VcIndicador :=  'El valor del presupuesto del cliente es menor al valor de la factura';
		IF VcPresupuesto < VcValorFact
		THEN RAISE EX_ERROR;
		END IF;
		
		VcIndicador :=  'Insertar en la tabla Factura';

		INSERT INTO Factura(CODIGO,
							 CLI_DOCUMENTO,
							 CLI_TIP_DOCUMENTO,
							 VALOR_SERVICIO,
							 VALOR_REPUESTOS,
							 VALOR_IVA,
							 VALOR_SIN_DESCUENTO,
							 VALOR_DESCUENTO,
							 VALOR_TOTAL)
						VALUES
						(CodFact,
						VcCliDocumento,
						VcCliTipDoc,
						VcValorServ,
                        VcValorRep,
						VcValorIVA,
						VcValorSinDesc,
						VcValorDesc,
						VcValorFact);
		COMMIT;

		UPDATE MANTENIMIENTOS MN SET MN.ESTADO = '4'
		WHERE MN.ESTADO = '3'
		AND EXISTS (SELECT 1 FROM VEHICULOS VH 
					WHERE VH.PLACA = MN.COD_PLACA 
					AND VH.CLI_DOCUMENTO = VcCliDocumento);

		COMMIT;
		
EXCEPTION
	WHEN EX_ERROR THEN
	  vcError := vcError ||' Indicador: '||VcIndicador;
	WHEN NO_DATA_FOUND THEN
	  vcError := 'No Existen Registro - Indicador: '||VcIndicador||'-'||vcError;
	WHEN OTHERS THEN
	  vcError := SUBSTR('ORA:XXXXX ' || '000 Error No Controlado '||SQLERRM||'  Indicador: '||VcIndicador,1,500);
END;