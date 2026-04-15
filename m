Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2A38F41987
	for <intel-xe@archiver.kernel.org>; Wed, 15 Apr 2026 10:19:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C59D10E6B9;
	Wed, 15 Apr 2026 10:19:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iLt/ZLwJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0F7510E6B9
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Apr 2026 10:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776248368; x=1807784368;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yVC9PVenqAlwRtHCDfTEtzIRaf3Bob81nEE5VEyYOec=;
 b=iLt/ZLwJHNLSY9O8uZvaz6kNJ6c2sTlP5XC99n76UqsSmfbYp6rONNa4
 hQfZ09hbg4GIRdDZsbpDg1xU3VuTdCozVhPVKczSW5EVLNZkI2qtAHm7w
 V2x4xp8yWaCtcM11ogcUKvmr4AQCWi6G/9AFPRziN++Kyo3tZ1E++rbBx
 ltXnHdiLubQ4/WGbbcf+ltVLC9g+Qy4tC6nBoMNDU1ETybMLrSopWUf1h
 bWFwMQdaHhKvWtRyaejsFzeO7+tw1+wdB0ux3UzGOK8mVRC1IZnaw/tGJ
 d7s7YmK3jps9Gw0yX3XW6+yLNWg4vrU2V1WzC8wOuH6uOoF0V0fOAuOR0 Q==;
X-CSE-ConnectionGUID: h4nDCWB7So6PdcvpVsYE9g==
X-CSE-MsgGUID: 5xtsGjL+Q8m9PvqpyaUvsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="102679491"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="102679491"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 03:19:27 -0700
X-CSE-ConnectionGUID: ARMbycrZS2aRwkIM1oK87g==
X-CSE-MsgGUID: U91edft1SCWDiflvMl6vBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="268380111"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 03:19:27 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 15 Apr 2026 03:19:26 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 15 Apr 2026 03:19:26 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.56) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 15 Apr 2026 03:19:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C9y6/B0AssZythfBLPGprTXCCZgFDtHQVL2XVyGLcDrTzd4wfMq7QZia1pUXg64NJI6dSYQAyeHL3qS/CjM9HQk1hYWCD0M4AnhEiepWw8UVPeZD8N1TLxdVWV9G5ywy0evE4Od3UMoFTBGLD9c5fObnEQOIJnPKZwnFit0a3xBq7xqxeiKOoXna04CB7Tx4I7s5IPZa+jT65g/Q88CUDBTTSMqtQnkcprcI3w/zHiBuc9Jve4Kug/TOqlzFTdsyRNae85lHPdZF6JPKjFhn+YsZKKfV0DS57MR/0wvRbYLOnSd0OYAS1H4XKIqkZEdoDMBMBmVSbmURXzH9afPhpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lCDFMo3znINLYqND7uhyyoQ/+JJUtXnDHTX9lG9EeNg=;
 b=aeIyNXx4ERLK2NOPhzyGb5wDReaOzcwkxeRauJj9FE/UM5Afi7vQyC/UgXUoyqZTFKLZD/zPzhTk8ecxFHAYD2AwbSwBE6qLZFqn2cz+WObgrLFWPX6YgbJa2JEZ6HftTVYorirZJIp5dP35eRMXeDA6GhLMQEwj4WFzmTjua8wJU/bGyL40SJ6KUDr8QlaSLl12k3a3IAT1LBBfBpn7GQ7w+1NfK9xuDZl+CkI+emixYMRKn8X0P2Pq9+LUdL8n9J3jobvI+xjJlN8y+JXI0UFNHeMzV+23cN9j7qMxJpbVIRUuz5CBbTzIywBH6lQWuQh488g6oW90Ln/WSRBhcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by CYXPR11MB8663.namprd11.prod.outlook.com (2603:10b6:930:da::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Wed, 15 Apr
 2026 10:19:24 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%3]) with mapi id 15.20.9769.046; Wed, 15 Apr 2026
 10:19:24 +0000
Message-ID: <66230450-64f5-440a-bc5e-f09a449733df@intel.com>
Date: Wed, 15 Apr 2026 12:19:19 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/pf: Streamline fair scheduling error reporting
To: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <saurabhg.gupta@intel.com>, <alex.zuo@intel.com>
References: <20260414220409.119614-2-jonathan.cavitt@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260414220409.119614-2-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR08CA0259.eurprd08.prod.outlook.com
 (2603:10a6:803:dc::32) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|CYXPR11MB8663:EE_
X-MS-Office365-Filtering-Correlation-Id: 92d2cfa2-b346-40b1-2c2b-08de9ad87747
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: QbVsf3paH1t1xPNOhbkptPTmpXbXW0zU96lY952VVvpIh0Qil/kai9E+DulDbLJoC9YC6k61OG/6Vlt+cgHF26l+/idUJnP8W+NWOe+fPLvrN7hY6+Ng+0lNnu3ED8IU3ZihkomIL3uQ2ii17Qv6cDlfNBvgTWgbGmxcDPAWmMUxABcBnE+Uznt9aD8AeCcSdkzKGJL6d7WA5tGVKPZL8AWsGWeN2eGhyF0n4GWbG22eAIeBFHEdxDb5oQ4nEI2xWgxdwuZ66cXOSgHS7wo5BtNHcbXwlKOTZurrlOgRfeBrAWCYuJQVwVBTfElp3Er7wnx35Q4J5hju3TxhbORDwD9mXaurh0XSRkXBW+h/doLHba3/+UOLeXXEsfOiHMYYpz3uOCi1bJ/MfugPv+7njMlDbOskXUXx/3FYRJtneH/X5qtxxeeAo3kZfdofCJC5dyiudD4LGVts9Moo7vjx1asfDr3v1IZOXP7LGIFRXu6BTPGVl3ss2plfs/n/FH2xToT+R3JJ/yMplylbzAeciY3lcw5iKIV2X5ha2fQQmICPj3Rc4xkwTrLR+lI7h23jZPGz3cbAKG6JjeO+nqFu4K3Frxu0Y4/0/GKef80J+XHlZqGB8znh2n/1K8ctxBEsZk+YSKuDW5YeLtsdFRmZnG/ofAiuvjDodKnYy21osH1e/gvcrXzj3Q5imArtcJKjL4avxRZfuW9Tx43/p+wLAyVLhrkOK0q7SMU59nJWXvI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b3l6UXZOT09CdWE5VFl5M3M1Z2REcVNFMnJMZ1FLZzI0WVE1MGJuMVRkR1ht?=
 =?utf-8?B?UFpGc1FUcjc4dEFleldUL045eHk2bUNMeEtobkpyaGF3bUNTeUZ3eHlVaEd1?=
 =?utf-8?B?djVVL3hmeTRtMXJlTm9BWXIwMEp3eVFObU5UVmZPZEZNSDJ6UEo5V3VUKzlj?=
 =?utf-8?B?RlpSZnRNNTUyVVhjY3RYSDR4NzdHWkthL1JTblQzdUh1c2IzdzFubW1YRnIr?=
 =?utf-8?B?YlNoTXRUMkl5Z2JKY3VQaGdLM2ZsdC94MjBDVk5mRGVQMm5pSzVpZmpaVXhN?=
 =?utf-8?B?aGhmWXpuN2xjZEt1akZWVzlFT0R5ZnpHN1RsbHFIaFZDMndaRyttQlV4aVhQ?=
 =?utf-8?B?NXJxNUlTSGUyb1RtcWpReEZIT2Y1ZEhVSGFSUWVPeDlHMVBtMkhUSzB6QWRm?=
 =?utf-8?B?YW1ZdGtOSXNVcWd0RDI4RjBoRGVnbXVnT2lRaTRHZHVsQ1JoaWs1b2ZZL1ox?=
 =?utf-8?B?d1NHVEFVMVNFMzNsU0s5dlR0SHNrNHFzakQ2N2RsbXBQV3d2Vi9jZ01pVDg4?=
 =?utf-8?B?KzkxQ3N6SlJsMlNSQi9qdnZUbFBzaFFsNVZNUkZQVlQ5Q3BpNzRmM2JhV3ZO?=
 =?utf-8?B?aldzaHE0UWVKcmtmTzc5eFo1a0tFZS9vbEZ5aXVySksxaUxDakxIc3c5a25q?=
 =?utf-8?B?cHJCbzlkaVlLVTFpMnB2dTk2YmhXaDBleGhuU1dLQnRVaHIwcjdIMklnWXJK?=
 =?utf-8?B?QUIvNWFtaXAyZi9idFRxYzNLU1gwTmYyenQ2bXpHT0VLZEdJYUlQT2VsQXg0?=
 =?utf-8?B?NEFkSG1YaTRpblNUWW1YRzI2WDNLRmgzMGQ4RUZJMVFIbTRHQlhhRGRVWDZR?=
 =?utf-8?B?YWZrS2xuL3VmNGtNenZvQnZ2TXR6YTNyU0VBR0ZCUUsyc1JFckxTdWZFeVpW?=
 =?utf-8?B?VWhwQWdKZjB1N0NVSStSTGJnZG1GalhkakxodUF5SWhJaDltbHNHOXdWeHpX?=
 =?utf-8?B?QkUvU0Z5ZFJrQk5oY0lORVdkZnlTVEo3Z1F6QU5aVm53eVhmRnFkQjZoQ0VR?=
 =?utf-8?B?SWh2cnRKcjR4NUxVdjBrSXZ2VHFWS0ZySzRDRW1wZ3c0clJXcWt0RHBURTU1?=
 =?utf-8?B?ZG1ibnpRYm5KNUVCNHl6OEhoQnpVYllPc2E1eUZQc0tidjRabzN4NEp2T2N2?=
 =?utf-8?B?eUM1WnA3Q0E0MU1aUGZYaWhXQkxEVWc1TThhaSt2enpSb1gvYnFjbDNOREQ1?=
 =?utf-8?B?S0p1aG9GZnBIbTVqd2hhUWNUbVNqSXgreURZL1QrWEN1WXVJQUFZUjVrWmg1?=
 =?utf-8?B?WDJoZDJPaGpzck1LOU1vVW5uRjIxNU5DakVvUWZ5YmI5eUNJejIwNC9aektY?=
 =?utf-8?B?S1ZYVHlIVHNENEYzUTR6Ykw5ejl1MmlLY3NXVHFySTZZcHY3d3pZekp2MWhE?=
 =?utf-8?B?OGZGdVdRaDY0VlVlandNVlVxM1dnako0SHo2ZHh3ZVhTNThhb1JmQnZBeEl2?=
 =?utf-8?B?TXNzeFI1Z3lhQlJnQVI1bzljdWM2TWh3TEdoSlZoRjNoRzFMWURUcmNLck5h?=
 =?utf-8?B?STdoNUJQRFp2WkY2YzROWXBqSW1NQ21mRnNabVFpSm9qZlg2bGs3cnBGR2Zq?=
 =?utf-8?B?UWNsZkRvZTY0b2VjZzRtUjlCNnp5NnpNd0JGM3k1bjlFeXF6cFN1Q0ZtZnZF?=
 =?utf-8?B?Y1ZxVUU3eFExaTg2RnFLWjlRc1B6S0wrb3Jha2ZnaFp0NnpHU2o4aU5HUTZM?=
 =?utf-8?B?L2ozNFRYWDQxSWFaRXlOb3dnMDdkYTA4aHFmKzFyUW1hekZIVXVkZTFhVmRO?=
 =?utf-8?B?WWt2VTNyYWgrY0w2OENCbVFxK3A4UVNQYzg5RTdNSllzM0gyaXZndm5oeWtt?=
 =?utf-8?B?ZUorb3NsM25JV0JnM0ZiK3JKMitaeHhwWmlaSTN6QTZVMkcxWXhoazlWU2ls?=
 =?utf-8?B?UzhXMVJBb21Ob3JOTExEcFFoK2tRREd0RFp4eGI1VWZSK1NnbFhIWk1oVEVu?=
 =?utf-8?B?Z09jSFZSQkxZTmNZVlpBeTNWVWY1L2xqdHQ5R05oUXZGZW1NdHc0RnhnTUp0?=
 =?utf-8?B?bUFqdEZLK2FpVXRRSmNmT0llM1RvM3UwdUJybnl5Lzk5ek1RTTJTMWJ1L3lK?=
 =?utf-8?B?cVFEZVI2b0tOZVltd2FrL08rL2ZVQTRNaVQvZ3JralVwRnBnNW11WjJaRkgy?=
 =?utf-8?B?Rm5SMjhNdW5LOVY0bW1iSXBxTHkzeUtMZzlPYnF5RGNLV3JnL0NVV2ZiSEly?=
 =?utf-8?B?eGswNjNSaW1BUElCYjNab0xFbGE5MHhXL3BmQ051ZlNrNTRRM0NvZmtJRHRw?=
 =?utf-8?B?TERSWVc5UTd2M011NkxJbEpPS2lUTXh5STg1YWhaUnhkK3cxaWc5K1I2L01C?=
 =?utf-8?B?eCtGTGRVaUIybUxYQlppckwwc05mcHVNcDlndGdBWkR0RjVsU0lqVEhkdG1l?=
 =?utf-8?Q?gTDVnrLNu7eff5oM=3D?=
X-Exchange-RoutingPolicyChecked: SaqX+b0cbhINLRsbPr+kOHorEFvJRsbkkf+m01W9OPbImHc6io1OFidFKnNqZlm8vT2mfS4f+3ttVm+bLmNxqySq0wEdvMKF6ZdhnWRTmPKCSstGbUXGXd052VAGhdsaejYQeJzyLSiUMxi+wyMF/YwxO8B0gx1bCpQOj+ajcEpbNQVODUYq3FtMpvl0jiCWdl8IWImjbBamjWdYZe+ivLgn9HiZroc7/+0aasL21xun9EJ+Z+VjdnWUXrkMuDg3xvzVzO5sfLqCUXvUAqxpxlUoucs0Lb5eTm5RCIOLDXkluoC0vDDq+TN2xRENfRLkB/S7OFOW1uylDag+eQUupw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 92d2cfa2-b346-40b1-2c2b-08de9ad87747
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 10:19:23.9283 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wqX7qCAATowOK10x++EVAtk21wEhahcu6pdG2TXFId68wquLApaoVZYZZze4mrYnzLMJ48MMiYUBoOD9okb54yixCqxcYF+1E9UVmd8x0Ws=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8663
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



On 4/15/2026 12:04 AM, Jonathan Cavitt wrote:
> The function xe_gt_sriov_pf_config_set_fair_sched returns the first
> error result it encounters, or zero if the function succeeds.  The way
> the function accomplishes this is by only overwriting the result value
> if it is already zero.
> 
> The function checks this three times, but the first time it does this is
> unnecessary because the result value defaults to zero, meaning the
> result is always overwritten.  We can streamline this by just directly
> assigning result to the return value of pf_bulk_set_exec_quantum instead
> of assinging it to err, eliminating the superfluous check.  This also
> means we don't need to initialize result separately from err.
> 

but the final effect of this patch is ... nothing? 

$ scripts/bloat-o-meter .build/drivers/gpu/drm/xe/xe.ko1 .build/drivers/gpu/drm/xe/xe.ko2
add/remove: 0/0 grow/shrink: 0/0 up/down: 0/0 (0)
Function                                     old     new   delta
Total: Before=1720641, After=1720641, chg +0.00%

and it was written that way to focus on the actual steps, not their
order, as order can potentially change when new steps will have to
be added (and maybe some must be done before setting up the EQ)

and since the same simple pattern is used in other places (where you
may still argue the same 'optimization' could be applied) I would
prefer to leave all code as is, to be consistent and safe

> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>

btw, instead of Cc: managers, in the future please try to include in Cc:
here the author and/or the owner of the code you are trying to modify

> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index e112aa148dab..bb9811bc64d4 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -2725,8 +2725,7 @@ static bool pf_needs_provision_sched(struct xe_gt *gt, unsigned int num_vfs)
>   */
>  int xe_gt_sriov_pf_config_set_fair_sched(struct xe_gt *gt, unsigned int num_vfs)
>  {
> -	int result = 0;
> -	int err;
> +	int result, err;
>  
>  	xe_gt_assert(gt, num_vfs);
>  	xe_gt_assert(gt, XE_FAIR_EXEC_QUANTUM_MS);
> @@ -2737,8 +2736,7 @@ int xe_gt_sriov_pf_config_set_fair_sched(struct xe_gt *gt, unsigned int num_vfs)
>  	if (!pf_needs_provision_sched(gt, num_vfs))
>  		return 0;
>  
> -	err = pf_bulk_set_exec_quantum(gt, XE_FAIR_EXEC_QUANTUM_MS, PFID, 1 + num_vfs);
> -	result = result ?: err;
> +	result = pf_bulk_set_exec_quantum(gt, XE_FAIR_EXEC_QUANTUM_MS, PFID, 1 + num_vfs);
>  	err = pf_bulk_set_preempt_timeout(gt, XE_FAIR_PREEMPT_TIMEOUT_US, PFID, 1 + num_vfs);
>  	result = result ?: err;
>  

