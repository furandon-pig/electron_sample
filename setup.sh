#!/bin/sh

# サンプルプログラム中でアイコン等の画像ファイルを参照しており、
# それらをダウンロードするためのスクリプトです。
# 利用しているアイコン画像は再配布禁止のものもあり、サンプル利用者が
# このスクリプトを実行することで、各自アイコン画像をダウンロードして
# いただく形になります。

if [ -z "`which curl`" ]; then
	echo 'このスクリプトの実行にはcurlコマンドが必要です。'
	exit 1
fi

[ ! -d RESOURCE ] && mkdir RESOURCE

# 「プリパラ」アイコンをダウンロードする
PRIPARA_ICON_DIR=RESOURCE/icon/pripara
if [ ! -d ${PRIPARA_ICON_DIR} ]; then
	mkdir -p ${PRIPARA_ICON_DIR}
	echo " create ${PRIPARA_ICON_DIR}"
fi

PRIPARA_URL='http://www.tv-tokyo.co.jp/anime/pripara/images/news/'
ICON="
icon_aroma.jpg
icon_mikan.jpg
icon_reo.jpg
icon_sion.jpg
icon_doro.jpg
icon_mirei.jpg
icon_raara.jpg
icon_sofy.jpg
"
for i in `echo ${ICON}`
do
	icon_file=${PRIPARA_ICON_DIR}/${i}
	icon_url=${PRIPARA_URL}/${i}
	if [ ! -f ${icon_file} ]; then
		curl --silent -o ${icon_file} ${icon_url}
		[ $? -eq 0 ] && echo " downloaded ${icon_file}"
	fi
done


# 「ラブライブ！」アイコンをダウンロードする
LOVELIVE_ICON_DIR=RESOURCE/icon/lovelive
if [ ! -d ${LOVELIVE_ICON_DIR} ]; then
	mkdir -p ${LOVELIVE_ICON_DIR}
	echo " create ${LOVELIVE_ICON_DIR}"
fi

LOVELIVE_URL='http://news.lovelive-anime.jp/app-def/S-102/news/wp-content/uploads/2012/09/'
ICON="
honoka_icon5000.jpg
eli_icon5000.jpg
kotori_icon50001.jpg
umi_icon5000.jpg
rin_icon5000.jpg
maki_icon5000.jpg
nozomi_icon5000.jpg
hanayo_icon5000.jpg
nico_icon5000.jpg
"
for i in `echo ${ICON}`
do
	icon_file=${LOVELIVE_ICON_DIR}/${i}
	icon_url=${LOVELIVE_URL}/${i}
	if [ ! -f ${icon_file} ]; then
		curl --silent -o ${icon_file} ${icon_url}
		[ $? -eq 0 ] && echo " downloaded ${icon_file}"
	fi
done


# 「きんいろモザイク」アイコンをダウンロードする
KINMOSA_ICON_DIR=RESOURCE/icon/kinmosa
if [ ! -d ${KINMOSA_ICON_DIR} ]; then
	mkdir -p ${KINMOSA_ICON_DIR}
	echo " create ${KINMOSA_ICON_DIR}"
fi
if [ ! -f ${KINMOSA_ICON_DIR}/KM_TWicon.zip ]; then
	_cur_dir=`pwd`
	cd ${KINMOSA_ICON_DIR}
	curl --silent -O http://kinmosa.com/special/assets/twtic/KM_TWicon.zip
	echo ' downloaded KM_TWicon.zip'
	unzip KM_TWicon.zip
	echo ' extracted KM_TWicon.zip'
	rm KM_TWicon.zip
	cd ${_cur_dir}
fi

