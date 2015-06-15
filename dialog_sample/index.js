remote = require('remote');
curwin = remote.getCurrentWindow();
dialog = remote.require('dialog');

function show_dialog() {

	/* dialog.showMessageBox()に引数として渡すオブジェクト */
	var args = {};

	/* type String - Can be "none", "info" or "warning" */
	if (document.getElementById('type_none').checked == true)
		args.type = 'none';
	if (document.getElementById('type_info').checked == true)
		args.type = 'info';
	if (document.getElementById('type_warning').checked == true)
		args.type = 'warning';

	/* title String - Title of the message box, some platforms will not show it */
	args.title   = document.getElementById('dlg_title').value;

	/* message String - Content of the message box */
	args.message = document.getElementById('dlg_message').value;

	/* icon NativeImage */
	if (document.getElementById('icon_mikan').checked == true)
		args.icon = 'RESOURCE/icon/pripara/icon_mikan.jpg';
	if (document.getElementById('icon_aroma').checked == true)
		args.icon = 'RESOURCE/icon/pripara/icon_aroma.jpg';

	/* buttons Array - Array of texts for buttons */
	var dlg_button = ['かしこまっ！'];
	if (document.getElementById('btn_mikan').checked == true)
		dlg_button.push('みかん');
	if (document.getElementById('btn_aroma').checked == true)
		dlg_button.push('あろま');
	args.buttons = dlg_button;

	console.log(args);

	var btn_index = dialog.showMessageBox(curwin, args);
	alert('「' + dlg_button[btn_index] + '」が押されました。');
}

