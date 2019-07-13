TARGETS:= *.apk

.PHONY: clean build cleanall

build:
	p4a apk --private /home/pksec/sgit/wf-android-app/flaskapp \
		--package=org.webview.flask \
		--name "Flask Webview" \
		--requirements flask\
		--bootstrap=webview \
		--dist_name FlaskWebViewApp \
		--version 0.0.1 \
		--arch x86 \
		--permission INTERNET

clean:
	rm -r $(TARGETS)
	p4a clean_builds && p4a clean_dists

cleanall:
	p4a clean_all