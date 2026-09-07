Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64CF7C79F89
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 07:53:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2318410E69F;
	Mon,  7 Sep 2026 07:53:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jLoe0iFD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26EAE10E69F
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Sep 2026 07:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788767595; x=1820303595;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Pi8fQABqZaQZWrrOe6m+u/A79BYIyWBhEnm55p3R6Rs=;
 b=jLoe0iFDgX8LaPTpqYCn30GRj/NQJ+jvDmFcL6c/aynent+VwYUlBn0D
 DQGD5+tLb7Ed9hOs72OKSvEOgoguxWQi43X1zs7LuHDXSSFSGBGTzwvy0
 l54g0ALO1U6ATqZjbpccCN69NguMq70JrKcVS7qJ91bvBh3rzz8S6DC4C
 YJztsjuAyBE4Lfh9FXIMNcwBMUDOCqg6D4VV7mM3mk0nOswbCdVIsYPdE
 HxIfrBRin86XZCX7raiXIYdRWLheKhlHd6eEtKwJQNkPW1t411oPPdl8I
 ESvVnFF63+X2Bvkqu7w3wRFxFXwbg0oLUPVHrYUORmAbiRsgKbRhOWpT8 Q==;
X-CSE-ConnectionGUID: FbHCp+HDS/eSU2pYDF5xLw==
X-CSE-MsgGUID: qSr1Up30Q8adWlwhq7ejGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="99499413"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="99499413"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 00:53:15 -0700
X-CSE-ConnectionGUID: qA+4pPYWQ/yl8R3GApdX8w==
X-CSE-MsgGUID: xa1ktoMZTU+g3LcNlplKxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="272572898"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 00:53:12 -0700
Date: Mon, 7 Sep 2026 09:53:10 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: "Laguna, Lukasz" <lukasz.laguna@intel.com>
Cc: intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 matthew.brost@intel.com, rodrigo.vivi@intel.com
Subject: Re: [PATCH v2 4/5] drm/xe/debugfs: Consolidate wedged_mode debt into
 xe_wedge
Message-ID: <ap5tZj9I6hNtPlYd@black.igk.intel.com>
References: <20260831042633.1760474-1-raag.jadav@intel.com>
 <20260831042633.1760474-5-raag.jadav@intel.com>
 <87ca1466-be15-4417-9ff2-16715365fedf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87ca1466-be15-4417-9ff2-16715365fedf@intel.com>
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

On Mon, Sep 07, 2026 at 09:24:19AM +0200, Laguna, Lukasz wrote:
> On 8/31/2026 06:25, Raag Jadav wrote:
> > Now that we have a dedicated xe_wedge component, cleanup all wedged_mode
> > implementation and move it to xe_wedge for better maintainability.
> > 
> > No functional impact.
> > 
> > Suggested-by: Lukasz Laguna <lukasz.laguna@intel.com>
> > Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_debugfs.c      | 65 +-------------------
> >   drivers/gpu/drm/xe/xe_device_types.h | 30 +--------
> >   drivers/gpu/drm/xe/xe_wedge.c        | 91 ++++++++++++++++++++++++----
> >   drivers/gpu/drm/xe/xe_wedge.h        |  3 +-
> >   drivers/gpu/drm/xe/xe_wedge_types.h  | 45 ++++++++++++++
> >   5 files changed, 131 insertions(+), 103 deletions(-)
> >   create mode 100644 drivers/gpu/drm/xe/xe_wedge_types.h
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> > index 28135f84e286..9caeb357b865 100644
> > --- a/drivers/gpu/drm/xe/xe_debugfs.c
> > +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> > @@ -18,8 +18,6 @@
> >   #include "xe_force_wake.h"
> >   #include "xe_gt.h"
> >   #include "xe_gt_debugfs.h"
> > -#include "xe_gt_printk.h"
> > -#include "xe_guc_ads.h"
> >   #include "xe_hw_engine.h"
> >   #include "xe_mmio.h"
> >   #include "xe_pagefault.h"
> > @@ -34,6 +32,7 @@
> >   #include "xe_tile_debugfs.h"
> >   #include "xe_vsec.h"
> >   #include "xe_wa.h"
> > +#include "xe_wedge.h"
> >   #ifdef CONFIG_DRM_XE_DEBUG
> >   #include "xe_bo_evict.h"
> > @@ -374,58 +373,6 @@ static ssize_t wedged_mode_show(struct file *f, char __user *ubuf,
> >   	return simple_read_from_buffer(ubuf, size, pos, buf, len);
> >   }
> > -static int __wedged_mode_set_reset_policy(struct xe_gt *gt, enum xe_wedged_mode mode)
> > -{
> > -	bool enable_engine_reset;
> > -	int ret;
> > -
> > -	enable_engine_reset = (mode != XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET);
> > -	ret = xe_guc_ads_scheduler_policy_toggle_reset(&gt->uc.guc.ads,
> > -						       enable_engine_reset);
> > -	if (ret)
> > -		xe_gt_err(gt, "Failed to update GuC ADS scheduler policy (%pe)\n", ERR_PTR(ret));
> > -
> > -	return ret;
> > -}
> > -
> > -static int wedged_mode_set_reset_policy(struct xe_device *xe, enum xe_wedged_mode mode)
> > -{
> > -	struct xe_gt *gt;
> > -	int ret;
> > -	u8 id;
> > -
> > -	guard(xe_pm_runtime)(xe);
> > -	for_each_gt(gt, xe, id) {
> > -		ret = __wedged_mode_set_reset_policy(gt, mode);
> > -		if (ret) {
> > -			if (id > 0) {
> > -				xe->wedged.inconsistent_reset = true;
> > -				drm_err(&xe->drm, "Inconsistent reset policy state between GTs\n");
> > -			}
> > -			return ret;
> > -		}
> > -	}
> > -
> > -	xe->wedged.inconsistent_reset = false;
> > -
> > -	return 0;
> > -}
> > -
> > -static bool wedged_mode_needs_policy_update(struct xe_device *xe, enum xe_wedged_mode mode)
> > -{
> > -	if (xe->wedged.inconsistent_reset)
> > -		return true;
> > -
> > -	if (xe->wedged.mode == mode)
> > -		return false;
> > -
> > -	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET ||
> > -	    mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
> > -		return true;
> > -
> > -	return false;
> > -}
> > -
> >   static ssize_t wedged_mode_set(struct file *f, const char __user *ubuf,
> >   			       size_t size, loff_t *pos)
> >   {
> > @@ -437,18 +384,10 @@ static ssize_t wedged_mode_set(struct file *f, const char __user *ubuf,
> >   	if (ret)
> >   		return ret;
> > -	ret = xe_device_validate_wedged_mode(xe, wedged_mode);
> > +	ret = xe_wedge_set_mode(xe, wedged_mode);
> >   	if (ret)
> >   		return ret;
> > -	if (wedged_mode_needs_policy_update(xe, wedged_mode)) {
> > -		ret = wedged_mode_set_reset_policy(xe, wedged_mode);
> > -		if (ret)
> > -			return ret;
> > -	}
> > -
> > -	xe->wedged.mode = wedged_mode;
> > -
> >   	return size;
> >   }
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > index 7d83f79f27f4..2b7114e9fee1 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> 
> Shouldn't this be moved in the previous patch "drm/xe: Introduce xe_wedge"?

That's what I did locally but it results in a huge patch that's hard to
review, hence the 3 patch split here. I don't mind squashing if it makes
everyone happy.

Raag

> > @@ -30,6 +30,7 @@
> >   #include "xe_sysctrl_types.h"
> >   #include "xe_tile_types.h"
> >   #include "xe_validation.h"
> > +#include "xe_wedge_types.h"
> >   #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> >   #define TEST_VM_OPS_ERROR
> > @@ -45,22 +46,6 @@ struct xe_pxp;
> >   struct xe_ttm_stolen_mgr;
> >   struct xe_vram_region;
> > -/**
> > - * enum xe_wedged_mode - possible wedged modes
> > - * @XE_WEDGED_MODE_NEVER: Device will never be declared wedged.
> > - * @XE_WEDGED_MODE_UPON_CRITICAL_ERROR: Device will be declared wedged only
> > - *	when critical error occurs like GT reset failure or firmware failure.
> > - *	This is the default mode.
> > - * @XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET: Device will be declared wedged on
> > - *	any hang. In this mode, engine resets are disabled to avoid automatic
> > - *	recovery attempts. This mode is primarily intended for debugging hangs.
> > - */
> > -enum xe_wedged_mode {
> > -	XE_WEDGED_MODE_NEVER = 0,
> > -	XE_WEDGED_MODE_UPON_CRITICAL_ERROR = 1,
> > -	XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET = 2,
> > -};
> > -
> >   #ifdef CONFIG_DRM_XE_DEBUG_PAGE_SIZE
> >   /**
> >    * enum xe_page_size_alloc_ctrl_mode - User BO page-size allocation control modes
> > @@ -525,18 +510,7 @@ struct xe_device {
> >   	atomic_t in_reset;
> >   	/** @wedged: Struct to control Wedged States and mode */
> > -	struct {
> > -		/** @wedged.flag: Xe device faced a critical error and is now blocked. */
> > -		atomic_t flag;
> > -		/** @wedged.mode: Mode controlled by kernel parameter and debugfs */
> > -		enum xe_wedged_mode mode;
> > -		/** @wedged.method: Recovery method to be sent in the drm device wedged uevent */
> > -		unsigned long method;
> > -		/** @wedged.inconsistent_reset: Inconsistent reset policy state between GTs */
> > -		bool inconsistent_reset;
> > -		/** @wedged.work: Worker for wedge handling */
> > -		struct work_struct work;
> > -	} wedged;
> > +	struct xe_wedge wedged;
> >   	/** @devres_group: devres group */
> >   	void *devres_group;
> > diff --git a/drivers/gpu/drm/xe/xe_wedge.c b/drivers/gpu/drm/xe/xe_wedge.c
> > index 92973133a6f6..04d8c5666be1 100644
> > --- a/drivers/gpu/drm/xe/xe_wedge.c
> > +++ b/drivers/gpu/drm/xe/xe_wedge.c
> > @@ -9,6 +9,8 @@
> >   #include "xe_defaults.h"
> >   #include "xe_device_types.h"
> >   #include "xe_gt.h"
> > +#include "xe_gt_printk.h"
> > +#include "xe_guc_ads.h"
> >   #include "xe_log.h"
> >   #include "xe_module.h"
> >   #include "xe_pm.h"
> > @@ -160,16 +162,7 @@ static const char *wedge_mode_to_string(enum xe_wedged_mode mode)
> >   	}
> >   }
> > -/**
> > - * xe_device_validate_wedged_mode() - Check if given mode is supported
> > - * @xe: the &xe_device
> > - * @mode: requested mode to validate
> > - *
> > - * Check whether the provided wedged mode is supported.
> > - *
> > - * Return: 0 if mode is supported, error code otherwise.
> > - */
> > -int xe_device_validate_wedged_mode(struct xe_device *xe, unsigned int mode)
> > +static int wedge_validate_mode(struct xe_device *xe, unsigned int mode)
> >   {
> >   	if (mode > XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET) {
> >   		xe_dbg(xe, "wedged_mode: invalid value (%u)\n", mode);
> > @@ -185,13 +178,89 @@ int xe_device_validate_wedged_mode(struct xe_device *xe, unsigned int mode)
> >   	return 0;
> >   }
> > +static bool wedge_mode_needs_policy_update(struct xe_device *xe, enum xe_wedged_mode mode)
> > +{
> > +	if (xe->wedged.inconsistent_reset)
> > +		return true;
> > +
> > +	if (xe->wedged.mode == mode)
> > +		return false;
> > +
> > +	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET ||
> > +	    mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
> > +		return true;
> > +
> > +	return false;
> > +}
> > +
> > +static int __wedge_mode_set_reset_policy(struct xe_gt *gt, enum xe_wedged_mode mode)
> > +{
> > +	bool enable_engine_reset;
> > +	int ret;
> > +
> > +	enable_engine_reset = (mode != XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET);
> > +	ret = xe_guc_ads_scheduler_policy_toggle_reset(&gt->uc.guc.ads,
> > +						       enable_engine_reset);
> > +	if (ret)
> > +		xe_gt_err(gt, "Failed to update GuC ADS scheduler policy (%pe)\n", ERR_PTR(ret));
> > +
> > +	return ret;
> > +}
> > +
> > +static int wedge_mode_set_reset_policy(struct xe_device *xe, enum xe_wedged_mode mode)
> > +{
> > +	struct xe_gt *gt;
> > +	int ret;
> > +	u8 id;
> > +
> > +	guard(xe_pm_runtime)(xe);
> > +	for_each_gt(gt, xe, id) {
> > +		ret = __wedge_mode_set_reset_policy(gt, mode);
> > +		if (ret) {
> > +			if (id > 0) {
> > +				xe->wedged.inconsistent_reset = true;
> > +				xe_err(xe, "Inconsistent reset policy state between GTs\n");
> > +			}
> > +			return ret;
> > +		}
> > +	}
> > +
> > +	xe->wedged.inconsistent_reset = false;
> > +
> > +	return 0;
> > +}
> > +
> > +/**
> > + * xe_wedge_set_mode() - Set wedge mode
> > + * @xe: xe device instance
> > + * @mode: wedge mode to be set
> > + */
> > +int xe_wedge_set_mode(struct xe_device *xe, enum xe_wedged_mode mode)
> > +{
> > +	int ret;
> > +
> > +	ret = wedge_validate_mode(xe, mode);
> > +	if (ret)
> > +		return ret;
> > +
> > +	if (wedge_mode_needs_policy_update(xe, mode)) {
> > +		ret = wedge_mode_set_reset_policy(xe, mode);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	xe->wedged.mode = mode;
> > +
> > +	return ret;
> > +}
> > +
> >   /**
> >    * xe_device_wedged_init_early() - Set wedge mode passed as module parameter
> >    * @xe: xe device instance
> >    */
> >   void xe_device_wedged_init_early(struct xe_device *xe)
> >   {
> > -	xe->wedged.mode = xe_device_validate_wedged_mode(xe, xe_modparam.wedged_mode) ?
> > +	xe->wedged.mode = wedge_validate_mode(xe, xe_modparam.wedged_mode) ?
> >   			  XE_DEFAULT_WEDGED_MODE : xe_modparam.wedged_mode;
> >   	xe_dbg(xe, "wedged_mode: setting mode (%u) %s\n",
> >   	       xe->wedged.mode, wedge_mode_to_string(xe->wedged.mode));
> > diff --git a/drivers/gpu/drm/xe/xe_wedge.h b/drivers/gpu/drm/xe/xe_wedge.h
> > index c6f16b10ea69..b31a682dbff8 100644
> > --- a/drivers/gpu/drm/xe/xe_wedge.h
> > +++ b/drivers/gpu/drm/xe/xe_wedge.h
> > @@ -9,12 +9,13 @@
> >   #include <linux/types.h>
> >   struct xe_device;
> > +enum xe_wedged_mode;
> >   void xe_device_declare_wedged(struct xe_device *xe);
> >   bool xe_device_wedged(struct xe_device *xe);
> >   void xe_device_wedged_init_early(struct xe_device *xe);
> >   int xe_device_wedged_init(struct xe_device *xe);
> > -int xe_device_validate_wedged_mode(struct xe_device *xe, unsigned int mode);
> >   void xe_device_set_wedged_method(struct xe_device *xe, unsigned long method);
> > +int xe_wedge_set_mode(struct xe_device *xe, enum xe_wedged_mode mode);
> >   #endif
> > diff --git a/drivers/gpu/drm/xe/xe_wedge_types.h b/drivers/gpu/drm/xe/xe_wedge_types.h
> > new file mode 100644
> > index 000000000000..e6084f151c62
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_wedge_types.h
> > @@ -0,0 +1,45 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright © 2026 Intel Corporation
> > + */
> > +
> > +#ifndef _XE_WEDGE_TYPES_H_
> > +#define _XE_WEDGE_TYPES_H_
> > +
> > +#include <linux/atomic.h>
> > +#include <linux/types.h>
> > +#include <linux/workqueue_types.h>
> > +
> > +/**
> > + * enum xe_wedged_mode - Possible wedge modes
> > + * @XE_WEDGED_MODE_NEVER: Device will never be declared wedged.
> > + * @XE_WEDGED_MODE_UPON_CRITICAL_ERROR: Device will be declared wedged only
> > + *	when critical error occurs like GT reset failure or firmware failure.
> > + *	This is the default mode.
> > + * @XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET: Device will be declared wedged on
> > + *	any hang. In this mode, engine resets are disabled to avoid automatic
> > + *	recovery attempts. This mode is primarily intended for debugging hangs.
> > + */
> > +enum xe_wedged_mode {
> > +	XE_WEDGED_MODE_NEVER = 0,
> > +	XE_WEDGED_MODE_UPON_CRITICAL_ERROR = 1,
> > +	XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET = 2,
> > +};
> > +
> > +/**
> > + * struct xe_wedge - Struct to control Wedged States and mode
> > + */
> > +struct xe_wedge {
> > +	/** @flag: Xe device faced a critical error and is now blocked. */
> > +	atomic_t flag;
> > +	/** @mode: Mode controlled by kernel parameter and debugfs */
> > +	enum xe_wedged_mode mode;
> > +	/** @method: Recovery method to be sent in the drm device wedged uevent */
> > +	unsigned long method;
> > +	/** @inconsistent_reset: Inconsistent reset policy state between GTs */
> > +	bool inconsistent_reset;
> > +	/** @work: Worker for wedge handling */
> > +	struct work_struct work;
> > +};
> > +
> > +#endif
