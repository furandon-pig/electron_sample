remote = require('remote');
curwin = remote.getCurrentWindow();

var is_show_devtool = false;

function toggle_devtool() {
	is_show_devtool = ! is_show_devtool;
	if (is_show_devtool == true) {
		curwin.openDevTools();
	} else {
		curwin.closeDevTools();
	}
}

