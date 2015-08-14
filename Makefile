BUILDDIR = _build
MAKE_PARAMS = --no-print-directory

all: $(BUILDDIR) cmake libs

$(BUILDDIR):
	mkdir -p $@

cmake: $(BUILDDIR)
	cd $(BUILDDIR) && cmake -DCMAKE_BUILD_TYPE=Release ..

libs: cmake
	cd $(BUILDDIR) && make $(MAKE_PARAMS)

hbs hbs-acc hbs-pow hbs-acc-pow hbs-static hbs-acc-static hbs-pow-static hbs-acc-pow-static: cmake
	cd $(BUILDDIR) && make $@ $(MAKE_PARAMS)

install: all
	cd $(BUILDDIR) && make install $(MAKE_PARAMS)

uninstall:
	cd $(BUILDDIR) && make uninstall $(MAKE_PARAMS)

clean:
	rm -rf $(BUILDDIR)
