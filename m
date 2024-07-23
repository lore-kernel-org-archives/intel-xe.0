Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5A12C3DA49
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jul 2024 14:27:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B5E710E076;
	Tue, 23 Jul 2024 14:27:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bac7Lb+H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1176D10E076
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Jul 2024 14:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721744835; x=1753280835;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=OA1+z3FI0qi/bnVeRuHwNWEjZp0Hg4U2URBzcVEc51o=;
 b=bac7Lb+HQGvEyCdM8KOO/FapN3Uv9U+I55VOtAnejHQ5IqYydvvbR9of
 BYV0qrdGIFP3qbRgJ7mi9BVhqAbDQfmA1oQVYnNedMXJVPalDGN8m2wE0
 qirz2bKzVJIubwSbfsBhcDX40BAed5QBaal93RUAbhZ47D7o6fubT2/NH
 USgIXvIsHnZ7ACg8dFvd8qDImJ+AqvUbw7CRApIkSgKegXbAQpozTpcVl
 uqkuMxenyBzKPGPFpt6UnPondH1Wk+S1H6ZO9GiCoa0x6LaqTSs4NntSa
 MkpdIImRm1u+5pPoKKwo6jYVXYP831fWQFuVx4HW4YR0iysou/nLO/n0Q Q==;
X-CSE-ConnectionGUID: PmT0qUP/QQqW3xtaKlIvMw==
X-CSE-MsgGUID: 69rXVZZAT6i1satq38KVLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11142"; a="23176736"
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; d="scan'208";a="23176736"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2024 07:27:15 -0700
X-CSE-ConnectionGUID: wfO7WLU4QtyMJM+LMA8Thw==
X-CSE-MsgGUID: bODg+wjESKuKq1c822lVbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; d="scan'208";a="56548914"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa005.fm.intel.com with ESMTP; 23 Jul 2024 07:27:13 -0700
Received: from [10.246.1.253] (mwajdecz-MOBL.ger.corp.intel.com [10.246.1.253])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 85B4528780;
 Tue, 23 Jul 2024 15:27:11 +0100 (IST)
Message-ID: <dd026199-6e24-44e6-b3ae-a90707c02897@intel.com>
Date: Tue, 23 Jul 2024 16:27:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe: Create debugfs for tlb inval stats
To: Nirmoy Das <nirmoy.das@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sai Gowtham Ch <sai.gowtham.ch@intel.com>
References: <20240723111610.21564-1-nirmoy.das@intel.com>
 <20240723111610.21564-3-nirmoy.das@intel.com>
 <95966c2f-45d2-43f4-a744-9b14fe05ba9d@intel.com>
 <ec4ed028-64ae-445f-bbc6-3376972c750b@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <ec4ed028-64ae-445f-bbc6-3376972c750b@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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



On 23.07.2024 15:15, Nirmoy Das wrote:
> 
> On 7/23/2024 2:14 PM, Michal Wajdeczko wrote:
>>
>> On 23.07.2024 13:16, Nirmoy Das wrote:
>>> Create debugfs file for each GT to dump tlb sent/receive
>>> stats.
>>>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> Cc: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
>>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_gt_debugfs.c          | 9 +++++++++
>>>   drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 7 +++++++
>>>   drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h | 2 ++
>>>   3 files changed, 18 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c
>>> b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>>> index 5e7fd937917a..959d979927dd 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
>>> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>>> @@ -17,6 +17,7 @@
>>>   #include "xe_gt_mcr.h"
>>>   #include "xe_gt_sriov_pf_debugfs.h"
>>>   #include "xe_gt_sriov_vf_debugfs.h"
>>> +#include "xe_gt_tlb_invalidation.h"
>>>   #include "xe_gt_topology.h"
>>>   #include "xe_hw_engine.h"
>>>   #include "xe_lrc.h"
>>> @@ -269,6 +270,13 @@ static int vecs_default_lrc(struct xe_gt *gt,
>>> struct drm_printer *p)
>>>       return 0;
>>>   }
>>>   +static int tlb_stats(struct xe_gt *gt, struct drm_printer *p)
>>> +{
>>> +    xe_gt_tlb_dump(gt, p);
>>> +
>>> +    return 0;
>>> +}
>>> +
>>>   static const struct drm_info_list debugfs_list[] = {
>>>       {"hw_engines", .show = xe_gt_debugfs_simple_show, .data =
>>> hw_engines},
>>>       {"force_reset", .show = xe_gt_debugfs_simple_show, .data =
>>> force_reset},
>>> @@ -286,6 +294,7 @@ static const struct drm_info_list debugfs_list[] = {
>>>       {"default_lrc_bcs", .show = xe_gt_debugfs_simple_show, .data =
>>> bcs_default_lrc},
>>>       {"default_lrc_vcs", .show = xe_gt_debugfs_simple_show, .data =
>>> vcs_default_lrc},
>>>       {"default_lrc_vecs", .show = xe_gt_debugfs_simple_show, .data =
>>> vecs_default_lrc},
>>> +    {"tlb_stats", .show = xe_gt_debugfs_simple_show, .data =
>>> tlb_stats},
>>>   };
>>>     void xe_gt_debugfs_register(struct xe_gt *gt)
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>>> b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>>> index f84717c1aafa..62a6f42b6c60 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>>> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>>> @@ -540,3 +540,10 @@ void xe_gt_tlb_invalidation_fence_fini(struct
>>> xe_gt_tlb_invalidation_fence *fenc
>>>   {
>>>       xe_pm_runtime_put(gt_to_xe(fence->gt));
>>>   }
>>> +
>>> +void xe_gt_tlb_dump(struct xe_gt *gt, struct drm_printer *p)
>> if you make this function as returning "int" then you will be able to
>> plug it directly into debugfs_list without the tlb_stats() wrapper
> 
> 
> Sounds goodI will modify it.
> 
>>
>>> +{
>>> +    drm_printf(p, "GT%d, TLB Requests sent: %llu, received: %llu\n",
>>> +           gt->info.id,
>>> atomic64_read(&gt->tlb_invalidation.sent_count),
>>> +           atomic64_read(&gt->tlb_invalidation.received_count));
>> printing the GT identifier (GT%d) is redundant as path to this debugfs
>> entry already contains GT identifier:
>>
>> $ sudo cat  /sys/kernel/debug/dri/0/gt1/tlb_stats
>>                                      ^^^
>>
>> GT1, TLB Requests sent: 212, received: 212
>> ^^^
> 
> Agreed but I was thinking when we do "cat
> /sys/kernel/debug/dri/0/gt*/tlb_stats" then keeping GT ID info  is useful.

TBH this doesn't convinced me, as our other entries are not duplicating
GT id in the output and likely someone can do other trick to see the id:

# grep . -r /sys/kernel/debug/dri/0/gt*/tlb_stats

/sys/kernel/debug/dri/0/gt0/tlb_stats: Requests sent: 212, received: 212
/sys/kernel/debug/dri/0/gt1/tlb_stats: Requests sent: 212, received: 212

> 
> 
>> btw, maybe 'last seqno' and 'default timeout' will be worth to be
>> included in debugfs ?
> 
> 
> I will add those too, should be useful.
> 
> 
> Thanks,
> 
> Nirmoy
> 
>>
>>> +}
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
>>> b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
>>> index a84065fa324c..f420029ec02d 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
>>> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
>>> @@ -10,6 +10,7 @@
>>>     #include "xe_gt_tlb_invalidation_types.h"
>>>   +struct drm_printer;
>>>   struct xe_gt;
>>>   struct xe_guc;
>>>   struct xe_vma;
>>> @@ -36,4 +37,5 @@ xe_gt_tlb_invalidation_fence_wait(struct
>>> xe_gt_tlb_invalidation_fence *fence)
>>>       dma_fence_wait(&fence->base, false);
>>>   }
>>>   +void xe_gt_tlb_dump(struct xe_gt *gt, struct drm_printer *p);
>> missing empty separation line
>>
>>>   #endif    /* _XE_GT_TLB_INVALIDATION_ */
