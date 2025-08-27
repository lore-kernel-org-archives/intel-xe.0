Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97E85CA0EFF
	for <intel-xe@archiver.kernel.org>; Wed, 27 Aug 2025 10:38:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6164410E7A5;
	Wed, 27 Aug 2025 10:38:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="erP8E7se";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4B2210E7A5
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Aug 2025 10:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756291111; x=1787827111;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=6lKuOibrspx78zQ0P+L/6g+A/g2ZE2GT0Vd2Cjv8vi8=;
 b=erP8E7seD//G6GUJkRCM196UKn51OfnHvnhwyY4bxIeVx6jfaH9h11lA
 KysDlv85N3g/w9JJLl8qz69gSkidn744d9gcDRzRIvgmTDT29Iz9lEv66
 TX0nFoLRsbUrFgidDKs36Z81rHVVoHY0RNB7lLlt/YarHKIXNf6s88aIy
 SYr4ffQLVuWyXZgBZ/SC+4Exw1dRkUN8ssiwjhF4bmxutL9p+HV7KOUa5
 Q6wmaq/E7KHJgNnrfNABNc5HFNIqTPa8Kxrn0aoUyNCDhsviVCgOAA+0V
 iKcHy7VPg3mu6O00gOrwriL9u1HrSuAQbsEmPkCZ01uQf+9zh42/H/KV8 Q==;
X-CSE-ConnectionGUID: X2LyUdozQqihQ3QEQIK8jQ==
X-CSE-MsgGUID: hMhbDg7ATTi4zDmWhkyjcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="57741517"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="57741517"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 03:38:30 -0700
X-CSE-ConnectionGUID: 8Q3CR75ATaiNLsShXSvnjg==
X-CSE-MsgGUID: b2vx7AExQe6QpDke98X6YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="200762837"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO [10.245.244.157])
 ([10.245.244.157])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 03:38:29 -0700
Message-ID: <3ca7e005-2be4-451c-9293-172623671c6f@intel.com>
Date: Wed, 27 Aug 2025 11:38:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/migrate: Remove unneeded emit_pte() when copying
 CCS only
To: Sanjay Yadav <sanjay.kumar.yadav@intel.com>, intel-xe@lists.freedesktop.org
References: <20250827101033.966580-1-sanjay.kumar.yadav@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250827101033.966580-1-sanjay.kumar.yadav@intel.com>
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

On 27/08/2025 11:10, Sanjay Yadav wrote:
> In xe_migrate_copy(), when copy_only_ccs is true, we only need two
> emit_pte() calls—one for the BO and one for the raw CCS storage.
> However, the current implementation issues three emit_pte() calls,
> resulting in an unnecessary PTE programming job.
> 
> This fix removes the redundant emit_pte() call to avoid programming
> the same PTEs twice and reducing overhead during CCS-only migration.
> 
> Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
> Suggested-by: Matthew Auld <matthew.auld@intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_migrate.c | 17 +++++++++--------
>   1 file changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index ddfad7506a82..9541a8fe4637 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -843,11 +843,6 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>   					      &src_L0_ofs, &src_L0_pt, 0, 0,
>   					      avail_pts);
>   
> -		pte_flags = dst_is_vram ? PTE_UPDATE_FLAG_IS_VRAM : 0;
> -		batch_size += pte_update_size(m, pte_flags, dst, &dst_it, &src_L0,
> -					      &dst_L0_ofs, &dst_L0_pt, 0,
> -					      avail_pts, avail_pts);
> -
>   		if (copy_system_ccs) {
>   			xe_assert(xe, type_device);
>   			ccs_size = xe_device_ccs_bytes(xe, src_L0);
> @@ -855,7 +850,14 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>   						      &ccs_ofs, &ccs_pt, 0,
>   						      2 * avail_pts,
>   						      avail_pts);
> +			dst_L0_ofs = src_L0_ofs;
>   			xe_assert(xe, IS_ALIGNED(ccs_it.start, PAGE_SIZE));
> +		} else {
> +			pte_flags = dst_is_vram ? PTE_UPDATE_FLAG_IS_VRAM : 0;
> +			batch_size += pte_update_size(m, pte_flags, dst,
> +					&dst_it, &src_L0,
> +					&dst_L0_ofs, &dst_L0_pt,
> +					0, avail_pts, avail_pts);
>   		}
>   
>   		/* Add copy commands size here */
> @@ -876,13 +878,12 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>   
>   		if (dst_is_vram && xe_migrate_allow_identity(src_L0, &dst_it))
>   			xe_res_next(&dst_it, src_L0);
> +		else if (copy_system_ccs)
> +			emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, src);
>   		else
>   			emit_pte(m, bb, dst_L0_pt, dst_is_vram, copy_system_ccs,
>   				 &dst_it, src_L0, dst);
>   
> -		if (copy_system_ccs)
> -			emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, src);
> -
>   		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
>   		update_idx = bb->len;
>   

