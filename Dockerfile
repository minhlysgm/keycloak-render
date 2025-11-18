FROM quay.io/keycloak/keycloak:26.4.5

# Environment variables
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin123
ENV KC_HOSTNAME_STRICT=false
ENV KC_PROXY=edge
ENV KC_HTTP_ENABLED=true
ENV KC_HTTP_PORT=8080

# Expose port
EXPOSE 8080

# Start Keycloak
ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]
CMD ["start-dev", "--http-enabled=true", "--http-host=0.0.0.0", "--http-port=8080", "--hostname-strict=false", "--proxy-headers=xforwarded"]