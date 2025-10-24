Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B454DCCD1AB
	for <intel-xe@archiver.kernel.org>; Fri, 24 Oct 2025 10:50:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7672D10EA5F;
	Fri, 24 Oct 2025 10:50:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="WjQOgqRh";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A383510EA5F
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Oct 2025 10:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/Ercwz5MfM/PHrQ3b0web7fvpDXydb2CjGdpPYJ4ZY8=; b=WjQOgqRhU1NGEsgN2wiInev7+M
 vsmDRljhJFTC/ioKokxSlufJeSKnIUZytYR/WLnRLTHF1QF8WJsUJ15AiWrHdbeYIhjztxR3aqw1y
 SsLhN9XBMcKMGHUH6BHis9V1o5phhppS2gMvXx0ukbyw4DT2AV1QCL1CG/csi+JshGqNrps3+GGFH
 axlALPPyO8/IiUiVgFSGfMmbybWbuZjETxnEEwbLr3t9rveT48dDEPnFS4o/eHQrCc8zlJs0XABz8
 iPHe200ar1QidjqzcoLGj/NPKNIs/61yzKvQTWxLmwLqgT9LRthBWs9ofpry0eT+sGERsClUodMHW
 HwTVjIVw==;
Received: from [90.242.12.242] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1vCFN6-00EihY-Pe; Fri, 24 Oct 2025 12:50:12 +0200
Message-ID: <f7b3c372-eb46-4cc8-9671-eec6efe97085@igalia.com>
Date: Fri, 24 Oct 2025 11:50:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 04/12] drm/xe/xelp: Support auxccs invalidation on
 blitter
To: Matt Roper <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org, kernel-dev@igalia.com
References: <20251020075831.32818-1-tvrtko.ursulin@igalia.com>
 <20251020075831.32818-5-tvrtko.ursulin@igalia.com>
 <20251022225828.GX5409@mdroper-desk1.amr.corp.intel.com>
 <1bf5ca81-4bb0-4008-a1de-8e2c9158eebd@igalia.com>
 <20251023171011.GK1207432@mdroper-desk1.amr.corp.intel.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20251023171011.GK1207432@mdroper-desk1.amr.corp.intel.com>
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


On 23/10/2025 18:10, Matt Roper wrote:
> On Thu, Oct 23, 2025 at 08:51:45AM +0100, Tvrtko Ursulin wrote:
>>
>> On 22/10/2025 23:58, Matt Roper wrote:
>>> On Mon, Oct 20, 2025 at 08:58:22AM +0100, Tvrtko Ursulin wrote:
>>>> Auxccs platforms need to be able to invalidate auxccs on the blitter
>>>> engine.
>>>
>>> Drive-by comment:  there's no auxccs invalidation on any platforms
>>> except for MTL/ARL (and register 0x4248 does not exist outside those
>>> platforms).  The blitter engine was not compression-aware on earlier
>>> platforms, and after mtl/arl all platforms transitioned to flatccs.
>>
>> When you say no auxccs invalidation before MTL what exactly do you mean?
> 
> Sorry, I specifically meant to say that *BCS* aux invalidation is only
> relevant on MTL/ARL.  Aux invalidation for other engines did indeed
> exist earlier.

Ah cool, thanks for clearing it up!

>> I am confused because in i915 invalidation VCS and VECS was added in
>> 972282c4cf24 ("drm/i915/gen12: Add aux table invalidate for all engines"),
>> and then expanded to BCS in 6a35f22d2225 ("drm/i915/gt: Support aux
>> invalidation on all engines").
>>
>> Are you saying even the initial one was wrong? It sounds doubtful because I
>> don't think MTL was a thing back when that was written so people did get the
>> concept from somewhere.
>>
>> Maybe only 6a35f22d2225 was incorrect and only GEN12_BCS0_AUX_INV is MTL
>> only, while the rest is good?
> 
> Right, only the second commit here (which added BCS invalidation
> support) was wrong.  That was supposed to be specific to MTL/ARL.   In
> fact, the r-b for the patch was even conditional on making it
> MTL-specific, but I guess that got overlooked:
> 
> https://lore.kernel.org/all/5f846260-8416-fb19-bd46-ced39153a92a@intel.com/

I see. Good find.

I have adjusted and re-posted my series, thanks for spotting the 
mistakes and looking throught the internal docs!

Regards,

Tvrtko


>>
>> All I can see are public TGL docs which dont even list 0x4218. And
>> 972282c4cf24 is before ADL enablement so where did the info come from? It
>> mentions bspec#43904 and hsdes#180917579, for what platforms are those if
>> you could check?
> 
> Bspec 43904 is the register details page for
> "Register_CCSAuxiliaryTableInvalidate."  Checking the "References"
> information on that page lists the specific instances of the register
> that exist for various engines, and the blit instance is marked as
> "MTL,ARL."
> 
> HSD 1809175790 isn't terribly interesting here; it's a bug report
> against the Windows driver that was originally root caused to a mistake
> in aux programming and triggered an "oh, this is documented very clearly
> in the bspec; let's clean that up" action.  The more useful HSD is
> actually 16011159293 which represents the hardware change introduced by
> MTL that added compression support to the copy engines.  Before MTL, the
> copy engines couldn't do things like compressed<->uncompressed copies,
> or fast clears of compressed surfaces (i.e., clears that just update the
> CCS metadata to "this block is zero" and don't touch the main surface),
> so the engine didn't read or use the CCS and aux invalidation wasn't
> relevant.
> 
> 
> Matt
> 
>>
>> Regards,
>>
>> Tvrtko
>>>> Add the relevant mmio register and enable this by refactoring the ring
>>>> emission a bit to consolidate all non-render engines.
>>>>
>>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/regs/xe_gt_regs.h |   1 +
>>>>    drivers/gpu/drm/xe/xe_ring_ops.c     | 118 ++++++++++-----------------
>>>>    2 files changed, 46 insertions(+), 73 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>>> index 228de47c0f3f..12a7d7c73158 100644
>>>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>>> @@ -88,6 +88,7 @@
>>>>    #define CCS_AUX_INV				XE_REG(0x4208)
>>>>    #define VD0_AUX_INV				XE_REG(0x4218)
>>>> +#define BCS_AUX_INV				XE_REG(0x4248)
>>>>    #define VE0_AUX_INV				XE_REG(0x4238)
>>>>    #define VE1_AUX_INV				XE_REG(0x42b8)
>>>> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
>>>> index f384c9968859..87e467972070 100644
>>>> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
>>>> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
>>>> @@ -248,46 +248,6 @@ static int emit_copy_timestamp(struct xe_lrc *lrc, u32 *dw, int i)
>>>>    	return i;
>>>>    }
>>>> -/* for engines that don't require any special HW handling (no EUs, no aux inval, etc) */
>>>> -static void __emit_job_gen12_simple(struct xe_sched_job *job, struct xe_lrc *lrc,
>>>> -				    u64 batch_addr, u32 *head, u32 seqno)
>>>> -{
>>>> -	u32 dw[MAX_JOB_SIZE_DW], i = 0;
>>>> -	u32 ppgtt_flag = get_ppgtt_flag(job);
>>>> -	struct xe_gt *gt = job->q->gt;
>>>> -
>>>> -	*head = lrc->ring.tail;
>>>> -
>>>> -	i = emit_copy_timestamp(lrc, dw, i);
>>>> -
>>>> -	if (job->ring_ops_flush_tlb) {
>>>> -		dw[i++] = preparser_disable(true);
>>>> -		i = emit_flush_imm_ggtt(xe_lrc_start_seqno_ggtt_addr(lrc),
>>>> -					seqno, MI_INVALIDATE_TLB, dw, i);
>>>> -		dw[i++] = preparser_disable(false);
>>>> -	} else {
>>>> -		i = emit_store_imm_ggtt(xe_lrc_start_seqno_ggtt_addr(lrc),
>>>> -					seqno, dw, i);
>>>> -	}
>>>> -
>>>> -	i = emit_bb_start(batch_addr, ppgtt_flag, dw, i);
>>>> -
>>>> -	if (job->user_fence.used) {
>>>> -		i = emit_flush_dw(dw, i);
>>>> -		i = emit_store_imm_ppgtt_posted(job->user_fence.addr,
>>>> -						job->user_fence.value,
>>>> -						dw, i);
>>>> -	}
>>>> -
>>>> -	i = emit_flush_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc), seqno, 0, dw, i);
>>>> -
>>>> -	i = emit_user_interrupt(dw, i);
>>>> -
>>>> -	xe_gt_assert(gt, i <= MAX_JOB_SIZE_DW);
>>>> -
>>>> -	xe_lrc_write_ring(lrc, dw, i * sizeof(*dw));
>>>> -}
>>>> -
>>>>    static bool has_aux_ccs(struct xe_device *xe)
>>>>    {
>>>>    	/*
>>>> @@ -302,40 +262,52 @@ static bool has_aux_ccs(struct xe_device *xe)
>>>>    	return !xe->info.has_flat_ccs;
>>>>    }
>>>> -static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
>>>> -				   u64 batch_addr, u32 *head, u32 seqno)
>>>> +static void __emit_job_gen12_xcs(struct xe_sched_job *job, struct xe_lrc *lrc,
>>>> +				 u64 batch_addr, u32 *head, u32 seqno)
>>>>    {
>>>> -	u32 dw[MAX_JOB_SIZE_DW], i = 0;
>>>> -	u32 ppgtt_flag = get_ppgtt_flag(job);
>>>> +	const unsigned int class = job->q->class;
>>>>    	struct xe_gt *gt = job->q->gt;
>>>> -	struct xe_device *xe = gt_to_xe(gt);
>>>> -	bool decode = job->q->class == XE_ENGINE_CLASS_VIDEO_DECODE;
>>>> +	const bool aux_ccs = has_aux_ccs(gt_to_xe(gt)) &&
>>>> +			     (class == XE_ENGINE_CLASS_COPY ||
>>>> +			      class == XE_ENGINE_CLASS_VIDEO_DECODE ||
>>>> +			      class == XE_ENGINE_CLASS_VIDEO_ENHANCE);
>>>> +	const bool invalidate_tlb = aux_ccs || job->ring_ops_flush_tlb;
>>>> +	u32 dw[MAX_JOB_SIZE_DW], i = 0;
>>>>    	*head = lrc->ring.tail;
>>>>    	i = emit_copy_timestamp(lrc, dw, i);
>>>> -	dw[i++] = preparser_disable(true);
>>>> -
>>>> -	/* hsdes: 1809175790 */
>>>> -	if (has_aux_ccs(xe)) {
>>>> -		if (decode)
>>>> -			i = emit_aux_table_inv(gt, VD0_AUX_INV, dw, i);
>>>> -		else
>>>> -			i = emit_aux_table_inv(gt, VE0_AUX_INV, dw, i);
>>>> -	}
>>>> -
>>>> -	if (job->ring_ops_flush_tlb)
>>>> +	if (invalidate_tlb) {
>>>> +		dw[i++] = preparser_disable(true);
>>>>    		i = emit_flush_imm_ggtt(xe_lrc_start_seqno_ggtt_addr(lrc),
>>>> -					seqno, MI_INVALIDATE_TLB, dw, i);
>>>> +					seqno,
>>>> +					MI_INVALIDATE_TLB,
>>>> +					dw, i);
>>>> +		/* hsdes: 1809175790 */
>>>> +		if (aux_ccs) {
>>>> +			struct xe_reg reg;
>>>> -	dw[i++] = preparser_disable(false);
>>>> +			switch (job->q->class) {
>>>> +			case XE_ENGINE_CLASS_COPY:
>>>> +				reg = BCS_AUX_INV;
>>>> +				break;
>>>> +			case XE_ENGINE_CLASS_VIDEO_DECODE:
>>>> +				reg = VD0_AUX_INV;
>>>> +				break;
>>>> +			default:
>>>> +				reg = VE0_AUX_INV;
>>>> +			};
>>>> -	if (!job->ring_ops_flush_tlb)
>>>> +			i = emit_aux_table_inv(gt, reg, dw, i);
>>>> +		}
>>>> +		dw[i++] = preparser_disable(false);
>>>> +	} else {
>>>>    		i = emit_store_imm_ggtt(xe_lrc_start_seqno_ggtt_addr(lrc),
>>>>    					seqno, dw, i);
>>>> +	}
>>>> -	i = emit_bb_start(batch_addr, ppgtt_flag, dw, i);
>>>> +	i = emit_bb_start(batch_addr, get_ppgtt_flag(job), dw, i);
>>>>    	if (job->user_fence.used) {
>>>>    		i = emit_flush_dw(dw, i);
>>>> @@ -455,10 +427,10 @@ static void emit_job_gen12_gsc(struct xe_sched_job *job)
>>>>    	xe_gt_assert(gt, job->q->width <= 1); /* no parallel submission for GSCCS */
>>>> -	__emit_job_gen12_simple(job, job->q->lrc[0],
>>>> -				job->ptrs[0].batch_addr,
>>>> -				&job->ptrs[0].head,
>>>> -				xe_sched_job_lrc_seqno(job));
>>>> +	__emit_job_gen12_xcs(job, job->q->lrc[0],
>>>> +			     job->ptrs[0].batch_addr,
>>>> +			     &job->ptrs[0].head,
>>>> +			     xe_sched_job_lrc_seqno(job));
>>>>    }
>>>>    static void emit_job_gen12_copy(struct xe_sched_job *job)
>>>> @@ -473,10 +445,10 @@ static void emit_job_gen12_copy(struct xe_sched_job *job)
>>>>    	}
>>>>    	for (i = 0; i < job->q->width; ++i)
>>>> -		__emit_job_gen12_simple(job, job->q->lrc[i],
>>>> -					job->ptrs[i].batch_addr,
>>>> -					&job->ptrs[i].head,
>>>> -					xe_sched_job_lrc_seqno(job));
>>>> +		__emit_job_gen12_xcs(job, job->q->lrc[i],
>>>> +				     job->ptrs[i].batch_addr,
>>>> +				     &job->ptrs[0].head,
>>>> +				     xe_sched_job_lrc_seqno(job));
>>>>    }
>>>>    static void emit_job_gen12_video(struct xe_sched_job *job)
>>>> @@ -485,10 +457,10 @@ static void emit_job_gen12_video(struct xe_sched_job *job)
>>>>    	/* FIXME: Not doing parallel handshake for now */
>>>>    	for (i = 0; i < job->q->width; ++i)
>>>> -		__emit_job_gen12_video(job, job->q->lrc[i],
>>>> -				       job->ptrs[i].batch_addr,
>>>> -				       &job->ptrs[i].head,
>>>> -				       xe_sched_job_lrc_seqno(job));
>>>> +		__emit_job_gen12_xcs(job, job->q->lrc[i],
>>>> +				     job->ptrs[i].batch_addr,
>>>> +				     &job->ptrs[0].head,
>>>> +				     xe_sched_job_lrc_seqno(job));
>>>>    }
>>>>    static void emit_job_gen12_render_compute(struct xe_sched_job *job)
>>>> -- 
>>>> 2.48.0
>>>>
>>>
>>
> 

