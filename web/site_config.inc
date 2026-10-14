<?php
declare(strict_types=1);
namespace MRBS;

require_once 'grab_globals.inc.php';

global $multisite;

function site_config_path($site, string $sites_root) : ?string
{
  if (!is_string($site) || !preg_match('/\A[a-z][a-z0-9_-]{0,62}\z/', $site))
  {
    return null;
  }

  $sites_root = realpath($sites_root);
  if ($sites_root === false)
  {
    return null;
  }

  $site_dir = realpath($sites_root . DIRECTORY_SEPARATOR . $site);
  if (($site_dir === false) || (dirname($site_dir) !== $sites_root))
  {
    return null;
  }

  $expected_config = $site_dir . DIRECTORY_SEPARATOR . 'config.inc.php';
  $config_file = realpath($expected_config);
  if (($config_file !== $expected_config) ||
      !is_file($config_file) ||
      !is_readable($config_file))
  {
    return null;
  }

  return $config_file;
}

if ($multisite)
{
  $site = get_form_var('site', 'string', $default_site ?? '');
  if ($site !== '')
  {
    $sites_root = getenv('MRBS_SITES_ROOT');
    if (($sites_root === false) || ($sites_root === ''))
    {
      $sites_root = __DIR__ . '/sites';
    }

    $site_config = site_config_path($site, $sites_root);
    if ($site_config !== null)
    {
      require_once $site_config;
    }
    else
    {
      http_response_code(403);
      exit;
    }
  }
}
