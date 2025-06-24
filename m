Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DEBDC77B7F
	for <intel-xe@archiver.kernel.org>; Tue, 24 Jun 2025 09:11:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FB9C10E0BC;
	Tue, 24 Jun 2025 09:11:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lb7SgF4i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21E4210E0BC
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Jun 2025 09:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750756264; x=1782292264;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=D6hUC9ONXi+dK+odg2LNyShnoiV+Fn26lgTC6328yhQ=;
 b=lb7SgF4ia3ff8IT6aJK7bZnb9FWUSAQfChw2jonbf+DrQkhcSqFfmvi+
 B7e1YHNAPRuUz9SBuT9aDJbE2NZi1jMGvVF4XgCSzCgsFezdBWmSeIB+B
 6CiqiQj/+ERn0g4AnYrlGqr/cyAydEWKBSEOm0xCObb72ZuetkTTNp28a
 uo1mpn1MZYORGNCAIl1GAx+ow88rB/88V9Qg/qBDkc439YQ5eRRgFIxTq
 ppGwFncA6Slo0yPrnbg6QWxsqcUmXpdlV+g08dG/vcSUfDTfT5K7wGsew
 vbJuDhQKgDXYiYRP3TF6tRtuiREeq90V37NBZADnMau41jjyUeOVBvxbw g==;
X-CSE-ConnectionGUID: cCWbAOLKRambV12LdETH7w==
X-CSE-MsgGUID: cGb0E3CeSBWsmSrQZI9Dvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="56770910"
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; d="scan'208";a="56770910"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 02:11:04 -0700
X-CSE-ConnectionGUID: uOLCigT2TkaICrnyOySmhg==
X-CSE-MsgGUID: ffsuXF/bTTeNsqh0HHMeJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; d="scan'208";a="189056673"
Received: from zzombora-mobl1.ger.corp.intel.com (HELO [10.245.245.11])
 ([10.245.245.11])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 02:11:03 -0700
Message-ID: <28afefad-c5e4-4690-b3e7-b017add0bf0b@intel.com>
Date: Tue, 24 Jun 2025 10:11:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/migrate: make MI_TLB_INVALIDATE conditional
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
References: <20250620152446.239699-2-matthew.auld@intel.com>
 <aFWIS3/rlAWSlF6K@lstrano-desk.jf.intel.com>
 <530d502e-165d-41fb-9ce8-b6bbbbb8107a@intel.com>
 <aFk5dTinjFYcZKjt@lstrano-desk.jf.intel.com>
 <aFnLmAeQe78KFUOv@lstrano-desk.jf.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <aFnLmAeQe78KFUOv@lstrano-desk.jf.intel.com>
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

On 23/06/2025 22:48, Matthew Brost wrote:
> On Mon, Jun 23, 2025 at 04:24:37AM -0700, Matthew Brost wrote:
>> On Mon, Jun 23, 2025 at 10:33:13AM +0100, Matthew Auld wrote:
>>> On 20/06/2025 17:11, Matthew Brost wrote:
>>>> On Fri, Jun 20, 2025 at 04:24:47PM +0100, Matthew Auld wrote:
>>>>> When clearing VRAM we should be able to skip invalidating the TLBs if we
>>>>
>>>> For copies, we always program SRAM PTEs, and need a invalidate?
>>>> Maybe mention this in the commit message.
>>>
>>> Yup exactly that. I don't think we currently do vram -> vram in practice so
>>> I didn't bother with the copy path. Will tweak the commit message.
>>>
>>>>
>>>>> are only using the identity map to access VRAM (which is the common
>>>>> case), since no modifications are made to PTEs on the fly. Also since we
>>>>> use huge 1G entries within the identity map, there should be a pretty
>>>>> decent chance that the next packet(s) (if also clears) can avoid a tree
>>>>> walk if we don't shoot down the TLBs, like if we have to process a long
>>>>> stream of clears.
>>>>>
>>>>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>>>>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>>> ---
>>>>>    drivers/gpu/drm/xe/xe_migrate.c  | 18 +++++++++++-------
>>>>>    drivers/gpu/drm/xe/xe_ring_ops.c | 10 +++++-----
>>>>>    2 files changed, 16 insertions(+), 12 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
>>>>> index 8f8e9fdfb2a8..a76363740a12 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_migrate.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_migrate.c
>>>>> @@ -896,7 +896,7 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>>>>>    			goto err;
>>>>>    		}
>>>>> -		xe_sched_job_add_migrate_flush(job, flush_flags);
>>>>> +		xe_sched_job_add_migrate_flush(job, flush_flags | MI_INVALIDATE_TLB);
>>>>>    		if (!fence) {
>>>>>    			err = xe_sched_job_add_deps(job, src_bo->ttm.base.resv,
>>>>>    						    DMA_RESV_USAGE_BOOKKEEP);
>>>>> @@ -1119,11 +1119,13 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>>>>>    		size -= clear_L0;
>>>>>    		/* Preemption is enabled again by the ring ops. */
>>>>> -		if (clear_vram && xe_migrate_allow_identity(clear_L0, &src_it))
>>>>> +		if (clear_vram && xe_migrate_allow_identity(clear_L0, &src_it)) {
>>>>>    			xe_res_next(&src_it, clear_L0);
>>>>> -		else
>>>>> -			emit_pte(m, bb, clear_L0_pt, clear_vram, clear_only_system_ccs,
>>>>> -				 &src_it, clear_L0, dst);
>>>>> +		} else {
>>>>> +			emit_pte(m, bb, clear_L0_pt, clear_vram,
>>>>> +				 clear_only_system_ccs, &src_it, clear_L0, dst);
>>>>> +			flush_flags |= MI_INVALIDATE_TLB;
>>>>> +		}
>>>>
>>>> What about the if statements for dst_it / copy_system_ccs? Do we not
>>>> need to set MI_INVALIDATE_TLB there?
>>>
>>> You mean for the copy path? We unconditionally apply MI_INVALIDATE_TLB when
>>> doing any copy.
>>>
>>
>> I was looking at wrong function (xe_migrate_copy) - I thought there were
>> a couple more calls to emit_pte here but on 2nd look, nope.
>>
>> So patch the LGTM:
>> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>>
> 
> Hey since you are here. I noticed in emit_migration_job_gen12
> 
>>>>
>>>> Matt
>>>>
>>>>>    		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
>>>>>    		update_idx = bb->len;
>>>>> @@ -1134,7 +1136,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>>>>>    		if (xe_migrate_needs_ccs_emit(xe)) {
>>>>>    			emit_copy_ccs(gt, bb, clear_L0_ofs, true,
>>>>>    				      m->cleared_mem_ofs, false, clear_L0);
>>>>> -			flush_flags = MI_FLUSH_DW_CCS;
>>>>> +			flush_flags |= MI_FLUSH_DW_CCS;
>>>>>    		}
>>>>>    		job = xe_bb_create_migration_job(m->q, bb,
>>>>> @@ -1469,6 +1471,8 @@ __xe_migrate_update_pgtables(struct xe_migrate *m,
>>>>>    		goto err_sa;
>>>>>    	}
>>>>> +	xe_sched_job_add_migrate_flush(job, MI_INVALIDATE_TLB);
>>>>> +
>>>>>    	if (ops->pre_commit) {
>>>>>    		pt_update->job = job;
>>>>>    		err = ops->pre_commit(pt_update);
>>>>> @@ -1667,7 +1671,7 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
>>>>>    		goto err;
>>>>>    	}
>>>>> -	xe_sched_job_add_migrate_flush(job, 0);
>>>>> +	xe_sched_job_add_migrate_flush(job, MI_INVALIDATE_TLB);
>>>>>    	mutex_lock(&m->job_mutex);
>>>>>    	xe_sched_job_arm(job);
>>>>> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
>>>>> index bc1689db4cd7..b5548e0769f4 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
>>>>> @@ -110,10 +110,10 @@ static int emit_bb_start(u64 batch_addr, u32 ppgtt_flag, u32 *dw, int i)
>>>>>    	return i;
>>>>>    }
>>>>> -static int emit_flush_invalidate(u32 *dw, int i)
>>>>> +static int emit_flush_invalidate(u32 *dw, int i, u32 flush_flags)
>>>>>    {
>>>>> -	dw[i++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
>>>>> -		  MI_FLUSH_IMM_DW | MI_FLUSH_DW_STORE_INDEX;
>>>>> +	dw[i++] = MI_FLUSH_DW |  MI_FLUSH_DW_OP_STOREDW | MI_FLUSH_IMM_DW |
>>>>> +		MI_FLUSH_DW_STORE_INDEX | (flush_flags & MI_INVALIDATE_TLB) ?: 0;
>>>>>    	dw[i++] = LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR;
>>>>>    	dw[i++] = 0;
>>>>>    	dw[i++] = 0;
>>>>> @@ -411,13 +411,13 @@ static void emit_migration_job_gen12(struct xe_sched_job *job,
>>>>>    	if (!IS_SRIOV_VF(gt_to_xe(job->q->gt))) {
>>>>>    		/* XXX: Do we need this? Leaving for now. */
>>>>>    		dw[i++] = preparser_disable(true);
>>>>> -		i = emit_flush_invalidate(dw, i);
>>>>> +		i = emit_flush_invalidate(dw, i, job->migrate_flush_flags);
>>>>>    		dw[i++] = preparser_disable(false);
>>>>>    	}
>>>>>    	i = emit_bb_start(job->ptrs[1].batch_addr, BIT(8), dw, i);
>>>>> -	dw[i++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | job->migrate_flush_flags |
>>>>> +	dw[i++] = MI_FLUSH_DW | job->migrate_flush_flags |
> 
> Just noticed this part. Do we need to ever invalidate the TLBs here? I'm
> confused why we would. The first batch emits the PTEs, the second does a
> copy. Why after a copy would we have to invalidate the PTEs? The next
> job should invalidate the PTEs after emitting them.
> 
> Not blocker as this is existing code but maybe in a follow up we never
> invalidate here.

Yeah agree, don't see why we need that.

> 
> Matt
> 
>>>>>    		MI_FLUSH_DW_OP_STOREDW | MI_FLUSH_IMM_DW;
>>>>>    	dw[i++] = xe_lrc_seqno_ggtt_addr(lrc) | MI_FLUSH_DW_USE_GTT;
>>>>>    	dw[i++] = 0;
>>>>> -- 
>>>>> 2.49.0
>>>>>
>>>

