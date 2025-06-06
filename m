Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0643AC61CE8
	for <intel-xe@archiver.kernel.org>; Fri,  6 Jun 2025 13:08:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C27E910EACD;
	Fri,  6 Jun 2025 13:08:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QLbF9Jed";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A3A410EA9E
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Jun 2025 13:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749215257; x=1780751257;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=bjs2ukE8nGKBFwCkmEaz1t/BUwxQxZjSjPRiNH7ouWw=;
 b=QLbF9Jed4gmCGhAqwUHtECoslpVpos+CB92Qe2/e1bNTpTzdrIINLdtW
 2IdEjtdVlYDuIvaiX5hnnsl97riDRSd/kAZLldGPEcDJWbE61Bf+frUIe
 Ehkbh1LEXnAAo9M6i9MrXUNWFoD6Y59cBjhxotC99Ovb3pXsnkNzJaxTN
 sIbA2/Z9CgbSe4ASkhInGp6k3QUtkukhFhEt12qB1i6fBdzFCpGv67Fuv
 VHPMsmHuihnzB6G9bNDUhJ5PBJlXElXImtyuGhTUzlPrnlgz4fGWwGw7O
 C7KpWtkiR62GQeK6aY00KOD1Zlv7CzKXAjspAkzsrlhDHqxrmS8YHxSKD Q==;
X-CSE-ConnectionGUID: nl71RwYeS9eYJokR2kA16w==
X-CSE-MsgGUID: VdydxD/aRI2823DiJFh+Dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="55155618"
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208";a="55155618"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 06:07:08 -0700
X-CSE-ConnectionGUID: UZLW9grrQLKU787YjQd6Zw==
X-CSE-MsgGUID: SgL9mIWlR3Oow5R6Cpn33A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208";a="146783525"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.33])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 06:07:04 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>, intel-xe@lists.freedesktop.org,
 linux-acpi@vger.kernel.org, linux-pci@vger.kernel.org
Cc: anshuman.gupta@intel.com, rafael@kernel.org, lenb@kernel.org,
 bhelgaas@google.com, ilpo.jarvinen@linux.intel.com,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com, varun.gupta@intel.com,
 ville.syrjala@linux.intel.com, uma.shankar@intel.com
Subject: Re: [PATCH v4 07/11] drm/xe/vrsr: Enable VRSR on default VGA boot
 device
In-Reply-To: <20250529111654.3140766-8-badal.nilawar@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250529111654.3140766-1-badal.nilawar@intel.com>
 <20250529111654.3140766-8-badal.nilawar@intel.com>
Date: Fri, 06 Jun 2025 16:07:02 +0300
Message-ID: <a7522f7954b3c08fec00ae7f1fd132ec4a3d2033@intel.com>
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

On Thu, 29 May 2025, Badal Nilawar <badal.nilawar@intel.com> wrote:
> The VRSR feature is to enhance the display screen refresh experience
> when the device exits from the D3Cold state. Therefore, apply the VRSR
> feature to the default VGA boot device and when a display is connected.
>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  drivers/gpu/drm/xe/display/xe_display.c | 22 ++++++++++++++++++++++
>  drivers/gpu/drm/xe/display/xe_display.h |  2 ++
>  drivers/gpu/drm/xe/xe_pm.c              |  5 +++++
>  3 files changed, 29 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
> index 20c3bcd953b7..b3da88b12b35 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.c
> +++ b/drivers/gpu/drm/xe/display/xe_display.c
> @@ -88,6 +88,28 @@ static void display_destroy(struct drm_device *dev, void *dummy)
>  	destroy_workqueue(xe->display.hotplug.dp_wq);
>  }
>  
> +bool xe_display_connected(struct xe_device *xe)
> +{
> +	struct drm_connector *list_connector;
> +	struct drm_connector_list_iter iter;
> +	bool ret = false;
> +
> +	mutex_lock(&xe->drm.mode_config.mutex);
> +	drm_connector_list_iter_begin(&xe->drm, &iter);
> +
> +	drm_for_each_connector_iter(list_connector, &iter) {
> +		if (list_connector->status == connector_status_connected) {
> +			ret = true;
> +			break;
> +		}
> +	}
> +
> +	drm_connector_list_iter_end(&iter);
> +	mutex_unlock(&xe->drm.mode_config.mutex);
> +
> +	return ret;
> +}
> +

Xe display/ should contain the *minimal* glue to attach i915 display to
it. It should *not* contain generic display stuff like this. At all.

The goal is for i915 display to become a dedicated kernel module. The
above should not be part of xe.ko.

BR,
Jani.

>  /**
>   * xe_display_create - create display struct
>   * @xe: XE device instance
> diff --git a/drivers/gpu/drm/xe/display/xe_display.h b/drivers/gpu/drm/xe/display/xe_display.h
> index 46e14f8dee28..c79441bccb43 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.h
> +++ b/drivers/gpu/drm/xe/display/xe_display.h
> @@ -39,6 +39,7 @@ void xe_display_pm_resume(struct xe_device *xe);
>  void xe_display_pm_runtime_suspend(struct xe_device *xe);
>  void xe_display_pm_runtime_suspend_late(struct xe_device *xe);
>  void xe_display_pm_runtime_resume(struct xe_device *xe);
> +bool xe_display_connected(struct xe_device *xe);
>  
>  #else
>  
> @@ -71,5 +72,6 @@ static inline void xe_display_pm_runtime_suspend(struct xe_device *xe) {}
>  static inline void xe_display_pm_runtime_suspend_late(struct xe_device *xe) {}
>  static inline void xe_display_pm_runtime_resume(struct xe_device *xe) {}
>  
> +static inline bool xe_display_connected(struct xe_device *xe) { return false; }
>  #endif /* CONFIG_DRM_XE_DISPLAY */
>  #endif /* _XE_DISPLAY_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 278f2eeeaab6..c84b9b3f7371 100644
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
> @@ -310,6 +311,7 @@ static int pci_acpi_aux_power_setup(struct xe_device *xe)
>  
>  static void xe_pm_vrsr_init(struct xe_device *xe)
>  {
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>  	int ret;
>  
>  	/* Check if platform support D3Cold VRSR */
> @@ -319,6 +321,9 @@ static void xe_pm_vrsr_init(struct xe_device *xe)
>  	if (!xe_pm_vrsr_capable(xe))
>  		return;
>  
> +	if (pdev != vga_default_device() || !xe_display_connected(xe))
> +		return;
> +
>  	/*
>  	 * If the VRSR initialization fails, the device will proceed with the regular
>  	 * D3Cold flow

-- 
Jani Nikula, Intel
