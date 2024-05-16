Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34903C25B74
	for <intel-xe@archiver.kernel.org>; Thu, 16 May 2024 14:51:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F074810ED4F;
	Thu, 16 May 2024 14:51:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PfCjUI0B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29A7810ED4F
 for <intel-xe@lists.freedesktop.org>; Thu, 16 May 2024 14:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715871072; x=1747407072;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=aeTjk9xtMJoRhcnHefZegnt5HNnLoSSpsx6Zqa9pB4w=;
 b=PfCjUI0Bo6Thpu+pVtKR/LEydO5OqSjCPXR5xDW+v7+KupBvqrQwBlKP
 fUdl7K/0ffEuJhh1TFdpmnV8Ei69AKeMnVn9/Atz/FKGoWODEcO4Lm/O2
 JVOsAJYWh3DdsxNfy01ctXH5el+EvytVHMk6kp30DfOC2Ixg6ODdYZcdH
 ahJkYnXwH5hwrbAkY7drUifljdJVXcJOfiKN/YO6nHTXR+JOGJ8tXMBpS
 DDIYJPmoW5kFPGYKhp1mIJOw6NwJgpQ9Nc1LIJeROnkq5j+esOGdIiZRh
 aeP8YxEHhXEfDFGjKxg6TW31sqgpT+RM07eUFxvbQD8SN6D3oKB1TahsY g==;
X-CSE-ConnectionGUID: wsghxodtRjWDg1E2uZtjmQ==
X-CSE-MsgGUID: l0zODMRrRH64lK78FaKA/w==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="15769829"
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; d="scan'208";a="15769829"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2024 07:51:11 -0700
X-CSE-ConnectionGUID: ZjeHNrRKQmmfAJ0zQX47eQ==
X-CSE-MsgGUID: 3yvqB0m3TI+CXVkL3rV3qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; d="scan'208";a="35952826"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa003.fm.intel.com with ESMTP; 16 May 2024 07:51:07 -0700
Received: from [10.246.25.139] (mwajdecz-MOBL.ger.corp.intel.com
 [10.246.25.139])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 02F7A28785;
 Thu, 16 May 2024 15:51:05 +0100 (IST)
Message-ID: <0939a42d-e957-4693-ac6f-2c6ea0aaa809@intel.com>
Date: Thu, 16 May 2024 16:51:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] drm/xe/guc: Introduce GuC KLV thresholds set
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20240514190015.2172-1-michal.wajdeczko@intel.com>
 <20240514190015.2172-3-michal.wajdeczko@intel.com>
 <yktjo6maej5hulzsxn4ldxiqws5xl3eogcfjjiyv6u6o4eu4x2@32ofuijz66bc>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <yktjo6maej5hulzsxn4ldxiqws5xl3eogcfjjiyv6u6o4eu4x2@32ofuijz66bc>
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



On 16.05.2024 16:23, Lucas De Marchi wrote:
> On Tue, May 14, 2024 at 09:00:09PM GMT, Michal Wajdeczko wrote:
>> The GuC firmware monitors VF's activity and notifies the PF driver
>> once any configured threshold related to such activity is exceeded.
>>
>> The available thresholds are defined in the GuC ABI as part of the
>> GuC VF Configuration KLVs.  Threshold configurations performed by
>> the PF driver and notifications sent by the GuC rely on the KLV keys,
>> which are not zero-based and might not guarantee continuity.
>>
>> To simplify the driver code and eliminate the need to repeat very
>> similar code for each threshold, introduce the threshold set macro
>> that allows to generate required code based on unique threshold tag.
>>
>> Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>> v2: improve readability of generated switch/enum (Piotr)
>>    silence kernel-doc warning (CI.hooks)
>> ---
>> .../gpu/drm/xe/xe_guc_klv_thresholds_set.h    | 64 +++++++++++++++++
>> .../drm/xe/xe_guc_klv_thresholds_set_types.h  | 68 +++++++++++++++++++
>> 2 files changed, 132 insertions(+)
>> create mode 100644 drivers/gpu/drm/xe/xe_guc_klv_thresholds_set.h
>> create mode 100644 drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set.h
>> b/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set.h
>> new file mode 100644
>> index 000000000000..da0fedbbdbaf
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set.h
>> @@ -0,0 +1,64 @@
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
>> + * MAKE_GUC_KLV_VF_CFG_THRESHOLD_KEY - Prepare the name of the KLV
>> key constant.
>> + * @TAG: unique tag of the GuC threshold KLV key.
>> + */
>> +#define MAKE_GUC_KLV_VF_CFG_THRESHOLD_KEY(TAG) \
>> +    MAKE_GUC_KLV_KEY(CONCATENATE(VF_CFG_THRESHOLD_, TAG))
>> +
>> +/**
>> + * xe_guc_klv_threshold_key_to_index - Find index of the tracked GuC
>> threshold.
>> + * @key: GuC threshold KLV key.
>> + *
>> + * This translation is automatically generated using
>> &MAKE_XE_GUC_KLV_THRESHOLDS_SET.
>> + * Return: index of the GuC threshold KLV or -1 if not found.
>> + */
>> +static inline int xe_guc_klv_threshold_key_to_index(u32 key)
>> +{
>> +    switch (key) {
>> +#define define_xe_guc_klv_threshold_key_to_index_case(TAG, ...)        \
>> +                                    \
> 
> something went wrong with this newline above

it was added in v2 on purpose to make the macro looks more like real
code inside switch statement and thus improve readability (same done
also in few other places)

> 
> I checked only until here in the patch series. As I said offline, I
> don't really like much this multiple indirections on creating
> symbols/enums.
> 
> we end up having things like:
> 
>     xe_guc_klv_threshold_key_to_index(VERY_LONG_NAME_FOO)
> 
> and then when we are grepping the code to find VERY_LONG_NAME_FOO it's
> impossible to quickly find it. 

the trick is that while VERY_LONG_NAME_FOO names are already defined as
part of the GuC ABI, we never have to use them directly in the code and
just treat them in generic way as a set of VERY_LONG_NAMEs identified
only by the TAG suffix

>From a quick look it seems the cases here
> are like:
> 
>     static int pf_handle_vf_threshold_event(struct xe_gt *gt, u32 vfid,
> u32 threshold)
>     {
>         char origin[8];
>         int e;
> 
>         e = xe_guc_klv_threshold_key_to_index(threshold);
>         ...
> 
> and it does have the error handling.  So, ack on the approach. Let's
> just not go overboard with these macros please.
> 
> Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>
> 

Thanks!
