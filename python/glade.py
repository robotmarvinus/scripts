import gi
gi.require_version('Gtk', '3.0')
from gi.repository import Gtk

class Application(Gtk.Application):
    icon    = "/usr/share/icons/downloader-gallery.png"
    prog_id = "test.org"

    def __init__(self):
        Gtk.Application.__init__(self, application_id=self.prog_id)

        self.window   = None

    def do_startup(self):
        Gtk.Application.do_startup(self)

    def do_activate(self):
        print("sdf")
        if not self.window:
            print("sdf")
            builder = Gtk.Builder()
            builder.add_from_file("./source/window.xml")

            header  = builder.get_object("header")
            content = builder.get_object("content")

            self.window = builder.get_object("window")
            self.window.set_titlebar(header)
            self.window.add(content)

            self.window.show_all()

if __name__ == "__main__":
    app = Application()
    app.run()
