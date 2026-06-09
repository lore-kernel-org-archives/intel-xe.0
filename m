Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2DDACD8CA4
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jun 2026 09:33:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1BB910E1D6;
	Tue,  9 Jun 2026 09:33:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SngBXUnZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E2D710E1E8
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jun 2026 09:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780997590; x=1812533590;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=KR/PQ8KjJGVToeg7OySQ0Xvh//PlU1xRAWb6s/rCnWk=;
 b=SngBXUnZMeQlPNF7iqjId6wZbryqDFSsEzXRbtzUPnf13aqsIu3meU5s
 jWzL+bUoXnjyQKuUniNkPoEWP8HGzFnqI1zCPCdG38Xt+nRaJtvqA65aD
 QFg0D6Gcp1wjIfrxTE8QF8uy0vQjBaIaCCrKockI9jLs3rwevenDmXDOH
 ivypu/3xLxm7XbbnlrrXiHMpgkHxUPoWEwAH0dZo7HdYLyp1QcpW+JFIU
 oczan0HOv/568byUaF//Yvdaj59APZIyvSwqn59sC5bmYvq7WoiI1wkum
 k5z50WoqZmDhhyDGv/8/JI3MSO+RGFWNFDDjSDOISkcd+w71gE0/2cySj g==;
X-CSE-ConnectionGUID: tgd7eyU3TWK14e+LukwfeQ==
X-CSE-MsgGUID: 8Pmcl0apSTyaxa9LULQgjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="80884429"
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; d="scan'208";a="80884429"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 02:33:09 -0700
X-CSE-ConnectionGUID: ErqNFSU3Q9OuyjR8uK5fVg==
X-CSE-MsgGUID: oqCsNBL9RA+/DxDSgJFQGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; d="scan'208";a="250728830"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.245.92])
 ([10.245.245.92])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 02:33:08 -0700
Message-ID: <42a3a25a-80e4-43be-a953-2c8fce071090@intel.com>
Date: Tue, 9 Jun 2026 10:33:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/xe_migrate: Ensure that dst address is aligned
 with pitch
To: Jan Maslak <jan.maslak@intel.com>, intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, Christoph Manszewski <christoph.manszewski@intel.com>
References: <20260601152056.2413514-1-jan.maslak@intel.com>
 <20260601152056.2413514-2-jan.maslak@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260601152056.2413514-2-jan.maslak@intel.com>
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

Hi,

On 01/06/2026 16:20, Jan Maslak wrote:
> From: Christoph Manszewski <christoph.manszewski@intel.com>
> 
> MEM_COPY_CMD causes a memory corruption when setup in MATRIX_COPY mode
> with the pitch not aligned to the destination address.
> 
> Fix this by incorporating the destination address into the pitch
> calculation so that the resulting pitch is aligned not only to the copy
> length but also destination address.
> 
> Additionally, implement a 3-phase optimized copy strategy in
> xe_migrate_access_memory() to minimize the number of copy jobs when the
> destination is not well-aligned:

Should this be a separate change? Is this strictly needed for the 
fix/workaround?

> 
>    1. Linear copy (pitch=1) to advance the destination address so it
>       becomes aligned to the largest possible valid pitch.
>    2. Matrix copy using the largest pitch that the now-aligned dst
>       supports.
>    3. Linear copy for remaining bytes.
> 
> Also fix the current_page calculation in xe_migrate_access_memory() to
> account for page_offset, which was previously omitted.

Should this be a separate change/fix?

Ideally if we could maybe have something like:

1) Minimal fix/workaround for MATRIX + unaligned
2) Any other standalone fixes which can be split out
3) Optimisations on top

Would that be doable here? I think it will be easier to review, plus if 
something needs to be backported, if will be simpler.

> 
> Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
> Signed-off-by: Jan Maslak <jan.maslak@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_migrate.c | 165 +++++++++++++++++++++++++++++---
>   1 file changed, 150 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 9428dd5e7760..99c2cea7c895 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -2186,17 +2186,18 @@ static bool xe_migrate_vram_use_pde(struct drm_pagemap_addr *sram_addr,
>   #define XE_CACHELINE_BYTES	64ull
>   #define XE_CACHELINE_MASK	(XE_CACHELINE_BYTES - 1)
>   
> -static u32 xe_migrate_copy_pitch(struct xe_device *xe, u32 len)
> +static u32 xe_migrate_copy_pitch(struct xe_device *xe, u32 len, u64 dst_addr)
>   {
> +	u64 align_check = len | dst_addr;
>   	u32 pitch;
>   
> -	if (IS_ALIGNED(len, PAGE_SIZE))
> +	if (IS_ALIGNED(align_check, PAGE_SIZE))
>   		pitch = PAGE_SIZE;
> -	else if (IS_ALIGNED(len, SZ_4K))
> +	else if (IS_ALIGNED(align_check, SZ_4K))
>   		pitch = SZ_4K;
> -	else if (IS_ALIGNED(len, SZ_256))
> +	else if (IS_ALIGNED(align_check, SZ_256))
>   		pitch = SZ_256;
> -	else if (IS_ALIGNED(len, 4))
> +	else if (IS_ALIGNED(align_check, 4))
>   		pitch = 4;
>   	else
>   		pitch = 1;
> @@ -2205,6 +2206,86 @@ static u32 xe_migrate_copy_pitch(struct xe_device *xe, u32 len)
>   	return pitch;
>   }
>   
> +/**
> + * xe_migrate_dst_pitch() - Determine max pitch supported by dst alignment
> + * @dst_addr: Destination address (page offset)
> + *
> + * Returns the largest pitch (PAGE_SIZE, SZ_4K, SZ_256, or 4) that dst_addr
> + * supports based solely on its alignment. Returns 1 if not even 4-byte aligned.
> + */
> +static u32 xe_migrate_dst_pitch(u64 dst_addr)
> +{
> +	if (IS_ALIGNED(dst_addr, PAGE_SIZE))
> +		return PAGE_SIZE;
> +	if (IS_ALIGNED(dst_addr, SZ_4K))
> +		return SZ_4K;
> +	if (IS_ALIGNED(dst_addr, SZ_256))
> +		return SZ_256;
> +	if (IS_ALIGNED(dst_addr, 4))
> +		return 4;
> +	return 1;
> +}
> +
> +/**
> + * xe_migrate_best_alignment() - Find the best alignment reachable within max_bytes
> + * @dst_addr: Current destination address
> + * @max_bytes: Maximum bytes we can copy to reach alignment (typically U16_MAX)
> + *
> + * Returns the largest alignment (PAGE_SIZE, SZ_4K, SZ_256, or 4) that dst_addr
> + * can reach by copying at most max_bytes. Returns 0 if already at best alignment
> + * or if no useful alignment can be reached.
> + */
> +static u32 xe_migrate_best_alignment(u64 dst_addr, u32 max_bytes)
> +{
> +	u32 bytes_to_page = round_up(dst_addr, PAGE_SIZE) - dst_addr;
> +	u32 bytes_to_4k = round_up(dst_addr, SZ_4K) - dst_addr;
> +	u32 bytes_to_256 = round_up(dst_addr, SZ_256) - dst_addr;
> +	u32 bytes_to_4 = round_up(dst_addr, 4) - dst_addr;
> +
> +	if (bytes_to_page == 0)
> +		return 0;
> +
> +	if (bytes_to_page <= max_bytes)
> +		return PAGE_SIZE;
> +
> +	if (bytes_to_4k > 0 && bytes_to_4k <= max_bytes)
> +		return SZ_4K;
> +
> +	if (bytes_to_256 > 0 && bytes_to_256 <= max_bytes)
> +		return SZ_256;
> +
> +	if (bytes_to_4 > 0 && bytes_to_4 <= max_bytes)
> +		return 4;
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_migrate_bytes_to_align() - Calculate bytes needed to reach target alignment
> + * @dst_addr: Current destination address
> + * @alignment: Target alignment (PAGE_SIZE, SZ_4K, SZ_256, or 4)
> + *
> + * Returns: Number of bytes to copy to reach the target alignment.
> + */
> +static u32 xe_migrate_bytes_to_align(u64 dst_addr, u32 alignment)
> +{
> +	return round_up(dst_addr, alignment) - dst_addr;
> +}
> +
> +/**
> + * xe_migrate_aligned_copy_len() - Calculate the aligned copy length for matrix copy
> + * @len: Remaining bytes
> + * @pitch: The pitch to use for matrix copy
> + *
> + * Returns: Length rounded down to pitch, or 0 if less than pitch.
> + */
> +static u32 xe_migrate_aligned_copy_len(u32 len, u32 pitch)
> +{
> +	if (len < pitch)
> +		return 0;
> +	return round_down(len, pitch);
> +}
> +
>   static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
>   					 unsigned long len,
>   					 unsigned long sram_offset,
> @@ -2223,14 +2304,14 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
>   	struct xe_bb *bb;
>   	u32 update_idx, pt_slot = 0;
>   	unsigned long npages = DIV_ROUND_UP(len + sram_offset, PAGE_SIZE);
> -	unsigned int pitch = xe_migrate_copy_pitch(xe, len);
> +	unsigned int pitch;
>   	int err;
>   	unsigned long i, j;
>   	bool use_pde = xe_migrate_vram_use_pde(sram_addr, len + sram_offset);
>   
>   	if (!xe->info.has_mem_copy_instr &&
>   	    drm_WARN_ON(&xe->drm,
> -			(!IS_ALIGNED(len, pitch)) || (sram_offset | vram_addr) & XE_CACHELINE_MASK))
> +			(sram_offset | vram_addr) & XE_CACHELINE_MASK))
>   		return ERR_PTR(-EOPNOTSUPP);
>   
>   	xe_assert(xe, npages * PAGE_SIZE <= MAX_PREEMPTDISABLE_TRANSFER);
> @@ -2284,6 +2365,8 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
>   			dst_L0_ofs = xe_migrate_vm_addr(pt_slot, 0) + sram_offset;
>   	}
>   
> +	pitch = xe_migrate_copy_pitch(xe, len, dst_L0_ofs);
> +
>   	bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
>   	update_idx = bb->len;
>   
> @@ -2536,13 +2619,65 @@ int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
>   		else
>   			current_bytes = min_t(int, bytes_left, cursor.size);
>   
> -		pitch = xe_migrate_copy_pitch(xe, current_bytes);
> -		if (xe->info.has_mem_copy_instr)
> -			current_bytes = min_t(int, current_bytes, U16_MAX * pitch);
> -		else
> -			current_bytes = min_t(int, current_bytes,
> -					      round_down(S16_MAX * pitch,
> -							 XE_CACHELINE_BYTES));
> +		{
> +			/*
> +			 * Optimized copy strategy to minimize number of jobs:
> +			 * 1. Linear copy to align dst to best reachable alignment
> +			 * 2. Matrix copy for bulk data copy
> +			 * 3. Single linear copy for remaining bytes
> +			 */
> +			u64 dst_addr = write ? vram_addr :
> +					       (unsigned long)buf & ~PAGE_MASK;
> +			u32 max_linear = xe->info.has_mem_copy_instr ? U16_MAX :
> +					 round_down(S16_MAX, XE_CACHELINE_BYTES);
> +			u32 best_align = xe_migrate_best_alignment(dst_addr, max_linear);
> +			u32 bytes_to_align = best_align ?
> +					     xe_migrate_bytes_to_align(dst_addr, best_align) : 0;
> +
> +			if (bytes_to_align > 0 && bytes_to_align <= (u32)current_bytes) {
> +				/*
> +				 * Phase 1: Linear copy to reach best alignment.
> +				 * Copy just enough bytes to align dst_addr.
> +				 */
> +				pitch = 1;
> +				current_bytes = min_t(int, bytes_to_align, max_linear);
> +			} else if (IS_ALIGNED(dst_addr, 4)) {
> +				/*
> +				 * Phase 2: Matrix copy for aligned bulk data.
> +				 * Use the best pitch that dst alignment supports,
> +				 * then round down len to that pitch.
> +				 */
> +				u32 dst_pitch = xe_migrate_dst_pitch(dst_addr);
> +				u32 aligned_len = xe_migrate_aligned_copy_len(current_bytes,
> +									      dst_pitch);
> +
> +				if (aligned_len >= dst_pitch) {
> +					pitch = dst_pitch;
> +					if (xe->info.has_mem_copy_instr) {
> +						current_bytes = min_t(int, aligned_len,
> +								      U16_MAX * pitch);
> +					} else {
> +						current_bytes = min_t(int, aligned_len,
> +								      round_down(S16_MAX * pitch,
> +										 XE_CACHELINE_BYTES));
> +					}
> +				} else {
> +					/*
> +					 * Phase 3: Linear copy for remainder.
> +					 * Not enough for matrix copy - do single linear copy.
> +					 */
> +					pitch = 1;
> +					current_bytes = min_t(int, current_bytes, max_linear);
> +				}
> +			} else {
> +				/*
> +				 * Phase 3: Linear copy for remainder.
> +				 * dst not 4-aligned and can't reach alignment - linear copy.
> +				 */
> +				pitch = 1;
> +				current_bytes = min_t(int, current_bytes, max_linear);
> +			}
> +		}
>   
>   		__fence = xe_migrate_vram(m, current_bytes,
>   					  (unsigned long)buf & ~PAGE_MASK,
> @@ -2564,7 +2699,7 @@ int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
>   
>   		buf += current_bytes;
>   		offset += current_bytes;
> -		current_page = (int)(buf - orig_buf) / PAGE_SIZE;
> +		current_page = (int)(buf - orig_buf + page_offset) / PAGE_SIZE;
>   		bytes_left -= current_bytes;
>   		if (bytes_left)
>   			xe_res_next(&cursor, current_bytes);

