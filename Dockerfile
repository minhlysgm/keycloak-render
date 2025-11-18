FROM quay.io/keycloak/keycloak:26.4.5 AS builder

# Build optimized image
WORKDIR /opt/keycloak
ENV KC_DB=dev-mem
ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true

RUN /opt/keycloak/bin/kc.sh build

# Runtime image
FROM quay.io/keycloak/keycloak:26.4.5
COPY --from=builder /opt/keycloak/ /opt/keycloak/

# Runtime configuration
ENV KC_BOOTSTRAP_ADMIN_USERNAME=admin \
    KC_BOOTSTRAP_ADMIN_PASSWORD=admin \
    KC_HOSTNAME_STRICT=false \
    KC_HTTP_ENABLED=true \
    KC_DB=dev-mem

EXPOSE 8080

ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]
CMD ["start", "--optimized", "--http-enabled=true", "--http-host=0.0.0.0"]