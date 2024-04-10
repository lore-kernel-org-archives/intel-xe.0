Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5821DCD11C2
	for <intel-xe@archiver.kernel.org>; Wed, 10 Apr 2024 11:40:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B92FA1132E9;
	Wed, 10 Apr 2024 11:40:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YpQ+BgaO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD2041132E9
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Apr 2024 11:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712749208; x=1744285208;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=pkJ5PTUJypEmO6pB8jPOISL3Ktl0/ZQOHA//DvTURmE=;
 b=YpQ+BgaOFVCBLxafi+o51QGnR50qM56LEbUBy1scD4nT7Z4qMcYvs0Gp
 5+ZF5fjq8xaWis0ec0A89t4O8N2U2C4wXvBGkvwJIVRIvZxyxyXrTz2HO
 j2kxp11eUUvtwggZjNQSpRsjko5r1GUvoRbSg47xG3Pft+hmGQzmmuFMo
 QVKo9FG2W9Cb3+MDEVHApFt7I2r9b4wlT4qXg9d3VAvDOzLBZPnNOr6uL
 HOn/k3GTcOlbdiVAK5OEYU4YGFYp+0ftBAv6UMtAz5ssijt7gKt/itXcQ
 v/g48vKMNGPJ3vcoXILKQy9CGZcyBq0ux42/RigiXGCkthbCeMEtnVuCc g==;
X-CSE-ConnectionGUID: h/Q1vAbfTj+pBZTqDz5ZAQ==
X-CSE-MsgGUID: Pmgrt2ykTeu7aFn4Mog1Kg==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="25547549"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="25547549"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 04:40:07 -0700
X-CSE-ConnectionGUID: byS+khfDTwquxQpE80hPIw==
X-CSE-MsgGUID: anM5sD/dQl+B0EL2xATVHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="25044637"
Received: from oakasatk-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.60.54])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 04:40:05 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] drm/xe: Promote make_u64 macro to .h file
In-Reply-To: <6498954f-e539-4695-8338-4820d423731b@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240213210543.1265-1-michal.wajdeczko@intel.com>
 <Zcvq_kiF-EM5evIz@intel.com> <87cysz6ud7.fsf@intel.com>
 <6498954f-e539-4695-8338-4820d423731b@intel.com>
Date: Wed, 10 Apr 2024 14:40:02 +0300
Message-ID: <87wmp578fh.fsf@intel.com>
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

On Mon, 08 Apr 2024, Michal Wajdeczko <michal.wajdeczko@intel.com> wrote:
> On 14.02.2024 14:36, Jani Nikula wrote:
>> On Tue, 13 Feb 2024, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
>>> On Tue, Feb 13, 2024 at 10:05:43PM +0100, Michal Wajdeczko wrote:
>>>> We shouldn't hide generic macros inside .c files as this may lead
>>>> to unnecessary code duplication if similar functionality is needed
>>>> elsewhere.  Promote make_u64 to .h as soon we will want to reuse it.
>>>
>>> On the other hand, we shouldn't create an internal library of macros
>>> that then start to get used indiscriminately as if it was Linux core
>>> helpers.
>>>
>>> Changes like this was how the i915_utils.h started.
>>>
>>> If we really think that this macro is useful somewhere else, then
>>> we should be looking to make that as part of the linux/types.h
>> 
>> Agreed.
>> 
>> Well, maybe not specifically types.h, but maybe a separate header.
>
> My attempts to promote this to a global macro reached dead end. To move
> forward please either engage in LKML [1] [2] discussions or accept this
> local solution or suggest other option.

Tried to nudge things forward. Fingers crossed.

BR,
Jani.

>
> Michal
>
> [1]
> https://lore.kernel.org/lkml/20240214155408.1569-1-michal.wajdeczko@intel.com/
>
> [2]
> https://lore.kernel.org/lkml/20240214214654.1700-1-michal.wajdeczko@intel.com/
>
>
>> 
>> There's a need for something like this:
>> 
>> $ git grep "hi[ )]*<< *\(8\|16\|32\)[ )]*|.*lo"
>> 
>> Ditto for taking higher/lower half of a variable.
>> 
>> 
>> BR,
>> Jani.
>> 
>> 
>>>
>>>>
>>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>> ---
>>>>  drivers/gpu/drm/xe/xe_gt_pagefault.c | 2 --
>>>>  drivers/gpu/drm/xe/xe_macros.h       | 8 ++++++++
>>>>  2 files changed, 8 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
>>>> index c26e4fcca01e..76a018ec8136 100644
>>>> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
>>>> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
>>>> @@ -557,8 +557,6 @@ static int handle_acc(struct xe_gt *gt, struct acc *acc)
>>>>  	return ret;
>>>>  }
>>>>  
>>>> -#define make_u64(hi__, low__)  ((u64)(hi__) << 32 | (u64)(low__))
>>>> -
>>>>  #define ACC_MSG_LEN_DW        4
>>>>  
>>>>  static bool get_acc(struct acc_queue *acc_queue, struct acc *acc)
>>>> diff --git a/drivers/gpu/drm/xe/xe_macros.h b/drivers/gpu/drm/xe/xe_macros.h
>>>> index daf56c846d03..b79d775c737e 100644
>>>> --- a/drivers/gpu/drm/xe/xe_macros.h
>>>> +++ b/drivers/gpu/drm/xe/xe_macros.h
>>>> @@ -7,6 +7,7 @@
>>>>  #define _XE_MACROS_H_
>>>>  
>>>>  #include <linux/bug.h>
>>>> +#include <linux/types.h>
>>>>  
>>>>  #define XE_WARN_ON WARN_ON
>>>>  
>>>> @@ -15,4 +16,11 @@
>>>>  			    "Ioctl argument check failed at %s:%d: %s", \
>>>>  			    __FILE__, __LINE__, #cond), 1))
>>>>  
>>>> +/**
>>>> + * make_u64 - make u64 value from two u32 values
>>>> + * @hi__: value representing upper 32 bits
>>>> + * @lo__: value representing lower 32 bits
>>>> + */
>>>> +#define make_u64(hi__, low__)  ((u64)(hi__) << 32 | (u64)(low__))
>>>> +
>>>>  #endif
>>>> -- 
>>>> 2.43.0
>>>>
>> 

-- 
Jani Nikula, Intel
