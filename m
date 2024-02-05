Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E194DC48291
	for <intel-xe@archiver.kernel.org>; Mon,  5 Feb 2024 09:18:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85E2111246D;
	Mon,  5 Feb 2024 09:18:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LLYaECBr";
	dkim-atps=neutral
X-Greylist: delayed 427 seconds by postgrey-1.36 at gabe;
 Mon, 05 Feb 2024 09:18:50 UTC
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2385011246D
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Feb 2024 09:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707124730; x=1738660730;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=YshbH8IQOUw0gcqLkmOQy0NOX/xnjNmhFj0wYjUzhHY=;
 b=LLYaECBrTxD4H/kchOy5r1eKGnS2ChgTnr80ZBJ6pjompDLAKpx6nk0h
 /scUyhd4TFdNI3TTXHsjm6BeOtJ40uELYCn1Y7lTR+HYf1Kog0APSiAoU
 suwfDtABzrDjx18v+VpxQfus6ZD35I4IkZOXxsz4dmPTfT5NUF58YY2+S
 j2YtcLmuJCKI6qtYmOufSvL5C1ykbq2c0hpUrGNJSN3mr91glrUDyiBsL
 /hqngTQlKpsd55X0XL+jXThdl+qRZtyi8c+PUOd/OHKOP47RTjyfvRasJ
 itJ2ACoTuyV/9s0cPni1Sj1Hf1wwz2WwKR1cQ5FPjP90LlxC8x4b7YMev A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="395966"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="395966"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2024 01:11:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; d="scan'208";a="38081954"
Received: from vgolodni-mobl.ger.corp.intel.com (HELO [10.252.0.151])
 ([10.252.0.151])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2024 01:11:40 -0800
Message-ID: <ae9804f0-8188-4cb4-b4e5-c50a1a5101d6@intel.com>
Date: Mon, 5 Feb 2024 09:11:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 03/34] drm/xe: Fix display runtime_pm handling
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
References: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
 <20240126203044.1104705-4-rodrigo.vivi@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240126203044.1104705-4-rodrigo.vivi@intel.com>
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

On 26/01/2024 20:30, Rodrigo Vivi wrote:
> i915's intel_runtime_pm_get_if_in_use actually calls the
> pm_runtime_get_if_active() with ign_usage_count = false, but Xe
> was erroneously calling it with true because of the mem_access cases.

Good catch.

> This can lead to unbalanced references.

Is there an actual imbalance here though? Is it not just a case of being 
overzealous in keeping the device awake when it is not currently 
"in_use" vs "if_active"? If the api increments the usage count we will 
still decrement it later, regardless of active vs in-use, AFAICT.

> 
> Let's use directly the 'if_in_use' function provided by linux/pm_runtime.
> 
> Also, already start this new function protected from the runtime
> recursion, since runtime_pm will need to call for display functions
> for a proper D3Cold flow.
> 
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
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
> index bd35fe9f6227..19f88cb7715b 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -417,6 +417,23 @@ int xe_pm_runtime_get_if_active(struct xe_device *xe)
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
> +	return pm_runtime_get_if_in_use(xe->drm.dev) >= 0;

This is doing atomic_inc_not_zero() underneath for the "in_use" case 
AFAICT. If the usage count is zero it doesn't increment it and returns 
0. Does that not lead to an imbalance? Should this rather be > 0?

> +}
> +
>   /**
>    * xe_pm_assert_unbounded_bridge - Disable PM on unbounded pcie parent bridge
>    * @xe: xe device instance
> diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
> index 64a97c6726a7..9d372cbf388b 100644
> --- a/drivers/gpu/drm/xe/xe_pm.h
> +++ b/drivers/gpu/drm/xe/xe_pm.h
> @@ -28,6 +28,7 @@ int xe_pm_runtime_resume(struct xe_device *xe);
>   int xe_pm_runtime_get(struct xe_device *xe);
>   int xe_pm_runtime_put(struct xe_device *xe);
>   int xe_pm_runtime_get_if_active(struct xe_device *xe);
> +bool xe_pm_runtime_get_if_in_use(struct xe_device *xe);
>   void xe_pm_assert_unbounded_bridge(struct xe_device *xe);
>   int xe_pm_set_vram_threshold(struct xe_device *xe, u32 threshold);
>   void xe_pm_d3cold_allowed_toggle(struct xe_device *xe);
