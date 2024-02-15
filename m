Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45B06C48BEB
	for <intel-xe@archiver.kernel.org>; Thu, 15 Feb 2024 09:30:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CFDF10E54C;
	Thu, 15 Feb 2024 09:30:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M2CVEeTF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E94710E540
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Feb 2024 09:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707989411; x=1739525411;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=yMx6+8bao97hOCgvGAnoyvr4CbukqP1SoF6Ov0oJMIE=;
 b=M2CVEeTFFmjKaLyAF5ldvmklDgIENAqpt52fFaMMsYRwPJGm5WWjRPO5
 3dHj+sRIEQEzJkX/PwBWhrwJuvl/X7fSeNi7XALw8FvSES/XtHx7oaeIf
 ONH61rVvqWI6LsuTswK8jkRCW2ZeJlUqxZXhb5jNJc1RjlAvQMoyZudrw
 0slUlEodtnptOz660EfvNHUOGaKvyur9P9t3x3SOkZMC/C15QtCGgB3VI
 cWwOFkY7AD0g20gffFD8Rgx9e74lxjRLgtV2Urr+4e7CeIKRMHTIBxzwH
 8RT2i2AwHl6tsLrx3NurdUIwBGrYeVQ65cY+y+K7sELSN02OygaB+fZYX g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="13166610"
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; d="scan'208";a="13166610"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 01:30:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; 
   d="scan'208";a="3469495"
Received: from dhalpin-mobl1.ger.corp.intel.com (HELO [10.252.21.158])
 ([10.252.21.158])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 01:30:10 -0800
Message-ID: <ab5ab5d3-a04f-4451-a1da-1ed0e5330557@intel.com>
Date: Thu, 15 Feb 2024 09:30:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 03/34] drm/xe: Fix display runtime_pm handling
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
 <20240126203044.1104705-4-rodrigo.vivi@intel.com>
 <ae9804f0-8188-4cb4-b4e5-c50a1a5101d6@intel.com> <Zc0A1fSxFFtJ0uVk@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <Zc0A1fSxFFtJ0uVk@intel.com>
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

On 14/02/2024 18:05, Rodrigo Vivi wrote:
> On Mon, Feb 05, 2024 at 09:11:37AM +0000, Matthew Auld wrote:
>> On 26/01/2024 20:30, Rodrigo Vivi wrote:
>>> i915's intel_runtime_pm_get_if_in_use actually calls the
>>> pm_runtime_get_if_active() with ign_usage_count = false, but Xe
>>> was erroneously calling it with true because of the mem_access cases.
>>
>> Good catch.
>>
>>> This can lead to unbalanced references.
>>
>> Is there an actual imbalance here though? Is it not just a case of being
>> overzealous in keeping the device awake when it is not currently "in_use" vs
>> "if_active"? If the api increments the usage count we will still decrement
>> it later, regardless of active vs in-use, AFAICT.
> 
> Indeed.
> 
> s/This can lead to unbalanced references./This can lead to unnecessary
> references getting hold here and device never getting into the runtime
> suspended state./g
> 
>>
>>>
>>> Let's use directly the 'if_in_use' function provided by linux/pm_runtime.
>>>
>>> Also, already start this new function protected from the runtime
>>> recursion, since runtime_pm will need to call for display functions
>>> for a proper D3Cold flow.
>>>
>>> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> ---
>>>    .../gpu/drm/xe/compat-i915-headers/i915_drv.h   |  2 +-
>>>    drivers/gpu/drm/xe/xe_pm.c                      | 17 +++++++++++++++++
>>>    drivers/gpu/drm/xe/xe_pm.h                      |  1 +
>>>    3 files changed, 19 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
>>> index 420eba0e4be0..ad5864d1dd74 100644
>>> --- a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
>>> +++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
>>> @@ -177,7 +177,7 @@ static inline intel_wakeref_t intel_runtime_pm_get_if_in_use(struct xe_runtime_p
>>>    {
>>>    	struct xe_device *xe = container_of(pm, struct xe_device, runtime_pm);
>>> -	return xe_pm_runtime_get_if_active(xe);
>>> +	return xe_pm_runtime_get_if_in_use(xe);
>>>    }
>>>    static inline void intel_runtime_pm_put_unchecked(struct xe_runtime_pm *pm)
>>> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
>>> index bd35fe9f6227..19f88cb7715b 100644
>>> --- a/drivers/gpu/drm/xe/xe_pm.c
>>> +++ b/drivers/gpu/drm/xe/xe_pm.c
>>> @@ -417,6 +417,23 @@ int xe_pm_runtime_get_if_active(struct xe_device *xe)
>>>    	return pm_runtime_get_if_active(xe->drm.dev, true);
>>>    }
>>> +/**
>>> + * xe_pm_runtime_get_if_in_use - Get a runtime_pm reference and resume if needed
>>> + * @xe: xe device instance
>>> + *
>>> + * Returns: True if device is awake and the reference was taken, false otherwise.
>>> + */
>>> +bool xe_pm_runtime_get_if_in_use(struct xe_device *xe)
>>> +{
>>> +	if (xe_pm_read_callback_task(xe) == current) {
>>> +		/* The device is awake, grab the ref and move on */
>>> +		pm_runtime_get_noresume(xe->drm.dev);
>>> +		return true;
>>> +	}
>>> +
>>> +	return pm_runtime_get_if_in_use(xe->drm.dev) >= 0;
>>
>> This is doing atomic_inc_not_zero() underneath for the "in_use" case AFAICT.
>> If the usage count is zero it doesn't increment it and returns 0. Does that
>> not lead to an imbalance? Should this rather be > 0?

^^ did you see the comment here also?

>>
>>> +}
>>> +
>>>    /**
>>>     * xe_pm_assert_unbounded_bridge - Disable PM on unbounded pcie parent bridge
>>>     * @xe: xe device instance
>>> diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
>>> index 64a97c6726a7..9d372cbf388b 100644
>>> --- a/drivers/gpu/drm/xe/xe_pm.h
>>> +++ b/drivers/gpu/drm/xe/xe_pm.h
>>> @@ -28,6 +28,7 @@ int xe_pm_runtime_resume(struct xe_device *xe);
>>>    int xe_pm_runtime_get(struct xe_device *xe);
>>>    int xe_pm_runtime_put(struct xe_device *xe);
>>>    int xe_pm_runtime_get_if_active(struct xe_device *xe);
>>> +bool xe_pm_runtime_get_if_in_use(struct xe_device *xe);
>>>    void xe_pm_assert_unbounded_bridge(struct xe_device *xe);
>>>    int xe_pm_set_vram_threshold(struct xe_device *xe, u32 threshold);
>>>    void xe_pm_d3cold_allowed_toggle(struct xe_device *xe);
