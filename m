Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 943EDE6400D
	for <intel-xe@archiver.kernel.org>; Thu, 21 Nov 2024 20:03:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5779510E1CC;
	Thu, 21 Nov 2024 20:03:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EUc5fA0P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE8C110E1CC
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Nov 2024 20:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732219418; x=1763755418;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=rDH96bywRec+zOCwVGqefAKiF3a/mKaT7gtuDHdcHMo=;
 b=EUc5fA0PoodVvR+AM3f2L1idW3c7zkc821fFSqhB9DxpEg5JIDpNVRdr
 Xt+QvLA0fLkMocHvgyc9JkapC600lQDHCxO9ZipCwKTnKiA5v1AUDkLwf
 6Zza40dLzutpwtRyOu6o5u6LGw4v79rcktAvtKgeLZ8+OrQwHTZ3jsxMt
 927E0B63t3fY4bsaSZqAmtoKJtDZkRQm8Z7g1vQIbaMlG3nUn7vWTZ9NY
 pjpqakNoGTLOI6ywef+bEb/Hu49IB4KoubyGhMPl88N/+VOcrWYf9wEW5
 sfvUyGuRL6DptboNYOAQUQxnBM0+ETiT/V/AqmlU90IIAZ4DOiQitYNzo Q==;
X-CSE-ConnectionGUID: aKKvu93KStm+USLXkBT7RQ==
X-CSE-MsgGUID: q+de272cQsCHt5X5rw0BPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="35216872"
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="35216872"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 12:03:38 -0800
X-CSE-ConnectionGUID: PsMa7l+bRh2H9H6iKZ6kYQ==
X-CSE-MsgGUID: RRDpu57OQp2wrQSvVMDMXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="89997427"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.125])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 12:03:35 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, Thomas =?utf-8?Q?Hellstr?=
 =?utf-8?Q?=C3=B6m?= <thomas.hellstrom@linux.intel.com>, John Harrison
 <John.C.Harrison@Intel.com>
Subject: Re: [PATCH v3 09/12] drm/xe/pxp: Add API to mark a BO as using PXP
In-Reply-To: <cb789d6f-dcf0-4077-bc36-e630df0d9913@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241120234353.1037180-1-daniele.ceraolospurio@intel.com>
 <20241120234353.1037180-10-daniele.ceraolospurio@intel.com>
 <87iksg29kt.fsf@intel.com>
 <cb789d6f-dcf0-4077-bc36-e630df0d9913@intel.com>
Date: Thu, 21 Nov 2024 22:03:30 +0200
Message-ID: <87plmoz759.fsf@intel.com>
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
> On 11/21/2024 1:57 AM, Jani Nikula wrote:
>> On Wed, 20 Nov 2024, Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com> wrote:
>>> diff --git a/drivers/gpu/drm/xe/compat-i915-headers/pxp/intel_pxp.h b/drivers/gpu/drm/xe/compat-i915-headers/pxp/intel_pxp.h
>>> index 419e8e926f00..533bc82255b6 100644
>>> --- a/drivers/gpu/drm/xe/compat-i915-headers/pxp/intel_pxp.h
>>> +++ b/drivers/gpu/drm/xe/compat-i915-headers/pxp/intel_pxp.h
>>> @@ -9,6 +9,9 @@
>>>   #include <linux/errno.h>
>>>   #include <linux/types.h>
>>>   
>>> +#include "xe_bo.h"
>>> +#include "xe_pxp.h"
>>> +
>> Can't have this. This will include xe_bo.h and xe_pxp.h from i915
>> display.
>>
>> Basically you can't use gem_to_xe_bo() in static inlines in headers that
>> get included to i915 display. It all needs to stay opaque.
>
> Why would this be included to i915 display? This is the copy of the 
> header used for building the display code with Xe, i915 should use it's 
> own copy (i915/pxp/intel_pxp.h). Several other headers in the 
> compat-i915-headers subfolder include Xe headers. Or is the problem 
> specifically with the BO part of it? Because I can move the code to 
> xe_pxp.c, but I'd still have to include at least xe_pxp.h.

With "i915 display", I refer to the display code that gets built for
both i915 and xe. And regardless of which module the code is being built
for, it should not include details like this. The goal is to make it
more and more independent from the two, eventually spawning into a
dedicated module. So we want to axe includes that lead from i915 display
to either i915 or xe core headers.

BR,
Jani.



>
> Daniele
>
>>
>> BR,
>> Jani.
>>
>>>   struct drm_gem_object;
>>>   struct xe_pxp;
>>>   
>>> @@ -16,7 +19,15 @@ static inline int intel_pxp_key_check(struct xe_pxp *pxp,
>>>   				      struct drm_gem_object *obj,
>>>   				      bool assign)
>>>   {
>>> -	return -ENODEV;
>>> +	/*
>>> +	 * The assign variable is used in i915 to assign the key to the BO at
>>> +	 * first submission time. In Xe the key is instead assigned at BO
>>> +	 * creation time, so the assign variable must always be false.
>>> +	 */
>>> +	if (assign)
>>> +		return -EINVAL;
>>> +
>>> +	return xe_pxp_key_check(pxp, gem_to_xe_bo(obj));
>>>   }
>>>   
>>>   #endif
>

-- 
Jani Nikula, Intel
