Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83C57D767E3
	for <intel-xe@archiver.kernel.org>; Thu, 31 Oct 2024 16:55:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48A5310E417;
	Thu, 31 Oct 2024 16:55:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PAMe7ir7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 453CF10E8F0
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Oct 2024 16:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730393750; x=1761929750;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=iRYwVuavvUdeIuke++qCt9mn8N8oHn19Fefjw/dcmDI=;
 b=PAMe7ir7F5I8SWQ8jVxegHPrUdX/F0ghdZzhhpTuHTzhoM5g7gfUds3A
 5CuIw9WLFWRWX/neIjG2dU7hZjGFTxISgqsBBA66EHlMCW993Yq1lpue3
 eij0d71y4hCohhuHC/CxQFqsY9kF+pIKZubZGNwLcKz3RroFpFBGa3Ox2
 5viHoZ+EYoQcoO3iJP6Ab5YuHS78OcqDesnYbU/iRKgR+abQ5Jea6fOAu
 YARTSPq9Ok/bwtRMW1U6nTQYaubftEUH4gm7dSn+Ax7S8EOm8TdgI3MLq
 +p1raJXB4Y6MD8iYhe73h0Pcvxf1t/MDZfAVGUO6Vu6PKYzX7Mg8pwnc5 Q==;
X-CSE-ConnectionGUID: bQFMLIkvSbK5dIVwoPv/Zw==
X-CSE-MsgGUID: oM41fN3ZSl+FN2BXsy4png==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30003291"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30003291"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 09:55:50 -0700
X-CSE-ConnectionGUID: kYyEH5mKSai5wdBvgkhFDw==
X-CSE-MsgGUID: R1pJbzS5SiyQ32Gj3ukLeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; d="scan'208";a="82851832"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Oct 2024 09:55:50 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 31 Oct 2024 09:55:49 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 31 Oct 2024 09:55:49 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.45) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 31 Oct 2024 09:55:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DBiXN5ezwsxJ66IrcJSjysZjr1Pi2cHVtUAxsDc/BLPMEhxGPcia9Lf+7y47Ssm3xtuZo4A6G2aWjPltFwOsNbIyGeBCq5y7T4L8Hu76nBWG+5nMh1h8iurvWB63fLFAIvM5LAgwCRCf5MMqokaTzbgQf2U4XBqihajxsq7Hno7U8yfqtRV30MS2ZldfENbqQb88XXUQb107w10KVpo7Q/4OyhPHyQlCuFutv0DnaM6pFgPTmUQ1VT5VkCyvFHL8wyE17Ym1H/zHeIF/rwkbTwhUMOPYlY55ZE1XLz5NDdo8TXOtP5qrYTa5evKXsYW1GnuMxTdIyoXfWtDWcxJIyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sdg3EOrvVc9fIhxWitRe8JxjFLe8tp6NTiXHt/ncu8M=;
 b=ahU9EAoO7XD+0TAfw1i04wLCTzxYEX99cSNtUhJk1ggOX1jJ6bJUNUXIxqSjNLDzakA2x7lS7qcE63MOfXAp/NErrEZHWSj+stgxvqiDg3JzecvKndTZF/Nc6Ej2woK1oRQ5so9//toLHKhnFDQ0PgusuINRgmOHX6/2U7kmYbcaOEG+AWgGRDYFnKhYALVdhF5uFlciQl3k/sIONsfTa6TMGRFd3yI8ymibDbJwL2iq0Mgkpw/EJezJy1X66sGLqnQ0esbrO9Y5IreXrs3xtxBz5BdCBe2XSRizpoMcP4KzDa8XSWuQQRKcHYoCP3CZkS9ruvmqHgRvLk8F7QIXxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by IA1PR11MB7917.namprd11.prod.outlook.com (2603:10b6:208:3fe::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.36; Thu, 31 Oct
 2024 16:55:45 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%6]) with mapi id 15.20.8114.020; Thu, 31 Oct 2024
 16:55:45 +0000
Message-ID: <e4efde6a-b43c-4571-ae9e-eb200862500d@intel.com>
Date: Thu, 31 Oct 2024 12:55:43 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] drm/xe/guc: Fix missing init value and add
 register order check
To: <intel-xe@lists.freedesktop.org>
References: <20241023192307.746525-1-zhanjun.dong@intel.com>
 <a6db328f-54ef-4941-99cf-b7da52287345@linux.intel.com>
 <IA1PR11MB82006A9865919A669C83594E8F4E2@IA1PR11MB8200.namprd11.prod.outlook.com>
 <6894f0472669600c06d43457bf2be60e26892ebb.camel@intel.com>
 <c1512553-eed1-4673-aa82-3430efafc50d@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <c1512553-eed1-4673-aa82-3430efafc50d@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR03CA0011.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::24) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|IA1PR11MB7917:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b9843c4-3ac9-4c9c-e3d8-08dcf9ccdcdb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M3JwTEswUEFoN20yUlFhTG02M1RZM0ora0oyNEhwZmJuamU0dzdTR0pTMVF1?=
 =?utf-8?B?TjhyNERiV3J5U0dYaVZTNk05OU9KNlBTM2FMNHRmM2RocGFvNUhNaXY2Y0Nj?=
 =?utf-8?B?TkoyMGZldzZrWWNyK3RuckZOYzJTalFNL0hkdHNkOEFmWnNIRFpSR3BTL0lG?=
 =?utf-8?B?Qm9TUkZrL0hQL3k5L1krS3VMSC9aZVdBRGVaemFHa281YVh4YUNtcjkvZi9h?=
 =?utf-8?B?eFZGSTBjRWwzVG1RU2R6VUdDUmR1NGMvTkptLy91V2FzYVpZUllURHE4WWR6?=
 =?utf-8?B?akJmZEJSZjF6OStKS2JKelNJdXBUZmMvR1BkTUUrbWM2dzRDc2ZkNml4blVq?=
 =?utf-8?B?ODFXdktKdnFsZW0vUUQ1N1BHR3RKeWNkRnFCakVMYlJpcE41RmJzRHl0TG1p?=
 =?utf-8?B?NEo0cENPYlpPZ1R6MnhrNE11bzIzOXVFc2xqL28xN2F2YTJmdkQ0ZnNSRG1m?=
 =?utf-8?B?c0F3MUpYandhdzcreWNscTB4L3NvaWd2T2pFbnZxWGVDTmk3Q0tlRzd0NklR?=
 =?utf-8?B?ckRtR0dSMlRDWXVIVW14QW1MK0h5aW50R1RNS3BOZnpXVU5SKzVrVi9CSzQv?=
 =?utf-8?B?NzIwOFdLcWpnWkNBdVNFbk1BY3Ftb0libDJkdHdDUXBqenJwU3MrZnRwRG1X?=
 =?utf-8?B?REVIb0JMUkllaXRrM1dodnhRRmJOcXptZ3BwYzhSQmNuem5Id25PM1VUVWxk?=
 =?utf-8?B?MXU5Zzl0Z2x4aXRVcy9RRkFxbWpBeEY5emFxYVJPaVdsOXFqK2FnMUhINHV1?=
 =?utf-8?B?V1BXSG1VRXNQOFgyWTZsSTNFU1RoNWhaNDFjUjh6eWZKNGxDNzFXcGE3d3NN?=
 =?utf-8?B?a0hFV2FEZU9QNFFZajNQcE5UbW5TYzc5WHFjcFNSWml2NWhiNmdiY1A1UGNv?=
 =?utf-8?B?b0ptQmVESXFuYUdETjJBdXdiWEQwZjM4WTYvTUxMV25lbWlWK0hiRXpLQzZI?=
 =?utf-8?B?MG1SckRUMlM2QjhmSHlidXFtUk1yeWdHQTI4bHdYc09XcGVXWDN4SjBvcDVJ?=
 =?utf-8?B?R2lhUmtpa2RSZjl5bkljL1pXY2h1V2NmeEU1K0szRUZudk1TbE12MVhpcnRT?=
 =?utf-8?B?S0VXYTRReTAvZVZCdU13L0lmSW00bTBGL1lrdGlLZ0c2Y05RODRjMnROK25n?=
 =?utf-8?B?N05vWjFiRGlpRFBIN2Z4TGZzVmtrY2xYQVVvNDlYMkRSdEROdU1lVG1CSHoz?=
 =?utf-8?B?S1FsNXlla2ZBSzFESzBMalNGdk91VWllMWo0dE1LZXZ5SEhyY1VGWmFwRnRQ?=
 =?utf-8?B?MGZkNDBldk1CUHlKWkZSZmxGLzdaYlI4RDA2Ykk3c1l4VEVmRG5idDdTcnJr?=
 =?utf-8?B?Uk9BbVB0NVR5RzVvQTREOThBQmJia09LbnNyVFVmN3NPZXg5czN0Y0ZndFUw?=
 =?utf-8?B?a3RoczJrWHJNSFg1NkF3Tnk1WUo0WW5uNmJDYW9uUWNOamxjT0VRRTkxY21H?=
 =?utf-8?B?UXJ1L0syNnMwbmZiY3VESFNIL2pqaE1kZE1xVERYU2kyRFhTRDJhaVcyWWZm?=
 =?utf-8?B?SVlEL09TK0RZL3JRVy9OV3V2dVZPWHg1dTFIdEhsb1dia053MjZpUW9mb2Qx?=
 =?utf-8?B?MWlQSXhVUzJId3liSlN4WjR2RFozTC96S2NJYm5pS0QyV1RPVGlpZzdIZzdp?=
 =?utf-8?B?TkdzVGljMTEwWnpaTE1HQUZJMFgyelBjNldYRXFTcWFkNUhoeitWNWJGT01l?=
 =?utf-8?Q?qItgS0Q+k58NMRhGM66Q?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dGVyQzBZNms0bXpaSjY0STMwbDY2Z29yYS90NmxWZ3VMOU1IQ1Ixc01wWWd3?=
 =?utf-8?B?T0JyTC9RY3g5REJHYVJ4TWVLbjhUWUR4ZzRCYU1qQ0lzY0xGVGhHekFpUkdZ?=
 =?utf-8?B?aGZ5WVBhZ0pqUzdtcmk1eTB2STkwSkIyT01XbE81MGdXc1RkM0J3cFB4Uk5D?=
 =?utf-8?B?TG0vandBS05hUUhFVHE4OTNuclhQSVFaK0NqZzZhd1k2TFEwbGtjL0hXQnlU?=
 =?utf-8?B?UFhVdnhOL1hYTWFQSTl0ZTFNNzNjdnZHY2NqSG1ETUVPb2hMbmtibng2UWdM?=
 =?utf-8?B?WUFBTXlrTHdJM3crb0orZzd6cXc3M3BXNkYwYldnTjVxTEY4V1I0Q2J6ZzIz?=
 =?utf-8?B?a2h0TUFqUWVTSVkrZUM3L2h0UERFVVhuQTFhZ1hIdjZ4K3liN0V1Y0MveXFp?=
 =?utf-8?B?a3JOODgvUkVUdWFJOFZQcm4xVjBMSERGWWNhOHZNTTEwYmwxd0l2TGM0K3Zz?=
 =?utf-8?B?Nm45VEVFUkJXYWdpZEpiVFNkUW50ZEtHYzdudjVHOTdsRWJ6SmJvMCtDYXJu?=
 =?utf-8?B?ZkZNc3VNMVY5MkFlNVgxU09OVXRSM25VQ0lHS3ZvTENSNlN4ZlhyRlN2d3Jl?=
 =?utf-8?B?U0NBbG1FOFhseklCb3c1R1EraXZLbitBbWNDQVA2WTJhb1ArSVVQMjRDZmZ5?=
 =?utf-8?B?N085TkU5eWkza3YydTVXc09UaENrMDRwaGlqbmUrYjVBRm1QblFMSjJWUmVR?=
 =?utf-8?B?NER4U1g4WnpacHBWL0ZRZThRMTNaOFEyMXNqZWx2MXVkTTExWmFXOXQraFd3?=
 =?utf-8?B?NVVWMk44RHZaTmUyVTZXTFFTUUdteERPdy95NjQxTmVlZ1o5OGZWejB3YUpH?=
 =?utf-8?B?clNwRERwMGg0UDJSWG15M0VlOW1OSHFoK1JJVjFMUHlla0w3WDVpOXhML1Ir?=
 =?utf-8?B?Qmxzb2tjWS9sbTM4UjBzaUxNRXpueFBUbzduV3FZc2hrdnZnbnIxUFg5UUhj?=
 =?utf-8?B?ckZuT1hhckxhN3VkQVpLdFRWNXN0Vmw4bi9yc2RYVDVsWGp0ZktCUmwxWU1X?=
 =?utf-8?B?U2N1Y3ZuZk1WL2IxRFR6OHhhWUZuZWZFYktLRjVHOHNxWlpvOW9iMFB1WEpD?=
 =?utf-8?B?S1BVcGdwZ1ZSUytid2oxbmVqbFFNRTcxaVo5SWN1MklIbUt1Z2hsbTZlb2dt?=
 =?utf-8?B?a3dkY29jQTIxelZpRmJkQ3ZHclBIVFh1bThEc3EvMFB0T00rYXBrQldyaTcx?=
 =?utf-8?B?VXg4RjhPdGYxUmRZYlJhS1NyRHJwSTdrZ0NoQkd2eG0zSGZ2WUhieEozQVlo?=
 =?utf-8?B?Vyt1RUk3TTl3UkEyTC9IMkc5WUZFRDRHNDZBTFVhVVJvVGpEeXpZL0NPSkJ6?=
 =?utf-8?B?dy9idkFBR1ZadGJWMFN3ZEJUZGI5cit0em96dWZGZ1ZCZjF2NmY5eHVpSFVj?=
 =?utf-8?B?L3dMb0Y0S2JGaDJ6UW1CUUVyeDFaUklVK1Qrei9QdnhibnVCQWNmeHZReWQ3?=
 =?utf-8?B?dUtkajdjaHNnMFJiTHBDNC85Q3dQU3h6UVFrSnNhNzVnUWYzSUVyMUNOT1hN?=
 =?utf-8?B?RDdhT1djL0lPeGlvcXhUZEh0dUFDdSsvVkVya1l1ZWU1UWVQYUN0SUxHS09X?=
 =?utf-8?B?OTIycFp2T3ZiYlFEcjVHcFVWQVYyU1RhSHJxcmE3UytxbXgxSlNEMjY1MXNp?=
 =?utf-8?B?bmZORUF2YytxdTB2UW1JRkdzUEFWQlcrZjZxRXM3UzltTWtLZTh5Z3pvYzFX?=
 =?utf-8?B?KzFhdzY4a2tPUzZyYm9CaGYyUlNIMUVCMTZ6ZDhCMzlIZzUwVExrd0ZOMXBR?=
 =?utf-8?B?Q1hrcjJKc3lUODF3eWJFTmtrSTFKOVdjemZCcEQrK1NHUEFoMFhvUVhNVHBM?=
 =?utf-8?B?OWh3TVc5NjFYUjJOa0hYanlyczZZUjBsKzZNSmRKQnZRRDQxaE43VkFsbVBu?=
 =?utf-8?B?OWI4amtwUDBzZHFhc3lOeUhWZFFnWFdHVU1ZRFVxREpvb3o3cXdTSGcwUTdF?=
 =?utf-8?B?cnR2cCtpSjhHQnJrZWl1NTJ3VTFxR1NZaEFPYVR0dGZNMFJVVnoyTGVzci9k?=
 =?utf-8?B?SXl2c3p4VlJqSW9ZT3VPRkxOUWd5TGhCdjhmWFc4T0ZobG9yK0ZuUTA0Z0g5?=
 =?utf-8?B?c3lJdGRnQUlZVDNhSUNCNE4zVEMyRmgvZnI5bVpIRUJianVkUUpPbTB1V0pO?=
 =?utf-8?Q?El//XXGFdSOI2F6gW+r+QLtql?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b9843c4-3ac9-4c9c-e3d8-08dcf9ccdcdb
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2024 16:55:45.5818 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PcQkRDokkuPeWf08cbnvMPLdpozwMT2wHplJurGbx29YKOV4IVp7ruZ8Fe5AQAnotnw6gZ7QcWlC3occvGMHhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7917
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

Patch 139890 has similar change but is on different function. Because of 
no conflict, rebase is not needed.

Regards,
Zhanjun Dong

On 2024-10-31 10:22 a.m., Dong, Zhanjun wrote:
> CI test rerun on the 139890 and result is good. Sounds like we don't 
> need to worry about that patch.
> Now we can go through normal review process.
> 
> Regards,
> Zhanjun Dong
> 
> On 2024-10-24 7:50 p.m., Teres Alexis, Alan Previn wrote:
>> On Thu, 2024-10-24 at 14:13 +0000, Dong, Zhanjun wrote:
>>> Yes, I will send next revision in a series, which include that patch.
>>>
>>> Regards,
>>> Zhanjun
>>
>> alan: I just noticed the other patch DID get sent to Xe?
>> (https://patchwork.freedesktop.org/series/139890/) but CI results was
>> only there for rev4 - nothing on rev4-resend. Wondering if Nirmoy
>> wanted you to go ahead and create a two-patch series with the Everest's
>> patch followed and your patch that adds the lower-vs-higher-dword
>> enforcement.
> 

