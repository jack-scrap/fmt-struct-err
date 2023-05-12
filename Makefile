CC=gcc

TARGET=libfmt_struct_err.so

BUILDDIR=build

PREFIX=/usr/local
LIBDIR=$(PREFIX)/lib

.PHONY: all
all: mk_build $(TARGET)

$(BUILDDIR)/%.o: %.c %.h
	$(CC) -fPIC -c $< -o $@

lib%.so: $(BUILDDIR)/%.o
	$(CC) -shared $< -o $@

.PHONY: mk_build
mk_build:
	mkdir -p $(BUILDDIR)

.PHONY: clean
clean:
	rm $(BUILDDIR)/*.o $(TARGET)

.PHONY: install
install:
	cp $(TARGET) $(LIBDIR)

.PHONY: uninstall
uninstall:
	rm $(LIBDIR)/$(TARGET)
