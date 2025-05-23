Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1619AC54ED0
	for <intel-xe@archiver.kernel.org>; Fri, 23 May 2025 10:33:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBD9510E0D1;
	Fri, 23 May 2025 10:33:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="K/8OfKN9";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F8E010E0D1
 for <intel-xe@lists.freedesktop.org>; Fri, 23 May 2025 10:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gjtAd4pAQzE5XZyY8xMmQvZhYh5QHkHmQykCpMa/r0U=; b=K/8OfKN9Q2GRhOq+eAMoCIllUC
 EsflppC4Kt0v1aXYTjE6UTeZmFlbGpZXP9EIYbfoKHj9YILKKyzMCFDw2TqwjLm5ivWY1dzKwkiYI
 aPg61LD5gQwyipwCOfC7TUAV/Qi+m7UamDw+uCWkuqhQEq89TObO6k67dBt7NqV2AFMJfMmWiCUZS
 qLSKKyMK2+Bgr5tI6oG2DNku5d4kBefhFKfV4EOqVbM2Q/pueVL9xlg69eN1l8LgBKu4mlaDl6qR1
 l3jzP58NxDJXpCSn49WNM/LzZyscNJ8Gj05D0vN18kIlYGFCehFaZJQ5vl75v2TC/n/FtxhzOQj/P
 y0FNJ4lA==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uIPiH-00C8DC-AF; Fri, 23 May 2025 12:33:17 +0200
Message-ID: <4582d65a-e465-47b0-af2d-a4017f01d787@igalia.com>
Date: Fri, 23 May 2025 11:33:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/xe/xelp: Implement HSDES#16010904313 workarounds
To: Matt Roper <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org, kernel-dev@igalia.com
References: <20250516074412.46863-1-tvrtko.ursulin@igalia.com>
 <20250516074412.46863-3-tvrtko.ursulin@igalia.com>
 <20250516190000.GL5080@mdroper-desk1.amr.corp.intel.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20250516190000.GL5080@mdroper-desk1.amr.corp.intel.com>
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


Hi Matt,

One clarification below:

On 16/05/2025 20:00, Matt Roper wrote:
> On Fri, May 16, 2025 at 08:44:11AM +0100, Tvrtko Ursulin wrote:
>> +static u32 *
>> +xelp_emit_timestamp_wa(struct xe_lrc *lrc, u32 *cmd)
>> +{
>> +	*cmd++ = MI_LOAD_REGISTER_MEM | MI_LRM_USE_GGTT | MI_LRI_LRM_CS_MMIO;
>> +	*cmd++ = CS_GPR_REG(0, 0).addr;
>> +	*cmd++ = __xe_lrc_regs_ggtt_addr(lrc) + CTX_TIMESTAMP * sizeof(u32);
>> +	*cmd++ = 0;
>> +
>> +	*cmd++ = MI_LOAD_REGISTER_REG | MI_LRR_SRC_CS_MMIO | MI_LRI_LRM_CS_MMIO;
>> +	*cmd++ = CS_GPR_REG(0, 0).addr;
>> +	*cmd++ = RING_CTX_TIMESTAMP(0).addr;
>> +
>> +	*cmd++ = MI_LOAD_REGISTER_REG | MI_LRR_SRC_CS_MMIO | MI_LRI_LRM_CS_MMIO;
>> +	*cmd++ = CS_GPR_REG(0, 0).addr;
>> +	*cmd++ = RING_CTX_TIMESTAMP(0).addr;
> 
> This doesn't seem to actually match the documented workaround details.
> The workaround says we need to do three back-to-back MI_LRM instructions
> to read CTX_TIMESTAMP into $lrc+0x108C.  The first two are supposed to
> have dw0[21] (i.e., async mode) enabled, and the third should have it
> disabled.  I'm guessing this got implemented in i915 before the formal
> workaround description was finalized, or the hardware people updated the
> description after we'd already implemented the workaround.
> 
> That will also prevent us from clobbering the GPR register, which will
> let us drop the restore_scratch function.

I only realized this was unclear when I went to work on a respin to 
address it.

Are you saying the workaround specifies to read from LRC CTX_TIMESTAMP 
into LRC+0x108c? This wouldn't be MI_LRM though.

Or read from RING_CTX_TIMESTAMP into LRC+0x108c? And this wouldn't be 
MI_LRM either.

So I don't know what three back-to-back MI_LRM the workaround actually 
asks for.

Especially when it says first two should have async mode enabled. So 
maybe not to, but _from_ LRC+0x108c? Into RING_CTX_TIMESTAMP three times?

In which case the question would by why LRC+0x108c. That is where GPR 
registers are saved, right? But it is not GPR0, which one I am not sure 
because I am confused by the fact TGL PRM says that in LRCA there are 64 
dwords for 16 64-bit registers, which should be 32 dwords really, no?

Even in this case I don't see how writting a random GPR into a 
RING_CTX_TIMESTAMP makes sense.

Regards,

Tvrtko

> 
>> +
>> +	return cmd;
>> +}
>> +
>> +static u32 *
>> +xelp_emit_restore_scratch(struct xe_lrc *lrc, u32 *cmd)
>> +{
>> +	*cmd++ = MI_LOAD_REGISTER_MEM | MI_LRM_USE_GGTT | MI_LRI_LRM_CS_MMIO;
>> +	*cmd++ = CS_GPR_REG(0, 0).addr;
>> +	*cmd++ = __xe_lrc_regs_ggtt_addr(lrc) + CTX_GPR0 * sizeof(u32);
>> +	*cmd++ = 0;
>> +
>> +	return cmd;
>> +}
>> +
>> +static u32 *
>> +xelp_emit_cmd_buf_wa(struct xe_lrc *lrc, u32 *cmd)
>> +{
>> +	*cmd++ = MI_LOAD_REGISTER_MEM | MI_LRM_USE_GGTT | MI_LRI_LRM_CS_MMIO;
>> +	*cmd++ = CS_GPR_REG(0, 0).addr;
>> +	*cmd++ = __xe_lrc_regs_ggtt_addr(lrc)+ CTX_CMD_BUF_CCTL * sizeof(u32);
>> +	*cmd++ = 0;
>> +
>> +	*cmd++ = MI_LOAD_REGISTER_REG | MI_LRR_SRC_CS_MMIO | MI_LRR_DST_CS_MMIO;
>> +	*cmd++ = CS_GPR_REG(0, 0).addr;
>> +	*cmd++ = RING_CMD_BUF_CCTL(0).addr;
> 
> I don't see any documented workaround asking us to do this restoration
> of the CMD_BUF_CCTL register.  I suspect the i915 implementation was
> either something for pre-production hardware that never should have
> stuck around in the driver, or it was hacking around some other driver
> bug.  Are you finding this to actually be necessary for something today?
> 
>> +
>> +	return cmd;
>> +}
>> +
>> +static u32 *
>> +xelp_setup_indirect_ctx_rcs(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>> +			    u32 *cmd)
>> +{
>> +	/* HSDES#16010904313 */
>> +	cmd = xelp_emit_timestamp_wa(lrc, cmd);
>> +	cmd = xelp_emit_cmd_buf_wa(lrc, cmd);
>> +	cmd = xelp_emit_restore_scratch(lrc, cmd);
>> +
>> +	return cmd;
>> +}
>> +
>> +static u32 *
>> +xelp_setup_indirect_ctx_xcs(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>> +			    u32 *cmd)
>> +{
>> +	/* HSDES#16010904313 */
>> +	cmd = xelp_emit_timestamp_wa(lrc, cmd);
>> +	cmd = xelp_emit_restore_scratch(lrc, cmd);
>> +
>> +	return cmd;
>> +}
>> +
>> +static void
>> +xelp_setup_indirect_ctx(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
>> +{
>> +	u32 *start, *cmd, *regs;
>> +	struct iosys_map map;
>> +	u32 ggtt, offset;
>> +
>> +	if (!(lrc->flags & XE_LRC_FLAG_INDIRECT_CTX))
>> +		return;
>> +
>> +	offset = lrc->size - LRC_INDIRECT_CTX_SIZE;
>> +	ggtt = xe_bo_ggtt_addr(lrc->bo) + offset;
>> +
>> +	map = lrc->bo->vmap;
>> +	iosys_map_incr(&map, offset);
>> +	start = cmd = map.vaddr;
> 
> Isn't this going to be a problem if the iosys_map is holding iomem?  If
> we're going to build the indirect context batch directly with CPU
> pointer accesses as the functions above do, don't we need to do that in
> a separate buffer and then copy it into the iosys_map?
> 
> 
>> +
>> +	if (hwe->class == XE_ENGINE_CLASS_RENDER)
>> +		cmd = xelp_setup_indirect_ctx_rcs(lrc, hwe, cmd);
> 
> This also deviates from the documented workaround.  According to the
> workaround database, INDIRECT_CTX should be used for RCS/CCS, but we're
> supposed to use BB_PER_CTX_PTR instead for RCS/CCS (both are similar
> mechanisms, but INDIRECT_CTX happens somewhere in the middle of a
> context restore, whereas BB_PER_CTX_PTR happens at the very end of the
> context restore).
> 
> 
> Matt
> 
>> +	else
>> +		cmd = xelp_setup_indirect_ctx_xcs(lrc, hwe, cmd);
>> +
>> +	while ((unsigned long)cmd & 0x3f) /* Align to 64B cacheline. */
>> +		*cmd++ = MI_NOOP;
>> +
>> +	map = __xe_lrc_regs_map(lrc);
>> +	regs = map.vaddr;
>> +
>> +	regs[CTX_CS_INDIRECT_CTX] = ggtt | ((cmd - start) * sizeof(u32) / 64); /* Size in CLs. */
>> +	regs[CTX_CS_INDIRECT_CTX_OFFSET] = XELP_CTX_RCS_INDIRECT_CTX_OFFSET_DEFAULT << 6;
>> +}
>> +
>>   #define PVC_CTX_ASID		(0x2e + 1)
>>   #define PVC_CTX_ACC_CTR_THOLD	(0x2a + 1)
>>   
>> @@ -997,6 +1106,10 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>>   	lrc->size = ring_size + lrc_size;
>>   	lrc->ring.size = ring_size;
>>   	lrc->ring.tail = 0;
>> +
>> +	if (xe_needs_indirect_ctx(xe))
>> +		lrc->flags |= XE_LRC_FLAG_INDIRECT_CTX;
>> +
>>   	if (xe_gt_has_indirect_ring_state(gt))
>>   		lrc->flags |= XE_LRC_FLAG_INDIRECT_RING_STATE;
>>   
>> @@ -1127,6 +1240,8 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>>   
>>   	xe_lrc_setup_utilization(lrc);
>>   
>> +	xelp_setup_indirect_ctx(lrc, hwe);
>> +
>>   	return 0;
>>   
>>   err_lrc_finish:
>> diff --git a/drivers/gpu/drm/xe/xe_lrc_types.h b/drivers/gpu/drm/xe/xe_lrc_types.h
>> index 559c7c831212..9ce7d02ef210 100644
>> --- a/drivers/gpu/drm/xe/xe_lrc_types.h
>> +++ b/drivers/gpu/drm/xe/xe_lrc_types.h
>> @@ -29,7 +29,8 @@ struct xe_lrc {
>>   	struct xe_gt *gt;
>>   
>>   	/** @flags: LRC flags */
>> -#define XE_LRC_FLAG_INDIRECT_RING_STATE		0x1
>> +#define XE_LRC_FLAG_INDIRECT_CTX		0x1
>> +#define XE_LRC_FLAG_INDIRECT_RING_STATE		0x2
>>   	u32 flags;
>>   
>>   	/** @refcount: ref count of this lrc */
>> -- 
>> 2.48.0
>>
> 

