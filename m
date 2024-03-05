Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EBB5C54798
	for <intel-xe@archiver.kernel.org>; Tue,  5 Mar 2024 12:04:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2246810E441;
	Tue,  5 Mar 2024 12:04:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PmLRoVNX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C75C112A6F
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Mar 2024 12:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709640250; x=1741176250;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=A8dzMwg3z2oqg4e+zRzApVM7W8SSBEa2Xue4HEen4dk=;
 b=PmLRoVNXlc4hHyGkC+f3Svf6qcBmXOPmDiZb1NJoYmFGLKnsKlquazCP
 edzuBcLTRhEdoJXjuoXXNMoL/Eniu84PvB6Fb27DJLsyqK3J1+akOkY5z
 KHgG2mL4w0OfKjaNYCiSDRgoy9T6G/TnYvnQNkB+arNbgpc6RkjklC20a
 EXzpC32noO7W2U+S5m+FZkTtYoirGx7+o5sF9MxedzXws3dabMeluWsoU
 YQLmdfIWBz/Keu11TBUL6329n3CvSHiBAmM67N9fKxCq866mAy/weNYXe
 txFFuejdIkZ/kaeNq+SD1vBT2+f3YRFU5g3gljyx6t98s7AHabGIlLYQk Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="14833714"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; d="scan'208";a="14833714"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 04:04:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="9526661"
Received: from tvonhert-mobl1.ger.corp.intel.com (HELO [10.249.45.156])
 ([10.249.45.156])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 04:04:08 -0800
Message-ID: <44f0a16a-9f18-4077-9bb3-3db95a2772be@linux.intel.com>
Date: Tue, 5 Mar 2024 13:04:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Do not grab forcewakes when issuing GGTT TLB
 invalidation via GuC
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
References: <20240229194520.200642-1-matthew.brost@intel.com>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <20240229194520.200642-1-matthew.brost@intel.com>
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

Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

On 2024-02-29 20:45, Matthew Brost wrote:
> Forcewakes are not required for communication with the GuC via CTB
> as it is a memory based interfaced. Acquring forcewakes takes
> considerable time. With that, do not grab a forcewake when issuing a
> GGTT TLB invalidation via the GuC.
> 
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_ggtt.c                | 7 -------
>   drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 2 ++
>   2 files changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 5d46958e3144..601b3a95bffc 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -256,16 +256,9 @@ static void ggtt_invalidate_gt_tlb(struct xe_gt *gt)
>   	if (!gt)
>   		return;
>   
> -	/*
> -	 * Invalidation can happen when there's no in-flight work keeping the
> -	 * GT awake.  We need to explicitly grab forcewake to ensure the GT
> -	 * and GuC are accessible.
> -	 */
> -	xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>   	err = xe_gt_tlb_invalidation_ggtt(gt);
>   	if (err)
>   		drm_warn(&xe->drm, "xe_gt_tlb_invalidation_ggtt error=%d", err);
> -	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>   }
>   
>   void xe_ggtt_invalidate(struct xe_ggtt *ggtt)
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> index f29ee1ccfa71..a3c4ffba679d 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> @@ -247,6 +247,7 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
>   
>   		xe_gt_tlb_invalidation_wait(gt, seqno);
>   	} else if (xe_device_uc_enabled(xe)) {
> +		xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>   		if (xe->info.platform == XE_PVC || GRAPHICS_VER(xe) >= 20) {
>   			xe_mmio_write32(gt, PVC_GUC_TLB_INV_DESC1,
>   					PVC_GUC_TLB_INV_DESC1_INVALIDATE);
> @@ -256,6 +257,7 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
>   			xe_mmio_write32(gt, GUC_TLB_INV_CR,
>   					GUC_TLB_INV_CR_INVALIDATE);
>   		}
> +		xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>   	}
>   
>   	return 0;
