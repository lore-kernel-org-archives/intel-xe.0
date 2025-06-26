Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41A9FC7EE32
	for <intel-xe@archiver.kernel.org>; Thu, 26 Jun 2025 08:57:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0211310E8D8;
	Thu, 26 Jun 2025 08:57:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="FKE5Jb2r";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E4BE10E8D2
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Jun 2025 08:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pURS3qYp5Bwsfmkq7FvoBbqxUXT92dxacOS37fXwp6U=; b=FKE5Jb2rBZpkYYTpvAj2Hdk74W
 H89HqmHvDzMwt6FZzC8SyNgvFxeL7HGVrRVrb2viuCRWlEq1WFzjAm7/6+qn88U4L443ehSNhUL41
 73e6g8WOrmmaI3IMTRkGoj/cg5npxxtNcqptDZYKvSjMfFahfml1KoCu0TnI5NtB+Tvwizz/2yNxw
 XQx4+6BMbNEV4WVx98xjNyLUaz5Bqn1D9MNG9oQSsQN5yCvFqoyRkRw+7VJYsiR6G9NaODcrzd9lG
 RG573NxzfQvs1dHtQsSYFqwR42E4yDu4+dhvr2CXdcaRVX1KJK9alFUFSWRS7ocQVshcJAPuRUzdU
 mU9NnVOw==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uUiPq-008uSd-7Z; Thu, 26 Jun 2025 10:57:06 +0200
Message-ID: <856c8bb5-c702-4079-b581-da40b743d0b4@igalia.com>
Date: Thu, 26 Jun 2025 09:57:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/7] drm/xe/xelp: Implement Wa_16010904313
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org, kernel-dev@igalia.com,
 Matt Roper <matthew.d.roper@intel.com>
References: <20250625153632.21220-1-tvrtko.ursulin@igalia.com>
 <20250625153632.21220-7-tvrtko.ursulin@igalia.com>
 <o6dw26fxwlpnj7dxpbdt2r62662rbyamjb24dcnvzysf3jh2yi@rnragrribl6k>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <o6dw26fxwlpnj7dxpbdt2r62662rbyamjb24dcnvzysf3jh2yi@rnragrribl6k>
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


On 25/06/2025 22:47, Lucas De Marchi wrote:
> On Wed, Jun 25, 2025 at 04:36:31PM +0100, Tvrtko Ursulin wrote:
>> Add XeLP workaround 16010904313.
>>
>> The description calls for it to be emitted as the indirect context buffer
>> workaround for render and compute, and from the workaround batch buffer
>> for the other engines. Therefore we plug into the previously added
>> respective top level emission functions.
>>
>> The actual command streamer programming sequence differs from what is
>> described in the PRM, in that it assumes the listed LRCA offset was
>> supposed to actually refer to the location of the CTX_TIMESTAMP register
>> instead of LRCA + 0x180c (which is in GPR space). Latter appears to make
>> more sense under the assumption that multiple writes are helping with
>> restoring the CTX_TIMESTAMP register content from the saved context 
>> state.
> 
> humn... but i915, which is supposedly doing the right thing,
> diverges from the PRM by using LRM + LRR + LRR. Here you are doing

Matt reported i915 was doing the wrong thing actually, compared to what 
was documented in the WA database at least. Not that the latter was 
completely clear, but we had a brief guessing game and I understood the 
conclusion was 3x LRM to forcefully restore CTX_TIMESTAMP is what made 
most sense.

See 
https://lore.kernel.org/intel-xe/20250523174135.GS5080@mdroper-desk1.amr.corp.intel.com/.

> something different from both. Does gputop show saner values after this?

Gputop looks okay to me. Are you saying this WA is fixing something is 
regularly goes wrong so could be easily observed? I thought it was about 
a rare failure to restore CTX_TIMESTAMP but that was just a guess to be 
fair.

>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> ---
>> .../gpu/drm/xe/instructions/xe_mi_commands.h  |  1 +
>> drivers/gpu/drm/xe/xe_lrc.c                   | 45 +++++++++++++++++++
>> drivers/gpu/drm/xe/xe_wa_oob.rules            |  1 +
>> 3 files changed, 47 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h b/ 
>> drivers/gpu/drm/xe/instructions/xe_mi_commands.h
>> index e3f5e8bb3ebc..c47b290e0e9f 100644
>> --- a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
>> +++ b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
>> @@ -65,6 +65,7 @@
>>
>> #define MI_LOAD_REGISTER_MEM        (__MI_INSTR(0x29) | 
>> XE_INSTR_NUM_DW(4))
>> #define   MI_LRM_USE_GGTT        REG_BIT(22)
>> +#define   MI_LRM_ASYNC            REG_BIT(21)
>>
>> #define MI_LOAD_REGISTER_REG        (__MI_INSTR(0x2a) | 
>> XE_INSTR_NUM_DW(3))
>> #define   MI_LRR_DST_CS_MMIO        REG_BIT(19)
>> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>> index d4f558a863eb..f86a09ed6848 100644
>> --- a/drivers/gpu/drm/xe/xe_lrc.c
>> +++ b/drivers/gpu/drm/xe/xe_lrc.c
>> @@ -52,6 +52,11 @@ lrc_to_xe(struct xe_lrc *lrc)
>> static bool
>> gt_engine_needs_indirect_ctx(struct xe_gt *gt, enum xe_engine_class 
>> class)
>> {
>> +    if (XE_WA(gt, 16010904313) &&
>> +        (class == XE_ENGINE_CLASS_RENDER ||
>> +         class == XE_ENGINE_CLASS_COMPUTE))
>> +        return true;
>> +
>>     return false;
>> }
>>
>> @@ -990,6 +995,44 @@ static ssize_t wa_bb_setup_utilization(struct 
>> xe_lrc *lrc, struct xe_hw_engine *
>>     return cmd - batch;
>> }
>>
>> +static ssize_t
>> +xelp_emit_timestamp_wa(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>> +               u32 *batch, size_t max_len)
>> +{
>> +    const u32 ts_addr = __xe_lrc_ctx_timestamp_ggtt_addr(lrc);
>> +    u32 *cmd = batch;
>> +
>> +    if (!XE_WA(lrc->gt, 16010904313) ||
>> +        !(hwe->class == XE_ENGINE_CLASS_RENDER ||
>> +          hwe->class == XE_ENGINE_CLASS_COMPUTE ||
>> +          hwe->class == XE_ENGINE_CLASS_COPY ||
>> +          hwe->class == XE_ENGINE_CLASS_VIDEO_DECODE ||
>> +          hwe->class == XE_ENGINE_CLASS_VIDEO_ENHANCE))
>> +        return 0;
>> +
>> +    if (xe_gt_WARN_ON(lrc->gt, max_len < 12))
>> +        return -ENOSPC;
>> +
>> +    *cmd++ = MI_LOAD_REGISTER_MEM | MI_LRM_USE_GGTT | 
>> MI_LRI_LRM_CS_MMIO |
>> +         MI_LRM_ASYNC;
>> +    *cmd++ = RING_CTX_TIMESTAMP(0).addr;
>> +    *cmd++ = ts_addr;
>> +    *cmd++ = 0;
>> +
>> +    *cmd++ = MI_LOAD_REGISTER_MEM | MI_LRM_USE_GGTT | 
>> MI_LRI_LRM_CS_MMIO |
>> +         MI_LRM_ASYNC;
>> +    *cmd++ = RING_CTX_TIMESTAMP(0).addr;
>> +    *cmd++ = ts_addr;
>> +    *cmd++ = 0;
>> +
>> +    *cmd++ = MI_LOAD_REGISTER_MEM | MI_LRM_USE_GGTT | 
>> MI_LRI_LRM_CS_MMIO;
>> +    *cmd++ = RING_CTX_TIMESTAMP(0).addr;
>> +    *cmd++ = ts_addr;
>> +    *cmd++ = 0;
>> +
>> +    return cmd - batch;
>> +}
>> +
>> struct wa_bo_setup {
>>     ssize_t (*setup)(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>>              u32 *batch, size_t max_size);
>> @@ -1061,6 +1104,7 @@ static void finish_wa_bo(struct xe_lrc *lrc,
>> static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
>> {
>>     static const struct wa_bo_setup funcs[] = {
>> +        { .setup = xelp_emit_timestamp_wa },
>>         { .setup = wa_bb_setup_utilization },
> 
> I think there's a mix of names here. It seems it would be better to name
> these like this:
> 
> static const struct bo_setup funcs[] = {
>      { .setup = bo_setup_timestamp_wa },
>      { .setup = bo_setup_utilization },
> }
> 
> 
>>     };
>>     unsigned int offset = __xe_lrc_wa_bb_offset(lrc);
>> @@ -1087,6 +1131,7 @@ static int
>> setup_indirect_ctx(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
>> {
>>     static struct wa_bo_setup rcs_funcs[] = {
>> +        { .setup = xelp_emit_timestamp_wa },
>>     };
> 
> here it would be:
> 
>       static struct bo_setup rcs_funcs[] = {
>          { .setup = bo_setup_timestamp_wa },
>       };
> 
> or drop the bo_ prefix too and just use setup_xyz

No strong opinion from me - I can change it to either. Logic behind 
xelp_ prefix was that it is a workaround which only applies to those 
platforms.

Regards,

Tvrtko

> 
> 
> Lucas De Marchi
> 
>>     unsigned int offset, num_funcs, written = 0;
>>     struct wa_bo_setup *funcs = NULL;
>> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/ 
>> xe_wa_oob.rules
>> index 8c2aa48cb33a..51967489c564 100644
>> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
>> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
>> @@ -1,4 +1,5 @@
>> 1607983814    GRAPHICS_VERSION_RANGE(1200, 1210)
>> +16010904313    GRAPHICS_VERSION_RANGE(1200, 1210)
>> 22012773006    GRAPHICS_VERSION_RANGE(1200, 1250)
>> 14014475959    GRAPHICS_VERSION_RANGE(1270, 1271), GRAPHICS_STEP(A0, B0)
>>         PLATFORM(DG2)
>> -- 
>> 2.48.0
>>

