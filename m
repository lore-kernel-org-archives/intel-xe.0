Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BA14C54E58
	for <intel-xe@archiver.kernel.org>; Mon, 25 Mar 2024 15:32:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B855010E98F;
	Mon, 25 Mar 2024 15:32:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WsL7eW3+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CCA110E98E
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Mar 2024 15:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711380772; x=1742916772;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=FlTExfdS+zO6BBa9fK9nKQs90/zYF7TQMADhU/j6Wds=;
 b=WsL7eW3+UZTdvMMujJELaf1RpMkxjWEcgEKINU+9751S3YTrcvkI9VlJ
 cdwgYFw9bJspolvBCnNgpGVNWzS3P5Q69MqhZTs0ljf19UMPx7hSvR/6F
 jEJXc/L2Irwx3LsJ6LJg0D+k1YzGW1r314pYXFqnhq82jdgRV1qCKa7Q7
 RSmXQpfQA70ZQR2JYf86budnFtM07eFTt/ghRnAwoHtnmWLtEg2cwO6au
 TctyB9zpWpW5O15z5jot1x9yHZRqBzBH+hiO/Rr9KNI5mKRFUaUn0cH0L
 lu9LctbonZdzQF6y+koic8o+8xqhocaVWFIfqakFF5RLsgBr07Z5iERKZ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="10166193"
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="10166193"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 08:32:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="53121789"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa001.jf.intel.com with ESMTP; 25 Mar 2024 08:32:49 -0700
Received: from [10.249.156.183] (unknown [10.249.156.183])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 3633E28788;
 Mon, 25 Mar 2024 15:32:47 +0000 (GMT)
Message-ID: <29f52749-032e-469e-9cae-cad1f01896fd@intel.com>
Date: Mon, 25 Mar 2024 16:32:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] drm/xe/lnl: Enable GuC Wa_14019882105
Content-Language: en-US
To: Badal Nilawar <badal.nilawar@intel.com>, intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, lucas.demarchi@intel.com,
 john.c.harrison@intel.com, matthew.d.roper@intel.com,
 daniele.ceraolospurio@intel.com
References: <20240325150435.2967536-1-badal.nilawar@intel.com>
 <20240325150435.2967536-3-badal.nilawar@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240325150435.2967536-3-badal.nilawar@intel.com>
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



On 25.03.2024 16:04, Badal Nilawar wrote:
> Enable GuC Wa_14019882105 to block interrupts during C6 flow
> when the memory path has been blocked
> 
> v2: Make helper function generic and name it as
>     guc_waklv_enable_simple (John Harrison)
> v3: Make warning descriptive (John Harrison)
> 
> Cc: John Harrison <john.harrison@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>  drivers/gpu/drm/xe/abi/guc_klvs_abi.h |  7 +++++
>  drivers/gpu/drm/xe/xe_guc_ads.c       | 41 +++++++++++++++++++++------
>  drivers/gpu/drm/xe/xe_wa_oob.rules    |  1 +
>  3 files changed, 40 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> index 0400bc0fccdc..5dd45e06f0b6 100644
> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> @@ -319,4 +319,11 @@ enum  {
>  #define GUC_KLV_VF_CFG_BEGIN_CONTEXT_ID_KEY	0x8a0b
>  #define GUC_KLV_VF_CFG_BEGIN_CONTEXT_ID_LEN	1u
>  
> +/*
> + * Workaround keys:
> + */
> +enum xe_guc_klv_ids {
> +	GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED				= 0x9002,

how should we know the LEN of the particular W/A KLV ?
as this is the ABI header, IMO we should define that here along the KEY

> +};
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index a98344a0ff4b..633e5fd9c738 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -7,6 +7,8 @@
>  
>  #include <drm/drm_managed.h>
>  
> +#include <generated/xe_wa_oob.h>
> +
>  #include "regs/xe_engine_regs.h"
>  #include "regs/xe_gt_regs.h"
>  #include "regs/xe_guc_regs.h"
> @@ -19,6 +21,7 @@
>  #include "xe_map.h"
>  #include "xe_mmio.h"
>  #include "xe_platform_types.h"
> +#include "xe_wa.h"
>  
>  /* Slack of a few additional entries per engine */
>  #define ADS_REGSET_EXTRA_MAX	8
> @@ -279,23 +282,43 @@ static size_t calculate_golden_lrc_size(struct xe_guc_ads *ads)
>  	return total_size;
>  }
>  
> +static void guc_waklv_enable_simple(struct xe_guc_ads *ads,
> +				    enum xe_guc_klv_ids klv_id, u32 *offset, u32 *remain)
> +{
> +	u32 size;
> +	u32 klv_entry[] = {
> +		/* 16:16 key/length */

drop this comment, code is self explanatory

> +		FIELD_PREP(GUC_KLV_0_KEY, klv_id) |
> +		FIELD_PREP(GUC_KLV_0_LEN, 0),
> +		/* 0 dwords data */
> +	};

you can define size here:

		u32 size = sizeof(klv_entry);

> +
> +	size = sizeof(klv_entry);
> +
> +	if (*remain < size) {
> +		drm_warn(&ads_to_xe(ads)->drm,
> +			 "w/a klv buffer too small to add klv id %d\n", klv_id);

this looks like our programming error so xe_gt_assert() should be
sufficient as we don't expect this ever happen in production

but if you want to keep the WARN then use xe_gt_WARN() instead

> +	} else {
> +		xe_map_memcpy_to(ads_to_xe(ads), ads_to_map(ads), *offset,
> +				 klv_entry, size);
> +		*offset += size;
> +		*remain -= size;
> +	}
> +}
> +
>  static void guc_waklv_init(struct xe_guc_ads *ads)
>  {
> +	struct xe_gt *gt = ads_to_gt(ads);
>  	u64 addr_ggtt;
>  	u32 offset, remain, size;
>  
>  	offset = guc_ads_waklv_offset(ads);
>  	remain = guc_ads_waklv_size(ads);
>  
> -	/*
> -	 * Add workarounds here:
> -	 *
> -	 * if (want_wa_<name>) {
> -	 *      size = guc_waklv_<name>(guc, offset, remain);
> -	 *      offset += size;
> -	 *      remain -= size;
> -	 * }
> -	 */
> +	if (XE_WA(gt, 14019882105))
> +		guc_waklv_enable_simple(ads,
> +					GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED,
> +					&offset, &remain);

hmm, it looks that your implementation here in patch 2/2 is different
than suggested one in patch 1/2

>  
>  	size = guc_ads_waklv_size(ads) - remain;
>  	if (!size)
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index 48cdba1cbf95..a8d15f004b6c 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -19,3 +19,4 @@
>  		GRAPHICS_VERSION_RANGE(1270, 1274)
>  		MEDIA_VERSION(1300)
>  		PLATFORM(DG2)
> +14019882105	GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0)
