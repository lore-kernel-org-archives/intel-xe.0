Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0215DC5B572
	for <intel-xe@archiver.kernel.org>; Mon, 17 Aug 2026 16:39:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95C0210E42A;
	Mon, 17 Aug 2026 16:39:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e9hEKPrD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D727F10E7A8
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Aug 2026 16:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786984775; x=1818520775;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=OHUTMykjkTqiOFPj/WWIjX91Xydkwh5jtuMCqMuM7zo=;
 b=e9hEKPrDJrmnhmC/Z8gHLcSGHhfi/0nhd58+Ztf3YEXOJmslkvHJm1bs
 wm6yzt8jTgjjBXadmnrnk1Nd2iSD+jHxVS3u7+30YLexsojp6el+IqGhb
 eXNHb0NimEN1jGz9Law2Jstt2gdAIQVN2R0KBSpRxVtucp1LKLrCne/fo
 bYfSVn+lo0F04zJ/ozVOWpz/F0JexWKdNvkXbmPlzFjOOEG/veEnEN5nt
 gpgDENNqwMAVIzcvmvFmbadcHsVHmC7aPiTq5AEuuCPJiNonnuZNiH/HL
 1CXldypovm+9A8+oRcZn3JmaV5LaXPRzF0U2gjDMRwSq8aml3cQ5MBjG2 g==;
X-CSE-ConnectionGUID: 1kGYBdXVSlKtdu6NPokJsQ==
X-CSE-MsgGUID: DvbS2fMPSYKhSd5zwYbskA==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="98129287"
X-IronPort-AV: E=Sophos;i="6.25,229,1779174000"; d="scan'208";a="98129287"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 09:39:33 -0700
X-CSE-ConnectionGUID: HfmE8NERRlSVQF9Yl7bnyg==
X-CSE-MsgGUID: N5La5cWKRTWjMcJDTe2d8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,229,1779174000"; d="scan'208";a="268799359"
Received: from abityuts-desk.ger.corp.intel.com (HELO [10.245.245.131])
 ([10.245.245.131])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 09:39:32 -0700
Message-ID: <5ac2b122-bb4c-4c32-b7e3-c9f9c42a42b0@intel.com>
Date: Mon, 17 Aug 2026 17:39:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] drm/xe/xe_migrate: Align MEM_COPY pitch with
 destination address
To: Jan Maslak <jan.maslak@intel.com>, intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, Christoph Manszewski <christoph.manszewski@intel.com>
References: <20260622103449.3335928-1-jan.maslak@intel.com>
 <20260622103449.3335928-2-jan.maslak@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260622103449.3335928-2-jan.maslak@intel.com>
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
> MEM_COPY_CMD can corrupt memory when MATRIX_COPY mode uses a pitch that
> is not aligned to the destination address.
> 
> Fix this by incorporating the destination address into the pitch
> selection so the chosen pitch is aligned to both the copy length and the
> destination address.

Should we play it safe and apply this to the src addr also, even if it 
appears to work without? The spec doesn't explicitly state that the dst 
needed this special treatment, but if it does then I would think src 
would be the same?

> 
> Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
> Signed-off-by: Jan Maslak <jan.maslak@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_migrate.c | 29 +++++++++++++++++------------
>   1 file changed, 17 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 9428dd5e7760..9218eba31d45 100644
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
> @@ -2223,16 +2224,11 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
>   	struct xe_bb *bb;
>   	u32 update_idx, pt_slot = 0;
>   	unsigned long npages = DIV_ROUND_UP(len + sram_offset, PAGE_SIZE);
> -	unsigned int pitch = xe_migrate_copy_pitch(xe, len);
> +	unsigned int pitch;
>   	int err;
>   	unsigned long i, j;
>   	bool use_pde = xe_migrate_vram_use_pde(sram_addr, len + sram_offset);
>   
> -	if (!xe->info.has_mem_copy_instr &&
> -	    drm_WARN_ON(&xe->drm,
> -			(!IS_ALIGNED(len, pitch)) || (sram_offset | vram_addr) & XE_CACHELINE_MASK))
> -		return ERR_PTR(-EOPNOTSUPP);
> -
>   	xe_assert(xe, npages * PAGE_SIZE <= MAX_PREEMPTDISABLE_TRANSFER);
>   
>   	batch_size += pte_update_cmd_size(npages << PAGE_SHIFT);
> @@ -2284,6 +2280,13 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
>   			dst_L0_ofs = xe_migrate_vm_addr(pt_slot, 0) + sram_offset;
>   	}
>   
> +	pitch = xe_migrate_copy_pitch(xe, len, dst_L0_ofs);
> +	if (!xe->info.has_mem_copy_instr &&
> +	    drm_WARN_ON(&xe->drm,
> +			(!IS_ALIGNED(len, pitch)) ||
> +			(sram_offset | vram_addr) & XE_CACHELINE_MASK))
> +		return ERR_PTR(-EOPNOTSUPP);
> +
>   	bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
>   	update_idx = bb->len;
>   
> @@ -2536,7 +2539,9 @@ int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
>   		else
>   			current_bytes = min_t(int, bytes_left, cursor.size);
>   
> -		pitch = xe_migrate_copy_pitch(xe, current_bytes);
> +		pitch = xe_migrate_copy_pitch(xe, current_bytes,
> +					      write ? vram_addr :
> +					      (unsigned long)buf & ~PAGE_MASK);
>   		if (xe->info.has_mem_copy_instr)
>   			current_bytes = min_t(int, current_bytes, U16_MAX * pitch);
>   		else

