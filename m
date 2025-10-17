Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51678CCD195
	for <intel-xe@archiver.kernel.org>; Fri, 17 Oct 2025 18:11:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1523410ECB9;
	Fri, 17 Oct 2025 18:11:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kjkOfkg1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59A5A10ECB9
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Oct 2025 18:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760724704; x=1792260704;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=U+ywek7lm8U5gJG1IfnenrZEeVhcPBJoMZ+Lx6diCKg=;
 b=kjkOfkg1wqlLA3kgwIOG7R1WAleQ17hEwKRZPYwuU8RKNx1EsZwnl/yc
 UKgFEMc53rDVWKVQgZUQL5I/TEgQ6jms7pNtfBxqtnIX34t7BM/DVJMs2
 PvWb28GJJrQME9F7tjMO/de60Zswe2Vowja1e0XclcYXzfRzpgS40RM06
 2VIc5YL6ZwDQRsrJ6+kE+J3WkaFaYA860VHqG0FnNw99kYyhrWgYUqA0G
 o08WwwjiMe3nIu3RglfaTP8UOt/PNMoIOFG1BGKwr3CN63vSPS3QQ7Cvd
 XG9gTmebrQ38/ZFQthJXdDF/TDGPVOc27ZabMqfUvaTjOUZrgHO3K0VVu g==;
X-CSE-ConnectionGUID: NRqyeuJmQRO+ZWE+LDKyiA==
X-CSE-MsgGUID: NMtXY8hURYKZxAji7VVBWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62848867"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="62848867"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 11:11:43 -0700
X-CSE-ConnectionGUID: qzW+n3maSi6hbVFdHU3+tA==
X-CSE-MsgGUID: rKuWWP/DQXi4NAtYFa8IaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,237,1754982000"; d="scan'208";a="182741231"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.129])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 11:11:41 -0700
Date: Fri, 17 Oct 2025 21:11:37 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: intel-xe@lists.freedesktop.org,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH v7 1/3] drm/xe/migrate: Atomicize CCS copy command setup
Message-ID: <aPKG2Z1JsuFb97cN@intel.com>
References: <20251017141226.924-5-satyanarayana.k.v.p@intel.com>
 <20251017141226.924-6-satyanarayana.k.v.p@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251017141226.924-6-satyanarayana.k.v.p@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Fri, Oct 17, 2025 at 07:42:28PM +0530, Satyanarayana K V P wrote:
> The CCS copy command is a 5-dword sequence. If the vCPU halts during
> save/restore while this sequence is being programmed, partial writes may
> trigger page faults when saving IGPU CCS metadata. Use the VMOVDQU
> instruction to write the sequence atomically.
> 
> Since VMOVDQU operates on 256-bit chunks, update EMIT_COPY_CCS_DW to emit
> 8 dwords instead of 5 dwords.
> 
> Update emit_flush_invalidate() to use VMOVDQU operating with 128-bit
> chunks.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> 
> ---
> V6 -> V7:
> - Added description explaining why to use assembly instructions for
> atomicity.
> - Assert if DGFX tries to use memcpy_vmovdqu(). (Rodrigo)
> - Include <asm/cpufeature.h> though checkpatch complains. With
> <linux/cpufeature.h> KUnit is throwing errors.
> 
> V5 -> V6:
> - Fixed review comments (Rodrigo)
> 
> V4 -> V5:
> - Fixed review comments. (Matt B)
> 
> V3 -> V4:
> - Fixed review comments. (Wajdeczko)
> - Fix issues reported by patchworks.
> 
> V2 -> V3:
> - Added support for 128 bit and 256 bit instructions with memcpy_vmovdqu
> - Updated emit_flush_invalidate() to use vmovdqu instruction.
> 
> V1 -> V2:
> - Use memcpy_vmovdqu only for x86 arch and for VF. Else use memcpy
>   (Auld, Matthew)
>   - Fix issues reported by patchworks.
> ---
>  drivers/gpu/drm/xe/xe_migrate.c | 112 ++++++++++++++++++++++++++------
>  1 file changed, 91 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 3112c966c67d..e0be7396a0ab 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -5,6 +5,8 @@
>  
>  #include "xe_migrate.h"
>  
> +#include <asm/fpu/api.h>
> +#include <asm/cpufeature.h>
>  #include <linux/bitfield.h>
>  #include <linux/sizes.h>
>  
> @@ -33,6 +35,7 @@
>  #include "xe_res_cursor.h"
>  #include "xe_sa.h"
>  #include "xe_sched_job.h"
> +#include "xe_sriov_vf_ccs.h"
>  #include "xe_sync.h"
>  #include "xe_trace_bo.h"
>  #include "xe_validation.h"
> @@ -657,18 +660,68 @@ static void emit_pte(struct xe_migrate *m,
>  	}
>  }
>  
> -#define EMIT_COPY_CCS_DW 5
> +/*
> + * VF KMD registers two specialized LRCs with the GuC to handle save/restore
> + * operations for CCS metadata on IGPU. The GuC executes these LRCAs during
> + * VF state/restore operations.
> + *
> + * Each LRC contains a batch buffer pool that GuC submits to hardware during
> + * VF state save/restore operations. Since these operations can occur
> + * asynchronously at any time, we must ensure GPU instructions in the batch
> + * buffer are written atomically to prevent corruption from incomplete writes.
> + *
> + * To guarantee atomic instruction writes, we use x86 SIMD instructions
> + * (128-bit XMM and 256-bit YMM) within kernel_fpu_begin()/kernel_fpu_end()
> + * sections. This prevents vCPU preemption during instruction generation,
> + * ensuring complete GPU commands are written to the batch buffer.
> + */
> +
> +static void memcpy_vmovdqu(struct xe_device *xe, void *dst, const void *src, u32 size)
> +{
> +	xe_assert(xe, !IS_DGFX(xe));
> +#ifdef CONFIG_X86
> +	kernel_fpu_begin();
> +	if (size == SZ_128) {
> +		asm("vmovdqu (%0), %%xmm0\n"
> +		    "vmovups %%xmm0,   (%1)\n"
> +		    :: "r" (src), "r" (dst) : "memory");

AFAICS atomicity guarantee is only given for the aligned variants.

> +	} else if (size == SZ_256) {
> +		asm("vmovdqu (%0), %%ymm0\n"
> +		    "vmovups %%ymm0,   (%1)\n"
> +		    :: "r" (src), "r" (dst) : "memory");

There is no 32B atomicity guarantee listed in the docs.

The only bigger guaranteed atomic thing I can see is
MOVDIR64B but dunno what subset of CPUs have that.

> +	}
> +	kernel_fpu_end();
> +#endif
> +}
> +
> +static void emit_atomic(struct xe_gt *gt, void *dst, const void *src, u32 size)
> +{
> +	u32 instr_size = size * BITS_PER_BYTE;
> +
> +	xe_gt_assert(gt, instr_size == SZ_128 || instr_size == SZ_256);
> +
> +	if (IS_VF_CCS_READY(gt_to_xe(gt))) {
> +		xe_gt_assert(gt, static_cpu_has(X86_FEATURE_AVX));
> +		memcpy_vmovdqu(gt_to_xe(gt), dst, src, instr_size);
> +	} else {
> +		memcpy(dst, src, size);
> +	}
> +}
> +
> +#define EMIT_COPY_CCS_DW 8
>  static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
>  			  u64 dst_ofs, bool dst_is_indirect,
>  			  u64 src_ofs, bool src_is_indirect,
>  			  u32 size)
>  {
> +	u32 dw[EMIT_COPY_CCS_DW] = {MI_NOOP};
>  	struct xe_device *xe = gt_to_xe(gt);
>  	u32 *cs = bb->cs + bb->len;
>  	u32 num_ccs_blks;
>  	u32 num_pages;
>  	u32 ccs_copy_size;
>  	u32 mocs;
> +	u32 i = 0;
>  
>  	if (GRAPHICS_VERx100(xe) >= 2000) {
>  		num_pages = DIV_ROUND_UP(size, XE_PAGE_SIZE);
> @@ -686,15 +739,23 @@ static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
>  		mocs = FIELD_PREP(XY_CTRL_SURF_MOCS_MASK, gt->mocs.uc_index);
>  	}
>  
> -	*cs++ = XY_CTRL_SURF_COPY_BLT |
> -		(src_is_indirect ? 0x0 : 0x1) << SRC_ACCESS_TYPE_SHIFT |
> -		(dst_is_indirect ? 0x0 : 0x1) << DST_ACCESS_TYPE_SHIFT |
> -		ccs_copy_size;
> -	*cs++ = lower_32_bits(src_ofs);
> -	*cs++ = upper_32_bits(src_ofs) | mocs;
> -	*cs++ = lower_32_bits(dst_ofs);
> -	*cs++ = upper_32_bits(dst_ofs) | mocs;
> +	dw[i++] = XY_CTRL_SURF_COPY_BLT |
> +		  (src_is_indirect ? 0x0 : 0x1) << SRC_ACCESS_TYPE_SHIFT |
> +		  (dst_is_indirect ? 0x0 : 0x1) << DST_ACCESS_TYPE_SHIFT |
> +		  ccs_copy_size;
> +	dw[i++] = lower_32_bits(src_ofs);
> +	dw[i++] = upper_32_bits(src_ofs) | mocs;
> +	dw[i++] = lower_32_bits(dst_ofs);
> +	dw[i++] = upper_32_bits(dst_ofs) | mocs;
>  
> +	/*
> +	 * The CCS copy command is a 5-dword sequence. If the vCPU halts during
> +	 * save/restore while this sequence is being issued, partial writes may trigger
> +	 * page faults when saving iGPU CCS metadata. Use the VMOVDQU instruction to
> +	 * write the sequence atomically.
> +	 */
> +	emit_atomic(gt, cs, dw, sizeof(dw));
> +	cs += EMIT_COPY_CCS_DW;
>  	bb->len = cs - bb->cs;
>  }
>  
> @@ -1006,18 +1067,27 @@ static u64 migrate_vm_ppgtt_addr_tlb_inval(void)
>  	return (NUM_KERNEL_PDE - 2) * XE_PAGE_SIZE;
>  }
>  
> -static int emit_flush_invalidate(u32 *dw, int i, u32 flags)
> +/*
> + * The MI_FLUSH_DW command is a 4-dword sequence. If the vCPU halts during
> + * save/restore while this sequence is being issued, partial writes may
> + * trigger page faults when saving iGPU CCS metadata. Use
> + * emit_atomic() to write the sequence atomically.
> + */
> +#define EMIT_FLUSH_INVALIDATE_DW 4
> +static int emit_flush_invalidate(struct xe_exec_queue *q, u32 *cs, int i, u32 flags)
>  {
>  	u64 addr = migrate_vm_ppgtt_addr_tlb_inval();
> +	u32 dw[EMIT_FLUSH_INVALIDATE_DW] = {MI_NOOP}, j = 0;
> +
> +	dw[j++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
> +		      MI_FLUSH_IMM_DW | flags;
> +	dw[j++] = lower_32_bits(addr);
> +	dw[j++] = upper_32_bits(addr);
> +	dw[j++] = MI_NOOP;
>  
> -	dw[i++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
> -		  MI_FLUSH_IMM_DW | flags;
> -	dw[i++] = lower_32_bits(addr);
> -	dw[i++] = upper_32_bits(addr);
> -	dw[i++] = MI_NOOP;
> -	dw[i++] = MI_NOOP;
> +	emit_atomic(q->gt, &cs[i], dw, sizeof(dw));
>  
> -	return i;
> +	return i + j;
>  }
>  
>  /**
> @@ -1062,7 +1132,7 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>  	/* Calculate Batch buffer size */
>  	batch_size = 0;
>  	while (size) {
> -		batch_size += 10; /* Flush + ggtt addr + 2 NOP */
> +		batch_size += EMIT_FLUSH_INVALIDATE_DW * 2; /* Flush + ggtt addr + 1 NOP */
>  		u64 ccs_ofs, ccs_size;
>  		u32 ccs_pt;
>  
> @@ -1103,7 +1173,7 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>  	 * sizes here again before copy command is emitted.
>  	 */
>  	while (size) {
> -		batch_size += 10; /* Flush + ggtt addr + 2 NOP */
> +		batch_size += EMIT_FLUSH_INVALIDATE_DW * 2; /* Flush + ggtt addr + 1 NOP */
>  		u32 flush_flags = 0;
>  		u64 ccs_ofs, ccs_size;
>  		u32 ccs_pt;
> @@ -1126,11 +1196,11 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>  
>  		emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, src);
>  
> -		bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
> +		bb->len = emit_flush_invalidate(q, bb->cs, bb->len, flush_flags);
>  		flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs, src_is_pltt,
>  						  src_L0_ofs, dst_is_pltt,
>  						  src_L0, ccs_ofs, true);
> -		bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
> +		bb->len = emit_flush_invalidate(q, bb->cs, bb->len, flush_flags);
>  
>  		size -= src_L0;
>  	}
> -- 
> 2.51.0

-- 
Ville Syrjälä
Intel
