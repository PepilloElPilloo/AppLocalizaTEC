import { Model, DataTypes } from "sequelize";
import sequelize from "../db";

class Carrera extends Model {
	public carrera!: string;
	public reticula!: number;
	public nivel_escolar!: string;
	public clave_oficial!: string;
	public nombre_carrera!: string;
	public nombre_reducido!: string;
	public siglas!: string;
	public carga_maxima!: number;
	public carga_minima!: number;
	public fecha_inicio!: Date;
	public fecha_termino!: Date | null;
	public clave_cosnet!: string | null;
	public creditos_totales!: number | null;
	public created_user_id!: number | null;
	public updated_user_id!: number | null;
	public created_at!: Date | null;
	public updated_at!: Date | null;

	public readonly createdAt!: Date;
	public readonly updatedAt!: Date;
}

Carrera.init(
	{
		carrera: {
			type: DataTypes.CHAR(3),
			allowNull: false,
			primaryKey: true,
		},
		reticula: {
			type: DataTypes.INTEGER,
			allowNull: false,
			primaryKey: true,
		},
		nivel_escolar: {
			type: DataTypes.CHAR(1),
			allowNull: false,
		},
		clave_oficial: {
			type: DataTypes.CHAR(20),
			allowNull: false,
		},
		nombre_carrera: {
			type: DataTypes.STRING(82),
			allowNull: false,
		},
		nombre_reducido: {
			type: DataTypes.STRING(30),
			allowNull: false,
		},
		siglas: {
			type: DataTypes.STRING(10),
			allowNull: false,
		},
		carga_maxima: {
			type: DataTypes.INTEGER,
			allowNull: false,
		},
		carga_minima: {
			type: DataTypes.INTEGER,
			allowNull: false,
		},
		fecha_inicio: {
			type: DataTypes.DATEONLY,
			allowNull: false,
		},
		fecha_termino: {
			type: DataTypes.DATEONLY,
			allowNull: true,
		},
		clave_cosnet: {
			type: DataTypes.CHAR(2),
			allowNull: true,
		},
		creditos_totales: {
			type: DataTypes.INTEGER,
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
		tableName: "carreras", // nombre de la tabla en la base de datos
		timestamps: true, // habilita createdAt y updatedAt
		underscored: true, // convierte los nombres de las columnas a snake_case
		modelName: "Carrera", // nombre del modelo en singular
	}
);

export default Carrera;
