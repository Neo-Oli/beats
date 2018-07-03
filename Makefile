JS:= beats.js
minify: vendor/autoload.php dist/beats.min.js
dist/beats.min.js: $(JS)
	mkdir -p dist
	php -r "\
		require __DIR__ . '/vendor/autoload.php';\
		use MatthiasMullie\Minify;\
		\$$minifier = new Minify\JS();\
		foreach(explode(' ','$(JS)') as \$$file){\
			\$$minifier->add(\$$file);\
			}\
		\$$minifier->minify('$@');\
	"

.PHONY: clean
clean:
	rm -frv vendor
	rm -frv dist

.PHONY: deps_update
deps_update:
	composer update
.PHONY: setup
setup: vendor/autoload.php

composer.lock: composer.json
	composer install
	touch $@
vendor/autoload.php: composer.lock
	composer install
	touch $@

