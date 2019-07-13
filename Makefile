TARGETS:= *.apk

.PHONY: clean buildEmulator buildDevice cleanall

FLASKAPP=/home/YOURUSERNAME/flask-webview-android-p4a/flaskapp

buildEmulator:
	p4a apk --private $(FLASKAPP) \
		--package=org.webview.flask \
		--name "Flask Webview" \
		--requirements flask\
		--bootstrap=webview \
		--dist_name FlaskWebViewApp \
		--version 0.0.1 \
		--arch x86 \
		--permission INTERNET


buildDevice:
	p4a apk --private $(FLASKAPP) \
		--package=org.webview.flask \
		--name "Flask Webview" \
		--requirements flask\
		--bootstrap=webview \
		--dist_name FlaskWebViewApp \
		--version 0.0.1 \
		--arch armeabi-v7a \
		--permission INTERNET

clean:
	rm -r $(TARGETS)
	p4a clean_builds && p4a clean_dists

cleanall:
	p4a clean_all