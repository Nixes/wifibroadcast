LDFLAGS=-lrt -lpcap -O2
CPPFLAGS=-Wall -O2

all: rx tx rx_status_test



%.o: %.c
	gcc -c -o $@ $< $(CPPFLAGS)


rx: rx.o lib.o radiotap.o fec.o
	gcc -o ./scripts/$@ $^ $(LDFLAGS)


tx: tx.o lib.o fec.o
	gcc -o ./scripts/$@ $^ $(LDFLAGS)


rx_status_test: rx_status_test.o
	gcc -o ./scripts/$@ $^ $(LDFLAGS)

clean:
	rm -f rx tx *.o
	rm -f ./scripts/rx
	rm -f ./scripts/tx
