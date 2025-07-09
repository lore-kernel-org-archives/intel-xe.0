Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8671FC83F03
	for <intel-xe@archiver.kernel.org>; Wed,  9 Jul 2025 10:44:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38F2310E0D9;
	Wed,  9 Jul 2025 10:44:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="RBp0j4ae";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF60F10E0D9
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Jul 2025 10:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5A8iQ0j6miz09xBkasLA5Rda0Rgt2IZRR9wdIIVjwns=; b=RBp0j4aeJx9s1vepm1aQWX+eQ1
 jqZyl4GPOBYlNZQBIyuL4jF5t69T6toF3B38ygqyc8joLj+/XVc0++oxgx98280gHXnH846AMbYNU
 rp9VfiOumCxe7wrEPkU6i0lAer2Bavwz8rn0g+lOlOoeBWq2U3ZkbF8IbfYf69duXnTMdNgsrXuis
 bUReeWxLUMq2LUdH8ihmKpsq0yRfc5e3tArFGeA1ZrTKS5fLw/wcxGuW6Qmc7LXsO9KQbGXvL5xnB
 hieVSgcOAwcflJdAwER1fYk7uQPzUR9P2yT2tb15a/mkz62Xkv8h0Hbxf1opzLEGZI/jxHpDsYzqo
 9z8OMn0A==;
Received: from [84.65.48.237] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uZSI5-00EQYN-ON; Wed, 09 Jul 2025 12:44:41 +0200
Message-ID: <c71b4b3a-9a4c-4ff1-be0d-f7f788565b85@igalia.com>
Date: Wed, 9 Jul 2025 11:44:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 5/7] drm/xe: Add plumbing for indirect context
 workarounds
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org, kernel-dev@igalia.com,
 Matt Roper <matthew.d.roper@intel.com>
References: <20250703082059.61597-1-tvrtko.ursulin@igalia.com>
 <20250703082059.61597-6-tvrtko.ursulin@igalia.com>
 <c3p5ysmlyp3so7zyg2xazmbqryyshsq6ae6i3by326z63mn5oo@rsr34lev4mk5>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <c3p5ysmlyp3so7zyg2xazmbqryyshsq6ae6i3by326z63mn5oo@rsr34lev4mk5>
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


On 09/07/2025 00:11, Lucas De Marchi wrote:
> On Thu, Jul 03, 2025 at 09:20:57AM +0100, Tvrtko Ursulin wrote:
>> Some upcoming workarounds need to be emitted from the indirect workaround
>> context so lets add some plumbing where they will be able to easily slot
>> in.
>>
>> No functional changes for now since everything is still deactivated.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> ---
>> drivers/gpu/drm/xe/regs/xe_lrc_layout.h |  4 ++
>> drivers/gpu/drm/xe/xe_lrc.c             | 80 ++++++++++++++++++++++++-
>> drivers/gpu/drm/xe/xe_lrc_types.h       |  3 +-
>> 3 files changed, 84 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h b/drivers/gpu/ 
>> drm/xe/regs/xe_lrc_layout.h
>> index 994af591a2e8..cfa6db15488e 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
>> @@ -12,6 +12,8 @@
>> #define CTX_RING_START            (0x08 + 1)
>> #define CTX_RING_CTL            (0x0a + 1)
>> #define CTX_BB_PER_CTX_PTR        (0x12 + 1)
>> +#define CTX_CS_INDIRECT_CTX        (0x14 + 1)
>> +#define CTX_CS_INDIRECT_CTX_OFFSET    (0x16 + 1)
>> #define CTX_TIMESTAMP            (0x22 + 1)
>> #define CTX_TIMESTAMP_UDW        (0x24 + 1)
>> #define CTX_INDIRECT_RING_STATE        (0x26 + 1)
>> @@ -36,4 +38,6 @@
>> #define INDIRECT_CTX_RING_START_UDW    (0x08 + 1)
>> #define INDIRECT_CTX_RING_CTL        (0x0a + 1)
>>
>> +#define CTX_RCS_INDIRECT_CTX_OFFSET_DEFAULT    0xd
> 
> this is already the default,  so we can probably skip writting it?
> If we are writting it, then we should use a REG_FIELD_PREP so
> the `<< 6` doesn't feel like just a magic number

Done.

>> +
>> #endif
>> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>> index e278c12a41f9..70db4c5764e6 100644
>> --- a/drivers/gpu/drm/xe/xe_lrc.c
>> +++ b/drivers/gpu/drm/xe/xe_lrc.c
>> @@ -39,6 +39,7 @@
>> #define LRC_ENGINE_INSTANCE            GENMASK_ULL(53, 48)
>>
>> #define LRC_PPHWSP_SIZE                SZ_4K
>> +#define LRC_INDIRECT_CTX_SIZE            SZ_4K
>> #define LRC_INDIRECT_RING_STATE_SIZE        SZ_4K
>> #define LRC_WA_BB_SIZE                SZ_4K
>>
>> @@ -48,6 +49,12 @@ lrc_to_xe(struct xe_lrc *lrc)
>>     return gt_to_xe(lrc->fence_ctx.gt);
>> }
>>
>> +static bool
>> +gt_engine_needs_indirect_ctx(struct xe_gt *gt, enum xe_engine_class 
>> class)
>> +{
>> +    return false;
>> +}
>> +
>> size_t xe_gt_lrc_size(struct xe_gt *gt, enum xe_engine_class class)
>> {
>>     struct xe_device *xe = gt_to_xe(gt);
>> @@ -717,7 +724,18 @@ static u32 
>> __xe_lrc_ctx_timestamp_udw_offset(struct xe_lrc *lrc)
>>
>> static inline u32 __xe_lrc_indirect_ring_offset(struct xe_lrc *lrc)
>> {
>> -    return xe_bo_size(lrc->bo) - LRC_WA_BB_SIZE - 
>> LRC_INDIRECT_RING_STATE_SIZE;
>> +    u32 offset = xe_bo_size(lrc->bo) - LRC_WA_BB_SIZE -
>> +             LRC_INDIRECT_RING_STATE_SIZE;
>> +
>> +    if (lrc->flags & XE_LRC_FLAG_INDIRECT_CTX)
>> +        offset -= LRC_INDIRECT_CTX_SIZE;
>> +
>> +    return offset;
>> +}
>> +
>> +static inline u32 __xe_lrc_indirect_ctx_offset(struct xe_lrc *lrc)
>> +{
>> +    return xe_bo_size(lrc->bo) - LRC_WA_BB_SIZE - LRC_INDIRECT_CTX_SIZE;
>> }
>>
>> static inline u32 __xe_lrc_wa_bb_offset(struct xe_lrc *lrc)
>> @@ -1065,6 +1083,54 @@ static int setup_wa_bb(struct xe_lrc *lrc, 
>> struct xe_hw_engine *hwe)
>>     return 0;
>> }
>>
>> +static int
>> +setup_indirect_ctx(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
>> +{
>> +    static struct bo_setup rcs_funcs[] = {
>> +    };
>> +    unsigned int offset, num_funcs, written = 0;
>> +    struct bo_setup *funcs = NULL;
>> +    u32 *cmd, *buf = NULL;
>> +
>> +    if (!(lrc->flags & XE_LRC_FLAG_INDIRECT_CTX))
>> +        return 0;
>> +
>> +    if (hwe->class == XE_ENGINE_CLASS_RENDER ||
>> +        hwe->class == XE_ENGINE_CLASS_COMPUTE) {
>> +        funcs = rcs_funcs;
>> +        num_funcs = ARRAY_SIZE(rcs_funcs);
>> +    }
>> +
>> +    if (xe_gt_WARN_ON(lrc->gt, !funcs))
>> +        return 0;
>> +
>> +    offset = __xe_lrc_indirect_ctx_offset(lrc);
>> +
>> +    cmd = setup_bo(lrc, hwe, LRC_INDIRECT_CTX_SIZE, 15, offset, funcs,
> 
> this 15 is directly related to the 64B align below, right? It's not
> something in addition, but rather the size alignment since the size we
> give to INDIRECT_CTX is in # of cachelines (and we don't want to execute
> garbage.
> 
> Maximum size per bspec 45954 is 63 cachelines: by passing max_size == 
> LRC_INDIRECT_CTX_SIZE and reserved_dw = 15 dwords,
> we would write up to 4036 and the alignment below will make the size go
> up to 64 instead of 63, since max size is then off by 4.
> Or did I miscalculate?
> 
> instead of passing a "reserved_dw" why are we not just passing
> max_size + reserved_dw, why are we not just passing max number of
> dwords, calculated here? This would also help stop mixing the units.

I am not sure there was a bug with the alignment code (if there was 
exactly 4036 of content, then align loop wouldn't run, no?), but anyway, 
I also did not know about the bspec 45954. So in the respin I have 
changed it to separate the BO size from the max indirect context size.

See how you like the latest.

Regards,

Tvrtko

> 
>> +               num_funcs, &buf, &written);
>> +    if (IS_ERR(cmd))
>> +        return PTR_ERR(cmd);
>> +
>> +    /* Align to 64B cacheline. */
> 
>      /*
>       * Align to 64B cacheline so there's no garbage at the end for
>       * CS to execute: size for indirect ctx must be a multiple of
>       * 64.
>       */
> 
> Lucas De Marchi
> 
>> +    while ((unsigned long)cmd & 0x3f) {
>> +        *cmd++ = MI_NOOP;
>> +        written++;
>> +    }
>> +
>> +    finish_bo(lrc, offset, written, buf);
>> +
>> +    xe_lrc_write_ctx_reg(lrc,
>> +                 CTX_CS_INDIRECT_CTX,
>> +                 (xe_bo_ggtt_addr(lrc->bo) + offset) |
>> +                 /* Size in CLs. */
>> +                 (written * sizeof(u32) / 64));
>> +    xe_lrc_write_ctx_reg(lrc,
>> +                 CTX_CS_INDIRECT_CTX_OFFSET,
>> +                 CTX_RCS_INDIRECT_CTX_OFFSET_DEFAULT << 6);
>> +
>> +    return 0;
>> +}
>> +
>> #define PVC_CTX_ASID        (0x2e + 1)
>> #define PVC_CTX_ACC_CTR_THOLD    (0x2a + 1)
>>
>> @@ -1074,7 +1140,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, 
>> struct xe_hw_engine *hwe,
>> {
>>     struct xe_gt *gt = hwe->gt;
>>     const u32 lrc_size = xe_gt_lrc_size(gt, hwe->class);
>> -    const u32 bo_size = ring_size + lrc_size + LRC_WA_BB_SIZE;
>> +    u32 bo_size = ring_size + lrc_size + LRC_WA_BB_SIZE;
>>     struct xe_tile *tile = gt_to_tile(gt);
>>     struct xe_device *xe = gt_to_xe(gt);
>>     struct iosys_map map;
>> @@ -1089,6 +1155,12 @@ static int xe_lrc_init(struct xe_lrc *lrc, 
>> struct xe_hw_engine *hwe,
>>     lrc->flags = 0;
>>     lrc->ring.size = ring_size;
>>     lrc->ring.tail = 0;
>> +
>> +    if (gt_engine_needs_indirect_ctx(gt, hwe->class)) {
>> +        lrc->flags |= XE_LRC_FLAG_INDIRECT_CTX;
>> +        bo_size += LRC_INDIRECT_CTX_SIZE;
>> +    }
>> +
>>     if (xe_gt_has_indirect_ring_state(gt))
>>         lrc->flags |= XE_LRC_FLAG_INDIRECT_RING_STATE;
>>
>> @@ -1213,6 +1285,10 @@ static int xe_lrc_init(struct xe_lrc *lrc, 
>> struct xe_hw_engine *hwe,
>>     if (err)
>>         goto err_lrc_finish;
>>
>> +    err = setup_indirect_ctx(lrc, hwe);
>> +    if (err)
>> +        goto err_lrc_finish;
>> +
>>     return 0;
>>
>> err_lrc_finish:
>> diff --git a/drivers/gpu/drm/xe/xe_lrc_types.h b/drivers/gpu/drm/xe/ 
>> xe_lrc_types.h
>> index 2c7c81079801..e9883706e004 100644
>> --- a/drivers/gpu/drm/xe/xe_lrc_types.h
>> +++ b/drivers/gpu/drm/xe/xe_lrc_types.h
>> @@ -29,7 +29,8 @@ struct xe_lrc {
>>     struct xe_gt *gt;
>>
>>     /** @flags: LRC flags */
>> -#define XE_LRC_FLAG_INDIRECT_RING_STATE        0x1
>> +#define XE_LRC_FLAG_INDIRECT_CTX        0x1
>> +#define XE_LRC_FLAG_INDIRECT_RING_STATE        0x2
>>     u32 flags;
>>
>>     /** @refcount: ref count of this lrc */
>> -- 
>> 2.48.0
>>

