Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7D90C7EE32
	for <intel-xe@archiver.kernel.org>; Fri, 27 Jun 2025 13:20:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A5B510E22E;
	Fri, 27 Jun 2025 13:20:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MgUkDuM7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3EE310E22E
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Jun 2025 13:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751030415; x=1782566415;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=wra3HffTcm/u4AhWPjp3FRTxrP+PGP/25JLKyuQDudU=;
 b=MgUkDuM7epx+Q7zPVNNLNrqj3Ge8H0ukq7pz4CgFkwVoOVy4lrtM5vAL
 +IeP7FjKSOaYfAEb7sImydU5IuSrzWVlqpgYZAD+64KlqD/ZQjmYiR7US
 6jYxdb/ElqgdRtUC/hXgGDrttu81LzG1/2JY7FEtXXKkAqQUeV5bpOaD/
 4LwDWmfj0B7zB+h/XOVzfSe7KM4ZinX15nqWCZ61Gzq2G/Rt2LPsM1blq
 R8uShTPrCmWznWD/j0F2aUXQWq2L706mzCBxYu49yWe0K969XExQYnK8u
 WWgQhUyMrQZrrGZlolgjcN2RgLrReJR6+QPK5QLUZGsthAVbGec53jeUv Q==;
X-CSE-ConnectionGUID: eGU1wLk3T/aHNF0c+9JoLA==
X-CSE-MsgGUID: SvV5QAjbSBW9p+zVOX744w==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="57124845"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="57124845"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 06:20:15 -0700
X-CSE-ConnectionGUID: NHjrrLQyQ7S/VrTwHN0SrA==
X-CSE-MsgGUID: BANQJ40xSHiLpLeJboNUEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="152891575"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 06:20:13 -0700
Date: Fri, 27 Jun 2025 16:20:10 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org, kernel-dev@igalia.com
Subject: Re: [PATCH 2/2] drm/xe: Waste fewer instructions in emit_wa_job()
Message-ID: <aF6aigpUviiv0OXU@black.fi.intel.com>
References: <20250627131438.54398-1-tvrtko.ursulin@igalia.com>
 <20250627131438.54398-3-tvrtko.ursulin@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627131438.54398-3-tvrtko.ursulin@igalia.com>
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

On Fri, Jun 27, 2025 at 02:14:38PM +0100, Tvrtko Ursulin wrote:
> I was debugging some unrelated issue and noticed the current code was
> very verbose. We can improve it easily by using the more common batch
> buffer building pattern.
> 
> Before:
> 
>                         bb->cs[bb->len++] = MI_LOAD_REGISTER_REG | MI_LRR_DST_CS_MMIO;
>      c4d:       41 8b 56 10             mov    0x10(%r14),%edx
>      c51:       49 8b 4e 08             mov    0x8(%r14),%rcx
>      c55:       8d 72 01                lea    0x1(%rdx),%esi
>      c58:       41 89 76 10             mov    %esi,0x10(%r14)
>      c5c:       c7 04 91 01 00 08 15    movl   $0x15080001,(%rcx,%rdx,4)
>                         bb->cs[bb->len++] = entry->reg.addr;
>      c63:       8b 08                   mov    (%rax),%ecx
>      c65:       41 8b 56 10             mov    0x10(%r14),%edx
>      c69:       49 8b 76 08             mov    0x8(%r14),%rsi
>      c6d:       81 e1 ff ff 3f 00       and    $0x3fffff,%ecx
>      c73:       8d 7a 01                lea    0x1(%rdx),%edi
>      c76:       41 89 7e 10             mov    %edi,0x10(%r14)
>      c7a:       89 0c 96                mov    %ecx,(%rsi,%rdx,4)
>  ..etc..
> 
> After:
> 
>                              *cs++ = MI_LOAD_REGISTER_REG | MI_LRR_DST_CS_MMIO;
>      c52:       41 c7 04 24 01 00 08    movl   $0x15080001,(%r12)
>      c59:       15
>                         *cs++ = entry->reg.addr;
>      c5a:       8b 10                   mov    (%rax),%edx
>  ..etc..

Use bloat-o-meter. It usually provides nice summary.

Raag

> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> ---
>  drivers/gpu/drm/xe/xe_gt.c  | 77 ++++++++++++++++++++-----------------
>  drivers/gpu/drm/xe/xe_lrc.c | 12 +++---
>  drivers/gpu/drm/xe/xe_lrc.h |  2 +-
>  3 files changed, 49 insertions(+), 42 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 86018fee74d3..a5b0db43bcee 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -182,19 +182,21 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
>  {
>  	struct xe_reg_sr *sr = &q->hwe->reg_lrc;
>  	struct xe_reg_sr_entry *entry;
> +	int count = 0, count_rmw = 0;
> +	struct xe_sched_job *job;
> +	struct dma_fence *fence;
>  	unsigned long idx;
> -	struct xe_sched_job *job;
>  	struct xe_bb *bb;
> -	struct dma_fence *fence;
>  	long timeout;
> -	int count_rmw = 0;
> -	int count = 0;
> +	u32 *cs;
>  
>  	/* Just pick a large BB size */
>  	bb = xe_bb_new(gt, xe_gt_lrc_size(gt, q->hwe->class), false);
>  	if (IS_ERR(bb))
>  		return PTR_ERR(bb);
>  
> +	cs = bb->cs;
> +
>  	/* count RMW registers as those will be handled separately */
>  	xa_for_each(&sr->xa, idx, entry) {
>  		if (entry->reg.masked || entry->clr_bits == ~0)
> @@ -209,7 +211,7 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
>  	if (count) {
>  		/* emit single LRI with all non RMW regs */
>  
> -		bb->cs[bb->len++] = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(count);
> +		*cs++ = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(count);
>  
>  		xa_for_each(&sr->xa, idx, entry) {
>  			struct xe_reg reg = entry->reg;
> @@ -224,8 +226,8 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
>  
>  			val |= entry->set_bits;
>  
> -			bb->cs[bb->len++] = reg.addr;
> -			bb->cs[bb->len++] = val;
> +			*cs++ = reg.addr;
> +			*cs++ = val;
>  			xe_gt_dbg(gt, "REG[0x%x] = 0x%08x", reg.addr, val);
>  		}
>  	}
> @@ -237,46 +239,49 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
>  			if (entry->reg.masked || entry->clr_bits == ~0)
>  				continue;
>  
> -			bb->cs[bb->len++] = MI_LOAD_REGISTER_REG | MI_LRR_DST_CS_MMIO;
> -			bb->cs[bb->len++] = entry->reg.addr;
> -			bb->cs[bb->len++] = CS_GPR_REG(0, 0).addr;
> +			*cs++ = MI_LOAD_REGISTER_REG | MI_LRR_DST_CS_MMIO;
> +			*cs++ = entry->reg.addr;
> +			*cs++ = CS_GPR_REG(0, 0).addr;
>  
> -			bb->cs[bb->len++] = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(2) |
> -					    MI_LRI_LRM_CS_MMIO;
> -			bb->cs[bb->len++] = CS_GPR_REG(0, 1).addr;
> -			bb->cs[bb->len++] = entry->clr_bits;
> -			bb->cs[bb->len++] = CS_GPR_REG(0, 2).addr;
> -			bb->cs[bb->len++] = entry->set_bits;
> +			*cs++ = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(2) |
> +				MI_LRI_LRM_CS_MMIO;
> +			*cs++ = CS_GPR_REG(0, 1).addr;
> +			*cs++ = entry->clr_bits;
> +			*cs++ = CS_GPR_REG(0, 2).addr;
> +			*cs++ = entry->set_bits;
>  
> -			bb->cs[bb->len++] = MI_MATH(8);
> -			bb->cs[bb->len++] = CS_ALU_INSTR_LOAD(SRCA, REG0);
> -			bb->cs[bb->len++] = CS_ALU_INSTR_LOADINV(SRCB, REG1);
> -			bb->cs[bb->len++] = CS_ALU_INSTR_AND;
> -			bb->cs[bb->len++] = CS_ALU_INSTR_STORE(REG0, ACCU);
> -			bb->cs[bb->len++] = CS_ALU_INSTR_LOAD(SRCA, REG0);
> -			bb->cs[bb->len++] = CS_ALU_INSTR_LOAD(SRCB, REG2);
> -			bb->cs[bb->len++] = CS_ALU_INSTR_OR;
> -			bb->cs[bb->len++] = CS_ALU_INSTR_STORE(REG0, ACCU);
> +			*cs++ = MI_MATH(8);
> +			*cs++ = CS_ALU_INSTR_LOAD(SRCA, REG0);
> +			*cs++ = CS_ALU_INSTR_LOADINV(SRCB, REG1);
> +			*cs++ = CS_ALU_INSTR_AND;
> +			*cs++ = CS_ALU_INSTR_STORE(REG0, ACCU);
> +			*cs++ = CS_ALU_INSTR_LOAD(SRCA, REG0);
> +			*cs++ = CS_ALU_INSTR_LOAD(SRCB, REG2);
> +			*cs++ = CS_ALU_INSTR_OR;
> +			*cs++ = CS_ALU_INSTR_STORE(REG0, ACCU);
>  
> -			bb->cs[bb->len++] = MI_LOAD_REGISTER_REG | MI_LRR_SRC_CS_MMIO;
> -			bb->cs[bb->len++] = CS_GPR_REG(0, 0).addr;
> -			bb->cs[bb->len++] = entry->reg.addr;
> +			*cs++ = MI_LOAD_REGISTER_REG | MI_LRR_SRC_CS_MMIO;
> +			*cs++ = CS_GPR_REG(0, 0).addr;
> +			*cs++ = entry->reg.addr;
>  
>  			xe_gt_dbg(gt, "REG[%#x] = ~%#x|%#x\n",
>  				  entry->reg.addr, entry->clr_bits, entry->set_bits);
>  		}
>  
>  		/* reset used GPR */
> -		bb->cs[bb->len++] = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(3) | MI_LRI_LRM_CS_MMIO;
> -		bb->cs[bb->len++] = CS_GPR_REG(0, 0).addr;
> -		bb->cs[bb->len++] = 0;
> -		bb->cs[bb->len++] = CS_GPR_REG(0, 1).addr;
> -		bb->cs[bb->len++] = 0;
> -		bb->cs[bb->len++] = CS_GPR_REG(0, 2).addr;
> -		bb->cs[bb->len++] = 0;
> +		*cs++ = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(3) |
> +			MI_LRI_LRM_CS_MMIO;
> +		*cs++ = CS_GPR_REG(0, 0).addr;
> +		*cs++ = 0;
> +		*cs++ = CS_GPR_REG(0, 1).addr;
> +		*cs++ = 0;
> +		*cs++ = CS_GPR_REG(0, 2).addr;
> +		*cs++ = 0;
>  	}
>  
> -	xe_lrc_emit_hwe_state_instructions(q, bb);
> +	cs = xe_lrc_emit_hwe_state_instructions(q, cs);
> +
> +	bb->len = cs - bb->cs;
>  
>  	job = xe_bb_create_job(q, bb);
>  	if (IS_ERR(job)) {
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 37598588a54f..8780ea1340d0 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -1775,7 +1775,7 @@ static const struct instr_state xe_hpg_svg_state[] = {
>  	{ .instr = CMD_3DSTATE_DRAWING_RECTANGLE, .num_dw = 4 },
>  };
>  
> -void xe_lrc_emit_hwe_state_instructions(struct xe_exec_queue *q, struct xe_bb *bb)
> +u32 *xe_lrc_emit_hwe_state_instructions(struct xe_exec_queue *q, u32 *cs)
>  {
>  	struct xe_gt *gt = q->hwe->gt;
>  	struct xe_device *xe = gt_to_xe(gt);
> @@ -1810,7 +1810,7 @@ void xe_lrc_emit_hwe_state_instructions(struct xe_exec_queue *q, struct xe_bb *b
>  	if (!state_table) {
>  		xe_gt_dbg(gt, "No non-register state to emit on graphics ver %d.%02d\n",
>  			  GRAPHICS_VER(xe), GRAPHICS_VERx100(xe) % 100);
> -		return;
> +		return cs;
>  	}
>  
>  	for (int i = 0; i < state_table_size; i++) {
> @@ -1833,12 +1833,14 @@ void xe_lrc_emit_hwe_state_instructions(struct xe_exec_queue *q, struct xe_bb *b
>  		    instr == CMD_3DSTATE_DRAWING_RECTANGLE)
>  			instr = CMD_3DSTATE_DRAWING_RECTANGLE_FAST;
>  
> -		bb->cs[bb->len] = instr;
> +		*cs = instr;
>  		if (!is_single_dw)
> -			bb->cs[bb->len] |= (num_dw - 2);
> +			*cs |= (num_dw - 2);
>  
> -		bb->len += num_dw;
> +		cs += num_dw;
>  	}
> +
> +	return cs;
>  }
>  
>  struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
> index eb6e8de8c939..b6c8053c581b 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.h
> +++ b/drivers/gpu/drm/xe/xe_lrc.h
> @@ -112,7 +112,7 @@ void xe_lrc_dump_default(struct drm_printer *p,
>  			 struct xe_gt *gt,
>  			 enum xe_engine_class);
>  
> -void xe_lrc_emit_hwe_state_instructions(struct xe_exec_queue *q, struct xe_bb *bb);
> +u32 *xe_lrc_emit_hwe_state_instructions(struct xe_exec_queue *q, u32 *cs);
>  
>  struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc);
>  void xe_lrc_snapshot_capture_delayed(struct xe_lrc_snapshot *snapshot);
> -- 
> 2.48.0
> 
