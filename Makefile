SRCDIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
BUILDDIR = build
DESTDIR = install


ew_stub_packages = Core Engine GFxUI
lwce_stub_packages = XComGame XComStrategyGame XComUIShell XComMutator XComLZMutator
lwce_packages = XComLongWarCommunityEdition


WPFX = $(BUILDDIR)/wpfx
UDK = UDKInstall-2011-09-BETA.exe
UDK_PATH = UDK/UDK-2011-09

WINE_UDK = $(WPFX)/drive_c/$(UDK_PATH)
UDK_SRCPATH = $(WINE_UDK)/Development/Src
UDK_RELPATH = $(shell sed -e 's#[^/]\+#..#g' <<<"$(UDK_SRCPATH)")

engine_conf = $(WINE_UDK)/UDKGame/Config/DefaultEngine.ini

export WINEPREFIX=$(abspath $(WPFX))
export WINEARCH=win32
export WINEDEBUG=fixme-all,trace-all

all: $(foreach pkg,$(lwce_packages),$(BUILDDIR)/$(pkg).u)

$(engine_conf).default: $(SRCDIR)/wine_build $(UDK)
	bash $(SRCDIR)/wine_build init_wpfx "$(UDK)" "$(UDK_SRCPATH)" "$(engine_conf)" "$(engine_conf).default"

$(engine_conf): $(SRCDIR)/wine_build $(engine_conf).default $(SRCDIR)/Stubs $(SRCDIR)/LWCE_Core/Src
	bash $(SRCDIR)/wine_build lwce_udk "$(UDK_SRCPATH)" "$(SRCDIR)/Stubs" "$(SRCDIR)/LWCE_Core/Src" "$(engine_conf).default" "$(engine_conf)" $(ew_stub_packages) $(lwce_stub_packages) $(lwce_packages)

udk_rebuild:

$(BUILDDIR)/%.u: $(SRCDIR)/wine_build $(engine_conf) udk_rebuild
	bash $(SRCDIR)/wine_build lwce_build "$(WINE_UDK)"
	cp "$(WINE_UDK)/UDKGame/Script/$(notdir $@)" "$@"

install: $(wildcard LWCE_Core/Config/* LWCE_Core/Localization/*/* LWCE_Core/Patches/* README*) all
	mkdir -p "$(DESTDIR)"/{Config,CookedPCConsole,Localization/INT,UPK\ patches}
	$(foreach pkg,$(lwce_packages),cp "$(BUILDDIR)/$(pkg).u" "$(DESTDIR)/CookedPCConsole")
	for f in "LWCE_Core/Config"/*; do unix2dos <"$$f" >"$(DESTDIR)/Config/$${f##*/}"; done
	for f in "LWCE_Core/Localization/INT"/*; do unix2dos <"$$f" >"$(DESTDIR)/Localization/INT/$${f##*/}"; done
	for f in "LWCE_Core/Patches"/*; do unix2dos <"$$f" >"$(DESTDIR)/UPK patches/$${f##*/}"; done
	unix2dos <README_installation.txt > "$(DESTDIR)/README.txt"


clean:
	rm -rf $(BUILDDIR)

.PHONY: clean all udk_rebuild install

