# `adocker` is alias to `azk docker`
all:
	adocker build -t azukiapp/ubuntu .

no-cache:
	adocker build --rm --no-cache -t azukiapp/ubuntu .
