Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D392FD29C2A
	for <intel-xe@archiver.kernel.org>; Mon, 19 Jan 2026 13:17:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95D7D10E053;
	Mon, 19 Jan 2026 13:17:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q+rWQIkV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0BBE10E053
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Jan 2026 13:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768828651; x=1800364651;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Sdo2hizsHDsPqrtv5CfR1fy4YXf24w/zK+CKAEHJN7g=;
 b=Q+rWQIkVmt0ehPa1/EblMnu7MwXnyCkLhH0Xq3oXDZ/kKbQLVTjkX7EH
 o9yTfHYLyGb9pcikv/gFRnJCK/FYGOFyGcHY5DahX8ToyO0p141mrAr89
 KQjCNp0xCi5mUo0Kn303GEU8yqGTzZ+uSh4DFMONEm6RJhn/va5KNdrAa
 BtQC4jvq1wRpnpijUiIrl8T9MfxO+GNgF0rGyZf5lfrHTdLhKImckR8dq
 XaErGmVW5cjDkLaR272taJWg7JId3FVFp0vKf7Vd1vBCpcs/Nc+KAT7IG
 mZ6U7lH/SrDt+sObKG7h4mhs6ur5+MZDUeSEwAsLa9+Su7pnBVPC1MKMF g==;
X-CSE-ConnectionGUID: vCPu9desSQaD6sX8mqknow==
X-CSE-MsgGUID: EcyCzdQISx677OtiZZk6zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="70087608"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; d="scan'208";a="70087608"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 05:17:31 -0800
X-CSE-ConnectionGUID: 4AR3T/xkRd2l3Ur00QGU2w==
X-CSE-MsgGUID: Is3V9zLSTFCulhfd6QWPuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; d="scan'208";a="236544488"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO [10.245.244.99])
 ([10.245.244.99])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 05:17:30 -0800
Message-ID: <ccc20c84-9c83-4068-82be-dc693b397cc5@intel.com>
Date: Mon, 19 Jan 2026 13:17:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: derive mem copy capability from graphics version
To: Nitin Gote <nitin.r.gote@intel.com>, intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
References: <20260119121819.1676700-2-nitin.r.gote@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260119121819.1676700-2-nitin.r.gote@intel.com>
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

On 19/01/2026 12:18, Nitin Gote wrote:
> Drop .has_mem_copy_instr from the platform descriptors and compute
> it in xe_info_init() once handle_gmdid() populates graphics_verx100.
> Early init was running with graphics_verx100==0, so the old placement
> silently disabled MEM_COPY on every GMDID platform. Centralizing the
> GRAPHICS_VER(xe) >= 20 || platform == XE_PVC check keeps Xe2+/PVC enabled
> and removes redundant per-platform plumbing for future Xe platforms.

PVC had a slightly different instruction layout for this IIRC, which is 
why I kept it to xe2+. I doubt it is worth the effort, but if you want 
to add support for PVC I think best keep as a separate patch (need to 
also change the instruction emit part).

> 
> Bspec: 57561
> 
> Fixes: 1e12dbae9d72 ("drm/xe/migrate: support MEM_COPY instruction")
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Suggested-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pci.c       | 7 ++-----
>   drivers/gpu/drm/xe/xe_pci_types.h | 1 -
>   2 files changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 34df063024fe..b41e3afc0431 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -350,7 +350,6 @@ static const struct xe_device_desc lnl_desc = {
>   	.has_display = true,
>   	.has_flat_ccs = 1,
>   	.has_pxp = true,
> -	.has_mem_copy_instr = true,
>   	.max_gt_per_tile = 2,
>   	.needs_scratch = true,
>   	.va_bits = 48,
> @@ -375,7 +374,6 @@ static const struct xe_device_desc bmg_desc = {
>   	.has_pre_prod_wa = 1,
>   	.has_soc_remapper_telem = true,
>   	.has_sriov = true,
> -	.has_mem_copy_instr = true,
>   	.max_gt_per_tile = 2,
>   	.needs_scratch = true,
>   	.subplatforms = (const struct xe_subplatform_desc[]) {
> @@ -392,7 +390,6 @@ static const struct xe_device_desc ptl_desc = {
>   	.has_display = true,
>   	.has_flat_ccs = 1,
>   	.has_sriov = true,
> -	.has_mem_copy_instr = true,
>   	.has_pre_prod_wa = 1,
>   	.has_pxp = true,
>   	.max_gt_per_tile = 2,
> @@ -407,7 +404,6 @@ static const struct xe_device_desc nvls_desc = {
>   	.dma_mask_size = 46,
>   	.has_display = true,
>   	.has_flat_ccs = 1,
> -	.has_mem_copy_instr = true,
>   	.has_pre_prod_wa = 1,
>   	.max_gt_per_tile = 2,
>   	.require_force_probe = true,
> @@ -706,7 +702,6 @@ static int xe_info_init_early(struct xe_device *xe,
>   	xe->info.has_soc_remapper_telem = desc->has_soc_remapper_telem;
>   	xe->info.has_sriov = xe_configfs_primary_gt_allowed(to_pci_dev(xe->drm.dev)) &&
>   		desc->has_sriov;
> -	xe->info.has_mem_copy_instr = desc->has_mem_copy_instr;
>   	xe->info.skip_guc_pc = desc->skip_guc_pc;
>   	xe->info.skip_mtcfg = desc->skip_mtcfg;
>   	xe->info.skip_pcode = desc->skip_pcode;
> @@ -897,6 +892,8 @@ static int xe_info_init(struct xe_device *xe,
>   	xe->info.has_ctx_tlb_inval = graphics_desc->has_ctx_tlb_inval;
>   	xe->info.has_usm = graphics_desc->has_usm;
>   	xe->info.has_64bit_timestamp = graphics_desc->has_64bit_timestamp;
> +	xe->info.has_mem_copy_instr = GRAPHICS_VER(xe) >= 20 ||
> +				      xe->info.platform == XE_PVC;
>   
>   	xe_info_probe_tile_count(xe);
>   
> diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
> index 7ccb0ab7a53b..8b2ff3f25607 100644
> --- a/drivers/gpu/drm/xe/xe_pci_types.h
> +++ b/drivers/gpu/drm/xe/xe_pci_types.h
> @@ -49,7 +49,6 @@ struct xe_device_desc {
>   	u8 has_llc:1;
>   	u8 has_mbx_power_limits:1;
>   	u8 has_mbx_thermal_info:1;
> -	u8 has_mem_copy_instr:1;
>   	u8 has_mert:1;
>   	u8 has_pre_prod_wa:1;
>   	u8 has_page_reclaim_hw_assist:1;

