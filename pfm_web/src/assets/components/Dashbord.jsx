import React from 'react';
import './Dashboard.css'; // Estilo CSS para personalizar el diseño
import logo from '../img/LogoPFCIniciales_.png'; // Importa la imagen
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faHome, faChartBar, faFile, faCog, faSignOutAlt ,faChevronRight,faBriefcase, faUsers, faShop, faClock, faGear,  faRightFromBracket,faSearch, faPen, faEye, faTrash, faFilePen} from '@fortawesome/free-solid-svg-icons';

function Dashboard({user}) {
  return (
    <div className="dashboard-container">
      <div className="sidebar">
      <div className='contenedor_img'>
          <img src={logo} alt="PFC" />
        </div>
        {/* Opciones en el lado izquierdo */}
        <ul>
            <li> 
                <div className='opcion' id='op_seleccionada'>
                    <FontAwesomeIcon icon={faBriefcase}/> 
                    <p>Gerencia</p> 
                    <FontAwesomeIcon icon={faChevronRight}/> 
                </div>
            </li>
            <li> 
                <div className='opcion'>
                    <FontAwesomeIcon icon={faShop}/> 
                    <p>Comercial</p> 
                    <FontAwesomeIcon icon={faChevronRight}/> 
                </div>
            </li>
            <li> 
                <div className='opcion'>
                    <FontAwesomeIcon icon={faUsers}/> 
                    <p>Recursos Humanos</p> 
                    <FontAwesomeIcon icon={faChevronRight}/> 
                </div>
            </li>
            <li> 
                <div className='opcion'>
                    <FontAwesomeIcon icon={faClock}/> 
                    <p>Historial</p> 
                    <FontAwesomeIcon icon={faChevronRight}/> 
                </div>
            </li>
          {/* Agrega más opciones según tus necesidades */}
        </ul>
        {/* Opciones de ajustes y cerrar sesión en la parte inferior */}
        <div className="bottom-options">
        <div className='opcion'>
                    <p>Ajustes</p> 
                    <FontAwesomeIcon icon={faGear}/> 
                </div>
                <div className='opcion'>
                    <p>Cerrar Sesion</p> 
                    <FontAwesomeIcon icon={faRightFromBracket}/> 
                </div>
        </div>
      </div>
      <div className="content">
        {/* Barra superior con el logo */}
        <div className="topbar">
          <div className="search-box">
            <div className="user-info">
              <img src={user.imageUrl} alt="Avatar del usuario" className="user-avatar" />
              <span className="user-name">{user.name}</span>
            </div>
            <input
              type="text"
              placeholder="Buscar..."
              className="search-input"
            />
            <FontAwesomeIcon icon={faSearch} className="search-icon" />
          </div>
        </div>
        {/* Tabla de datos con opciones de ver, eliminar y modificar */}
        <div className="table-container">
          <h2>Título de la Tabla</h2>
          <table>
            <thead>
              <tr>
                <th>Columna1</th>
                <th>Columna2</th>
                <th>Columna3</th>
                <th>Opciones</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>Dato1</td>
                <td>Dato2</td>
                <td>Dato3</td>
                <td className="opciones-contenedor">
                  <button className='btn btn-ver'> <FontAwesomeIcon icon={faEye}/> </button>
                  <button className='btn btn-modificar'> <FontAwesomeIcon icon={faPen}/> </button>
                  <button className='btn btn-eliminar'> <FontAwesomeIcon icon={faTrash}/> </button>
                </td>
              </tr>
              {/* Repite esta estructura para cada registro en la tabla */}
            </tbody>
          </table>
        </div>
        {/* Gráfica */}
        <div className="chart">
          {/* Agrega tu gráfica aquí */}
        </div>
      </div>
    </div>
  );
}

export default Dashboard;
