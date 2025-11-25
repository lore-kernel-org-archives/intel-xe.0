Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C168CD0EE06
	for <intel-xe@archiver.kernel.org>; Tue, 25 Nov 2025 15:49:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F5AA10E444;
	Tue, 25 Nov 2025 15:49:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mH3MhLHz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0E1E10E444
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Nov 2025 15:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764085762; x=1795621762;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=si1E7cReM+qLkJkeNCzCwNmgTFv0vxD42qD6nwaFX5o=;
 b=mH3MhLHzMMFmo4VG+WIYRKcUGEDS7AIJFHpdLM8JD9rFmmOFpnpzU1BW
 Qqnbl+nABf9n+QuOmvh2RrAExVMLVDf3fTUlHERUueLv0yIycZR7YjTLv
 EH8cJ91ENdXf9Sfqp6i73GDGp1thgV6R2EB3aw9e5DL0uf5SOw5qqiUZ3
 2TsZxaEO4ezZUwiMMv9TmoLYtKiVurid4x+RxufBHaXqlkENiBy5e1DJZ
 nYvTrAqwJbERGbTdP4k9gPvtYVJX0F7C1LVttCruKOha0nC/sVffoyGLE
 Kq6HUJstHQO4wUxt5DjQzUpP9w+F2/zU2ulZBacaDt2VuD7B6g91CMzA8 g==;
X-CSE-ConnectionGUID: Y/K85R6NQcOj2rPbOaQmWQ==
X-CSE-MsgGUID: MdX5QMuSSeGWbfTr7l9FHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="53675996"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="53675996"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 07:49:21 -0800
X-CSE-ConnectionGUID: 4x2VkN6DTAG9JSKRFAYFDw==
X-CSE-MsgGUID: iE4abmnCQiizP+W/bOWV1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="193477007"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO [10.245.244.230])
 ([10.245.244.230])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 07:49:21 -0800
Message-ID: <bbe89edd-c5c6-470a-8f16-bb1dea23be7f@intel.com>
Date: Tue, 25 Nov 2025 15:49:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Add caching pagetable flag
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20251125153732.400766-2-zbigniew.kempczynski@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20251125153732.400766-2-zbigniew.kempczynski@intel.com>
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

On 25/11/2025 15:37, Zbigniew Kempczyński wrote:
> Introduce device xe_caching_pt flag to selectively turn it on for
> supported platforms. It allows to eliminate version check and enable
> this feature for the future platforms.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_bo.c           | 3 +--
>   drivers/gpu/drm/xe/xe_device_types.h | 2 ++
>   drivers/gpu/drm/xe/xe_pci.c          | 6 ++++++
>   drivers/gpu/drm/xe/xe_pci_types.h    | 1 +
>   4 files changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index b0bd31d14bb9..dbd41cc5f734 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -516,8 +516,7 @@ static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
>   		 * non-coherent and require a CPU:WC mapping.
>   		 */
>   		if ((!bo->cpu_caching && bo->flags & XE_BO_FLAG_SCANOUT) ||
> -		    (xe->info.graphics_verx100 >= 1270 &&
> -		     bo->flags & XE_BO_FLAG_PAGETABLE))
> +		     (!xe->info.has_cached_pt && bo->flags & XE_BO_FLAG_PAGETABLE))
>   			caching = ttm_write_combined;
>   	}
>   
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 7baf15f51575..710c225325d5 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -286,6 +286,8 @@ struct xe_device {
>   		u8 has_asid:1;
>   		/** @info.has_atomic_enable_pte_bit: Device has atomic enable PTE bit */
>   		u8 has_atomic_enable_pte_bit:1;
> +		/** @info.has_cached_pt: Supports caching pagetable */
> +		u8 has_cached_pt:1;
>   		/** @info.has_device_atomics_on_smem: Supports device atomics on SMEM */
>   		u8 has_device_atomics_on_smem:1;
>   		/** @info.has_fan_control: Device supports fan control */
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 1959de3f7a27..8ce2cbdb3207 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -168,6 +168,7 @@ static const struct xe_device_desc tgl_desc = {
>   	.pre_gmdid_media_ip = &media_ip_xem,
>   	PLATFORM(TIGERLAKE),
>   	.dma_mask_size = 39,
> +	.has_cached_pt = true,
>   	.has_display = true,
>   	.has_llc = true,
>   	.has_sriov = true,
> @@ -182,6 +183,7 @@ static const struct xe_device_desc rkl_desc = {
>   	.pre_gmdid_media_ip = &media_ip_xem,
>   	PLATFORM(ROCKETLAKE),
>   	.dma_mask_size = 39,
> +	.has_cached_pt = true,
>   	.has_display = true,
>   	.has_llc = true,
>   	.max_gt_per_tile = 1,
> @@ -197,6 +199,7 @@ static const struct xe_device_desc adl_s_desc = {
>   	.pre_gmdid_media_ip = &media_ip_xem,
>   	PLATFORM(ALDERLAKE_S),
>   	.dma_mask_size = 39,
> +	.has_cached_pt = true,
>   	.has_display = true,
>   	.has_llc = true,
>   	.has_sriov = true,
> @@ -217,6 +220,7 @@ static const struct xe_device_desc adl_p_desc = {
>   	.pre_gmdid_media_ip = &media_ip_xem,
>   	PLATFORM(ALDERLAKE_P),
>   	.dma_mask_size = 39,
> +	.has_cached_pt = true,
>   	.has_display = true,
>   	.has_llc = true,
>   	.has_sriov = true,
> @@ -235,6 +239,7 @@ static const struct xe_device_desc adl_n_desc = {
>   	.pre_gmdid_media_ip = &media_ip_xem,
>   	PLATFORM(ALDERLAKE_N),
>   	.dma_mask_size = 39,
> +	.has_cached_pt = true,
>   	.has_display = true,
>   	.has_llc = true,
>   	.has_sriov = true,
> @@ -664,6 +669,7 @@ static int xe_info_init_early(struct xe_device *xe,
>   	xe->info.vram_flags = desc->vram_flags;
>   
>   	xe->info.is_dgfx = desc->is_dgfx;
> +	xe->info.has_cached_pt = desc->has_cached_pt;
>   	xe->info.has_fan_control = desc->has_fan_control;
>   	/* runtime fusing may force flat_ccs to disabled later */
>   	xe->info.has_flat_ccs = desc->has_flat_ccs;
> diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
> index 9892c063a9c5..9bb928c3af1f 100644
> --- a/drivers/gpu/drm/xe/xe_pci_types.h
> +++ b/drivers/gpu/drm/xe/xe_pci_types.h
> @@ -37,6 +37,7 @@ struct xe_device_desc {
>   	u8 require_force_probe:1;
>   	u8 is_dgfx:1;
>   
> +	u8 has_cached_pt:1;
>   	u8 has_display:1;
>   	u8 has_fan_control:1;
>   	u8 has_flat_ccs:1;

