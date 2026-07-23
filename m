Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79B37C531F7
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jul 2026 16:21:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79D8210E5C6;
	Thu, 23 Jul 2026 16:21:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QDjNtvQU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C6BE10E5C5;
 Thu, 23 Jul 2026 16:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784823694; x=1816359694;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=y/j7OTgV1y+KhdRAPhVWuA3fMnXSsDnLtb44o752hOw=;
 b=QDjNtvQUD2ryuzYgdOvdRbSj1M5HMHXRrB9jSS0NkkW+EfjOtk8Kc3CW
 blu6DoeHgz1teSpRdGGZxE+A0lqsNagZ/zZb3E1MjAwIM3gsybU6YNJDH
 AtGKcZb9LtT5nz0HnyAQR7ny1bZLU4W0EabLWgSFsA8BLuBqGniibmSZf
 z7nEBJfbGltBD+YEcffLQ8hrFHA/6nWSmi/Q9ijviT8rcL0CUsr28TlCq
 jA6/9EHeEreycjSRpdv+qRZnjOqsz162Ze5RxwdgqqcHEvrC4YL6fuW28
 wO2wD+Nled9k1duODwEgPmztHWRcq3dMthQ1EVAY5khqV0JCp73qH+zX3 Q==;
X-CSE-ConnectionGUID: +bbF8UsnTTW1+hT0tnO5JQ==
X-CSE-MsgGUID: G899LwrIRhGcm3KUUfcSdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="96631484"
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="96631484"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 09:21:34 -0700
X-CSE-ConnectionGUID: B1cph8fGT+aagnjb+Opfbg==
X-CSE-MsgGUID: GF0PaObIQjeXdqcHlrl12Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="254516905"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 09:21:33 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 23 Jul 2026 09:21:33 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 23 Jul 2026 09:21:33 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.14) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 23 Jul 2026 09:21:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JlpR10056ohIWGK3rAFd6xllhQTRVFqOBC0Q+InxxQIwx7aEON2bwV1c5buZp6wYKxAKmk/N97MjekPow23QNRKkIe/IsofsdZtxgIwrfXmM+Go13RvKTDk8zZ/pDHLykgnIxj4mG+v5RSf+f4zp/EzmJBwHldc6ZnYIPeVAQMnPHfEJLdgDs0ZdF7gIqenw3oh7JG2qHewKCZaesvYDFAD3gE3QoK0BQKaiCPBIHeX7tkpYFaccqSnKjqLjmu7OgulRYxKWcOKtPYID+GJEESYCT3Xnua2qUIdxMqqxxHentiNoQocCtAhIAySQMbh6yFeEsfRa2LbgW/x4nxnmpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d06+VE4ImXX4hJEAMb6yyfx47DPGRUyRjHvND1ic/nM=;
 b=pUqDbclHZJ3yddRaeJArjgJkM0Hv/i1/y5VhxTP2RAzPXoMA+280DddL58J5M6JdhfP62CQGZjGeKp8DULhZHJhEXHvkftNozbNOtCeQceI4P7MFgJA0/1nPPiPlmzvjjPw0dv01kAhEXXEvIrcQSNun2QfS1ZmQosbSgiWSGC1FccdZ1OXQCSIm6l8IvKmycicZcDoA45Vhu2yPw1rMV9GWGoiKQRajvkzyaUVr6HTdB9MW0YpEUoBD+D9ho8jc+fOE4EQLinWYhUExM0JXHybtijh92j/thFmZXzZZRR6o69ueDgtraBLfL9S4jCra/SwFwOFvzm3uI3f1FMaKMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 by MW3PR11MB4538.namprd11.prod.outlook.com (2603:10b6:303:57::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 16:21:31 +0000
Received: from PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b]) by PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b%5]) with mapi id 15.21.0245.010; Thu, 23 Jul 2026
 16:21:31 +0000
Message-ID: <61f53f61-5fb0-4e84-9869-ef614463b8ec@intel.com>
Date: Thu, 23 Jul 2026 21:51:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 8/9] drm/i915/vrr: Program CMRR enable/disable from
 transcoder timings
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>, <uma.shankar@intel.com>,
 <ankit.k.nautiyal@intel.com>
References: <20260722043923.3241977-1-mitulkumar.ajitkumar.golani@intel.com>
 <20260722043923.3241977-9-mitulkumar.ajitkumar.golani@intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260722043923.3241977-9-mitulkumar.ajitkumar.golani@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0094.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::20) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7636:EE_|MW3PR11MB4538:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a882e7f-ae6b-4760-8fb1-08dee8d67472
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|22082099003|18002099003|10067099003|11063799006|4143699003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: yWgYifJqMM10RVZKrRpijJ5qCQQQ2baWXo9R1niCFMrq8JnZgEGgcW4CBx/IFx2U6CEHCqeq+WSVQMQBzvtTVP2HKFHhxKR4nnxp+TV9en0gHYvnMk12c7yrymMWvm6/xLxxaoJ9Apps51QeRsWWxFtCEW39B0JwF/1RzvRgpLi7GmfCEwuBX8u1PXY74cud9mCqJ+RA4HfywwUl+6M2jDC2vOXbzX5Vy0KEznmDUvfHFBTmA2ZmegirIeOSmcMX6Ut5ExTgiYqQEICEKVzxEThCQWagrxr0c7HWWYt9w6cmz/BqesY7jl0fwb3Lpb9rfBEqdG1dKpd0Jzv1tIweb+IvIDQIDh5g98OULgmXRIzlIdQdH3IQQLntFdRAqV3iQ3dyu9HWc/E6fW9tU63yUXBK6VcNabzcER59WZMNJdkfwreBCpQFr+Bg5qBUu3+QSWTVnsX98JU3VNfCb0++YlMfCLX6J0WhegiKx80KJ/jC17uKDAXDBBvVyfTVB6o3mOYhcJLZojxCqKfoCPs3oN5YNaLL4mLeRUsC4VRG62NMkup1rZJ8+eimzFVG+chTyKhrYQdyMamyOwor939+H0NDO5REGzCwXvR7ThwACkP3RCW88ORuTt8NEfCRBZDYHP9vhtNteZUdCqLEEW15lh9XFXZ0Q0wwBy2aQI3/9/Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(22082099003)(18002099003)(10067099003)(11063799006)(4143699003)(56012099006)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bFlucXJSTU5XeDVKbWRDejliS3VJQWxHREJPenlqbUxmWExnVUIyMWdVNzJw?=
 =?utf-8?B?UHRhSmFWTXBrdDg1K0dld05HaDZibkdPU0JUYjBKN2pHQ2crSTQ2dEU4Rnd5?=
 =?utf-8?B?VmF6bGxrS2UyQjU5cWRLa3lDWlFCNTRrbkt0VVJmVnc0S0tpQ2VWUy94S1g5?=
 =?utf-8?B?U3V2b3phUWE0TVVGRW53U1Rzb0RkbmdlN3NRY1BGVXZzNklpVmtIWG9tNWYx?=
 =?utf-8?B?YUZrNDBoYXFKaGlSc0FKSXVxYWpybGttYkZWTzVZdWxabEtxTkRWRytrTXBO?=
 =?utf-8?B?Q2NadmdDeVQ2ekI0ejJHaWRFNlo2cER0dmNsekJHaWdESW1EZmZCR1hNL2VX?=
 =?utf-8?B?VUJqZWVzT0dIYy8wUi9MUGJxdmNxSktmTVI1QmpPODBVcFFJaVhqdkVRNE53?=
 =?utf-8?B?MUxtT09pN2RhU1hqVHJJVjBVVWRJODhLQ3Y5T3UzN0FlZkZKdG9ldzBvS1U5?=
 =?utf-8?B?L29PUmx5ajNNd1ZoeUE4cDFNUTI4NFVEdmdRZWd4R2lpTG5wdGw0eE5yNEhy?=
 =?utf-8?B?NXFzTnlUS2xaTVFyd1pDR0NnQ1ZhcHhvMk50dzU1M29uTjl1bjNHTmpGWUtY?=
 =?utf-8?B?YStNemFPR1lCSzN3dVpTM1EyNUxseTVCaGpSdi9GVCtQaVh3RWp0amozQmNs?=
 =?utf-8?B?dFprdnNmQzVyT3U5dlUvd0FveUFBV3Q2NkV3dkhrWC9aS2s1SnZnUFA5OVFy?=
 =?utf-8?B?NHZRaTdERGxMZm9JRm9ZQU8reUd2SUx2Y21sOG51Q01wRnVBMWt0c25FbG9w?=
 =?utf-8?B?V1NGeC9DQ3MxVlR4TDlJc29mVTl3b283Y0dNNHRDVDhOTE1BQmt4bGpCajQz?=
 =?utf-8?B?UHVlR01ZT3JqSHRGUEl5Z0FCSGFmL1VyckNKK3UzOFpZc0lOTE5nVUE4QUhV?=
 =?utf-8?B?cTJHcFBkWFpydkdLUjErVmJ1REk3bWRvTC90ZitPd2JBTGhFb0FhV3c5NU5y?=
 =?utf-8?B?TnliWXdVcWtkVmI3dnVCbTBoTndnOTBSbkJ6YUVrVkFrTzNhUWQ1N29ISmF0?=
 =?utf-8?B?a3ZzRFRUZjBXZkQ1dU1qYWNYOG9DdkVMVGNZcFkxNEJpaVBrdGZwRTdqVG5o?=
 =?utf-8?B?Vlg3RlFQUnJrUzlEdVFtS0kwWk9vcTlqckh5ZzRwd1I5ZFFKZHY0aFBLOVJ2?=
 =?utf-8?B?TnpGdzRKTEVtUzh3N05ZSzN2b0t5Y1VRQVk5VUluZE42L2JYUTUwaUFhbDNt?=
 =?utf-8?B?NkpJTXNPTHlCNmtiK1NPejZLeUpvc1hhdFBBOHRUMm5od3VPRFh2Rml5Ly9J?=
 =?utf-8?B?MmhUNFVhNDU4TC9KOWFyV1ZpZGZ3WW5tUjh2eWlBRG9qMWl5RHA2Qmx1bmYx?=
 =?utf-8?B?dHpnUzVMdGZ4cnJiVlhmK3E5ZEVYWFk3bkxmM3hCQlBtM3ZqeDhYOFh4aXh1?=
 =?utf-8?B?SnRjYm5MSlJ6Rm5SaWJiTXl0NFY4WGFqTU5oa3YyNkpydWVaamFzb05STUp0?=
 =?utf-8?B?Q1BVTGpOaEdldFVKbDA5a1czaUhYQm5yZWhkdWs1ZFBkTVdjMjZsREc0czhv?=
 =?utf-8?B?UU4zWnE0ZkdvK2FSU0RiS1AzNHl4M05NRWx4ZHVOa1MxRmYwRW4xUnZnd0xO?=
 =?utf-8?B?aklGK0kyajBkOVM5V2tZdjBCQm8vR2o5UUxlZWt3Qnc0UEYzNXQ2UkRUSUdZ?=
 =?utf-8?B?eTB1YkFaL1VxZTB0bUpWTzBHU3VmcE1QTlR3bktFbHEzNzcyWm9acE5tempi?=
 =?utf-8?B?U0Y2cjJyL2JLV1pVOHI3ako3eTdJenN2WkdNRkpQalJTWlp2YUhJVndUc0ZY?=
 =?utf-8?B?TmR2OVB0MmhKdHJKNkZxK1ZaVHYreXB1akhvNGdwcHNnOGpqQUdjV1NMSnZk?=
 =?utf-8?B?MFhiR0ZSWkRNNVZucUMxdzNiTWNSZjM3NWFIdm5ZWVl4UVJ6bW9VOFZ5Rmlj?=
 =?utf-8?B?SGRKSGZrL2pRMkVOellBMmxyK0VEUngyTm1qczZSMlVISW1INFVtZE5EbEJm?=
 =?utf-8?B?TTNQekxMT0ZYY25QbjBSQ2JpaXY4cGtsTk9pOFVGR2hUUnErM2w3Z25uM2p0?=
 =?utf-8?B?U252K0UvbGxZVFhQaTRjTkxqdDA5VmJoQWJLekM1NXNURlR3K1B6YWFmcGgy?=
 =?utf-8?B?S3FDWWxiZVB6V0s5emdPc3ErMVdreHgvUnA0bHdXV1BIcm9HaUFlZjY3MlRU?=
 =?utf-8?B?V1l5TCtHUWUwTUxoVkpJVkdpM2FobmZ4MXZCTCt6VXV2MTNRcEd5STJvdnF3?=
 =?utf-8?B?YjRzZUowQk5kZ3o2MVBzN1E0RzYyV3NubFpRS1lCcEdKNG1udnYxVnpqL2Vl?=
 =?utf-8?B?aU1yU3Y2ckw4K0lGUlZYKy9qaWRVT2hyT3RYQ1JoMW1EME5MM0RYQ3UrejVo?=
 =?utf-8?B?TGxLOVBtMjE3bXEyKzEzeU0xY3Axc2l3OFhST2lDSktqS0RJRVdJN0plNTdW?=
 =?utf-8?Q?rAXpTWaOkalm21LY=3D?=
X-Exchange-RoutingPolicyChecked: FzikwtsHOV0ZwcxFw6wXSilh3HkJ86VoW/qd6yK9o6Ixxrx3pKQXn+55TJ46/kAiN2WjTltlPU4VZ9EuJ7ZKyDpuHJ9ggKLNKZlPn9EqCnagFGQfWPYv846Snok1r/Bo3G90ZTpKmkLNdaLQ96+kDIywmO3CE/o3Vdw2agBGBVDiL/4n2IbIdU2IWbIHbkhN2zuxZIAV2KqcuBROJMykXUee6at7ls/WS32f7YrY0UHE8s21rk3QzU4QowN/ePSFSdXS756lGtjzEio932G839ZGvAJAITu3GPdFUArzvbO5o7h/t2ULj1XM8k/xFZ2udmQ/51v1adzWm9WI4OiQRQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a882e7f-ae6b-4760-8fb1-08dee8d67472
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 16:21:30.9713 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rl5Q5F4/DKgxuwhTt7v4S0VmiK5vo2gAIyMX5bjykuaE17loDXajEUvZVplYRGLaXJ+TfDd3Dv48ixMvrzgy4GfbowRPL4AYgyv6ELuFnp4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4538
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



On 7/22/2026 10:09 AM, Mitul Golani wrote:
> Split the CMRR M/N register programming into intel_vrr_enable_cmrr()
> and intel_vrr_disable_cmrr(), and drive them from
> intel_vrr_set_fixed_rr_timings() based on crtc_state->vrr.cmrr.enable.
> 
> VRR_CTL_CMRR_ENABLE is not set explicitly, writing TRANS_CMRR_N_HI
> arms CMRR in hardware. Drop the now-unused cmrr_enable
> argument to intel_vrr_tg_enable().
> 
> No functional change intended for non-CMRR configurations.
> 
> --v2:
> - Commit message changes.
> - Added Simplified enable/disable sequence. (Chaitanya)
> 
> --v3:
> - Guard CMRR enable condition (Chaitanya)
> - Comment changes updated (Chaitanya)
> - Squash register write commits together and
> avoid double writing issue. (Chaitanya)
> 
> --v4:
> - Guard CMRR enable/disable with platform check
> 
> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> Assisted-by: Claude:claude-opus-4-8
> ---
>   drivers/gpu/drm/i915/display/intel_vrr.c | 66 +++++++++++++++++-------
>   1 file changed, 47 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
> index e8c6516fd36a..6bc3ccd62513 100644
> --- a/drivers/gpu/drm/i915/display/intel_vrr.c
> +++ b/drivers/gpu/drm/i915/display/intel_vrr.c
> @@ -195,6 +195,40 @@ static bool intel_vrr_cmrr_possible(const struct intel_crtc_state *crtc_state)
>   	return (HAS_CMRR(display) && intel_vrr_always_use_vrr_tg(display));
>   }
>   
> +static void
> +intel_vrr_enable_cmrr(const struct intel_crtc_state *crtc_state)
> +{
> +	struct intel_display *display = to_intel_display(crtc_state);
> +	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
> +

This will result in CMTG instances of the registers remain unwritten. 
Transcoder should be passed as an argument, similar to 
intel_vrr_set_fixed_rr_timings()

> +	if (!intel_vrr_cmrr_possible(crtc_state))
> +		return;
> +
> +	intel_de_write(display, TRANS_CMRR_M_HI(display, cpu_transcoder),
> +		       upper_32_bits(crtc_state->vrr.cmrr.cmrr_m));
> +	intel_de_write(display, TRANS_CMRR_M_LO(display, cpu_transcoder),
> +		       lower_32_bits(crtc_state->vrr.cmrr.cmrr_m));
> +	intel_de_write(display, TRANS_CMRR_N_LO(display, cpu_transcoder),
> +		       lower_32_bits(crtc_state->vrr.cmrr.cmrr_n));
> +	intel_de_write(display, TRANS_CMRR_N_HI(display, cpu_transcoder),
> +		       upper_32_bits(crtc_state->vrr.cmrr.cmrr_n));
> +}
> +
> +static void
> +intel_vrr_disable_cmrr(const struct intel_crtc_state *crtc_state)
> +{
> +	struct intel_display *display = to_intel_display(crtc_state);
> +	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
> +
> +	if (!intel_vrr_cmrr_possible(crtc_state))
> +		return;
> +
> +	intel_de_write(display, TRANS_CMRR_M_HI(display, cpu_transcoder), 0);
> +	intel_de_write(display, TRANS_CMRR_M_LO(display, cpu_transcoder), 0);
> +	intel_de_write(display, TRANS_CMRR_N_LO(display, cpu_transcoder), 0);
> +	intel_de_write(display, TRANS_CMRR_N_HI(display, cpu_transcoder), 0);
> +}
> +
>   static void
>   intel_vrr_cmrr_compute_config(struct intel_crtc_state *crtc_state)
>   {
> @@ -351,6 +385,11 @@ void intel_vrr_set_fixed_rr_timings(const struct intel_crtc_state *crtc_state,
>   	if (!intel_vrr_possible(crtc_state))
>   		return;
>   
> +	if (crtc_state->vrr.cmrr.enable)
> +		intel_vrr_enable_cmrr(crtc_state);
> +	else
> +		intel_vrr_disable_cmrr(crtc_state);
> +

Is there a specific reason for having the enable/disable mechanics? 
Can't we just make it part of a function similar to 
intel_vrr_set_fixed_rr_timings() and let it program the registers with 
whatever value the compute config comes up with? some relevant values 
for enable and 0 for disable.

>   	intel_de_write(display, TRANS_VRR_VMIN(display, transcoder),
>   		       intel_vrr_fixed_rr_hw_vmin(crtc_state) - 1);
>   	intel_de_write(display, TRANS_VRR_VMAX(display, transcoder),
> @@ -662,17 +701,6 @@ void intel_vrr_set_transcoder_timings(const struct intel_crtc_state *crtc_state)
>   		return;
>   	}
>   
> -	if (crtc_state->vrr.cmrr.enable) {
> -		intel_de_write(display, TRANS_CMRR_M_HI(display, cpu_transcoder),
> -			       upper_32_bits(crtc_state->vrr.cmrr.cmrr_m));
> -		intel_de_write(display, TRANS_CMRR_M_LO(display, cpu_transcoder),
> -			       lower_32_bits(crtc_state->vrr.cmrr.cmrr_m));
> -		intel_de_write(display, TRANS_CMRR_N_HI(display, cpu_transcoder),
> -			       upper_32_bits(crtc_state->vrr.cmrr.cmrr_n));
> -		intel_de_write(display, TRANS_CMRR_N_LO(display, cpu_transcoder),
> -			       lower_32_bits(crtc_state->vrr.cmrr.cmrr_n));
> -	}
> -
>   	intel_vrr_set_fixed_rr_timings(crtc_state, cpu_transcoder);
>   	intel_cmtg_set_vrr_timings(crtc_state);
>   
> @@ -938,8 +966,7 @@ intel_vrr_disable_dc_balancing(const struct intel_crtc_state *old_crtc_state)
>   	intel_de_write(display, TRANS_VRR_CTL(display, cpu_transcoder), vrr_ctl);
>   }
>   
> -static void intel_vrr_tg_enable(const struct intel_crtc_state *crtc_state,
> -				bool cmrr_enable)
> +static void intel_vrr_tg_enable(const struct intel_crtc_state *crtc_state)
>   {
>   	struct intel_display *display = to_intel_display(crtc_state);
>   	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
> @@ -951,11 +978,12 @@ static void intel_vrr_tg_enable(const struct intel_crtc_state *crtc_state,
>   	vrr_ctl = VRR_CTL_VRR_ENABLE | trans_vrr_ctl(crtc_state);
>   
>   	/*
> -	 * FIXME this might be broken as bspec seems to imply that
> -	 * even VRR_CTL_CMRR_ENABLE is armed by TRANS_CMRR_N_HI
> -	 * when enabling CMRR (but not when disabling CMRR?).
> +	 * This full TRANS_VRR_CTL write is the authoritative one, so it must
> +	 * carry VRR_CTL_CMRR_ENABLE when CMRR is in use. Writing TRANS_CMRR_N_HI
> +	 * arms the bit in hardware, but this later write would otherwise clear
> +	 * it again.
>   	 */
> -	if (cmrr_enable)
> +	if (crtc_state->vrr.cmrr.enable)
>   		vrr_ctl |= VRR_CTL_CMRR_ENABLE;
>

Will this path ever reach through a fastset?

Another thing related to the modeset/fastset semantics. In cmmr_compute 
config we might end up with votal different from the mode line. If we 
need something similar to LRR where vtotal change can be achieved 
through a fastset is worth checking.
>   	intel_de_write(display, TRANS_VRR_CTL(display, cpu_transcoder), vrr_ctl);
> @@ -991,7 +1019,7 @@ void intel_vrr_enable(const struct intel_crtc_state *crtc_state)
>   	intel_vrr_enable_dc_balancing(crtc_state);
>   
>   	if (!intel_vrr_always_use_vrr_tg(display))
> -		intel_vrr_tg_enable(crtc_state, crtc_state->vrr.cmrr.enable);
> +		intel_vrr_tg_enable(crtc_state);
>   }
>   
>   void intel_vrr_disable(const struct intel_crtc_state *old_crtc_state)
> @@ -1018,7 +1046,7 @@ void intel_vrr_transcoder_enable(const struct intel_crtc_state *crtc_state)
>   		return;
>   
>   	if (intel_vrr_always_use_vrr_tg(display))
> -		intel_vrr_tg_enable(crtc_state, false);
> +		intel_vrr_tg_enable(crtc_state);
>   }
>   
>   void intel_vrr_transcoder_disable(const struct intel_crtc_state *old_crtc_state)

