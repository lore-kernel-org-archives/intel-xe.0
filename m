Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1334C5475B
	for <intel-xe@archiver.kernel.org>; Fri,  1 Mar 2024 17:47:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7837F10E094;
	Fri,  1 Mar 2024 17:47:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZI32N6GI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C16E10E120
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Mar 2024 17:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709315250; x=1740851250;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=SJwTC7MuSGz3+AllJv7EhefQkHJjTR7XJWpzYcl3iQc=;
 b=ZI32N6GI2ua+wXa98p0AiITD8CR48r2hmfh948+ZZHK2Hffrjt6V+wDS
 UqYY0+noyYjpDs7LGYjiNwMIeyTtpm4cCDHqk584pcxMPffaO24chd4Kc
 q1NlMUl0/ndU0jn+JcZfg1FTkJHg1Gqhd+OF0wlL/BhEN83SRZdWo/ugQ
 FRECBFI2btFMg6zNL4ozf1LsDSQ4uNOrxypQRtlsyosepq0QQUu1pCslc
 oY1XjcaHCKCLFMd0ndSfSNEBMEEq1mKz9ld4ZlCV9Kw/GOla26dsw7Tym
 RBhZ4zIuc5iv6ddoD8BGKcN1f7kfFEV6H70coPXgL3g152AOz0oltiBt/ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11000"; a="21321095"
X-IronPort-AV: E=Sophos;i="6.06,196,1705392000"; d="scan'208";a="21321095"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2024 09:47:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,196,1705392000"; 
   d="scan'208";a="8827345"
Received: from knomani-mobl.ger.corp.intel.com (HELO [10.252.3.163])
 ([10.252.3.163])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2024 09:47:29 -0800
Message-ID: <37b53465-2c4b-4099-913d-1cdf6ce3e576@intel.com>
Date: Fri, 1 Mar 2024 17:47:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/xe: Fix display runtime_pm handling
Content-Language: en-GB
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
Cc: Anshuman Gupta <anshuman.gupta@intel.com>
References: <20240227183725.505699-1-rodrigo.vivi@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240227183725.505699-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 27/02/2024 18:37, Rodrigo Vivi wrote:
> i915's intel_runtime_pm_get_if_in_use actually calls the
> pm_runtime_get_if_active() with ign_usage_count = false, but Xe
> was erroneously calling it with true because of the mem_access cases.
> 
> This can lead to unnecessary references getting hold here and device
> never getting into the runtime suspended state.
> 
> Let's use directly the 'if_in_use' function provided by linux/pm_runtime.
> 
> Also, already start this new function protected from the runtime
> recursion, since runtime_pm will need to call for display functions
> for a proper D3Cold flow.
> 
> v2: Update commit message based on Matt's feedback.
>      Fix return condition of pm_runtime_get_if_in_use (Matt)
> 
> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Assuming this is applied on top of: drm/xe: Convert 
xe_pm_runtime_{get,put} to void and protect from recursion,

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   .../gpu/drm/xe/compat-i915-headers/i915_drv.h   |  2 +-
>   drivers/gpu/drm/xe/xe_pm.c                      | 17 +++++++++++++++++
>   drivers/gpu/drm/xe/xe_pm.h                      |  1 +
>   3 files changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
> index 420eba0e4be0..ad5864d1dd74 100644
> --- a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
> +++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
> @@ -177,7 +177,7 @@ static inline intel_wakeref_t intel_runtime_pm_get_if_in_use(struct xe_runtime_p
>   {
>   	struct xe_device *xe = container_of(pm, struct xe_device, runtime_pm);
>   
> -	return xe_pm_runtime_get_if_active(xe);
> +	return xe_pm_runtime_get_if_in_use(xe);
>   }
>   
>   static inline void intel_runtime_pm_put_unchecked(struct xe_runtime_pm *pm)
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index b5511e3c3153..7d7df78f3a2f 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -457,6 +457,23 @@ int xe_pm_runtime_get_if_active(struct xe_device *xe)
>   	return pm_runtime_get_if_active(xe->drm.dev, true);
>   }
>   
> +/**
> + * xe_pm_runtime_get_if_in_use - Get a runtime_pm reference and resume if needed
> + * @xe: xe device instance
> + *
> + * Returns: True if device is awake and the reference was taken, false otherwise.
> + */
> +bool xe_pm_runtime_get_if_in_use(struct xe_device *xe)
> +{
> +	if (xe_pm_read_callback_task(xe) == current) {
> +		/* The device is awake, grab the ref and move on */
> +		pm_runtime_get_noresume(xe->drm.dev);
> +		return true;
> +	}
> +
> +	return pm_runtime_get_if_in_use(xe->drm.dev) > 0;
> +}
> +
>   /**
>    * xe_pm_assert_unbounded_bridge - Disable PM on unbounded pcie parent bridge
>    * @xe: xe device instance
> diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
> index 7f5884babb29..bb4723a98405 100644
> --- a/drivers/gpu/drm/xe/xe_pm.h
> +++ b/drivers/gpu/drm/xe/xe_pm.h
> @@ -30,6 +30,7 @@ int xe_pm_runtime_get(struct xe_device *xe);
>   int xe_pm_runtime_get_ioctl(struct xe_device *xe);
>   int xe_pm_runtime_put(struct xe_device *xe);
>   int xe_pm_runtime_get_if_active(struct xe_device *xe);
> +bool xe_pm_runtime_get_if_in_use(struct xe_device *xe);
>   void xe_pm_assert_unbounded_bridge(struct xe_device *xe);
>   int xe_pm_set_vram_threshold(struct xe_device *xe, u32 threshold);
>   void xe_pm_d3cold_allowed_toggle(struct xe_device *xe);
