Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D0F6C67861
	for <intel-xe@archiver.kernel.org>; Tue,  9 Apr 2024 09:43:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 308FE112C1B;
	Tue,  9 Apr 2024 09:43:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ffQq519U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A992112C1B
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Apr 2024 09:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712655794; x=1744191794;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=HGKPX1ooT6Yz8IY6OtyM6h0nzkLfEbOvPliUfQQze5w=;
 b=ffQq519U3g1dMvIsiJHj9VsLvotdjymqgnzICtr7TUUCvsqSYxU8Sv/R
 /QP7DaEpvP9LAxW//6rIKEbM1mRKCvtKWwss4F3G/K+iXpobd1xf/rmyF
 KFH0vzvoRezOx2rb7S1X+3deQEOkIlPuv11tANZjKYGy8ut0d2nw3DdfA
 q7qFZZnH0F2GazoskKiv0oACxzgsXZB86HUXdioGMGH3KnNetf9qiVRj+
 S8X2RR3KFBXneFaTE3E0YrzTYYVcUeclX8Dhyxc2TYChpHJPH06BQCfby
 vqN1YLP+rToQNVlheuBpczkFLlms6/2h41pH45bo6t4mhlG8wk6cfbQRn A==;
X-CSE-ConnectionGUID: Vvvm+BFlSOelbPFVB5ljHg==
X-CSE-MsgGUID: NNmSOY7eRGmxnHq9hpmi7A==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="18528526"
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; d="scan'208";a="18528526"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 02:43:14 -0700
X-CSE-ConnectionGUID: 9EpE0duPSMae3c2nRSxQgg==
X-CSE-MsgGUID: VTpKfOncSY2K0bQpA5Yrww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; d="scan'208";a="57633213"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa001.jf.intel.com with ESMTP; 09 Apr 2024 02:43:12 -0700
Received: from [10.249.158.230] (unknown [10.249.158.230])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 886DB27BC6;
 Tue,  9 Apr 2024 10:43:00 +0100 (IST)
Message-ID: <2ad605ee-91a4-40a7-8996-e8e155a807f4@intel.com>
Date: Tue, 9 Apr 2024 11:42:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/guc: Add helpers for GuC KLVs
Content-Language: en-US
To: John Harrison <john.c.harrison@intel.com>, intel-xe@lists.freedesktop.org
References: <20240408181408.1023-1-michal.wajdeczko@intel.com>
 <20240408181408.1023-2-michal.wajdeczko@intel.com>
 <cceea6ca-4d04-445c-9153-993cd69d14f6@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <cceea6ca-4d04-445c-9153-993cd69d14f6@intel.com>
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



On 09.04.2024 00:00, John Harrison wrote:
> On 4/8/2024 11:14, Michal Wajdeczko wrote:
>> Many of the GuC actions use KLVs to pass additional parameters or
>> configuration data. Add few helper functions for better reporting
>> any information related to KLVs.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
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
>> +    }
>> +    return "(unknown)";
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
> Or maybe it is actually two separate 32bit words? Why bother forcing it
> to a u64 with a brand new custom helper? Seems simpler to just print it
> as a pair of 32s, the reader can trivially combine it to a single 64 in
> their head if printing as hex anyway.

but majority (if not all) of KLVs with len=2 hold the 64b value and for
remaining KLVs the reader can trivially split 64b hex value into two 32b

> 
> Also, there is no code to actually use any of these helpers yet? I
> thought adding unused code was not allowed. You have to have a purpose,
> at least in the same series if not the same patch.

actual use is coming as part of the larger series with SR-IOV PF
support, but sent helper separately to minimize this upcoming series and
not distract reviewers with secondary helpers outside of SR-IOV scope

> 
> John.
> 
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
> 
