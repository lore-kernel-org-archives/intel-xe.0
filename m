Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E61DCD37B6
	for <intel-xe@archiver.kernel.org>; Wed, 13 May 2026 09:01:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A9CF10ED7C;
	Wed, 13 May 2026 09:01:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ATESTZIa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D93288FF9
 for <intel-xe@lists.freedesktop.org>; Wed, 13 May 2026 09:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778662876; x=1810198876;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=uuaGwAZnCSfqThwRszXSmYKtjw2kcPQmHi51WE7TOcc=;
 b=ATESTZIa+/9EvhZQ4o8sML0LEdp3TdNuwmc7kX2eZBqhO0TLVJOS0Z8C
 cWuSge/rES98VFZvM7SGxaLh8KA1bHq/89UVuaPl2NhYODUF5IMO/1Ob6
 +nNML3hEvNha2eQ19gjGJ3Z/tcswCAnDBlMBkzowJfGqUTM3q15V8mec/
 lA4gxwwfkXrkUi4S5bYPJE+DrZ1kh87cKmjt1hJ7biZ7JGrCBLZmaPpRr
 7Uhrt43aIOEqlk5NRp90fKwwYdtmWbwV2OCsPeYmhR+4LX+xA0j3EyrAG
 /8Nhbu/1HDq8MDWdKTZlV2IOH3cTV3U9hi8lIfllQTOkCtiJmPeHA8zCl w==;
X-CSE-ConnectionGUID: agH7E9VJRYCz0v9FI+x3/A==
X-CSE-MsgGUID: M02i7jr6ST2ynIOLNTI+ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="97010761"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="97010761"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 02:01:16 -0700
X-CSE-ConnectionGUID: /X9ZC/qDRXyd5SKsLXpT0Q==
X-CSE-MsgGUID: QsH+DFYLTq66yYWGdZyMWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="237177149"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.102])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 02:01:13 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 5/7] drm/xe/display: Add macro with display driver features
In-Reply-To: <20260512183342.3374-6-michal.wajdeczko@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260512183342.3374-1-michal.wajdeczko@intel.com>
 <20260512183342.3374-6-michal.wajdeczko@intel.com>
Date: Wed, 13 May 2026 12:01:10 +0300
Message-ID: <5d63ad6cc5927dace0d0af7dc62eaafce62fcef0@intel.com>
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

On Tue, 12 May 2026, Michal Wajdeczko <michal.wajdeczko@intel.com> wrote:
> Instead of updating drm_driver.driver_features in the runtime, we
> can use macro which value depends on the CONFIG_DRM_XE_DISPLAY.
>
> And if display support is later disabled by the xe_modparam then we
> will clear related bits in the drm_device.driver_features instead.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/xe/display/xe_display.c | 4 +---
>  drivers/gpu/drm/xe/display/xe_display.h | 2 ++
>  drivers/gpu/drm/xe/xe_device.c          | 2 ++
>  3 files changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
> index 7e7d476da8ce..7e5382fc161d 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.c
> +++ b/drivers/gpu/drm/xe/display/xe_display.c
> @@ -84,13 +84,11 @@ void xe_display_driver_set_hooks(struct drm_driver *driver)
>  {
>  	if (!xe_modparam.probe_display)
>  		return;
> -
> -	driver->driver_features |= DRIVER_MODESET | DRIVER_ATOMIC;

This is also bonkers, because it modifies the driver for *all* devices.

I think the patch subject downplays the actual change, but *shrug*.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

>  }
>  
>  static void unset_display_features(struct xe_device *xe)
>  {
> -	xe->drm.driver_features &= ~(DRIVER_MODESET | DRIVER_ATOMIC);
> +	xe->drm.driver_features &= ~XE_DISPLAY_DRIVER_FEATURES;
>  }
>  
>  static void xe_display_fini_early(void *arg)
> diff --git a/drivers/gpu/drm/xe/display/xe_display.h b/drivers/gpu/drm/xe/display/xe_display.h
> index deec0232532e..d2b105d5f2a1 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.h
> +++ b/drivers/gpu/drm/xe/display/xe_display.h
> @@ -44,12 +44,14 @@ void xe_display_pm_runtime_suspend(struct xe_device *xe);
>  void xe_display_pm_runtime_suspend_late(struct xe_device *xe);
>  void xe_display_pm_runtime_resume(struct xe_device *xe);
>  
> +#define XE_DISPLAY_DRIVER_FEATURES	(DRIVER_MODESET | DRIVER_ATOMIC)
>  #define XE_DISPLAY_DRIVER_OPS						\
>  	.fbdev_probe = PTR_IF(IS_ENABLED(CONFIG_DRM_FBDEV_EMULATION),	\
>  			      xe_display_driver_fbdev_probe)
>  
>  #else
>  
> +#define XE_DISPLAY_DRIVER_FEATURES	0
>  #define XE_DISPLAY_DRIVER_OPS \
>  	.fbdev_probe = NULL
>  
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 3bca4c1d1d5f..c053e4d2692f 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -393,6 +393,7 @@ bool xe_is_xe_file(const struct file *file)
>  
>  static struct drm_driver regular_driver = {
>  	.driver_features =
> +	    XE_DISPLAY_DRIVER_FEATURES |
>  	    DRIVER_GEM |
>  	    DRIVER_RENDER | DRIVER_SYNCOBJ |
>  	    DRIVER_SYNCOBJ_TIMELINE | DRIVER_GEM_GPUVA,
> @@ -425,6 +426,7 @@ static const struct drm_ioctl_desc xe_ioctls_admin_only[] = {
>  
>  static struct drm_driver admin_only_driver = {
>  	.driver_features =
> +	    XE_DISPLAY_DRIVER_FEATURES |
>  	    DRIVER_GEM | DRIVER_RENDER | DRIVER_GEM_GPUVA,
>  	.open = xe_file_open,
>  	.postclose = xe_file_close,

-- 
Jani Nikula, Intel
