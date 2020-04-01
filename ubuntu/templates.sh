#!/bin/bash

#-----file-templates-default--
sudo mkdir -p /etc/skel/Шаблоны

sudo bash -c 'cat > /etc/skel/Шаблоны/скрипт\ bash.sh' << EOF
#!/bin/bash
EOF

sudo bash -c 'cat > /etc/skel/Шаблоны/скрипт\ python.py' << EOF
#!/usr/bin/env python3

if __name__ == "__main__":
    print("Hello")
EOF

sudo bash -c 'cat > /etc/skel/Шаблоны/скрипт\ javascript.js' << EOF
function main() {

}
EOF

sudo bash -c 'cat > /etc/skel/Шаблоны/файл\ css.css' << EOF
EOF

sudo bash -c 'cat > /etc/skel/Шаблоны/файл\ html.html' << EOF
<html>
	<head>
		<title>Html document</title>
		<style>
			body { margin: 0; }
		</style>
	</head>
	<body>

	</body>
</html>
EOF

sudo bash -c 'cat > /etc/skel/Шаблоны/файл\ vala.vala' << EOF
using Gtk;

public class Application : Gtk.Application {

	public Application() {
        Object(application_id: "org.domain.gnome_application");
	}

	protected override void activate() {
        var window   = new Gtk.ApplicationWindow(this);
        window.show_all();
	}

	public static int main(string[] args) {
		Application app = new Application();
		return app.run(args);
	}
}
EOF

sudo bash -c 'cat > /etc/skel/Шаблоны/файл\ txt.txt' << EOF
EOF

#-----file-templates-user-----
sudo mkdir -p ~/Шаблоны

cat > ~/Шаблоны/файл\ vala.vala << EOF
using Gtk;

public class Application : Gtk.Application {

	public Application() {
        Object(application_id: "org.domain.gnome_application");
	}

	protected override void activate() {
        var window   = new Gtk.ApplicationWindow(this);
        window.show_all();
	}

	public static int main(string[] args) {
		Application app = new Application();
		return app.run(args);
	}
}
EOF

cat > ~/Шаблоны/скрипт\ bash.sh <<EOF
#!/bin/bash
EOF

cat > ~/Шаблоны/скрипт\ python.py <<EOF
#!/usr/bin/env python3

if __name__ == "__main__":
    print("Hello")
EOF

cat > ~/Шаблоны/скрипт\ javascript.js << EOF
function main() {

}
EOF

cat > ~/Шаблоны/файл\ css.css << EOF
EOF

cat > ~/Шаблоны/файл\ html.html << EOF
<html>
	<head>
		<title>Html document</title>
		<style>
			body { margin: 0; }
		</style>
	</head>
	<body>

	</body>
</html>
EOF

cat > ~/Шаблоны/файл\ txt.txt << EOF
EOF
