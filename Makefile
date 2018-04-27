CC = clang++

BASE_FLAGS = -std=c++11 -Wall

# INCLUDE BASE DIRECTORY AND BOOST DIRECTORY FOR HEADERS
CFLAGS = -I/usr/X11/include `pkg-config --cflags glfw3 glew`
GLMFLAG = -I/usr/local/Cellar/glm/0.9.7.4/include

# INCLUDE BASE DIRECTORY AND BOOST DIRECTORY FOR LIB FILES
LIBFLAGS = -L/usr/X11/lib/ `pkg-config --static --libs glfw3 glew`

# SPECIFIY LINK OPTIONS
LDFLAGS = -framework OpenGL

# FINAL FLAGS -- TO BE USED THROUGHOUT
FLAGS = $(BASE_FLAGS) $(CFLAGS) $(LIBFLAGS) $(LDFLAGS)

# NOTE FOR BOOST -- YOU ONLY NEED TO INCLUDE THE PATH BECAUSE IT ONLY INSTALLS HEADER FILES
main: \
	window \
	triangle \
	triangle_uniforms \
	triangle_color \
	triangle_element_buffers \
	textured_quad \
	textured_quad_mipmap \
	textured_quad_mix \
	transformations \
	transformations_3d \
	depth \
	stencils \
	framebuffer

clean:
	rm *.out

window: window.cpp
	$(CC) $(FLAGS) -o window.out window.cpp

triangle: triangle.cpp
	$(CC) $(FLAGS) -o triangle.out triangle.cpp

triangle_uniforms: triangle_uniforms.cpp
	$(CC) $(FLAGS) -o triangle_uniforms.out triangle_uniforms.cpp

triangle_color: triangle_color.cpp
	$(CC) $(FLAGS) -o triangle_color.out triangle_color.cpp

triangle_element_buffers: triangle_element_buffers.cpp
	$(CC) $(FLAGS) -o triangle_element_buffers.out triangle_element_buffers.cpp

textured_quad: textured_quad.cpp
	$(CC) $(FLAGS) -o textured_quad.out textured_quad.cpp

textured_quad_mipmap: textured_quad_mipmap.cpp
	$(CC) $(FLAGS) -o textured_quad_mipmap.out textured_quad_mipmap.cpp

textured_quad_mix: textured_quad_mix.cpp
	$(CC) $(FLAGS) -o textured_quad_mix.out textured_quad_mix.cpp

transformations: transformations.cpp
	$(CC) $(FLAGS) $(GLMFLAG) -o transformations.out transformations.cpp

transformations_3d: transformations_3d.cpp
	$(CC) $(FLAGS) $(GLMFLAG) -o transformations_3d.out transformations_3d.cpp

depth: depth.cpp
	$(CC) $(FLAGS) $(GLMFLAG) -o depth.out depth.cpp

stencils: stencils.cpp
	$(CC) $(FLAGS) $(GLMFLAG) -o stencils.out stencils.cpp

framebuffer: framebuffer.cpp
	$(CC) $(FLAGS) $(GLMFLAG) -o framebuffer.out framebuffer.cpp
