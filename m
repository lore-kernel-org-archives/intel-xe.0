Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82F13C4167B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 12:45:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D09010E1BA;
	Thu,  7 Dec 2023 12:45:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C4F810E893
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 12:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701953122; x=1733489122;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=d3vWIZLcw+IfZ9jeodbEfNtnYoZ7AQwFgAGtcXsWqiw=;
 b=GjwDTZe/MxZQ3ZA2LFSaMXnTQjMQHXEcv8bPevYQV/W7BIGbvLAH6RwO
 hm5yExuBpsr/UY+9KY0ysTMnWjVeTdBdwZI68P5Pi2hy//WQ/r1jwOd0B
 QBfL0J1T3QefvESyfPe3tEeTLCqEwzpyE0uXcMiMZjKBYergtFNOZbkKU
 d29szzjlF3mFVqGDC7Oo6sCHI4yBGegUiYu7NjVMMqnMI+wEANJgo3hkk
 w93lfl9ZANnyIVhCZXdwdOQrkSSID2mkRuyglnGTHc54lrwfVGdLLqkpv
 hSMewu/aCwWhZq6UD2DoAU2XxPVqXzaj+3MGI++c1W45MKJH/Qw+vpxYf g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="1050569"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="1050569"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 04:44:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="19691110"
Received: from jpoulsen-mobl.ger.corp.intel.com (HELO [10.249.254.234])
 ([10.249.254.234])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 04:44:52 -0800
Message-ID: <64600d5a-09e8-e73f-40e7-8ed4486971d2@linux.intel.com>
Date: Thu, 7 Dec 2023 13:44:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v6 5/9] drm/xe/xe2: Update chunk size for each iteration
 of ccs copy
Content-Language: en-US
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20231207091922.1224800-1-himal.prasad.ghimiray@intel.com>
 <20231207091922.1224800-6-himal.prasad.ghimiray@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20231207091922.1224800-6-himal.prasad.ghimiray@intel.com>
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

Hi, Himal,

On 12/7/23 10:19, Himal Prasad Ghimiray wrote:
> In xe2 platform XY_CTRL_SURF_COPY_BLT can handle ccs copy for
> max of 1024 main surface pages.
>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_migrate.c | 34 ++++++++++++++++++++++++++++-----
>   1 file changed, 29 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index b4dd1b6d78f0..98dca906a023 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -672,11 +672,24 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>   		u32 update_idx;
>   		u64 ccs_ofs, ccs_size;
>   		u32 ccs_pt;
> +
>   		bool usm = xe->info.supports_usm;
> +		u32 avail_pts = NUM_PT_PER_BLIT;
>   
>   		src_L0 = xe_migrate_res_sizes(&src_it);
>   		dst_L0 = xe_migrate_res_sizes(&dst_it);
>   
> +		/* In IGFX the XY_CTRL_SURF_COPY_BLT can handle max of 1024
> +		 * pages. Hence limit the processing size to SZ_4M per
> +		 * iteration.
> +		 */
> +		if (!IS_DGFX(xe) && GRAPHICS_VER(xe) >= 20) {
> +			src_L0 = min_t(u64, src_L0, SZ_4M);
> +			dst_L0 = min_t(u64, dst_L0, SZ_4M);
> +
> +			avail_pts = SZ_4M / SZ_2M;
> +		}

Can we limit the size inside xe_migrate_res_sizes() instead?

if (!is_vram)
     if (assume_compressed)
             size = min(size, NUM_COMPRESSED_PAGES_PER_CHUNK);


> +
>   		drm_dbg(&xe->drm, "Pass %u, sizes: %llu & %llu\n",
>   			pass++, src_L0, dst_L0);
>   
> @@ -684,18 +697,18 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
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
> @@ -923,8 +936,19 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>   		struct xe_bb *bb;
>   		u32 batch_size, update_idx;
>   		bool usm = xe->info.supports_usm;
> +		u32 avail_pts = NUM_PT_PER_BLIT;
>   
>   		clear_L0 = xe_migrate_res_sizes(&src_it);
> +
> +		/* In IGFX the XY_CTRL_SURF_COPY_BLT can handle max of 1024
> +		 * pages. Hence limit the processing size to SZ_4M per
> +		 * iteration.
> +		 */
> +		if (!IS_DGFX(xe) && GRAPHICS_VER(xe) >= 20) {
> +			clear_L0 = min_t(u64, clear_L0, SZ_4M);
> +			avail_pts = SZ_4M / SZ_2M;
> +		}
> +
>   		drm_dbg(&xe->drm, "Pass %u, size: %llu\n", pass++, clear_L0);
>   
>   		/* Calculate final sizes and batch size.. */
> @@ -932,7 +956,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>   			pte_update_size(m, clear_vram, src, &src_it,
>   					&clear_L0, &clear_L0_ofs, &clear_L0_pt,
>   					emit_clear_cmd_len(gt), 0,
> -					NUM_PT_PER_BLIT);
> +					avail_pts);
>   		if (xe_device_has_flat_ccs(xe) && clear_vram)
>   			batch_size += EMIT_COPY_CCS_DW;
>   
