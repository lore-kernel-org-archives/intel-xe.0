Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B640DCD1284
	for <intel-xe@archiver.kernel.org>; Tue,  9 Apr 2024 09:35:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47B70112C0A;
	Tue,  9 Apr 2024 09:35:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n6CBrUa6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85841112C0A
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Apr 2024 09:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712655341; x=1744191341;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=I3C6ZKHu0Un3WiZUQgrXgXGcE3IziOpLDqJFqrwM4e8=;
 b=n6CBrUa6RRod/mB9eBkdKjmBQaJATkVR3AA65Z/IhVvkBpVVIjETXW1l
 2CsZd57g7NnI8KHPMLNPHK5j7tP7PQfJw9eqReRMCu68svX6FQ94yQQZY
 sCN4bLKerKpHSrP8mXKF/3ZoZsI6G6WUdxqhjCySS2dXFQe6lDPpk78Ge
 aHzPVGB4ay9r1sLQnEI19vU1JnaKW6ntMaVjx8sLWxvufZA0N9yHlrLyY
 2lZWD6Dgd1qBlWYzaQ2lNEfyyPtmvRwypqr8//n/FpDrnEJOWC0p5gnWx
 ir+lgzFR53i0SFsYlWDIei13x+5CnESCkg455+p2v9EAYGGbLqvLNj0/b w==;
X-CSE-ConnectionGUID: mm7TQxQvRxSm/3mJQ0zujw==
X-CSE-MsgGUID: tJycWnuQTLa/gUbvFEfOUg==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="8140013"
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; 
   d="scan'208";a="8140013"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 02:35:37 -0700
X-CSE-ConnectionGUID: Y+fn7tK+RtOtGecKioX1xQ==
X-CSE-MsgGUID: MSm90RtPQdqrB96oqVTmfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; d="scan'208";a="51366546"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa001.fm.intel.com with ESMTP; 09 Apr 2024 02:35:35 -0700
Received: from [10.249.158.230] (unknown [10.249.158.230])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 5145B27BBC;
 Tue,  9 Apr 2024 10:35:28 +0100 (IST)
Message-ID: <7f96ad9c-e16c-49ff-bb7f-ad9ad37f9a1c@intel.com>
Date: Tue, 9 Apr 2024 11:35:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/guc: Add helpers for GuC KLVs
Content-Language: en-US
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20240408181408.1023-1-michal.wajdeczko@intel.com>
 <20240408181408.1023-2-michal.wajdeczko@intel.com>
 <7ebc9a2e-e876-4471-aa26-c31f1d2e4ed7@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <7ebc9a2e-e876-4471-aa26-c31f1d2e4ed7@intel.com>
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



On 08.04.2024 22:23, Ghimiray, Himal Prasad wrote:
> 
> On 08-04-2024 23:44, Michal Wajdeczko wrote:
>> Many of the GuC actions use KLVs to pass additional parameters or
>> configuration data. Add few helper functions for better reporting
>> any information related to KLVs.
>>
>> Signed-off-by: Michal Wajdeczko<michal.wajdeczko@intel.com>
>> ---
>>   drivers/gpu/drm/xe/Makefile             |   1 +
>>   drivers/gpu/drm/xe/xe_guc_klv_helpers.c | 133 ++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_guc_klv_helpers.h |  51 +++++++++
>>   3 files changed, 185 insertions(+)
>>   create mode 100644 drivers/gpu/drm/xe/xe_guc_klv_helpers.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_guc_klv_helpers.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index e5b1715f721e..ec0d1fb49b1e 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -98,6 +98,7 @@ xe-y += xe_bb.o \
>>       xe_guc_debugfs.o \
>>       xe_guc_hwconfig.o \
>>       xe_guc_id_mgr.o \
>> +    xe_guc_klv_helpers.o \
>>       xe_guc_log.o \
>>       xe_guc_pc.o \
>>       xe_guc_submit.o \
>> diff --git a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
>> b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
>> new file mode 100644
>> index 000000000000..c39fda08afcb
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
>> @@ -0,0 +1,133 @@
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
> 
> is this macro necessary, it's being called in one place ?
> 
> ((u64)hi << 32) | lo  should be enough.

IMO it is better to have a macro (with name) than a magic formula
besides, this macro here is (I hope) just temporary as either:
 - it will be promoted to xe_macros.h [1], or
 - something similar will be available in wordpart.h [2]

[1] https://patchwork.freedesktop.org/series/129854/

[2]
https://lore.kernel.org/lkml/20240214214654.1700-1-michal.wajdeczko@intel.com/

> 
>> +
>> +/**
>> + * xe_guc_klv_key_to_string - Convert KLV key into friendly name.
>> + * @key: the `GuC KLV`_ key
>> + *
>> + * Return: name of the KLV key.
>> + */
>> +const char *xe_guc_klv_key_to_string(u16 key)
>> +{
>> +    switch (key) {
>> +    /* VGT POLICY keys */
>> +    case GUC_KLV_VGT_POLICY_SCHED_IF_IDLE_KEY:
>> +        return "sched_if_idle";
>> +    case GUC_KLV_VGT_POLICY_ADVERSE_SAMPLE_PERIOD_KEY:
>> +        return "sample_period";
>> +    case GUC_KLV_VGT_POLICY_RESET_AFTER_VF_SWITCH_KEY:
>> +        return "reset_engine";
>> +    /* VF CFG keys */
>> +    case GUC_KLV_VF_CFG_GGTT_START_KEY:
>> +        return "ggtt_start";
>> +    case GUC_KLV_VF_CFG_GGTT_SIZE_KEY:
>> +        return "ggtt_size";
>> +    case GUC_KLV_VF_CFG_LMEM_SIZE_KEY:
>> +        return "lmem_size";
>> +    case GUC_KLV_VF_CFG_NUM_CONTEXTS_KEY:
>> +        return "num_contexts";
>> +    case GUC_KLV_VF_CFG_TILE_MASK_KEY:
>> +        return "tile_mask";
>> +    case GUC_KLV_VF_CFG_NUM_DOORBELLS_KEY:
>> +        return "num_doorbells";
>> +    case GUC_KLV_VF_CFG_EXEC_QUANTUM_KEY:
>> +        return "exec_quantum";
>> +    case GUC_KLV_VF_CFG_PREEMPT_TIMEOUT_KEY:
>> +        return "preempt_timeout";
>> +    case GUC_KLV_VF_CFG_BEGIN_DOORBELL_ID_KEY:
>> +        return "begin_db_id";
>> +    case GUC_KLV_VF_CFG_BEGIN_CONTEXT_ID_KEY:
>> +        return "begin_ctx_id";
> 
> default:
> 
> return "(unknown)";
> 
> Have seen warning/errors if default is not defined in switch-case.

likely compiler was complaining because of enum being used in switch
statement, but here it is u16, so there shouldn't be any warnings

but can add 'default' case if you consider that as a blocker

> 
>> +    }
>> +    return "(unknown)";
> remove.
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
>> +void xe_guc_klv_print(const u32 *klvs, u32 num_dwords, struct
>> drm_printer *p)
>> +{
>> +    while (num_dwords >= GUC_KLV_LEN_MIN) {
>> +        u32 key = FIELD_GET(GUC_KLV_0_KEY, klvs[0]);
>> +        u32 len = FIELD_GET(GUC_KLV_0_LEN, klvs[0]);
>> +
>> +        klvs += GUC_KLV_LEN_MIN;
>> +        num_dwords -= GUC_KLV_LEN_MIN;
>> +
>> +        if (num_dwords < len) {
>> +            drm_printf(p, "{ key %#06x : truncated %zu of %zu bytes
>> %*ph } # %s\n",
>> +                   key, num_dwords * sizeof(u32), len * sizeof(u32),
>> +                   (int)(num_dwords * sizeof(u32)), klvs,
>> +                   xe_guc_klv_key_to_string(key));
>> +            return;
>> +        }
>> +
>> +        switch (len) {
>> +        case 0:
>> +            drm_printf(p, "{ key %#06x : no value } # %s\n",
>> +                   key, xe_guc_klv_key_to_string(key));
>> +            break;
>> +        case 1:
>> +            drm_printf(p, "{ key %#06x : 32b value %u } # %s\n",
>> +                   key, klvs[0], xe_guc_klv_key_to_string(key));
>> +            break;
>> +        case 2:
>> +            drm_printf(p, "{ key %#06x : 64b value %#llx } # %s\n",
>> +                   key, make_u64(klvs[1], klvs[0]),
>> +                   xe_guc_klv_key_to_string(key));
>> +            break;
>> +        default:
>> +            drm_printf(p, "{ key %#06x : %zu bytes %*ph } # %s\n",
>> +                   key, len * sizeof(u32), (int)(len * sizeof(u32)),
>> +                   klvs, xe_guc_klv_key_to_string(key));
>> +            break;
>> +        }
>> +
>> +        klvs += len;
>> +        num_dwords -= len;
>> +    }
>> +
>> +    /* we don't expect any leftovers, fix if KLV header is ever
>> changed */
>> +    BUILD_BUG_ON(GUC_KLV_LEN_MIN > 1);
>> +}
>> +
>> +/**
>> + * xe_guc_klv_count - Count KLVs present in the buffer.
>> + * @klvs: the buffer with KLVs
>> + * @num_dwords: number of dwords (u32) in the buffer
>> + *
>> + * Return: number of recognized KLVs or
>> + *          a negative error code if KLV buffer is truncated.

see here ^^^

>> + */
>> +int xe_guc_klv_count(const u32 *klvs, u32 num_dwords)
>> +{
>> +    int num_klvs = 0;
>> +
>> +    while (num_dwords >= GUC_KLV_LEN_MIN) {
>> +        u32 len = FIELD_GET(GUC_KLV_0_LEN, klvs[0]);
>> +
>> +        if (num_dwords < len + GUC_KLV_LEN_MIN)
>> +            return -ENODATA;
>> +
>> +        klvs += GUC_KLV_LEN_MIN + len;
>> +        num_dwords -= GUC_KLV_LEN_MIN + len;
>> +        num_klvs++;
>> +    }
>> +
>> +    return num_dwords ? -ENODATA : num_klvs;
> 
> while loop can be terminated only if num_dwords < len + GUC_KLV_LEN_MIN
> or num_dwords is 0. Therefore return num_klvs; should be fine.

but then we won't catch the case with truncated buffer (which indicates
bug somewhere in code or firmware) and it is one of the function goal
and return value

> 
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_guc_klv_helpers.h
>> b/drivers/gpu/drm/xe/xe_guc_klv_helpers.h
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
>> +void xe_guc_klv_print(const u32 *klvs, u32 num_dwords, struct
>> drm_printer *p);
>> +int xe_guc_klv_count(const u32 *klvs, u32 num_dwords);
>> +
>> +/**
>> + * PREP_GUC_KLV - Prepare KLV header value based on provided key and
>> len.
>> + * @key: KLV key
>> + * @len: KLV length
>> + *
>> + * Return: value of the KLV header (u32).
>> + */
>> +#define PREP_GUC_KLV(key, len) \
>> +    (FIELD_PREP(GUC_KLV_0_KEY, (key)) | \
>> +     FIELD_PREP(GUC_KLV_0_LEN, (len)))
>> +
>> +/**
>> + * PREP_GUC_KLV_CONST - Prepare KLV header value based on const key
>> and len.
>> + * @key: const KLV key
>> + * @len: const KLV length
>> + *
>> + * Return: value of the KLV header (u32).
>> + */
>> +#define PREP_GUC_KLV_CONST(key, len) \
>> +    (FIELD_PREP_CONST(GUC_KLV_0_KEY, (key)) | \
>> +     FIELD_PREP_CONST(GUC_KLV_0_LEN, (len)))
>> +
>> +/**
>> + * PREP_GUC_KLV_TAG - Prepare KLV header value based on unique KLV
>> definition tag.
>> + * @TAG: unique tag of the KLV definition
>> + *
>> + * Combine separate KEY and LEN definitions of the KLV identified by
>> the TAG.
>> + *
>> + * Return: value of the KLV header (u32).
>> + */
>> +#define PREP_GUC_KLV_TAG(TAG) \
>> +    PREP_GUC_KLV_CONST(GUC_KLV_##TAG##_KEY, GUC_KLV_##TAG##_LEN)
>> +
>> +#endif
