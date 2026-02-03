Feature: Como usuario quiero probar el funcionamiento de la api reqres realizando operaciones CRUD para gestionar usuarios.

  Background:
    # Configuración común para todos los escenarios
    * url 'https://reqres.in/api'
    * header x-api-key = 'reqres-free-v1'
    * header Content-Type = 'application/json; charset=UTF-8'

    @ObtenerUsuarioExistente
    Scenario: Obtener un usuario existente
        * path 'users/2'
        * method GET
        * status 200
        * match response.data.id == 2

    @CrearUsuario
    Scenario: Crear un nuevo usuario
      * path 'users'
      * request
        """
        {
          "name": "misty",
          "job": "leader"
        }
        """
      * method POST
      * status 201
      * match response.name == 'misty'

    @ActualizarUsuario
    Scenario: Actualizar un usuario existente
      * path 'users/2'
      * request
          """
          {
            "name": "michael",
            "job": "demon slayer"
          }
          """
      * method PUT
      * status 200
      * match response.name == 'michael'
      * print response

    @EliminarUsuario
    Scenario: Eliminar un usuario existente
      * path 'users/2'
      * method DELETE
      * status 204
