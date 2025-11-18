FROM quay.io/keycloak/keycloak:26.4.5

# Environment variables
ENV KC_BOOTSTRAP_ADMIN_USERNAME=admin \
    KC_BOOTSTRAP_ADMIN_PASSWORD=admin \
    KC_HOSTNAME_STRICT=false \
    KC_PROXY=edge \
    KC_HTTP_ENABLED=true \
    KC_HEALTH_ENABLED=true \
    KC_HTTP_HOST=0.0.0.0 \
    KC_HTTP_PORT=8080

# Expose port (Render auto-detects this)
EXPOSE 8080

# Start command
ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]
CMD ["start-dev"]