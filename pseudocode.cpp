#include <libraryheaders>

int main()
{
	createWindow(title, width, height);
	createOpenGLContext(settings);

	while (windowOpen)
	{
		while (event = newEvent())
		{
			handleEvent(event);
		}

		updateScene();

		drawGraphics();
		presentGraphics();
	}

	return 0;
}

