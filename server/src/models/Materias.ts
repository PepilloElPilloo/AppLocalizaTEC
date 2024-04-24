import { Model, DataTypes } from "sequelize";
import sequelize from "../db";

class Materia extends Model {
	public materia!: string;
	public nivel_escolar!: string | null;
	public tipo_materia!: number | null;
	public clave_area!: string | null;
	public nombre_completo_materia!: string;
	public nombre_abreviado_materia!: string;
	public ntemas!: number | null;
	public created_user_id!: number | null;
	public updated_user_id!: number | null;
	public created_at!: Date | null;
	public updated_at!: Date | null;

	public readonly createdAt!: Date;
	public readonly updatedAt!: Date;
}

Materia.init(
	{
		materia: {
			type: DataTypes.CHAR(7),
			allowNull: false,
			primaryKey: true,
		},
		nivel_escolar: {
			type: DataTypes.CHAR(1),
			allowNull: true,
		},
		tipo_materia: {
			type: DataTypes.INTEGER,
			allowNull: true,
		},
		clave_area: {
			type: DataTypes.CHAR(6),
			allowNull: true,
		},
		nombre_completo_materia: {
			type: DataTypes.STRING(100),
			allowNull: false,
		},
		nombre_abreviado_materia: {
			type: DataTypes.STRING(100),
			allowNull: false,
		},
		ntemas: {
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
		tableName: "materias", // nombre de la tabla en la base de datos
		timestamps: true, // habilita createdAt y updatedAt
		underscored: true, // convierte los nombres de las columnas a snake_case
		modelName: "Materia", // nombre del modelo en singular
	}
);

export default Materia;
