#include <iostream>
#include <GL/glew.h>
#include <GLFW/glfw3.h>

int main()
{
	// -------------------------------- INIT ------------------------------- //

	// Init GLFW
	if (glfwInit() != GL_TRUE)
	{
		std::cerr << "Failed to initialize GLFW!" << std::endl;
		return -1;
	}

	glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
	glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 2);
	glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE);
	glfwWindowHint(GLFW_OPENGL_FORWARD_COMPAT, GL_TRUE);

	glfwWindowHint(GLFW_RESIZABLE, GL_FALSE);

	GLFWwindow* window = glfwCreateWindow(800, 600, "OpenGL", nullptr, nullptr); // Windowed
	glfwMakeContextCurrent(window);

	// Init GLEW
	glewExperimental = GL_TRUE;
	if (glewInit() != GLEW_OK)
	{
		std::cerr << "Failed to initialize GLEW!" << std::endl;
		return -1;
	}

	// ---------------------------- RENDERING ------------------------------ //

	while(!glfwWindowShouldClose(window))
	{
		// Clear the screen to black
		glClearColor(0.0f, 0.0f, 0.0f, 1.0f);
		glClear(GL_COLOR_BUFFER_BIT);

		// Swap buffers and poll window events
		glfwSwapBuffers(window);
		glfwPollEvents();
	}

	// ---------------------------- TERMINATE ----------------------------- //

	// Terminate GLFW
	glfwTerminate();

	return 0;
}
