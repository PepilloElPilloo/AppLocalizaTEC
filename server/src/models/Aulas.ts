import { Model, DataTypes } from "sequelize";
import db from "../db";

class Aula extends Model {
	public aula!: string;
	public ubicacion!: string | null;
	public capacidad_aula!: number;
	public observaciones!: string | null;
	public permite_cruce!: string | null;
	public estatus!: string | null;
	public id!: number;
	public area_id!: number | null;
	public created_user_id!: number | null;
	public updated_user_id!: number | null;
	public created_at!: Date | null;
	public updated_at!: Date | null;

	public readonly createdAt!: Date;
	public readonly updatedAt!: Date;
}

Aula.init(
	{
		aula: {
			type: DataTypes.CHAR(6),
			allowNull: false,
			primaryKey: true,
		},
		ubicacion: {
			type: DataTypes.STRING(100),
			allowNull: true,
		},
		capacidad_aula: {
			type: DataTypes.INTEGER,
			allowNull: false,
		},
		observaciones: {
			type: DataTypes.STRING(255),
			allowNull: true,
		},
		permite_cruce: {
			type: DataTypes.CHAR(1),
			allowNull: true,
		},
		estatus: {
			type: DataTypes.CHAR(1),
			allowNull: true,
		},
		id: {
			type: DataTypes.INTEGER,
			autoIncrement: true,
			primaryKey: true,
		},
		area_id: {
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
		sequelize: db, // instancia de Sequelize
		tableName: "aulas", // nombre de la tabla en la base de datos
		timestamps: true, // habilita createdAt y updatedAt
		underscored: true, // convierte los nombres de las columnas a snake_case
		modelName: "Aula", // nombre del modelo en singular
	}
);

export default Aula;
