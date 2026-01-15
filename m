Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BFD7D44C54
	for <intel-xe@archiver.kernel.org>; Thu, 15 Jan 2026 14:25:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5E5410E0AD;
	Thu, 15 Jan 2026 14:25:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ucw/1zg2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CEB010E0AD
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Jan 2026 14:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768487115; x=1800023115;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=sysW4MkNR5D/ieE+xD21mNbklbilneOMl2bQIZ4anjA=;
 b=Ucw/1zg2fcsNSFGMsXylCG23TzFLX3dKLoY1gdRdp3jVmdg/k5TQdp4a
 SNjHzsRcyHuvxCol9hKpfcnfXcxXcFmpEoPy0J55Qc+DmQWl+4+hO4cMh
 ARpfopsPLCoQqbdpnAwmqLTcGE/XxAd8l/8xygKhWIPN4nCXJA7i0/dTy
 k8XDwO8iysXMFnwxd4XzWjnybrbhmTOw2JFVcS+ISwuw3c+FOfyK003f8
 P2GkRgOr+n+Cggeh86AYJerRCEt1CRhIAVbGJ9iY3thdGWdLD+X4BXW8e
 GXxTR4JgaMQbviHbf9AKitZRDiJWh5sYGNBIE65rymn57oiotRfo6imOV Q==;
X-CSE-ConnectionGUID: jTzddVKfQouqkJWRzyJldA==
X-CSE-MsgGUID: AQv5F9FjQkmtSpG4giq7nA==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="81236424"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; d="scan'208";a="81236424"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 06:25:14 -0800
X-CSE-ConnectionGUID: GMIiWiNcS9iOFb/OJPOxMA==
X-CSE-MsgGUID: Gr3YrumiQlivATe4KDINrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; d="scan'208";a="204846263"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.150])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 06:25:09 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>, intel-xe@lists.freedesktop.org,
 linux-acpi@vger.kernel.org, linux-pci@vger.kernel.org
Cc: anshuman.gupta@intel.com, rafael@kernel.org, lenb@kernel.org,
 bhelgaas@google.com, ilpo.jarvinen@linux.intel.com,
 rodrigo.vivi@intel.com, varun.gupta@intel.com,
 ville.syrjala@linux.intel.com, uma.shankar@intel.com,
 karthik.poosa@intel.com, matthew.auld@intel.com, sk.anirban@intel.com,
 raag.jadav@intel.com
Subject: Re: [PATCH v6 06/12] drm/xe/vrsr: Enable VRSR on default VGA boot
 device
In-Reply-To: <20260113164200.1151788-20-badal.nilawar@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260113164200.1151788-14-badal.nilawar@intel.com>
 <20260113164200.1151788-20-badal.nilawar@intel.com>
Date: Thu, 15 Jan 2026 16:25:06 +0200
Message-ID: <64894565d5eace99fd65f290ee807dabaa2de04f@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
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

On Tue, 13 Jan 2026, Badal Nilawar <badal.nilawar@intel.com> wrote:
> The VRSR feature is to enhance the display screen refresh experience
> when the device exits from the D3cold state. Therefore, apply the VRSR
> feature to the default VGA boot device and when a display is connected.

I don't understand how you get from the 1st sentence "therefore" the 2nd
sentence. Please elaborate what you're trying to do here, and why.

So we have xe_pci_probe() -> xe_pm_init() -> xe_pm_vrsr_init() ->
xe_display_connected() -> intel_display_connected(), and that's the only
path and point in time to check whether displays are connected. If not,
the decision is "not VRSR capable", which is just a weird concusion to
make. The *capability* does not depend on displays, does it?

If you boot a device without a display, and then plug in a display, no
VRSR for you?

More comments inline.

> v2: Move generic display logic to i915/display (Jani)
>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display.c | 22 ++++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_display.h |  1 +
>  drivers/gpu/drm/xe/display/xe_display.c      |  5 +++++
>  drivers/gpu/drm/xe/display/xe_display.h      |  2 ++
>  drivers/gpu/drm/xe/xe_pm.c                   |  5 +++++
>  5 files changed, 35 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index 81b3a6692ca2..97c74272fb19 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -8426,3 +8426,25 @@ bool intel_scanout_needs_vtd_wa(struct intel_display *display)
>  {
>  	return IS_DISPLAY_VER(display, 6, 11) && intel_display_vtd_active(display);
>  }
> +
> +bool intel_display_connected(struct intel_display *display)
> +{
> +	struct drm_connector *list_connector;
> +	struct drm_connector_list_iter iter;
> +	bool ret = false;
> +
> +	mutex_lock(&display->drm->mode_config.mutex);
> +	drm_connector_list_iter_begin(display->drm, &iter);
> +
> +	drm_for_each_connector_iter(list_connector, &iter) {
> +		if (list_connector->status == connector_status_connected) {
> +			ret = true;
> +			break;
> +		}
> +	}
> +
> +	drm_connector_list_iter_end(&iter);
> +	mutex_unlock(&display->drm->mode_config.mutex);
> +
> +	return ret;
> +}
> diff --git a/drivers/gpu/drm/i915/display/intel_display.h b/drivers/gpu/drm/i915/display/intel_display.h
> index f8e6e4e82722..20690aa59324 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.h
> +++ b/drivers/gpu/drm/i915/display/intel_display.h
> @@ -560,5 +560,6 @@ bool assert_port_valid(struct intel_display *display, enum port port);
>  
>  bool intel_scanout_needs_vtd_wa(struct intel_display *display);
>  int intel_crtc_num_joined_pipes(const struct intel_crtc_state *crtc_state);
> +bool intel_display_connected(struct intel_display *display);
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
> index f8a831b5dc7d..54ed39b257ad 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.c
> +++ b/drivers/gpu/drm/xe/display/xe_display.c
> @@ -64,6 +64,11 @@ bool xe_display_driver_probe_defer(struct pci_dev *pdev)
>  	return intel_display_driver_probe_defer(pdev);
>  }
>  
> +bool xe_display_connected(struct xe_device *xe)
> +{
> +	return intel_display_connected(xe->display);
> +}
> +
>  /**
>   * xe_display_driver_set_hooks - Add driver flags and hooks for display
>   * @driver: DRM device driver
> diff --git a/drivers/gpu/drm/xe/display/xe_display.h b/drivers/gpu/drm/xe/display/xe_display.h
> index 76db95c25f7e..11d4b09808e5 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.h
> +++ b/drivers/gpu/drm/xe/display/xe_display.h
> @@ -37,6 +37,7 @@ void xe_display_pm_resume(struct xe_device *xe);
>  void xe_display_pm_runtime_suspend(struct xe_device *xe);
>  void xe_display_pm_runtime_suspend_late(struct xe_device *xe);
>  void xe_display_pm_runtime_resume(struct xe_device *xe);
> +bool xe_display_connected(struct xe_device *xe);
>  
>  #else
>  
> @@ -67,5 +68,6 @@ static inline void xe_display_pm_runtime_suspend(struct xe_device *xe) {}
>  static inline void xe_display_pm_runtime_suspend_late(struct xe_device *xe) {}
>  static inline void xe_display_pm_runtime_resume(struct xe_device *xe) {}
>  
> +static inline bool xe_display_connected(struct xe_device *xe) { return false; }

There was a blank line before #endif. Please keep it. Ditto throughout
the series.

>  #endif /* CONFIG_DRM_XE_DISPLAY */
>  #endif /* _XE_DISPLAY_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 3fe673f0f87d..e7aa876ce9e0 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -9,6 +9,7 @@
>  #include <linux/fault-inject.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/suspend.h>
> +#include <linux/vgaarb.h>
>  
>  #include <drm/drm_managed.h>
>  #include <drm/ttm/ttm_placement.h>
> @@ -387,6 +388,7 @@ static int pci_acpi_aux_power_setup(struct xe_device *xe)
>  
>  static void xe_pm_vrsr_init(struct xe_device *xe)
>  {
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>  	int ret;
>  
>  	if (!xe->info.has_vrsr)
> @@ -395,6 +397,9 @@ static void xe_pm_vrsr_init(struct xe_device *xe)
>  	if (!xe_pm_vrsr_capable(xe))
>  		return;
>  
> +	if (pdev != vga_default_device() || !xe_display_connected(xe))

Simply considering the places in the kernel that call
vga_default_device(), this just doesn't feel right.


BR,
Jani.


> +		return;
> +
>  	/*
>  	 * If the VRSR initialization fails, the device will proceed with the regular
>  	 * D3cold flow

-- 
Jani Nikula, Intel
