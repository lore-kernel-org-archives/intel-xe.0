Return-Path: <intel-xe-bounces@lists.freedesktop.org>
Date: Sat, 21 Jan 2023 00:08:46 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
Message-ID: <20230121000846.5b40c1ee@coco.lan>
In-Reply-To: <20230112222538.2000142-25-rodrigo.vivi@intel.com>
References: <20230112222538.2000142-1-rodrigo.vivi@intel.com>
 <20230112222538.2000142-25-rodrigo.vivi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH 24/37] drm/i915: Expand force_probe to block
 probe of devices as well.
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>, maarten.lankhorst@linux.intel.com, philippe.lecluse@intel.com, Gustavo Sousa <gustavo.sousa@intel.com>, intel-xe@lists.freedesktop.org

Em Thu, 12 Jan 2023 17:25:25 -0500
Rodrigo Vivi <rodrigo.vivi@intel.com> escreveu:

> There are new cases where we want to block i915 probe, such
> as when experimenting or developing the new Xe driver.
> 
> But also, with the new hybrid cards, users or developers might
> want to use i915 only on integrated and fully block the probe
> of the i915 for the discrete. Or vice versa.
> 
> There are even older development and validation reasons,
> like when you use some distro where the modprobe.blacklist is
> not present.
> 
> But in any case, let's introduce a more granular control, but without
> introducing yet another parameter, but using the existent force_probe
> one.
> 
> Just by adding a ! in the begin of the id in the force_probe, like
> in this case where we would block the probe for Alder Lake:
> 
> $ insmod i915.ko force_probe='!46a6'
> 
> v2: Take care of '*' and  '!*' cases as pointed out by
>     Gustavo and Jani.
> 
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Gustavo Sousa <gustavo.sousa@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
> Acked-by: Gustavo Sousa <gustavo.sousa@intel.com>

LGTM.

Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>

> Link: https://patchwork.freedesktop.org/patch/msgid/20230103194701.1492984-1-rodrigo.vivi@intel.com
> ---
>  drivers/gpu/drm/i915/Kconfig       | 15 +++++++++++---
>  drivers/gpu/drm/i915/i915_params.c |  2 +-
>  drivers/gpu/drm/i915/i915_pci.c    | 33 +++++++++++++++++++++++++-----
>  3 files changed, 41 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
> index 3efce05d7b57..8eb3e60aeec9 100644
> --- a/drivers/gpu/drm/i915/Kconfig
> +++ b/drivers/gpu/drm/i915/Kconfig
> @@ -54,24 +54,33 @@ config DRM_I915
>  	  If "M" is selected, the module will be called i915.
>  
>  config DRM_I915_FORCE_PROBE
> -	string "Force probe driver for selected new Intel hardware"
> +	string "Force probe i915 for selected Intel hardware IDs"
>  	depends on DRM_I915
>  	help
>  	  This is the default value for the i915.force_probe module
>  	  parameter. Using the module parameter overrides this option.
>  
> -	  Force probe the driver for new Intel graphics devices that are
> +	  Force probe the i915 for Intel graphics devices that are
>  	  recognized but not properly supported by this kernel version. It is
>  	  recommended to upgrade to a kernel version with proper support as soon
>  	  as it is available.
>  
> +	  It can also be used to block the probe of recognized and fully
> +	  supported devices.
> +
>  	  Use "" to disable force probe. If in doubt, use this.
>  
> -	  Use "<pci-id>[,<pci-id>,...]" to force probe the driver for listed
> +	  Use "<pci-id>[,<pci-id>,...]" to force probe the i915 for listed
>  	  devices. For example, "4500" or "4500,4571".
>  
>  	  Use "*" to force probe the driver for all known devices.
>  
> +	  Use "!" right before the ID to block the probe of the device. For
> +	  example, "4500,!4571" forces the probe of 4500 and blocks the probe of
> +	  4571.
> +
> +	  Use "!*" to block the probe of the driver for all known devices.
> +
>  config DRM_I915_CAPTURE_ERROR
>  	bool "Enable capturing GPU state following a hang"
>  	depends on DRM_I915
> diff --git a/drivers/gpu/drm/i915/i915_params.c b/drivers/gpu/drm/i915/i915_params.c
> index 61578f2860cd..d634bd3f641a 100644
> --- a/drivers/gpu/drm/i915/i915_params.c
> +++ b/drivers/gpu/drm/i915/i915_params.c
> @@ -122,7 +122,7 @@ i915_param_named_unsafe(enable_psr2_sel_fetch, bool, 0400,
>  	"Default: 0");
>  
>  i915_param_named_unsafe(force_probe, charp, 0400,
> -	"Force probe the driver for specified devices. "
> +	"Force probe options for specified supported devices. "
>  	"See CONFIG_DRM_I915_FORCE_PROBE for details.");
>  
>  i915_param_named_unsafe(disable_power_well, int, 0400,
> diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
> index 668e9da52584..bc6fc268739d 100644
> --- a/drivers/gpu/drm/i915/i915_pci.c
> +++ b/drivers/gpu/drm/i915/i915_pci.c
> @@ -1253,7 +1253,7 @@ static void i915_pci_remove(struct pci_dev *pdev)
>  }
>  
>  /* is device_id present in comma separated list of ids */
> -static bool force_probe(u16 device_id, const char *devices)
> +static bool device_id_in_list(u16 device_id, const char *devices, bool negative)
>  {
>  	char *s, *p, *tok;
>  	bool ret;
> @@ -1262,7 +1262,9 @@ static bool force_probe(u16 device_id, const char *devices)
>  		return false;
>  
>  	/* match everything */
> -	if (strcmp(devices, "*") == 0)
> +	if (negative && strcmp(devices, "!*") == 0)
> +		return true;
> +	if (!negative && strcmp(devices, "*") == 0)
>  		return true;
>  
>  	s = kstrdup(devices, GFP_KERNEL);
> @@ -1272,6 +1274,12 @@ static bool force_probe(u16 device_id, const char *devices)
>  	for (p = s, ret = false; (tok = strsep(&p, ",")) != NULL; ) {
>  		u16 val;
>  
> +		if (negative && tok[0] == '!')
> +			tok++;
> +		else if ((negative && tok[0] != '!') ||
> +			 (!negative && tok[0] == '!'))
> +			continue;
> +
>  		if (kstrtou16(tok, 16, &val) == 0 && val == device_id) {
>  			ret = true;
>  			break;
> @@ -1283,6 +1291,16 @@ static bool force_probe(u16 device_id, const char *devices)
>  	return ret;
>  }
>  
> +static bool id_forced(u16 device_id)
> +{
> +	return device_id_in_list(device_id, i915_modparams.force_probe, false);
> +}
> +
> +static bool id_blocked(u16 device_id)
> +{
> +	return device_id_in_list(device_id, i915_modparams.force_probe, true);
> +}
> +
>  bool i915_pci_resource_valid(struct pci_dev *pdev, int bar)
>  {
>  	if (!pci_resource_flags(pdev, bar))
> @@ -1308,10 +1326,9 @@ static int i915_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  		(struct intel_device_info *) ent->driver_data;
>  	int err;
>  
> -	if (intel_info->require_force_probe &&
> -	    !force_probe(pdev->device, i915_modparams.force_probe)) {
> +	if (intel_info->require_force_probe && !id_forced(pdev->device)) {
>  		dev_info(&pdev->dev,
> -			 "Your graphics device %04x is not properly supported by the driver in this\n"
> +			 "Your graphics device %04x is not properly supported by i915 in this\n"
>  			 "kernel version. To force driver probe anyway, use i915.force_probe=%04x\n"
>  			 "module parameter or CONFIG_DRM_I915_FORCE_PROBE=%04x configuration option,\n"
>  			 "or (recommended) check for kernel updates.\n",
> @@ -1319,6 +1336,12 @@ static int i915_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  		return -ENODEV;
>  	}
>  
> +	if (id_blocked(pdev->device)) {
> +		dev_info(&pdev->dev, "I915 probe blocked for Device ID %04x.\n",
> +			 pdev->device);
> +		return -ENODEV;
> +	}
> +
>  	/* Only bind to function 0 of the device. Early generations
>  	 * used function 1 as a placeholder for multi-head. This causes
>  	 * us confusion instead, especially on the systems where both



Thanks,
Mauro

