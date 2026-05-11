Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33861CD37B2
	for <intel-xe@archiver.kernel.org>; Mon, 11 May 2026 15:36:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8DC610E7D2;
	Mon, 11 May 2026 15:36:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VjcalQsS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D55710E1C7
 for <intel-xe@lists.freedesktop.org>; Mon, 11 May 2026 15:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778513804; x=1810049804;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=c59nkCZY9wHNk1cBnMsqCNQ+lqwBZwKNowQjtoHuGlw=;
 b=VjcalQsS4zl1UF+Fk9ZcvGZTvVKkEJJp56z8nQpnk9o522E+kvOPnJXd
 1BdyNQVSenZx9dDS3xk5fkLli1UP0pzgZXlZ3rzY9+rxqQwbjH5eQXe0+
 0VuGlnPIPonwmntP5N1eXFC6h6MlqWx8oKe/5PwOhhsE49KCvuuDBzNl5
 BQfEHr2FvzkwomQByNBoQwXaEHijjpll2nk6CpqFpw+Fp7SbEGBWaJC9J
 fP029bIUjgfnZM7k2EyApWlDQh8X4M4bjFHJCO9MJkwDuZiup1s9X/bNq
 mrA2XmlZsraKoTZPcpDbmIP0bM6Xj1iu4Zs5LIBNbe1SpxXcYz59Eg5qr Q==;
X-CSE-ConnectionGUID: 9QvVbAlAQaaWLf8/fxJCKw==
X-CSE-MsgGUID: Ek3lMuvZQNezZ/M7eR7N6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="79301667"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="79301667"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 08:36:43 -0700
X-CSE-ConnectionGUID: /bamricoT3OoN04UGhjoUQ==
X-CSE-MsgGUID: hayqbOeRR3+JLSss5xCvNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="267845696"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 08:36:41 -0700
Date: Mon, 11 May 2026 17:36:37 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Anoop Vijay <anoop.c.vijay@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH v5 5/6] drm/xe/xe_ras: Move xe drm_ras registration
Message-ID: <agH3hTQGzVBUI7Dz@black.igk.intel.com>
References: <20260504065614.3832331-8-riana.tauro@intel.com>
 <20260504065614.3832331-13-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260504065614.3832331-13-riana.tauro@intel.com>
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

On Mon, May 04, 2026 at 12:26:20PM +0530, Riana Tauro wrote:
> Move xe drm_ras registration to RAS initialization flow and keep
> hardware error initialization for processing errors reported
> via irq.
> 
> Also reorder soc remapper and system controller initialization to
> early probe as ras init is dependent on both.
> 
> Cc: Anoop Vijay <anoop.c.vijay@intel.com>
> Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c   | 19 +++++++++++--------
>  drivers/gpu/drm/xe/xe_hw_error.c | 13 -------------
>  drivers/gpu/drm/xe/xe_ras.c      | 20 ++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_ras.h      |  1 +
>  4 files changed, 32 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 4b45b617a039..041af7ffc8bb 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -62,6 +62,7 @@
>  #include "xe_psmi.h"
>  #include "xe_pxp.h"
>  #include "xe_query.h"
> +#include "xe_ras.h"
>  #include "xe_shrinker.h"
>  #include "xe_soc_remapper.h"
>  #include "xe_survivability_mode.h"
> @@ -962,6 +963,16 @@ int xe_device_probe(struct xe_device *xe)
>  	if (err)
>  		return err;
>  
> +	err = xe_soc_remapper_init(xe);
> +	if (err)
> +		return err;
> +
> +	err = xe_sysctrl_init(xe);
> +	if (err)
> +		return err;
> +
> +	xe_ras_init(xe);
> +
>  	/*
>  	 * Now that GT is initialized (TTM in particular),
>  	 * we can try to init display, and inherit the initial fb.
> @@ -1002,10 +1013,6 @@ int xe_device_probe(struct xe_device *xe)
>  
>  	xe_nvm_init(xe);
>  
> -	err = xe_soc_remapper_init(xe);
> -	if (err)
> -		return err;
> -
>  	err = xe_heci_gsc_init(xe);
>  	if (err)
>  		return err;
> @@ -1044,10 +1051,6 @@ int xe_device_probe(struct xe_device *xe)
>  	if (err)
>  		goto err_unregister_display;
>  
> -	err = xe_sysctrl_init(xe);
> -	if (err)
> -		goto err_unregister_display;
> -
>  	err = xe_device_sysfs_init(xe);
>  	if (err)
>  		goto err_unregister_display;
> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
> index 2a31b430570e..c6836957dca7 100644
> --- a/drivers/gpu/drm/xe/xe_hw_error.c
> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
> @@ -518,14 +518,6 @@ void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl)
>  	}
>  }
>  
> -static int hw_error_info_init(struct xe_device *xe)
> -{
> -	if (xe->info.platform != XE_PVC)
> -		return 0;
> -
> -	return xe_drm_ras_init(xe);
> -}
> -
>  /*
>   * Process hardware errors during boot
>   */
> @@ -552,16 +544,11 @@ static void process_hw_errors(struct xe_device *xe)
>  void xe_hw_error_init(struct xe_device *xe)
>  {
>  	struct xe_tile *tile = xe_device_get_root_tile(xe);
> -	int ret;
>  
>  	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe))
>  		return;
>  
>  	INIT_WORK(&tile->csc_hw_error_work, csc_hw_error_work);
>  
> -	ret = hw_error_info_init(xe);
> -	if (ret)
> -		drm_err(&xe->drm, "Failed to initialize XE DRM RAS (%pe)\n", ERR_PTR(ret));
> -
>  	process_hw_errors(xe);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 07f6837694e7..7d2945bb819e 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -4,6 +4,7 @@
>   */
>  
>  #include "xe_device.h"
> +#include "xe_drm_ras.h"
>  #include "xe_pm.h"
>  #include "xe_printk.h"
>  #include "xe_ras.h"
> @@ -258,3 +259,22 @@ int xe_ras_clear_counter(struct xe_device *xe, enum drm_xe_ras_error_severity se
>  
>  	return ret;
>  }
> +
> +/**
> + * xe_ras_init - Initialize Xe RAS
> + * @xe: xe device instance
> + *
> + * Initialize Xe RAS
> + */
> +void xe_ras_init(struct xe_device *xe)
> +{
> +	int ret;
> +
> +	if (xe->info.platform != XE_PVC)
> +		return;
> +
> +	ret = xe_drm_ras_init(xe);
> +	if (ret)
> +		drm_err(&xe->drm, "Failed to initialize xe_drm_ras %d\n", ret);

Do we need this? xe_drm_ras_init() already does it for us.

Raag

> +}
> +
> diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
> index bbb9d42bd128..a06fb67dc882 100644
> --- a/drivers/gpu/drm/xe/xe_ras.h
> +++ b/drivers/gpu/drm/xe/xe_ras.h
> @@ -17,5 +17,6 @@ int xe_ras_get_counter(struct xe_device *xe, enum drm_xe_ras_error_severity seve
>  		       u32 error_id, u32 *value);
>  int xe_ras_clear_counter(struct xe_device *xe, enum drm_xe_ras_error_severity severity,
>  			 u32 error_id);
> +void xe_ras_init(struct xe_device *xe);
>  
>  #endif
> -- 
> 2.47.1
> 
