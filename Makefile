PB      = pocketbase
PB_DIR  = .
SITE    = site

.PHONY: dev pb hugo build clean

## Start both PocketBase and Hugo dev server (in parallel)
dev:
	$(MAKE) pb & $(MAKE) hugo

## Start PocketBase server
pb:
	$(PB) serve --dir=$(PB_DIR)/pb_data

## Start Hugo dev server (cache-busted)
hugo:
	cd $(SITE) && hugo server --ignoreCache --noHTTPCache

## Production build
build:
	cd $(SITE) && hugo --ignoreCache --minify

## Open PocketBase admin UI
admin:
	open http://127.0.0.1:8090/_/

## Open local Hugo site
open:
	open http://localhost:1313

clean:
	rm -rf $(SITE)/public $(SITE)/resources
