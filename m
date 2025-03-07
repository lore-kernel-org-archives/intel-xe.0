Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE79CC19F32
	for <intel-xe@archiver.kernel.org>; Fri,  7 Mar 2025 15:34:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9539810EBC3;
	Fri,  7 Mar 2025 15:34:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bomq124y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6842C10EBC3
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Mar 2025 15:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741361652; x=1772897652;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=B69j1D6VudEYPBh5e8F677iglTD3Gr969/cKZzFjh3s=;
 b=Bomq124yuGU8kZVjL/UMOsenZrVQ78sadDDmE7QpbI3xfBNq/wYPenXw
 +hz0BJK3n4NOMq96YNIWuvsUrBjn7TNXoa/0HggblCWkGS0bvC6uYjmE5
 fR9q2Qhgb5XOcmjgkp4VmzHk5pVcmuSFMH6/e7evdmWKZ2XiogumL8XXj
 0Abx109MEO7W3EBNhcHhrFrmD4HUQAp2jpstyuXLwyaDBoSO/7hGEFQde
 wBTgdC6kwbTWCA8TD9r/WCWemB2c7JkOQtd2mImMkRuYz22744IvHzQuZ
 /ZYb/0PKaDk1jXSwu5GllgiDlgmJRoZE6S64Vyt+BsnKUetZkC+jMZCgX w==;
X-CSE-ConnectionGUID: foBzihLJQLKEdVfpxEvsTw==
X-CSE-MsgGUID: wfA8oC5VR0ezeZWTaNGIJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="41580753"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; d="scan'208";a="41580753"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 07:34:10 -0800
X-CSE-ConnectionGUID: eQXBWMaEQz+1IxfDi4QRwQ==
X-CSE-MsgGUID: XHMGpO3mQy29UHMndYQ7Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; d="scan'208";a="119343760"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa006.jf.intel.com with ESMTP; 07 Mar 2025 07:34:09 -0800
Received: from [10.245.83.181] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.83.181])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 91A2A34924;
 Fri,  7 Mar 2025 15:34:06 +0000 (GMT)
Message-ID: <8c91fcec-603e-4744-976b-ca431480c4fa@intel.com>
Date: Fri, 7 Mar 2025 16:34:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] drm/xe/guc: move KLV helpers to common file
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: John Harrison <John.C.Harrison@Intel.com>
References: <20250306005745.3520231-1-daniele.ceraolospurio@intel.com>
 <20250306005745.3520231-2-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250306005745.3520231-2-daniele.ceraolospurio@intel.com>
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



On 06.03.2025 01:57, Daniele Ceraolo Spurio wrote:
> The GuC uses the same format for all its KLVs, so having the functions
> to set them in a common file will allow us to re-use it for different
> types of KLVs and not just the WAs in ADS.
> The functions have also been reworked to avoid duplication and moved to
> using dword aligned offsets and sizes to match other functions in the same
> file.
> 
> The next patch will make use of these functions for a new H2G command.
> 
> v2: further rework code to have a single generic emission function, rename
> helpers (Michal)
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_ads.c         | 89 ++++++-------------------
>  drivers/gpu/drm/xe/xe_guc_klv_helpers.c | 45 +++++++++++++
>  drivers/gpu/drm/xe/xe_guc_klv_helpers.h | 19 ++++++
>  3 files changed, 84 insertions(+), 69 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index e7c9e095a19f..ec507d25ec72 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -22,6 +22,7 @@
>  #include "xe_guc.h"
>  #include "xe_guc_capture.h"
>  #include "xe_guc_ct.h"
> +#include "xe_guc_klv_helpers.h"
>  #include "xe_hw_engine.h"
>  #include "xe_lrc.h"
>  #include "xe_map.h"
> @@ -283,56 +284,6 @@ static size_t calculate_golden_lrc_size(struct xe_guc_ads *ads)
>  	return total_size;
>  }
>  
> -static void guc_waklv_enable_one_word(struct xe_guc_ads *ads,
> -				      enum xe_guc_klv_ids klv_id,
> -				      u32 value,
> -				      u32 *offset, u32 *remain)
> -{
> -	u32 size;
> -	u32 klv_entry[] = {
> -		/* 16:16 key/length */
> -		FIELD_PREP(GUC_KLV_0_KEY, klv_id) |
> -		FIELD_PREP(GUC_KLV_0_LEN, 1),
> -		value,
> -		/* 1 dword data */
> -	};
> -
> -	size = sizeof(klv_entry);
> -
> -	if (*remain < size) {
> -		drm_warn(&ads_to_xe(ads)->drm,
> -			 "w/a klv buffer too small to add klv id %d\n", klv_id);
> -	} else {
> -		xe_map_memcpy_to(ads_to_xe(ads), ads_to_map(ads), *offset,
> -				 klv_entry, size);
> -		*offset += size;
> -		*remain -= size;
> -	}
> -}
> -
> -static void guc_waklv_enable_simple(struct xe_guc_ads *ads,
> -				    enum xe_guc_klv_ids klv_id, u32 *offset, u32 *remain)
> -{
> -	u32 klv_entry[] = {
> -		/* 16:16 key/length */
> -		FIELD_PREP(GUC_KLV_0_KEY, klv_id) |
> -		FIELD_PREP(GUC_KLV_0_LEN, 0),
> -		/* 0 dwords data */
> -	};
> -	u32 size;
> -
> -	size = sizeof(klv_entry);
> -
> -	if (xe_gt_WARN(ads_to_gt(ads), *remain < size,
> -		       "w/a klv buffer too small to add klv id %d\n", klv_id))
> -		return;
> -
> -	xe_map_memcpy_to(ads_to_xe(ads), ads_to_map(ads), *offset,
> -			 klv_entry, size);
> -	*offset += size;
> -	*remain -= size;
> -}
> -
>  static void guc_waklv_init(struct xe_guc_ads *ads)
>  {
>  	struct xe_gt *gt = ads_to_gt(ads);
> @@ -343,22 +294,22 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
>  	remain = guc_ads_waklv_size(ads);
>  
>  	if (XE_WA(gt, 14019882105) || XE_WA(gt, 16021333562))
> -		guc_waklv_enable_simple(ads,
> -					GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED,
> -					&offset, &remain);
> +		xe_guc_klv_emit_nodata(ads_to_guc(ads), ads_to_map(ads),

since we need 'guc' and 'map' more than once, maybe we should declare
local vars for them to avoid repeat ads_to_guc(ads) and ads_to_map(ads)

> +				       GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED,
> +				       &offset, &remain);
>  	if (XE_WA(gt, 18024947630))
> -		guc_waklv_enable_simple(ads,
> -					GUC_WORKAROUND_KLV_ID_GAM_PFQ_SHADOW_TAIL_POLLING,
> -					&offset, &remain);
> +		xe_guc_klv_emit_nodata(ads_to_guc(ads), ads_to_map(ads),
> +				       GUC_WORKAROUND_KLV_ID_GAM_PFQ_SHADOW_TAIL_POLLING,
> +				       &offset, &remain);
>  	if (XE_WA(gt, 16022287689))
> -		guc_waklv_enable_simple(ads,
> -					GUC_WORKAROUND_KLV_ID_DISABLE_MTP_DURING_ASYNC_COMPUTE,
> -					&offset, &remain);
> +		xe_guc_klv_emit_nodata(ads_to_guc(ads), ads_to_map(ads),
> +				       GUC_WORKAROUND_KLV_ID_DISABLE_MTP_DURING_ASYNC_COMPUTE,
> +				       &offset, &remain);
>  
>  	if (XE_WA(gt, 14022866841))
> -		guc_waklv_enable_simple(ads,
> -					GUC_WA_KLV_WAKE_POWER_DOMAINS_FOR_OUTBOUND_MMIO,
> -					&offset, &remain);
> +		xe_guc_klv_emit_nodata(ads_to_guc(ads), ads_to_map(ads),
> +				       GUC_WA_KLV_WAKE_POWER_DOMAINS_FOR_OUTBOUND_MMIO,
> +				       &offset, &remain);
>  
>  	/*
>  	 * On RC6 exit, GuC will write register 0xB04 with the default value provided. As of now,
> @@ -366,15 +317,15 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
>  	 * future, so GuC depends on KMD to send it the correct value.
>  	 */
>  	if (XE_WA(gt, 13011645652))
> -		guc_waklv_enable_one_word(ads,
> -					  GUC_WA_KLV_NP_RD_WRITE_TO_CLEAR_RCSM_AT_CGP_LATE_RESTORE,
> -					  0xC40,
> -					  &offset, &remain);
> +		xe_guc_klv_emit_one_word(ads_to_guc(ads), ads_to_map(ads),
> +					 GUC_WA_KLV_NP_RD_WRITE_TO_CLEAR_RCSM_AT_CGP_LATE_RESTORE,
> +					 0xC40,
> +					 &offset, &remain);
>  
>  	if (XE_WA(gt, 14022293748) || XE_WA(gt, 22019794406))
> -		guc_waklv_enable_simple(ads,
> -					GUC_WORKAROUND_KLV_ID_BACK_TO_BACK_RCS_ENGINE_RESET,
> -					&offset, &remain);
> +		xe_guc_klv_emit_nodata(ads_to_guc(ads), ads_to_map(ads),
> +				       GUC_WORKAROUND_KLV_ID_BACK_TO_BACK_RCS_ENGINE_RESET,
> +				       &offset, &remain);
>  
>  	size = guc_ads_waklv_size(ads) - remain;
>  	if (!size)
> diff --git a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
> index 146a6eda9e06..74379c359d45 100644
> --- a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
> +++ b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
> @@ -7,8 +7,11 @@
>  #include <drm/drm_print.h>
>  
>  #include "abi/guc_klvs_abi.h"
> +#include "xe_gt_printk.h"
> +#include "xe_guc.h"
>  #include "xe_guc_klv_helpers.h"
>  #include "xe_guc_klv_thresholds_set.h"
> +#include "xe_map.h"
>  
>  #define make_u64(hi, lo) ((u64)((u64)(u32)(hi) << 32 | (u32)(lo)))
>  
> @@ -146,3 +149,45 @@ int xe_guc_klv_count(const u32 *klvs, u32 num_dwords)
>  
>  	return num_dwords ? -ENODATA : num_klvs;
>  }
> +
> +static void __klv_emit(struct xe_device *xe, struct iosys_map *map,
> +		       u32 *data, u32 size, u32 *offset, u32 *remain)

in this form, this function doesn't really look like related to KLV, so
maybe drop __klv prefix and move it to xe_map.h ?

> +{
> +	xe_map_memcpy_to(xe, map, *offset, data, size);
> +	*offset += size;
> +	*remain -= size;
> +}
> +
> +/**
> + * xe_guc_klv_emit - Emits a KLV to an iosys mapped buffer
> + * @guc: the guc structure
> + * @map: the iosys_map to write to
> + * @key: the KLV to enable
> + * @data: pointer to the data for the KLV (can be NULL)
> + * @data_size: size of the data for the KLV (MBZ if data is NULL)
> + * @offset: pointer to a variable holding the offset to write to
> + * @remain: pointer to a variable holding the available writing space
> + *
> + * The function checks if there is enough space to emit the KLV and if so
> + * writes it to memory. After the write, the offset and remain variables
> + * are respectively increased and decreased of the written size to be ready for
> + * the next emission.
> + */
> +void xe_guc_klv_emit(struct xe_guc *guc, struct iosys_map *map, u16 key,
> +		     void *data, u32 data_size, u32 *offset, u32 *remain)
> +{
> +	struct xe_device *xe = guc_to_xe(guc);
> +	u32 klv_entry = PREP_GUC_KLV(key, data_size / sizeof(u32));
> +
> +	/* GuC expects an array of u32s */
> +	xe_assert(guc_to_xe(guc), !(data_size % sizeof(u32)));

no need for guc_to_xe(guc) as you already have xe

but maybe better to use xe_gt_assert() here

and use
	IS_ALIGNED(data_size, sizeof(u32))
if you insist on passing data size in bytes

> +
> +	if (xe_gt_WARN(guc_to_gt(guc), *remain < (sizeof(klv_entry) + data_size),

having too small output buffer looks like our programming error, so
maybe xe_gt_assert/_msg() will be sufficient?

> +		       "KLV buffer too small to add klv id 0x%04x\n", key))
> +		return;
> +
> +	__klv_emit(xe, map, &klv_entry, sizeof(klv_entry), offset, remain);
> +
> +	if (data_size)
> +		__klv_emit(xe, map, data, data_size, offset, remain);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_guc_klv_helpers.h b/drivers/gpu/drm/xe/xe_guc_klv_helpers.h
> index c676d21c173b..72b33e5019de 100644
> --- a/drivers/gpu/drm/xe/xe_guc_klv_helpers.h
> +++ b/drivers/gpu/drm/xe/xe_guc_klv_helpers.h
> @@ -10,6 +10,8 @@
>  #include <linux/types.h>
>  
>  struct drm_printer;
> +struct iosys_map;
> +struct xe_guc;
>  
>  const char *xe_guc_klv_key_to_string(u16 key);
>  
> @@ -61,4 +63,21 @@ int xe_guc_klv_count(const u32 *klvs, u32 num_dwords);
>  #define PREP_GUC_KLV_TAG(TAG) \
>  	PREP_GUC_KLV_CONST(MAKE_GUC_KLV_KEY(TAG), MAKE_GUC_KLV_LEN(TAG))
>  
> +void xe_guc_klv_emit(struct xe_guc *guc, struct iosys_map *map, u16 key,
> +		     void *data, u32 data_size, u32 *offset, u32 *remain);
> +
> +static inline void
> +xe_guc_klv_emit_nodata(struct xe_guc *guc, struct iosys_map *map,
> +		       u16 key, u32 *offset, u32 *remain)
> +{
> +	return xe_guc_klv_emit(guc, map, key, NULL, 0, offset, remain);
> +}
> +
> +static inline void
> +xe_guc_klv_emit_one_word(struct xe_guc *guc, struct iosys_map *map,
> +			 u16 key, u32 value, u32 *offset, u32 *remain)
> +{
> +	return xe_guc_klv_emit(guc, map, key, &value, sizeof(u32), offset, remain);
> +}
> +
>  #endif

