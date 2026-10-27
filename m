Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70AC1606A31A
	for <intel-xe@archiver.kernel.org>; Tue, 27 Oct 2026 14:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Sozcp5aT
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2786B10F5C5;
	Tue, 27 Oct 2026 14:33:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 778E110F5C5
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Oct 2026 14:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793111614; x=1824647614;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=iP87UcTRL2xC/Xvh6nX0eYEhPEKH71p927wBMUJioOs=;
 b=Sozcp5aTN9MXVAakbC3/wEgFbDINfsJO5z6b6fEF32NUrHIjYueLuMXe
 fmv4gs14EE/NiH9SufFvWV9YT/l84xbzJdh5VqSXwzkFHpy8UrYa1nbV5
 kWvilyEDhBx/IyBi5E0QZyTKkWNMcgfv/ObVc9bX0+w3zvQ9xUaJLI93c
 w3Nrck5ehntu6BDdIAA72kPF36QmmoxyWCrlesRDHWr3+rtReHnwRp1ub
 7pJRxotiGL7rQA4OKJZElGtHq+scwS/fliDyuvsDs/kwxJUVyyA9JO3ej
 JnUTJU93nP/M0VGLP5VcXsTAmBB+daOpPolvxO8gMCYW6R/HRKVKVk4el A==;
X-CSE-ConnectionGUID: ULEN7aO/TjWk/Wr7092geA==
X-CSE-MsgGUID: KtHdsJ+hT5aQJcu7DQeWLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1824476"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1824476"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 07:33:31 -0700
X-CSE-ConnectionGUID: Z3r/w+aLTDSV51gx4BJ/iw==
X-CSE-MsgGUID: L6qnbIaJQOeisQg7KS7CEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="4898669"
Received: from abityuts-desk1.ger.corp.intel.com (HELO [10.245.244.18])
 ([10.245.244.18])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 07:33:30 -0700
Message-ID: <8771556d-3f31-4cf8-82a6-feca9dca2d61@intel.com>
Date: Tue, 27 Oct 2026 14:33:28 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] drm/xe: Add up-to-date implementation for
 Wa_14026539277
To: Gustavo Sousa <gustavo.sousa@intel.com>, intel-xe@lists.freedesktop.org
Cc: Carl Zhang <Carl.Zhang@intel.com>,
 Filip Hazubski <filip.hazubski@intel.com>,
 =?UTF-8?Q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
References: <20261027-wa_14026539277-v5-0-541941b1c032@intel.com>
 <20261027-wa_14026539277-v5-3-541941b1c032@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20261027-wa_14026539277-v5-3-541941b1c032@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 27/10/2026 14:27, Gustavo Sousa wrote:
> Wa_14026539277 is a temporary workaround that targets only A*
> steppings of graphics version 35.10 and requires that we avoid using
> 2-way coherency for device-cacheable memory accesses.  For
> driver-internal usage, we convert those configurations to be
> device-uncached and 1-way-coherent; on the UAPI side, we reject
> VM_BIND/MADVISE calls that are 2-way-coherent and leave it up to
> userspace to select the alternative option that is most appropriate to
> their usage.
> 
> v2:
>    - Add missing bits to convert the PAT value to device-uncacheable in
>      wa_14026539277_fixup_pat_value(). (Sashiko)
>    - Also validate the PAT index in the DRM_XE_VM_MADVISE
>      ioctl. (Sashiko)
>    - Match against the graphics IP instead of the platform.
> v3:
>    - Handle any 2-way-coherent PAT index irrespective of L3 cache
>      policy, because L3 UC can be promoted to cached by MOCS. (Matt)
> v4:
>    - Validate coherency mode for MADVISE in the VMA-independent
>      madvise_args_are_sane() instead of
>      check_pat_args_are_sane(). (Sashiko)
> 
> Acked-by: Carl Zhang <Carl.Zhang@intel.com>
> Acked-by: Filip Hazubski <filip.hazubski@intel.com>
> Acked-by: José Roberto de Souza <jose.souza@intel.com>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com> # v3

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device.c     | 16 ++++++----
>   drivers/gpu/drm/xe/xe_pat.c        | 64 ++++++++++++++++++++++++++++++++++----
>   drivers/gpu/drm/xe/xe_pat.h        | 10 ++++++
>   drivers/gpu/drm/xe/xe_vm.c         |  5 +++
>   drivers/gpu/drm/xe/xe_vm_madvise.c |  4 +++
>   drivers/gpu/drm/xe/xe_wa_oob.rules |  1 +
>   6 files changed, 88 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 4e9598791279..d3bb42e4d0d7 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -774,14 +774,18 @@ static void override_has_cached_pt(struct xe_device *xe)
>   	struct xe_gt *gt;
>   	u8 id;
>   
> -	/*
> -	 * Wa_16029380221: The affected GT will always use non-coherent
> -	 * access to page tables, so we must do uncached writes from the
> -	 * CPU.
> -	 */
> -	for_each_gt(gt, xe, id)
> +	for_each_gt(gt, xe, id) {
> +		/*
> +		 * Wa_16029380221: The affected GT will always use
> +		 * non-coherent access to page tables, so we must do
> +		 * uncached writes from the CPU.
> +		 */
>   		if (XE_GT_WA(gt, 16029380221))
>   			xe->info.has_cached_pt = false;
> +
> +		if (XE_GT_WA(gt, 14026539277))
> +			xe->info.has_cached_pt = false;
> +	}
>   }
>   
>   static int probe_has_flat_ccs(struct xe_device *xe)
> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> index 53c5f4030bf8..5938fef22579 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -324,6 +324,40 @@ u16 xe_pat_index_get_l3_policy(struct xe_device *xe, u16 pat_index)
>   	return REG_FIELD_GET(XE2_L3_POLICY, xe->pat.table[pat_index].value);
>   }
>   
> +bool xe_pat_wa_14026539277_reserved(struct xe_device *xe, u16 pat_index)
> +{
> +	struct xe_gt *gt;
> +	u8 id;
> +	bool has_wa = false;
> +
> +	for_each_gt(gt, xe, id) {
> +		if (XE_GT_WA(gt, 14026539277)) {
> +			has_wa = true;
> +			break;
> +		}
> +	}
> +
> +	/*
> +	 * Disallow 2-way coherency for any L3 cache policy because
> +	 * XE_L3_POLICY_UC could still be promoted to a cached policy
> +	 * by MOCS indices.
> +	 */
> +	return has_wa && xe_pat_index_get_coh_mode(xe, pat_index) == XE_COH_2WAY;
> +}
> +
> +static u32 wa_14026539277_fixup_pat_value(struct xe_gt *gt, u32 value)
> +{
> +	if (XE_GT_WA(gt, 14026539277)) {
> +		if (REG_FIELD_GET(XE2_COH_MODE, value) == XE_COH_2WAY) {
> +			value &= ~(XE2_L3_POLICY | XE2_COH_MODE);
> +			value |= REG_FIELD_PREP(XE2_L3_POLICY, XE_L3_POLICY_UC) |
> +				 REG_FIELD_PREP(XE2_COH_MODE, XE_COH_1WAY);
> +		}
> +	}
> +
> +	return value;
> +}
> +
>   static const struct xe_pat_table_entry *gt_pta_entry(struct xe_gt *gt)
>   {
>   	struct xe_device *xe = gt_to_xe(gt);
> @@ -384,18 +418,22 @@ static void program_pat_mcr(struct xe_gt *gt, const struct xe_pat_table_entry ta
>   
>   	for (int i = 0; i < n_entries; i++) {
>   		struct xe_reg_mcr reg_mcr = XE_REG_MCR(_PAT_INDEX(i));
> +		u32 pat = wa_14026539277_fixup_pat_value(gt, table[i].value);
>   
> -		xe_gt_mcr_multicast_write(gt, reg_mcr, table[i].value);
> +		xe_gt_mcr_multicast_write(gt, reg_mcr, pat);
>   	}
>   
>   	if (xe->pat.pat_ats)
> -		xe_gt_mcr_multicast_write(gt, XE_REG_MCR(_PAT_ATS), xe->pat.pat_ats->value);
> +		xe_gt_mcr_multicast_write(gt, XE_REG_MCR(_PAT_ATS),
> +					  wa_14026539277_fixup_pat_value(gt, xe->pat.pat_ats->value));
>   
>   	if (pta_entry)
> -		xe_gt_mcr_multicast_write(gt, XE_REG_MCR(_PAT_PTA), pta_entry->value);
> +		xe_gt_mcr_multicast_write(gt, XE_REG_MCR(_PAT_PTA),
> +					  wa_14026539277_fixup_pat_value(gt, pta_entry->value));
>   
>   	if (tr_pta_entry)
> -		xe_gt_mcr_multicast_write(gt, XE_REG_MCR(_PAT_TR_PTA), tr_pta_entry->value);
> +		xe_gt_mcr_multicast_write(gt, XE_REG_MCR(_PAT_TR_PTA),
> +					  wa_14026539277_fixup_pat_value(gt, tr_pta_entry->value));
>   }
>   
>   static int xelp_dump(struct xe_gt *gt, struct drm_printer *p)
> @@ -545,13 +583,16 @@ static int xe2_dump(struct xe_gt *gt, struct drm_printer *p)
>   	drm_printf(p, "PAT table: (* = reserved entry)\n");
>   
>   	for (i = 0; i < xe->pat.n_entries; i++) {
> +		bool rsvd = !xe->pat.table[i].valid ||
> +			    xe_pat_wa_14026539277_reserved(xe, i);
> +
>   		if (xe_gt_is_media_type(gt))
>   			pat = xe_mmio_read32(&gt->mmio, XE_REG(_PAT_INDEX(i)));
>   		else
>   			pat = xe_gt_mcr_unicast_read_any(gt, XE_REG_MCR(_PAT_INDEX(i)));
>   
>   		xe_pat_index_label(label, sizeof(label), i);
> -		xe->pat.ops->entry_dump(p, label, pat, !xe->pat.table[i].valid);
> +		xe->pat.ops->entry_dump(p, label, pat, rsvd);
>   	}
>   
>   	/*
> @@ -768,9 +809,14 @@ int xe_pat_dump_sw_config(struct xe_gt *gt, struct drm_printer *p)
>   	for (u32 i = 0; i < xe->pat.n_entries; i++) {
>   		u32 pat = xe->pat.table[i].value;
>   
> +		pat = wa_14026539277_fixup_pat_value(gt, pat);
> +
>   		if (GRAPHICS_VER(xe) >= 20) {
> +			bool rsvd = !xe->pat.table[i].valid ||
> +				    xe_pat_wa_14026539277_reserved(xe, i);
> +
>   			xe_pat_index_label(label, sizeof(label), i);
> -			xe->pat.ops->entry_dump(p, label, pat, !xe->pat.table[i].valid);
> +			xe->pat.ops->entry_dump(p, label, pat, rsvd);
>   		} else if (xe->info.platform == XE_METEORLAKE) {
>   			xelpg_pat_entry_dump(p, i, pat);
>   		} else if (xe->info.platform == XE_PVC) {
> @@ -785,6 +831,8 @@ int xe_pat_dump_sw_config(struct xe_gt *gt, struct drm_printer *p)
>   	if (pta_entry) {
>   		u32 pat = pta_entry->value;
>   
> +		pat = wa_14026539277_fixup_pat_value(gt, pat);
> +
>   		drm_printf(p, "Page Table Access:\n");
>   		xe->pat.ops->entry_dump(p, "PTA_MODE", pat, false);
>   	}
> @@ -792,6 +840,8 @@ int xe_pat_dump_sw_config(struct xe_gt *gt, struct drm_printer *p)
>   	if (tr_pta_entry) {
>   		u32 pat = tr_pta_entry->value;
>   
> +		pat = wa_14026539277_fixup_pat_value(gt, pat);
> +
>   		drm_printf(p, "TRTT Page Table Access:\n");
>   		xe->pat.ops->entry_dump(p, "TR_PTA_MODE", pat, false);
>   	}
> @@ -799,6 +849,8 @@ int xe_pat_dump_sw_config(struct xe_gt *gt, struct drm_printer *p)
>   	if (xe->pat.pat_ats) {
>   		u32 pat = xe->pat.pat_ats->value;
>   
> +		pat = wa_14026539277_fixup_pat_value(gt, pat);
> +
>   		drm_printf(p, "PCIe ATS/PASID:\n");
>   		xe->pat.ops->entry_dump(p, "PAT_ATS ", pat, false);
>   	}
> diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h
> index 16beda6db97e..2ac6ddc66587 100644
> --- a/drivers/gpu/drm/xe/xe_pat.h
> +++ b/drivers/gpu/drm/xe/xe_pat.h
> @@ -95,6 +95,16 @@ bool xe_pat_index_get_comp_en(struct xe_device *xe, u16 pat_index);
>    */
>   u16 xe_pat_index_get_l3_policy(struct xe_device *xe, u16 pat_index);
>   
> +/**
> + * xe_pat_wa_14026539277_reserved - Is this PAT index reserved from
> + * use due to Wa_14026539277?
> + * @xe: xe device
> + * @pat_index: The pat_index to query
> + *
> + * Return: a boolean indicating whether the PAT index is reserved or not.
> + */
> +bool xe_pat_wa_14026539277_reserved(struct xe_device *xe, u16 pat_index);
> +
>   #define xe_cache_pat_idx(xe, cache_mode) ({					\
>   	const struct xe_device *__xedev = (xe);					\
>   	enum xe_cache_level __mode = (cache_mode);				\
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 86c3b4fd232f..823e264319a1 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3855,6 +3855,11 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
>   		coh_mode = xe_pat_index_get_coh_mode(xe, pat_index);
>   		comp_en = xe_pat_index_get_comp_en(xe, pat_index);
>   
> +		if (XE_IOCTL_DBG(xe, xe_pat_wa_14026539277_reserved(xe, pat_index))) {
> +			err = -EINVAL;
> +			goto free_bind_ops;
> +		}
> +
>   		if (XE_IOCTL_DBG(xe, op > DRM_XE_VM_BIND_OP_PREFETCH) ||
>   		    XE_IOCTL_DBG(xe, flags & ~SUPPORTED_FLAGS) ||
>   		    XE_IOCTL_DBG(xe, obj && (is_null || is_cpu_addr_mirror)) ||
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
> index 875c00563f91..31245c6c96d4 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -407,6 +407,10 @@ static bool madvise_args_are_sane(struct xe_device *xe, const struct drm_xe_madv
>   
>   		if (XE_IOCTL_DBG(xe, args->pat_index.reserved))
>   			return false;
> +
> +		if (XE_IOCTL_DBG(xe, xe_pat_wa_14026539277_reserved(xe, pat_index)))
> +			return false;
> +
>   		break;
>   	}
>   	case DRM_XE_VMA_ATTR_PURGEABLE_STATE:
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index 63d695f40214..96132c6e3340 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -72,6 +72,7 @@
>   		GRAPHICS_VERSION(3511)
>   16029897822	MEDIA_VERSION(3500)
>   		GRAPHICS_VERSION(3510)
> +14026539277	GRAPHICS_VERSION(3510), GRAPHICS_STEP(A0, B0)
>   14027054324	GRAPHICS_VERSION(3511)
>   14025941587	GRAPHICS_VERSION_RANGE(2001, 3511), FUNC(xe_rtp_match_not_sriov_vf)
>   		MEDIA_VERSION_RANGE(1301, 3503), FUNC(xe_rtp_match_not_sriov_vf)
> 

