Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFF3EC48BC1
	for <intel-xe@archiver.kernel.org>; Wed, 14 Feb 2024 13:36:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89CBC10E260;
	Wed, 14 Feb 2024 13:36:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ROLGupRB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A16CD10E260
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Feb 2024 13:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707917770; x=1739453770;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=ganLqtYb64k0UJvlDygGU/3FaQTvuZxhU1TA3Z/TA0Y=;
 b=ROLGupRB5jteE5yjbk09k8QCsTNhlUs1rI9eJvT9mjoUyQejv/7hfN7C
 hgnZyhGMWn3XT7NDt3HL7IfE1IiOiHPaPwP9ygein+u+ji6ojlmlbshIK
 oz5vSZ1MR/QnG1nRReX5nPShp7pJAT71G6m7+25neFp/5YPBkTnCbh8yM
 oVTibW/rizUvOMOA7jVeJAK1uOx9LV1ocoxin9Zz45ONWZ01kZjq3GyU7
 QZyPvKNf5SDP7FtE55bA+gNIuO5CEZkLC5UYujPJ8rhify1niRnsyDHgw
 FPn6vPs6PQnDqns2c3Q/jIpCICHhKRhK4ZgVd9BjzVw9Xp5+xlTHhnXnP w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="1830016"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="1830016"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 05:36:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="3095304"
Received: from kwszolek-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.63.190])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 05:36:07 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] drm/xe: Promote make_u64 macro to .h file
In-Reply-To: <Zcvq_kiF-EM5evIz@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240213210543.1265-1-michal.wajdeczko@intel.com>
 <Zcvq_kiF-EM5evIz@intel.com>
Date: Wed, 14 Feb 2024 15:36:04 +0200
Message-ID: <87cysz6ud7.fsf@intel.com>
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

On Tue, 13 Feb 2024, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
> On Tue, Feb 13, 2024 at 10:05:43PM +0100, Michal Wajdeczko wrote:
>> We shouldn't hide generic macros inside .c files as this may lead
>> to unnecessary code duplication if similar functionality is needed
>> elsewhere.  Promote make_u64 to .h as soon we will want to reuse it.
>
> On the other hand, we shouldn't create an internal library of macros
> that then start to get used indiscriminately as if it was Linux core
> helpers.
>
> Changes like this was how the i915_utils.h started.
>
> If we really think that this macro is useful somewhere else, then
> we should be looking to make that as part of the linux/types.h

Agreed.

Well, maybe not specifically types.h, but maybe a separate header.

There's a need for something like this:

$ git grep "hi[ )]*<< *\(8\|16\|32\)[ )]*|.*lo"

Ditto for taking higher/lower half of a variable.


BR,
Jani.


>
>> 
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_gt_pagefault.c | 2 --
>>  drivers/gpu/drm/xe/xe_macros.h       | 8 ++++++++
>>  2 files changed, 8 insertions(+), 2 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
>> index c26e4fcca01e..76a018ec8136 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
>> @@ -557,8 +557,6 @@ static int handle_acc(struct xe_gt *gt, struct acc *acc)
>>  	return ret;
>>  }
>>  
>> -#define make_u64(hi__, low__)  ((u64)(hi__) << 32 | (u64)(low__))
>> -
>>  #define ACC_MSG_LEN_DW        4
>>  
>>  static bool get_acc(struct acc_queue *acc_queue, struct acc *acc)
>> diff --git a/drivers/gpu/drm/xe/xe_macros.h b/drivers/gpu/drm/xe/xe_macros.h
>> index daf56c846d03..b79d775c737e 100644
>> --- a/drivers/gpu/drm/xe/xe_macros.h
>> +++ b/drivers/gpu/drm/xe/xe_macros.h
>> @@ -7,6 +7,7 @@
>>  #define _XE_MACROS_H_
>>  
>>  #include <linux/bug.h>
>> +#include <linux/types.h>
>>  
>>  #define XE_WARN_ON WARN_ON
>>  
>> @@ -15,4 +16,11 @@
>>  			    "Ioctl argument check failed at %s:%d: %s", \
>>  			    __FILE__, __LINE__, #cond), 1))
>>  
>> +/**
>> + * make_u64 - make u64 value from two u32 values
>> + * @hi__: value representing upper 32 bits
>> + * @lo__: value representing lower 32 bits
>> + */
>> +#define make_u64(hi__, low__)  ((u64)(hi__) << 32 | (u64)(low__))
>> +
>>  #endif
>> -- 
>> 2.43.0
>> 

-- 
Jani Nikula, Intel
