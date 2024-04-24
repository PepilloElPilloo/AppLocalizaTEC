import { Model, DataTypes } from "sequelize";
import db from "../db";

class Horario extends Model {
	public id!: number;
	public periodo!: string | null;
	public rfc!: string | null;
	public tipo_horario!: string | null;
	public dia_semana!: number | null;
	public hora_inicial!: Date;
	public hora_final!: Date | null;
	public materia!: string | null;
	public grupo!: string | null;
	public aula!: string | null;
	public actividad!: string | null;
	public consecutivo!: number | null;
	public vigencia_inicio!: Date | null;
	public vigencia_fin!: Date | null;
	public consecutivo_admvo!: number | null;
	public tipo_personal!: string | null;
	public clave_puesto!: number | null;
	public created_user_id!: number | null;
	public updated_user_id!: number | null;
	public created_at!: Date | null;
	public updated_at!: Date | null;

	public readonly createdAt!: Date;
	public readonly updatedAt!: Date;
}


Horario.init(
	{
		id: {
			type: DataTypes.INTEGER,
			autoIncrement: true,
			primaryKey: true,
			unique: true,
		},
		periodo: {
			type: DataTypes.CHAR(5),
			allowNull: true,
		},
		rfc: { // this suposed to be a Reference Key, but the developer left it as RFC.
			type: DataTypes.CHAR(13),
			allowNull: true,
		},
		tipo_horario: {
			type: DataTypes.CHAR(1),
			allowNull: true,
		},
		dia_semana: {
			type: DataTypes.INTEGER,
			allowNull: true,
		},
		hora_inicial: {
			type: DataTypes.DATE,
			allowNull: false,
		},
		hora_final: {
			type: DataTypes.DATE,
			allowNull: true,
		},
		materia: {
			type: DataTypes.CHAR(7),
			allowNull: true,
		},
		grupo: {
			type: DataTypes.CHAR(3),
			allowNull: true,
		},
		aula: {
			type: DataTypes.CHAR(6),
			allowNull: true,
		},
		actividad: {
			type: DataTypes.CHAR(10),
			allowNull: true,
		},
		consecutivo: {
			type: DataTypes.INTEGER,
			allowNull: true,
		},
		vigencia_inicio: {
			type: DataTypes.DATE,
			allowNull: true,
		},
		vigencia_fin: {
			type: DataTypes.DATE,
			allowNull: true,
		},
		consecutivo_admvo: {
			type: DataTypes.INTEGER,
			allowNull: true,
		},
		tipo_personal: {
			type: DataTypes.CHAR(1),
			allowNull: true,
		},
		clave_puesto: {
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
		tableName: "horarios", // nombre de la tabla en la base de datos
		timestamps: true, // habilita createdAt y updatedAt
		underscored: true, // convierte los nombres de las columnas a snake_case
		modelName: "Horario", // nombre del modelo en singular
	}
);

/* 
periodo 20203	
rfc RIBA8511031V7	
tipo D	
dia 6	
hora_inicia 1900-01-01 16:00:00.000	
hora fin 1900-01-01 17:00:00.000	
materia TH8    	
grupo B
aula YC8   						
actividad B	
consecutivo_admvo 166612	
tipo_personal 562 

20203	
REFG840802EP0	
A	
2	
1900-01-01 08:00:00.000	
1900-01-01 12:00:00.000			      					
1		
166746	
134		
*/

export default Horario;