Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E655C3DA63
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jul 2024 09:18:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98C0110E5DF;
	Wed, 24 Jul 2024 09:18:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kH6wA/CD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 069AE10E5DF
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Jul 2024 09:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721812708; x=1753348708;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ubdTZYbP4E+5ZlRdrPgcu3yIH5pST8WmWwpqb/9I708=;
 b=kH6wA/CD2JuOYq+i0UBZka//GFHmem6H9VAnKFAE+6rxaySpvmkGKDay
 29YKOmHQikjZMRIwJ57a1jttw+9CWssQ62jtboMePhvkDjYV1IP9B3Skg
 OVHSylj0ao2zCZFb16+r/KOAqgivrlPhBN8NbmIc1ebGj+rxKQAsK8suy
 Q/dYXpFzxmNMNCEg+/L7M4rMxtBTpP45EiSfpd0clgpq/edU3Xo/ThueV
 toV6BoDYJhi3Q44PWDYhPd7odyqNzKdVaKh0sxznJuFT/BuZLoca0QKRY
 q8RgAi6NuZQwKd95k09QyauVsY0KNuiQ+//8cRjQ4kr8UU+jtEB/GM6Bh w==;
X-CSE-ConnectionGUID: pZ/l5RtzRayfnXKACslHuQ==
X-CSE-MsgGUID: hNdrYUv3QcKlhCfJ4uhpeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11142"; a="19616825"
X-IronPort-AV: E=Sophos;i="6.09,232,1716274800"; d="scan'208";a="19616825"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 02:18:28 -0700
X-CSE-ConnectionGUID: hCE+PCQKQzuEdQEK6mLk8Q==
X-CSE-MsgGUID: nISZQ+M6SH6CiVtY/CHhhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,232,1716274800"; d="scan'208";a="52435571"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.246.38.191])
 ([10.246.38.191])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 02:18:26 -0700
Message-ID: <3ba3ce09-e6e2-4fdf-bffd-f6f7d976c4f3@linux.intel.com>
Date: Wed, 24 Jul 2024 11:18:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe: Create debugfs for tlb inval stats
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sai Gowtham Ch <sai.gowtham.ch@intel.com>
References: <20240723111610.21564-1-nirmoy.das@intel.com>
 <20240723111610.21564-3-nirmoy.das@intel.com>
 <95966c2f-45d2-43f4-a744-9b14fe05ba9d@intel.com>
 <ec4ed028-64ae-445f-bbc6-3376972c750b@intel.com>
 <dd026199-6e24-44e6-b3ae-a90707c02897@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <dd026199-6e24-44e6-b3ae-a90707c02897@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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


On 7/23/2024 4:27 PM, Michal Wajdeczko wrote:
>
> On 23.07.2024 15:15, Nirmoy Das wrote:
>> On 7/23/2024 2:14 PM, Michal Wajdeczko wrote:
>>> On 23.07.2024 13:16, Nirmoy Das wrote:
>>>> Create debugfs file for each GT to dump tlb sent/receive
>>>> stats.
>>>>
>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>> Cc: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
>>>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_gt_debugfs.c          | 9 +++++++++
>>>>    drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 7 +++++++
>>>>    drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h | 2 ++
>>>>    3 files changed, 18 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c
>>>> b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>>>> index 5e7fd937917a..959d979927dd 100644
>>>> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
>>>> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>>>> @@ -17,6 +17,7 @@
>>>>    #include "xe_gt_mcr.h"
>>>>    #include "xe_gt_sriov_pf_debugfs.h"
>>>>    #include "xe_gt_sriov_vf_debugfs.h"
>>>> +#include "xe_gt_tlb_invalidation.h"
>>>>    #include "xe_gt_topology.h"
>>>>    #include "xe_hw_engine.h"
>>>>    #include "xe_lrc.h"
>>>> @@ -269,6 +270,13 @@ static int vecs_default_lrc(struct xe_gt *gt,
>>>> struct drm_printer *p)
>>>>        return 0;
>>>>    }
>>>>    +static int tlb_stats(struct xe_gt *gt, struct drm_printer *p)
>>>> +{
>>>> +    xe_gt_tlb_dump(gt, p);
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>>    static const struct drm_info_list debugfs_list[] = {
>>>>        {"hw_engines", .show = xe_gt_debugfs_simple_show, .data =
>>>> hw_engines},
>>>>        {"force_reset", .show = xe_gt_debugfs_simple_show, .data =
>>>> force_reset},
>>>> @@ -286,6 +294,7 @@ static const struct drm_info_list debugfs_list[] = {
>>>>        {"default_lrc_bcs", .show = xe_gt_debugfs_simple_show, .data =
>>>> bcs_default_lrc},
>>>>        {"default_lrc_vcs", .show = xe_gt_debugfs_simple_show, .data =
>>>> vcs_default_lrc},
>>>>        {"default_lrc_vecs", .show = xe_gt_debugfs_simple_show, .data =
>>>> vecs_default_lrc},
>>>> +    {"tlb_stats", .show = xe_gt_debugfs_simple_show, .data =
>>>> tlb_stats},
>>>>    };
>>>>      void xe_gt_debugfs_register(struct xe_gt *gt)
>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>>>> b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>>>> index f84717c1aafa..62a6f42b6c60 100644
>>>> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>>>> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>>>> @@ -540,3 +540,10 @@ void xe_gt_tlb_invalidation_fence_fini(struct
>>>> xe_gt_tlb_invalidation_fence *fenc
>>>>    {
>>>>        xe_pm_runtime_put(gt_to_xe(fence->gt));
>>>>    }
>>>> +
>>>> +void xe_gt_tlb_dump(struct xe_gt *gt, struct drm_printer *p)
>>> if you make this function as returning "int" then you will be able to
>>> plug it directly into debugfs_list without the tlb_stats() wrapper
>>
>> Sounds goodI will modify it.
>>
>>>> +{
>>>> +    drm_printf(p, "GT%d, TLB Requests sent: %llu, received: %llu\n",
>>>> +           gt->info.id,
>>>> atomic64_read(&gt->tlb_invalidation.sent_count),
>>>> +           atomic64_read(&gt->tlb_invalidation.received_count));
>>> printing the GT identifier (GT%d) is redundant as path to this debugfs
>>> entry already contains GT identifier:
>>>
>>> $ sudo cat  /sys/kernel/debug/dri/0/gt1/tlb_stats
>>>                                       ^^^
>>>
>>> GT1, TLB Requests sent: 212, received: 212
>>> ^^^
>> Agreed but I was thinking when we do "cat
>> /sys/kernel/debug/dri/0/gt*/tlb_stats" then keeping GT ID info  is useful.
> TBH this doesn't convinced me, as our other entries are not duplicating
> GT id in the output and likely someone can do other trick to see the id:
>
> # grep . -r /sys/kernel/debug/dri/0/gt*/tlb_stats
>
> /sys/kernel/debug/dri/0/gt0/tlb_stats: Requests sent: 212, received: 212
> /sys/kernel/debug/dri/0/gt1/tlb_stats: Requests sent: 212, received: 212


Yes, I see your point. If other entries are not duplicating it then it 
doesn't make sense.


Thanks,

Nirmoy

>
>>
>>> btw, maybe 'last seqno' and 'default timeout' will be worth to be
>>> included in debugfs ?
>>
>> I will add those too, should be useful.
>>
>>
>> Thanks,
>>
>> Nirmoy
>>
>>>> +}
>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
>>>> b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
>>>> index a84065fa324c..f420029ec02d 100644
>>>> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
>>>> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
>>>> @@ -10,6 +10,7 @@
>>>>      #include "xe_gt_tlb_invalidation_types.h"
>>>>    +struct drm_printer;
>>>>    struct xe_gt;
>>>>    struct xe_guc;
>>>>    struct xe_vma;
>>>> @@ -36,4 +37,5 @@ xe_gt_tlb_invalidation_fence_wait(struct
>>>> xe_gt_tlb_invalidation_fence *fence)
>>>>        dma_fence_wait(&fence->base, false);
>>>>    }
>>>>    +void xe_gt_tlb_dump(struct xe_gt *gt, struct drm_printer *p);
>>> missing empty separation line
>>>
>>>>    #endif    /* _XE_GT_TLB_INVALIDATION_ */
