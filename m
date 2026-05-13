Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFB75CD4851
	for <intel-xe@archiver.kernel.org>; Wed, 13 May 2026 08:56:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FAAE10ED5B;
	Wed, 13 May 2026 08:56:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PKXoTz6w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD7E610ED57
 for <intel-xe@lists.freedesktop.org>; Wed, 13 May 2026 08:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778662560; x=1810198560;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=QJfrEY9qA3PVpKuH1iRY4Tf6L070NezAOKjbX7dSr+c=;
 b=PKXoTz6wSWQ+m7w64U3WHDyd4adLSA9LfyZl8GbB8N0fF6OIMgaDSpbj
 0HLIceNa97bpP+3HGzG7t4Hm0ChtpK+nC6NJYBZ79V2i+k0BuLHl8ANE8
 BNVGkMCs5GnDR3u91UpHWR00uUMUGOIr4bH8ffBWPtvExIHmbnZWoLeaa
 n29qOCP6DUiCX8lew4GkuUGSbkfaakly3jcTdmr/qglCdw0Zb+dg4CQos
 vKqX0w6wMl7oliBV83BMk9ePzE4Pa10e26DkzwVAqbmj5Aod5Ip6s0OdX
 MPevz62RqNnh7EMxc9IMfaB62eHenOWo1BEdZoikbI5sVmWk3NLfFp6Xo w==;
X-CSE-ConnectionGUID: 5yEo4zmxRnSeoR70/9v+rg==
X-CSE-MsgGUID: dV8AbubnRDaV/Pye5ErNtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="67112581"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="67112581"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 01:56:00 -0700
X-CSE-ConnectionGUID: LIvYY3cZT7iUW5TW8EB4qQ==
X-CSE-MsgGUID: Nf85r9F0QJS0JVoKLZhHtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="276138339"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.102])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 01:55:58 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 4/7] drm/xe/display: Add macro with display driver ops
In-Reply-To: <20260512183342.3374-5-michal.wajdeczko@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260512183342.3374-1-michal.wajdeczko@intel.com>
 <20260512183342.3374-5-michal.wajdeczko@intel.com>
Date: Wed, 13 May 2026 11:55:55 +0300
Message-ID: <99f7a5b9b5f7dff28c11821806f0834c2c994057@intel.com>
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
> Instead of updating the drm_driver.fbdev_probe field in the runtime,
> we can use macro which value depends on the actual Kconfig setup.
>
> The hook .fbdev_probe shall not be used until confirmed by enabling
> a DRIVER_MODESET driver feature flag, which still depends on the
> xe_modparam.probe_display parameter.

I don't undestand what you're trying to say with "until confirmed by
enabling ..."

The change itself seems sound.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/xe/display/xe_display.c | 12 ++++++++----
>  drivers/gpu/drm/xe/display/xe_display.h | 11 +++++++++++
>  drivers/gpu/drm/xe/xe_device.c          |  2 ++
>  3 files changed, 21 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
> index 263e92203c9d..7e7d476da8ce 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.c
> +++ b/drivers/gpu/drm/xe/display/xe_display.c
> @@ -85,10 +85,6 @@ void xe_display_driver_set_hooks(struct drm_driver *driver)
>  	if (!xe_modparam.probe_display)
>  		return;
>  
> -#ifdef CONFIG_DRM_FBDEV_EMULATION
> -	driver->fbdev_probe = intel_fbdev_driver_fbdev_probe;
> -#endif
> -
>  	driver->driver_features |= DRIVER_MODESET | DRIVER_ATOMIC;
>  }
>  
> @@ -603,3 +599,11 @@ int xe_display_probe(struct xe_device *xe)
>  	unset_display_features(xe);
>  	return 0;
>  }
> +
> +#ifdef CONFIG_DRM_FBDEV_EMULATION
> +int xe_display_driver_fbdev_probe(struct drm_fb_helper *fbh,
> +				  struct drm_fb_helper_surface_size *sizes)
> +{
> +	return intel_fbdev_driver_fbdev_probe(fbh, sizes);
> +}
> +#endif
> diff --git a/drivers/gpu/drm/xe/display/xe_display.h b/drivers/gpu/drm/xe/display/xe_display.h
> index 95acf0fd8e7b..deec0232532e 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.h
> +++ b/drivers/gpu/drm/xe/display/xe_display.h
> @@ -9,6 +9,8 @@
>  #include <linux/types.h>
>  
>  struct drm_driver;
> +struct drm_fb_helper;
> +struct drm_fb_helper_surface_size;
>  struct pci_dev;
>  struct xe_device;
>  
> @@ -16,6 +18,8 @@ struct xe_device;
>  
>  bool xe_display_driver_probe_defer(struct pci_dev *pdev);
>  void xe_display_driver_set_hooks(struct drm_driver *driver);
> +int xe_display_driver_fbdev_probe(struct drm_fb_helper *fbh,
> +				  struct drm_fb_helper_surface_size *sizes);
>  
>  int xe_display_probe(struct xe_device *xe);
>  
> @@ -40,8 +44,15 @@ void xe_display_pm_runtime_suspend(struct xe_device *xe);
>  void xe_display_pm_runtime_suspend_late(struct xe_device *xe);
>  void xe_display_pm_runtime_resume(struct xe_device *xe);
>  
> +#define XE_DISPLAY_DRIVER_OPS						\
> +	.fbdev_probe = PTR_IF(IS_ENABLED(CONFIG_DRM_FBDEV_EMULATION),	\
> +			      xe_display_driver_fbdev_probe)
> +
>  #else
>  
> +#define XE_DISPLAY_DRIVER_OPS \
> +	.fbdev_probe = NULL
> +
>  static inline int xe_display_driver_probe_defer(struct pci_dev *pdev) { return 0; }
>  static inline void xe_display_driver_set_hooks(struct drm_driver *driver) { }
>  
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 6512f1dfe691..3bca4c1d1d5f 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -414,6 +414,7 @@ static struct drm_driver regular_driver = {
>  	.major = DRIVER_MAJOR,
>  	.minor = DRIVER_MINOR,
>  	.patchlevel = DRIVER_PATCHLEVEL,
> +	XE_DISPLAY_DRIVER_OPS,
>  };
>  
>  #ifdef CONFIG_PCI_IOV
> @@ -435,6 +436,7 @@ static struct drm_driver admin_only_driver = {
>  	.major = DRIVER_MAJOR,
>  	.minor = DRIVER_MINOR,
>  	.patchlevel = DRIVER_PATCHLEVEL,
> +	XE_DISPLAY_DRIVER_OPS,
>  };
>  
>  /**

-- 
Jani Nikula, Intel
