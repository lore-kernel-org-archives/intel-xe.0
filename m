Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E1EAC61DA4
	for <intel-xe@archiver.kernel.org>; Wed, 15 Mar 2023 15:32:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 533F010E8EE;
	Wed, 15 Mar 2023 15:32:59 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0E5110E8EE
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Mar 2023 15:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678894377; x=1710430377;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Ua+liTveCUXygfC8u5rZveXeC6jh18veu9pTMMkHuwU=;
 b=YiRes6ngGvhJ7HRBpnPPdLGS8Cn1grvZPDUH/JoGfixV7rtzpnYiO6kd
 ZKeGkZSre4Rbg81LVLBt9wfi42DCYOGk55npNuo05VkJBZq/aheEnzk5o
 Kbwoq7Gj1Al3und1Pn/hp8ZBddyu5PAJwj0AnyFw+u3sOjmXug4HfvVJC
 fAkghO585JuRwefWPT1qGJ3Yfgqw/NfTSq/dnFMI8OJ8ORXkDVERH9+Ui
 ZZG9fZduLCzFe7LK4sPciJ6jgjjK6tTMXUaLwFHsWXcm6779OmJ1/OkHb
 xPsb6sCF7KnyEw3YPW68hwOw15SlSMmwWAO57ZZcaneEfjOuhBirc6Qbf w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="340098083"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; d="scan'208";a="340098083"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2023 08:32:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="925375145"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; d="scan'208";a="925375145"
Received: from lbarg-mobl1.ger.corp.intel.com (HELO [10.249.254.237])
 ([10.249.254.237])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2023 08:32:52 -0700
Message-ID: <59baa51d-e81b-3736-7bdb-8b9d895fefa8@linux.intel.com>
Date: Wed, 15 Mar 2023 16:32:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.william.auld@gmail.com>
References: <20230313204519.158888-1-thomas.hellstrom@linux.intel.com>
 <20230313204519.158888-2-thomas.hellstrom@linux.intel.com>
 <CAM0jSHMfN2z3FV75PDNMtwRYMTDV2PgKk2R1iKm3MtgcS9=Rrw@mail.gmail.com>
 <ZBHjsOw4Lvcgjmo8@DUT025-TGLU.fm.intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <ZBHjsOw4Lvcgjmo8@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH 1/6] drm/xe: Use a define to set initial
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 3/15/23 16:26, Matthew Brost wrote:
> On Tue, Mar 14, 2023 at 11:54:29AM +0000, Matthew Auld wrote:
>> On Mon, 13 Mar 2023 at 20:46, Thomas Hellström
>> <thomas.hellstrom@linux.intel.com> wrote:
>>> Also for HW fences, write the initial seqno - 1 to the HW completed
>>> seqno to initialize.
>>>
>>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_engine.c   | 5 +++--
>>>   drivers/gpu/drm/xe/xe_hw_fence.c | 5 ++---
>>>   drivers/gpu/drm/xe/xe_hw_fence.h | 2 ++
>>>   drivers/gpu/drm/xe/xe_lrc.c      | 3 +++
>>>   4 files changed, 10 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
>>> index 3b6f8a25112a..7e6367a84f1f 100644
>>> --- a/drivers/gpu/drm/xe/xe_engine.c
>>> +++ b/drivers/gpu/drm/xe/xe_engine.c
>>> @@ -13,6 +13,7 @@
>>>
>>>   #include "xe_device.h"
>>>   #include "xe_gt.h"
>>> +#include "xe_hw_fence.h"
>>>   #include "xe_lrc.h"
>>>   #include "xe_macros.h"
>>>   #include "xe_migrate.h"
>>> @@ -57,11 +58,11 @@ static struct xe_engine *__xe_engine_create(struct xe_device *xe,
>>>
>>>          if (xe_engine_is_parallel(e)) {
>>>                  e->parallel.composite_fence_ctx = dma_fence_context_alloc(1);
>>> -               e->parallel.composite_fence_seqno = 1;
>>> +               e->parallel.composite_fence_seqno = XE_FENCE_INITIAL_SEQNO;
>>>          }
>>>          if (e->flags & ENGINE_FLAG_VM) {
>>>                  e->bind.fence_ctx = dma_fence_context_alloc(1);
>>> -               e->bind.fence_seqno = 1;
>>> +               e->bind.fence_seqno = XE_FENCE_INITIAL_SEQNO;
>>>          }
>>>
>>>          for (i = 0; i < width; ++i) {
>>> diff --git a/drivers/gpu/drm/xe/xe_hw_fence.c b/drivers/gpu/drm/xe/xe_hw_fence.c
>>> index e56ca2867545..ca8304650713 100644
>>> --- a/drivers/gpu/drm/xe/xe_hw_fence.c
>>> +++ b/drivers/gpu/drm/xe/xe_hw_fence.c
>>> @@ -129,7 +129,7 @@ void xe_hw_fence_ctx_init(struct xe_hw_fence_ctx *ctx, struct xe_gt *gt,
>>>          ctx->gt = gt;
>>>          ctx->irq = irq;
>>>          ctx->dma_fence_ctx = dma_fence_context_alloc(1);
>>> -       ctx->next_seqno = 1;
>>> +       ctx->next_seqno = XE_FENCE_INITIAL_SEQNO;
>>>          sprintf(ctx->name, "%s", name);
>>>   }
>>>
>>> @@ -164,8 +164,7 @@ static bool xe_hw_fence_signaled(struct dma_fence *dma_fence)
>>>          struct xe_device *xe = gt_to_xe(fence->ctx->gt);
>>>          u32 seqno = xe_map_rd(xe, &fence->seqno_map, 0, u32);
>>>
>>> -       return dma_fence->error ||
>>> -               (s32)fence->dma.seqno <= (s32)seqno;
>>> +       return dma_fence->error || (s32)(u32)fence->dma.seqno <= (s32)seqno;
>> Why do we need this change? Also the hw fence dma.seqno should always
>> be u32, right?
>>
> Not exactly on topic but we should change the seqno to u64 both dma-fences and
> our hardware supports this.

I agree. Although I think we might need to be careful if we think we 
ever going to run the driver on 32-bit systems.

/Thomas


>
> Matt
>
>>>   }
>>>
>>>   static bool xe_hw_fence_enable_signaling(struct dma_fence *dma_fence)
>>> diff --git a/drivers/gpu/drm/xe/xe_hw_fence.h b/drivers/gpu/drm/xe/xe_hw_fence.h
>>> index 07f202db6526..523c2611ef5d 100644
>>> --- a/drivers/gpu/drm/xe/xe_hw_fence.h
>>> +++ b/drivers/gpu/drm/xe/xe_hw_fence.h
>>> @@ -8,6 +8,8 @@
>>>
>>>   #include "xe_hw_fence_types.h"
>>>
>>> +#define XE_FENCE_INITIAL_SEQNO 1
>>> +
>>>   int xe_hw_fence_module_init(void);
>>>   void xe_hw_fence_module_exit(void);
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>>> index 9140b057a5ba..fb8c6f7d6528 100644
>>> --- a/drivers/gpu/drm/xe/xe_lrc.c
>>> +++ b/drivers/gpu/drm/xe/xe_lrc.c
>>> @@ -697,6 +697,9 @@ int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>>>          arb_enable = MI_ARB_ON_OFF | MI_ARB_ENABLE;
>>>          xe_lrc_write_ring(lrc, &arb_enable, sizeof(arb_enable));
>>>
>>> +       map = __xe_lrc_seqno_map(lrc);
>>> +       xe_map_write32(lrc_to_xe(lrc), &map, lrc->fence_ctx.next_seqno - 1);
>>> +
>>>          return 0;
>>>
>>>   err_lrc_finish:
>>> --
>>> 2.39.2
>>>
