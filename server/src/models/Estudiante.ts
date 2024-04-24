import { Model, DataTypes } from 'sequelize';
import sequelize from '../db';
import Horario from './Horario';
import Carrera from './Carrera';

class Estudiante extends Model {

    public n_control!: string;
    public nombre!: string;
    public apellido_paterno!: string;
    public apellido_materno!: string;
    public carrera!: string;
    public horario!: string;
}

Estudiante.init(
    {
        n_control: {
            type: DataTypes.CHAR(8),
            allowNull: false,
            primaryKey: true
        },
        nombre: {
            type: DataTypes.STRING(50),
            allowNull: false
        },
        apellido_paterno: {
            type: DataTypes.STRING(50),
            allowNull: false
        },
        apellido_materno: {
            type: DataTypes.STRING(50),
            allowNull: false
        },
        carrera: {
            type: DataTypes.CHAR(3),
            allowNull: false
        },
        horario: {
            type: DataTypes.CHAR(5),
            allowNull: false
        }
    },
    {
        tableName: 'estudiante',
        sequelize: sequelize
    }
);


Estudiante.hasOne(Horario, {
    sourceKey: 'horario',
    foreignKey: 'id'
})

Estudiante.hasOne(Carrera, {
    sourceKey: 'carrera',
    foreignKey: 'carrera'
})