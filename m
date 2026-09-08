Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4A21C79FA1
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 10:39:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83CD210E4D7;
	Tue,  8 Sep 2026 10:39:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uika32ul";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 340F610E4D7
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Sep 2026 10:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788863971; x=1820399971;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Zqi08DwsmIRjvN4gM/yavedVOavCu6ZauuoTR5jnshE=;
 b=Uika32ulXjeFaIc+JUNe0l+2Uqr3AyifzpLmGkoJ6h42vSIeGNpPxaJ1
 Ii4sDihdhPh6InwkpEEuKoo3HB5d89p8QtIEVzacYJh2uS0UMrXHHv3Kc
 gKdm1dSrssgY9BArV+dfsL1Y1+uwoK8P+N7glkkD72GBK+jyRKugbue3a
 RX0s6f8ZPtOfUAyxESWd7junbv1XUGXHqgD2uVrpn66WxqnPokQCPeGZJ
 6t+LHelDXlY+vkrtPHkls8b5m9351f+e3To/qAAXxfuAiG0+Mcj7sM7AL
 hxqetxoOCwfmt/FAOlcIicDf6oJ8x1+axMgN96+4j2/cwL7/s4SPMhU6c Q==;
X-CSE-ConnectionGUID: yHoN06X/QCWsFFgnZUFoKw==
X-CSE-MsgGUID: mXBmqRL5Tb2ERq5vIOKhnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="76822315"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="76822315"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 03:39:31 -0700
X-CSE-ConnectionGUID: 8iOItb4PTByZlY2WME94lQ==
X-CSE-MsgGUID: dsgdQuzGRI+zImpi77RuzA==
X-ExtLoop1: 1
Received: from rvuia-mobl.ger.corp.intel.com (HELO [10.245.244.158])
 ([10.245.244.158])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 03:39:29 -0700
Message-ID: <813e04b7-78c5-462c-9c46-d25ad13b9ae6@intel.com>
Date: Tue, 8 Sep 2026 11:39:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] drm/xe/xe_migrate: Optimize unaligned
 access_memory copies
To: Jan Maslak <jan.maslak@intel.com>, intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, Christoph Manszewski <christoph.manszewski@intel.com>
References: <20260622103449.3335928-1-jan.maslak@intel.com>
 <20260622103449.3335928-4-jan.maslak@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260622103449.3335928-4-jan.maslak@intel.com>
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

On 22/06/2026 11:34, Jan Maslak wrote:
> From: Christoph Manszewski <christoph.manszewski@intel.com>
> 
> When xe_migrate_access_memory() falls back to a smaller pitch for an
> unaligned destination, the copy can end up running linearly for the
> entire transfer.
> 
> Reduce the number of copy jobs by first using a short linear copy to
> reach a better destination alignment, then using the largest matrix copy
> pitch that alignment supports, and finally using a linear copy for any
> remaining tail bytes.
> 
> Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
> Signed-off-by: Jan Maslak <jan.maslak@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_migrate.c | 148 ++++++++++++++++++++++++++++++--
>   1 file changed, 139 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 135d59f6e100..f5aa4a0dd6c4 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -2206,6 +2206,86 @@ static u32 xe_migrate_copy_pitch(struct xe_device *xe, u32 len, u64 dst_addr)
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

I guess we could use the xe_migrate_bytes_to_align() helper here?

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
> @@ -2539,15 +2619,65 @@ int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
>   		else
>   			current_bytes = min_t(int, bytes_left, cursor.size);
>   
> -		pitch = xe_migrate_copy_pitch(xe, current_bytes,
> -					      write ? vram_addr :
> -					      (unsigned long)buf & ~PAGE_MASK);
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

Could maybe add a note here, that for platforms without 
has_mem_copy_instr, this just falls through to fast_copy without the 
different phases?

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

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
> +								      dst_pitch);
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

