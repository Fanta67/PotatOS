#pragma once

typedef short color;

struct Event {
	int type;
	int param1;
	int param2;
};

#define BLOCKING 1
#define NOT_BLOCKING 0

// All draw methods will draw as much as they can, i.e. will not return an error if rect extends out of window

namespace Windows {
	// Drawing

	// Gets height of display (screen)
	int getDisplayHeight();

	// Gets width of display (screen)
	int getDisplayWidth();

	// Returns true if any of the window is visible
	int isDisplayed(int windowID);

	// Does the window have user focus
	int isFocused(int windowID);

	// Gets current width of window
	int getWidth(int windowID);

	// Gets current height of window
	int getHeight(int windowID);

	/* 
		Creates a window of specified size with the top left corner at x, y. 
		The spawn point may be ignored by the windowing system.
	*/
	int createWindow(int x, int y, int width, int height, char* windowTitle);

	// Closes the window for the given ID, window must belong to calling process
	int closeWindow(int windowID);

	// Creates a solid rectangle with given color 
	int fillRect(int x, int y, int width, int height, color color);

	// Draws an outlined rectangle with given borderSize and color
	int drawRect(int x, int y, int width, int height, int borderSize, color color);

	// Copies specified buffer into frame
	int drawBuffer(int x, int y, int width, int height, color* buffer);

	// Draws line
	int drawLine(int x1, int y1, int x2, int y2, int borderSize, color color);

	// Draws text, returns number of characters that fit on line
	int drawText(int x, int y, int length, char* str, color color);

	int drawEllipse(int x, int y, int width, int height, int borderSize, color color);

	int fillEllipse(int x, int y, int width, int height, color color);

	// Loads and decodes an image given by path and copies it at the given coordinates
	int drawImage(int x, int y, char* imagePath);

	// Updates whole frame with given byte buffer, must be height/width of window
	int sendFrame(byte* buffer);

	// Inverts colors of given window
	int toggleNegative(int windowID);

	/*  Tells the windowing system that drawing has completed and it can flush data to GPU
		This must be called to reflect changes/drawing
	*/
	int swapBuffers();
	
	// Messaging / input

	/*  Retrieves keyboard/mouse events and loads the data into the passed in struct
		Will return 0 if NOT_BLOCKING and queue is empty, otherwise will block
	*/
	int popMessage(Event* event, int windowID, int isBlocking);
}




