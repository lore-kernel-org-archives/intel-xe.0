Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D57BCA9EC5
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 15:09:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2734110E437;
	Mon, 12 Oct 2026 15:09:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79B4B10E437
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 15:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791817759; x=1823353759;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=u2ylalUTXT8ltBwocpYQMxy5L4c/jjlv/JltkYYonrM=;
 b=oKD8krPcTR6D39fmvLiJtYngduwDmFwZczY4ZrXQ4GHrqojlg/NKPvSV
 vWSRpbKPjRthitsmxA83V0aD+4wViyI1Dbh3Kud5BV3l/xYCGlJeohLUT
 o1IcYwMa24Iy674Y4cUbwhr0LNORX8ln5zBY3QN8Mr2NSRD11059uPNSj
 HESPvR8rtcV43y/H3VUFPcxt5bUGxkbJHd5QKClOTPbM6pKd110IRW3kJ
 99J+rlRyF8MIBZCPsLajHueU1ZQ9CroBk7RWCCgk2oEH9jYTYwJZU6JBG
 CGE3VD0DYbNG6EWIjE4Wt5wBYubR2BVmGPNLG+56chIqikYfFnzVGMkWW w==;
X-CSE-ConnectionGUID: G4BhSZ5/TJar4m3IK/W8yg==
X-CSE-MsgGUID: /Q7Yfiq/Tx2vEfd+KdCXQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="407134"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="407134"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 08:09:18 -0700
X-CSE-ConnectionGUID: bTiU2+YbTpe5Merv0ncwzQ==
X-CSE-MsgGUID: 3/Gqup2ORw+8E3dCAOhnJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="834862"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 08:09:16 -0700
Date: Mon, 12 Oct 2026 17:09:13 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, michal.wajdeczko@intel.com,
 lukasz.laguna@intel.com, matthew.d.roper@intel.com,
 matthew.brost@intel.com, mallesh.koujalagi@intel.com,
 rodrigo.vivi@intel.com
Subject: Re: [PATCH v4 3/5] drm/xe: Make xe_device_declare_wedged() IRQ safe
Message-ID: <asz4GazPFrdggzig@black.igk.intel.com>
References: <20261010090718.68308-1-raag.jadav@intel.com>
 <20261010090718.68308-4-raag.jadav@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261010090718.68308-4-raag.jadav@intel.com>
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

On Sat, Oct 10, 2026 at 02:36:20PM +0530, Raag Jadav wrote:
> Currently, xe_device_declare_wedged() implementation wedges the GTs and
> sends wedged uevent to userspace. This is problematic for usecases which
> require declaring the device as wedged in IRQ context, as it allocates
> memory for event buffer and acquires mutexes deep into it's call path.
> 
> Fix this by deferring wedge handling into its dedicated worker, so that
> xe_device_declare_wedged() can be called in IRQ context.
> 
> First user of this requirement is introduced in commit def675cf3f10
> ("drm/xe/mert: Improve handling of MERT CAT errors"), which declares the
> device as wedged on catastrophic errors received in form of an IRQ.

I just realized that this is fundamentally flawed. IRQ just means the
device is in D0 state and doesn't necessarily indicate non-zero refcount
which is a prerequisite for xe_device_declare_wedged() call.

I'll be dropping this patch in next revision but the rest of the series
still needs to land for other long standing stable fixes and debt cleanup.

Raag

> Fixes: def675cf3f10 ("drm/xe/mert: Improve handling of MERT CAT errors")
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
> v2: Split fixes into separate patches (Rodrigo, Michal)
> ---
>  drivers/gpu/drm/xe/xe_device.c       | 51 +++++++++++++++++-----------
>  drivers/gpu/drm/xe/xe_device_types.h |  2 ++
>  2 files changed, 34 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 6ae1da578bda..2a7794aa71f9 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -697,8 +697,16 @@ static int xe_device_vram_alloc(struct xe_device *xe)
>  	return 0;
>  }
>  
> +static void wedged_work(struct work_struct *work);
>  static void xe_device_wedged_fini(struct drm_device *drm, void *arg);
>  
> +static int xe_device_wedged_init(struct xe_device *xe)
> +{
> +	INIT_WORK(&xe->wedged.work, wedged_work);
> +
> +	return drmm_add_action_or_reset(&xe->drm, xe_device_wedged_fini, xe);
> +}
> +
>  /**
>   * xe_device_probe_early: Device early probe
>   * @xe: xe device instance
> @@ -767,7 +775,7 @@ int xe_device_probe_early(struct xe_device *xe)
>  	if (err)
>  		return err;
>  
> -	err = drmm_add_action_or_reset(&xe->drm, xe_device_wedged_fini, xe);
> +	err = xe_device_wedged_init(xe);
>  	if (err)
>  		return err;
>  
> @@ -1392,6 +1400,26 @@ void xe_device_set_wedged_method(struct xe_device *xe, unsigned long method)
>  	xe->wedged.method = method;
>  }
>  
> +static void wedged_work(struct work_struct *work)
> +{
> +	struct xe_device *xe = container_of(work, struct xe_device, wedged.work);
> +
> +	/*
> +	 * XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET is intended for debugging
> +	 * hangs, so wedge the device with 'none' recovery method and have
> +	 * it available to the user for debugging.
> +	 */
> +	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
> +		xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_NONE);
> +	/* If no wedge recovery method is set, use default */
> +	else if (!xe->wedged.method)
> +		xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_REBIND |
> +					    DRM_WEDGE_RECOVERY_BUS_RESET);
> +
> +	/* Notify userspace of wedged device */
> +	drm_dev_wedged_event(&xe->drm, xe->wedged.method, NULL);
> +}
> +
>  #define WEDGED_URL	"https://docs.kernel.org/gpu/drm-uapi.html#device-wedging"
>  #define XE_BUG_URL	"https://gitlab.freedesktop.org/drm/xe/kernel/issues/new"
>  
> @@ -1432,26 +1460,11 @@ void xe_device_declare_wedged(struct xe_device *xe)
>  			    "For recovery procedure, refer to %s\n"
>  			    "Please file a _new_ bug report at %s\n",
>  			    WEDGED_URL, XE_BUG_URL);
> -	}
>  
> -	for_each_initialized_gt(gt, xe, id)
> -		xe_gt_declare_wedged(gt);
> +		for_each_initialized_gt(gt, xe, id)
> +			xe_gt_declare_wedged(gt);
>  
> -	if (xe_device_wedged(xe)) {
> -		/*
> -		 * XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET is intended for debugging
> -		 * hangs, so wedge the device with 'none' recovery method and have
> -		 * it available to the user for debugging.
> -		 */
> -		if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
> -			xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_NONE);
> -		/* If no wedge recovery method is set, use default */
> -		else if (!xe->wedged.method)
> -			xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_REBIND |
> -						    DRM_WEDGE_RECOVERY_BUS_RESET);
> -
> -		/* Notify userspace of wedged device */
> -		drm_dev_wedged_event(&xe->drm, xe->wedged.method, NULL);
> +		schedule_work(&xe->wedged.work);
>  	}
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 4e0e1bc040c1..ec5c1f0b8f00 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -547,6 +547,8 @@ struct xe_device {
>  		unsigned long method;
>  		/** @wedged.inconsistent_reset: Inconsistent reset policy state between GTs */
>  		bool inconsistent_reset;
> +		/** @wedged.work: Worker for wedge handling */
> +		struct work_struct work;
>  	} wedged;
>  
>  	/** @devres_group: devres group */
> -- 
> 2.43.0
> 
