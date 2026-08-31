Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65368C61DE2
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 09:46:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1055410E7B3;
	Mon, 31 Aug 2026 09:46:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EsbZG+y1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 981D710E7B3
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Aug 2026 09:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788169567; x=1819705567;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UO7Az6hzlpWA8BSMsVl7wWaFHcdQbrOM+Z34kZBcQNI=;
 b=EsbZG+y1LX5/KPA7lox2+Cdz7O9NdIVsepSYHedgarsvDCHX6zNUge+T
 vAQ2Pak8TOdcweQ6PW75x1utGq64UUOC+1ebnbdRwHPn34hQahAcYUHsV
 vYooIZoIsxKidCgPYbJmOKwGDEBCUKbdYEt4FY76fs5y+nfnRE+/9mrk0
 pDB23w6Fm4hphaoMxfUScWchqUhpEv9yoJ9x1wP97rvLkepOQSWwW1JNO
 SBza4od3tZQ6IiuG4/s4IGdCu2FNV1/dAf9H6m8LXD7IhBCVsV0UviMKi
 ExIx/IIcw3GJvYn/WeQBdMKw6mYTlqMpe7M/zQMFLJOHTzyaJ1S4zvPrf g==;
X-CSE-ConnectionGUID: ich6r83nQm6RAlx+soqW/g==
X-CSE-MsgGUID: VghC1KhzQ2aoAC0TgqMeOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="92437861"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="92437861"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 02:45:43 -0700
X-CSE-ConnectionGUID: KzfBcFByQbKmzBpx93KVcA==
X-CSE-MsgGUID: U/34V9mJQaCPl1jBkqBM8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="270677764"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 02:45:42 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 31 Aug 2026 02:45:42 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 31 Aug 2026 02:45:42 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.70) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 31 Aug 2026 02:45:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v4a87HZM6PTkeh6zuUdqWjOnxAeaXEvEPbgmnsYu3uHKgdzIZYSdXUnhhK18PX+Oa0DI8gDgsk/vGF7bKDICvxWNg/kPvLiUZ80FI0tvZhb9RJlNpqDR7iM+tQ8h+/WY+Uw4u8vUIUn4jJ8MX2p5GEUgFgX/AycZ1Rp52Cgmt5pG19nyqYWlJf+X7s8Y+xpLIK9YC313hkGEYDHqM2sZ3g39JX5fIBfTafX+1cihVZ3HLfp6LREE4hgFQ0Gn4baob4hj6VRgQWUAwuXEWbidrh8PWz2uzceBx4EjaznBAN8BF6Xr/nrPH0628nhsq+7qz1WQN3Jt4W0m/jYRRWAHNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VL1r8cbUS/L/d0nnqSj1tfZGWfJdY/utL6UdP0jUXaI=;
 b=efbLKX5luJFIMs1huOBlNXINLKZdAmQ0PDkEAK+RVbs7/WGCxpbhQ1a1uZmnSkhBBd8IIkUUDoh4zW3P9IEsF2HqQuB27IWJvrg2HYR4CYMJaM1XLSaHqkCtVqLtIiflHcjt1zylfAnezqHLP8UhtOE5uRK0PR9s1Lo6cIW9iYNcE8njwUz9icARzbtdTEBBwlBt1rBUMl89fa7UX9t0TiVgt/Rqw1ZWZAzvZbugtauBsM2pjh/+hVpGe/8ReBwplozkYmWMYTZX7rqlg+4VKUy4KYSLUV6VQRQhUxUqfyY8QCvKd+JqcLob5D8aMBZBvIRZjpBsFLrvXZ+d6pPf8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by SA1PR11MB8373.namprd11.prod.outlook.com (2603:10b6:806:38d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 09:45:39 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::ccc3:3fd6:58f5:927]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::ccc3:3fd6:58f5:927%6]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 09:45:39 +0000
Message-ID: <564c4abe-b0e0-4989-afab-b88fa185e995@intel.com>
Date: Mon, 31 Aug 2026 15:15:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/vf: Retry GuC state reset until timeout
To: Lukasz Laguna <lukasz.laguna@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <michal.wajdeczko@intel.com>
References: <20260831092118.488317-1-lukasz.laguna@intel.com>
Content-Language: en-US
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
In-Reply-To: <20260831092118.488317-1-lukasz.laguna@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0300.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21e::13) To LV3PR11MB8695.namprd11.prod.outlook.com
 (2603:10b6:408:211::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8695:EE_|SA1PR11MB8373:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d9da03d-bb48-4400-57ab-08df07449d42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: u9lHmf7t5OCijVsPZY6INycUsL01x3EGe7WweSzKTpXUifQWT+mTRwF5Y72A5ChVj6K8C8eowL/g5qTMsZzaRB1DTX8FYO4msXgib7xx2BkAmSaJsdJAQ6nIWjIbXAkJc2sOwTwAQGPPvH/IpP4GYYdBLmaqaNrXf8BzlCBfcDRL4zqSHOGyp9hzX+MT/h6Vc/MXeRDGVgG66voFP2LGvf9FMZ42oAGapbzD3Glb9uZkg1nyjj3FY9jaIZWEl7aHEODK3ilXz81MCIm/OXuzDVsFvPnE5z3IHFe7Jet0RC0PWaneJ0mRgHZwihPRhr7LvtBcvv4st3u6PCg2gWZGZVGScAFjAwkD28FEOJUM4m0eXHhNbGyxIUvcDZHGJ+HDjVInyDSVT1TYjg45l12J1VwZrfJxah6aNKQohz8JkwNg5TMX4utAsO623ja+ggjx6wL1Cni1rosGpG7qUQw79v5pRrO9rtn+A7lqmni4qWETk/Vvt1+GD6obP78tRwFxU4tGKsdNf2rI08dWpU9E3/XUmk6jlBKSUE5bfFM8yNOSKIa0OT2ape7EB5V3f+mNaw1cCtluhSlKSPtSl7ZbPOWEgRPTfW8vSJMkX/mTQQkU10fBDIP7iuYFpYaWYexloDQ4uNje7OBE6FxL05c4zbz2VMZRur7O2qPquOSuU2A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bE9IbFNjMjNMR1BRTXZOdSsrdzV2SDNDRkJia2tmc1QzWnpDUkFOQXdNdGlz?=
 =?utf-8?B?WUlCQ1ZvQ1M0T2NLb2tFTll4SEVBVHpXY2tmamFXT1Z0d0wrSDduNGhVYnJh?=
 =?utf-8?B?NGhMVE1QdUdPUkxMSEt0R0FwSlQ0cDhTdW9qRExqYXdkRHBVQk15ck15dFcy?=
 =?utf-8?B?L0dlVkRXU1JucDlLTkRsZlNpZnRRMW9PVXhYNFNvWmdLcEl5cTNDQ0NOOEtB?=
 =?utf-8?B?NnVIWFBkTytycENhRko4ckNwR3RYRW11RjZzL0FVd3NKeThZM0N3dVpoTkFx?=
 =?utf-8?B?S0hhT3BsTk13R3ZncGYzRWtROHVsQjFzVzNKUTh4Y0dCUjIwWXlYeC9OMGM2?=
 =?utf-8?B?YnBWcHRZSWl0dmc5cnZ1dkZhYndoa2hkYkhyQUtiRlVnbWRwclNxR0xHYmdN?=
 =?utf-8?B?RDZ4dVErWllXVGtXNDYreWlVa1AwVEdVME5kZ004NVpJT3lYcWZsdUZjU0U4?=
 =?utf-8?B?VTErcEErcGFQdi96UnhwNWxGMlcwSlJ5Q2hoNXdpU1FjMkh6WlpWQytBVDhE?=
 =?utf-8?B?UmpzVmxFOHl6SG9QTGRZV2Z1eUpqLzdxbm5hK0RUS2VoeU5lazBJc1JsaWVK?=
 =?utf-8?B?cFhqYnh4WnZqZzk3R0JsaVlEU3BzNmZsOGtBaGVWTHo3WEZzRk9Bd25BTnZ6?=
 =?utf-8?B?WHcwck1NSWVLV21UaFhiWTY2cHR2NTJVazFseElicnNtZTVSTkNPczJnWkZo?=
 =?utf-8?B?SHU3bGdWandVR1h2Nk15TmlzYStoQ1g1dWRPMW5xVFdHQjJvNzI5SXZZVVJ2?=
 =?utf-8?B?NmpWVm9pTFlyY1JSNlptWVhIamNmVzZUdGIzc1QzeUw1aitKN2MwUzdNOVF4?=
 =?utf-8?B?Q2tSVmdxTnpIcjhSYWpOWmU3NnFkWUFVWVg1WnJ6eE5ZMDBRNkN6ZWxtZVVa?=
 =?utf-8?B?eVFoN09ieGdGZEFxNTBQODg0NzlVQjhTWmVmSE9MbDVDTVZqQ1BCQmRkKzV0?=
 =?utf-8?B?QWZzOFRoZ3d6OGZWdjdIT211UTNzd05Pc01RMUo4NlE0L2xnTVdPMW4zVGRN?=
 =?utf-8?B?VDFPSG04U2F2UFlBTDZSOHdYVHBwMElLWWVncGJ6L1NKTDRxQ3hPK25ncm1u?=
 =?utf-8?B?YUROZnBSaTd3OWFsa2E4QkZRbDNla2wza3hYT1I5YVMzdEVwVUowMEsxTkZ1?=
 =?utf-8?B?SjFiY3o0SWtMb3VwVXUwY1ZkajMyS3c0YWIwYzNEc2JTOVB5TFMvRWp2OU14?=
 =?utf-8?B?WlBYeHhkWnplMW1lb1RJNWlXNGE0WUF3d2thTWRrcU56OFVxa2hEdU5Namp1?=
 =?utf-8?B?Sk1Sem1FVjFYcUJJSlhYODU5MStYRmY3Z1BPbmVEVVVCOVN6aFZrQ3JLK3gx?=
 =?utf-8?B?VG1pc3BhTXpvUk1BaWRZV0QxckVZcEM3UGg3NmszcFRpQjZIL2pTLzhrNHk3?=
 =?utf-8?B?OEJEbnpLSmRFMGJ1T0w3UGNJQUZ2TmdreTVEa2RnUStORFlhNWNxOEtGb0dX?=
 =?utf-8?B?cVNrMlZDYVRzT2ZnV3cydjFTT2grd25FaVVZQkpiYVUrMEtmYiszcmdOMkRJ?=
 =?utf-8?B?VTRraG9RTFoxQ2JYenFHR2wrQXFzWENlRGJUL2JZVkZjWnFhcnJXV0ZYVEhB?=
 =?utf-8?B?RGo1SE41bUx1MldvTGw1NjY1MFFBZjY1L2xRdU1CL0dpeVVSd0Y5VXdZam5O?=
 =?utf-8?B?WVV5eGlNc0pNOTNuV3pNSmIzeFRrVXV6S0J4SmdGbFNQTkZkOVN0bkVjaGZp?=
 =?utf-8?B?RUdKUDhQbnUwWTVvSXVCTmtPRnBZTm15MnhnSEMwSFJGUWhCQzBLUUdUaE1L?=
 =?utf-8?B?Vm9SaGRsT1dsYkRjN3hTbzFWUFA1YWNobTlOang4a01JNkRrYllCTkJ2SU01?=
 =?utf-8?B?YzJKU3d1UzM2NzNtdVJxcUNnNy9lZVBYd2lqc1ViUTVxWW5ndXAyWDcvWVJu?=
 =?utf-8?B?czBPTVR2MTQ2OWI0WWlicW4ydm84TjhzaVFpQ3R2dFZING9GVVRpMXdhMVBQ?=
 =?utf-8?B?d3ZqSUQxVmZDU0IwTENoYkJkaHhENTRwWlVudVQraTlyOHdiN2x3U0ZRM1ow?=
 =?utf-8?B?VUZGSndXVVluayswM3htSnJRYnUya3ptdFRRNENuOEkwNkk5WkhZNUJsN1li?=
 =?utf-8?B?dlFUajRjcGpDUmp0NW5xVTh4UDFzVGgvejhHY0wrV1NXcHY5Z09nbmlWV2o1?=
 =?utf-8?B?bkhNdDI4Z0NkOHJhRVRON0lhcEtJU21EWkFHTGRHZ1BTZGlpZDMyeEZyMnRr?=
 =?utf-8?B?TkVHa0JoNUFCUURsUFB5OURtWFBaSmY2dzQvVm1tN0RzcTVlSmYxa2sxRzBZ?=
 =?utf-8?B?dDRVSVhOMG9MSjNlRGtPMHVpT3NrOStSSzYreExGZnBqSXpNdjFEWmZmVnlu?=
 =?utf-8?B?QWtGMW9hRG0vaytXd2wyNTU4aW8wbk9rN0p6L0U0SlNSRVpGenpQcWxXZklM?=
 =?utf-8?Q?B9KoJDlu2620TkrI=3D?=
X-Exchange-RoutingPolicyChecked: Gb6lSKnwDdVteUHHrvGXy7dlyAOzkOCqmf6sPjbOMd8KJchXtTCwaWxsLs/IR8ysj0vSyCrM/2ZxvAk8nuj+CXTiKuIvAm0FPYOJMYEZnXlrmc+7TmBh5N6DpT7dMy6mvWc4FLZmLoO2HdZ8TeVgJFs0w3t3SF5FfCSlNUxvO/NWw1Qo1rOkWPLLfJ1Xtob+htFqgjwSQ6LNocsxO8lpx4L/I0kLgz1YKSkJd7VwWC9tt6sbudxztde9yYMrYA3n1R9cFVDgVcN/WTSrH+sL3cj88mgOuHYTl1EvzTJd38y4pECN7bl+q4KwnOpH4FJf8xOnYfmlMzp0dv64+7vENw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d9da03d-bb48-4400-57ab-08df07449d42
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 09:45:39.1059 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x7k233IlIJQG6yoGQaeXbwEmtcScr3ohF3zn4E5iPQEEObMVA0y19F+9LCfvHFUroP8xZnngC1YmaukXVENz8tBWurOWa2VGIYR0aQsiXXM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8373
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


On 31-Aug-26 2:51 PM, Lukasz Laguna wrote:
> Instead of using a fixed number of GuC state reset retries, keep
> retrying until timeout with sleeps between attempts.
>
> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 12 +++++++++---
>   1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 37899fcf5b22..01873896f77b 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -31,6 +31,7 @@
>   #include "xe_lrc.h"
>   #include "xe_memirq.h"
>   #include "xe_mmio.h"
> +#include "xe_sleep.h"
>   #include "xe_sriov.h"
>   #include "xe_sriov_vf.h"
>   #include "xe_sriov_vf_ccs.h"
> @@ -86,18 +87,23 @@ static int guc_action_vf_reset(struct xe_guc *guc)
>   	return ret > 0 ? -EPROTO : ret;
>   }
>   
> -#define GUC_RESET_VF_STATE_RETRY_MAX	10
> +#define GUC_RESET_VF_STATE_TIMEOUT_MS	10000

How is this 10 seconds timeout derived? Do we have any references for this?

- Satya.

> +#define GUC_RESET_VF_STATE_SLEEP_MS	10
> +
>   static int vf_reset_guc_state(struct xe_gt *gt)
>   {
> -	unsigned int retry = GUC_RESET_VF_STATE_RETRY_MAX;
>   	struct xe_guc *guc = &gt->uc.guc;
> +	unsigned long jiffies_end;
>   	int err;
>   
> +	jiffies_end = jiffies + msecs_to_jiffies(GUC_RESET_VF_STATE_TIMEOUT_MS);
>   	do {
>   		err = guc_action_vf_reset(guc);
>   		if (!err || err != -ETIMEDOUT)
>   			break;
> -	} while (--retry);
> +
> +		xe_sleep_relaxed_ms(GUC_RESET_VF_STATE_SLEEP_MS);
> +	} while (time_before(jiffies, jiffies_end));
>   
>   	if (unlikely(err))
>   		xe_gt_sriov_err(gt, "Failed to reset GuC state (%pe)\n", ERR_PTR(err));
