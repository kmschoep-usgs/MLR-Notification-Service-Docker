FROM cidasdpdasartip.cr.usgs.gov:8447/wma/wma-spring-boot-base:latest

ENV repo_name=mlr-maven-centralized
ENV artifact_id=mlrNotification
ENV artifact_version=0.8.0-SNAPSHOT
ENV requireSsl=true
ENV serverPort=8444
ENV serverContextPath=/
ENV oauthResourceTokenKeyUri=https://example.gov/oauth/token_key
ENV oauthResourceId=resource-id
ENV MLR_NOTIFICATION_EMAIL_FROM=fakeperson@usgs.gov
ENV MLR_NOTIFICATION_EMAIL_HOST=fakehost
ENV MLR_NOTIFICATION_EMAIL_PORT=9999
ENV HEALTHY_RESPONSE_CONTAINS='{"status":"UP"}'

RUN ./pull-from-artifactory.sh ${repo_name} gov.usgs.wma ${artifact_id} ${artifact_version} app.jar

HEALTHCHECK --interval=30s --timeout=3s \
  CMD curl -k "https://127.0.0.1:${serverPort}${serverContextPath}${HEALTH_CHECK_ENDPOINT}" | grep -q ${HEALTHY_RESPONSE_CONTAINS} || exit 1