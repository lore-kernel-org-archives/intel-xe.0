Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91895C3ABD8
	for <intel-xe@archiver.kernel.org>; Wed, 14 May 2025 20:18:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57B0310E706;
	Wed, 14 May 2025 20:18:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BUmljCQ+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2397F10E706
 for <intel-xe@lists.freedesktop.org>; Wed, 14 May 2025 20:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747253924; x=1778789924;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=jMcsb5C5ZRhOTMso2dNFurALrZ/o17bybV4ssgpvfp4=;
 b=BUmljCQ+L+txKRCp7rARjoZ28dBNZCvNz03fELYPqmFWZGMVzRCa3in8
 n/iqA3J0o+qH/yhUC2w4f34CwQNeCncPMzv1l+Dx+k5bqkW1cok0q/6ts
 nOyHbEg4q9Wi+KvSUc0HCmrrINvhsxeLBRrW831wrfVnOBsV8XnNuZtuX
 3V0MVDBxEyjBwyioINAIy7nJQUNhDQkJTSEKT11/SrcuCTDwz67nSoJGL
 iEvqdk4rWPgswqryfhB5X78N+hc3y64Tdf3Gh1jcI7mRBRN6FjKyEH5fg
 xn8xIo+b6zMbEF0jXRiAFpcKk0Js/xqn3ecHKd3+boSshWycAMX3CM2Zi A==;
X-CSE-ConnectionGUID: jf4Ou5y/RtiFlmGZN/aE+Q==
X-CSE-MsgGUID: v/x1NtUsQYKrn33OmenlPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="66579144"
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="66579144"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 13:18:44 -0700
X-CSE-ConnectionGUID: d6pl/CaIRFqb0u3rFb+T6g==
X-CSE-MsgGUID: xQ9JLx1NSZ2ymVmAzotMWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="138207396"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa007.fm.intel.com with ESMTP; 14 May 2025 13:18:41 -0700
Received: from [10.246.5.201] (mwajdecz-MOBL.ger.corp.intel.com [10.246.5.201])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id A9A9934974;
 Wed, 14 May 2025 21:18:40 +0100 (IST)
Message-ID: <6d2ccd03-e9f9-4a7e-b7b0-8591b46851d5@intel.com>
Date: Wed, 14 May 2025 22:18:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] drm/xe: Validate wedged_mode parameter and define
 enum for modes
To: Lukasz Laguna <lukasz.laguna@intel.com>, intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, matthew.brost@intel.com,
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20250514101124.12437-1-lukasz.laguna@intel.com>
 <20250514101124.12437-2-lukasz.laguna@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250514101124.12437-2-lukasz.laguna@intel.com>
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



On 14.05.2025 12:11, Lukasz Laguna wrote:
> Check correctness of the wedged_mode parameter input to ensure only
> supported values are accepted. Additionally, replace magic numbers with
> a clearly defined enum.
> 
> Fixes: 6b8ef44cc0a9 ("drm/xe: Introduce the wedged_mode debugfs")

hmm, I'm not sure this alone deserves Fixes: tag as it's just an
improvement, not a bug fix

@Rodrigo @Lucas ?

> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>

otherwise, LGTM

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_debugfs.c      |  5 +++--
>  drivers/gpu/drm/xe/xe_device.c       | 25 +++++++++++++++++++++++--
>  drivers/gpu/drm/xe/xe_device.h       |  1 +
>  drivers/gpu/drm/xe/xe_device_types.h |  7 ++++++-
>  drivers/gpu/drm/xe/xe_guc_ads.c      |  4 ++--
>  drivers/gpu/drm/xe/xe_guc_capture.c  |  3 ++-
>  drivers/gpu/drm/xe/xe_guc_submit.c   |  6 +++---
>  drivers/gpu/drm/xe/xe_module.c       |  5 +++--
>  drivers/gpu/drm/xe/xe_module.h       |  2 +-
>  9 files changed, 44 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index d83cd6ed3fa8..5dd0ad3f9bae 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -163,8 +163,9 @@ static ssize_t wedged_mode_set(struct file *f, const char __user *ubuf,
>  	if (ret)
>  		return ret;
>  
> -	if (wedged_mode > 2)
> -		return -EINVAL;
> +	ret = xe_device_validate_wedged_mode(xe, wedged_mode);
> +	if (ret)
> +		return ret;
>  
>  	if (xe->wedged.mode == wedged_mode)
>  		return size;
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index d4b6e623aa48..a8470221ff85 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -730,7 +730,9 @@ int xe_device_probe_early(struct xe_device *xe)
>  	if (err)
>  		return err;
>  
> -	xe->wedged.mode = xe_modparam.wedged_mode;
> +	xe->wedged.mode = xe_device_validate_wedged_mode(xe, xe_modparam.wedged_mode) ?
> +			  XE_WEDGED_MODE_DEFAULT : xe_modparam.wedged_mode;
> +	drm_dbg(&xe->drm, "wedged_mode: setting mode (%u)\n", xe->wedged.mode);

nit:

	drm_dbg(&xe->drm, "wedged_mode: %s(%u)\n",
		xe->wedged.mode == UPON_CRITICAL ? "upon-critical" :
		xe->wedged.mode == UPON_ANY_HANG ? "upon-any" :
		"never");
>  
>  	return 0;
>  }
> @@ -1144,7 +1146,7 @@ void xe_device_declare_wedged(struct xe_device *xe)
>  	struct xe_gt *gt;
>  	u8 id;
>  
> -	if (xe->wedged.mode == 0) {
> +	if (xe->wedged.mode == XE_WEDGED_MODE_NEVER) {
>  		drm_dbg(&xe->drm, "Wedged mode is forcibly disabled\n");
>  		return;
>  	}
> @@ -1172,3 +1174,22 @@ void xe_device_declare_wedged(struct xe_device *xe)
>  	for_each_gt(gt, xe, id)
>  		xe_gt_declare_wedged(gt);
>  }
> +
> +/**
> + * xe_device_validate_wedged_mode() - Check if given mode is supported
> + * @xe: the &xe_device
> + * @mode: requested mode to validate
> + *
> + * Check whether the provided wedged mode is supported.
> + *
> + * Return: 0 if mode is supported, error code otherwise.
> + */
> +int xe_device_validate_wedged_mode(struct xe_device *xe, unsigned int mode)
> +{
> +	if (mode > XE_WEDGED_MODE_UPON_ANY_HANG) {
> +		drm_dbg(&xe->drm, "wedged_mode: invalid value (%u)\n", mode);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index 0bc3bc8e6803..98f02bb4d344 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -191,6 +191,7 @@ static inline bool xe_device_wedged(struct xe_device *xe)
>  }
>  
>  void xe_device_declare_wedged(struct xe_device *xe);
> +int xe_device_validate_wedged_mode(struct xe_device *xe, unsigned int mode);
>  
>  struct xe_file *xe_file_get(struct xe_file *xef);
>  void xe_file_put(struct xe_file *xef);
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 50b2bfa682ac..c80cf70b978c 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -558,7 +558,12 @@ struct xe_device {
>  		/** @wedged.flag: Xe device faced a critical error and is now blocked. */
>  		atomic_t flag;
>  		/** @wedged.mode: Mode controlled by kernel parameter and debugfs */
> -		int mode;
> +		enum xe_wedged_mode {
> +			XE_WEDGED_MODE_NEVER = 0,
> +			XE_WEDGED_MODE_UPON_CRITICAL_ERROR = 1,
> +			XE_WEDGED_MODE_UPON_ANY_HANG = 2,
> +			XE_WEDGED_MODE_DEFAULT = XE_WEDGED_MODE_UPON_CRITICAL_ERROR,
> +		} mode;
>  	} wedged;
>  
>  	/** @bo_device: Struct to control async free of BOs */
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index 44c1fa2fe7c8..413711bd3f58 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -469,7 +469,7 @@ static void guc_policies_init(struct xe_guc_ads *ads)
>  	ads_blob_write(ads, policies.max_num_work_items,
>  		       GLOBAL_POLICY_MAX_NUM_WI);
>  
> -	if (xe->wedged.mode == 2)
> +	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG)
>  		global_flags |= GLOBAL_POLICY_DISABLE_ENGINE_RESET;
>  
>  	ads_blob_write(ads, policies.global_flags, global_flags);
> @@ -1018,7 +1018,7 @@ int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads)
>  	policies->dpc_promote_time = ads_blob_read(ads, policies.dpc_promote_time);
>  	policies->max_num_work_items = ads_blob_read(ads, policies.max_num_work_items);
>  	policies->is_valid = 1;
> -	if (xe->wedged.mode == 2)
> +	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG)
>  		policies->global_flags |= GLOBAL_POLICY_DISABLE_ENGINE_RESET;
>  	else
>  		policies->global_flags &= ~GLOBAL_POLICY_DISABLE_ENGINE_RESET;
> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
> index 859a3ba91be5..4f203bd0a1b1 100644
> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
> @@ -1856,7 +1856,8 @@ xe_guc_capture_get_matching_and_lock(struct xe_exec_queue *q)
>  		return NULL;
>  
>  	xe = gt_to_xe(q->gt);
> -	if (xe->wedged.mode >= 2 || !xe_device_uc_enabled(xe) || IS_SRIOV_VF(xe))
> +	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG || !xe_device_uc_enabled(xe) ||
> +	    IS_SRIOV_VF(xe))
>  		return NULL;
>  
>  	ss = &xe->devcoredump.snapshot;
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index fb125f940de8..c16c913219a3 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -863,8 +863,8 @@ void xe_guc_submit_wedge(struct xe_guc *guc)
>  	err = devm_add_action_or_reset(guc_to_xe(guc)->drm.dev,
>  				       guc_submit_wedged_fini, guc);
>  	if (err) {
> -		xe_gt_err(gt, "Failed to register clean-up on wedged.mode=2; "
> -			  "Although device is wedged.\n");
> +		xe_gt_err(gt, "Failed to register clean-up on wedged.mode=%u; "
> +			  "Although device is wedged.\n", XE_WEDGED_MODE_UPON_ANY_HANG);
>  		return;
>  	}
>  
> @@ -879,7 +879,7 @@ static bool guc_submit_hint_wedged(struct xe_guc *guc)
>  {
>  	struct xe_device *xe = guc_to_xe(guc);
>  
> -	if (xe->wedged.mode != 2)
> +	if (xe->wedged.mode != XE_WEDGED_MODE_UPON_ANY_HANG)
>  		return false;
>  
>  	if (xe_device_wedged(xe))
> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> index 1c4dfafbcd0b..6848abf23acf 100644
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
> +	.wedged_mode = XE_WEDGED_MODE_DEFAULT,
>  	.svm_notifier_size = 512,
>  	/* the rest are 0 by default */
>  };
> @@ -68,7 +69,7 @@ MODULE_PARM_DESC(max_vfs,
>  		 "(0 = no VFs [default]; N = allow up to N VFs)");
>  #endif
>  
> -module_param_named_unsafe(wedged_mode, xe_modparam.wedged_mode, int, 0600);
> +module_param_named_unsafe(wedged_mode, xe_modparam.wedged_mode, uint, 0600);
>  MODULE_PARM_DESC(wedged_mode,
>  		 "Module's default policy for the wedged mode - 0=never, 1=upon-critical-errors[default], 2=upon-any-hang");
>  
> diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
> index 5a3bfea8b7b4..1c75f38ca393 100644
> --- a/drivers/gpu/drm/xe/xe_module.h
> +++ b/drivers/gpu/drm/xe/xe_module.h
> @@ -21,7 +21,7 @@ struct xe_modparam {
>  #ifdef CONFIG_PCI_IOV
>  	unsigned int max_vfs;
>  #endif
> -	int wedged_mode;
> +	unsigned int wedged_mode;
>  	u32 svm_notifier_size;
>  };
>  

