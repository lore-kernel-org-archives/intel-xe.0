Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13DEDCD1292
	for <intel-xe@archiver.kernel.org>; Mon,  8 Apr 2024 22:00:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80E5C1121D4;
	Mon,  8 Apr 2024 22:00:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lQs+YfKu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29C221121D4
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Apr 2024 22:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712613639; x=1744149639;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=LcexLGo4CUcz14yXdHYkxslCubkdPI2d5qSZy98Rlao=;
 b=lQs+YfKukd71VgoI/e/Z3krWTD2qtXWNzGv1zyC+NaRiHpe58p5/oSr5
 3HzcHjNyGOf/lWcLCAguUfWpnqPo0jo9toe9Dn6Bswwlnbmvzn4phPa4U
 qIJB85JnpPHWIQCAvHLcqoqMtyW2cczk6GDJH+fnq1xECSN69WRZTTf1N
 xWQAeGECxZUBxJYOfTFEIkljr4gr65I5qG+xbV5ZMtND+6Is+zVw4CL08
 wPCaHg7QYse+g1KtNOi5JiM/TujNMsWutRBym28lahKLjzkUYgqQHMlM1
 rHsEtojqk9E5MjxCrsXK+pMdyJWaRtjCx5AL9sxn1sAQwRPg/4uOalQxI A==;
X-CSE-ConnectionGUID: Q+Wc73OLTgOfk1tFN8j+yw==
X-CSE-MsgGUID: lktquykpTB68gI0O20TUMA==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="8074694"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="8074694"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 15:00:39 -0700
X-CSE-ConnectionGUID: 7nZrJiKWQveSqyetr7yHhQ==
X-CSE-MsgGUID: jyDMMduiRDK3b4Vs42jT1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="20107819"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Apr 2024 15:00:38 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 8 Apr 2024 15:00:37 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 8 Apr 2024 15:00:37 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 8 Apr 2024 15:00:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fwir0f8G6YttW6KXLFbPXEHtDQBEn07+Pr0FzkI50j22/+AvG5NpgMIG77x9tEWUfxex9T+9SUSFGDiN0eK9aJpfyxFsJEySx/IEogo6KYE/gN8fJtqc+2GfnHMcRiClWRwcAJDO02wFFw6Jm40wHXwyDweG8Jicf25DLbjY+9fP0LD+udVgTl/8s/Sc5+ZTKtMiQ8zLC6YVs6q9kLHqZjS1D9UAKiLX8hIHEoDWlEoSNQbP0gehVA+uOup+TcJrHipXvbOAGvJW4ZzXAsuLTVeAb5iZJDIA3e0Kl+bQB/W5LV0i7XFCvsVVhjdQEz613M54jBv/4HPAFjYebIIIlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ATxqezNVnDl0OvuTPlcTczQrFb1PU2uN9sqyQP1dkE=;
 b=ieTxuz5EDBcJ1LNPCjFizPgYuO2YfwJ3hWr1RUtOd2q4CKYrO23KMahBLhYo+AEDo6kGXHPZolmk61kPPaXElod2Z5zcH/OJV/UsBExJR1MB0WDV7c340UwvQXzsf/aVqLUHAsnzg9dNsBVwffhuovO9zGmYqQtNjCXXs3yjjnxLhlux6VjhqZWN1GiWrnLbAS0xeEcnLdjWfGpKFkQriwFn67/CYvWU71YFxY7Ubr1NSOXwRZRnUFwIwr6+ono9GXIPdntJFWbkyL8sZ/CDe3eEnAsb+VEejgpqhpzMStr6DlB+kI5az4p9kz1AWObYccjOCPQ8DEySMjrD52hD9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by DM4PR11MB8132.namprd11.prod.outlook.com (2603:10b6:8:17e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Mon, 8 Apr
 2024 22:00:35 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::71ea:e0ea:808d:793b]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::71ea:e0ea:808d:793b%4]) with mapi id 15.20.7452.019; Mon, 8 Apr 2024
 22:00:35 +0000
Message-ID: <cceea6ca-4d04-445c-9153-993cd69d14f6@intel.com>
Date: Mon, 8 Apr 2024 15:00:31 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/guc: Add helpers for GuC KLVs
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20240408181408.1023-1-michal.wajdeczko@intel.com>
 <20240408181408.1023-2-michal.wajdeczko@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20240408181408.1023-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR02CA0070.namprd02.prod.outlook.com
 (2603:10b6:a03:54::47) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|DM4PR11MB8132:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OcCHFnX4CjM6usUG/EQqOK54u108jHhYg14DJ075Tv2M5YGWwPGSA02cWle76fuDm7lCvj0yrEOf1CDr+k5KN/gmE9StIJ5ENpPcT0zP4BDwUDN2r/5nQZ0gOwyStJE89TJ3pc8U6CXoIV2DCI3GOGuUBmqsG+7ZyfhKkt5Vko2mAQYGwareLM6k7aILZOCdsPPcxIE9lOrL1YmMQHJEi7JB1aHZ1ANGSbSZTwqU93voweugva9CMVo6ldA75dzyKaZoYVuZQMfyi66CojlEsFR3dr0lkosEl+iZJ9jpTxRlwQepQZ2MWCUuXEHeKajNlODA+aZQgTyzirqJtCHvQG0+nuGE+JQgqSnOdhor6LtXfw1eifl9mgYlxxT8tSO4gTo3o5We5FEmt6HtK4bLC2WrM4e8fUzqcteFzo2L0tvUnUtNq7Co0rGdZtgdm9wTthz0ANhvG8GPeh6xwt2uMoeSMxeX3qznMZHtWSsdptErEDMaJ4WwAvLqbo0n7FWRdtI5Ag9PavZPTJ2qdOjnF1GHS+99yWzq3Ak0uaij4HIr0hMC0fMtX+9hm3qtrm04AB6hFF/ShP9ztx3KSBo1XokLHa7hE7zqsO4UoBLVsnp+I6OcYbWLhXv6N6ap7QgIIpJYPANhbjvRuIoOPLVWs0IZrpIA24J4/yjbLhDSie0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bW1xTTBaTzhkeEl6ek5sY2NnR0dlemo4RmRJTWRyck43Q2Y4SnI4NkM3UGlm?=
 =?utf-8?B?ODJjWnNLV3dYbnJ6RjIxdCt6RXJGVURQam10cUxJeVc3Z2N5ek40dExHaHlX?=
 =?utf-8?B?ZUQvQ3dvUzJyWFkrendvMm1kUkxMNnAwUUVWSjloSldza3paL0s4YWF0bnRa?=
 =?utf-8?B?NmVQZ0hDNEFERXA5YzREVHkvN1ovSWRwUE5WMmprM2hXOFRScDVYblJyUTdv?=
 =?utf-8?B?Y2ljdnJvZWJ1NU9hM04ycnNLUmMzbm94NEgvbHc0S2RpdjFJbG9SUjdLQXgv?=
 =?utf-8?B?RXU2YlFUcWVxdnFjRC9JV3ZNOEhWbC9nR09rSXFhZ0FwN0s0NGp1WTNPT2FW?=
 =?utf-8?B?ZEZneWV3K25rNDNhTGFNWS8zZVlPTHVpRlJBbHNkbnNzNnhCczhNOWxXZmlN?=
 =?utf-8?B?NjlqL2xINWh1U0RhQnpGTlFMZ3A0WktpZlcrNnRaenE4M3FGOEdURGZ3dFIz?=
 =?utf-8?B?cnF4TnVPWklrbzVEU092SFVmSm5iOVExMGZyb3duZ0Y5aUpvb3NYdmVscEor?=
 =?utf-8?B?d1hVZWNyZ29nUE56elRuUHEzcktQNWdKdEpYcXpjTGFTZmRrQzhkSTRuL0Yz?=
 =?utf-8?B?WStxd0tTcUlrYXlva2dtYk9HWlpYQ0NkMXdaU2tCdjZOZmM5cHdtaUJPb1RL?=
 =?utf-8?B?elpsY21pQjZqcGlyZHA0V0dWMVpBQ2M3eFJDSEt4ME0weXNKRFZYU3VSTWdj?=
 =?utf-8?B?bllTdzBma1BaRUZWTU9MY0JydkY2T1IyLzN5Q1poUmhYbHNVRk5QdHMwTkxB?=
 =?utf-8?B?Tmx4MWh3SW12VDJXcXYvRnl2WUVQY1ZLYTVXRlZJQjBCdnpoMmhJbW1rRVhw?=
 =?utf-8?B?K0VGMkRxbm1OMWNIdllpQXpTVlo2TStDbzBRYzVvaWJtQmRMblNvcEtFdUhk?=
 =?utf-8?B?WVdnWWt5YXpsdHN2T1JFNFpseVNIN1haRWJRZ2NzQjM3NmtSRVBMVnJyNXdl?=
 =?utf-8?B?VTd3SjAvbzROU2tmT3ljZGtHNDZyQjg4QWxXWkpHTFRNN0EwKzFjLzMxNnY4?=
 =?utf-8?B?c3I0dy82Qkh1YjFIK2dMUGxBbDFYdTFEbWMyU1BiRENUbzdRMVFqTEtLZWpt?=
 =?utf-8?B?ZGQ5dXV3c1JrRElXc2d6eEVsSlY4RmFZRlM4WEgvUFIwR041Ky8wak1HcmRk?=
 =?utf-8?B?eGxVMHJLdzJsZGFSTm9SSk8yc29rT0VIcTRzaFpWN3d0Mll5Z1pMRzZ6SDB5?=
 =?utf-8?B?cXVVYmVUMERWMHhWeGJpQjM1YkFRRWhKSjVnR1lGZ2xCYWsxa0dEYzZEeTBG?=
 =?utf-8?B?azNvTjBFWXNhbm9BQTRCSWdoT2xDYm5SV2lQTEZCZWNCRGl1QUkrWkQzdWZh?=
 =?utf-8?B?SWk3YldmN00reVdraGJNTWpnZGRzWVdFdTRabER6UkVRNGxpeGJZby94OEpH?=
 =?utf-8?B?cTVOQ0c2ZDdiMGFQSkZsVGVyWmx5cXdMWDRJb05WbWhBbEowZTh5dFZENnhz?=
 =?utf-8?B?eHcrS1RzRHZSSnZJUjV2cVJOUmFQYnVWNXhjQ1BFNTM1aFRuVEh3MjN0QWNN?=
 =?utf-8?B?VHBGMTB2KzRjTjloOTlqb0hRQXlTQ3Y4aFRPZGI2Z3pLYW9MQzBXYjdzZGM0?=
 =?utf-8?B?dnBnVks4dlNZYVZYMUVPeGN3UktZc2Q2MDR1cFFUU0V1bk1iWFBnUXpBVndw?=
 =?utf-8?B?TFVYNkdjSDZudVBjV3pQSEwwMDZ1dnlaVFZmSEZZUmpyTE00NHdZSkNNcjhr?=
 =?utf-8?B?MitzVW1jQVNVVUhaZk1pOFI1WkRNQi9LNGVTdVBnTUc2U2w4RW56T2xWYkor?=
 =?utf-8?B?ZThoSk9MQnZ0L1BheS84eTZCcFRwa0pMOTNIVkJnZDRQV2ZDbjZlTTlSMXky?=
 =?utf-8?B?VWVUaXluaDdncjZhNWQzT1FrRXJxVmtyamhXQngxczdRNzdUWjZiUUk1U0ZS?=
 =?utf-8?B?bElURlg1SGdZUXFnbmI4QXJ2R1JLSjdWVUsyT1RyUndzQnRCTmxHNHRrTzdH?=
 =?utf-8?B?RFJKUFdRQ0xObG1iRm05VTVuSXI5dEJZMTNqdjE3NzExU2dsWjRLUGpyUE1U?=
 =?utf-8?B?OU1RTHNmazdQS0luR1FFYkFxQlJBRE9ZZ1Rrd1BRdjFnODcrMzJCUDFmQWlO?=
 =?utf-8?B?ZWZyRklxelpwRWEvSnZwb0Q0NTlhQ1p3SEVvczNNQkhtbnlmYkFOZHJJTVRH?=
 =?utf-8?B?UVhFc0hkYWF1T0JWZGJtTTZOblczUHFDY3BTd1JLT2hQNzQrMHN4UXJSbVFQ?=
 =?utf-8?B?WkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 51128d5f-2c1e-4d32-cc7a-08dc58175161
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2024 22:00:35.4169 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e6xgdRFliHbGBCfkvqfT65Q8EW5nN9ESG5+6fMj2CiubM+Zw6hjA6gqhD22Mzr1qg39CW6xrVJeD8LPu9Cb1GTnVBgryDGiZV4PwenYMNjo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8132
X-OriginatorOrg: intel.com
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

On 4/8/2024 11:14, Michal Wajdeczko wrote:
> Many of the GuC actions use KLVs to pass additional parameters or
> configuration data. Add few helper functions for better reporting
> any information related to KLVs.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>   drivers/gpu/drm/xe/Makefile             |   1 +
>   drivers/gpu/drm/xe/xe_guc_klv_helpers.c | 133 ++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_guc_klv_helpers.h |  51 +++++++++
>   3 files changed, 185 insertions(+)
>   create mode 100644 drivers/gpu/drm/xe/xe_guc_klv_helpers.c
>   create mode 100644 drivers/gpu/drm/xe/xe_guc_klv_helpers.h
>
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index e5b1715f721e..ec0d1fb49b1e 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -98,6 +98,7 @@ xe-y += xe_bb.o \
>   	xe_guc_debugfs.o \
>   	xe_guc_hwconfig.o \
>   	xe_guc_id_mgr.o \
> +	xe_guc_klv_helpers.o \
>   	xe_guc_log.o \
>   	xe_guc_pc.o \
>   	xe_guc_submit.o \
> diff --git a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
> new file mode 100644
> index 000000000000..c39fda08afcb
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
> @@ -0,0 +1,133 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#include <linux/bitfield.h>
> +#include <drm/drm_print.h>
> +
> +#include "abi/guc_klvs_abi.h"
> +#include "xe_guc_klv_helpers.h"
> +
> +#define make_u64(hi, lo) ((u64)((u64)(u32)(hi) << 32 | (u32)(lo)))
> +
> +/**
> + * xe_guc_klv_key_to_string - Convert KLV key into friendly name.
> + * @key: the `GuC KLV`_ key
> + *
> + * Return: name of the KLV key.
> + */
> +const char *xe_guc_klv_key_to_string(u16 key)
> +{
> +	switch (key) {
> +	/* VGT POLICY keys */
> +	case GUC_KLV_VGT_POLICY_SCHED_IF_IDLE_KEY:
> +		return "sched_if_idle";
> +	case GUC_KLV_VGT_POLICY_ADVERSE_SAMPLE_PERIOD_KEY:
> +		return "sample_period";
> +	case GUC_KLV_VGT_POLICY_RESET_AFTER_VF_SWITCH_KEY:
> +		return "reset_engine";
> +	/* VF CFG keys */
> +	case GUC_KLV_VF_CFG_GGTT_START_KEY:
> +		return "ggtt_start";
> +	case GUC_KLV_VF_CFG_GGTT_SIZE_KEY:
> +		return "ggtt_size";
> +	case GUC_KLV_VF_CFG_LMEM_SIZE_KEY:
> +		return "lmem_size";
> +	case GUC_KLV_VF_CFG_NUM_CONTEXTS_KEY:
> +		return "num_contexts";
> +	case GUC_KLV_VF_CFG_TILE_MASK_KEY:
> +		return "tile_mask";
> +	case GUC_KLV_VF_CFG_NUM_DOORBELLS_KEY:
> +		return "num_doorbells";
> +	case GUC_KLV_VF_CFG_EXEC_QUANTUM_KEY:
> +		return "exec_quantum";
> +	case GUC_KLV_VF_CFG_PREEMPT_TIMEOUT_KEY:
> +		return "preempt_timeout";
> +	case GUC_KLV_VF_CFG_BEGIN_DOORBELL_ID_KEY:
> +		return "begin_db_id";
> +	case GUC_KLV_VF_CFG_BEGIN_CONTEXT_ID_KEY:
> +		return "begin_ctx_id";
> +	}
> +	return "(unknown)";
> +}
> +
> +/**
> + * xe_guc_klv_print - Print content of the buffer with `GuC KLV`_.
> + * @klvs: the buffer with KLVs
> + * @num_dwords: number of dwords (u32) available in the buffer
> + * @p: the &drm_printer
> + *
> + * The buffer may contain more than one KLV.
> + */
> +void xe_guc_klv_print(const u32 *klvs, u32 num_dwords, struct drm_printer *p)
> +{
> +	while (num_dwords >= GUC_KLV_LEN_MIN) {
> +		u32 key = FIELD_GET(GUC_KLV_0_KEY, klvs[0]);
> +		u32 len = FIELD_GET(GUC_KLV_0_LEN, klvs[0]);
> +
> +		klvs += GUC_KLV_LEN_MIN;
> +		num_dwords -= GUC_KLV_LEN_MIN;
> +
> +		if (num_dwords < len) {
> +			drm_printf(p, "{ key %#06x : truncated %zu of %zu bytes %*ph } # %s\n",
> +				   key, num_dwords * sizeof(u32), len * sizeof(u32),
> +				   (int)(num_dwords * sizeof(u32)), klvs,
> +				   xe_guc_klv_key_to_string(key));
> +			return;
> +		}
> +
> +		switch (len) {
> +		case 0:
> +			drm_printf(p, "{ key %#06x : no value } # %s\n",
> +				   key, xe_guc_klv_key_to_string(key));
> +			break;
> +		case 1:
> +			drm_printf(p, "{ key %#06x : 32b value %u } # %s\n",
> +				   key, klvs[0], xe_guc_klv_key_to_string(key));
> +			break;
> +		case 2:
> +			drm_printf(p, "{ key %#06x : 64b value %#llx } # %s\n",
> +				   key, make_u64(klvs[1], klvs[0]),
Or maybe it is actually two separate 32bit words? Why bother forcing it 
to a u64 with a brand new custom helper? Seems simpler to just print it 
as a pair of 32s, the reader can trivially combine it to a single 64 in 
their head if printing as hex anyway.

Also, there is no code to actually use any of these helpers yet? I 
thought adding unused code was not allowed. You have to have a purpose, 
at least in the same series if not the same patch.

John.

> +				   xe_guc_klv_key_to_string(key));
> +			break;
> +		default:
> +			drm_printf(p, "{ key %#06x : %zu bytes %*ph } # %s\n",
> +				   key, len * sizeof(u32), (int)(len * sizeof(u32)),
> +				   klvs, xe_guc_klv_key_to_string(key));
> +			break;
> +		}
> +
> +		klvs += len;
> +		num_dwords -= len;
> +	}
> +
> +	/* we don't expect any leftovers, fix if KLV header is ever changed */
> +	BUILD_BUG_ON(GUC_KLV_LEN_MIN > 1);
> +}
> +
> +/**
> + * xe_guc_klv_count - Count KLVs present in the buffer.
> + * @klvs: the buffer with KLVs
> + * @num_dwords: number of dwords (u32) in the buffer
> + *
> + * Return: number of recognized KLVs or
> + *          a negative error code if KLV buffer is truncated.
> + */
> +int xe_guc_klv_count(const u32 *klvs, u32 num_dwords)
> +{
> +	int num_klvs = 0;
> +
> +	while (num_dwords >= GUC_KLV_LEN_MIN) {
> +		u32 len = FIELD_GET(GUC_KLV_0_LEN, klvs[0]);
> +
> +		if (num_dwords < len + GUC_KLV_LEN_MIN)
> +			return -ENODATA;
> +
> +		klvs += GUC_KLV_LEN_MIN + len;
> +		num_dwords -= GUC_KLV_LEN_MIN + len;
> +		num_klvs++;
> +	}
> +
> +	return num_dwords ? -ENODATA : num_klvs;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_guc_klv_helpers.h b/drivers/gpu/drm/xe/xe_guc_klv_helpers.h
> new file mode 100644
> index 000000000000..b835e0ebe6db
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_guc_klv_helpers.h
> @@ -0,0 +1,51 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#ifndef _XE_GUC_KLV_HELPERS_H_
> +#define _XE_GUC_KLV_HELPERS_H_
> +
> +#include <linux/types.h>
> +
> +struct drm_printer;
> +
> +const char *xe_guc_klv_key_to_string(u16 key);
> +
> +void xe_guc_klv_print(const u32 *klvs, u32 num_dwords, struct drm_printer *p);
> +int xe_guc_klv_count(const u32 *klvs, u32 num_dwords);
> +
> +/**
> + * PREP_GUC_KLV - Prepare KLV header value based on provided key and len.
> + * @key: KLV key
> + * @len: KLV length
> + *
> + * Return: value of the KLV header (u32).
> + */
> +#define PREP_GUC_KLV(key, len) \
> +	(FIELD_PREP(GUC_KLV_0_KEY, (key)) | \
> +	 FIELD_PREP(GUC_KLV_0_LEN, (len)))
> +
> +/**
> + * PREP_GUC_KLV_CONST - Prepare KLV header value based on const key and len.
> + * @key: const KLV key
> + * @len: const KLV length
> + *
> + * Return: value of the KLV header (u32).
> + */
> +#define PREP_GUC_KLV_CONST(key, len) \
> +	(FIELD_PREP_CONST(GUC_KLV_0_KEY, (key)) | \
> +	 FIELD_PREP_CONST(GUC_KLV_0_LEN, (len)))
> +
> +/**
> + * PREP_GUC_KLV_TAG - Prepare KLV header value based on unique KLV definition tag.
> + * @TAG: unique tag of the KLV definition
> + *
> + * Combine separate KEY and LEN definitions of the KLV identified by the TAG.
> + *
> + * Return: value of the KLV header (u32).
> + */
> +#define PREP_GUC_KLV_TAG(TAG) \
> +	PREP_GUC_KLV_CONST(GUC_KLV_##TAG##_KEY, GUC_KLV_##TAG##_LEN)
> +
> +#endif

