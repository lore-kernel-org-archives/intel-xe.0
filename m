Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 314EFCD128A
	for <intel-xe@archiver.kernel.org>; Mon,  8 Apr 2024 12:20:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2A3110F6CF;
	Mon,  8 Apr 2024 12:20:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Olel7Zkt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96DBC112518
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Apr 2024 12:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712578826; x=1744114826;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=u616bXgszmO141y2D5LApXJ8FoEnQ4bfqwvSW7i9kjU=;
 b=Olel7Zkt6/DOF2DI+cb1O9CB5G8ukMMrIWNwEW+zwkYxfYD687vZPkQH
 oSTViBoVvAMWhk5cKf/yGAA6dBynyYtkou/3lkzaWBpWm2XB1I2IkCupa
 5SoXMJBh1MgR4EXiEqrn+0J5GvQxD5eZL7AkiNxTGcfAstvvTswkPhBNw
 QbSszTgHU8YWYVreSW/IDvpYl0yP/BSbtdr8a4W0NHUWg/GQ72p08UAsl
 uPuI0VQfeN/Xr3RU3HUpt+UuQ43sunHdKS/iU7N8METBLb5gAKX0xk6sM
 HE4OmLLLJcr6oAdMPRXMxdf43b028YtRI2ExMRjRJT7WqzEmnaKYVoEH/ g==;
X-CSE-ConnectionGUID: E39T/XnSQ1GKVjztPPZAVQ==
X-CSE-MsgGUID: ZFciUwd4RTCjJQ/ackUb4Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11037"; a="18464859"
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; d="scan'208";a="18464859"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 05:20:25 -0700
X-CSE-ConnectionGUID: wcT+py8JToGuQKiibu8dhA==
X-CSE-MsgGUID: VOvwxrNcRVel5nVXFZ2paw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; d="scan'208";a="19732711"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa010.jf.intel.com with ESMTP; 08 Apr 2024 05:20:23 -0700
Received: from [10.249.158.202] (unknown [10.249.158.202])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 7B9B428169;
 Mon,  8 Apr 2024 13:20:22 +0100 (IST)
Message-ID: <6498954f-e539-4695-8338-4820d423731b@intel.com>
Date: Mon, 8 Apr 2024 14:20:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Promote make_u64 macro to .h file
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20240213210543.1265-1-michal.wajdeczko@intel.com>
 <Zcvq_kiF-EM5evIz@intel.com> <87cysz6ud7.fsf@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <87cysz6ud7.fsf@intel.com>
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



On 14.02.2024 14:36, Jani Nikula wrote:
> On Tue, 13 Feb 2024, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
>> On Tue, Feb 13, 2024 at 10:05:43PM +0100, Michal Wajdeczko wrote:
>>> We shouldn't hide generic macros inside .c files as this may lead
>>> to unnecessary code duplication if similar functionality is needed
>>> elsewhere.  Promote make_u64 to .h as soon we will want to reuse it.
>>
>> On the other hand, we shouldn't create an internal library of macros
>> that then start to get used indiscriminately as if it was Linux core
>> helpers.
>>
>> Changes like this was how the i915_utils.h started.
>>
>> If we really think that this macro is useful somewhere else, then
>> we should be looking to make that as part of the linux/types.h
> 
> Agreed.
> 
> Well, maybe not specifically types.h, but maybe a separate header.

My attempts to promote this to a global macro reached dead end. To move
forward please either engage in LKML [1] [2] discussions or accept this
local solution or suggest other option.

Michal

[1]
https://lore.kernel.org/lkml/20240214155408.1569-1-michal.wajdeczko@intel.com/

[2]
https://lore.kernel.org/lkml/20240214214654.1700-1-michal.wajdeczko@intel.com/


> 
> There's a need for something like this:
> 
> $ git grep "hi[ )]*<< *\(8\|16\|32\)[ )]*|.*lo"
> 
> Ditto for taking higher/lower half of a variable.
> 
> 
> BR,
> Jani.
> 
> 
>>
>>>
>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> ---
>>>  drivers/gpu/drm/xe/xe_gt_pagefault.c | 2 --
>>>  drivers/gpu/drm/xe/xe_macros.h       | 8 ++++++++
>>>  2 files changed, 8 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
>>> index c26e4fcca01e..76a018ec8136 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
>>> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
>>> @@ -557,8 +557,6 @@ static int handle_acc(struct xe_gt *gt, struct acc *acc)
>>>  	return ret;
>>>  }
>>>  
>>> -#define make_u64(hi__, low__)  ((u64)(hi__) << 32 | (u64)(low__))
>>> -
>>>  #define ACC_MSG_LEN_DW        4
>>>  
>>>  static bool get_acc(struct acc_queue *acc_queue, struct acc *acc)
>>> diff --git a/drivers/gpu/drm/xe/xe_macros.h b/drivers/gpu/drm/xe/xe_macros.h
>>> index daf56c846d03..b79d775c737e 100644
>>> --- a/drivers/gpu/drm/xe/xe_macros.h
>>> +++ b/drivers/gpu/drm/xe/xe_macros.h
>>> @@ -7,6 +7,7 @@
>>>  #define _XE_MACROS_H_
>>>  
>>>  #include <linux/bug.h>
>>> +#include <linux/types.h>
>>>  
>>>  #define XE_WARN_ON WARN_ON
>>>  
>>> @@ -15,4 +16,11 @@
>>>  			    "Ioctl argument check failed at %s:%d: %s", \
>>>  			    __FILE__, __LINE__, #cond), 1))
>>>  
>>> +/**
>>> + * make_u64 - make u64 value from two u32 values
>>> + * @hi__: value representing upper 32 bits
>>> + * @lo__: value representing lower 32 bits
>>> + */
>>> +#define make_u64(hi__, low__)  ((u64)(hi__) << 32 | (u64)(low__))
>>> +
>>>  #endif
>>> -- 
>>> 2.43.0
>>>
> 
