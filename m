Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EF94CD11C2
	for <intel-xe@archiver.kernel.org>; Wed, 10 Apr 2024 15:47:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD37D1125A0;
	Wed, 10 Apr 2024 15:47:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NlMB9+Vu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50D1810ED03
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Apr 2024 15:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712764036; x=1744300036;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=QskQrD2SS0wSFZEHgRSudqT9jaUwbFbe3CY4Zw3PYPs=;
 b=NlMB9+VuGfEJpFNKlg8jY5X7MxzEdLWmznHYF2BC+vhQtChBsHqJ32dC
 N/6iUdAZePNLvSDvhe3R1EsOkaiKEP1148L7oQ5ojo/6HTEWSLZuslE9J
 C5l1OAQA9vc2yPBa/1leFObueyOp/i0r9cvvTTfUSK7mudZ+f2KWM8RTn
 0S/20Oe4CNnGniTapV7LLM98eGepV77zyKXFg6GWDxoTHLE39+BgsPPri
 0TQPQNnU5QGc5vuDmYxMIc0xB3OzEj8oLEqFmDEJLE9/nkmzaLl0TkLzu
 8TPDFKc3Z21+6aSQNBdWEoXyc1ZKuTRtiYa44UNO3W83m0JnREZN0TdsY w==;
X-CSE-ConnectionGUID: UeA4rRdDRa6qLYsbcvatHQ==
X-CSE-MsgGUID: sAJzmSmfRWmete8Xf6wlpQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="7988734"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="7988734"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 08:47:16 -0700
X-CSE-ConnectionGUID: zva6EfXgTTiQst/Msa0Ing==
X-CSE-MsgGUID: xOWpP3/JTpeEqAvlbwuZ8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="43859526"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa002.fm.intel.com with ESMTP; 10 Apr 2024 08:47:14 -0700
Received: from [10.252.42.161] (mwajdecz-MOBL.ger.corp.intel.com
 [10.252.42.161])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 1677F2FC4F;
 Wed, 10 Apr 2024 16:47:12 +0100 (IST)
Message-ID: <72afa21e-e7ec-4497-a771-6901a7f44fe8@intel.com>
Date: Wed, 10 Apr 2024 17:47:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] drm/xe/guc: Add helpers for GuC KLVs
Content-Language: en-US
To: =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Cc: intel-xe@lists.freedesktop.org,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
References: <20240410123125.1155-1-michal.wajdeczko@intel.com>
 <20240410123125.1155-5-michal.wajdeczko@intel.com>
 <20240410153057.gevtuk53n6vifc3f@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240410153057.gevtuk53n6vifc3f@intel.com>
Content-Type: text/plain; charset=UTF-8
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



On 10.04.2024 17:30, Piotr Piórkowski wrote:
> Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on śro [2024-kwi-10 14:31:24 +0200]:
>> Many of the GuC actions use KLVs to pass additional parameters or
>> configuration data. Add few helper functions for better reporting
>> any information related to KLVs.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>> v2: review comments from Himal
>> ---
>>  drivers/gpu/drm/xe/Makefile             |   1 +
>>  drivers/gpu/drm/xe/xe_guc_klv_helpers.c | 134 ++++++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_guc_klv_helpers.h |  51 +++++++++
>>  3 files changed, 186 insertions(+)
>>  create mode 100644 drivers/gpu/drm/xe/xe_guc_klv_helpers.c
>>  create mode 100644 drivers/gpu/drm/xe/xe_guc_klv_helpers.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index 8d79df05b84f..ad238f48cf51 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -98,6 +98,7 @@ xe-y += xe_bb.o \
>>  	xe_guc_debugfs.o \
>>  	xe_guc_hwconfig.o \
>>  	xe_guc_id_mgr.o \
>> +	xe_guc_klv_helpers.o \
>>  	xe_guc_log.o \
>>  	xe_guc_pc.o \
>>  	xe_guc_submit.o \
>> diff --git a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
>> new file mode 100644
>> index 000000000000..8927374f55ff
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
>> @@ -0,0 +1,134 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2024 Intel Corporation
>> + */
>> +
>> +#include <linux/bitfield.h>
>> +#include <drm/drm_print.h>
>> +
>> +#include "abi/guc_klvs_abi.h"
>> +#include "xe_guc_klv_helpers.h"
>> +
>> +#define make_u64(hi, lo) ((u64)((u64)(u32)(hi) << 32 | (u32)(lo)))
>> +
> 
> This is the second such macro in Xe - maybe it would be worth moving
> it to a common header somewhere ?

it's complicated

this macro here is (I hope) just temporary as either:
  - it will be promoted to xe_macros.h [1], or
  - something similar will be available in wordpart.h [2]

[1] https://patchwork.freedesktop.org/series/129854/

[2]
https://lore.kernel.org/lkml/20240214214654.1700-1-michal.wajdeczko@intel.com/

> 
> 
>> +/**
>> + * xe_guc_klv_key_to_string - Convert KLV key into friendly name.
>> + * @key: the `GuC KLV`_ key
>> + *
>> + * Return: name of the KLV key.
>> + */
>> +const char *xe_guc_klv_key_to_string(u16 key)
>> +{
>> +	switch (key) {
>> +	/* VGT POLICY keys */
>> +	case GUC_KLV_VGT_POLICY_SCHED_IF_IDLE_KEY:
>> +		return "sched_if_idle";
>> +	case GUC_KLV_VGT_POLICY_ADVERSE_SAMPLE_PERIOD_KEY:
>> +		return "sample_period";
>> +	case GUC_KLV_VGT_POLICY_RESET_AFTER_VF_SWITCH_KEY:
>> +		return "reset_engine";
>> +	/* VF CFG keys */
>> +	case GUC_KLV_VF_CFG_GGTT_START_KEY:
>> +		return "ggtt_start";
>> +	case GUC_KLV_VF_CFG_GGTT_SIZE_KEY:
>> +		return "ggtt_size";
>> +	case GUC_KLV_VF_CFG_LMEM_SIZE_KEY:
>> +		return "lmem_size";
>> +	case GUC_KLV_VF_CFG_NUM_CONTEXTS_KEY:
>> +		return "num_contexts";
>> +	case GUC_KLV_VF_CFG_TILE_MASK_KEY:
>> +		return "tile_mask";
>> +	case GUC_KLV_VF_CFG_NUM_DOORBELLS_KEY:
>> +		return "num_doorbells";
>> +	case GUC_KLV_VF_CFG_EXEC_QUANTUM_KEY:
>> +		return "exec_quantum";
>> +	case GUC_KLV_VF_CFG_PREEMPT_TIMEOUT_KEY:
>> +		return "preempt_timeout";
>> +	case GUC_KLV_VF_CFG_BEGIN_DOORBELL_ID_KEY:
>> +		return "begin_db_id";
>> +	case GUC_KLV_VF_CFG_BEGIN_CONTEXT_ID_KEY:
>> +		return "begin_ctx_id";
>> +	default:
>> +		return "(unknown)";
>> +	}
>> +}
>> +
>> +/**
>> + * xe_guc_klv_print - Print content of the buffer with `GuC KLV`_.
>> + * @klvs: the buffer with KLVs
>> + * @num_dwords: number of dwords (u32) available in the buffer
>> + * @p: the &drm_printer
>> + *
>> + * The buffer may contain more than one KLV.
>> + */
>> +void xe_guc_klv_print(const u32 *klvs, u32 num_dwords, struct drm_printer *p)
>> +{
>> +	while (num_dwords >= GUC_KLV_LEN_MIN) {
>> +		u32 key = FIELD_GET(GUC_KLV_0_KEY, klvs[0]);
>> +		u32 len = FIELD_GET(GUC_KLV_0_LEN, klvs[0]);
> 
> u16 is probably sufficient in this case,
> especially since you use u16 in xe_guc_klv_key_to_string() also for the
> same key.

but base KLV unit is u32 so IMO better to start with that
and for the compiler likely it doesn't matter

>> +
>> +		klvs += GUC_KLV_LEN_MIN;
>> +		num_dwords -= GUC_KLV_LEN_MIN;
>> +
>> +		if (num_dwords < len) {
>> +			drm_printf(p, "{ key %#06x : truncated %zu of %zu bytes %*ph } # %s\n",
>> +				   key, num_dwords * sizeof(u32), len * sizeof(u32),
>> +				   (int)(num_dwords * sizeof(u32)), klvs,
>> +				   xe_guc_klv_key_to_string(key));
>> +			return;
>> +		}
>> +
>> +		switch (len) {
>> +		case 0:
>> +			drm_printf(p, "{ key %#06x : no value } # %s\n",
>> +				   key, xe_guc_klv_key_to_string(key));
>> +			break;
>> +		case 1:
>> +			drm_printf(p, "{ key %#06x : 32b value %u } # %s\n",
>> +				   key, klvs[0], xe_guc_klv_key_to_string(key));
>> +			break;
>> +		case 2:
>> +			drm_printf(p, "{ key %#06x : 64b value %#llx } # %s\n",
>> +				   key, make_u64(klvs[1], klvs[0]),
>> +				   xe_guc_klv_key_to_string(key));
>> +			break;
>> +		default:
>> +			drm_printf(p, "{ key %#06x : %zu bytes %*ph } # %s\n",
>> +				   key, len * sizeof(u32), (int)(len * sizeof(u32)),
>> +				   klvs, xe_guc_klv_key_to_string(key));
>> +			break;
>> +		}
>> +
>> +		klvs += len;
>> +		num_dwords -= len;
>> +	}
>> +
>> +	/* we don't expect any leftovers, fix if KLV header is ever changed */
>> +	BUILD_BUG_ON(GUC_KLV_LEN_MIN > 1);
>> +}
>> +
>> +/**
>> + * xe_guc_klv_count - Count KLVs present in the buffer.
>> + * @klvs: the buffer with KLVs
>> + * @num_dwords: number of dwords (u32) in the buffer
>> + *
>> + * Return: number of recognized KLVs or
>> + *          a negative error code if KLV buffer is truncated.
> 
> ident too large by one space - I do not know if it is not allowed, but it catches my eye :)

good catch, had to double check to see it
will fix while pushing

> 
>> + */
>> +int xe_guc_klv_count(const u32 *klvs, u32 num_dwords)
>> +{
>> +	int num_klvs = 0;
>> +
>> +	while (num_dwords >= GUC_KLV_LEN_MIN) {
>> +		u32 len = FIELD_GET(GUC_KLV_0_LEN, klvs[0]);
>> +
>> +		if (num_dwords < len + GUC_KLV_LEN_MIN)
>> +			break;
>> +
>> +		klvs += GUC_KLV_LEN_MIN + len;
>> +		num_dwords -= GUC_KLV_LEN_MIN + len;
>> +		num_klvs++;
>> +	}
>> +
>> +	return num_dwords ? -ENODATA : num_klvs;
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_guc_klv_helpers.h b/drivers/gpu/drm/xe/xe_guc_klv_helpers.h
>> new file mode 100644
>> index 000000000000..b835e0ebe6db
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_guc_klv_helpers.h
>> @@ -0,0 +1,51 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2024 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_GUC_KLV_HELPERS_H_
>> +#define _XE_GUC_KLV_HELPERS_H_
>> +
>> +#include <linux/types.h>
>> +
>> +struct drm_printer;
>> +
>> +const char *xe_guc_klv_key_to_string(u16 key);
>> +
>> +void xe_guc_klv_print(const u32 *klvs, u32 num_dwords, struct drm_printer *p);
>> +int xe_guc_klv_count(const u32 *klvs, u32 num_dwords);
>> +
>> +/**
>> + * PREP_GUC_KLV - Prepare KLV header value based on provided key and len.
>> + * @key: KLV key
>> + * @len: KLV length
>> + *
>> + * Return: value of the KLV header (u32).
>> + */
>> +#define PREP_GUC_KLV(key, len) \
>> +	(FIELD_PREP(GUC_KLV_0_KEY, (key)) | \
>> +	 FIELD_PREP(GUC_KLV_0_LEN, (len)))
>> +
>> +/**
>> + * PREP_GUC_KLV_CONST - Prepare KLV header value based on const key and len.
>> + * @key: const KLV key
>> + * @len: const KLV length
>> + *
>> + * Return: value of the KLV header (u32).
>> + */
>> +#define PREP_GUC_KLV_CONST(key, len) \
>> +	(FIELD_PREP_CONST(GUC_KLV_0_KEY, (key)) | \
>> +	 FIELD_PREP_CONST(GUC_KLV_0_LEN, (len)))
>> +
>> +/**
>> + * PREP_GUC_KLV_TAG - Prepare KLV header value based on unique KLV definition tag.
>> + * @TAG: unique tag of the KLV definition
>> + *
>> + * Combine separate KEY and LEN definitions of the KLV identified by the TAG.
>> + *
>> + * Return: value of the KLV header (u32).
>> + */
>> +#define PREP_GUC_KLV_TAG(TAG) \
>> +	PREP_GUC_KLV_CONST(GUC_KLV_##TAG##_KEY, GUC_KLV_##TAG##_LEN)
>> +
>> +#endif
> 
> Only minor comments, besides LGTM:
> Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

thanks,
Michal

> 
>> -- 
>> 2.43.0
>>
> 
