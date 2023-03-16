Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC85CC6FD19
	for <intel-xe@archiver.kernel.org>; Thu, 16 Mar 2023 16:45:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9579210ED76;
	Thu, 16 Mar 2023 16:45:31 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A570810ED92
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Mar 2023 16:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678985128; x=1710521128;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=84bDgOYrtTG8GJ3KHX0/lPjkZoiXxrI+AnKukcSfX/M=;
 b=F6fvdd07uA69HWWuUTDUvaCSwuce3W4mphDlJDC8K7qUc7ovWR9VLrVM
 EgpR6DNg/HbKGU/t1sflqnPkZ5G1v/4Y+X3dW53YH1edkkK/dHJ5yz3VU
 s8aVHE7f93hgNL0Js2EkMvUqgdBqr6kgPhBuxIXhnuD8svADAttkF0opP
 YST5CLLLc7jYgRCOzxZMEstKMhOwkCk8zdOTO10yWmxRG8cAYV3fULRxV
 HOQwyk+16+K0gStviFajOg5I6oNu0KwvvA6p0uTl2HWhjKyTBN1DfkCQZ
 lmUf4yRpsoTDU9E8ENHplBKL3YQwsf5n25bfCieawjp438fwabXjHBZgU g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="318442357"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; d="scan'208";a="318442357"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 09:45:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="1009306838"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; d="scan'208";a="1009306838"
Received: from hlykke-mobl1.ger.corp.intel.com (HELO [10.249.254.242])
 ([10.249.254.242])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 09:45:27 -0700
Message-ID: <68cf10a6-fa4f-3c70-d68a-570d81866041@linux.intel.com>
Date: Thu, 16 Mar 2023 17:45:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>
References: <20230315155507.43933-1-thomas.hellstrom@linux.intel.com>
 <20230315155507.43933-2-thomas.hellstrom@linux.intel.com>
 <ZBM/O1K/IHXwdziO@DUT025-TGLU.fm.intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <ZBM/O1K/IHXwdziO@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH v2 1/7] drm/xe: Use a define to set initial
 seqno for fences
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
Cc: intel-xe@lists.freedesktop.org, matthew.auld@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi,

Thanks for reviewing, Matthew.

Ugh. I actually had the impression all of the patches in this series 
were actually already reviewed, so I pushed, but I was wrong. :/. 
Luckily got a post-merge R-B here so won't have to revert. Should 
probably add this R-B on the next rebase, though.

/Thomas


On 3/16/23 17:09, Matthew Brost wrote:
> On Wed, Mar 15, 2023 at 04:55:01PM +0100, Thomas Hellström wrote:
>> Also for HW fences, write the initial seqno - 1 to the HW completed
>> seqno to initialize.
>>
>> v2:
>> - Use __dma_fence_is_later() to compare hw fence seqnos. (Matthew Auld)
>>
>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>
>> ---
>>   drivers/gpu/drm/xe/xe_engine.c   | 5 +++--
>>   drivers/gpu/drm/xe/xe_hw_fence.c | 4 ++--
>>   drivers/gpu/drm/xe/xe_hw_fence.h | 2 ++
>>   drivers/gpu/drm/xe/xe_lrc.c      | 3 +++
>>   4 files changed, 10 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
>> index 3b6f8a25112a..7e6367a84f1f 100644
>> --- a/drivers/gpu/drm/xe/xe_engine.c
>> +++ b/drivers/gpu/drm/xe/xe_engine.c
>> @@ -13,6 +13,7 @@
>>   
>>   #include "xe_device.h"
>>   #include "xe_gt.h"
>> +#include "xe_hw_fence.h"
>>   #include "xe_lrc.h"
>>   #include "xe_macros.h"
>>   #include "xe_migrate.h"
>> @@ -57,11 +58,11 @@ static struct xe_engine *__xe_engine_create(struct xe_device *xe,
>>   
>>   	if (xe_engine_is_parallel(e)) {
>>   		e->parallel.composite_fence_ctx = dma_fence_context_alloc(1);
>> -		e->parallel.composite_fence_seqno = 1;
>> +		e->parallel.composite_fence_seqno = XE_FENCE_INITIAL_SEQNO;
>>   	}
>>   	if (e->flags & ENGINE_FLAG_VM) {
>>   		e->bind.fence_ctx = dma_fence_context_alloc(1);
>> -		e->bind.fence_seqno = 1;
>> +		e->bind.fence_seqno = XE_FENCE_INITIAL_SEQNO;
>>   	}
>>   
>>   	for (i = 0; i < width; ++i) {
>> diff --git a/drivers/gpu/drm/xe/xe_hw_fence.c b/drivers/gpu/drm/xe/xe_hw_fence.c
>> index e56ca2867545..ffe1a3992ef5 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_fence.c
>> +++ b/drivers/gpu/drm/xe/xe_hw_fence.c
>> @@ -129,7 +129,7 @@ void xe_hw_fence_ctx_init(struct xe_hw_fence_ctx *ctx, struct xe_gt *gt,
>>   	ctx->gt = gt;
>>   	ctx->irq = irq;
>>   	ctx->dma_fence_ctx = dma_fence_context_alloc(1);
>> -	ctx->next_seqno = 1;
>> +	ctx->next_seqno = XE_FENCE_INITIAL_SEQNO;
>>   	sprintf(ctx->name, "%s", name);
>>   }
>>   
>> @@ -165,7 +165,7 @@ static bool xe_hw_fence_signaled(struct dma_fence *dma_fence)
>>   	u32 seqno = xe_map_rd(xe, &fence->seqno_map, 0, u32);
>>   
>>   	return dma_fence->error ||
>> -		(s32)fence->dma.seqno <= (s32)seqno;
>> +		!__dma_fence_is_later(dma_fence->seqno, seqno, dma_fence->ops);
>>   }
>>   
>>   static bool xe_hw_fence_enable_signaling(struct dma_fence *dma_fence)
>> diff --git a/drivers/gpu/drm/xe/xe_hw_fence.h b/drivers/gpu/drm/xe/xe_hw_fence.h
>> index 07f202db6526..523c2611ef5d 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_fence.h
>> +++ b/drivers/gpu/drm/xe/xe_hw_fence.h
>> @@ -8,6 +8,8 @@
>>   
>>   #include "xe_hw_fence_types.h"
>>   
>> +#define XE_FENCE_INITIAL_SEQNO 1
>> +
>>   int xe_hw_fence_module_init(void);
>>   void xe_hw_fence_module_exit(void);
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>> index 9140b057a5ba..fb8c6f7d6528 100644
>> --- a/drivers/gpu/drm/xe/xe_lrc.c
>> +++ b/drivers/gpu/drm/xe/xe_lrc.c
>> @@ -697,6 +697,9 @@ int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>>   	arb_enable = MI_ARB_ON_OFF | MI_ARB_ENABLE;
>>   	xe_lrc_write_ring(lrc, &arb_enable, sizeof(arb_enable));
>>   
>> +	map = __xe_lrc_seqno_map(lrc);
>> +	xe_map_write32(lrc_to_xe(lrc), &map, lrc->fence_ctx.next_seqno - 1);
>> +
>>   	return 0;
>>   
>>   err_lrc_finish:
>> -- 
>> 2.39.2
>>
