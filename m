Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 354EDC04FFE
	for <intel-xe@archiver.kernel.org>; Tue, 14 May 2024 16:14:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9483F10E042;
	Tue, 14 May 2024 16:14:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j1q0KKF+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ECAB10E042
 for <intel-xe@lists.freedesktop.org>; Tue, 14 May 2024 16:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715703255; x=1747239255;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=t93mEUTHYz2hkc6r8OsgcWUFf+owPcDwDWLIRvT5LSk=;
 b=j1q0KKF+Lane5T6PNE2C2mixfUdpA1lJvZGvcHFf7gHrebi6puFeiFS6
 O4LFEi/5QW3pg5QQlodsQTIkZswKKRuGiDutJQEljL4UbWSB9l0R3vEyd
 Sdxt1keAs0qO4VdmSvNW0J5WeqROznub+sTG9EtQbYQQDuwPmYeyTsgYc
 xr3zrQjzDhvabhnTfkB0LljNfH+M9nTOG/9ZwleHMKtReuWfxoIPid07+
 pKVWGDEAhJ8/WWxmVe3MMXqJYwJ5VfOk+uW0lfRfyWimETgxUV+53XwBS
 IlL+IYu+zYbhdnlrRrVvBmp7tz8EZvmTJ9NBMUhXzZ5fN8nuQB3Sog+Ou Q==;
X-CSE-ConnectionGUID: Rgv6YY2JSci5dePZ/xIhWw==
X-CSE-MsgGUID: ev6eivt1QRakfnk90fTH+g==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="11567298"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="11567298"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 09:14:14 -0700
X-CSE-ConnectionGUID: g/scRf9KRee2kLo01fhUIg==
X-CSE-MsgGUID: u13hjATLQwGMuitwSqzfJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="35620443"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa004.jf.intel.com with ESMTP; 14 May 2024 09:14:13 -0700
Received: from [10.246.1.253] (mwajdecz-MOBL.ger.corp.intel.com [10.246.1.253])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 32C0A2878A;
 Tue, 14 May 2024 17:14:11 +0100 (IST)
Message-ID: <27d2fa67-7ef8-4dad-a5a2-d765640e7a4b@intel.com>
Date: Tue, 14 May 2024 18:14:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] drm/xe/guc: Introduce GuC KLV thresholds set
To: =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20240506133814.2571-1-michal.wajdeczko@intel.com>
 <20240506133814.2571-3-michal.wajdeczko@intel.com>
 <20240514080805.2g6tbanqrgsvamso@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240514080805.2g6tbanqrgsvamso@intel.com>
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



On 14.05.2024 10:08, Piotr Piórkowski wrote:
> Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on pon [2024-maj-06 15:38:08 +0200]:
>> The GuC firmware monitors VF's activity and notifies the PF driver
>> once any configured threshold related to such activity is exceeded.
>>
>> The available thresholds are defined in the GuC ABI as part of the
>> GuC VF Configuration KLVs.  Threshold configurations performed by
>> the PF driver and notifications sent by the GuC rely on the KLV keys,
>> which are not zero-based and might not guarantee continuity.
>>
>> To simplify the driver code and eliminate the need to repeat very
>> similar code for each threshold, introduce the threshold set macro
>> that allows to generate required code based on unique threshold tag.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>>  .../gpu/drm/xe/xe_guc_klv_thresholds_set.h    | 58 +++++++++++++++++
>>  .../drm/xe/xe_guc_klv_thresholds_set_types.h  | 65 +++++++++++++++++++
>>  2 files changed, 123 insertions(+)
>>  create mode 100644 drivers/gpu/drm/xe/xe_guc_klv_thresholds_set.h
>>  create mode 100644 drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set.h b/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set.h
>> new file mode 100644
>> index 000000000000..da9ae10c72b8
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set.h
>> @@ -0,0 +1,58 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2024 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_GUC_KLV_THRESHOLDS_SET_H_
>> +#define _XE_GUC_KLV_THRESHOLDS_SET_H_
>> +
>> +#include "abi/guc_klvs_abi.h"
>> +#include "xe_guc_klv_helpers.h"
>> +#include "xe_guc_klv_thresholds_set_types.h"
>> +
>> +/**
>> + * MAKE_GUC_KLV_VF_CFG_THRESHOLD_KEY - Prepare the name of the KLV key constant.
>> + * @TAG: unique tag of the GuC threshold KLV key.
>> + */
>> +#define MAKE_GUC_KLV_VF_CFG_THRESHOLD_KEY(TAG) \
>> +	MAKE_GUC_KLV_KEY(CONCATENATE(VF_CFG_THRESHOLD_, TAG))
>> +
>> +/**
>> + * xe_guc_klv_threshold_key_to_index - Find index of the tracked GuC threshold.
>> + * @key: GuC threshold KLV key.
>> + *
>> + * This translation is automatically generated using &MAKE_XE_GUC_KLV_THRESHOLDS_SET.
>> + * Return: index of the GuC threshold KLV or -1 if not found.
>> + */
>> +static inline int xe_guc_klv_threshold_key_to_index(u32 key)
>> +{
>> +	switch (key) {
>> +#define define_xe_guc_klv_threshold_key_to_index_case(TAG, ...)		\
>> +	case MAKE_GUC_KLV_VF_CFG_THRESHOLD_KEY(TAG):			\
>> +		return MAKE_XE_GUC_KLV_THRESHOLD_INDEX(TAG);
> 
> NIT: In my opinion, putting these definitions inside a switch (or in another case,
> inside an enum) worsens the readability of the code, which is already unreadable by the fact
> that these are macros - which, by the way, are very interesting in itself.

the idea was to mimic that this macro definition looks like actual
"case" statement - maybe with additional empty lines it will be better:

	switch (key) {
#define define_xe_guc_klv_threshold_key_to_index_case(TAG, ...)	\
								\
	case MAKE_GUC_KLV_VF_CFG_THRESHOLD_KEY(TAG):		\
		return MAKE_XE_GUC_KLV_THRESHOLD_INDEX(TAG);

	/* generate above case statements here */
	MAKE_XE_GUC_KLV_THRESHOLDS_SET(...)
	}

> 
>> +	MAKE_XE_GUC_KLV_THRESHOLDS_SET(define_xe_guc_klv_threshold_key_to_index_case)
>> +	}
>> +	return -1;
>> +#undef define_xe_guc_klv_threshold_key_to_index_case
>> +}
>> +
>> +/**
>> + * xe_guc_klv_threshold_index_to_key - Get tracked GuC threshold KLV key.
>> + * @index: GuC threshold KLV index.
>> + *
>> + * This translation is automatically generated using &MAKE_XE_GUC_KLV_THRESHOLDS_SET.
>> + * Return: key of the GuC threshold KLV or 0 on malformed index.
>> + */
>> +static inline u32 xe_guc_klv_threshold_index_to_key(enum xe_guc_klv_threshold_index index)
>> +{
>> +	switch (index) {
>> +#define define_xe_guc_klv_threshold_index_to_key_case(TAG, ...)		\
>> +	case MAKE_XE_GUC_KLV_THRESHOLD_INDEX(TAG):			\
>> +		return MAKE_GUC_KLV_VF_CFG_THRESHOLD_KEY(TAG);
>> +	MAKE_XE_GUC_KLV_THRESHOLDS_SET(define_xe_guc_klv_threshold_index_to_key_case)
>> +	}
>> +	return 0; /* unreachable */
>> +#undef define_xe_guc_klv_threshold_index_to_key_case
>> +}
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h b/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h
>> new file mode 100644
>> index 000000000000..6a48d76924a4
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h
>> @@ -0,0 +1,65 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2024 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_GUC_KLV_THRESHOLDS_SET_TYPES_H_
>> +#define _XE_GUC_KLV_THRESHOLDS_SET_TYPES_H_
>> +
>> +#include "xe_args.h"
>> +
>> +/**
>> + * MAKE_XE_GUC_KLV_THRESHOLDS_SET - Generate various GuC thresholds definitions.
>> + * @define: name of the inner macro to expand.
>> + *
>> + * The GuC firmware is able to monitor VF's adverse activity and will notify the
>> + * PF driver once any threshold is exceeded.
>> + *
>> + * This super macro allows various conversions between the GuC adverse event
>> + * threshold KLV definitions and the driver code without repeating similar code
>> + * or risking missing some cases.
>> + *
>> + * For each GuC threshold definition, the inner macro &define will be provided
>> + * with the &TAG, that corresponds to the GuC threshold KLV key name defined by
>> + * ABI and the associated &NAME, that may be used in code or debugfs/sysfs::
>> + *
>> + *	define(TAG, NAME)
>> + */
>> +#define MAKE_XE_GUC_KLV_THRESHOLDS_SET(define)		\
>> +	define(CAT_ERR, cat_error_count)		\
>> +	define(ENGINE_RESET, engine_reset_count)	\
>> +	define(PAGE_FAULT, page_fault_count)		\
>> +	define(H2G_STORM, guc_time_us)			\
>> +	define(IRQ_STORM, irq_time_us)			\
>> +	define(DOORBELL_STORM, doorbell_time_us)	\
>> +	/* end */
>> +
>> +/**
>> + * XE_GUC_KLV_NUM_THRESHOLDS - Number of GuC thresholds KLVs.
>> + *
>> + * Calculated automatically using &MAKE_XE_GUC_KLV_THRESHOLDS_SET.
>> + */
>> +#define XE_GUC_KLV_NUM_THRESHOLDS \
>> +	(CALL_ARGS(COUNT_ARGS, MAKE_XE_GUC_KLV_THRESHOLDS_SET(ARGS_SEP_COMMA)) - 1)
>> +
>> +/**
>> + * MAKE_XE_GUC_KLV_THRESHOLD_INDEX - Create enumerator name.
>> + * @TAG: unique TAG of the enum xe_guc_klv_threshold_index.
>> + */
>> +#define MAKE_XE_GUC_KLV_THRESHOLD_INDEX(TAG) \
>> +	CONCATENATE(XE_GUC_KLV_THRESHOLD_INDEX_, TAG)
>> +
>> +/**
>> + * enum xe_guc_klv_threshold_index - Index of the tracked GuC threshold.
>> + *
>> + * This enum is automatically generated using &MAKE_XE_GUC_KLV_THRESHOLDS_SET.
>> + * All these generated enumerators will only be used by the also generated code.
>> + */
>> +enum xe_guc_klv_threshold_index {
>> +#define define_xe_guc_klv_threshold_index_enum(TAG, ...) \
>> +	MAKE_XE_GUC_KLV_THRESHOLD_INDEX(TAG),
>> +	MAKE_XE_GUC_KLV_THRESHOLDS_SET(define_xe_guc_klv_threshold_index_enum)
>> +#undef define_xe_guc_klv_threshold_index_enum
>> +};
>> +
>> +#endif
> 
> One comment above, however, the code functionally seems ok:
> Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> 
>> -- 
>> 2.43.0
>>
> 
