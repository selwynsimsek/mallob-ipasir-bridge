
all: libipasirmallob.a libipasirmallob.so

mallob_ipasir.o: src/mallob_ipasir.cpp src/mallob_ipasir.hpp src/timer.cpp
	g++ -fPIC -c -std=c++17 -O3 src/mallob_ipasir.cpp src/timer.cpp -Isrc

libipasirmallob.a: mallob_ipasir.o
	ar rvs libipasirmallob.a mallob_ipasir.o timer.o

libipasirmallob.so: mallob_ipasir.o
	g++ -shared mallob_ipasir.o timer.o -o libipasirmallob.so

clean: 
	rm -rf *.o *.so *.a
