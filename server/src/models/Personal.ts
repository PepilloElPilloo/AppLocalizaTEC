import { Model, DataTypes } from "sequelize";
import sequelize from "../db"; // Debes importar la instancia de Sequelize aquí

class Personal extends Model {
	public rfc!: string;
	public clave_centro_seit!: string | null;
	public clave_area!: string | null;
	public curp_empleado!: string | null;
	public no_tarjeta!: number | null;
	public apellidos_empleado!: string | null;
	public nombre_empleado!: string | null;
	public horas_nombramiento!: number | null;
	public nombramiento!: string;
	public clases!: string | null;
	public ingreso_rama!: string | null;
	public inicio_gobierno!: string | null;
	public inicio_sep!: string | null;
	public inicio_plantel!: string | null;
	public domicilio_empleado!: string | null;
	public colonia_empleado!: string | null;
	public codigo_postal_empleado!: number | null;
	public localidad!: string | null;
	public telefono_empleado!: string | null;
	public sexo_empleado!: string | null;
	public estado_civil!: string | null;
	public fecha_nacimiento!: Date | null;
	public lugar_nacimiento!: number | null;
	public institucion_egreso!: string | null;
	public nivel_estudios!: string | null;
	public grado_maximo_estudios!: string | null;
	public estudios!: string | null;
	public fecha_termino_estudios!: Date | null;
	public fecha_titulacion!: Date | null;
	public cedula_profesional!: string | null;
	public especializacion!: string | null;
	public idiomas_domina!: string | null;
	public status_empleado!: string | null;
	public foto!: any | null;
	public firma!: any | null;
	public correo_electronico!: string | null;
	public padre!: string | null;
	public madre!: string | null;
	public conyuge!: string | null;
	public hijos!: string | null;
	public num_acta!: number | null;
	public num_libro!: number | null;
	public num_foja!: number | null;
	public num_ano!: number | null;
	public num_cartilla_smn!: string | null;
	public ano_clase!: number | null;
	public pigmentacion!: string | null;
	public pelo!: string | null;
	public frente!: string | null;
	public cejas!: string | null;
	public ojos!: string | null;
	public nariz!: string | null;
	public boca!: string | null;
	public estaturamts!: number | null;
	public pesokg!: number | null;
	public senas_visibles!: string | null;
	public pais!: string | null;
	public pasaporte!: string | null;
	public fm!: string | null;
	public inicio_vigencia!: Date | null;
	public termino_vigencia!: Date | null;
	public entrada_salida!: string | null;
	public observaciones_empleado!: string | null;
	public area_academica!: string | null;
	public tipo_personal!: string | null;
	public tipo_control!: string | null;
	public emergencia!: string | null;
	public entidad_federativa!: number | null;
	public situacion_estudios!: string | null;
	public sybfi2_1!: string | null;
	public correo_electronico_personal!: string | null;
	public created_user_id!: number | null;
	public updated_user_id!: number | null;
	public created_at!: Date | null;
	public updated_at!: Date | null;

	public readonly createdAt!: Date;
	public readonly updatedAt!: Date;
}

Personal.init(
	{
		rfc: {
			type: DataTypes.CHAR(13),
			allowNull: false,
			primaryKey: true,
		},
		clave_centro_seit: {
			type: DataTypes.CHAR(10),
			allowNull: true,
		},
		clave_area: {
			type: DataTypes.CHAR(6),
			allowNull: true,
		},
		curp_empleado: {
			type: DataTypes.CHAR(18),
			allowNull: true,
		},
		no_tarjeta: {
			type: DataTypes.INTEGER,
			allowNull: true,
		},
		apellidos_empleado: {
			type: DataTypes.STRING(45),
			allowNull: true,
		},
		nombre_empleado: {
			type: DataTypes.STRING(35),
			allowNull: true,
		},
		horas_nombramiento: {
			type: DataTypes.INTEGER,
			allowNull: true,
		},
		nombramiento: {
			type: DataTypes.CHAR(1),
			allowNull: false,
		},
		clases: {
			type: DataTypes.CHAR(1),
			allowNull: true,
		},
		ingreso_rama: {
			type: DataTypes.CHAR(6),
			allowNull: true,
		},
		inicio_gobierno: {
			type: DataTypes.CHAR(6),
			allowNull: true,
		},
		inicio_sep: {
			type: DataTypes.CHAR(6),
			allowNull: true,
		},
		inicio_plantel: {
			type: DataTypes.CHAR(6),
			allowNull: true,
		},
		domicilio_empleado: {
			type: DataTypes.STRING(60),
			allowNull: true,
		},
		colonia_empleado: {
			type: DataTypes.STRING(40),
			allowNull: true,
		},
		codigo_postal_empleado: {
			type: DataTypes.INTEGER,
			allowNull: true,
		},
		localidad: {
			type: DataTypes.STRING(30),
			allowNull: true,
		},
		telefono_empleado: {
			type: DataTypes.STRING(30),
			allowNull: true,
		},
		sexo_empleado: {
			type: DataTypes.CHAR(1),
			allowNull: true,
		},
		estado_civil: {
			type: DataTypes.CHAR(1),
			allowNull: true,
		},
		fecha_nacimiento: {
			type: DataTypes.DATE,
			allowNull: true,
		},
		lugar_nacimiento: {
			type: DataTypes.INTEGER,
			allowNull: true,
		},
		institucion_egreso: {
			type: DataTypes.STRING(50),
			allowNull: true,
		},
		nivel_estudios: {
			type: DataTypes.CHAR(1),
			allowNull: true,
		},
		grado_maximo_estudios: {
			type: DataTypes.CHAR(1),
			allowNull: true,
		},
		estudios: {
			type: DataTypes.STRING(250),
			allowNull: true,
		},
		fecha_termino_estudios: {
			type: DataTypes.DATE,
			allowNull: true,
		},
		fecha_titulacion: {
			type: DataTypes.DATE,
			allowNull: true,
		},
		cedula_profesional: {
			type: DataTypes.CHAR(15),
			allowNull: true,
		},
		especializacion: {
			type: DataTypes.STRING(50),
			allowNull: true,
		},
		idiomas_domina: {
			type: DataTypes.STRING(60),
			allowNull: true,
		},
		status_empleado: {
			type: DataTypes.CHAR(2),
			allowNull: true,
		},
		foto: {
			type: DataTypes.JSON,
			allowNull: true,
		},
		firma: {
			type: DataTypes.JSON,
			allowNull: true,
		},
		correo_electronico: {
			type: DataTypes.STRING(60),
			allowNull: true,
		},
		padre: {
			type: DataTypes.STRING(50),
			allowNull: true,
		},
		madre: {
			type: DataTypes.STRING(50),
			allowNull: true,
		},
		conyuge: {
			type: DataTypes.STRING(50),
			allowNull: true,
		},
		hijos: {
			type: DataTypes.STRING(100),
			allowNull: true,
		},
		num_acta: {
			type: DataTypes.INTEGER,
			allowNull: true,
		},
		num_libro: {
			type: DataTypes.INTEGER,
			allowNull: true,
		},
		num_foja: {
			type: DataTypes.INTEGER,
			allowNull: true,
		},
		num_ano: {
			type: DataTypes.INTEGER,
			allowNull: true,
		},
		num_cartilla_smn: {
			type: DataTypes.CHAR(15),
			allowNull: true,
		},
		ano_clase: {
			type: DataTypes.INTEGER,
			allowNull: true,
		},
		pigmentacion: {
			type: DataTypes.CHAR(1),
			allowNull: true,
		},
		pelo: {
			type: DataTypes.CHAR(1),
			allowNull: true,
		},
		frente: {
			type: DataTypes.CHAR(1),
			allowNull: true,
		},
		cejas: {
			type: DataTypes.CHAR(1),
			allowNull: true,
		},
		ojos: {
			type: DataTypes.CHAR(1),
			allowNull: true,
		},
		nariz: {
			type: DataTypes.CHAR(1),
			allowNull: true,
		},
		boca: {
			type: DataTypes.CHAR(1),
			allowNull: true,
		},
		estaturamts: {
			type: DataTypes.INTEGER,
			allowNull: true,
		},
		pesokg: {
			type: DataTypes.INTEGER,
			allowNull: true,
		},
		senas_visibles: {
			type: DataTypes.STRING(255),
			allowNull: true,
		},
		pais: {
			type: DataTypes.STRING(30),
			allowNull: true,
		},
		pasaporte: {
			type: DataTypes.STRING(40),
			allowNull: true,
		},
		fm: {
			type: DataTypes.STRING(30),
			allowNull: true,
		},
		inicio_vigencia: {
			type: DataTypes.DATE,
			allowNull: true,
		},
		termino_vigencia: {
			type: DataTypes.DATE,
			allowNull: true,
		},
		entrada_salida: {
			type: DataTypes.CHAR(1),
			allowNull: true,
		},
		observaciones_empleado: {
			type: DataTypes.STRING(254),
			allowNull: true,
		},
		area_academica: {
			type: DataTypes.CHAR(6),
			allowNull: true,
		},
		tipo_personal: {
			type: DataTypes.CHAR(1),
			allowNull: true,
		},
		tipo_control: {
			type: DataTypes.CHAR(1),
			allowNull: true,
		},
		emergencia: {
			type: DataTypes.STRING(250),
			allowNull: true,
		},
		entidad_federativa: {
			type: DataTypes.INTEGER,
			allowNull: true,
		},
		situacion_estudios: {
			type: DataTypes.STRING(5),
			allowNull: true,
		},
		sybfi2_1: {
			type: DataTypes.STRING(81),
			allowNull: true,
		},
		correo_electronico_personal: {
			type: DataTypes.STRING(60),
			allowNull: true,
		},
		created_user_id: {
			type: DataTypes.INTEGER,
			allowNull: true,
		},
		updated_user_id: {
			type: DataTypes.INTEGER,
			allowNull: true,
		},
		created_at: {
			type: DataTypes.DATE,
			allowNull: true,
		},
		updated_at: {
			type: DataTypes.DATE,
			allowNull: true,
		},
	},
	{
		sequelize, // instancia de Sequelize
		tableName: "personal", // nombre de la tabla en la base de datos
		timestamps: true, // habilita createdAt y updatedAt
		underscored: true, // convierte los nombres de las columnas a snake_case
		modelName: "Personal", // nombre del modelo en singular
	}
);

export default Personal;
