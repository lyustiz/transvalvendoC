set schema 'produccion';

CREATE SEQUENCE cuenta_usuario_id_cuenta_usuario_seq; 
CREATE SEQUENCE boveda_historial_transito_id_boveda_historial_transito_seq;
CREATE SEQUENCE traspaso_efectivo_caja_id_traspaso_efectivo_caja_seq; 
CREATE SEQUENCE traspaso_efectivo_id_traspaso_efectivo_seq; 
CREATE SEQUENCE solicitud_accion_id_solicitud_accion_seq; 
CREATE SEQUENCE ruta_cartaporte_id_ruta_cartaporte_seq; 
CREATE SEQUENCE razon_id_razon_seq; 
CREATE SEQUENCE punto_efectivo_id_punto_efectivo_seq; 
CREATE SEQUENCE operacion_id_operacion_seq; 
CREATE SEQUENCE tipo_efectivo_id_tipo_efectivo_seq; 
CREATE SEQUENCE efectivo_id_efectivo_seq; 
CREATE SEQUENCE traspaso_bloque_id_traspaso_bloque_seq; 
CREATE SEQUENCE solicitud_traspaso_id_solicitud_traspaso_seq; 
CREATE SEQUENCE solicitud_ruta_id_solicitud_ruta_seq; 
CREATE SEQUENCE solicitud_envase_efectivo_id_solicitud_envase_efectivo_seq; 
CREATE SEQUENCE solicitud_envase_id_solicitud_envase_seq; 
CREATE SEQUENCE solicitud_cartaporte_id_solicitud_cartaporte_seq; 
CREATE SEQUENCE diferencia_id_diferencia_seq; 
CREATE SEQUENCE diferenciac_id_diferenciac_seq; 
CREATE SEQUENCE deuda_transito_id_deuda_transito_seq; 
CREATE SEQUENCE cuenta_id_cuenta_seq; 
CREATE SEQUENCE cartaporte_punto_id_cartaporte_punto_seq; 
CREATE SEQUENCE cartaporte_id_cartaporte_seq; 
CREATE SEQUENCE boveda_historial_id_boveda_historial_seq; 
CREATE SEQUENCE boveda_efectivo_pendiente_id_boveda_efectivo_pendiente_seq; 
CREATE SEQUENCE bloque_id_bloque_seq; 
CREATE SEQUENCE arqueo_punto_id_arqueo_punto_seq; 
CREATE SEQUENCE traspaso_cartaporte_id_traspaso_cartaporte_seq; 
CREATE SEQUENCE traspaso_caja_id_traspaso_caja_seq; 
CREATE SEQUENCE traspaso_id_traspaso_seq; 
CREATE SEQUENCE supervisor_id_supervisor_seq; 
CREATE SEQUENCE solicitud_servicio_id_solicitud_servicio_seq; 
CREATE SEQUENCE solicitud_id_solicitud_seq; 
CREATE SEQUENCE servicio_id_servicio_seq; 
CREATE SEQUENCE ruta_id_ruta_seq; 
CREATE SEQUENCE rubro_id_rubro_seq; 
CREATE SEQUENCE punto_id_punto_seq; 
CREATE SEQUENCE placa_id_placa_seq; 
CREATE SEQUENCE origen_id_origen_seq; 
CREATE SEQUENCE oficial_id_oficial_seq; 
CREATE SEQUENCE modulo_id_modulo_seq; 
CREATE SEQUENCE envase_efectivo_id_envase_efectivo_seq; 
CREATE SEQUENCE envase_arqueo_id_envase_arqueo_seq; 
CREATE SEQUENCE envase_id_envase_seq; 
CREATE SEQUENCE diferenciae_id_diferenciae_seq; 
CREATE SEQUENCE deuda_id_deuda_seq; 
CREATE SEQUENCE deposito_id_deposito_seq; 
CREATE SEQUENCE cuenta_numero_id_cuenta_numero_seq; 
CREATE SEQUENCE cuenta_efectivo_id_cuenta_efectivo_seq; 
CREATE SEQUENCE concepto_id_concepto_seq; 
CREATE SEQUENCE cliente_id_cliente_seq; 
CREATE SEQUENCE cajetin_id_cajetin_seq; 
CREATE SEQUENCE caja_historial_id_caja_historial_seq; 
CREATE SEQUENCE caja_efectivo_id_caja_efectivo_seq; 
CREATE SEQUENCE caja_id_caja_seq; 
CREATE SEQUENCE boveda_historial_efectivo_id_boveda_historial_efectivo_seq; 
CREATE SEQUENCE boveda_historial_cuenta_id_boveda_historial_cuenta_seq; 
CREATE SEQUENCE boveda_efectivo_id_boveda_efectivo_seq; 
CREATE SEQUENCE boveda_id_boveda_seq; 
CREATE SEQUENCE bloque_efectivo_id_bloque_efectivo_seq; 
CREATE SEQUENCE banco_id_banco_seq; 
CREATE SEQUENCE arqueo_id_arqueo_seq; 
CREATE SEQUENCE acta_id_acta_seq; 

CREATE TABLE acta(
    id_acta integer NOT NULL DEFAULT nextval('acta_id_acta_seq'::regclass),
    id_razon integer NOT NULL,
    id_origen integer NOT NULL,
    id_boveda integer NOT NULL,
    id_cartaporte integer NOT NULL,
    id_plomo integer NOT NULL,
    fe_ruta timestamp without time zone NULL,
    tx_observacion varchar(200),
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_acta PRIMARY KEY (id_acta)
);

CREATE TABLE _acta_cartaporte(
    id_acta_cartaporte integer NOT NULL,
    id_cartaporte integer NOT NULL,
    tx_observacion varchar(200),
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_acta_cartaporte PRIMARY KEY (id_acta)
) ;

CREATE TABLE _acta_envase(
    id_acta_envase integer NOT NULL,
    id_envase integer NOT NULL,
    nu_plomo varchar(20) NULL,
    bo_abierto boolean NOT NULL,
    fe_abierto timestamp without time zone NULL,
    id_usu_apertura varchar(30) NULL,
    id_cartaporte varchar(13) NOT NULL,
    bo_defectuoso boolean NOT NULL,
    mo_envase numeric(18, 3) NULL,
    id_acta integer NOT NULL,
    tx_observacion varchar(200),
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_acta_envase PRIMARY KEY (id_acta_envase)
 );

CREATE TABLE _acta_envase_efectivo(
    id_acta_envase_efectivo integer NOT NULL,
    id_envase integer NOT NULL,
    id_efectivo varchar(5) NOT NULL,
    ca_piezas integer NOT NULL,
    mo_total numeric(18, 3) NOT NULL,
    tx_observacion varchar(200),
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_acta_envase_efectivo PRIMARY KEY (id_acta_envase_efectivo)
);

CREATE TABLE _acta_ruta(
    id_acta_ruta integer NOT NULL,
    id_acta integer NOT NULL,
    id_ruta integer NOT NULL,
    tx_observacion varchar(200),
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_acta_ruta PRIMARY KEY (id_acta_ruta)
);

CREATE TABLE _arqueo(
    id_arqueo integer NOT NULL DEFAULT nextval('arqueo_id_arqueo_seq'::regclass),
    id_cuenta integer NOT NULL,
    id_boveda integer NOT NULL,
    mo_arqueo numeric(18, 3) NOT NULL,
    id_usu_cierre varchar(30) NULL,
    bo_cerrado boolean NOT NULL,
    bo_sistema boolean NOT NULL,
    id_bolsa varchar(13) NULL,
    id_rubro integer NULL,
    ca_envase integer NULL,
    nu_plomo varchar(50) NULL,
    tx_observacion varchar(200),
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_arqueo PRIMARY KEY (id_arqueo)
);


CREATE TABLE _arqueo_punto(
    id_arqueo_punto integer NOT NULL,
    id_arqueo varchar(13) NOT NULL,
    id_punto integer NOT NULL,
    id_tipo integer NOT NULL,
    fe_arqueo timestamp without time zone NOT NULL,
    tx_observacion varchar(200),
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_arqueo_punto PRIMARY KEY (id_arqueo_punto)
);


CREATE TABLE banco(
    id_banco integer NOT NULL DEFAULT nextval('banco_id_banco_seq'::regclass),
    nb_banco varchar(50) NOT NULL,
    tx_observacion varchar(200),
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_banco PRIMARY KEY (id_banco)
);

CREATE TABLE bloque(
    id_bloque integer NOT NULL DEFAULT nextval('bloque_id_bloque_seq'::regclass),
    co_bloque varchar(10) NOT NULL,
    id_boveda integer NOT NULL,
    bo_abierto boolean NOT NULL,
    id_usu_apertura integer NOT NULL,
    id_cartaporte integer NOT NULL,
    tx_observacion varchar(200),
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_bloque PRIMARY KEY (id_bloque )
);


CREATE TABLE bloque_efectivo(
    id_bloque_efectivo integer NOT NULL DEFAULT nextval('bloque_efectivo_id_bloque_efectivo_seq'::regclass),
    id_bloque integer NOT NULL,
    id_efectivo integer NOT NULL,
    ca_piezas integer NOT NULL,
    mo_total numeric(18, 3) NOT NULL,
    tx_observacion varchar(200),
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_bloque_efectivo PRIMARY KEY (id_bloque_efectivo)
);


CREATE TABLE boveda(
    id_boveda integer NOT NULL DEFAULT nextval('boveda_id_boveda_seq'::regclass),
    nb_boveda varchar(50) NOT NULL,
    tx_observacion varchar(200),
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_boveda PRIMARY KEY (id_boveda)
);



CREATE TABLE _boveda_efectivo(
    id_boveda_efectivo integer NOT NULL,
    id_boveda integer NOT NULL,
    id_efectivo integer NOT NULL,
    ca_piezas integer NOT NULL,
    mo_total numeric(18, 3) NOT NULL,
    tx_observacion varchar(200),
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_boveda_efectivo PRIMARY KEY (id_boveda_efectivo)
);


CREATE TABLE _boveda_efectivo_pendiente(
    id_boveda_efectivo_pendiente integer NOT NULL,
    id_boveda integer NOT NULL,
    mo_pendiente numeric(18, 3) NOT NULL,
    tx_descripcion varchar(50) NOT NULL,
    tx_observacion varchar(200),
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_boveda_efectivo_pendiente PRIMARY KEY (id_boveda_efectivo_pendiente)
 );

--movimientos boveda
CREATE TABLE boveda_historial(
    id_boveda_historial integer NOT NULL DEFAULT nextval('boveda_historial_id_boveda_historial_seq'::regclass),
    id_boveda integer NOT NULL,
    id_usu_apertura integer NOT NULL,
    id_usu_cierre integer,
    fe_abierto timestamp without time zone NOT NULL,
    fe_cierre timestamp without time zone NULL,
    mo_inicial numeric(18, 3) NOT NULL,
    mo_transito numeric(18, 3) NULL,
    mo_sin_procesar numeric(18, 3) NULL,
    mo_deuda numeric(18, 3) NULL,
    mo_pagar numeric(18, 3) NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_boveda_historial PRIMARY KEY (id_boveda_historial)
);

CREATE TABLE _boveda_historial_cuenta(
    id_boveda_historial_cuenta integer NOT NULL,
    id_boveda integer NOT NULL,
    tx_descripcion varchar(100) NOT NULL,
    id_tipo integer NOT NULL,
    mo_total numeric(18, 3) NOT NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_boveda_historial_cuenta PRIMARY KEY (id_boveda_historial_cuenta)
);

--moviientos cuenta piezs7monto
CREATE TABLE boveda_historial_efectivo(
    id_boveda_historial_efectivo integer NOT NULL DEFAULT nextval('boveda_historial_efectivo_id_boveda_historial_efectivo_seq'::regclass),
    id_boveda integer NOT NULL,
    id_efectivo varchar(5) NOT NULL,
    ca_piezas integer NOT NULL,
    mo_total numeric(18, 3) NOT NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_boveda_historial_efectivo PRIMARY KEY (id_boveda_historial_efectivo)
);

--moviminto entrada salida
CREATE TABLE _boveda_historial_transito(
    id_boveda_historial_transito integer NOT NULL,
    id_boveda integer NOT NULL,
    tx_descripcion varchar(100) NOT NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_boveda_historial_transito_1 PRIMARY KEY (id_boveda_historial_transito)
);

CREATE TABLE caja(
    id_caja integer NOT NULL DEFAULT nextval('caja_id_caja_seq'::regclass),
    nb_caja varchar(50) NOT NULL,
    id_tipo integer NOT NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_caja PRIMARY KEY (id_caja)
);

--saldo caja
CREATE TABLE caja_efectivo(
    id_caja_efectivo integer NOT NULL DEFAULT nextval('caja_efectivo_id_caja_efectivo_seq'::regclass),
    id_caja integer NOT NULL,
    id_efectivo varchar(5) NOT NULL,
    ca_piezas integer NOT NULL,
    mo_total numeric(18, 3) NOT NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_caja_efectivo PRIMARY KEY (id_caja_efectivo) 
);

CREATE TABLE caja_historial(
    id_caja_historial integer NOT NULL DEFAULT nextval('caja_historial_id_caja_historial_seq'::regclass),
    id_caja integer NOT NULL,
    fe_abierto timestamp without time zone NOT NULL,
    id_usu_apertura integer NOT NULL,
    id_usu_cierre integer,
    fe_cierre timestamp without time zone NULL,
    mo_inicial numeric(18, 3) NOT NULL,
    mo_transito numeric(18, 3) NULL,
    mo_procesar numeric(18, 3) NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_caja_historial PRIMARY KEY (id_caja_historial)
);


CREATE TABLE cajetin(
    id_cajetin integer NOT NULL DEFAULT nextval('cajetin_id_cajetin_seq'::regclass),
    nb_cajetin varchar(15) NOT NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_cajetin PRIMARY KEY (id_cajetin)
);

CREATE TABLE cartaporte(
    id_cartaporte integer NOT NULL DEFAULT nextval('cartaporte_id_cartaporte_seq'::regclass),
    id_cuenta integer NOT NULL,
    id_boveda integer NOT NULL,
    mo_total numeric(18, 3) NOT NULL,
    id_usu_apertura integer NOT NULL,
    id_usu_cierre integer NULL,
    fe_apertura timestamp without time zone NULL,
    fe_cierre timestamp without time zone NULL,
    bo_cerrado boolean NOT NULL,
    bo_sistema boolean NOT NULL,
    id_bolsa varchar(13) NULL,
    id_rubro integer NULL,
    id_boveda integer NULL,
    ca_envase integer NULL,
    nu_plomo varchar(50) NULL, --requiere tabla plomo
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_cartaporte PRIMARY KEY (id_cartaporte) 
);

CREATE TABLE cartaporte_punto(
    id_cartaporte_punto integer NOT NULL DEFAULT nextval('ingreso_id_ingreso_seq'::regclass),
    id_cartaporte varchar(13) NOT NULL,
    id_punto integer NOT NULL,
    id_tipo integer NOT NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_cartaporte_punto PRIMARY KEY (id_cartaporte_punto)
); 

CREATE TABLE cliente(
    id_cliente integer NOT NULL DEFAULT nextval('ingreso_id_ingreso_seq'::regclass),
    nb_cliente varchar(100) NOT NULL,
    tx_direccion varchar(250) NULL,
    tx_telefono varchar(30) NULL,
    tx_email varchar(60) NULL,
    co_rif varchar(20) NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_cliente PRIMARY KEY (id_cliente)
);

CREATE TABLE concepto(
    id_concepto integer NOT NULL DEFAULT nextval('ingreso_id_ingreso_seq'::regclass),
    nb_concepto varchar(50) NOT NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_concepto PRIMARY KEY (id_concepto)
);


CREATE TABLE cuenta(
    id_cuenta integer NOT NULL DEFAULT nextval('ingreso_id_ingreso_seq'::regclass),
    nu_cuenta varchar(50) NULL,
    id_cliente char(10) NOT NULL,
    mo_saldo numeric(18, 3) NOT NULL,
    id_ultima_trans integer NOT NULL,
    id_boveda integer NOT NULL,
    id_tipo_cuenta integer NOT NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_Cuenta PRIMARY KEY (id_cuenta) 
 );

CREATE TABLE cuenta_efectivo(
    id_cuenta_efectivo integer NOT NULL DEFAULT nextval('ingreso_id_ingreso_seq'::regclass),
    id_cuenta integer NOT NULL,
    id_efectivo varchar(5) NOT NULL,
    ca_piezas integer NOT NULL,
    mo_total numeric(18, 3) NOT NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_cuenta_efectivo PRIMARY KEY (id_cuenta_efectivo)
); 

CREATE TABLE cuenta_numero(
    id_cuenta_numero integer NOT NULL DEFAULT nextval('ingreso_id_ingreso_seq'::regclass),
    nu_cuenta varchar(50) NOT NULL,
    id_banco integer NOT NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_cuenta_numero PRIMARY KEY (id_cuenta_numero)
);



CREATE TABLE cuenta_usuario(
    id_cuenta_usuario integer NOT NULL DEFAULT nextval('ingreso_id_ingreso_seq'::regclass),
    id_cuenta integer NOT NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_cuenta_usuario PRIMARY KEY (id_cuenta_usuario)
);


CREATE TABLE deposito(
    id_deposito integer NOT NULL DEFAULT nextval('ingreso_id_ingreso_seq'::regclass),
    fe_deposito timestamp without time zone NOT NULL,
    tx_contacto varchar(50) NOT NULL,
    mo_total numeric(18, 3) NOT NULL,
    nu_deposito varchar(50) NULL,
    id_concepto integer NULL,
    id_cuenta integer NOT NULL,
    id_cuenta_numero integer NULL,
    id_banco integer NULL,
    id_transpaso integer NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_deposito PRIMARY KEY (id_deposito)
);


CREATE TABLE deuda(
    id_deuda integer NOT NULL DEFAULT nextval('ingreso_id_ingreso_seq'::regclass),
    fe_deuda timestamp without time zone NOT NULL,
    id_punto integer NOT NULL,
    mo_total numeric(18, 3) NOT NULL,
    mo_transaccion numeric(18, 3) NOT NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_deuda PRIMARY KEY (id_deuda )
);

CREATE TABLE deuda_transito(
    id_deuda_transito integer NOT NULL DEFAULT nextval('ingreso_id_ingreso_seq'::regclass),
    aa_deuda varchar(4) NOT NULL,
    mm_deuda varchar(2) NOT NULL,
    mo_deuda numeric(18, 3) NOT NULL,
    id_boveda integer NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_deuda_transito PRIMARY KEY (id_deuda_transito)
);

CREATE TABLE diferencia(
    id_diferencia integer NOT NULL DEFAULT nextval('ingreso_id_ingreso_seq'::regclass),
    fe_diferencia timestamp without time zone NOT NULL,
    id_punto integer NOT NULL,
    mo_total numeric(18, 3) NOT NULL,
    mo_transaccion numeric(18, 3) NOT NULL,
    tx_descripcion varchar(200) NOT NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_diferencia PRIMARY KEY (id_diferencia)
) ;


CREATE TABLE diferenciac(
    id_diferenciac integer NOT NULL DEFAULT nextval('ingreso_id_ingreso_seq'::regclass),
    mo_declarado numeric(18, 3) NULL,
    mo_total numeric(18, 3) NULL,
    nu_carnet varchar(50) NULL,
    ca_relacionada integer NULL,
    co_remision varchar(50) NULL,
    tx_supervisor varchar(50) NULL,
    --id_cartaporte varchar(13) NOT NULL,
    mo_sobrante numeric(18, 3) NULL,
    mo_faltante numeric(18, 3) NULL,
    bo_activo boolean NOT NULL,
    id_punto integer NULL,
    id_boveda integer NULL,
    --cartaportes varchar(200) NULL,
    fe_cartaporte timestamp without time zone NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_diferenciac PRIMARY KEY (id_diferenciac)
);



CREATE TABLE diferenciae(
    id_diferenciae integer NOT NULL DEFAULT nextval('ingreso_id_ingreso_seq'::regclass),
    fe_diferenciaE timestamp without time zone NULL,
    id_punto integer NULL,
    mo_total numeric(18, 3) NULL,
    mo_transaccion numeric(18, 3) NULL,
    tx_descripcion varchar(200) NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
CONSTRAINT pk_diferenciaC PRIMARY KEY (id_diferenciae)
);

CREATE TABLE efectivo(
    id_efectivo integer NOT NULL DEFAULT nextval('ingreso_id_ingreso_seq'::regclass),
    id_tipo_efectivo integer NOT NULL,
    mo_denominacion numeric(18, 3) NOT NULL,
    tx_imagen varchar(100) NOT NULL,
    bo_activo boolean NOT NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_efectivo PRIMARY KEY (id_efectivo)
) ;

CREATE TABLE tipo_efectivo(
    id_tipo_efectivo integer NOT NULL,
    nb_tipo_efectivo varchar(50) NOT NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_tipo_efectivo PRIMARY KEY (id_tipo_efectivo)
) ;


CREATE TABLE envase(
    id_envase integer NOT NULL DEFAULT nextval('ingreso_id_ingreso_seq'::regclass),
    nu_plomo varchar(20) NULL,
    bo_abierto boolean NOT NULL,
    fe_abierto timestamp without time zone NULL,
    id_usu_apertura varchar(30) NULL,
    id_cartaporte varchar(13) NOT NULL,
    bo_defectuoso boolean NOT NULL,
    mo_total numeric(18, 3) NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_envase PRIMARY KEY (id_envase)
) ;

CREATE TABLE envase_arqueo(
    id_envase_arqueo integer NOT NULL DEFAULT nextval('ingreso_id_ingreso_seq'::regclass),
    id_efectivo varchar(5) NOT NULL,
    ca_piezas integer NOT NULL,
    mo_total numeric(18, 3) NOT NULL,
    id_cajetin integer NOT NULL,
    id_modulo integer NOT NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_envase_arqueo PRIMARY KEY (id_envase_arqueo)
) ;

CREATE TABLE envase_efectivo(
    id_envase_efectivo integer NOT NULL DEFAULT nextval('ingreso_id_ingreso_seq'::regclass),
    id_envase integer NOT NULL,
    id_efectivo varchar(5) NOT NULL,
    ca_piezas integer NOT NULL,
    mo_total numeric(18, 3) NOT NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_envase_efectivo PRIMARY KEY (id_envase_efectivo)
) ;

CREATE TABLE modulo(
    id_modulo integer NOT NULL DEFAULT nextval('ingreso_id_ingreso_seq'::regclass),
    nb_modulo varchar(15) NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_modulo PRIMARY KEY (id_modulo)
) ;

CREATE TABLE oficial(
    id_oficial integer NOT NULL DEFAULT nextval('ingreso_id_ingreso_seq'::regclass),
    nb_oficial varchar(50) NOT NULL,
    nu_cedula varchar(12) NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_oficial PRIMARY KEY (id_oficial)
) ;


CREATE TABLE operacion(
    id_operacion integer NOT NULL DEFAULT nextval('ingreso_id_ingreso_seq'::regclass),
    nb_operacion varchar(50) NOT NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_operacion PRIMARY KEY (id_operacion )
) ;

CREATE TABLE origen(
    id_origen integer NOT NULL DEFAULT nextval('ingreso_id_ingreso_seq'::regclass),
    nb_origen varchar(30) NOT NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_origen PRIMARY KEY (	id_origen )
) ;


CREATE TABLE placa(
    id_placa integer NOT NULL DEFAULT nextval('ingreso_id_ingreso_seq'::regclass),
    co_placa varchar(500) NOT NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_placa PRIMARY KEY (id_placa)
) ;


--refactorizar
CREATE TABLE _plomo(
    id_plomo varchar(50) NOT NULL,
    id_diferencia integer NOT NULL,
    D0010 integer NULL,
    D0050 integer NULL,
    D0100 integer NULL,
    D0125 integer NULL,
    D0250 integer NULL,
    D0500 integer NULL,
    D10 integer NULL,
    D100 integer NULL,
    D1000 integer NULL,
    D2 integer NULL,
    D20 integer NULL,
    D5 integer NULL,
    D50 integer NULL,
    F0010 integer NULL,
    F0050 integer NULL,
    F0100 integer NULL,
    F0125 integer NULL,
    F0250 integer NULL,
    F0500 integer NULL,
    F10 integer NULL,
    F100 integer NULL,
    F1000 integer NULL,
    F2 integer NULL,
    F20 integer NULL,
    F5 integer NULL,
    F50 integer NULL
); 

--refactorizar
CREATE TABLE _plomo_diferencia(
    id_plomo varchar(50) NOT NULL,
    id_cartaporte varchar(13) NULL,
    D0010 integer NULL,
    D0050 integer NULL,
    D0100 integer NULL,
    D0125 integer NULL,
    D0250 integer NULL,
    D0500 integer NULL,
    D10 integer NULL,
    D100 integer NULL,
    D1000 integer NULL,
    D2 integer NULL,
    D20 integer NULL,
    D5 integer NULL,
    D50 integer NULL,
    F0010 integer NULL,
    F0050 integer NULL,
    F0100 integer NULL,
    F0125 integer NULL,
    F0250 integer NULL,
    F0500 integer NULL,
    F10 integer NULL,
    F100 integer NULL,
    F1000 integer NULL,
    F2 integer NULL,
    F20 integer NULL,
    F5 integer NULL,
    F50 integer NULL,
    supervisor varchar(50) NULL
);


CREATE TABLE _precinto(
    id_precinto integer  NOT NULL,
    co_precinto varchar(50) NOT NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_precinto PRIMARY KEY (id_precinto)
); 


--ubicaciones / tipo Ubicacon
CREATE TABLE punto(
    id_punto integer NOT NULL DEFAULT nextval('ingreso_id_ingreso_seq'::regclass),
    nu_punto integer NULL,
    nb_punto varchar(250) NOT NULL,
    tx_ireccion text NOT NULL,
    tx_telefono numeric(18, 0) NULL,
    tx_telefono2 numeric(18, 0) NULL,
    tx_telefono3 numeric(18, 0) NULL,
    tx_contacto varchar(250) NULL,
    id_cuenta integer NOT NULL,
    id_rubro integer NULL,
    nu_orden integer NULL,
    co_cajero varchar(50) NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_punto PRIMARY KEY (id_punto)
) ;

CREATE TABLE punto_efectivo(
    id_punto_efectivo integer NOT NULL DEFAULT nextval('ingreso_id_ingreso_seq'::regclass),
    id_punto integer NOT NULL,
    id_efectivo varchar(5) NOT NULL,
    ca_piezas integer NOT NULL,
    mo_total numeric(18, 3) NOT NULL,
    fe_revision timestamp without time zone NOT NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_punto_efectivo PRIMARY KEY (id_punto_efectivo)
) ;


CREATE TABLE razon(
    id_razon integer NOT NULL DEFAULT nextval('ingreso_id_ingreso_seq'::regclass),
    nb_razon varchar(200) NOT NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_razon PRIMARY KEY (id_razon)
) ;


CREATE TABLE rubro(
    id_rubro integer NOT NULL DEFAULT nextval('ingreso_id_ingreso_seq'::regclass),
    nb_rubro varchar(250) NOT NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_rubro PRIMARY KEY (id_rubro)
) ;



CREATE TABLE ruta(
    id_ruta integer NOT NULL DEFAULT nextval('ingreso_id_ingreso_seq'::regclass),
    nb_ruta varchar(50) NOT NULL,
    fe_ruta timestamp without time zone NOT NULL,
    tx_turno varchar(2) NOT NULL,
    id_oficial_val varchar(50) NULL,
    id_auxiliar_val varchar(50) NULL,
    id_guardia_cust varchar(50) NULL,
    id_oficial_val2 varchar(50) NULL,
    id_unidad varchar(50) NULL,
    ca_carteras integer NULL,
    ca_cambio integer NULL,
    ca_km_salida numeric(18, 2) NULL,
    ca_km_llegada numeric(18, 2) NULL,
    ca_ks_total numeric(18, 2) NULL,
    bo_cierre boolean NULL,
    bo_recibida boolean NULL,
    bo_despacho boolean NULL,
    id_usu_creado timestamp without time zone NOT NULL,
    id_usu_cierre varchar(30) NULL,
    id_usu_despacho varchar(30) NULL,
    id_usu_recibo varchar(30) NULL,
    fe_cierre timestamp without time zone NULL,
    fe_despacho timestamp without time zone NULL,
    fe_recibo timestamp without time zone NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_ruta PRIMARY KEY (id_ruta)
) ;

CREATE TABLE ruta_cartaporte(
    id_ruta_cartaporte integer NOT NULL DEFAULT nextval('ingreso_id_ingreso_seq'::regclass),
    id_ruta integer NOT NULL,
    id_cartaporte varchar(13) NOT NULL,
    id_tipo integer NOT NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_ruta_cartaporte PRIMARY KEY (id_ruta_cartaporte)
) ;

CREATE TABLE servicio(
    id_servicio integer NOT NULL DEFAULT nextval('ingreso_id_ingreso_seq'::regclass),
    nb_servicio varchar(100) NOT NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_servicio PRIMARY KEY (id_servicio)
) ;

CREATE TABLE solicitud(
    id_solicitud integer NOT NULL DEFAULT nextval('ingreso_id_ingreso_seq'::regclass),
    id_tipo_solicitud integer NOT NULL,
    id_cuenta integer NOT NULL,
    id_cliente integer NOT NULL,
    id_consignador integer NOT NULL,
    id_consignatario integer NOT NULL,
    mo_total numeric(18, 3) NOT NULL,
    id_operacion integer NULL,
    bo_aprobado boolean NULL,
    id_boveda integer NULL,
    id_rubro integer NULL,
    id_tipo varchar(50) NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_solicitud PRIMARY KEY (id_solicitud)
);




CREATE TABLE solicitud_accion(
    id_solicitud_accion integer NOT NULL DEFAULT nextval('ingreso_id_ingreso_seq'::regclass),
    id_solicitud integer NULL,
    id_tipo integer NULL,
    nu_orden integer NULL,
    id_usu_cierre varchar(50) NULL,
    fe_cierre timestamp without time zone NULL,
    id_boveda integer NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
CONSTRAINT pk_solicitud_accion PRIMARY KEY (id_solicitud_accion)
);


CREATE TABLE solicitud_cartaporte(
    id_solicitud_cartaporte integer NOT NULL DEFAULT nextval('ingreso_id_ingreso_seq'::regclass),
    id_solicitud integer NOT NULL,
    id_cartaporte varchar(13) NOT NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_solicitud_cartaporte PRIMARY KEY (id_solicitud_cartaporte )
);


CREATE TABLE solicitud_envase(
    id_solicitud_envase integer NOT NULL DEFAULT nextval('ingreso_id_ingreso_seq'::regclass),
    id_envase integer  NOT NULL,
    id_solicitud integer NOT NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_solicitud_envase PRIMARY KEY (id_solicitud_envase )
) ;


CREATE TABLE solicitud_envase_efectivo(
    id_solicitud_envase_efectivo integer NOT NULL DEFAULT nextval('ingreso_id_ingreso_seq'::regclass),
    id_envase integer NOT NULL,
    id_efectivo varchar(5) NOT NULL,
    ca_piezas integer NOT NULL,
    mo_total numeric(18, 3) NOT NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_solicitud_envase_efectivo PRIMARY KEY (	id_solicitud_envase_efectivo)
) ;

CREATE TABLE _solicitud_envases(
    Cantidad integer NOT NULL,
    id_solicitud nchar(10) NOT NULL,
    mo_total numeric(18, 3) NOT NULL
) ;

CREATE TABLE _solicitud_operacion(
    id_operacion integer NOT NULL,
    id_solicitud integer NOT NULL
) ;

CREATE TABLE _solicitud_deposito(
    id_solicitud integer NOT NULL,
    id_deposito integer NOT NULL
) ;

CREATE TABLE _solicitud_efectivo(
    id_solicitud integer NOT NULL,
    id_efectivo varchar(5) NOT NULL,
    ca_piezas integer NOT NULL,
    mo_ numeric(18, 3) NOT NULL,
 CONSTRAINT pk_solicitud_efectivo PRIMARY KEY (	id_solicitud )
 ) ;


CREATE TABLE solicitud_ruta(
    id_solicitud_ruta integer NOT NULL DEFAULT nextval('ingreso_id_ingreso_seq'::regclass),
    id_solicitud integer NOT NULL,
    id_ruta integer NOT NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_solicitud_ruta PRIMARY KEY (	id_solicitud_ruta )
) ;

CREATE TABLE solicitud_servicio(
    id_solicitud_servicio integer NOT NULL DEFAULT nextval('ingreso_id_ingreso_seq'::regclass),
    id_tipo integer NOT NULL,
    id_servicio integer NOT NULL,
    id_solicitud integer NOT NULL,
    id_operador integer NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_solicitud_servicio PRIMARY KEY (	id_solicitud_servicio )
) ;

CREATE TABLE solicitud_traspaso(
    id_solicitud_traspaso integer NOT NULL DEFAULT nextval('ingreso_id_ingreso_seq'::regclass),
    id_solicitud integer NOT NULL,
    id_transpaso integer NOT NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_solicitud_traspaso PRIMARY KEY (	id_solicitud_traspaso)
) ;

CREATE TABLE supervisor(
    id_supervisor integer NOT NULL DEFAULT nextval('ingreso_id_ingreso_seq'::regclass),
    nb_supervisor varchar(50) NULL,
    co_pass varchar(50) NOT NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_supervisor PRIMARY KEY (	id_supervisor )
);

CREATE TABLE traspaso(
    id_traspaso integer NOT NULL DEFAULT nextval('ingreso_id_ingreso_seq'::regclass),
    id_boveda_emisor integer NOT NULL,
    id_boveda_receptor integer NOT NULL,
    id_usu_emisor integer NOT NULL,
    id_usu_receptor integer NOT NULL,
    fe_emisor timestamp without time zone NOT NULL,
    fe_receptor timestamp without time zone NULL,
    bo_recibido boolean NOT NULL,
    nu_deposito integer NULL,
    id_tipo integer NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_traspaso PRIMARY KEY (id_transpaso)
);

CREATE TABLE traspaso_bloque(
    id_traspaso_bloque integer NOT NULL DEFAULT nextval('ingreso_id_ingreso_seq'::regclass),
    id_transpaso integer NOT NULL,
    id_bloque varchar(50) NOT NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_traspaso_bloque PRIMARY KEY (id_traspaso_bloque)
);


CREATE TABLE _traspaso_bolsa(
    id_transpaso integer NOT NULL,
    id_bolsa varchar(50) NOT NULL,
 CONSTRAINT pk_traspaso_bolsa PRIMARY KEY (id_transpaso)
);

CREATE TABLE traspaso_caja(
    id_traspaso_caja integer NOT NULL DEFAULT nextval('ingreso_id_ingreso_seq'::regclass),
    id_transpaso integer  NOT NULL,
    id_caja integer NOT NULL,
    id_boveda integer NOT NULL,
    id_usu_emisor varchar(30) NOT NULL,
    fe_emisor timestamp without time zone NOT NULL,
    id_usu_receptor varchar(30) NULL,
    fe_receptor timestamp without time zone NULL,
    bo_recibido boolean NOT NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_traspaso_caja PRIMARY KEY (id_transpaso )
) ;


CREATE TABLE traspaso_cartaporte(
    id_traspaso_cartaporte integer NOT NULL DEFAULT nextval('ingreso_id_ingreso_seq'::regclass),
    id_transpaso integer NOT NULL,
    id_cartaporte varchar(13) NOT NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_traspaso_cartaporte PRIMARY KEY (id_traspaso_cartaporte)
) ;

CREATE TABLE traspaso_efectivo(
    id_traspaso_efectivo integer NOT NULL DEFAULT nextval('ingreso_id_ingreso_seq'::regclass),
    id_transpaso integer NOT NULL,
    id_efectivo varchar(5) NOT NULL,
    mo_total numeric(18, 3) NOT NULL,
    ca_piezas integer NOT NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_traspaso_efectivo PRIMARY KEY (id_traspaso_efectivo)
) ;

CREATE TABLE traspaso_efectivo_caja(
    id_traspaso_efectivo_caja integer NOT NULL DEFAULT nextval('ingreso_id_ingreso_seq'::regclass),
    id_transpaso integer NOT NULL,
    id_efectivo varchar(5) NOT NULL,
    mo_total numeric(18, 3) NOT NULL,
    ca_piezas integer NOT NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_traspaso_efectivo_caja PRIMARY KEY (id_traspaso_efectivo_caja )
) ;