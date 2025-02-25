Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 439B9C021B2
	for <intel-xe@archiver.kernel.org>; Tue, 25 Feb 2025 17:38:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 020DB10E780;
	Tue, 25 Feb 2025 17:38:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ihOpTxZ5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8609E10E784
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Feb 2025 17:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740505088; x=1772041088;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=h59WZg0Th4r4H1atIqbyshDDxqE9r2fRRW3ovkbvC0c=;
 b=ihOpTxZ5NLHUGVp7/WIbaH19CNHZqsNdwlSFb2yNO//3sb5Fp/ZFYhAh
 B+GofgBSM9OEyT/5UFnUg1XwDhBdDD16DVtUh1NYgvEQ/tPOSGDX9ovIQ
 lOjsSLcaCYycrHIvo+wTnB7CxOFDmzC7J2zyaSp9PLFCB7klz1GucaGmN
 wCKz5SASe6/aCsUhRoJxtpodYX0uB1G19hodDDaUkccLOEnz7K04yAtOV
 AJSZQ6Bxk4oRzl98CT3hujCyg/LJi9/rhsOjMenq5tnyINI2QbAYSAtFF
 un8SGKSnlJQJSydvnEmRvuuuoTjhx1tMVpnTfLCZf2s7IYA9n6NUVKuyl g==;
X-CSE-ConnectionGUID: 2TzeLniISg+2iujj9z3Ohg==
X-CSE-MsgGUID: QkQNmjK3Tb6Ete/U1k4siw==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="41452844"
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="41452844"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 09:37:51 -0800
X-CSE-ConnectionGUID: /kq4s834R2KGBVvUEH/JGQ==
X-CSE-MsgGUID: 54zaPD1ORyO8uMZCmH0JXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="147352683"
Received: from dneilan-mobl1.ger.corp.intel.com (HELO [10.245.244.112])
 ([10.245.244.112])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 09:37:50 -0800
Message-ID: <c6dc0181-5d4d-46cc-b317-2840a872a447@intel.com>
Date: Tue, 25 Feb 2025 17:37:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/xe/gt_stats: Detect and log overflow
To: Francois Dugast <francois.dugast@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20250225131753.1170520-1-francois.dugast@intel.com>
 <20250225131753.1170520-2-francois.dugast@intel.com>
 <u2rjimcjpdknreojf22kyb3s6j4b7h6ki2zr6455nxgqxj4xzn@jpb6jxsp3chy>
 <Z73_NsccUSG3FjNj@fdugast-desk>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <Z73_NsccUSG3FjNj@fdugast-desk>
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

On 25/02/2025 17:34, Francois Dugast wrote:
> On Tue, Feb 25, 2025 at 09:41:15AM -0600, Lucas De Marchi wrote:
>> On Tue, Feb 25, 2025 at 02:17:04PM +0100, Francois Dugast wrote:
>>> Check if the atomic counter limit has been reached and if that is the
>>> case, set the counter value to the new increment to prevent keeping
>>> a garbage value, and notify it in the kernel log as below:
>>>
>>>     [drm:xe_gt_stats_incr [xe]] GT0: stats vma_pagefault_bytes overflow, resetting
>>>
>>> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
>>> ---
>>> drivers/gpu/drm/xe/xe_gt_stats.c | 18 ++++++++++++------
>>> 1 file changed, 12 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c b/drivers/gpu/drm/xe/xe_gt_stats.c
>>> index 2e9879ea4674..753c081b68a6 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_stats.c
>>> +++ b/drivers/gpu/drm/xe/xe_gt_stats.c
>>> @@ -8,8 +8,15 @@
>>> #include <drm/drm_print.h>
>>>
>>> #include "xe_gt.h"
>>> +#include "xe_gt_printk.h"
>>> #include "xe_gt_stats.h"
>>>
>>> +static const char *const stat_description[__XE_GT_STATS_NUM_IDS] = {
>>> +	"tlb_inval_count",
>>> +	"vma_pagefault_count",
>>> +	"vma_pagefault_bytes",
>>> +};
>>> +
>>> /**
>>>   * xe_gt_stats_incr - Increments the specified stats counter
>>>   * @gt: GT structure
>>> @@ -24,13 +31,12 @@ void xe_gt_stats_incr(struct xe_gt *gt, const enum xe_gt_stats_id id, int incr)
>>> 		return;
>>>
>>> 	atomic_add(incr, &gt->stats.counters[id]);
>>> -}
>>>
>>> -static const char *const stat_description[__XE_GT_STATS_NUM_IDS] = {
>>> -	"tlb_inval_count",
>>> -	"vma_pagefault_count",
>>> -	"vma_pagefault_bytes",
>>> -};
>>> +	if (atomic_read(&gt->stats.counters[id]) < 0) {
>>
>> why are we not using unsigned logic? it stops being atomic when you
>> update/read/set.
> 
> That is right, thanks for catching this.
> 
> @Matt: with the 2 other patches of the series, the counter limit was increased
> so much that the purpose of this patch is much less relevant. Is it fine with
> you if I retain your RB and merge the 2 other patches of this series, without
> this one?

Yeah, sure.

> 
> Francois
> 
>>
>> Lucas De Marchi
>>
>>> +		xe_gt_dbg(gt, "stats %s overflow, resetting\n", stat_description[id]);
>>> +		atomic_set(&gt->stats.counters[id], incr);
>>> +	}
>>> +}
>>>
>>> /**
>>>   * xe_gt_stats_print_info - Print the GT stats
>>> -- 
>>> 2.43.0
>>>

