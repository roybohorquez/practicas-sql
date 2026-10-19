import mysql.connector
import sys

def conectar():
    try:
        # Configuración por defecto para XAMPP / HeidiSQL
        conexion = mysql.connector.connect(
            host="localhost",
            user="root",
            password="",  
            database="colegio"
        )
        return conexion
    except mysql.connector.Error as error:
        print(f"\n❌ Error de conexión: {error}")
        return None

def mostrar_menu():
    print("\n" + "="*30)
    print("      SISTEMA COLEGIO")
    print("="*30)
    print("1. Listar todos los alumnos")
    print("2. Ver promedios de alumnos")
    print("3. Salir")
    print("="*30)

def listar_alumnos():
    conexion = conectar()
    if conexion:
        cursor = conexion.cursor()
        cursor.execute("SELECT * FROM alumnos;")
        alumnos = cursor.fetchall()
        
        print("\n--- LISTA DE ALUMNOS ---")
        for alumno in alumnos:
            print(f"ID: {alumno[0]} | Nombre: {alumno[1]} {alumno[2]} | Edad: {alumno[3]}")
            
        cursor.close()
        conexion.close()

def ver_promedios():
    conexion = conectar()
    if conexion:
        cursor = conexion.cursor()
        query = """
        SELECT 
            alumnos.nombre AS alumno_nombre,
            cursos.nombre_curso AS curso,
            calificaciones.nota_parcial,
            calificaciones.nota_final,
            ROUND((calificaciones.nota_parcial + calificaciones.nota_final) / 2, 2) AS promedio_final
        FROM calificaciones
        INNER JOIN inscripciones ON calificaciones.inscripcion_id = inscripciones.id
        INNER JOIN alumnos ON inscripciones.alumno_id = alumnos.id
        INNER JOIN cursos ON inscripciones.curso_id = cursos.id;
        """
        cursor.execute(query)
        reportes = cursor.fetchall()
        
        print("\n--- REPORTES DE PROMEDIOS ---")
        for fila in reportes:
            print(f"Alumno: {fila[0]} | Curso: {fila[1]} | Parcial: {fila[2]} | Final: {fila[3]} | Promedio: {fila[4]}")
            
        cursor.close()
        conexion.close()

# Bucle principal del programa
while True:
    mostrar_menu()
    opcion = input("Selecciona una opción (1-3): ")
    
    if opcion == "1":
        listar_alumnos()
    elif opcion == "2":
        ver_promedios()
    elif opcion == "3":
        print("\n👋 ¡Hasta luego!")
        sys.exit()
    else:
        print("\n⚠️ Opción no válida. Intenta de nuevo.")