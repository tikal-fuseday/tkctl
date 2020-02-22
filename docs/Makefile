logo = logo.png
image = tikal-devops/wiki
repo = 329054710135.dkr.ecr.eu-central-1.amazonaws.com/devops/wiki
tag = latest
aws_profile = tikalk
aws_region = eu-central-1

all:
	@echo 'tasks'
	@echo '---'
	@echo 'make install - Install dependencies with yarn'
	@echo 'make start - Run development server locally'
	@echo 'make favicon - Generate favicons from logo'
	@echo 'make lint - Lint markdown and javascript files'
# @echo 'make deploy - Build & deploy distribution assets'

install:
	yarn install

start:
	yarn run dev

build:
	rm -rf ./dist
	yarn run build

image: build
	docker build -t "$(image):latest" .

# deploy: image
# 	$(shell export AWS_PROFILE=$(aws_profile); \
# 		aws ecr get-login --no-include-email --region $(aws_region))
# 	docker tag "$(image):latest" "$(repo):$(tag)"
# 	docker push "$(repo):$(tag)"

lint:
	yarn run lint

favicon:
	cd .vuepress/public; \
	convert -resize x16 -gravity center -crop 16x16+0+0 -flatten -colors 256 $(logo) icons/output-16x16.ico; \
	convert -resize x32 -gravity center -crop 32x32+0+0 -flatten -colors 256 $(logo) icons/output-32x32.ico; \
	convert -resize x48 -gravity center -crop 48x48+0+0 -flatten -colors 256 $(logo) icons/output-48x48.ico; \
	convert icons/output-16x16.ico icons/output-32x32.ico icons/output-48x48.ico favicon.ico; \
	convert -resize x152 $(logo) icons/apple-touch-icon-152x152.png; \
	convert -resize x120 $(logo) icons/apple-touch-icon-120x120.png; \
	convert -resize x76  $(logo) icons/apple-touch-icon-76x76.png; \
	convert -resize x60  $(logo) icons/apple-touch-icon-60x60.png; \
	convert -resize x192 $(logo) icons/android-chrome-192x192.png; \
	convert -resize x512 $(logo) icons/android-chrome-512x512.png; \
	convert -resize x144 $(logo) icons/msapplication-icon-144x144.png

.PHONY: all install start build image deploy lint favicon