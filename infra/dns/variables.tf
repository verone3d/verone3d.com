variable "cloudflare_api_token" {
  description = "Cloudflare API token with Zone:DNS:Edit permission"
  type        = string
  sensitive   = true
}
