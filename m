Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44A55C83F09
	for <intel-xe@archiver.kernel.org>; Tue,  8 Jul 2025 12:38:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04E8510E62B;
	Tue,  8 Jul 2025 12:38:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J3UBFOHF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F171D10E628
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Jul 2025 12:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751978334; x=1783514334;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=d7hwEKyPWwvFnaDiP6le/+bTbTf/UzioH/Q7f/2XH3w=;
 b=J3UBFOHFUPBjZwIDkp2Dei27Wnaw6Qjwai3IUY7eJCi/pPHlcQ3hJYDj
 nCMTP47Wy76nO6kArbaNwMrEYlyC463kBOP6xs4l8cAWLeHbR2axRquZA
 D+mNOsLy+eb4FLtp+qu+3ypOWIp/9pVYGMZqgnjK3VsqAn0xon9KGNrde
 H6Kf3MSkFblOnkGfv8yifhsbsI8rUSB1BFdVt65hxaj8iO5ikVDGeRpSB
 ZS7RFOz1oZqKEZRHmwdBwa7vfitu2FwJW23WpaROZbr1T8lzSa1CWgHi5
 Tf2O+ahOdQU1hkd+HRYJbKo+UK/BZEV6iih2FgFzoy8HKDTWCIs3PUEdX A==;
X-CSE-ConnectionGUID: 7pB8YMsyQpanxuVMwyCUWw==
X-CSE-MsgGUID: VSnXm225ThmJ9NXjy2MXTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="79645065"
X-IronPort-AV: E=Sophos;i="6.16,297,1744095600"; d="scan'208";a="79645065"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 05:38:53 -0700
X-CSE-ConnectionGUID: wSUqOPFwSd+5jbhw/qq6jA==
X-CSE-MsgGUID: qY3Ry82hQe2P4BzPwXOuZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,297,1744095600"; d="scan'208";a="159531364"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa003.fm.intel.com with ESMTP; 08 Jul 2025 05:38:52 -0700
Received: from [10.245.96.176] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.96.176])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 6892B2FC4B;
 Tue,  8 Jul 2025 13:38:51 +0100 (IST)
Message-ID: <77280c68-fb75-434e-ac04-6d9e97513c90@intel.com>
Date: Tue, 8 Jul 2025 14:38:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Dont skip TLB invalidations on VF
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
References: <20250708090156.741440-1-tejas.upadhyay@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250708090156.741440-1-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset=UTF-8
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



On 08.07.2025 11:01, Tejas Upadhyay wrote:
> Skipping TLB invalidations on VF causing unrecoverable
> faults. 

oops, my decision to drop it on VF was biased by this old comment:

	/* XXX: Do we need this? Leaving for now. */

> Probable reason for skipping TLB invalidations
> on SRIOV could be lack of support for instruction
> MI_FLUSH_DW_STORE_INDEX. 

true, this variant using GGTT is not supported on VFs

> Add back TLB flush with some
> additional handling.
> 
> Helps in resolving,
> [  704.913454] xe 0000:00:02.1: [drm:pf_queue_work_func [xe]]
>                 ASID: 0
>                 VFID: 0
>                 PDATA: 0x0d92
>                 Faulted Address: 0x0000000002fa0000
>                 FaultType: 0
>                 AccessType: 1
>                 FaultLevel: 0
>                 EngineClass: 3 bcs
>                 EngineInstance: 8
> [  704.913551] xe 0000:00:02.1: [drm:pf_queue_work_func [xe]] Fault response: Unsuccessful -22
> 
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Fixes: 97515d0b3ed92 ("drm/xe/vf: Don't emit access to Global HWSP if VF")
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_ring_ops.c | 22 ++++++++++------------
>  1 file changed, 10 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> index bc1689db4cd7..ee0fa208e2f8 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> @@ -110,13 +110,14 @@ static int emit_bb_start(u64 batch_addr, u32 ppgtt_flag, u32 *dw, int i)
>  	return i;
>  }
>  
> -static int emit_flush_invalidate(u32 *dw, int i)
> +static int emit_flush_invalidate(u32 addr, u32 val, u32 *dw, int i)

this helper is only used once and it looks almost exactly as another
open coded sequence at the caller - emit_migration_job_gen12(), so maybe
move this code there as-as?

>  {
>  	dw[i++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
> -		  MI_FLUSH_IMM_DW | MI_FLUSH_DW_STORE_INDEX;
> -	dw[i++] = LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR;
> -	dw[i++] = 0;
> +		  MI_FLUSH_IMM_DW;
> +
> +	dw[i++] = addr | MI_FLUSH_DW_USE_GTT;
>  	dw[i++] = 0;
> +	dw[i++] = val;
>  
>  	return i;
>  }
> @@ -398,22 +399,19 @@ static void emit_migration_job_gen12(struct xe_sched_job *job,
>  				     struct xe_lrc *lrc, u32 seqno)
>  {
>  	u32 dw[MAX_JOB_SIZE_DW], i = 0;
> +	u32 saddr = xe_lrc_start_seqno_ggtt_addr(lrc);

please keep definitions in rev-xmas-tree order

>  
>  	i = emit_copy_timestamp(lrc, dw, i);
>  
> -	i = emit_store_imm_ggtt(xe_lrc_start_seqno_ggtt_addr(lrc),
> -				seqno, dw, i);
> +	i = emit_store_imm_ggtt(saddr, seqno, dw, i);
>  
>  	dw[i++] = MI_ARB_ON_OFF | MI_ARB_DISABLE; /* Enabled again below */
>  
>  	i = emit_bb_start(job->ptrs[0].batch_addr, BIT(8), dw, i);
>  
> -	if (!IS_SRIOV_VF(gt_to_xe(job->q->gt))) {
> -		/* XXX: Do we need this? Leaving for now. */
> -		dw[i++] = preparser_disable(true);
> -		i = emit_flush_invalidate(dw, i);
> -		dw[i++] = preparser_disable(false);
> -	}
> +	dw[i++] = preparser_disable(true);
> +	i = emit_flush_invalidate(saddr, seqno, dw, i);

hmm, but seqno is already stored by the above emit_store_imm_ggtt(), so
maybe to fulfill MI_INVALIDATE_TLB requirement instead of post-sync
IMM(1) use post-sync TIMESTAMP(3)?

> +	dw[i++] = preparser_disable(false);
>  
>  	i = emit_bb_start(job->ptrs[1].batch_addr, BIT(8), dw, i);
>  

