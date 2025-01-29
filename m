Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 879A5C0218D
	for <intel-xe@archiver.kernel.org>; Wed, 29 Jan 2025 20:18:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E7E110E186;
	Wed, 29 Jan 2025 20:18:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O9Xsba71";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEDF510E186
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Jan 2025 20:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738181902; x=1769717902;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=lzm1Kg8cXpw0ez4Rlq+uwlkpEaSjEOaRddfRU5h/cyk=;
 b=O9Xsba71R9RmOeOJ0foswjtkCb15iEjj6yLiq+9Bn61ud8m6+i+Sw/TK
 Lqir3aj6h0OdFwtggAIvLPQQBLIJWF7r+im941RDpVIx49Oukp0IDYqs+
 SL6DMLfeoBX1iq0B9AAKwIY4jKTueuRbuZtDn26kcZP6lEUPGH52MaoZU
 lyHn67ASafRDdnRihT9hTkVXTC9omZB65tlFgfMXKn4GE2smHS9MMJXAP
 W6CB4H3RTfxdt3dtxuoCiHdQ1dWUuOF1f6O2XuEF4XTMmcNVu4fc/VMbT
 WGNf0RkGdUEKDcb5GzFTRrk5KitwLEy/hFJ6y8bYOY5YE6aH5i9GaeC78 w==;
X-CSE-ConnectionGUID: PdyPTfmsSyWwlb6O/K1vZg==
X-CSE-MsgGUID: DRt4iDXQTtaOS/AY9tcmUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="42639718"
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; d="scan'208";a="42639718"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 12:18:21 -0800
X-CSE-ConnectionGUID: tuj80s/CQeSlNKpNK74VLA==
X-CSE-MsgGUID: 0jV3ieZvQmmLMyTIzRRC9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; d="scan'208";a="109256595"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa008.fm.intel.com with ESMTP; 29 Jan 2025 12:18:19 -0800
Received: from [10.246.5.201] (mwajdecz-MOBL.ger.corp.intel.com [10.246.5.201])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 73D4A2FC71;
 Wed, 29 Jan 2025 20:18:17 +0000 (GMT)
Message-ID: <01266996-b575-46a2-8334-db44a978719c@intel.com>
Date: Wed, 29 Jan 2025 21:18:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/8] drm/xe/guc: Expose engine activity only for
 supported GuC version
To: Riana Tauro <riana.tauro@intel.com>, intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, umesh.nerlige.ramappa@intel.com,
 lucas.demarchi@intel.com, vinay.belgaumkar@intel.com, soham.purkait@intel.com
References: <20250129101653.1976699-1-riana.tauro@intel.com>
 <20250129101653.1976699-4-riana.tauro@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250129101653.1976699-4-riana.tauro@intel.com>
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



On 29.01.2025 11:16, Riana Tauro wrote:
> Engine activity is supported only on GuC submission version >= 1.14.1
> Allow enabling/reading engine activity only on supported
> GuC versions. Warn once if not supported.
> 
> v2: use guc submission version (John)
> v3: use drm_warn_once to avoid stacktrace (Umesh)
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_engine_activity.c | 32 +++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_engine_activity.h |  1 +
>  2 files changed, 33 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.c b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
> index 9c08af273397..4d720afd12ac 100644
> --- a/drivers/gpu/drm/xe/xe_guc_engine_activity.c
> +++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
> @@ -250,6 +250,9 @@ u64 xe_guc_engine_activity_active_ticks(struct xe_hw_engine *hwe)
>  {
>  	struct xe_guc *guc =  &hwe->gt->uc.guc;
>  
> +	if (!xe_guc_engine_activity_supported(guc))
> +		return 0;
> +
>  	return get_engine_active_ticks(guc, hwe);
>  }
>  
> @@ -263,9 +266,32 @@ u64 xe_guc_engine_activity_total_ticks(struct xe_hw_engine *hwe)
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
> + * xe_guc_engine_activity_supported - Check support for Engine activity stats
> + * @guc: The GuC object
> + *
> + * Engine activity stats is supported from GuC submission version
> + * (1.14.1)
> + *
> + * Return: true if engine activity stats supported, false otherwise
> + */
> +bool xe_guc_engine_activity_supported(struct xe_guc *guc)
> +{
> +	if (GUC_SUBMIT_VER(guc) >= MAKE_GUC_VER(1, 14, 1))
> +		return true;

this patch seems to be redundant as patch:

[PATCH v4 5/8] drm/xe/guc: Bump minimum required GuC version to v70.36.0

now requires at least submit version 1.17.1

> +
> +	drm_warn_once(&guc_to_xe(guc)->drm,

btw, for GuC related logs we prefer xe_gt_info() logs

and _once() variant is n/a here as it will hide any other messages from
drivers running on other devices that might be present on the system

better option seems to be check/log once in the init() and then just set
a flag that could be used later

> +		      "per-engine-class activity not supported for this GuC version\n");

and maybe we should be more friendly and instead "this" also print
actual version used to save the user looking for it elsewhere

> +
> +	return false;
> +}
> +
>  /**
>   * xe_guc_engine_activity_enable_stats - Enable engine activity stats
>   * @guc: The GuC object
> @@ -276,6 +302,9 @@ void xe_guc_engine_activity_enable_stats(struct xe_guc *guc)
>  {
>  	int ret;
>  
> +	if (!xe_guc_engine_activity_supported(guc))
> +		return;
> +
>  	ret = enable_engine_activity_stats(guc);
>  	if (ret)
>  		xe_gt_err(guc_to_gt(guc), "failed to enable activity stats%d\n", ret);
> @@ -302,6 +331,9 @@ int xe_guc_engine_activity_init(struct xe_guc *guc)
>  	struct xe_gt *gt = guc_to_gt(guc);
>  	int ret;
>  
> +	if (!xe_guc_engine_activity_supported(guc))
> +		return 0;
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

