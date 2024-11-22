Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 799C0E6916C
	for <intel-xe@archiver.kernel.org>; Fri, 22 Nov 2024 15:06:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D6BF10EBC9;
	Fri, 22 Nov 2024 15:06:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GQ/QDW4N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E98210EBC9
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Nov 2024 15:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732288010; x=1763824010;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=kXaIr58VrpiBEOMGeYH/Qp7iQuxBzMFHfjTw7CjKr9U=;
 b=GQ/QDW4NDhGxrHgsNxk96UayYBVrcRbDMH4g8IrKJ1+/7wq330wH5NZ9
 9iqJhwQNia/XcXAT3KW+00lWhAYqGw+sUKP38rnRxOVUiL4TWEvqSetyN
 ghPxB0yG0Y0vMXH/QdVxYhNdWTRHD0ZT1hTUUyIv3Zh4jh1ap9YXMu7Qy
 PQIgshZhOJP+2LWndKe34DFICYj03/IbZQ8uSJeThm5B/hoCYfx3U3r/n
 DitscfxTor8vcDx+Z9x4sWfZcMX2a9ADMBUp6geMRqjkgIiUGkvetNS7k
 ISrHO+l4L+/1B4U4Ei4pt1T2WnNiWSlI2xml1oMdwTl7pd0KiNsfC9e/E w==;
X-CSE-ConnectionGUID: FMk3Ucv0TGeQSkr5EVsn1g==
X-CSE-MsgGUID: wWpsrYelQxK5W3LLAZjEWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="54955120"
X-IronPort-AV: E=Sophos;i="6.12,176,1728975600"; d="scan'208";a="54955120"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2024 07:06:36 -0800
X-CSE-ConnectionGUID: DDfcJ3aEQCy330h4XpRSwA==
X-CSE-MsgGUID: on4IaE0iTqG1spKUacsjjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,176,1728975600"; d="scan'208";a="90238271"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.157])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2024 07:06:32 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, Thomas =?utf-8?Q?Hellstr?=
 =?utf-8?Q?=C3=B6m?= <thomas.hellstrom@linux.intel.com>, John Harrison
 <John.C.Harrison@Intel.com>
Subject: Re: [PATCH v3 09/12] drm/xe/pxp: Add API to mark a BO as using PXP
In-Reply-To: <7dcfa3af-35e5-40cf-a910-4b3cc1e34c03@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241120234353.1037180-1-daniele.ceraolospurio@intel.com>
 <20241120234353.1037180-10-daniele.ceraolospurio@intel.com>
 <87iksg29kt.fsf@intel.com>
 <cb789d6f-dcf0-4077-bc36-e630df0d9913@intel.com>
 <87plmoz759.fsf@intel.com>
 <7dcfa3af-35e5-40cf-a910-4b3cc1e34c03@intel.com>
Date: Fri, 22 Nov 2024 17:06:26 +0200
Message-ID: <875xofz4st.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Thu, 21 Nov 2024, Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com> wrote:
> On 11/21/2024 12:03 PM, Jani Nikula wrote:
>> On Thu, 21 Nov 2024, Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com> wrote:
>>> On 11/21/2024 1:57 AM, Jani Nikula wrote:
>>>> On Wed, 20 Nov 2024, Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com> wrote:
>>>>> diff --git a/drivers/gpu/drm/xe/compat-i915-headers/pxp/intel_pxp.h b/drivers/gpu/drm/xe/compat-i915-headers/pxp/intel_pxp.h
>>>>> index 419e8e926f00..533bc82255b6 100644
>>>>> --- a/drivers/gpu/drm/xe/compat-i915-headers/pxp/intel_pxp.h
>>>>> +++ b/drivers/gpu/drm/xe/compat-i915-headers/pxp/intel_pxp.h
>>>>> @@ -9,6 +9,9 @@
>>>>>    #include <linux/errno.h>
>>>>>    #include <linux/types.h>
>>>>>    
>>>>> +#include "xe_bo.h"
>>>>> +#include "xe_pxp.h"
>>>>> +
>>>> Can't have this. This will include xe_bo.h and xe_pxp.h from i915
>>>> display.
>>>>
>>>> Basically you can't use gem_to_xe_bo() in static inlines in headers that
>>>> get included to i915 display. It all needs to stay opaque.
>>> Why would this be included to i915 display? This is the copy of the
>>> header used for building the display code with Xe, i915 should use it's
>>> own copy (i915/pxp/intel_pxp.h). Several other headers in the
>>> compat-i915-headers subfolder include Xe headers. Or is the problem
>>> specifically with the BO part of it? Because I can move the code to
>>> xe_pxp.c, but I'd still have to include at least xe_pxp.h.
>> With "i915 display", I refer to the display code that gets built for
>> both i915 and xe. And regardless of which module the code is being built
>> for, it should not include details like this. The goal is to make it
>> more and more independent from the two, eventually spawning into a
>> dedicated module. So we want to axe includes that lead from i915 display
>> to either i915 or xe core headers.
>
> Ok that makes sense, but I'm not sure if it can be easily avoided here. 
> The PXP key is managed outside of the display code, so we do need a 
> callback into Xe or i915 to get that info. The only way I can see that 
> being doable without the different headers is if we pass a function 
> pointer at display init time and keep that stored inside the 
> intel_display structure. That to me sounds like something that should be 
> introduced more structurally for multiple callbacks into i915/xe instead 
> of just for PXP, but I can do it if that's the preference.

Why not make xe_pxp_key_check() accept struct drm_gem_object * instead
of struct xe_bo *? Basically all the interfaces to/from display will
need to use i915/xe independent types anyway.

See ad36a322619c ("drm/i915/display: convert skl_universal_plane.c to
struct drm_gem_object") which converts i915 pxp. And i915 display gets
to use either opaque types or generic drm types.

BR,
Jani.



>
> thanks,
> Daniele
>
>>
>> BR,
>> Jani.
>>
>>
>>
>>> Daniele
>>>
>>>> BR,
>>>> Jani.
>>>>
>>>>>    struct drm_gem_object;
>>>>>    struct xe_pxp;
>>>>>    
>>>>> @@ -16,7 +19,15 @@ static inline int intel_pxp_key_check(struct xe_pxp *pxp,
>>>>>    				      struct drm_gem_object *obj,
>>>>>    				      bool assign)
>>>>>    {
>>>>> -	return -ENODEV;
>>>>> +	/*
>>>>> +	 * The assign variable is used in i915 to assign the key to the BO at
>>>>> +	 * first submission time. In Xe the key is instead assigned at BO
>>>>> +	 * creation time, so the assign variable must always be false.
>>>>> +	 */
>>>>> +	if (assign)
>>>>> +		return -EINVAL;
>>>>> +
>>>>> +	return xe_pxp_key_check(pxp, gem_to_xe_bo(obj));
>>>>>    }
>>>>>    
>>>>>    #endif
>

-- 
Jani Nikula, Intel
