import React, { useEffect, useState } from 'react';
import './Login.css'
import logo from '../img/LogoPFC.png'; // Importa la imagen
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import {faG} from '@fortawesome/free-solid-svg-icons';

import { gapi } from 'gapi-script';
import GoogleLogin from 'react-google-login';



const Login = () => {
  const clientID= "547404189063-leb79ce7ps5bo93lrmf1hsqhln2aq81m.apps.googleusercontent.com"
  const [user, setUser] = useState({});
  const [loggeIn, setLoggetInfo] = useState(false); 

  const onSuccess = (response) => {
    setUser(response.profileObj);
    console.log(user)
  }
  const onFailure = (response) => {
    console.log("Something went wrong");
  }
  const handleLogout  = () => {
    setUser({}); 
  }
  useEffect(()=>{
    const start = ()=>{
      gapi.auth2.init({
        clienteid: clienteID
      })
      gapi.load("client:auth2", start)
    }

  },[])
  return (
    <div className="login-container">
      <div className="banner">
        <h1>Procesos de Manera Eficiente</h1>
        <p>Una solución integral de gestión y seguimiento de procesos diseñada <br/>para simplificar y optimizar tus operaciones.</p>
      </div>
      <div className="form">
        <div className='contenedor_img'>
          <img src={logo} alt="PFC" />
        </div>
        <div className='contenedor_bienvenida'>
          <h3>BIENVENIDO</h3>
          <p>Ingrese sus credenciales</p>
        </div>
        <form>
          <input type="text" placeholder="Usuario" />
          <input type="password" placeholder="Contraseña" />
          <button type="submit">Iniciar Sesión</button>

            <GoogleLogin className='btn-google'
              clientId={clientID}
              onSuccess={onSuccess}
              onFailure={onFailure}
              buttonText="Continue  with Google"
              cookiePolicy={"single_host_origin"}
          />

          <div className='opciones'>
            <span>Registrarse |</span> <span> Ayuda</span> 
          </div>
        </form>
      </div>
    </div>
  );
}

export default Login;
