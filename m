Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4E1ECA1002
	for <intel-xe@archiver.kernel.org>; Thu,  4 Sep 2025 16:28:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87F9310EA97;
	Thu,  4 Sep 2025 16:28:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KaNqGgOp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1976410EA97
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Sep 2025 16:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757003288; x=1788539288;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=sjfxcQcBntCU2bMG5RIdzBtIUxl6p5Bkp6CfaIcF4Ig=;
 b=KaNqGgOpZ8RXnZAN+nO96tooJ7GRz1ApBpW2q/tquhx4zqwjdZW0QIlf
 MISVVatV1cQT+zjPkLeXvAIpReq6TZPKs7w+4ILeJs/WpBbVTcziaGoFv
 y4MDeYkE8+hBoQ4dk5mpKFgAl7BXhlyrJmj4q5uAFVONlzrA976Ia3HvF
 DhBEKBkxBM1QBQ/1wC7HV7nEHmJk0ud03G7Ctrra2olVqNsvdq1KktXWr
 P0Y3LHmZs0VPvK+uveQ0/YcG/GSKKdXHZfqCvme1ADOmtUrZYxNdcuSkb
 FSdCScXACTUWrvW2NdvGYLzhcLUMmZsCrjT1JkQUIFfph10r8csUTs+Hu Q==;
X-CSE-ConnectionGUID: BfGODpVvSMu/IvZD7jimsA==
X-CSE-MsgGUID: z8RQ3EcGRsS6Skc1mIjNVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11543"; a="61981481"
X-IronPort-AV: E=Sophos;i="6.18,238,1751266800"; d="scan'208";a="61981481"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 09:28:08 -0700
X-CSE-ConnectionGUID: ALhkMo9QRO+bBfmjbrpEVQ==
X-CSE-MsgGUID: ns8XZawXRFuZ7+gouFh1sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,238,1751266800"; d="scan'208";a="171221157"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO [10.245.244.143])
 ([10.245.244.143])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 09:28:07 -0700
Message-ID: <1b4c6f27-2939-423f-a1f7-e5683d68e0d2@intel.com>
Date: Thu, 4 Sep 2025 17:28:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/migrate: Remove unneeded emit_pte() when
 copying CCS only
To: Sanjay Yadav <sanjay.kumar.yadav@intel.com>, intel-xe@lists.freedesktop.org
References: <20250904161423.2448727-1-sanjay.kumar.yadav@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250904161423.2448727-1-sanjay.kumar.yadav@intel.com>
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

On 04/09/2025 17:14, Sanjay Yadav wrote:
> In xe_migrate_copy(), when copy_only_ccs is true, we only need two
> emit_pte() calls one for the BO and one for the raw CCS storage.
> However, the current implementation issues three emit_pte() calls,
> resulting in an unnecessary PTE programming job.
> 
> This fix removes the redundant emit_pte() call to avoid programming
> the same PTEs twice and reducing overhead during CCS-only migration.
> 
> v2: Preserve correct behavior on DG2, which requires both CCS and
> page copies.
> 
> Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
> Suggested-by: Matthew Auld <matthew.auld@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_migrate.c | 16 ++++++++++------
>   1 file changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 9643442ef101..a4b0187f856d 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -842,11 +842,15 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>   		batch_size += pte_update_size(m, pte_flags, src, &src_it, &src_L0,
>   					      &src_L0_ofs, &src_L0_pt, 0, 0,
>   					      avail_pts);
> -
> -		pte_flags = dst_is_vram ? PTE_UPDATE_FLAG_IS_VRAM : 0;
> -		batch_size += pte_update_size(m, pte_flags, dst, &dst_it, &src_L0,
> -					      &dst_L0_ofs, &dst_L0_pt, 0,
> -					      avail_pts, avail_pts);
> +		if (copy_only_ccs) {
> +			dst_L0_ofs = src_L0_ofs;
> +		} else {
> +			pte_flags = dst_is_vram ? PTE_UPDATE_FLAG_IS_VRAM : 0;
> +			batch_size += pte_update_size(m, pte_flags, dst,
> +							&dst_it, &src_L0,
> +							&dst_L0_ofs, &dst_L0_pt,
> +							0, avail_pts, avail_pts);

Nit: I think the formatting/alignment is a little off here. No need to 
resend just for that though. Will fix up locally before pushing, 
assuming CI is now happy.

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> +		}
>   
>   		if (copy_system_ccs) {
>   			xe_assert(xe, type_device);
> @@ -876,7 +880,7 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>   
>   		if (dst_is_vram && xe_migrate_allow_identity(src_L0, &dst_it))
>   			xe_res_next(&dst_it, src_L0);
> -		else
> +		else if (!copy_only_ccs)
>   			emit_pte(m, bb, dst_L0_pt, dst_is_vram, copy_system_ccs,
>   				 &dst_it, src_L0, dst);
>   

