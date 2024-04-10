Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A582CD128A
	for <intel-xe@archiver.kernel.org>; Wed, 10 Apr 2024 13:26:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A35D5112AD2;
	Wed, 10 Apr 2024 13:26:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NC/st1Ii";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 815AE112AD2
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Apr 2024 13:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712755586; x=1744291586;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ZcLQVQBDybwlWnH0Q4k3a0QXKnxKjiraUeFBZI8AYjI=;
 b=NC/st1IiO8sbnYFfy2iz4NMxF1nG+0vgrqUDz84Odg+RnI8oktaw0h4b
 CPyBL17HPqAVOzELLG6YMNenTqsjxn3T1e3184ny1X68k6o5uZgiQMiZE
 DBhLNwicxv3khYwbck70SvegvfhJVj2NMhHhXn4Y79NG/KksVPWUS9xj4
 FsiIDNwGj82VNxHy392hwHZU3BaJnjVgEgfDnB2+crqGrmL+RrJPu/ijz
 qnFbBIcqiT4UrMwmCJmyWXPAeMmmGwdLIknuVICSg0ZgNJgmzD/UqBmKK
 4BoiftrUFfbTxVDJS5UkR+mfCFXllDnhSS37xGd+peoyilUBotzZFou3i Q==;
X-CSE-ConnectionGUID: fc3BLFZ1T8++yEcUlj0+xg==
X-CSE-MsgGUID: GRTr71b7Qa2YzhH5r65+YQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="7989723"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="7989723"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 06:26:26 -0700
X-CSE-ConnectionGUID: 5YZr5K1lTaeoQRYAVodBvw==
X-CSE-MsgGUID: e7pDyTKdS221jtSP8UmxtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="25189498"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Apr 2024 06:26:25 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 10 Apr 2024 06:26:25 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 10 Apr 2024 06:26:25 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 10 Apr 2024 06:26:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f3fOxrzqJCpzYqAJkCENARZ2xbKrlM71vwyv81u0JFmQ9P454KpRQFA475jLpiWafBNsSy6/h7QPh5RkirpjS9Xdcltz91tlAz7gonc7nvPtxnoPGmvdpGlJGTJ6fKyPalkr4H48WYa4jjelF1bwOyQ4l4lUX2SGuBzDyAllxWHPCvvr9ctywjIrpfCLy1o9hukSnBI8h66xFzWjI8yDSUz24AiEwA7txDfq9ivCYaQImHAicLufXwhVPMC6Ea8JQ39L5MMJoWSCP3DuG4FGXVdk2GqRnh74ive7snjPqQh9FKziL8fOdsq/VMxLuN/3t63Lo6x83xvDRQxi3SnDXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YM2Ikq0FBSXv92taxXeFUdCf4Z+PJItnp/dETJIp8Z8=;
 b=fk6AsMQtqJyeSfhjq2MjCm2nuVZzhcc4CpsFtOkSsT3Z6Fez1dZIX0Y34fX8i7kPGDFxCIyHnBvB8wHziFKB7DjsN4s3dLYzDc+7tzZnfaMeNO44n27WMDeUvP5HUInedgmInYffcen7ySbGUSKh0CRFg2cB2osjNBxAalwHecErVWBcOlejcid92FC18w7eoCLKIAN5etxSRC8ZYM7zt3ljuJVemLjCypC06XQrZEYNom8yVz9IK8d5Dw277S+34DaDrg6yVG2Keg6wUD2FvAk2cTYOBbGtL4mPPMCBqOE649Eo/GFuwUyVDHGRYWqH9Knm2PZdDrLWTq9JlA7cGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by CY8PR11MB6890.namprd11.prod.outlook.com (2603:10b6:930:5d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Wed, 10 Apr
 2024 13:26:18 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8664:8749:8357:f11a]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8664:8749:8357:f11a%7]) with mapi id 15.20.7452.019; Wed, 10 Apr 2024
 13:26:18 +0000
Message-ID: <642ba995-e974-4c51-9758-f96996d49e07@intel.com>
Date: Wed, 10 Apr 2024 18:56:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] drm/xe/guc: Add helpers for GuC KLVs
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20240410123125.1155-1-michal.wajdeczko@intel.com>
 <20240410123125.1155-5-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240410123125.1155-5-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0074.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:23::19) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|CY8PR11MB6890:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VtbmY5Tdntp2RsnDt7trTZCBKHmThu9n9ZS+4hV252FBdKxsXuLS2Q8coJKKPzrTSPaGhlsFLE507GbML0BPFNDJO17pCIWDKS52ePh2WkS+AZ4/5ZECJA2nD+1f1SC27NFhsiyXoDWrCCMhOg/76+gckDsWD8bbJpWfmfFV6313LrQPn7bL/cZ4ylI02Xn+ppQMzhqUo/+8T0aTlzCl3urVIA0iGcoVnPrxwwEQcmbmYT8XOwQ+2rOw9MnYYjrXLZBrgxMoXBO7+9adnYjei54h1C5qjhy19k6SjhbWHWAuKWgf7vu65UzAkhzBCWSWJza/qaNtUg06SCCCFg0gaywIq3pZ9kgZI4YL5F8SVH3SFhUnFvw57uvbSlcB06yX3xa6hxBZHepn5HKV8Cxflyb5mWEIucbYiZvuJe5rn/qd5bKNsODukI0f3bm1ZFBEPkzQEONZWpyoF3OZb8YmlL/EvQhqc884aa3E26PPZNTbNxnxA6vg47WNpHxymVAeAGEM7LMI8zZ3DBFFbve+KDiOJPZWOTBgGSE6vuStTJlVmj3uvryDwnHXIRUDYKlOIuEMu2ci4VVpOu5fw/peChb4MZ5wvfzgLrkL4krtju4wo30+KLE3r8kSEzaHxOnl8USXaWleVyj3tKKhWw4ylYyX7gUPg175A+JGDpFBBUA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MHZZbU5hd21NTVVMK3pqdCtnL3pHZTQrWUJoQVJ3UnRyY0YzOVd6UWRuNXZ5?=
 =?utf-8?B?RlA3WDFzcGtsSVJqUU0wcmo3SnNZU0I0VnBKOUZHRlBvWnl0WVRJY0VBcGls?=
 =?utf-8?B?N0sveWQ1VHRscWZHOGhlYmdudER1djloZGxnQzlBTS85VTBxQTZPWVRQSWFx?=
 =?utf-8?B?M2xaTG1pMVNJMDRFVlF6bm8xUmxpMmlRakx4V3dGS3dOSFM4Q1V2aGF2WDV2?=
 =?utf-8?B?Y1Z3cVFRZ0YzQ2M3UFQ4dWdIRy9LUGkzM29VNDdnNUhtaCtNV1lvRzg3blps?=
 =?utf-8?B?ZU5aM1pVNUZyM2dhbkJRd1h2aUlTWjRWVzRNVnJTaGoxeWtOQ1FMV1d1cjRG?=
 =?utf-8?B?azl5N1lscHhyanJENlN1ZG5PT050OG8yc0FLSzlFRXMrNmZFNlpuQUdTWmVv?=
 =?utf-8?B?U2NUS2ZuM0gzR1Z0WDc3SlVNK2U3TldYR3crVGJHOFBxcjh5NjR4KzN1TWln?=
 =?utf-8?B?SkxVY2VaT0tGQjR1MitoMWgydmRGNGNpWS9NYWp6dUM1VDY5cmRJL3FoSEY2?=
 =?utf-8?B?Z21mb0hjcVpML0s1eHJmMFRJbEJFMmZBTmlUZUV3cEJlanZhWDJqYzdjMVdm?=
 =?utf-8?B?dWlhUFJDTWJ6c0VvYjM2OU5MUk13aHo0bHMyLzRodVVBa1BkbzlVRkJEd09j?=
 =?utf-8?B?RFZ5czJOQWdIZnlsWFpoOTBXdUkyTjAvRXJ4NmRERnJ6VHRIZmxRTGFFdC9p?=
 =?utf-8?B?M2NCQk92QzFaQ2hmdlhVRSt5QTYraDBPSW5kbzl1Q0xoUE5NcFdCTktEQUNR?=
 =?utf-8?B?UmIvSnF2UDA4dU1kWHVMbkFOVktpcTRLRFZ6UHYrQXY3Zm1MRHQrc1I0RnRu?=
 =?utf-8?B?ZkQrS2hEdXNxcHRyZ2tGY0UrV0t0N1pwaVhucTV2cHM5MWJtR3FTWTZsbnlt?=
 =?utf-8?B?VFdMWFZBTEQyRVVDbFNpVkFnSnN2R0tLNEkzSHcrU1A2RGRINzBZT3o4UEdy?=
 =?utf-8?B?aTFLUkJucnUya28za3BCME91aHBsY2pmT1N5ZGo0MHp2dnk2U1JnMkhCZzVp?=
 =?utf-8?B?SDRpT2VZR2RSaFkydTFBOUF6TXFvRG5Ib3BUVzRwS3VMTUJUYzVjQVlmVGp0?=
 =?utf-8?B?dXA0ZnE2bHA3azZYU28wdzZXKzRCUEdrTkh3cC95dmlkZk1BN3BRTTNINFdq?=
 =?utf-8?B?cHpvUGYvem9qbThIamVLVElLVHdWNENOdlU3bHp5Nm9SODBTU3FzamRZWlpj?=
 =?utf-8?B?c2RTQ0NCZ3VpOFZJck5BT1h4alBHcFA5US9QeXR2L29XOXd4Nnc3WGNMV0VV?=
 =?utf-8?B?QW9mOEh6ZGpVdEJvMTAzVmlxSjM2dXZUUk5KYWFSMVpYOEVPK0VPdnU4cHRv?=
 =?utf-8?B?bVFWNTFFRTVYUGpDRlpGaERocU0wc0syM2dmRHM3aWdpVDl1U1ZaNkJ1Zi9T?=
 =?utf-8?B?OVdOakc3bEJoUmVjcUR3UHQ1dWRQdHhIa212R242UXFDWVRPOWEyNGwydWc2?=
 =?utf-8?B?VlRwSDlwRDIwMkpsQm45UnU2T2lQUXV0VmJudHRZejV6aWwwcjFackltMUlz?=
 =?utf-8?B?WXY4cW8xK09PQlBiZW5HNkVVSXZPMkY4cVprdEdCUVg3dVdqZW1pc3QrTjdr?=
 =?utf-8?B?OHdsQmxlSGxYT3NKc1h5M1lhbWxmSmMzRFBSVHVtbi95cEQ0L0xmSXI1NmFi?=
 =?utf-8?B?c2NZY09ncGJGdzBGa0tBZ3JTU3k3T2J0Nm1xSS9zQXY0U0tIUy9NVGs2a1hk?=
 =?utf-8?B?YWpGZHNMbVU0OHlYOFFvNXk5SXk3NDUvRC80Vk9vTzh2WEZSWWJxTmFia2s5?=
 =?utf-8?B?aG1KWjhLdzF5dUd6YzBXNXBVckZKT1VlcnpMenlIY0pEa1NxNHk0aXJFQjZk?=
 =?utf-8?B?dUxzVm0xVjFOOFJ5NHdqbnBxMUdrd1dhVG5JY2lxZncxT0w2MllkMWc1NGdV?=
 =?utf-8?B?dlZ3eU9tek1oSDdZVHdPVW9WUUpXSU4xeWU2WmRES0dLVVVlbHRRdVdNYWMv?=
 =?utf-8?B?YmMvT3JneXFBN2wwcTdDSWVtVkd2amgzUXIzRWdvbjhsUjJJR3Znd3RjL21V?=
 =?utf-8?B?S1pLdkZRTnIwYjJVWHZsRngvMkNUNlZvbC9ibjRTMEpIUnV1cTU5RFVrYjFj?=
 =?utf-8?B?QlBGR0NETkRpK2JRajFUYUQzVkJBVXFvK0M0cjZWN0huQlRiM2ppSTQ5UGVL?=
 =?utf-8?B?Z1dRajVoK1d6U3FFRGJhZmxhTVNVL0dySDZHM1F1ZkFKbHpGaVNwb0lnNDdW?=
 =?utf-8?B?d2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d99ba884-b6df-4a12-df3a-08dc5961cde7
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 13:26:18.4489 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3+H/d6Udpv9ewI9XCtwvSB6U/PpNe8eRqzEXW/5nmyUARA6H3p3YdoFImEKPszeferIHFBKMVAZIY9liLI3PSoCSfwR2KjRIIEE7Z7gg4x0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6890
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


On 10-04-2024 18:01, Michal Wajdeczko wrote:
> Many of the GuC actions use KLVs to pass additional parameters or
> configuration data. Add few helper functions for better reporting
> any information related to KLVs.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
> v2: review comments from Himal
> ---
>   drivers/gpu/drm/xe/Makefile             |   1 +
>   drivers/gpu/drm/xe/xe_guc_klv_helpers.c | 134 ++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_guc_klv_helpers.h |  51 +++++++++
>   3 files changed, 186 insertions(+)
>   create mode 100644 drivers/gpu/drm/xe/xe_guc_klv_helpers.c
>   create mode 100644 drivers/gpu/drm/xe/xe_guc_klv_helpers.h
>
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 8d79df05b84f..ad238f48cf51 100644
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
> index 000000000000..8927374f55ff
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
> @@ -0,0 +1,134 @@
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
> +	default:
> +		return "(unknown)";
> +	}
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
> +			break;
> +
> +		klvs += GUC_KLV_LEN_MIN + len;
> +		num_dwords -= GUC_KLV_LEN_MIN + len;
> +		num_klvs++;
> +	}
> +
> +	return num_dwords ? -ENODATA : num_klvs;
> +}
For the suggested changes.
Acked-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
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
