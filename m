Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4011C6FD20
	for <intel-xe@archiver.kernel.org>; Fri, 24 Mar 2023 21:45:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77EAE10E53E;
	Fri, 24 Mar 2023 21:45:01 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00C9E10E53E
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Mar 2023 21:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679694299; x=1711230299;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=U1dR3NOvzigFgvx/0qqTV4H2iPycfNJQ5BlTMe4OkOI=;
 b=AO6LYGTk3/m678TIKMMASI7+euURTYUwmASr3NPMdG6u6AP8NjbgArnu
 TJ9dAx1TrU15Fv5Mi6cSo3Akn2n21tS3BevwhERwTma+/t/ifcjP6Nuzj
 7pyWmdTeCpE2kZ2qcM8DNsjZEol4GQKsWhx1vXdnevYHsPciH33cv+1zU
 ZEL03m6VqmJ3RPc4E42SExo1rkMbVgX4fDSoAU9sgHEf85VACD7HaicGG
 n1fithZYzW77MPxK2cwxsr0tY/ng90XFLiQvwRXh2CoRlpN2aMyiSSzOt
 uSIjqs13kzRTvGfNYuh4GsmmICSLqlwLdxh60LPCHfiU8p02X6O9jAb47 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="339915182"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; d="scan'208";a="339915182"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2023 14:44:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="1012431335"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; d="scan'208";a="1012431335"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.252.38.175])
 ([10.252.38.175])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2023 14:44:57 -0700
Message-ID: <597e8c4c-bc78-bb19-a469-d280e2db09c0@linux.intel.com>
Date: Fri, 24 Mar 2023 22:44:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
References: <20230324210415.2434992-1-matthew.d.roper@intel.com>
 <20230324210415.2434992-3-matthew.d.roper@intel.com>
From: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
In-Reply-To: <20230324210415.2434992-3-matthew.d.roper@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH 2/6] drm/xe/pat: Use table-based programming
 of PAT settings
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


On 3/24/2023 10:04 PM, Matt Roper wrote:
> Provide per-platform tables of PAT values rather than per-platform
> functions.  This will simplify the handling of unicast vs MCR registers
> in the upcoming patches.
>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pat.c | 77 +++++++++++++++++--------------------
>   1 file changed, 35 insertions(+), 42 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> index bd64de956772..75d25e0c0b9a 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -15,34 +15,27 @@
>   #define GEN8_PPAT_UC			(0<<0)
>   #define GEN12_PPAT_CLOS(x)              ((x)<<2)
>   
> -static void tgl_setup_private_ppat(struct xe_gt *gt)
> -{
> -	/* TGL doesn't support LLC or AGE settings */


nit: the comment is lost now.

Reviewed-by: Nirmoy Das<nirmoy.das@intel.com>

> -	xe_mmio_write32(gt, GEN12_PAT_INDEX(0).reg, GEN8_PPAT_WB);
> -	xe_mmio_write32(gt, GEN12_PAT_INDEX(1).reg, GEN8_PPAT_WC);
> -	xe_mmio_write32(gt, GEN12_PAT_INDEX(2).reg, GEN8_PPAT_WT);
> -	xe_mmio_write32(gt, GEN12_PAT_INDEX(3).reg, GEN8_PPAT_UC);
> -	xe_mmio_write32(gt, GEN12_PAT_INDEX(4).reg, GEN8_PPAT_WB);
> -	xe_mmio_write32(gt, GEN12_PAT_INDEX(5).reg, GEN8_PPAT_WB);
> -	xe_mmio_write32(gt, GEN12_PAT_INDEX(6).reg, GEN8_PPAT_WB);
> -	xe_mmio_write32(gt, GEN12_PAT_INDEX(7).reg, GEN8_PPAT_WB);
> -}
> +const u32 tgl_pat_table[] = {
> +	[0] = GEN8_PPAT_WB,
> +	[1] = GEN8_PPAT_WC,
> +	[2] = GEN8_PPAT_WT,
> +	[3] = GEN8_PPAT_UC,
> +	[4] = GEN8_PPAT_WB,
> +	[5] = GEN8_PPAT_WB,
> +	[6] = GEN8_PPAT_WB,
> +	[7] = GEN8_PPAT_WB,
> +};
>   
> -static void pvc_setup_private_ppat(struct xe_gt *gt)
> -{
> -	xe_mmio_write32(gt, GEN12_PAT_INDEX(0).reg, GEN8_PPAT_UC);
> -	xe_mmio_write32(gt, GEN12_PAT_INDEX(1).reg, GEN8_PPAT_WC);
> -	xe_mmio_write32(gt, GEN12_PAT_INDEX(2).reg, GEN8_PPAT_WT);
> -	xe_mmio_write32(gt, GEN12_PAT_INDEX(3).reg, GEN8_PPAT_WB);
> -	xe_mmio_write32(gt, GEN12_PAT_INDEX(4).reg,
> -			GEN12_PPAT_CLOS(1) | GEN8_PPAT_WT);
> -	xe_mmio_write32(gt, GEN12_PAT_INDEX(5).reg,
> -			GEN12_PPAT_CLOS(1) | GEN8_PPAT_WB);
> -	xe_mmio_write32(gt, GEN12_PAT_INDEX(6).reg,
> -			GEN12_PPAT_CLOS(2) | GEN8_PPAT_WT);
> -	xe_mmio_write32(gt, GEN12_PAT_INDEX(7).reg,
> -			GEN12_PPAT_CLOS(2) | GEN8_PPAT_WB);
> -}
> +const u32 pvc_pat_table[] = {
> +	[0] = GEN8_PPAT_UC,
> +	[1] = GEN8_PPAT_WC,
> +	[2] = GEN8_PPAT_WT,
> +	[3] = GEN8_PPAT_WB,
> +	[4] = GEN12_PPAT_CLOS(1) | GEN8_PPAT_WT,
> +	[5] = GEN12_PPAT_CLOS(1) | GEN8_PPAT_WB,
> +	[6] = GEN12_PPAT_CLOS(2) | GEN8_PPAT_WT,
> +	[7] = GEN12_PPAT_CLOS(2) | GEN8_PPAT_WB,
> +};
>   
>   #define MTL_PPAT_L4_CACHE_POLICY_MASK   REG_GENMASK(3, 2)
>   #define MTL_PAT_INDEX_COH_MODE_MASK     REG_GENMASK(1, 0)
> @@ -53,27 +46,27 @@ static void pvc_setup_private_ppat(struct xe_gt *gt)
>   #define MTL_2_COH_1W    REG_FIELD_PREP(MTL_PAT_INDEX_COH_MODE_MASK, 2)
>   #define MTL_0_COH_NON   REG_FIELD_PREP(MTL_PAT_INDEX_COH_MODE_MASK, 0)
>   
> -static void mtl_setup_private_ppat(struct xe_gt *gt)
> -{
> -	xe_mmio_write32(gt, GEN12_PAT_INDEX(0).reg, MTL_PPAT_0_WB);
> -	xe_mmio_write32(gt, GEN12_PAT_INDEX(1).reg,
> -			MTL_PPAT_1_WT | MTL_2_COH_1W);
> -	xe_mmio_write32(gt, GEN12_PAT_INDEX(2).reg,
> -			MTL_PPAT_3_UC | MTL_2_COH_1W);
> -	xe_mmio_write32(gt, GEN12_PAT_INDEX(3).reg,
> -			MTL_PPAT_0_WB | MTL_2_COH_1W);
> -	xe_mmio_write32(gt, GEN12_PAT_INDEX(4).reg,
> -			MTL_PPAT_0_WB | MTL_3_COH_2W);
> -}
> +const u32 mtl_pat_table[] = {
> +	[0] = MTL_PPAT_0_WB,
> +	[1] = MTL_PPAT_1_WT | MTL_2_COH_1W,
> +	[2] = MTL_PPAT_3_UC | MTL_2_COH_1W,
> +	[3] = MTL_PPAT_0_WB | MTL_2_COH_1W,
> +	[4] = MTL_PPAT_0_WB | MTL_3_COH_2W,
> +};
> +
> +#define PROGRAM_PAT_UNICAST(gt, table) do { \
> +	for (int i = 0; i < ARRAY_SIZE(table); i++) \
> +		xe_mmio_write32(gt, GEN12_PAT_INDEX(i).reg, table[i]); \
> +} while (0)
>   
>   void xe_pat_init(struct xe_gt *gt)
>   {
>   	struct xe_device *xe = gt_to_xe(gt);
>   
>   	if (xe->info.platform == XE_METEORLAKE)
> -		mtl_setup_private_ppat(gt);
> +		PROGRAM_PAT_UNICAST(gt, mtl_pat_table);
>   	else if (xe->info.platform == XE_PVC)
> -		pvc_setup_private_ppat(gt);
> +		PROGRAM_PAT_UNICAST(gt, pvc_pat_table);
>   	else
> -		tgl_setup_private_ppat(gt);
> +		PROGRAM_PAT_UNICAST(gt, tgl_pat_table);
>   }
