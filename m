Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1290FC02199
	for <intel-xe@archiver.kernel.org>; Thu,  6 Feb 2025 19:15:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0AE010E155;
	Thu,  6 Feb 2025 19:15:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f5f+KAjv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD50D10E155
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Feb 2025 19:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738869348; x=1770405348;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=3QgIk9pOVbMs9FaoqiX9eOdLCWxdilb/KuA2bdgxOzM=;
 b=f5f+KAjvBpkR5Pov2YRwAKDRSv7TAm6WSldh6rA4cbmvI3W0aB4EgmIN
 Y1RbJI7AkBcvEKWenQaDxsiYbXBbulDJIyHRyWb/fCRtpl12U1h7yTZZ9
 8akFo74HquDY1c9CNLGNq/OK1UVyfe5ftp3d/qPwFY29gZDJMVFxfbJk/
 s4I81V74IMiprbzciSJjDQ8052rYBSWdM8OzrQaS6GwfXaEyTiMd/4B1N
 IISW/cZW23xXGFEsJWkzeO8Io6JCb6D/m3Mkd5sTuilqlmY0aK63Aw8rL
 sGhtq2OS6YW8qenu9vxCieV5ualV5pEOr1OwHs5G2iTYnIdPM3LlY231u A==;
X-CSE-ConnectionGUID: mAKYMBinTd+pMDMaSuIdMw==
X-CSE-MsgGUID: pUj/sD2/Qu+qvW+18wRNDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="50923064"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="50923064"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 11:15:48 -0800
X-CSE-ConnectionGUID: Z133fCkERlqOS0cHduWDyg==
X-CSE-MsgGUID: 26mawH+4S+mDQAw/h4R59w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,265,1732608000"; d="scan'208";a="116301347"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa004.jf.intel.com with ESMTP; 06 Feb 2025 11:15:45 -0800
Received: from [10.245.96.215] (unknown [10.245.96.215])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 26D4427BAA;
 Thu,  6 Feb 2025 19:15:43 +0000 (GMT)
Message-ID: <61dd8ba7-5fa2-47db-a03f-81fae29cc1e9@intel.com>
Date: Thu, 6 Feb 2025 20:15:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 7/8] drm/xe/xe_pmu: Add pmu support for per-function
 engine activity stats
To: Riana Tauro <riana.tauro@intel.com>, intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, umesh.nerlige.ramappa@intel.com,
 lucas.demarchi@intel.com, vinay.belgaumkar@intel.com, soham.purkait@intel.com
References: <20250206104358.3436519-1-riana.tauro@intel.com>
 <20250206104358.3436519-8-riana.tauro@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250206104358.3436519-8-riana.tauro@intel.com>
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
> Add pmu support for per-function engine activity
> stats.

PMU ?
unneeded line wrap ?

> 
> per-function engine activity is enabled when sriov_numvfs
> are set. If sriov_numvfs is set to 2, then the applicable function
> values are
> 
> 0 - PF engine activity
> 1,2 - per-VF engine activity from PF

0 - PF engine activity
1 - VF1 engine activity
2 - VF2 engine activity

but maybe better to show full entries:

xe_0000_03_00.0/engine...ticks/ - PF activity
xe_0000_03_00.1/engine...ticks/ - VF1 activity
xe_0000_03_00.2/engine...ticks/ - VF2 activity

as 'function' term here matches 'PCI function'

> 
> This can be read from perf tool as shown below
> 
> ./perf stat -e xe_<bdf>/engine-active-ticks,gt=0,engine_class=0,
> 			 engine_instance=0,function=1/ -I 1000
> 
> v2: fix documentation (Umesh)
>     remove global for functions (Lucas, Michal)
> 
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pmu.c | 38 ++++++++++++++++++++++++++++++-------
>  1 file changed, 31 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
> index a758fc517048..66cf2ece97ec 100644
> --- a/drivers/gpu/drm/xe/xe_pmu.c
> +++ b/drivers/gpu/drm/xe/xe_pmu.c
> @@ -13,6 +13,7 @@
>  #include "xe_hw_engine.h"
>  #include "xe_pm.h"
>  #include "xe_pmu.h"
> +#include "xe_sriov_pf_helpers.h"
>  
>  /**
>   * DOC: Xe PMU (Performance Monitoring Unit)
> @@ -32,9 +33,10 @@
>   *	gt[60:63]		Selects gt for the event
>   *	engine_class[20:27]	Selects engine-class for event
>   *	engine_instance[12:19]	Selects the engine-instance for the event
> + *	function[44:59]		Selects the function of the event (SRIOV enabled)
>   *
>   * For engine specific events (engine-*), gt, engine_class and engine_instance parameters must be
> - * set as populated by DRM_XE_DEVICE_QUERY_ENGINES.
> + * set as populated by DRM_XE_DEVICE_QUERY_ENGINES and function if SRIOV is enabled.
>   *
>   * For gt specific events (gt-*) gt parameter must be passed. All other parameters will be 0.
>   *
> @@ -49,6 +51,7 @@
>   */
>  
>  #define XE_PMU_EVENT_GT_MASK			GENMASK_ULL(63, 60)
> +#define XE_PMU_EVENT_FUNCTION_MASK		GENMASK_ULL(59, 44)
>  #define XE_PMU_EVENT_ENGINE_CLASS_MASK		GENMASK_ULL(27, 20)
>  #define XE_PMU_EVENT_ENGINE_INSTANCE_MASK	GENMASK_ULL(19, 12)
>  #define XE_PMU_EVENT_ID_MASK			GENMASK_ULL(11, 0)
> @@ -58,6 +61,11 @@ static unsigned int config_to_event_id(u64 config)
>  	return FIELD_GET(XE_PMU_EVENT_ID_MASK, config);
>  }
>  
> +static unsigned int config_to_function_id(u64 config)
> +{
> +	return FIELD_GET(XE_PMU_EVENT_FUNCTION_MASK, config);
> +}
> +
>  static unsigned int config_to_engine_class(u64 config)
>  {
>  	return FIELD_GET(XE_PMU_EVENT_ENGINE_CLASS_MASK, config);
> @@ -146,7 +154,7 @@ static bool event_supported(struct xe_pmu *pmu, unsigned int gt,
>  static bool event_param_valid(struct perf_event *event)
>  {
>  	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
> -	unsigned int engine_class, engine_instance;
> +	unsigned int engine_class, engine_instance, function_id;
>  	u64 config = event->attr.config;
>  	struct xe_gt *gt;
>  
> @@ -154,18 +162,28 @@ static bool event_param_valid(struct perf_event *event)
>  	if (!gt)
>  		return false;
>  
> +	function_id = config_to_function_id(config);
> +	if (function_id && !IS_SRIOV_PF(xe))

hmm, it rather should be:

	if (function_id && IS_SRIOV_VF(xe))

but (see below)

> +		return false;
> +
>  	engine_class = config_to_engine_class(config);
>  	engine_instance = config_to_engine_instance(config);
>  
>  	switch (config_to_event_id(config)) {
>  	case XE_PMU_EVENT_GT_C6_RESIDENCY:
> -		if (engine_class || engine_instance)
> +		if (engine_class || engine_instance || function_id)
>  			return false;
>  		break;
>  	case XE_PMU_EVENT_ENGINE_ACTIVE_TICKS:
>  	case XE_PMU_EVENT_ENGINE_TOTAL_TICKS:
>  		if (!event_to_hwe(event))
>  			return false;
> +		/*
> +		 * PF(0) and total vfs when SRIOV is enabled
> +		 */
> +		if (function_id > xe_sriov_pf_get_totalvfs(xe))

shouldn't we rely on checks from one place?

likely xe_guc_engine_activity_xxx() will also have checks for
index/function and may use ea->num_functions for that

> +			return false;
> +
>  		break;
>  	}
>  
> @@ -233,18 +251,22 @@ static u64 read_engine_events(struct perf_event *event, u64 prev)
>  	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
>  	struct xe_pmu *pmu = &xe->pmu;
>  	struct xe_hw_engine *hwe;
> -	u64 val = 0;
> +	unsigned int function_id;
> +	u64 config, val = 0;
>  
>  	if (!pmu->fw_count)
>  		return prev;
>  
> +	config = event->attr.config;
> +	function_id = config_to_function_id(config);
> +
>  	hwe = event_to_hwe(event);
>  	if (!hwe)
>  		drm_warn(&xe->drm, "unknown pmu engine\n");
> -	else if (config_to_event_id(event->attr.config) == XE_PMU_EVENT_ENGINE_ACTIVE_TICKS)
> -		val = xe_guc_engine_activity_active_ticks(hwe, 0);
> +	else if (config_to_event_id(config) == XE_PMU_EVENT_ENGINE_ACTIVE_TICKS)
> +		val = xe_guc_engine_activity_active_ticks(hwe, function_id);
>  	else
> -		val = xe_guc_engine_activity_total_ticks(hwe, 0);
> +		val = xe_guc_engine_activity_total_ticks(hwe, function_id);
>  
>  	return val;
>  }
> @@ -347,6 +369,7 @@ static void xe_pmu_event_del(struct perf_event *event, int flags)
>  }
>  
>  PMU_FORMAT_ATTR(gt,			"config:60-63");
> +PMU_FORMAT_ATTR(function,		"config:44-59");
>  PMU_FORMAT_ATTR(engine_class,		"config:20-27");
>  PMU_FORMAT_ATTR(engine_instance,	"config:12-19");
>  PMU_FORMAT_ATTR(event,			"config:0-11");
> @@ -355,6 +378,7 @@ static struct attribute *pmu_format_attrs[] = {
>  	&format_attr_event.attr,
>  	&format_attr_engine_class.attr,
>  	&format_attr_engine_instance.attr,
> +	&format_attr_function.attr,
>  	&format_attr_gt.attr,
>  	NULL,
>  };

