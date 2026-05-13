Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB50DCD37B6
	for <intel-xe@archiver.kernel.org>; Wed, 13 May 2026 09:01:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D25910ED77;
	Wed, 13 May 2026 09:01:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YJjZ2GeC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94AEC10ED7C
 for <intel-xe@lists.freedesktop.org>; Wed, 13 May 2026 09:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778662893; x=1810198893;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=YxXiNkWzLAt3VawUY43FGZZ0gM35YoxRnxcggKOy7sE=;
 b=YJjZ2GeCtWBV5is6+359z7b2Lg7Ri1RhmGJjyVlV1RcEnuAx7xdSVY7H
 yLyOgH3D0AkmOTpLBtXUtio8VRkg2HIPotqFKSg7s2VfpF4nOWUanGush
 s+yRyKaME+pBivr5i0aYAo9BAAWxIZ2nIb/ehqdSBNvQOVPhQCxj4gjB7
 nXQMChc+6D2uHWVHOKCfL8x/PXkss0TYEq1Er5SWAKt9pVUhdA4MBaGX6
 7LtSQySQdhwMTH1/ou9rsbE8EZ+sPopMiUHkO2oYVuP/nlZjjgvG/ZMOs
 2BsfCZNisThOOigFyyYYpiIBOnB3I4YfTYTrx2TA/kJXPvZYFMXwRel8h Q==;
X-CSE-ConnectionGUID: 4s5oxFsmSHOUzK1v1ULAew==
X-CSE-MsgGUID: 7sa4RbVZRUWU1gE+4X0vJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="97010798"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="97010798"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 02:01:33 -0700
X-CSE-ConnectionGUID: Gag/6ykXSh2K/eV1qFoaug==
X-CSE-MsgGUID: AIITmEZ5RwCutq6WB7KiGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="237177322"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.102])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 02:01:31 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 6/7] drm/xe/display: Drop xe_display_driver_set_hooks()
In-Reply-To: <20260512183342.3374-7-michal.wajdeczko@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260512183342.3374-1-michal.wajdeczko@intel.com>
 <20260512183342.3374-7-michal.wajdeczko@intel.com>
Date: Wed, 13 May 2026 12:01:28 +0300
Message-ID: <c6eb4e5f7ef5d04b80b3c7dcf80cfaf9d5e557b1@intel.com>
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
> This function is now no-op.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/xe/display/xe_display.c | 16 ----------------
>  drivers/gpu/drm/xe/display/xe_display.h |  3 +--
>  drivers/gpu/drm/xe/xe_device.c          |  2 --
>  3 files changed, 1 insertion(+), 20 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
> index 7e5382fc161d..d6aea18025af 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.c
> +++ b/drivers/gpu/drm/xe/display/xe_display.c
> @@ -70,22 +70,6 @@ bool xe_display_driver_probe_defer(struct pci_dev *pdev)
>  	return intel_display_driver_probe_defer(pdev);
>  }
>  
> -/**
> - * xe_display_driver_set_hooks - Add driver flags and hooks for display
> - * @driver: DRM device driver
> - *
> - * Set features and function hooks in @driver that are needed for driving the
> - * display IP. This sets the driver's capability of driving display, regardless
> - * if the device has it enabled
> - *
> - * Note: This is called before xe or display device creation.
> - */
> -void xe_display_driver_set_hooks(struct drm_driver *driver)
> -{
> -	if (!xe_modparam.probe_display)
> -		return;
> -}
> -
>  static void unset_display_features(struct xe_device *xe)
>  {
>  	xe->drm.driver_features &= ~XE_DISPLAY_DRIVER_FEATURES;
> diff --git a/drivers/gpu/drm/xe/display/xe_display.h b/drivers/gpu/drm/xe/display/xe_display.h
> index d2b105d5f2a1..60291cb154df 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.h
> +++ b/drivers/gpu/drm/xe/display/xe_display.h
> @@ -17,7 +17,7 @@ struct xe_device;
>  #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
>  
>  bool xe_display_driver_probe_defer(struct pci_dev *pdev);
> -void xe_display_driver_set_hooks(struct drm_driver *driver);
> +
>  int xe_display_driver_fbdev_probe(struct drm_fb_helper *fbh,
>  				  struct drm_fb_helper_surface_size *sizes);
>  
> @@ -56,7 +56,6 @@ void xe_display_pm_runtime_resume(struct xe_device *xe);
>  	.fbdev_probe = NULL
>  
>  static inline int xe_display_driver_probe_defer(struct pci_dev *pdev) { return 0; }
> -static inline void xe_display_driver_set_hooks(struct drm_driver *driver) { }
>  
>  static inline int xe_display_probe(struct xe_device *xe) { return 0; }
>  
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index c053e4d2692f..7519cda3f42c 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -491,8 +491,6 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
>  		driver = &admin_only_driver;
>  #endif
>  
> -	xe_display_driver_set_hooks(driver);
> -
>  	err = aperture_remove_conflicting_pci_devices(pdev, driver->name);
>  	if (err)
>  		return ERR_PTR(err);

-- 
Jani Nikula, Intel
