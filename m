Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D9A9C02194
	for <intel-xe@archiver.kernel.org>; Thu,  6 Feb 2025 18:39:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 472D210E30F;
	Thu,  6 Feb 2025 18:39:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HH5RrSUA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FF0010E306
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Feb 2025 18:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738867161; x=1770403161;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=pAXz6caguOCFMJcJ7tM3KyJ6kJmyiyj6QI/FLyqplgg=;
 b=HH5RrSUAtfCrXb3xGOq0oxnCQ3g0f76jK86zQOiN+kX0ZQdloDgqlo/z
 snIbhxSI0CZgcxF6l3Sr4aKEMCV2FYOsXnY56tkWRUN0RgbdLtdli5Ttu
 mJpRg4guKZSnMdFbj/CWfrNGMqyjYudB8G0am/witP0Tujdpm4pbs3iPW
 voNyoxsyt4qMF4JzsnRRb/WceaHLilK5ptZUEv65XKFn/IO+CJQtL7JVk
 hSDIisVjjgpZpGS6rar7mv4dF75/fLAo/dt1CrsiDH5Hyq3gINQFS/1vA
 P4a0mHGgVW2Po7eDSPS8+AIjbSEg577Xxx7/3PVoIiygAvHpa1z5iXhfX Q==;
X-CSE-ConnectionGUID: cY/mp1MqQxq6fgkbxEuq+w==
X-CSE-MsgGUID: byugSgtkT1i5fNwr4Mg1lw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="50474413"
X-IronPort-AV: E=Sophos;i="6.13,265,1732608000"; d="scan'208";a="50474413"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 10:39:21 -0800
X-CSE-ConnectionGUID: +aeeC0lBQXGxZDU7QZE90w==
X-CSE-MsgGUID: kohv83fOTi+BVF51oKKCQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,265,1732608000"; d="scan'208";a="111260789"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa006.jf.intel.com with ESMTP; 06 Feb 2025 10:39:13 -0800
Received: from [10.245.96.215] (unknown [10.245.96.215])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 6519232C9D;
 Thu,  6 Feb 2025 18:39:11 +0000 (GMT)
Message-ID: <810aa04d-0781-43be-8914-8f6c60f42f5e@intel.com>
Date: Thu, 6 Feb 2025 19:39:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/8] drm/xe/guc: Expose engine activity only for
 supported GuC version
To: Riana Tauro <riana.tauro@intel.com>, intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, umesh.nerlige.ramappa@intel.com,
 lucas.demarchi@intel.com, vinay.belgaumkar@intel.com,
 soham.purkait@intel.com, John Harrison <John.C.Harrison@Intel.com>
References: <20250206104358.3436519-1-riana.tauro@intel.com>
 <20250206104358.3436519-4-riana.tauro@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250206104358.3436519-4-riana.tauro@intel.com>
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



On 06.02.2025 11:43, Riana Tauro wrote:
> Engine activity is supported only on GuC submission version >= 1.14.1
> Allow enabling/reading engine activity only on supported
> GuC versions. Warn once if not supported.
> 
> v2: use guc interface version (John)
> v3: do not use drm_WARN (Umesh)
> v4: use variable for supported and use gt logs
>     use a friendlier log message (Michal)
> 
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_engine_activity.c   | 42 +++++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_engine_activity.h   |  1 +
>  .../gpu/drm/xe/xe_guc_engine_activity_types.h |  3 ++
>  3 files changed, 46 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.c b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
> index 9c08af273397..5d67fe38639a 100644
> --- a/drivers/gpu/drm/xe/xe_guc_engine_activity.c
> +++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
> @@ -89,6 +89,22 @@ static int allocate_engine_activity_buffers(struct xe_guc *guc,
>  	return 0;
>  }
>  
> +static bool engine_activity_supported(struct xe_guc *guc)

maybe rename it a little to distinguish from other function that just
look at engine_activity->supported flag?

> +{
> +	struct xe_uc_fw_version *version = &guc->fw.versions.found[XE_UC_FW_VER_COMPATIBILITY];
> +	struct xe_gt *gt = guc_to_gt(guc);
> +
> +	/* engine activity stats is supported from GuC interface version (1.14.1) */
> +	if (GUC_SUBMIT_VER(guc) >= MAKE_GUC_VER(1, 14, 1))
> +		return true;

it also doesn't work on VFs
so maybe it should be different logic:

	if (IS_SRIOV_VF) {
		xt_gt_into("EA not supported on VFs\n");
		return false;
	}

	if (GUC_SUBMIT_VER < 1.14.1) {
		xt_gt_into("EA not supported on vA, need vB+\n");
		return false;
	}

> +
> +	xe_gt_warn(gt,

does it really need to be 'warn' level?

> +		   "engine activity stats unsupported in GuC interface v%u.%u.%u, v%u.%u.%u or newer required\n",
> +		   version->major, version->minor, version->patch, 1, 14, 1);
> +
> +	return false;
> +}
> +
>  static struct engine_activity *hw_engine_to_engine_activity(struct xe_hw_engine *hwe)
>  {
>  	struct xe_guc *guc = &hwe->gt->uc.guc;
> @@ -250,6 +266,9 @@ u64 xe_guc_engine_activity_active_ticks(struct xe_hw_engine *hwe)
>  {
>  	struct xe_guc *guc =  &hwe->gt->uc.guc;
>  
> +	if (!xe_guc_engine_activity_supported(guc))
> +		return 0;
> +
>  	return get_engine_active_ticks(guc, hwe);
>  }
>  
> @@ -263,9 +282,27 @@ u64 xe_guc_engine_activity_total_ticks(struct xe_hw_engine *hwe)
>  {
>  	struct xe_guc *guc =  &hwe->gt->uc.guc;
>  
> +	if (!xe_guc_engine_activity_supported(guc))
> +		return 0;
> +
>  	return get_engine_total_ticks(guc, hwe);
>  }
>  
> +/**
> + * xe_guc_engine_activity_supported - Check support for engine activity stats
> + * @guc: The GuC object
> + *
> + * Engine activity stats is supported from GuC interface version (1.14.1)

what about VFs?

> + *
> + * Return: true if engine activity stats supported, false otherwise
> + */
> +bool xe_guc_engine_activity_supported(struct xe_guc *guc)
> +{
> +	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
> +
> +	return engine_activity->supported;
> +}
> +
>  /**
>   * xe_guc_engine_activity_enable_stats - Enable engine activity stats
>   * @guc: The GuC object
> @@ -276,6 +313,9 @@ void xe_guc_engine_activity_enable_stats(struct xe_guc *guc)
>  {
>  	int ret;
>  
> +	if (!xe_guc_engine_activity_supported(guc))
> +		return;
> +
>  	ret = enable_engine_activity_stats(guc);
>  	if (ret)
>  		xe_gt_err(guc_to_gt(guc), "failed to enable activity stats%d\n", ret);
> @@ -302,6 +342,8 @@ int xe_guc_engine_activity_init(struct xe_guc *guc)
>  	struct xe_gt *gt = guc_to_gt(guc);
>  	int ret;
>  
> +	engine_activity->supported = engine_activity_supported(guc);

should we continue if not supported ?

> +
>  	ret = allocate_engine_activity_group(guc);
>  	if (ret) {
>  		xe_gt_err(gt, "failed to allocate activity group %d\n", ret);
> diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.h b/drivers/gpu/drm/xe/xe_guc_engine_activity.h
> index c00f3da5513d..9d3ea3f67b6a 100644
> --- a/drivers/gpu/drm/xe/xe_guc_engine_activity.h
> +++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.h
> @@ -12,6 +12,7 @@ struct xe_hw_engine;
>  struct xe_guc;
>  
>  int xe_guc_engine_activity_init(struct xe_guc *guc);
> +bool xe_guc_engine_activity_supported(struct xe_guc *guc);
>  void xe_guc_engine_activity_enable_stats(struct xe_guc *guc);
>  u64 xe_guc_engine_activity_active_ticks(struct xe_hw_engine *hwe);
>  u64 xe_guc_engine_activity_total_ticks(struct xe_hw_engine *hwe);
> diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity_types.h b/drivers/gpu/drm/xe/xe_guc_engine_activity_types.h
> index a2ab327d3eec..81002c83d65e 100644
> --- a/drivers/gpu/drm/xe/xe_guc_engine_activity_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_engine_activity_types.h
> @@ -79,6 +79,9 @@ struct xe_guc_engine_activity {
>  	/** @num_activity_group: number of activity groups */
>  	u32 num_activity_group;
>  
> +	/** @supported: checks if engine activity is supported */

indicates?

> +	bool supported;
> +
>  	/** @eag: holds the device level engine activity data */
>  	struct engine_activity_group *eag;
>  

