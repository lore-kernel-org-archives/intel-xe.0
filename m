Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7B2BC6FD20
	for <intel-xe@archiver.kernel.org>; Fri, 24 Mar 2023 21:38:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF7C110E1A3;
	Fri, 24 Mar 2023 21:38:59 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C7E310E1A3
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Mar 2023 21:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679693937; x=1711229937;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=Mi1wRXggBemWNHPV9WSBNdbN+GFMBlSi+PFlZwBAcNw=;
 b=WzHw2i22mDI8vL4z0qMiUyigMCmdbIcvr3I67Bw2VeyROYgNf7yKW16m
 J+8wkgKsNqwr/8LpcjkLaviAaiqmfjzwi7N8lJ2pe7LbeEXgtO8q6yM/D
 4u4xP0ZxtyfjNLL96OjpyRgT4J4PjXxRl23vzQvTNumUKLJfADCFYy6RS
 c0Ll9rdhm/HIjatYiXrlKI3cZSSWLy019ZqthcBathky83sTrMzE8hiHf
 KNThIP8lM6sRvETg37bP1c32etTB6fNcWY3F1ePsl9B8vSJQSyXFUqwwF
 /I/9NLqYJST+Xo2q26qWYH49T4zSkYpMOeeg08hiXPcLrzf6VHw66DfLq g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="342282438"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; d="scan'208";a="342282438"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2023 14:38:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="928803295"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; d="scan'208";a="928803295"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.252.38.175])
 ([10.252.38.175])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2023 14:38:54 -0700
Message-ID: <88bab2b1-5d03-58bc-4ac8-dcb7c005d45e@linux.intel.com>
Date: Fri, 24 Mar 2023 22:38:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
References: <20230324210415.2434992-1-matthew.d.roper@intel.com>
 <20230324210415.2434992-5-matthew.d.roper@intel.com>
From: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
In-Reply-To: <20230324210415.2434992-5-matthew.d.roper@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH 4/6] drm/xe/pat: Clean up PAT register
 definitions
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
> Replace the deprecated "GEN" terminology in the PAT definitions.
>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>


Acked-by: Nirmoy Das<nirmoy.das@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_pat.c | 73 +++++++++++++++++++------------------
>   1 file changed, 38 insertions(+), 35 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> index f511d9a54358..142cf11b5914 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -10,49 +10,52 @@
>   
>   #define _PAT_INDEX(index)			(0x4800 + (index) * 4)
>   
> -#define GEN8_PPAT_WB			(3<<0)
> -#define GEN8_PPAT_WT			(2<<0)
> -#define GEN8_PPAT_WC			(1<<0)
> -#define GEN8_PPAT_UC			(0<<0)
> -#define GEN12_PPAT_CLOS(x)              ((x)<<2)
> +#define MTL_L4_POLICY_MASK			REG_GENMASK(3, 2)
> +#define MTL_PAT_3_UC				REG_FIELD_PREP(MTL_L4_POLICY_MASK, 3)
> +#define MTL_PAT_1_WT				REG_FIELD_PREP(MTL_L4_POLICY_MASK, 1)
> +#define MTL_PAT_0_WB				REG_FIELD_PREP(MTL_L4_POLICY_MASK, 0)
> +#define MTL_INDEX_COH_MODE_MASK			REG_GENMASK(1, 0)
> +#define MTL_3_COH_2W				REG_FIELD_PREP(MTL_INDEX_COH_MODE_MASK, 3)
> +#define MTL_2_COH_1W				REG_FIELD_PREP(MTL_INDEX_COH_MODE_MASK, 2)
> +#define MTL_0_COH_NON				REG_FIELD_PREP(MTL_INDEX_COH_MODE_MASK, 0)
> +
> +#define PVC_CLOS_LEVEL_MASK			REG_GENMASK(3, 2)
> +#define PVC_PAT_CLOS(x)				REG_FIELD_PREP(PVC_CLOS_LEVEL_MASK, x)
> +
> +#define TGL_MEM_TYPE_MASK			REG_GENMASK(1, 0)
> +#define TGL_PAT_WB				REG_FIELD_PREP(TGL_MEM_TYPE_MASK, 3)
> +#define TGL_PAT_WT				REG_FIELD_PREP(TGL_MEM_TYPE_MASK, 2)
> +#define TGL_PAT_WC				REG_FIELD_PREP(TGL_MEM_TYPE_MASK, 1)
> +#define TGL_PAT_UC				REG_FIELD_PREP(TGL_MEM_TYPE_MASK, 0)
>   
>   const u32 tgl_pat_table[] = {
> -	[0] = GEN8_PPAT_WB,
> -	[1] = GEN8_PPAT_WC,
> -	[2] = GEN8_PPAT_WT,
> -	[3] = GEN8_PPAT_UC,
> -	[4] = GEN8_PPAT_WB,
> -	[5] = GEN8_PPAT_WB,
> -	[6] = GEN8_PPAT_WB,
> -	[7] = GEN8_PPAT_WB,
> +	[0] = TGL_PAT_WB,
> +	[1] = TGL_PAT_WC,
> +	[2] = TGL_PAT_WT,
> +	[3] = TGL_PAT_UC,
> +	[4] = TGL_PAT_WB,
> +	[5] = TGL_PAT_WB,
> +	[6] = TGL_PAT_WB,
> +	[7] = TGL_PAT_WB,
>   };
>   
>   const u32 pvc_pat_table[] = {
> -	[0] = GEN8_PPAT_UC,
> -	[1] = GEN8_PPAT_WC,
> -	[2] = GEN8_PPAT_WT,
> -	[3] = GEN8_PPAT_WB,
> -	[4] = GEN12_PPAT_CLOS(1) | GEN8_PPAT_WT,
> -	[5] = GEN12_PPAT_CLOS(1) | GEN8_PPAT_WB,
> -	[6] = GEN12_PPAT_CLOS(2) | GEN8_PPAT_WT,
> -	[7] = GEN12_PPAT_CLOS(2) | GEN8_PPAT_WB,
> +	[0] = TGL_PAT_UC,
> +	[1] = TGL_PAT_WC,
> +	[2] = TGL_PAT_WT,
> +	[3] = TGL_PAT_WB,
> +	[4] = PVC_PAT_CLOS(1) | TGL_PAT_WT,
> +	[5] = PVC_PAT_CLOS(1) | TGL_PAT_WB,
> +	[6] = PVC_PAT_CLOS(2) | TGL_PAT_WT,
> +	[7] = PVC_PAT_CLOS(2) | TGL_PAT_WB,
>   };
>   
> -#define MTL_PPAT_L4_CACHE_POLICY_MASK   REG_GENMASK(3, 2)
> -#define MTL_PAT_INDEX_COH_MODE_MASK     REG_GENMASK(1, 0)
> -#define MTL_PPAT_3_UC   REG_FIELD_PREP(MTL_PPAT_L4_CACHE_POLICY_MASK, 3)
> -#define MTL_PPAT_1_WT   REG_FIELD_PREP(MTL_PPAT_L4_CACHE_POLICY_MASK, 1)
> -#define MTL_PPAT_0_WB   REG_FIELD_PREP(MTL_PPAT_L4_CACHE_POLICY_MASK, 0)
> -#define MTL_3_COH_2W    REG_FIELD_PREP(MTL_PAT_INDEX_COH_MODE_MASK, 3)
> -#define MTL_2_COH_1W    REG_FIELD_PREP(MTL_PAT_INDEX_COH_MODE_MASK, 2)
> -#define MTL_0_COH_NON   REG_FIELD_PREP(MTL_PAT_INDEX_COH_MODE_MASK, 0)
> -
>   const u32 mtl_pat_table[] = {
> -	[0] = MTL_PPAT_0_WB,
> -	[1] = MTL_PPAT_1_WT | MTL_2_COH_1W,
> -	[2] = MTL_PPAT_3_UC | MTL_2_COH_1W,
> -	[3] = MTL_PPAT_0_WB | MTL_2_COH_1W,
> -	[4] = MTL_PPAT_0_WB | MTL_3_COH_2W,
> +	[0] = MTL_PAT_0_WB,
> +	[1] = MTL_PAT_1_WT | MTL_2_COH_1W,
> +	[2] = MTL_PAT_3_UC | MTL_2_COH_1W,
> +	[3] = MTL_PAT_0_WB | MTL_2_COH_1W,
> +	[4] = MTL_PAT_0_WB | MTL_3_COH_2W,
>   };
>   
>   #define PROGRAM_PAT_UNICAST(gt, table) do { \
