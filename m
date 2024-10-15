Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2250D1D879
	for <intel-xe@archiver.kernel.org>; Tue, 15 Oct 2024 15:29:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B39B610E5AA;
	Tue, 15 Oct 2024 15:29:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xie9NLTy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B188710E5AA
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Oct 2024 15:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729006185; x=1760542185;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=mwpRTiIi8elr/NAQnsvpkEE4qaZ0m5LG8i5LSCffT24=;
 b=Xie9NLTyStZkENAOsDs3h2ow2DYVb3KWItPNGpw851V3W3dhx55Jllwf
 h5ztpQxtciYCUsimEZUoPOspEpJOiT/5GTMV41Bd3mmGm6IlSk0X87eVo
 sZE8/u3bh89eV4MGS/JsOcS2tNNfIqgzNcDVj+A9HTf6MRu/04Dk0rwL8
 XEWFLZAgA6hkRfJYBbJ7x36KjL0MQKqKhDPqlRJv0Rzq2lJnpHIs8WYow
 kr+2PqM9savtg7dgtic7YpgVVPK+9DBAHuoP9g2ERzw1VTjO7E2hIp48N
 7s9cxADUrGafGyGuiS3D9yh6EAJXAm7cVOUSIcO01LxzOztuKLT/0IZGk Q==;
X-CSE-ConnectionGUID: J+9//LB/SoWVbdnIFq4uxA==
X-CSE-MsgGUID: IEgR/qJ7S1e+eWdCazkqOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28296874"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="28296874"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 08:29:45 -0700
X-CSE-ConnectionGUID: 17L1p8YERKGT7/cz8mUI2g==
X-CSE-MsgGUID: k7uRov5/Ru+ZMEdG9GgdmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; d="scan'208";a="101262532"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.177.104])
 ([10.245.177.104])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 08:29:43 -0700
Message-ID: <75c8bb73-b155-4d7f-8930-d209b37226ae@linux.intel.com>
Date: Tue, 15 Oct 2024 17:29:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 20/26] drm/xe/gt_tlb_invalidation_ggtt: Update handling
 of xe_force_wake_get return
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20241014075601.2324382-1-himal.prasad.ghimiray@intel.com>
 <20241014075601.2324382-21-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20241014075601.2324382-21-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset=UTF-8
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


On 10/14/2024 9:55 AM, Himal Prasad Ghimiray wrote:
> xe_force_wake_get() now returns the reference count-incremented domain
> mask. If it fails for individual domains, the return value will always
> be 0. However, for XE_FORCEWAKE_ALL, it may return a non-zero value even
> in the event of failure. Update the return handling of xe_force_wake_get()
> to reflect this behavior, and ensure that the return value is passed as
> input to xe_force_wake_put().
>
> v3
> - return xe_wakeref_t instead of int in xe_force_wake_get()
>
> v5
> - return unsigned int from xe_force_wake_get()
> - remove redundant warns
>
> v7
> - Fix commit message
>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> index a530a933eedc..773de1f08db9 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> @@ -268,6 +268,7 @@ static int xe_gt_tlb_invalidation_guc(struct xe_gt *gt,
>  int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
> +	unsigned int fw_ref;
>  
>  	if (xe_guc_ct_enabled(&gt->uc.guc.ct) &&
>  	    gt->uc.guc.submission_state.enabled) {
> @@ -286,7 +287,7 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
>  		if (IS_SRIOV_VF(xe))
>  			return 0;
>  
> -		xe_gt_WARN_ON(gt, xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
> +		fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>  		if (xe->info.platform == XE_PVC || GRAPHICS_VER(xe) >= 20) {
>  			xe_mmio_write32(mmio, PVC_GUC_TLB_INV_DESC1,
>  					PVC_GUC_TLB_INV_DESC1_INVALIDATE);
> @@ -296,7 +297,7 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
>  			xe_mmio_write32(mmio, GUC_TLB_INV_CR,
>  					GUC_TLB_INV_CR_INVALIDATE);
>  		}
> -		xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> +		xe_force_wake_put(gt_to_fw(gt), fw_ref);
>  	}
>  
>  	return 0;
