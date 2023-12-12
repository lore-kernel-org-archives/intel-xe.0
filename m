Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4572C4332F
	for <intel-xe@archiver.kernel.org>; Tue, 12 Dec 2023 12:27:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C20610E5C5;
	Tue, 12 Dec 2023 12:27:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 567C510E5C5
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Dec 2023 12:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702384055; x=1733920055;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=r1O5nkmrvgyP6pgsZZaqI2XU+1k3EFnT/5QQ00o3Fj4=;
 b=AZCldH4eBPW1+3AQ/eq+M2bwrrQU4g92za71Jl9ahpU+kfOBI2lmIZ+E
 a00NgozU86zY2xVCvo55ouoLJm1dcHj4GrgpnwdUlXEeXyzMdatY25ugT
 pm+G1qtRqKJj7doXi1Zm1cDKZ6xa0j9eoe+5GaONoGxdFU2m8B2eZbw1U
 IK+pXLx66ZrcdtWNn1r8byA4xSrdZwr3IKhh8CXpFIEuuY3POAKHfR3eg
 a3we27MPhiexiYaxsZVZpQ09IpgReG1m/Pq15V4dPMKarLefSgXOMqBiy
 bvHKbDRXovXCILui6fDPbCn/EHa1G5hmsbzBPA/C89gS5LCX7xYI/nHlo Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="8167201"
X-IronPort-AV: E=Sophos;i="6.04,270,1695711600"; 
   d="scan'208";a="8167201"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2023 04:27:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="807744782"
X-IronPort-AV: E=Sophos;i="6.04,270,1695711600"; d="scan'208";a="807744782"
Received: from skallurr-mobl1.ger.corp.intel.com (HELO [10.249.254.140])
 ([10.249.254.140])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2023 04:27:33 -0800
Message-ID: <b8197de8-3b6a-053c-2a5e-629ef518c056@linux.intel.com>
Date: Tue, 12 Dec 2023 13:27:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v7 06/10] drm/xe/xe2: Update chunk size for each iteration
 of ccs copy
Content-Language: en-US
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20231211134356.1645973-1-himal.prasad.ghimiray@intel.com>
 <20231211134356.1645973-7-himal.prasad.ghimiray@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20231211134356.1645973-7-himal.prasad.ghimiray@intel.com>
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
Cc: Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 12/11/23 14:43, Himal Prasad Ghimiray wrote:
> In xe2 platform XY_CTRL_SURF_COPY_BLT can handle ccs copy for
> max of 1024 main surface pages.
>
> v2:
>   - Use better logic to determine chunk size (Matt/Thomas)
>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_migrate.c | 33 ++++++++++++++++++++++-----------
>   1 file changed, 22 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 1016e2591737..9698986eab06 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -65,9 +65,15 @@ struct xe_migrate {
>   };
>   
>   #define MAX_PREEMPTDISABLE_TRANSFER SZ_8M /* Around 1ms. */
> +#define MAX_CCS_LIMITED_TRANSFER SZ_4M /* XE_PAGE_SIZE * (FIELD_MAX(XE2_CCS_SIZE_MASK) + 1) */
> +
> +#define MAX_MEM_TRANSFER_PER_PASS(_xe) ((!IS_DGFX(_xe) && GRAPHICS_VER(_xe) >= 20 && \
> +					 xe_device_has_flat_ccs(_xe)) ? \
> +					 MAX_CCS_LIMITED_TRANSFER : MAX_PREEMPTDISABLE_TRANSFER)
Nit: perhaps open-code instead of macro:

max_mem_transfer_per_pass = ...

Either way

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


>   #define NUM_KERNEL_PDE 17
>   #define NUM_PT_SLOTS 32
> -#define NUM_PT_PER_BLIT (MAX_PREEMPTDISABLE_TRANSFER / SZ_2M)
> +#define LEVEL0_PAGE_TABLE_ENCODE_SIZE SZ_2M
> +#define NUM_PT_PER_BLIT(_xe) (MAX_MEM_TRANSFER_PER_PASS(_xe) / LEVEL0_PAGE_TABLE_ENCODE_SIZE)
>   
>   /**
>    * xe_tile_migrate_engine() - Get this tile's migrate engine.
> @@ -366,14 +372,14 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
>   	return m;
>   }
>   
> -static u64 xe_migrate_res_sizes(struct xe_res_cursor *cur)
> +static u64 xe_migrate_res_sizes(struct xe_device *xe, struct xe_res_cursor *cur)
>   {
>   	/*
>   	 * For VRAM we use identity mapped pages so we are limited to current
>   	 * cursor size. For system we program the pages ourselves so we have no
>   	 * such limitation.
>   	 */
> -	return min_t(u64, MAX_PREEMPTDISABLE_TRANSFER,
> +	return min_t(u64, MAX_MEM_TRANSFER_PER_PASS(xe),
>   		     mem_type_is_vram(cur->mem_type) ? cur->size :
>   		     cur->remaining);
>   }
> @@ -672,10 +678,12 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>   		u32 update_idx;
>   		u64 ccs_ofs, ccs_size;
>   		u32 ccs_pt;
> +
>   		bool usm = xe->info.has_usm;
> +		u32 avail_pts = NUM_PT_PER_BLIT(xe);
>   
> -		src_L0 = xe_migrate_res_sizes(&src_it);
> -		dst_L0 = xe_migrate_res_sizes(&dst_it);
> +		src_L0 = xe_migrate_res_sizes(xe, &src_it);
> +		dst_L0 = xe_migrate_res_sizes(xe, &dst_it);
>   
>   		drm_dbg(&xe->drm, "Pass %u, sizes: %llu & %llu\n",
>   			pass++, src_L0, dst_L0);
> @@ -684,18 +692,18 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>   
>   		batch_size += pte_update_size(m, src_is_vram, src, &src_it, &src_L0,
>   					      &src_L0_ofs, &src_L0_pt, 0, 0,
> -					      NUM_PT_PER_BLIT);
> +					      avail_pts);
>   
>   		batch_size += pte_update_size(m, dst_is_vram, dst, &dst_it, &src_L0,
>   					      &dst_L0_ofs, &dst_L0_pt, 0,
> -					      NUM_PT_PER_BLIT, NUM_PT_PER_BLIT);
> +					      avail_pts, avail_pts);
>   
>   		if (copy_system_ccs) {
>   			ccs_size = xe_device_ccs_bytes(xe, src_L0);
>   			batch_size += pte_update_size(m, false, NULL, &ccs_it, &ccs_size,
>   						      &ccs_ofs, &ccs_pt, 0,
> -						      2 * NUM_PT_PER_BLIT,
> -						      NUM_PT_PER_BLIT);
> +						      2 * avail_pts,
> +						      avail_pts);
>   		}
>   
>   		/* Add copy commands size here */
> @@ -922,9 +930,12 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>   		struct xe_sched_job *job;
>   		struct xe_bb *bb;
>   		u32 batch_size, update_idx;
> +
>   		bool usm = xe->info.has_usm;
> +		u32 avail_pts = NUM_PT_PER_BLIT(xe);
> +
> +		clear_L0 = xe_migrate_res_sizes(xe, &src_it);
>   
> -		clear_L0 = xe_migrate_res_sizes(&src_it);
>   		drm_dbg(&xe->drm, "Pass %u, size: %llu\n", pass++, clear_L0);
>   
>   		/* Calculate final sizes and batch size.. */
> @@ -932,7 +943,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>   			pte_update_size(m, clear_vram, src, &src_it,
>   					&clear_L0, &clear_L0_ofs, &clear_L0_pt,
>   					emit_clear_cmd_len(gt), 0,
> -					NUM_PT_PER_BLIT);
> +					avail_pts);
>   		if (xe_device_has_flat_ccs(xe) && clear_vram)
>   			batch_size += EMIT_COPY_CCS_DW;
>   
