Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4E35CA0EFF
	for <intel-xe@archiver.kernel.org>; Wed, 27 Aug 2025 13:14:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66C4C10E817;
	Wed, 27 Aug 2025 13:14:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UokRC7bC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81EB510E817
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Aug 2025 13:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756300488; x=1787836488;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=p4tKPUoBBj9dDiL8haWC0GWjRb0HARWr/uN/TIOHyRY=;
 b=UokRC7bCCSD9rR+gS6ZlQ4lklcELG3WI2Qb5Mkhdy/PFtFmQzA4ADDCD
 rgn0SCb/7TIecttUv7BFLyPoMXfGAbMMoE6zJT9FRvpqkjLZXWoOnswvh
 GJMaWMkjaewaZTckQEuirKKoZWpjQ/egEwH0pC28AVw0v/fB3+AAkiwes
 It2uc5wizyYnNR9wFCp9Ab73LCCUS9mia4NvupTQS4dpAJUeYyK2suPkc
 rTfTtf7+KbEsQNDXr46DLhDoEpD6RvTZRbrKadAOjBEtvJ2bWTn1PQREB
 6GSLXzPHe2zCVtlQx6K8TH4yX1HiQJEL87GlMafYcBwLN0i/90uQu9Wk5 w==;
X-CSE-ConnectionGUID: i5Rx6GdkTPaiLJIQoQMdiQ==
X-CSE-MsgGUID: /hjA0m1GTICHNruz9nahqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="58483677"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="58483677"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 06:14:48 -0700
X-CSE-ConnectionGUID: hRuXICAyQH284atiQ332MA==
X-CSE-MsgGUID: 9O/GrQxNQviYrUvcZjZD0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="174174612"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO [10.245.244.157])
 ([10.245.244.157])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 06:14:48 -0700
Message-ID: <36661989-8466-4dc7-ba2d-1f256f68481d@intel.com>
Date: Wed, 27 Aug 2025 14:14:45 +0100
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

Oops, I think we missed the dg2 case, where there is both a ccs copy and 
page copy, which is not the case on xe2+.

I think maybe make the above conditional on copy_only_ccs instead:

if (copy_only_ccs) {
     dst_L0_ofs = src_L0_ofs;
} else {
     pte_flags = dst_is_vram ? PTE_UPDATE_FLAG_IS_VRAM : 0;
     batch_size += pte_update_size(...)
     ...
}

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

And then here drop this change and turn the else into:

else if (!copy_only_ccs)

>   
> -		if (copy_system_ccs)
> -			emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, src);

And then keep this here as-is. I think that should work?

> -
>   		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
>   		update_idx = bb->len;
>   

