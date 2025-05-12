Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB958C3ABCB
	for <intel-xe@archiver.kernel.org>; Mon, 12 May 2025 17:06:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E06210E053;
	Mon, 12 May 2025 17:06:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ih5gVymX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0480B10E053
 for <intel-xe@lists.freedesktop.org>; Mon, 12 May 2025 17:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747069560; x=1778605560;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=AH3P+FqnloIILKTo0oYQPs2kLaxzqe+LQtfT5fBlXTI=;
 b=Ih5gVymXEHS4IzlgiPptL/1dcyB5ycL8IxiksDFQqDRG4Z5zdzxzudnx
 LAgDmcjTO2vHI7GmTYMLHal4lYe+/M9Fq2fdWZvfxjiVRXgGitN+vfUqE
 7UrBvfJDF6lg+9FDLWwgBpvOCdByoRy/q5b5wKO+CTbdyOKNyAuwieMCk
 +67ViWEDurSna9uewleHftti2BHXsjvgbE5hfADO+Wk4SrUlqqj579Fal
 oiioq6uvDhwU10T3B4gcw2Y5P/Q2lOoqM3CwsnTTj2LfE08F+erU1C/IO
 HJ8sWUpWkoT5IbY6bX/RtWi+/BJ+Qw2MteIJgf5MuqpJuJGuH52zsRdNs w==;
X-CSE-ConnectionGUID: nryb1/HdTJyaRcPHMHKIdQ==
X-CSE-MsgGUID: MdmF3yD8TPK2htyn++2Chw==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="71393284"
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="71393284"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 10:05:59 -0700
X-CSE-ConnectionGUID: kVThWRHjT72vQ5PhCFF/Pg==
X-CSE-MsgGUID: /p49XkxbSMiRhmyKUemwTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="138388868"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa009.fm.intel.com with ESMTP; 12 May 2025 10:05:56 -0700
Received: from [10.245.96.179] (unknown [10.245.96.179])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 8FADF3493B;
 Mon, 12 May 2025 18:05:55 +0100 (IST)
Message-ID: <901c13f8-9924-427f-918d-b91a6985040f@intel.com>
Date: Mon, 12 May 2025 19:05:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] drm/xe: Validate wedged_mode parameter and define
 enum for modes
To: Lukasz Laguna <lukasz.laguna@intel.com>, intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, matthew.brost@intel.com
References: <20250512163432.22678-1-lukasz.laguna@intel.com>
 <20250512163432.22678-2-lukasz.laguna@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250512163432.22678-2-lukasz.laguna@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 12.05.2025 18:34, Lukasz Laguna wrote:
> Check correctness of the wedged_mode parameter input to ensure only
> supported values are accepted. Additionally, replace magic numbers with
> a clearly defined enum.
> 
> Fixes: 6b8ef44cc0a9 ("drm/xe: Introduce the wedged_mode debugfs")
> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_debugfs.c      |  5 +++--
>  drivers/gpu/drm/xe/xe_device.c       | 26 ++++++++++++++++++++++++--
>  drivers/gpu/drm/xe/xe_device.h       |  1 +
>  drivers/gpu/drm/xe/xe_device_types.h |  6 +++++-
>  drivers/gpu/drm/xe/xe_guc_ads.c      |  4 ++--
>  drivers/gpu/drm/xe/xe_guc_capture.c  |  3 ++-
>  drivers/gpu/drm/xe/xe_module.c       |  5 +++--
>  drivers/gpu/drm/xe/xe_module.h       |  2 +-
>  8 files changed, 41 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index d0503959a8ed..7e14eb037295 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -163,8 +163,9 @@ static ssize_t wedged_mode_set(struct file *f, const char __user *ubuf,
>  	if (ret)
>  		return ret;
>  
> -	if (wedged_mode > 2)
> -		return -EINVAL;
> +	ret = xe_device_wedged_mode_validate(xe, wedged_mode);
> +	if (ret)
> +		return ret;
>  
>  	if (xe->wedged.mode == wedged_mode)
>  		return size;
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 399ae5f40321..b2d4f1b7d46a 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -729,7 +729,10 @@ int xe_device_probe_early(struct xe_device *xe)
>  	if (err)
>  		return err;
>  
> -	xe->wedged.mode = xe_modparam.wedged_mode;
> +	xe->wedged.mode = xe_device_wedged_mode_validate(xe, xe_modparam.wedged_mode) ?
> +			  XE_WEDGED_MODE_FATAL_ERROR /* default */ :

XE_WEDGED_MODE_DEFAULT (see below)

> +			  xe_modparam.wedged_mode;
> +	drm_dbg(&xe->drm, "wedged_mode: setting mode (%u)\n", xe->wedged.mode);
>  
>  	return 0;
>  }
> @@ -1143,7 +1146,7 @@ void xe_device_declare_wedged(struct xe_device *xe)
>  	struct xe_gt *gt;
>  	u8 id;
>  
> -	if (xe->wedged.mode == 0) {
> +	if (xe->wedged.mode == XE_WEDGED_MODE_DISABLED) {
>  		drm_dbg(&xe->drm, "Wedged mode is forcibly disabled\n");
>  		return;
>  	}
> @@ -1171,3 +1174,22 @@ void xe_device_declare_wedged(struct xe_device *xe)
>  	for_each_gt(gt, xe, id)
>  		xe_gt_declare_wedged(gt);
>  }
> +
> +/**
> + * xe_device_wedged_mode_validate() - Check if given mode is supported
> + * @xe: the &xe_device
> + * @mode: requested mode to validate
> + *
> + * Check whether the provided wedged mode is supported.
> + *
> + * Return: 0 if mode is supported, error code otherwise.
> + */
> +int xe_device_wedged_mode_validate(struct xe_device *xe, unsigned int mode)

we are trying to name functions using <object> <verb> <subject>, so:

	int xe_device_validate_wedged_mode()

or if we don't care about different error codes:

	bool xe_device_is_wedged_mode_valid()

> +{
> +	if (mode > XE_WEDGED_MODE_FIRST_HANG) {
> +		drm_dbg(&xe->drm, "wedged_mode: invalid value (%u)\n", mode);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index 0bc3bc8e6803..a22ebf394450 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -191,6 +191,7 @@ static inline bool xe_device_wedged(struct xe_device *xe)
>  }
>  
>  void xe_device_declare_wedged(struct xe_device *xe);
> +int xe_device_wedged_mode_validate(struct xe_device *xe, unsigned int mode);
>  
>  struct xe_file *xe_file_get(struct xe_file *xef);
>  void xe_file_put(struct xe_file *xef);
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 06c65dace026..1bd96981628a 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -556,7 +556,11 @@ struct xe_device {
>  		/** @wedged.flag: Xe device faced a critical error and is now blocked. */
>  		atomic_t flag;
>  		/** @wedged.mode: Mode controlled by kernel parameter and debugfs */
> -		int mode;
> +		enum xe_wedged_mode {

likely it can be nameless enum as we don't use it elsewhere (unless we
move it to xe_module.h near actual modparam, where we usually want to
describe module parameters)

> +			XE_WEDGED_MODE_DISABLED = 0,
> +			XE_WEDGED_MODE_FATAL_ERROR = 1,
> +			XE_WEDGED_MODE_FIRST_HANG = 2,

	XE_WEDGED_MODE_NEVER = 0,
	XE_WEDGED_MODE_UPON_CRITICAL_ERROR = 1,
	XE_WEDGED_MODE_UPON_ANY_HANG = 2,
and
	XE_WEDGED_MODE_DEFAULT = XE_WEDGED_MODE_UPON_CRITICAL_ERROR,

to match modparam description?

> +		} mode;
>  	} wedged;
>  
>  	/** @bo_device: Struct to control async free of BOs */
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index 44c1fa2fe7c8..d9b7fff1d2a7 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -469,7 +469,7 @@ static void guc_policies_init(struct xe_guc_ads *ads)
>  	ads_blob_write(ads, policies.max_num_work_items,
>  		       GLOBAL_POLICY_MAX_NUM_WI);
>  
> -	if (xe->wedged.mode == 2)
> +	if (xe->wedged.mode == XE_WEDGED_MODE_FIRST_HANG)
>  		global_flags |= GLOBAL_POLICY_DISABLE_ENGINE_RESET;
>  
>  	ads_blob_write(ads, policies.global_flags, global_flags);
> @@ -1018,7 +1018,7 @@ int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads)
>  	policies->dpc_promote_time = ads_blob_read(ads, policies.dpc_promote_time);
>  	policies->max_num_work_items = ads_blob_read(ads, policies.max_num_work_items);
>  	policies->is_valid = 1;
> -	if (xe->wedged.mode == 2)
> +	if (xe->wedged.mode == XE_WEDGED_MODE_FIRST_HANG)
>  		policies->global_flags |= GLOBAL_POLICY_DISABLE_ENGINE_RESET;
>  	else
>  		policies->global_flags &= ~GLOBAL_POLICY_DISABLE_ENGINE_RESET;
> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
> index 859a3ba91be5..c592b4f294cb 100644
> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
> @@ -1856,7 +1856,8 @@ xe_guc_capture_get_matching_and_lock(struct xe_exec_queue *q)
>  		return NULL;
>  
>  	xe = gt_to_xe(q->gt);
> -	if (xe->wedged.mode >= 2 || !xe_device_uc_enabled(xe) || IS_SRIOV_VF(xe))
> +	if (xe->wedged.mode == XE_WEDGED_MODE_FIRST_HANG || !xe_device_uc_enabled(xe) ||
> +	    IS_SRIOV_VF(xe))
>  		return NULL;
>  
>  	ss = &xe->devcoredump.snapshot;
> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> index 05c7d0ae6d83..fb41bf76d48c 100644
> --- a/drivers/gpu/drm/xe/xe_module.c
> +++ b/drivers/gpu/drm/xe/xe_module.c
> @@ -10,6 +10,7 @@
>  
>  #include <drm/drm_module.h>
>  
> +#include "xe_device.h"
>  #include "xe_drv.h"
>  #include "xe_configfs.h"
>  #include "xe_hw_fence.h"
> @@ -25,7 +26,7 @@ struct xe_modparam xe_modparam = {
>  #ifdef CONFIG_PCI_IOV
>  	.max_vfs = IS_ENABLED(CONFIG_DRM_XE_DEBUG) ? ~0 : 0,
>  #endif
> -	.wedged_mode = 1,
> +	.wedged_mode = XE_WEDGED_MODE_FATAL_ERROR,
>  	.svm_notifier_size = 512,
>  	/* the rest are 0 by default */
>  };
> @@ -71,7 +72,7 @@ MODULE_PARM_DESC(max_vfs,
>  		 "(0 = no VFs [default]; N = allow up to N VFs)");
>  #endif
>  
> -module_param_named_unsafe(wedged_mode, xe_modparam.wedged_mode, int, 0600);
> +module_param_named_unsafe(wedged_mode, xe_modparam.wedged_mode, uint, 0600);
>  MODULE_PARM_DESC(wedged_mode,
>  		 "Module's default policy for the wedged mode - 0=never, 1=upon-critical-errors[default], 2=upon-any-hang");
>  
> diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
> index 84339e509c80..fb674bc08955 100644
> --- a/drivers/gpu/drm/xe/xe_module.h
> +++ b/drivers/gpu/drm/xe/xe_module.h
> @@ -22,7 +22,7 @@ struct xe_modparam {
>  #ifdef CONFIG_PCI_IOV
>  	unsigned int max_vfs;
>  #endif
> -	int wedged_mode;
> +	unsigned int wedged_mode;
>  	u32 svm_notifier_size;
>  };
>  

