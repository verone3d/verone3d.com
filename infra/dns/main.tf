terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.0"
    }
  }
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

# ---------------------------------------------------------------------------
# Zone
# ---------------------------------------------------------------------------

data "cloudflare_zones" "verone3d" {
  filter {
    name = "verone3d.com"
  }
}

locals {
  zone_id = data.cloudflare_zones.verone3d.zones[0].id
}

# ---------------------------------------------------------------------------
# GitHub Pages — apex A records
# ---------------------------------------------------------------------------

resource "cloudflare_record" "github_pages_a1" {
  zone_id = local.zone_id
  name    = "@"
  type    = "A"
  value   = "185.199.108.153"
  proxied = false
  ttl     = 3600
}

resource "cloudflare_record" "github_pages_a2" {
  zone_id = local.zone_id
  name    = "@"
  type    = "A"
  value   = "185.199.109.153"
  proxied = false
  ttl     = 3600
}

resource "cloudflare_record" "github_pages_a3" {
  zone_id = local.zone_id
  name    = "@"
  type    = "A"
  value   = "185.199.110.153"
  proxied = false
  ttl     = 3600
}

resource "cloudflare_record" "github_pages_a4" {
  zone_id = local.zone_id
  name    = "@"
  type    = "A"
  value   = "185.199.111.153"
  proxied = false
  ttl     = 3600
}

# ---------------------------------------------------------------------------
# GitHub Pages — www CNAME
# ---------------------------------------------------------------------------

resource "cloudflare_record" "www" {
  zone_id = local.zone_id
  name    = "www"
  type    = "CNAME"
  value   = "verone3d.github.io"
  proxied = false
  ttl     = 3600
}
