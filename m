Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 274E6C46CD4
	for <intel-xe@archiver.kernel.org>; Fri, 29 Dec 2023 22:15:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7B0B10E2D5;
	Fri, 29 Dec 2023 22:15:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 687C410E2D5
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Dec 2023 22:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703888102; x=1735424102;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=DkEyZzWPRkzE6iamYE3U5+JyVvfwNetS0nv/UcdyhTs=;
 b=AbQUkpLzo+d9TWYYx98LQg1eqUqIPVCoX9y0DDcCUWCZ7ni4M5EcfFEd
 8wIMXV6p7NmovYAOrWlKo2Im1hboyq03tpKMJq0MBQQ1/BL62vPfwokrM
 a3XD3/Vs2MnDWmAvVrRXPxxFiBZ1t50AFQkmTKKq2Pw7VbP9bYJ286wQd
 K8SxQ7AWSXaseSPx4Gkr3e0JGpOnFMdIkuXQjUPjPZo8UvSuMKPa445Xl
 HepqiICL9VufQ5AwPd4jiQDlpYyg+2gx9UJ9sih6Xie5Q40XuOUb2ERK6
 7LHZX6gX4MGaixwpPTP+1r5gym/8q/fM8PS+qwb9JgnJLjng2FdBgG5hY Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10938"; a="3975535"
X-IronPort-AV: E=Sophos;i="6.04,316,1695711600"; 
   d="scan'208";a="3975535"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Dec 2023 14:10:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10938"; a="728690661"
X-IronPort-AV: E=Sophos;i="6.04,316,1695711600"; d="scan'208";a="728690661"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orsmga003.jf.intel.com with ESMTP; 29 Dec 2023 14:10:44 -0800
Received: from [10.249.132.76] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.132.76])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id CA94A33EA2;
 Fri, 29 Dec 2023 22:10:42 +0000 (GMT)
Message-ID: <ac3e7b93-2621-4651-8a90-7a92b8eab81f@intel.com>
Date: Fri, 29 Dec 2023 23:10:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/10] drm/xe/guc: Add helpers for HXG messages
To: =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
References: <20231227235838.212-1-michal.wajdeczko@intel.com>
 <20231227235838.212-5-michal.wajdeczko@intel.com>
 <20231229210833.cphh32yxvqrckyfp@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20231229210833.cphh32yxvqrckyfp@intel.com>
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 29.12.2023 22:08, Piotr Piórkowski wrote:
> Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on czw [2023-gru-28 00:58:32 +0100]:
>> In addition to MMIO and CTB communication between the host driver
>> and the GUC firmware, we will start using GuC HXG message protocol
>> in communication between SR-IOV VFs and PF. Define helpers related
>> to HXG message protocol to minimize code duplication.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_guc_hxg_helpers.h | 107 ++++++++++++++++++++++++
>>  1 file changed, 107 insertions(+)
>>  create mode 100644 drivers/gpu/drm/xe/xe_guc_hxg_helpers.h
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_hxg_helpers.h b/drivers/gpu/drm/xe/xe_guc_hxg_helpers.h
>> new file mode 100644
>> index 000000000000..4dc080484e7a
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_guc_hxg_helpers.h
>> @@ -0,0 +1,107 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_GUC_HXG_HELPERS_H_
>> +#define _XE_GUC_HXG_HELPERS_H_
>> +
>> +#include <linux/bitfield.h>
>> +#include <linux/types.h>
>> +
>> +#include "abi/guc_messages_abi.h"
>> +
>> +/**
>> + * hxg_sizeof - Queries size of the object or type (in HXG units).
>> + *
>> + * Asserts when actual size is not aligned to HXG unit (u32).
>> + *
>> + * Return: size in dwords (u32).
>> + */
>> +#define hxg_sizeof(T)	(sizeof(T) / sizeof(u32) + BUILD_BUG_ON_ZERO(sizeof(T) % sizeof(u32)))
>> +
>> +static inline const char *guc_hxg_type_to_string(unsigned int type)
>> +{
>> +	switch (type) {
>> +	case GUC_HXG_TYPE_REQUEST:
>> +		return "request";
>> +	case GUC_HXG_TYPE_FAST_REQUEST:
>> +		return "fast-request";
>> +	case GUC_HXG_TYPE_EVENT:
>> +		return "event";
>> +	case GUC_HXG_TYPE_NO_RESPONSE_BUSY:
>> +		return "busy";
>> +	case GUC_HXG_TYPE_NO_RESPONSE_RETRY:
>> +		return "retry";
>> +	case GUC_HXG_TYPE_RESPONSE_FAILURE:
>> +		return "failure";
>> +	case GUC_HXG_TYPE_RESPONSE_SUCCESS:
>> +		return "response";
>> +	default:
>> +		return "<invalid>";
>> +	}
>> +}
>> +
>> +static inline bool guc_hxg_type_is_action(unsigned int type)
>> +{
>> +	switch (type) {
>> +	case GUC_HXG_TYPE_REQUEST:
>> +	case GUC_HXG_TYPE_FAST_REQUEST:
>> +	case GUC_HXG_TYPE_EVENT:
>> +		return true;
>> +	default:
>> +		return false;
>> +	}
>> +}
>> +
>> +static inline bool guc_hxg_type_is_reply(unsigned int type)
>> +{
>> +	switch (type) {
>> +	case GUC_HXG_TYPE_NO_RESPONSE_BUSY:
>> +	case GUC_HXG_TYPE_NO_RESPONSE_RETRY:
>> +	case GUC_HXG_TYPE_RESPONSE_FAILURE:
>> +	case GUC_HXG_TYPE_RESPONSE_SUCCESS:
>> +		return true;
>> +	default:
>> +		return false;
>> +	}
>> +}
>> +
>> +static inline u32 guc_hxg_msg_encode_success(u32 *msg, u32 data0)
>> +{
>> +	msg[0] = FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_HOST) |
>> +		 FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_RESPONSE_SUCCESS) |
>> +		 FIELD_PREP(GUC_HXG_RESPONSE_MSG_0_DATA0, data0);
>> +
>> +	return GUC_HXG_RESPONSE_MSG_MIN_LEN;
>> +}
>> +
>> +static inline u32 guc_hxg_msg_encode_failure(u32 *msg, u32 error, u32 hint)
>> +{
>> +	msg[0] = FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_HOST) |
>> +		 FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_RESPONSE_FAILURE) |
>> +		 FIELD_PREP(GUC_HXG_FAILURE_MSG_0_HINT, hint) |
>> +		 FIELD_PREP(GUC_HXG_FAILURE_MSG_0_ERROR, error);
>> +
>> +	return GUC_HXG_FAILURE_MSG_LEN;
>> +}
>> +
>> +static inline u32 guc_hxg_msg_encode_busy(u32 *msg, u32 counter)
>> +{
>> +	msg[0] = FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_HOST) |
>> +		 FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_NO_RESPONSE_BUSY) |
>> +		 FIELD_PREP(GUC_HXG_BUSY_MSG_0_COUNTER, counter);
>> +
>> +	return GUC_HXG_BUSY_MSG_LEN;
>> +}
>> +
>> +static inline u32 guc_hxg_msg_encode_retry(u32 *msg, u32 reason)
>> +{
>> +	msg[0] = FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_HOST) |
>> +		 FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_NO_RESPONSE_RETRY) |
>> +		 FIELD_PREP(GUC_HXG_RETRY_MSG_0_REASON, reason);
>> +
>> +	return GUC_HXG_RETRY_MSG_LEN;
>> +}
> 
> Note to the 4 functions above ^^^^^:
> I know that naming convention says to use in this case guc_hxg_*
> However, these functions, by their content directly indicate that they
> are only h2g.
> I have a subjective feeling, which you can ignore, that they should be
> labeled in some way as h2g.

Note that from the driver (host) POV, by design, we will be encoding all
HXG messages always as H2G, so IMO we can stay with guc_hxg prefix.

> 
> But still:
> Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> 
> 
>> +
>> +#endif
>> -- 
>> 2.25.1
>>
> 
