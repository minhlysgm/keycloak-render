FROM quay.io/keycloak/keycloak:26.4.5 AS builder

# Build optimized image
WORKDIR /opt/keycloak
ENV KC_DB=dev-mem
ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true

RUN /opt/keycloak/bin/kc.sh build

# Runtime image
FROM quay.io/keycloak/keycloak:26.4.5

# Environment variables
ENV KC_BOOTSTRAP_ADMIN_USERNAME=admin \
    KC_BOOTSTRAP_ADMIN_PASSWORD=admin \
    KC_HOSTNAME=keycloak-dev-9n5x.onrender.com \
    KC_HOSTNAME_STRICT=false \
    KC_HTTP_ENABLED=true \
    KC_HEALTH_ENABLED=true \
    KC_PROXY_HEADERS=xforwarded

EXPOSE 8080

ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]
CMD ["start-dev", "--http-enabled=true", "--http-host=0.0.0.0", "--hostname-strict=false", "--proxy-headers=xforwarded"]