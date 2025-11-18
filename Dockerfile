FROM quay.io/keycloak/keycloak:26.0.0

# Set environment variables
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin123
ENV KC_HOSTNAME_STRICT=false
ENV KC_PROXY=edge
ENV KC_HTTP_ENABLED=true

# Expose port
EXPOSE 8080

# Start Keycloak in dev mode
ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]
CMD ["start-dev", "--http-enabled=true", "--hostname-strict=false", "--proxy-headers=xforwarded"]
