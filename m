Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF7A7C3ABD8
	for <intel-xe@archiver.kernel.org>; Wed, 14 May 2025 20:43:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACD4C10E746;
	Wed, 14 May 2025 20:43:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SDWPSVjd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D236810E741
 for <intel-xe@lists.freedesktop.org>; Wed, 14 May 2025 20:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747255435; x=1778791435;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=vAEEGMYkLYRfH+XNOh7JEBQTNp189RPQtqf9dN8pV5s=;
 b=SDWPSVjd2nbItbliGO+xTbg9Y+q20/jBebrAHDlnHnuWBycbQ1AfaczB
 GJCsVqIt4ruuiphC90m9XKHVUhMRUf+veRpz0eOtu8gCeVmyoX5OLBmMY
 LKs4V+KPNJXiwvikeF4C/AN0CuLHpVVqX5OHhEAhhvubA37NryJBq4VOg
 YGTsmqUlen6jDl9G2pduOibWfWlSWtt6WxrFuY8FPi7IBlkEc5BLaJPEU
 ErJwb/cfq1TytEJ2BNorow4il+OPNZrLOdVjMMDuyQ44DuvJBJhN7m1m2
 duotCPPg48xELeYrAsZPlNSWonqQhCpJkZbHSoILluaUuuc5Rxh+LaniE w==;
X-CSE-ConnectionGUID: 5yrzmiILTJeqO+uGmeKOsQ==
X-CSE-MsgGUID: 2KV53J/aSemxJojhfD4/EQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="49038996"
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="49038996"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 13:43:55 -0700
X-CSE-ConnectionGUID: /L4RlU0FRPezkcLHOBYGGA==
X-CSE-MsgGUID: 24LPPI+aQeK7MzBmu+kX1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="138663492"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa010.fm.intel.com with ESMTP; 14 May 2025 13:43:53 -0700
Received: from [10.246.5.201] (mwajdecz-MOBL.ger.corp.intel.com [10.246.5.201])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 953B93497C;
 Wed, 14 May 2025 21:43:52 +0100 (IST)
Message-ID: <58c9849a-5e23-49e4-b9a6-92bbcd42991a@intel.com>
Date: Wed, 14 May 2025 22:43:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] drm/xe: Don't update wedged mode in case of an
 error
To: Lukasz Laguna <lukasz.laguna@intel.com>, intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, matthew.brost@intel.com
References: <20250514101124.12437-1-lukasz.laguna@intel.com>
 <20250514101124.12437-3-lukasz.laguna@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250514101124.12437-3-lukasz.laguna@intel.com>
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
> Update driver's internal wedged.mode state only in case of a success to
> avoid inconsistent state.
> 
> Fixes: 6b8ef44cc0a9 ("drm/xe: Introduce the wedged_mode debugfs")
> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_debugfs.c | 8 ++++----
>  drivers/gpu/drm/xe/xe_guc_ads.c | 7 ++++---
>  drivers/gpu/drm/xe/xe_guc_ads.h | 3 ++-
>  3 files changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index 5dd0ad3f9bae..72515fc638b1 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -170,19 +170,19 @@ static ssize_t wedged_mode_set(struct file *f, const char __user *ubuf,
>  	if (xe->wedged.mode == wedged_mode)
>  		return size;
>  
> -	xe->wedged.mode = wedged_mode;
> -
>  	xe_pm_runtime_get(xe);
>  	for_each_gt(gt, xe, id) {
> -		ret = xe_guc_ads_scheduler_policy_toggle_reset(&gt->uc.guc.ads);
> +		ret = xe_guc_ads_scheduler_policy_toggle_reset(&gt->uc.guc.ads, wedged_mode);

btw, do we really need to update the GuC policy when changing modes:

	from NEVER to UPON_CRITICAL
	from UPON_CRITICAL to NEVER

the reset policy needs to be toggled only when changing mode:

	from NEVER to UPON_ANY_HANG
	from UPON_CRITICAL to UPON_ANY_HANG
	from UPON_ANY_HANG to NEVER
	from UPON_ANY_HANG to UPON_CRITICAL

>  		if (ret) {
> -			xe_gt_err(gt, "Failed to update GuC ADS scheduler policy. GuC may still cause engine reset even with wedged_mode=2\n");
> +			xe_gt_err(gt, "Failed to update GuC ADS scheduler policy\n");
>  			xe_pm_runtime_put(xe);
>  			return -EIO;
>  		}
>  	}
>  	xe_pm_runtime_put(xe);
>  
> +	xe->wedged.mode = wedged_mode;
> +
>  	return size;
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index 413711bd3f58..99aec2e8378b 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -997,12 +997,13 @@ static int guc_ads_action_update_policies(struct xe_guc_ads *ads, u32 policy_off
>  /**
>   * xe_guc_ads_scheduler_policy_toggle_reset - Toggle reset policy
>   * @ads: Additional data structures object
> + * @mode: The wedged mode
>   *
> - * This function update the GuC's engine reset policy based on wedged.mode.
> + * This function update the GuC's engine reset policy based on wedged mode.
>   *
>   * Return: 0 on success, and negative error code otherwise.
>   */
> -int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads)
> +int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads, enum xe_wedged_mode mode)
>  {
>  	struct xe_device *xe = ads_to_xe(ads);
>  	struct xe_gt *gt = ads_to_gt(ads);
> @@ -1018,7 +1019,7 @@ int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads)
>  	policies->dpc_promote_time = ads_blob_read(ads, policies.dpc_promote_time);
>  	policies->max_num_work_items = ads_blob_read(ads, policies.max_num_work_items);
>  	policies->is_valid = 1;
> -	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG)
> +	if (mode == XE_WEDGED_MODE_UPON_ANY_HANG)
>  		policies->global_flags |= GLOBAL_POLICY_DISABLE_ENGINE_RESET;
>  	else
>  		policies->global_flags &= ~GLOBAL_POLICY_DISABLE_ENGINE_RESET;
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.h b/drivers/gpu/drm/xe/xe_guc_ads.h
> index 2e6674c760ff..641d9c8375fc 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.h
> @@ -7,12 +7,13 @@
>  #define _XE_GUC_ADS_H_
>  
>  struct xe_guc_ads;
> +enum xe_wedged_mode;
>  
>  int xe_guc_ads_init(struct xe_guc_ads *ads);
>  int xe_guc_ads_init_post_hwconfig(struct xe_guc_ads *ads);
>  void xe_guc_ads_populate(struct xe_guc_ads *ads);
>  void xe_guc_ads_populate_minimal(struct xe_guc_ads *ads);
>  void xe_guc_ads_populate_post_load(struct xe_guc_ads *ads);
> -int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads);
> +int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads, enum xe_wedged_mode mode);
>  
>  #endif

