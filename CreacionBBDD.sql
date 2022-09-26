/*
**********************************************************************************************************************************************
VERSIÓN: 1.0
DESCRIPCION: Instalacion de Tablas para BBDD de CARCENTER
Desarrollado: Cesar Arnulfo Forero Tejada.
**********************************************************************************************************************************************
*/
SET SERVEROUTPUT ON
spool CreacionCARCENTER.lis	
prompt 
SHOW USER 
PROMPT
PROMPT =========================================================================================
PROMPT ... Creacion de Tablas para cliente CARCENTER ...
PROMPT =========================================================================================
PROMPT


PROMPT
PROMPT =========================================================================================
PROMPT ... TABLA MARCAS ...
PROMPT =========================================================================================
PROMPT	

	CREATE TABLE "MARCAS" 
   (	"CODIGO" NUMBER(*,0) NOT NULL ENABLE, 
	"NOMBRE_MARCA" VARCHAR2(30 BYTE) NOT NULL ENABLE, 
	 CONSTRAINT "MARCAS_PK" PRIMARY KEY ("CODIGO"));
   
   COMMENT ON COLUMN "MARCAS"."CODIGO" IS 'Codigo de la Marca';
   COMMENT ON COLUMN "MARCAS"."NOMBRE_MARCA" IS 'Descripcion de marca de Autos';	 

PROMPT
PROMPT =========================================================================================
PROMPT ... TABLA ESTADOS ...
PROMPT =========================================================================================
PROMPT
	 
	CREATE TABLE "ESTADOS" 
   (	"CODIGO" NUMBER(*,0) NOT NULL ENABLE, 
	"ESTADO" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	 CONSTRAINT "ESTADOS_PK" PRIMARY KEY ("CODIGO")	);
	 
   COMMENT ON COLUMN "ESTADOS"."CODIGO" IS 'Codigo del Estado';
   COMMENT ON COLUMN "ESTADOS"."ESTADO" IS 'Estado del mantenimiento';

PROMPT
PROMPT =========================================================================================
PROMPT ... TABLA CLIENTES ...
PROMPT =========================================================================================
PROMPT
	 	 
	CREATE TABLE "CLIENTES" 
   (	"TIPO_DOCUMENTO" VARCHAR2(2 BYTE) NOT NULL ENABLE, 
	"DOCUMENTO" NUMBER(*,0) NOT NULL ENABLE, 
	"PRIMER_NOMBRE" VARCHAR2(30 BYTE) NOT NULL ENABLE, 
	"SEGUNDO_NOMBRE" VARCHAR2(30 BYTE), 
	"PRIMER_APELLIDO" VARCHAR2(30 BYTE) NOT NULL ENABLE, 
	"SEGUNDO_APELLIDO" VARCHAR2(30 BYTE), 
	"CELULAR" VARCHAR2(10 BYTE) NOT NULL ENABLE, 
	"DIRECCION" VARCHAR2(100 BYTE) NOT NULL ENABLE, 
	"EMAIL" VARCHAR2(100 BYTE) NOT NULL ENABLE, 
	"PRESUPUESTO" NUMBER, 
	 CONSTRAINT "CLIENTES_PK" PRIMARY KEY ("TIPO_DOCUMENTO", "DOCUMENTO"));

   COMMENT ON COLUMN "CLIENTES"."TIPO_DOCUMENTO" IS 'Tipo de Documento del cliente.';
   COMMENT ON COLUMN "CLIENTES"."DOCUMENTO" IS 'Numero de Identificacion.';
   COMMENT ON COLUMN "CLIENTES"."PRIMER_NOMBRE" IS 'Primer Nombre del cliente.';
   COMMENT ON COLUMN "CLIENTES"."SEGUNDO_NOMBRE" IS 'Segundo Nombre del cliente.';
   COMMENT ON COLUMN "CLIENTES"."PRIMER_APELLIDO" IS 'Primer Apellido del cliente.';
   COMMENT ON COLUMN "CLIENTES"."SEGUNDO_APELLIDO" IS 'Segundo Apellido del cliente.';
   COMMENT ON COLUMN "CLIENTES"."CELULAR" IS 'Numero de Celular.';
   COMMENT ON COLUMN "CLIENTES"."DIRECCION" IS 'Direccion de Residencia.';
   COMMENT ON COLUMN "CLIENTES"."EMAIL" IS 'Direccion de correo electronico.';
   COMMENT ON COLUMN "CLIENTES"."PRESUPUESTO" IS 'Presupuesto para el mantenimiento.';

PROMPT
PROMPT =========================================================================================
PROMPT ... TABLA MECANICOS ...
PROMPT =========================================================================================
PROMPT

	CREATE TABLE "MECANICOS" 
   (	"TIPO_DOCUMENTO" VARCHAR2(2 BYTE) NOT NULL ENABLE, 
	"DOCUMENTO" NUMBER(*,0) NOT NULL ENABLE, 
	"PRIMER_NOMBRE" VARCHAR2(30 BYTE) NOT NULL ENABLE, 
	"SEGUNDO_NOMBRE" VARCHAR2(30 BYTE), 
	"PRIMER_APELLIDO" VARCHAR2(30 BYTE) NOT NULL ENABLE, 
	"SEGUNDO_APELLIDO" VARCHAR2(30 BYTE), 
	"CELULAR" VARCHAR2(10 BYTE) NOT NULL ENABLE, 
	"DIRECCION" VARCHAR2(200 BYTE) NOT NULL ENABLE, 
	"EMAIL" VARCHAR2(100 BYTE) NOT NULL ENABLE, 
	"ESTADO" CHAR(1 BYTE) NOT NULL ENABLE, 
	 CONSTRAINT "MECANICOS_PK" PRIMARY KEY ("TIPO_DOCUMENTO", "DOCUMENTO"));
	 
   COMMENT ON COLUMN "MECANICOS"."TIPO_DOCUMENTO" IS 'Tipo documento del Mecanico';
   COMMENT ON COLUMN "MECANICOS"."DOCUMENTO" IS 'Documento de identificacion';
   COMMENT ON COLUMN "MECANICOS"."PRIMER_NOMBRE" IS 'Primer Nombre';
   COMMENT ON COLUMN "MECANICOS"."SEGUNDO_NOMBRE" IS 'Seguno Nombre';
   COMMENT ON COLUMN "MECANICOS"."PRIMER_APELLIDO" IS 'Primer Apellido';
   COMMENT ON COLUMN "MECANICOS"."SEGUNDO_APELLIDO" IS 'Segundo Apellido';
   COMMENT ON COLUMN "MECANICOS"."CELULAR" IS 'Numero de Celular';
   COMMENT ON COLUMN "MECANICOS"."DIRECCION" IS 'Direcccion del Residencia';
   COMMENT ON COLUMN "MECANICOS"."EMAIL" IS 'Dirreccion de correo electronico';
   COMMENT ON COLUMN "MECANICOS"."ESTADO" IS 'Estado del Mecanico';

PROMPT
PROMPT =========================================================================================
PROMPT ... TABLA SERVICIOS ...
PROMPT =========================================================================================
PROMPT	 
	 
	CREATE TABLE "SERVICIOS" 
   (	"CODIGO" NUMBER(*,0) NOT NULL ENABLE, 
	"NOMBRE_SERVICIO" VARCHAR2(100 BYTE) NOT NULL ENABLE, 
	"VALOR_MINIMO" NUMBER NOT NULL ENABLE, 
	"VALOR_MAXIMO" NUMBER NOT NULL ENABLE, 
	 CONSTRAINT "SERVICIOS_PK" PRIMARY KEY ("CODIGO"));

   COMMENT ON COLUMN "SERVICIOS"."CODIGO" IS 'Codigo del Servicio';
   COMMENT ON COLUMN "SERVICIOS"."NOMBRE_SERVICIO" IS 'Nombre del Servicio';
   COMMENT ON COLUMN "SERVICIOS"."VALOR_MINIMO" IS 'Valor Minimo';
   COMMENT ON COLUMN "SERVICIOS"."VALOR_MAXIMO" IS 'Valor Maximo';

PROMPT
PROMPT =========================================================================================
PROMPT ... TABLA REPUESTOS ...
PROMPT =========================================================================================
PROMPT	

	CREATE TABLE "REPUESTOS" 
   (	"CODIGO" NUMBER(*,0) NOT NULL ENABLE, 
	"NOMBRE_REPUESTO" VARCHAR2(100 BYTE) NOT NULL ENABLE, 
	"PRECIO_UNITARIO" NUMBER NOT NULL ENABLE, 
	"UNIDADES_INVENTARIO" NUMBER(*,0) NOT NULL ENABLE, 
	"PROVEEDOR" VARCHAR2(300 BYTE) NOT NULL ENABLE, 
	 CONSTRAINT "REPUESTOS_PK" PRIMARY KEY ("CODIGO"));

   COMMENT ON COLUMN "REPUESTOS"."CODIGO" IS 'Codigo del Repuesto';
   COMMENT ON COLUMN "REPUESTOS"."NOMBRE_REPUESTO" IS 'Nombre del Repuesto';
   COMMENT ON COLUMN "REPUESTOS"."PRECIO_UNITARIO" IS 'Precio del Repuesto';
   COMMENT ON COLUMN "REPUESTOS"."UNIDADES_INVENTARIO" IS 'Unidades en Inventario';
   COMMENT ON COLUMN "REPUESTOS"."PROVEEDOR" IS 'Proveedor';

PROMPT
PROMPT =========================================================================================
PROMPT ... TABLA FACTURA ...
PROMPT =========================================================================================
PROMPT	

 CREATE TABLE "FACTURA" 
   (	"CODIGO" NUMBER(*,0) NOT NULL ENABLE, 
	"CLI_DOCUMENTO" NUMBER(*,0) NOT NULL ENABLE, 
	"CLI_TIP_DOCUMENTO" VARCHAR2(2 BYTE) NOT NULL ENABLE, 
	"VALOR_SERVICIO" NUMBER(12,0) NOT NULL ENABLE, 
	"VALOR_REPUESTOS" NUMBER(12,0) NOT NULL ENABLE, 
	"VALOR_IVA" NUMBER(12,0) NOT NULL ENABLE, 
	"VALOR_SIN_DESCUENTO" NUMBER(12,0) NOT NULL ENABLE, 
	"VALOR_DESCUENTO" NUMBER(12,0) NOT NULL ENABLE, 
	"VALOR_TOTAL" NUMBER(12,0) NOT NULL ENABLE, 
	 CONSTRAINT "FACTURA_PK" PRIMARY KEY ("CODIGO"),
	  CONSTRAINT "FACTURA_FK1" FOREIGN KEY ("CLI_TIP_DOCUMENTO", "CLI_DOCUMENTO")
	  REFERENCES "CLIENTES" ("TIPO_DOCUMENTO", "DOCUMENTO") ENABLE);
	  
   COMMENT ON COLUMN "FACTURA"."CODIGO" IS 'Codigo de la factura';
   COMMENT ON COLUMN "FACTURA"."CLI_DOCUMENTO" IS 'Documento del cliente';
   COMMENT ON COLUMN "FACTURA"."CLI_TIP_DOCUMENTO" IS 'Tipo de Documento.';
   COMMENT ON COLUMN "FACTURA"."VALOR_SERVICIO" IS 'Valor del Servicio mano de Obra';
   COMMENT ON COLUMN "FACTURA"."VALOR_REPUESTOS" IS 'Valor de Repuestos.';
   COMMENT ON COLUMN "FACTURA"."VALOR_IVA" IS 'Valor Con IVA';
   COMMENT ON COLUMN "FACTURA"."VALOR_SIN_DESCUENTO" IS 'Valor total sin descuento.';
   COMMENT ON COLUMN "FACTURA"."VALOR_DESCUENTO" IS 'Valor del Descuento.';
   COMMENT ON COLUMN "FACTURA"."VALOR_TOTAL" IS 'Valor Factura.';

PROMPT
PROMPT =========================================================================================
PROMPT ... TABLA VEHICULOS ...
PROMPT =========================================================================================
PROMPT	

  CREATE TABLE "VEHICULOS" 
   (	"PLACA" VARCHAR2(6 BYTE) NOT NULL ENABLE, 
	"COLOR" VARCHAR2(30 BYTE) NOT NULL ENABLE, 
	"COD_MARCA" NUMBER(*,0) NOT NULL ENABLE, 
	"CLI_DOCUMENTO" NUMBER(*,0) NOT NULL ENABLE, 
	"CLI_TIPO_DOCUMENTO" VARCHAR2(2 BYTE) NOT NULL ENABLE, 
	 CONSTRAINT "VEHICULOS_PK" PRIMARY KEY ("PLACA"),
	  CONSTRAINT "VEHICULOS_MARCAS_FK" FOREIGN KEY ("COD_MARCA")
	  REFERENCES "MARCAS" ("CODIGO") ENABLE, 
	 CONSTRAINT "VEHICULOS_CLIENTES_FK" FOREIGN KEY ("CLI_TIPO_DOCUMENTO", "CLI_DOCUMENTO")
	  REFERENCES "CLIENTES" ("TIPO_DOCUMENTO", "DOCUMENTO") ENABLE);
   
   COMMENT ON COLUMN "VEHICULOS"."PLACA" IS 'Placa del Vehiculo';
   COMMENT ON COLUMN "VEHICULOS"."COLOR" IS 'Color de Vehiculo';
   COMMENT ON COLUMN "VEHICULOS"."COD_MARCA" IS 'Codigo de la Marca';
   COMMENT ON COLUMN "VEHICULOS"."CLI_DOCUMENTO" IS 'Documento del cliente';
   COMMENT ON COLUMN "VEHICULOS"."CLI_TIPO_DOCUMENTO" IS 'Tipo de Documento.';

PROMPT
PROMPT =========================================================================================
PROMPT ... TABLA MANTENIMIENTOS ...
PROMPT =========================================================================================
PROMPT	

  CREATE TABLE "MANTENIMIENTOS" 
   (	"CODIGO" NUMBER(*,0) NOT NULL ENABLE, 
	"ESTADO" NUMBER(*,0), 
	"COD_PLACA" VARCHAR2(6 BYTE) NOT NULL ENABLE, 
	"FECHA" DATE NOT NULL ENABLE, 
	"MEC_DOCUMENTO" NUMBER(*,0) NOT NULL ENABLE, 
	"MEC_TIPO_DOCUMENTO" VARCHAR2(2 BYTE) NOT NULL ENABLE, 
	 CONSTRAINT "MANTENIMIENTOS_PK" PRIMARY KEY ("CODIGO"),
	 CONSTRAINT "MANTENIMIENTOS_MECANICOS_FK" FOREIGN KEY ("MEC_TIPO_DOCUMENTO", "MEC_DOCUMENTO")
	  REFERENCES "MECANICOS" ("TIPO_DOCUMENTO", "DOCUMENTO") ENABLE, 
	 CONSTRAINT "MAN_VEHICULOS_FK2" FOREIGN KEY ("COD_PLACA")
	  REFERENCES "VEHICULOS" ("PLACA") ENABLE, 
	 CONSTRAINT "MAN_ESTAD_FK1" FOREIGN KEY ("CODIGO")
	  REFERENCES "ESTADOS" ("CODIGO") ENABLE);
  
   COMMENT ON COLUMN "MANTENIMIENTOS"."CODIGO" IS 'Codigo del Mantenimiento';
   COMMENT ON COLUMN "MANTENIMIENTOS"."ESTADO" IS 'Estado del Mantenimiento';
   COMMENT ON COLUMN "MANTENIMIENTOS"."COD_PLACA" IS 'Placa del Vehiculo';
   COMMENT ON COLUMN "MANTENIMIENTOS"."FECHA" IS 'Fecha del Mantenimiento';
   COMMENT ON COLUMN "MANTENIMIENTOS"."MEC_DOCUMENTO" IS 'Documento del Mecanico';
   COMMENT ON COLUMN "MANTENIMIENTOS"."MEC_TIPO_DOCUMENTO" IS 'Tipo de Documento del Mecanico';

PROMPT
PROMPT =========================================================================================
PROMPT ... TABLA FOTOS ...
PROMPT =========================================================================================
PROMPT	

  CREATE TABLE "FOTOS" 
   (	"CODIGO" NUMBER(*,0) NOT NULL ENABLE, 
	"RUTA" VARCHAR2(200 BYTE), 
	"COD_MANTENIMIENTO" NUMBER(*,0) NOT NULL ENABLE, 
	 CONSTRAINT "FOTOS_PK" PRIMARY KEY ("CODIGO"),
	  CONSTRAINT "FOTOS_MAN_FK" FOREIGN KEY ("COD_MANTENIMIENTO")
	  REFERENCES "MANTENIMIENTOS" ("CODIGO") ENABLE);
   
   COMMENT ON COLUMN "FOTOS"."CODIGO" IS 'Codigo de la Foto';
   COMMENT ON COLUMN "FOTOS"."RUTA" IS 'Ubicacion de la Foto';

PROMPT
PROMPT =========================================================================================
PROMPT ... TABLA SERVICIO_X_MANTENIMIENTOS ...
PROMPT =========================================================================================
PROMPT	

  CREATE TABLE "SERVICIO_X_MANTENIMIENTOS" 
   (	"CODIGO" NUMBER(*,0) NOT NULL ENABLE, 
	"TIEMPO_ESTIMADO" NUMBER(*,0) NOT NULL ENABLE, 
	"COD_SERVICIO" NUMBER(*,0) NOT NULL ENABLE, 
	"COD_MANTENIMIENTO" NUMBER(*,0) NOT NULL ENABLE, 
	"VALOR_SERV_MAN" NUMBER NOT NULL ENABLE, 
	 CONSTRAINT "SERVICIO_X_MANTENIMIENTOS_PK" PRIMARY KEY ("CODIGO"),
	 CONSTRAINT "SER_X_MAN_SER_FK" FOREIGN KEY ("COD_SERVICIO")
	  REFERENCES "SERVICIOS" ("CODIGO") ENABLE, 
	 CONSTRAINT "SER_X_MAN_MAN_FK" FOREIGN KEY ("COD_MANTENIMIENTO")
	  REFERENCES "MANTENIMIENTOS" ("CODIGO") ENABLE);

   COMMENT ON COLUMN "SERVICIO_X_MANTENIMIENTOS"."CODIGO" IS 'Codigo del servicio al mantenimiento.';
   COMMENT ON COLUMN "SERVICIO_X_MANTENIMIENTOS"."TIEMPO_ESTIMADO" IS 'Tiempo Estimado del servicio.';
   COMMENT ON COLUMN "SERVICIO_X_MANTENIMIENTOS"."COD_SERVICIO" IS 'Codigo del servicio.';
   COMMENT ON COLUMN "SERVICIO_X_MANTENIMIENTOS"."COD_MANTENIMIENTO" IS 'Codigo del mantenimiento.';
   COMMENT ON COLUMN "SERVICIO_X_MANTENIMIENTOS"."VALOR_SERV_MAN" IS 'Valor del Servicio';

PROMPT
PROMPT =========================================================================================
PROMPT ... TABLA REPUESTOS_X_MANTENIMIENTOS ...
PROMPT =========================================================================================
PROMPT	

  CREATE TABLE "REPUESTOS_X_MANTENIMIENTOS" 
   (	"CODIGO" NUMBER(*,0) NOT NULL ENABLE, 
	"UNIDADES" NUMBER(*,0) NOT NULL ENABLE, 
	"TIEMPO_ESTIMADO" NUMBER(*,0) NOT NULL ENABLE, 
	"COD_MANTENIMIENTO" NUMBER(*,0) NOT NULL ENABLE, 
	"COD_REPUESTO" NUMBER(*,0) NOT NULL ENABLE, 
	 CONSTRAINT "REPUESTOS_X_MANTENIMIENTOS_PK" PRIMARY KEY ("CODIGO"),
	  CONSTRAINT "REP_X_MAN_REP_FK" FOREIGN KEY ("COD_REPUESTO")
	  REFERENCES "REPUESTOS" ("CODIGO") ENABLE, 
	 CONSTRAINT "REP_X_MTOS_MAN_FK" FOREIGN KEY ("COD_MANTENIMIENTO")
	  REFERENCES "MANTENIMIENTOS" ("CODIGO") ENABLE);

PROMPT
PROMPT =========================================================================================
PROMPT ... CREACION DE PROCEDIMIENTO...
PROMPT =========================================================================================
PROMPT	

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
/
	
prompt  ====================================================================================================================================== 
Prompt  FIN PROCESO DE INSTALACIÓN
prompt  ======================================================================================================================================
prompt  Se confirmaron los cambios
	 
spool off	 

/
