# VARIABLES
ENV=qa
MODULE=Full

# NON-TEST TARGETS

all:
	hub
	node

hub:
	selenium-standalone start -- -role hub -hubConfig ./gridConfig/hub.json

node:
	selenium-standalone start -- -role node -hub http://localhost:4444/grid/register -nodeConfig ./gridConfig/node.json -host "localhost"

deps:
	npm install selenium-standalone@latest -g
	npm install -g newman
	selenium-standalone install

killSelenium:
	pkill -f selenium-standalone

# TEST TARGETS

regression:
	./gradlew test$(MODULE) -Penv=$(ENV) --rerun-tasks

smoke:
	./gradlew smoke$(MODULE) -Penv=$(ENV) --rerun-tasks

qaFullRegression:
	./gradlew testFull -Penv=qa --rerun-tasks

appFullRegression:
	./gradlew testFull -Penv=app --rerun-tasks

qaVisibility:
	./gradlew testVisibility -Penv=qa --rerun-tasks

appVisibility:
	./gradlew testVisibility -Penv=app --rerun-tasks

qaSocialMedia:
	./gradlew testSocialMedia -Penv=qa --rerun-tasks

appSocialMedia:
	./gradlew testSocialMedia -Penv=app --rerun-tasks

qaInsights:
	./gradlew testInsights -Penv=qa --rerun-tasks

appInsights:
	./gradlew testInsights -Penv=app --rerun-tasks

qaPaidMedia:
	./gradlew testPaidMedia -Penv=qa --rerun-tasks

qaPaidMediaVideos:
	./gradlew testPaidMediaVideos -Penv=qa --rerun-tasks

appPaidMedia:
	./gradlew testPaidMedia -Penv=app --rerun-tasks

qaReputationManager:
	./gradlew testReputationManager -Penv=qa --rerun-tasks

appReputationManager:
	./gradlew testReputationManager -Penv=app --rerun-tasks

qaSmokeTest:
	./gradlew smokeFull -Penv=qa --rerun-tasks

appSmokeTest:
	./gradlew smokeFull -Penv=app --rerun-tasks

qaReputationManagerIOS:
	./gradlew testReputationManagerIOS -Penv=qa --rerun-tasks

appReputationManagerIOS:
	./gradlew testReputationManagerIOS -Penv=app --rerun-tasks

qaSocialMediaIOS:
	./gradlew testSocialMediaIOS -Penv=qa --rerun-tasks

appSocialMediaIOS:
	./gradlew testSocialMediaIOS -Penv=app --rerun-tasks

qaPaidMediaIOS:
	./gradlew testPaidMediaIOS -Penv=qa --rerun-tasks

appPaidMediaIOS:
	./gradlew testPaidMediaIOS -Penv=app --rerun-tasks
