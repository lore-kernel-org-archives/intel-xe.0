Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFB19C61DA4
	for <intel-xe@archiver.kernel.org>; Thu, 16 Feb 2023 13:19:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94F7810E2C7;
	Thu, 16 Feb 2023 13:19:15 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2F9010E2C7
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Feb 2023 13:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676553553; x=1708089553;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=mDsZmjwCCPAb91iJKT5gBc+YpwNAxjWgZPsMx9CmJxk=;
 b=VPwF82MjYGub9ZSUGPQ5iwYpoYxdyFI4+zBnJw97KfXg91tZEpVciTND
 liLscvGeKYiDth7aIPIHSt/UNu2DJTlPYcXa0fgvY5p7E0nqOjHm5Yw8R
 LHjx7VZARWjBts949Dm7g0GSQ5lTtcd8fNAfBrEAW+W9QYP2v5jS/FxFt
 cWPoz+Kw0QWWCnEcMRCA6BEkrWZAw3AgW+aTJ/fnQEhnzefMDRAVAnMVM
 l8aWv4jsRaqezN+tSI32a0KnY8JAjEwl0LcVnxg/6n4oO+I65eo3tMegz
 jxsWKSLj4B/kLmd6vp/qvlj1GWBVchQUK4kf2NzigDoHjwKvhQ9/7HUxz g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="394139865"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; d="scan'208";a="394139865"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 05:19:12 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="915664241"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; d="scan'208";a="915664241"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.155])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 05:19:11 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20230203202742.577659-2-rodrigo.vivi@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230203202742.577659-1-rodrigo.vivi@intel.com>
 <20230203202742.577659-2-rodrigo.vivi@intel.com>
Date: Thu, 16 Feb 2023 15:19:07 +0200
Message-ID: <878rgx21f8.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH 1/6] drm/xe: allow disabling display at
 modprobe time
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, 03 Feb 2023, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
>
> Offer an alternative besides Kconfig parameter to disable display
> when loading the module.

Looks like this display disable stuff ignores the distinction between a)
hardware with display that you want disabled, and b) hardware without
display.

If you have CONFIG_DRM_XE_DISPLAY=n or i915.enabled_display=0 for case
(a), you'll leave the hardware untouched instead of actually disabled,
and you'll keep using power.

See the distinction in i915.

Also, due to the complications, it's likely a good idea to wrap this
stuff:

> +	if (!xe->info.enable_display)
> +		return;
> +

in some macro or function call.

BR,
Jani.



>
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c       | 73 ++++++++++++++++++++++------
>  drivers/gpu/drm/xe/xe_device_types.h |  2 +
>  drivers/gpu/drm/xe/xe_irq.c          | 11 +++--
>  drivers/gpu/drm/xe/xe_pci.c          |  6 ---
>  drivers/gpu/drm/xe/xe_pm.c           | 14 +++++-
>  5 files changed, 78 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 62f54b4806dc..2e1f4beba9b0 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -47,6 +47,10 @@ static bool enable_guc = true;
>  module_param_named_unsafe(enable_guc, enable_guc, bool, 0444);
>  MODULE_PARM_DESC(enable_guc, "Enable GuC submission");
>  
> +static bool enable_display = true;
> +module_param_named(enable_display, enable_display, bool, 0444);
> +MODULE_PARM_DESC(enable_display, "Enable display");
> +
>  static int xe_file_open(struct drm_device *dev, struct drm_file *file)
>  {
>  	struct xe_file *xef;
> @@ -138,15 +142,12 @@ static void xe_driver_release(struct drm_device *dev)
>  	pci_set_drvdata(to_pci_dev(xe->drm.dev), NULL);
>  }
>  
> -static const struct drm_driver driver = {
> +static struct drm_driver driver = {
>  	/* Don't use MTRRs here; the Xserver or userspace app should
>  	 * deal with them for Intel hardware.
>  	 */
>  	.driver_features =
>  	    DRIVER_GEM |
> -#if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> -	    DRIVER_MODESET | DRIVER_ATOMIC |
> -#endif
>  	    DRIVER_RENDER | DRIVER_SYNCOBJ |
>  	    DRIVER_SYNCOBJ_TIMELINE,
>  	.open = xe_file_open,
> @@ -159,9 +160,6 @@ static const struct drm_driver driver = {
>  
>  	.dumb_create = xe_bo_dumb_create,
>  	.dumb_map_offset = drm_gem_ttm_dumb_map_offset,
> -#if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> -	.lastclose = intel_fbdev_restore_mode,
> -#endif
>  	.release = &xe_driver_release,
>  
>  	.ioctls = xe_ioctls,
> @@ -191,6 +189,16 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
>  	struct xe_device *xe;
>  	int err;
>  
> +#if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> +	if (enable_display) {
> +		/* Detect if we need to wait for other drivers early on */
> +		if (intel_modeset_probe_defer(pdev))
> +			return ERR_PTR(EPROBE_DEFER);
> +
> +		driver.driver_features |= DRIVER_MODESET | DRIVER_ATOMIC;
> +		driver.lastclose = intel_fbdev_restore_mode;
> +	}
> +#endif
>  	err = drm_aperture_remove_conflicting_pci_framebuffers(pdev, &driver);
>  	if (err)
>  		return ERR_PTR(err);
> @@ -208,6 +216,7 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
>  	xe->info.devid = pdev->device;
>  	xe->info.revid = pdev->revision;
>  	xe->info.enable_guc = enable_guc;
> +	xe->info.enable_display = enable_display;
>  
>  	spin_lock_init(&xe->irq.lock);
>  
> @@ -267,6 +276,9 @@ static void xe_device_fini_display_nommio(struct drm_device *dev, void *dummy)
>  {
>  	struct xe_device *xe = to_xe_device(dev);
>  
> +	if (!xe->info.enable_display)
> +		return;
> +
>  	intel_power_domains_cleanup(xe);
>  }
>  #endif
> @@ -276,6 +288,9 @@ static int xe_device_init_display_nommio(struct xe_device *xe)
>  #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
>  	int err;
>  
> +	if (!xe->info.enable_display)
> +		return 0;
> +
>  	/* This must be called before any calls to HAS_PCH_* */
>  	intel_detect_pch(xe);
>  	intel_display_irq_init(xe);
> @@ -297,6 +312,9 @@ static void xe_device_fini_display_noirq(struct drm_device *dev, void *dummy)
>  {
>  	struct xe_device *xe = to_xe_device(dev);
>  
> +	if (!xe->info.enable_display)
> +		return;
> +
>  	intel_modeset_driver_remove_noirq(xe);
>  	intel_power_domains_driver_remove(xe);
>  }
> @@ -307,6 +325,9 @@ static int xe_device_init_display_noirq(struct xe_device *xe)
>  #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
>  	int err;
>  
> +	if (!xe->info.enable_display)
> +		return 0;
> +
>  	/* Early display init.. */
>  	intel_opregion_setup(xe);
>  
> @@ -342,6 +363,9 @@ static void xe_device_fini_display_noaccel(struct drm_device *dev, void *dummy)
>  {
>  	struct xe_device *xe = to_xe_device(dev);
>  
> +	if (!xe->info.enable_display)
> +		return;
> +
>  	intel_modeset_driver_remove_nogem(xe);
>  }
>  #endif
> @@ -349,7 +373,12 @@ static void xe_device_fini_display_noaccel(struct drm_device *dev, void *dummy)
>  static int xe_device_init_display_noaccel(struct xe_device *xe)
>  {
>  #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> -	int err = intel_modeset_init_nogem(xe);
> +	int err;
> +
> +	if (!xe->info.enable_display)
> +		return 0;
> +
> +	err = intel_modeset_init_nogem(xe);
>  	if (err)
>  		return err;
>  
> @@ -362,6 +391,9 @@ static int xe_device_init_display_noaccel(struct xe_device *xe)
>  static int xe_device_init_display(struct xe_device *xe)
>  {
>  #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> +	if (!xe->info.enable_display)
> +		return 0;
> +
>  	return intel_modeset_init(xe);
>  #else
>  	return 0;
> @@ -371,6 +403,9 @@ static int xe_device_init_display(struct xe_device *xe)
>  static void xe_device_unlink_display(struct xe_device *xe)
>  {
>  #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> +	if (!xe->info.enable_display)
> +		return;
> +
>  	/* poll work can call into fbdev, hence clean that up afterwards */
>  	intel_hpd_poll_fini(xe);
>  	intel_fbdev_fini(xe);
> @@ -469,9 +504,11 @@ int xe_device_probe(struct xe_device *xe)
>  		goto err_irq_shutdown;
>  
>  #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> -	intel_display_driver_register(xe);
> -	intel_register_dsm_handler();
> -	intel_power_domains_enable(xe);
> +	if (xe->info.enable_display) {
> +		intel_display_driver_register(xe);
> +		intel_register_dsm_handler();
> +		intel_power_domains_enable(xe);
> +	}
>  #endif
>  
>  	xe_debugfs_register(xe);
> @@ -484,7 +521,8 @@ int xe_device_probe(struct xe_device *xe)
>  
>  err_fini_display:
>  #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> -	intel_modeset_driver_remove(xe);
> +	if (xe->info.enable_display)
> +		intel_modeset_driver_remove(xe);
>  #endif
>  err_irq_shutdown:
>  	xe_irq_shutdown(xe);
> @@ -496,14 +534,17 @@ int xe_device_probe(struct xe_device *xe)
>  static void xe_device_remove_display(struct xe_device *xe)
>  {
>  #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> -	intel_unregister_dsm_handler();
> -	intel_power_domains_disable(xe);
> -	intel_display_driver_unregister(xe);
> +	if (xe->info.enable_display) {
> +		intel_unregister_dsm_handler();
> +		intel_power_domains_disable(xe);
> +		intel_display_driver_unregister(xe);
> +	}
>  #endif
>  
>  	drm_dev_unplug(&xe->drm);
>  #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> -	intel_modeset_driver_remove(xe);
> +	if (xe->info.enable_display)
> +		intel_modeset_driver_remove(xe);
>  #endif
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index a8d48987b2d8..6c71e1b2dbf4 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -96,6 +96,8 @@ struct xe_device {
>  		bool has_4tile;
>  		/** @has_range_tlb_invalidation: Has range based TLB invalidations */
>  		bool has_range_tlb_invalidation;
> +		/** @enable_display: display enabled */
> +		bool enable_display;
>  
>  		struct xe_device_display_info {
>  			u8 ver;
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index f978bdfda99b..e1cc057f50ba 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -299,7 +299,7 @@ static irqreturn_t gen11_irq_handler(int irq, void *arg)
>  	gen11_gt_irq_handler(xe, gt, master_ctl, intr_dw, identity);
>  
>  #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> -	if (master_ctl & GEN11_DISPLAY_IRQ)
> +	if (xe->info.enable_display && (master_ctl & GEN11_DISPLAY_IRQ))
>  		gen11_display_irq_handler(xe);
>  #endif
>  
> @@ -308,7 +308,7 @@ static irqreturn_t gen11_irq_handler(int irq, void *arg)
>  	gen11_intr_enable(gt, false);
>  
>  #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> -	if (gu_misc_iir & GEN11_GU_MISC_GSE)
> +	if (xe->info.enable_display && (gu_misc_iir & GEN11_GU_MISC_GSE))
>  		intel_opregion_asle_intr(xe);
>  #endif
>  
> @@ -403,7 +403,7 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
>  	dg1_intr_enable(xe, false);
>  
>  #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> -	if (gu_misc_iir & GEN11_GU_MISC_GSE)
> +	if (xe->info.enable_display && (gu_misc_iir & GEN11_GU_MISC_GSE))
>  		intel_opregion_asle_intr(xe);
>  #endif
>  
> @@ -488,7 +488,8 @@ void xe_irq_reset(struct xe_device *xe)
>  		}
>  	}
>  #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> -	gen11_display_irq_reset(xe);
> +	if (xe->info.enable_display)
> +		gen11_display_irq_reset(xe);
>  #endif
>  }
>  
> @@ -504,7 +505,7 @@ void xe_gt_irq_postinstall(struct xe_gt *gt)
>  		drm_err(&xe->drm, "No interrupt postinstall hook");
>  
>  #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> -	if (gt->info.id == XE_GT0)
> +	if (xe->info.enable_display && (gt->info.id == XE_GT0))
>  		gen11_display_irq_postinstall(gt_to_xe(gt));
>  #endif
>  }
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 927a050f3b8f..1d5b6afed2c3 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -476,12 +476,6 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  		return -ENODEV;
>  	}
>  
> -#if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> -	/* Detect if we need to wait for other drivers early on */
> -	if (intel_modeset_probe_defer(pdev))
> -		return -EPROBE_DEFER;
> -#endif
> -
>  	xe = xe_device_create(pdev, ent);
>  	if (IS_ERR(xe))
>  		return PTR_ERR(xe);
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index ddfd884796ba..4b3a1d8a8adf 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -52,7 +52,7 @@ static void intel_suspend_encoders(struct xe_device *xe)
>  	struct drm_device *dev = &xe->drm;
>  	struct intel_encoder *encoder;
>  
> -	if (!xe->info.display.pipe_mask)
> +	if (!xe->info.enable_display || !xe->info.display.pipe_mask)
>  		return;
>  
>  	drm_modeset_lock_all(dev);
> @@ -66,6 +66,9 @@ static void intel_suspend_encoders(struct xe_device *xe)
>  static void xe_pm_display_suspend(struct xe_device *xe)
>  {
>  #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> +	if (!xe->info.enable_display)
> +		return;
> +
>  	/* We do a lot of poking in a lot of registers, make sure they work
>  	 * properly. */
>  	intel_power_domains_disable(xe);
> @@ -91,6 +94,9 @@ static void xe_pm_display_suspend(struct xe_device *xe)
>  static void xe_pm_display_suspend_late(struct xe_device *xe)
>  {
>  #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> +	if (!xe->info.enable_display)
> +		return;
> +
>  	intel_power_domains_suspend(xe, I915_DRM_SUSPEND_MEM);
>  
>  	intel_display_power_suspend_late(xe);
> @@ -100,6 +106,9 @@ static void xe_pm_display_suspend_late(struct xe_device *xe)
>  static void xe_pm_display_resume_early(struct xe_device *xe)
>  {
>  #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> +	if (!xe->info.enable_display)
> +		return;
> +
>  	intel_display_power_resume_early(xe);
>  
>  	intel_power_domains_resume(xe);
> @@ -109,6 +118,9 @@ static void xe_pm_display_resume_early(struct xe_device *xe)
>  static void xe_pm_display_resume(struct xe_device *xe)
>  {
>  #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> +	if (!xe->info.enable_display)
> +		return;
> +
>  	intel_dmc_ucode_resume(xe);
>  
>  	if (xe->info.display.pipe_mask)

-- 
Jani Nikula, Intel Open Source Graphics Center
