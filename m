Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40174C54F30
	for <intel-xe@archiver.kernel.org>; Tue, 27 May 2025 17:19:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E91CD10E0DA;
	Tue, 27 May 2025 17:19:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CXndXvp0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96C1810E294
 for <intel-xe@lists.freedesktop.org>; Tue, 27 May 2025 17:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748366341; x=1779902341;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=p6sFATs4OaerK2sJgfJbiitkoaqg+KGM93hAWu2CXZU=;
 b=CXndXvp0nlXfHczlVt2mZftJTQ1dxu35FZMKk4SWMr9qNoAPt3kgBBxc
 +z3G1XsTIWfzviOh+uve3x/ibvszfAf3tGfeR2NkaEqV400+UGvDO/7Br
 9Ytfam8vE8ksHWJ5iqjKJXAtioC9fwKvxPiOT88iZe9XLnCVaCaf1kzaE
 KDMTh2/cP8s54uEcSlnG/jDgRIj/T0s4/PDNOEgHRpHPYf6alGgX549DR
 0KkBONXhK/ga6fSQtPbS6aVmooDN56q9Vsi2+WEX+IPla0Mqr7A4BuOqU
 pUlnpk2EDOK9X86XbRVbH0Rn2mVEKOvh4Dh+Vs9rP0gdPMILMi/cZVuY9 A==;
X-CSE-ConnectionGUID: zmNtdJJvSbWOeVN91NATgA==
X-CSE-MsgGUID: kcKcsEAETAeq2BqFY1SKKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="72905203"
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; d="scan'208";a="72905203"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 10:19:00 -0700
X-CSE-ConnectionGUID: TdzvBJ1LRLy1eTrVq/hq2A==
X-CSE-MsgGUID: O2bwjqASSd6dR7Xky0CKSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; d="scan'208";a="147667370"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa003.jf.intel.com with ESMTP; 27 May 2025 10:18:58 -0700
Received: from [10.245.113.199] (unknown [10.245.113.199])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 236A934910;
 Tue, 27 May 2025 18:18:57 +0100 (IST)
Message-ID: <9170b7f4-4039-40df-9186-91e3fde34cb2@intel.com>
Date: Tue, 27 May 2025 19:18:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/4] drm/xe: Validate wedged_mode parameter and define
 enum for modes
To: Lukasz Laguna <lukasz.laguna@intel.com>, intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, matthew.brost@intel.com
References: <20250521122511.5760-1-lukasz.laguna@intel.com>
 <20250521122511.5760-2-lukasz.laguna@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250521122511.5760-2-lukasz.laguna@intel.com>
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



On 21.05.2025 14:25, Lukasz Laguna wrote:
> Check correctness of the wedged_mode parameter input to ensure only
> supported values are accepted. Additionally, replace magic numbers with
> a clearly defined enum.
> 
> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>

few nits below, but LGTM

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_debugfs.c      |  5 +--
>  drivers/gpu/drm/xe/xe_device.c       | 46 ++++++++++++++++++++++++++--
>  drivers/gpu/drm/xe/xe_device.h       |  2 ++
>  drivers/gpu/drm/xe/xe_device_types.h |  7 ++++-
>  drivers/gpu/drm/xe/xe_guc_ads.c      |  4 +--
>  drivers/gpu/drm/xe/xe_guc_capture.c  |  3 +-
>  drivers/gpu/drm/xe/xe_guc_submit.c   |  7 +++--
>  drivers/gpu/drm/xe/xe_module.c       |  5 +--
>  drivers/gpu/drm/xe/xe_module.h       |  2 +-
>  9 files changed, 67 insertions(+), 14 deletions(-)
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
> index 660b0c5126dc..fa4f1a3ac1f2 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -726,7 +726,10 @@ int xe_device_probe_early(struct xe_device *xe)
>  	if (err)
>  		return err;
>  
> -	xe->wedged.mode = xe_modparam.wedged_mode;
> +	xe->wedged.mode = xe_device_validate_wedged_mode(xe, xe_modparam.wedged_mode) ?
> +			  XE_WEDGED_MODE_DEFAULT : xe_modparam.wedged_mode;
> +	drm_dbg(&xe->drm, "wedged_mode: setting mode (%u) %s\n",
> +		xe->wedged.mode, xe_device_wedged_mode_to_string(xe->wedged.mode));
>  
>  	return 0;
>  }
> @@ -1140,7 +1143,7 @@ void xe_device_declare_wedged(struct xe_device *xe)
>  	struct xe_gt *gt;
>  	u8 id;
>  
> -	if (xe->wedged.mode == 0) {
> +	if (xe->wedged.mode == XE_WEDGED_MODE_NEVER) {
>  		drm_dbg(&xe->drm, "Wedged mode is forcibly disabled\n");
>  		return;
>  	}
> @@ -1168,3 +1171,42 @@ void xe_device_declare_wedged(struct xe_device *xe)
>  	for_each_gt(gt, xe, id)
>  		xe_gt_declare_wedged(gt);
>  }
> +
> +/**
> + * xe_device_validate_wedged_mode - Check if given mode is supported
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
> +
> +/**
> + * xe_device_wedged_mode_to_string - Convert enum value to string.
> + * @mode: the &xe_wedged_mode to convert
> + *
> + * Returns: wedged mode as a user friendly string.
> + */
> +const char *xe_device_wedged_mode_to_string(enum xe_wedged_mode mode)

nit: xe_wedged_mode_to_string()

> +{
> +	switch (mode) {
> +	case XE_WEDGED_MODE_NEVER:
> +		return "never";
> +	case XE_WEDGED_MODE_UPON_CRITICAL_ERROR:
> +		return "upon-critical-error";
> +	case XE_WEDGED_MODE_UPON_ANY_HANG:
> +		return "upon-any-hang";
> +	default:
> +		return "<invalid>";
> +	}
> +}
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index 0bc3bc8e6803..d793faa09f89 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -191,6 +191,8 @@ static inline bool xe_device_wedged(struct xe_device *xe)
>  }
>  
>  void xe_device_declare_wedged(struct xe_device *xe);
> +int xe_device_validate_wedged_mode(struct xe_device *xe, unsigned int mode);
> +const char *xe_device_wedged_mode_to_string(enum xe_wedged_mode mode);
>  
>  struct xe_file *xe_file_get(struct xe_file *xef);
>  void xe_file_put(struct xe_file *xef);
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 902b2e30b3b9..a8dfacb951c1 100644
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
> index 07a027755627..ca8bdb0ec08d 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -470,7 +470,7 @@ static void guc_policies_init(struct xe_guc_ads *ads)
>  	ads_blob_write(ads, policies.max_num_work_items,
>  		       GLOBAL_POLICY_MAX_NUM_WI);
>  
> -	if (xe->wedged.mode == 2)
> +	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG)
>  		global_flags |= GLOBAL_POLICY_DISABLE_ENGINE_RESET;
>  
>  	ads_blob_write(ads, policies.global_flags, global_flags);
> @@ -1026,7 +1026,7 @@ int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads)
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

nit: personally I would split this into 3 statements since each of them
is totally different reasoning, and let the compiler do any optimization

>  		return NULL;
>  
>  	ss = &xe->devcoredump.snapshot;
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 80f748baad3f..54020b26c772 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -863,8 +863,9 @@ void xe_guc_submit_wedge(struct xe_guc *guc)
>  	err = devm_add_action_or_reset(guc_to_xe(guc)->drm.dev,
>  				       guc_submit_wedged_fini, guc);
>  	if (err) {
> -		xe_gt_err(gt, "Failed to register clean-up on wedged.mode=2; "
> -			  "Although device is wedged.\n");
> +		xe_gt_err(gt, "Failed to register clean-up in wedged.mode=%s; "
> +			  "Although device is wedged.\n",
> +			  xe_device_wedged_mode_to_string(XE_WEDGED_MODE_UPON_ANY_HANG));
>  		return;
>  	}
>  
> @@ -879,7 +880,7 @@ static bool guc_submit_hint_wedged(struct xe_guc *guc)
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

