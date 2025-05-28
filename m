Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 701B6C3ABB2
	for <intel-xe@archiver.kernel.org>; Wed, 28 May 2025 09:17:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26867892ED;
	Wed, 28 May 2025 09:17:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JqLslqW0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48A33892ED
 for <intel-xe@lists.freedesktop.org>; Wed, 28 May 2025 09:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748423849; x=1779959849;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=rGKNebdcPTCLMvlf2R2EzKtQmI+0Zvjcaw6kX0fzIVo=;
 b=JqLslqW0FyIEt6Jp6KDQVaIf6UYYEWrR7rwyTnretOJxVl/P6poiVUGt
 r8sipfca+QV3MMXrkY6VdFvMUrNEfzq2f526IXjyF+vB+wjyqeWRNhd18
 oVsfFsLEN2J8zRw7gQ2fjtRzdjtk8E4b8vfYF0ZeQaKIS0uP6zgBaN67G
 +CXB+I87GP0bGuJfgNS8d4QG26VWun08OFmJqFVfkhiVe1oCFqDodlr2t
 cDj0D62wUinLL4mWP2Vv5ob4GfHmRGvJuorRiQAFwgfX5Cjwg/ezO/Hv3
 dRrc270Eq8TAZn9xlx71jI84uvqAtpcxfbLgKlh56/Ip0xH0VxxmmxLCo Q==;
X-CSE-ConnectionGUID: IHFe+1PZQ/OltUEzSlrFrw==
X-CSE-MsgGUID: 1tHP8VOcSqOM+L4i41rZvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="50499557"
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; d="scan'208";a="50499557"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 02:17:27 -0700
X-CSE-ConnectionGUID: Gw+hhIDCTp+WtPhPBK/DWw==
X-CSE-MsgGUID: 1FXhii1ZR/iQk26BmUvQCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; d="scan'208";a="147069264"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa003.fm.intel.com with ESMTP; 28 May 2025 02:17:24 -0700
Received: from [10.245.84.121] (unknown [10.245.84.121])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 6EC1428796;
 Wed, 28 May 2025 10:17:23 +0100 (IST)
Message-ID: <6783b88c-cdac-4730-be80-716ffdfd675a@intel.com>
Date: Wed, 28 May 2025 11:17:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/4] drm/xe: Don't update wedged mode in case of an
 error
To: Lukasz Laguna <lukasz.laguna@intel.com>, intel-xe@lists.freedesktop.org,
 John Harrison <john.c.harrison@intel.com>
Cc: rodrigo.vivi@intel.com, matthew.brost@intel.com
References: <20250521122511.5760-1-lukasz.laguna@intel.com>
 <20250521122511.5760-3-lukasz.laguna@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250521122511.5760-3-lukasz.laguna@intel.com>
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
> Update driver's internal wedged.mode state only in case of a success or
> set it to "misconfigured" in case of inconsistent reset policy state
> between GTs.
> 
> Fixes: 6b8ef44cc0a9 ("drm/xe: Introduce the wedged_mode debugfs")
> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_debugfs.c      | 34 ++++++++++++++++++++++++----
>  drivers/gpu/drm/xe/xe_device.c       |  2 ++
>  drivers/gpu/drm/xe/xe_device_types.h |  1 +
>  drivers/gpu/drm/xe/xe_guc_ads.c      | 12 +++++-----
>  drivers/gpu/drm/xe/xe_guc_ads.h      |  4 +++-
>  5 files changed, 41 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index 5dd0ad3f9bae..5bc4fe5aa9a2 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -150,6 +150,25 @@ static ssize_t wedged_mode_show(struct file *f, char __user *ubuf,
>  	return simple_read_from_buffer(ubuf, size, pos, buf, len);
>  }
>  
> +static int wedged_mode_set_reset_policy(struct xe_gt *gt, enum xe_wedged_mode mode)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	int ret;
> +
> +	if ((xe->wedged.mode == XE_WEDGED_MODE_NEVER &&
> +	     mode == XE_WEDGED_MODE_UPON_CRITICAL_ERROR) ||
> +	    (xe->wedged.mode == XE_WEDGED_MODE_UPON_CRITICAL_ERROR &&
> +	     mode == XE_WEDGED_MODE_NEVER))
> +		return 0;

this could be a separate helper:

	bool need_policy_change(old_mode, new_mode)

and might be called before we enter the for_each_gt loop

> +
> +	ret = xe_guc_ads_scheduler_policy_toggle_reset(&gt->uc.guc.ads,
> +						       !(mode == XE_WEDGED_MODE_UPON_ANY_HANG));
> +	if (ret)
> +		xe_gt_err(gt, "Failed to update GuC ADS scheduler policy (%pe)\n", ERR_PTR(ret));
> +
> +	return ret;
> +}
> +
>  static ssize_t wedged_mode_set(struct file *f, const char __user *ubuf,
>  			       size_t size, loff_t *pos)
>  {
> @@ -170,19 +189,24 @@ static ssize_t wedged_mode_set(struct file *f, const char __user *ubuf,
>  	if (xe->wedged.mode == wedged_mode)
>  		return size;
>  
> -	xe->wedged.mode = wedged_mode;
> -
>  	xe_pm_runtime_get(xe);
>  	for_each_gt(gt, xe, id) {
> -		ret = xe_guc_ads_scheduler_policy_toggle_reset(&gt->uc.guc.ads);
> +		ret = wedged_mode_set_reset_policy(gt, wedged_mode);
>  		if (ret) {
> -			xe_gt_err(gt, "Failed to update GuC ADS scheduler policy. GuC may still cause engine reset even with wedged_mode=2\n");
> +			if (id > 0) {
> +				xe->wedged.mode = XE_WEDGED_MODE_MISCONFIGURED;

hmm, I'm not sure that the rest of the driver code will properly handle
this new unexpected state - do we really need this? can't we just try to
revert recent change where it was accepted? and if it fails there it
still not the end of the world

alternatively we can try to track GuC reset policy settings per-GuC, so
we will know where it was left inconsistent with global 'wedge' mode

or just wait until next mode update or GT reset where likely we will be
able to restore the consistency

IMO it should be fine just to report inconsistency, and then let the
user decide what to do next

> +				drm_err(&xe->drm, "Inconsistent reset policy state between GTs, setting wedged mode: (%u) %s\n",
> +					xe->wedged.mode,
> +					xe_device_wedged_mode_to_string(xe->wedged.mode));

this new state is not the one exposed in modparam description, user
might be confused what it means

> +			}
>  			xe_pm_runtime_put(xe);
> -			return -EIO;
> +			return ret;
>  		}
>  	}
>  	xe_pm_runtime_put(xe);
>  
> +	xe->wedged.mode = wedged_mode;
> +
>  	return size;
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index fa4f1a3ac1f2..0aea87994541 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -1206,6 +1206,8 @@ const char *xe_device_wedged_mode_to_string(enum xe_wedged_mode mode)
>  		return "upon-critical-error";
>  	case XE_WEDGED_MODE_UPON_ANY_HANG:
>  		return "upon-any-hang";
> +	case XE_WEDGED_MODE_MISCONFIGURED:
> +		return "misconfigured";
>  	default:
>  		return "<invalid>";
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index a8dfacb951c1..8ec1d891a2ab 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -562,6 +562,7 @@ struct xe_device {
>  			XE_WEDGED_MODE_NEVER = 0,
>  			XE_WEDGED_MODE_UPON_CRITICAL_ERROR = 1,
>  			XE_WEDGED_MODE_UPON_ANY_HANG = 2,
> +			XE_WEDGED_MODE_MISCONFIGURED = 3,
>  			XE_WEDGED_MODE_DEFAULT = XE_WEDGED_MODE_UPON_CRITICAL_ERROR,
>  		} mode;
>  	} wedged;
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index ca8bdb0ec08d..f2c4c4e292f6 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -1008,14 +1008,14 @@ static int guc_ads_update_policies(struct xe_guc_ads *ads, const struct guc_poli
>  /**
>   * xe_guc_ads_scheduler_policy_toggle_reset - Toggle reset policy
>   * @ads: Additional data structures object
> + * @enable: true to enable engine resets, false otherwise
>   *
> - * This function update the GuC's engine reset policy based on wedged.mode.
> + * This function update the GuC's engine reset policy.
>   *
>   * Return: 0 on success, and negative error code otherwise.
>   */
> -int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads)
> +int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads, bool enable)
>  {
> -	struct xe_device *xe = ads_to_xe(ads);
>  	struct guc_policies *policies;
>  	int ret;
>  
> @@ -1026,10 +1026,10 @@ int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads)
>  	policies->dpc_promote_time = ads_blob_read(ads, policies.dpc_promote_time);
>  	policies->max_num_work_items = ads_blob_read(ads, policies.max_num_work_items);
>  	policies->is_valid = 1;
> -	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG)
> -		policies->global_flags |= GLOBAL_POLICY_DISABLE_ENGINE_RESET;
> -	else
> +	if (enable)
>  		policies->global_flags &= ~GLOBAL_POLICY_DISABLE_ENGINE_RESET;
> +	else
> +		policies->global_flags |= GLOBAL_POLICY_DISABLE_ENGINE_RESET;

btw, do we correctly update policies stored in ADS that likely will be
used again by the GuC on the subsequent reset ?

adding @John

>  
>  	ret = guc_ads_update_policies(ads, policies);
>  	kfree(policies);
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.h b/drivers/gpu/drm/xe/xe_guc_ads.h
> index 2e6674c760ff..9879aadd22d6 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.h
> @@ -6,6 +6,8 @@
>  #ifndef _XE_GUC_ADS_H_
>  #define _XE_GUC_ADS_H_
>  
> +#include <linux/types.h>
> +
>  struct xe_guc_ads;
>  
>  int xe_guc_ads_init(struct xe_guc_ads *ads);
> @@ -13,6 +15,6 @@ int xe_guc_ads_init_post_hwconfig(struct xe_guc_ads *ads);
>  void xe_guc_ads_populate(struct xe_guc_ads *ads);
>  void xe_guc_ads_populate_minimal(struct xe_guc_ads *ads);
>  void xe_guc_ads_populate_post_load(struct xe_guc_ads *ads);
> -int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads);
> +int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads, bool enable);
>  
>  #endif

