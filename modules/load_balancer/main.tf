resource "google_compute_instance_group" "default" {
  name        = "instance-group"
  zone        = var.zone
  network     = var.network
  instances   = [var.jenkins_link]
  
  named_port {
    name = "http"
    port = "8080"
  }
}

# Crear un Health Check para el balanceador de carga
resource "google_compute_http_health_check" "default" {
  name               = "http-health-check"
  request_path       = "/"
  check_interval_sec = 5
  timeout_sec        = 5
  healthy_threshold  = 2
  unhealthy_threshold = 2
  port = 8080
}

# Backend Service (Conectado al Health Check)
resource "google_compute_backend_service" "default" {
  name            = "backend-service"
  backend {
    group = google_compute_instance_group.default.self_link
  }
  health_checks = [google_compute_http_health_check.default.self_link]
  protocol      = "HTTP"
  port_name     = "http"
}

# Crear el URL Map
resource "google_compute_url_map" "default" {
  name            = "url-map"
  default_service = google_compute_backend_service.default.self_link
}

# Reglas de Reenvío (Frontend)
resource "google_compute_global_forwarding_rule" "default" {
  name       = "http-forwarding-rule"
  target     = google_compute_url_map.default.self_link
  port_range = "8080"
  ip_address = google_compute_global_address.default.address
}

# Dirección IP Global
resource "google_compute_global_address" "default" {
  name = "global-ip"
}