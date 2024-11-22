if pgrep wvkbd-mobintl > /dev/null; then
	pkill wvkbd-mobintl &> /dev/null
	printf '{}'
else
	wvkbd-mobintl -L 500 -l simple,special,emoji &> /dev/null
	printf '{"class": "enabled"}'
fi
