Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4152DC25B4F
	for <intel-xe@archiver.kernel.org>; Mon,  6 May 2024 19:10:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0B9A10E485;
	Mon,  6 May 2024 19:10:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AXGBmFm1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51DAE10E07A
 for <intel-xe@lists.freedesktop.org>; Mon,  6 May 2024 19:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715022608; x=1746558608;
 h=date:from:to:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=AMvYLr+H1sP5lnQZfdHAC6AWBYsRZ1Dwr4VFKQ6OMqg=;
 b=AXGBmFm1LYjtjLxBVl2qQj6RzLrm/+0c72teI0XzwKeGC/k+J8QIlI/B
 HMlDo94LA/1bnamraDpF2Kp0zedAcvMHAM5GWOgfe0nZ11VXSkkj7L8JU
 rb+Jl5JmLEHfMrpVLAp1hU60uhEJgvW2C/x5LZdNsWmrP82uMwdy7IyTJ
 BdelwOoeEzW+wzV9J/4vSY/mW4ODufRhWoekVryebTCck06ZWGgBQo+Fi
 Cyw4wJvnPS/igTkpN2qIusjqdO0+dDpXm1zFnakx5ps8o8qUY45PbMptq
 ueCiWajEKbxXFHU2aNrPAzeMJllIiQDgntGENDeeIzhCGj9Zqe/nNNLd9 A==;
X-CSE-ConnectionGUID: 7QqqMy+mRrmRLAoA7B4Emw==
X-CSE-MsgGUID: Y63UeFnNSlSmFD2CeoVhhA==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="36170098"
X-IronPort-AV: E=Sophos;i="6.07,259,1708416000"; d="scan'208";a="36170098"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 12:10:07 -0700
X-CSE-ConnectionGUID: DCIjYnBBQ4inOtBWf2BlDg==
X-CSE-MsgGUID: 91j7u63MQhOgVoD2DtgeNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,259,1708416000"; d="scan'208";a="32918823"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 May 2024 12:10:08 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 6 May 2024 12:10:06 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 6 May 2024 12:10:06 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 6 May 2024 12:10:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lm510imxC5us7UeowA0xEYhshNQa1/axz39lvRR+kwtfPXQ0tK+UIaW0L8ouIUveKM/f3I+RfUoMqKxwjllg+MjNZxKqWWNBM7AgZuDUa689c7KYSurIkkArBbDVWiijAquO1YCDCuEsVvRlFt5A6uAyjnTJ2uYH1OBqpUCwRZ+Efqf0AyuGHPBM3ElfB+k/BIvZY8vBrFl5D/lIxN2tPPpc1gm0H84zGpJGp1nyAn/zX8Tw8l1kfeXX4jplVfcS5ziwsp1hAN5BIX5VZ+y/LARJ9tVpFnyu+iQP/e/5wcjIVF+YozcXylRuSXcVZ2hbbGqAEQwMg7aXBrRomkOYEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0iDF37EHgzAJUbEjuZDaBAaVXPoJfYDgQnrAgeIdnk8=;
 b=WRI+eXHpEEZJc+Fsn80MDcMCQV4kjhbOMbVQO6pMoBZVD/93M0ACvHEWQZeMYsCpjohNCO5rWAzHstYmhQFFXSrflxcMXHs7J/oPS4dMtTNIjyMQAi2/EkV2bIPGw1+P9Gg4/+L/ATAnJPVJxsqSDrtEkucrjOynX+Ous4MCubehfdnql1RC+dNv2P9S5lPDEkEw3H6VGT1HLvS2WkBJFI8DKgSQEjXS1gE8Of5q2HR2Qw+jZGE8H/p9atFGbb2TaSWAdD2+FEa7P6oaBLv4r3ELnDa9UahhO+Bglph86rcn1rGL25ARZSzc3QwBSMAPD4jMqp9WNksTzkEr5tFKIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM4PR11MB6552.namprd11.prod.outlook.com (2603:10b6:8:8f::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7544.42; Mon, 6 May 2024 19:09:49 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7544.041; Mon, 6 May 2024
 19:09:49 +0000
Date: Mon, 6 May 2024 15:09:45 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIENJLkZVTEw6IGZhaWx1cg==?= =?utf-8?Q?e?= for
 Unlock deeper package-C states (PC-10) and D3Cold
Message-ID: <Zjkq-W22gvkGr0zp@intel.com>
References: <20240503191309.7022-1-rodrigo.vivi@intel.com>
 <171478188975.1887279.10923880315144472111@8e613ede5ea5>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <171478188975.1887279.10923880315144472111@8e613ede5ea5>
X-ClientProxiedBy: MW4PR04CA0382.namprd04.prod.outlook.com
 (2603:10b6:303:81::27) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM4PR11MB6552:EE_
X-MS-Office365-Filtering-Correlation-Id: 150b5741-f496-4245-8461-08dc6e001968
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ak1Gb0pTdHhBZmlRc0puZ2E2SVZuTG1mdEp5THBnYUtHQWVzdHJJaE9lR1hU?=
 =?utf-8?B?cCtxSlEwaHVnL09XemtQV0MveUN0R0JEZWxnNEZPNFZsWTFqaS80TjcwWEtG?=
 =?utf-8?B?c1NFbSthYnJGK2ZmUXpqMFpYY1g2NmZBMGN6NWRUZEJPSnI2d2ozc21iOFky?=
 =?utf-8?B?dkl0ZXJoWkJzUTRERko2MCtQZHUzdVN6K2hxK3hCRzY2M0FxcjJGMmpjdjZ5?=
 =?utf-8?B?UWQxVVdHNW9BWHlNOURDVTMxbTkvYUptNEFXZlhpcHR1QmRGVVFrRThXd3dB?=
 =?utf-8?B?SkozTGdpNjM2OEVCbm1oVkVXM0RHUE1janQ2VUFsSFVVdzhuVmZha0R4M2N0?=
 =?utf-8?B?aE1Va0kvN1RlWFdjekVFV1YyZHU2T2tsSTVuUFNNTk1Vbk1Cd1pCKzlONnpF?=
 =?utf-8?B?Y0hoQjc4SUNUVU83ZHU4MWV3WGxWQ3ducXptRHF1YXUzT01mcDhnelo0N0ZM?=
 =?utf-8?B?NS9YYkxJcG4yM0pZakx2UG1hb012TlFjNEdWT1gyRTQybUtGenFVWUNmdjFY?=
 =?utf-8?B?U3lYUWtqb05CRHlLbUNXWUZxMEtSa3JwZzh1ek5tcHFEUUQ1R3FtSmFOSDdp?=
 =?utf-8?B?UHNsZmdESDJiYkU2RGUvbXE3d3VObVZCQktwYlIvZHpjY0srZEZ6Y0V2SVkx?=
 =?utf-8?B?ZDI5UnhoYjN1bFgzcjgyQWEzWW90RTZseEFBK3gzcVAzT0VTVlVjRjI3cURO?=
 =?utf-8?B?SU5ZL1ozQlFWWlpPWFBXWVhGVS90dnMrU010MnRGRHZRZ05oVXYzbDhja3dU?=
 =?utf-8?B?SkZ0WWEwbTJQM1hWakdDWks5MXdCeGw0Unk2aWJBclBVRlNwdCtXZHNIVzJa?=
 =?utf-8?B?MTNOc1VKVnRNdDdtYlBrQldZUm0xZHNlQVdtZCtLekE4Wlk5dHRaT2xhbzFB?=
 =?utf-8?B?WW1qZU14Tm5XeFhNM1htQ001TW5RbDZKRVFmMURtc04vcGFML3FzNlJBUEVr?=
 =?utf-8?B?czFRTXlRQkpYRHByaFUzSUF6VU12MExDblM1blBVdm5WOWp4aVRKZnh1NUN3?=
 =?utf-8?B?SDVQYlFTb0xrWTJGcE9XaGZtUmRPa2p4OE85OHphNTY1bmV0dnpHakdZM3gx?=
 =?utf-8?B?S00wMXJwNDlDN0htdFBsanhKNVI4WjI4UDBPd3VzdnkvWFI0TDFrRjRHU0p4?=
 =?utf-8?B?bXNhNnVnS2JJM2NCU0FqcXczMndWR1JOUnJicHdNY2dmZ2E1ZGdLQUM3OU5M?=
 =?utf-8?B?enNTbTJkeXRENGZyU3lITVRNR2xTdkE2WDF5K2VNcnVDaHNDbkl0cjA4U3Zl?=
 =?utf-8?B?THRxT2tqVXJlY1plSXJEL2JPQVlWd05vS0ZVYlF0dXlVNEY0U0Q4azljdmlT?=
 =?utf-8?B?bUdCejhIY0J1a2tEN0VxcXNhNWNLM2N0aU5ZZytZTzZEYWJCVHVyZUdEa2I1?=
 =?utf-8?B?dnlxdTVmWXNhaTBiTTVoaktJVnlYMWJ1RDdiQTJreGE2d0JRSWh3ckJRZlU5?=
 =?utf-8?B?QmR2N0RESSs0R0VYbzJlc3hXTDVWbjFxbEY3TUlYVG1OMHpobk4rQzNwclIy?=
 =?utf-8?B?N1E3U1EwME1ST2N5Rkk2MVdmYTBYVTFURUtvaHcxSjVlYkJYbnFGV3hzMTl0?=
 =?utf-8?B?bFIxZXQ4V1ltYWczbmFKMHRyMmxEdmRNOWpXRDY5MWo5SUJRRjI0QXRLWi9l?=
 =?utf-8?Q?s78olbcHcsJQ3B1u/X/B/H38YVsWUmN/TxgK977pdFJc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ak8vVW1GLzNXekJXZHBETWUydmYwYmJwUXNreC9JTWNNdTVoV00wS3VsbXF3?=
 =?utf-8?B?TmNNME9JZVBsZ0ZzaE5JaUU3aHVWVjlyMUFBNUdIZkN6ZHRmdlpGanpNTjM2?=
 =?utf-8?B?YlJyTjcyTU5UbXZTa0lRMGlDSkd3ak5GNTZvdFNVRnZHUVl2TWtaVEQ1UjZU?=
 =?utf-8?B?T25XTDE4TUh6WlpUT0UxNVMwUDIvN1RvZzhIczZBZ0hDQ0NzbHR6Z09UblNB?=
 =?utf-8?B?SDU1LzRFVG5palVQUHZyRlllT3RuV0ZFK2V0MkNUVlNmWnNwSDJRYzVPeWtO?=
 =?utf-8?B?UmtvNE5EYnR4TFJQN09uTWttYzE1bkg5NDJwMVV0ZVU3WG5jMndmeDY4dVpL?=
 =?utf-8?B?azZCVVcvNnU3MHFLTkl6aU1jYTE4dTM0L1RtYlI1MlFFRTNKazlQZExOWHNw?=
 =?utf-8?B?SWVoREduRFYrZEM1N2libytFZHdDYU5WcmJTaWxkUmR0SXVlSktRMjR3Ymtn?=
 =?utf-8?B?THI5amFnWnhtMVdRdjlYUFUwSDQ3dW5jc01EanYrWUtKS0xMMWdmME1rZ2c3?=
 =?utf-8?B?TmRuQ3lyWDFPTlZJcWV3NThJSW80UkFyWFFzdVlRTVVyRVF4dTR0TmVWa0JH?=
 =?utf-8?B?TEZTaElWZHI0eWZ0N1BVVGJQODBuYWJlK2FFYjE3Y2liREVoejhiV2tOS21X?=
 =?utf-8?B?RWh2NVlkYzRldVhvUkc0VjhxbWJCWjJXZHdZMm1NSXJJMnVDWUlKdkVDQzhk?=
 =?utf-8?B?V3JIcUg1MTV1SFg0cmxDL0RTdGtKa1pVL2JpazlWVWhyREZzekZIZkFFd3JK?=
 =?utf-8?B?MDlFcmtUT25YclRPQm4wa2tYaVpET0l1bHQ5TGZac2lUeGFuOWhUL01meUhD?=
 =?utf-8?B?Qk41ZXVkRS9mbitIWGpSbHNPektubUpUM3MrcG9hY0dUemtyVUpOWHZhRVpa?=
 =?utf-8?B?cWdYOExnbllJU25STnVkQUU1NXQ2ditUM1h2WVJPREpUS0FoS3h1VXQ1Mmc3?=
 =?utf-8?B?UWNJb1NSeXNkRHRuQTcvK1U4SkxEazBISGxEaDhueE1zdmVVLzBpbG1OSE9F?=
 =?utf-8?B?NnFidGw0SGpaU2NraVc2eUNzalRBV1ZONkpPd0tzQkNXSFI5d0xKeFdLWm44?=
 =?utf-8?B?Vm1FQVJQWGtuQzhqWUNqRDBlM3Q2cmYvSEVHYmdaVWl0NU1DU2ZmTmVmUDZB?=
 =?utf-8?B?UFMraVF0QnFKQ1pscTdGbjJZWjNlN0dzamRYam5DS3lrd3NjbEJuUXhBWThG?=
 =?utf-8?B?U3Y5ZHVRNHJTb2JmZHFrYzBQQnRiNGY5cnBDeU9zK3p2SkNJU3lHQXJIMjFj?=
 =?utf-8?B?cnJOTVQrSjR5azFSWXh1NDNuTGNPWmUrSVp4bGlWSmFVMW5BM2Z3UFVvYXgv?=
 =?utf-8?B?Uk9pMGFUenFJVmpEZGxGRFg0d2xrd1M2TDZ0Q1c0bzM3VUxQZHFNYkxFbXBG?=
 =?utf-8?B?ZVBaM2w5aFdEWG9BNVBGS0pidVo5RGVBMW9SYWwzNlNpRFV3MTJvanRDUEhl?=
 =?utf-8?B?M1JEaVFvbEZVakw1RTZ4bEI4ZDJQSmZVeXR0TkVFWE15bXQ0QUFjbjZDUnhQ?=
 =?utf-8?B?Wkc3em5nYnEycUt3dmV3STlydTVOTEVJZndCbjZuWU5acms3TkVzc00rTmRl?=
 =?utf-8?B?NW1LSHFxc2FLdS80OXZmWXBMR083cTlHS0EzamtGblhSR1FhRFVZMEdGVTNN?=
 =?utf-8?B?b2JveThsYldWNU9JTUxYdWViaWJaeUJ3czd5TXBZYnN6YmVjSmJVeFE3N2lS?=
 =?utf-8?B?TlRWY1MxbVVpbkdKZjlQd2t4S3YvMTAyUGpKNUJCMDV6c3ZoSm50WnZ0QWNL?=
 =?utf-8?B?LytHdnVzQnlxd1JBd1BQVG9ZdkFPNUtNS2NoQldDWVZGY2ZqbkVGcC9YVCs3?=
 =?utf-8?B?cFk0ODBudEJXY1Nha1R1WHBHQzdEZEVXT1JQa2s2VnIxMXpVeWgzWDJSeFlW?=
 =?utf-8?B?VUZydDVtMHczdUpIa1hCd0t0SVBVK25IRUZ5d01XRytmaUhzMnhsMWRrL3RN?=
 =?utf-8?B?U2tzUFZid0NwUEJ6NHVKckJaVjV6Q1ZhRGVhRFkzWUVZRTkyMGFNMUV3SjEr?=
 =?utf-8?B?UnZGcnVwTEJIaGpQYW93MWFhTmd1U0JEMVV2dy9LZW16Vll2bjhlOE5qd2NP?=
 =?utf-8?B?R1FMU0lybEl2b2xWUXM3YmkzMWFFSFA4Vndvd2U3SHl0ZGpPYzcxK01HTWpT?=
 =?utf-8?B?ckJHRDVGQUpxcmFwbk9EVzAvOGx6SmhveWRVK2x0MUtQSVBzZXdtb3lucndM?=
 =?utf-8?B?RVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 150b5741-f496-4245-8461-08dc6e001968
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2024 19:09:48.9583 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ToBSZG4GOACwLk5Mu+H5O/4VvYRy9zjUacrDDPfC9owuLbt9VT2e7gUhjWgYaPk084AhgDruQlc8nnIBrAlLuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6552
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

On Sat, May 04, 2024 at 12:18:09AM +0000, Patchwork wrote:
>    Patch Details                                                                
>                                                                                 
>  Series:  Unlock deeper package-C states (PC-10) and D3Cold                     
>  URL:     [1]https://patchwork.freedesktop.org/series/133186/                   
>  State:   failure                                                               
>  Details: [2]https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/index.html
>                                                                                 
> CI Bug Log - changes from xe-1236-e9ea5061461b07fcb7e19892a54a61aa8fa1d163_full 
>                              -> xe-pw-133186v1_full                             
>                                                                                 
> Summary                                                                         
>                                                                                 
>    FAILURE                                                                      
>                                                                                 
>    Serious unknown changes coming with xe-pw-133186v1_full absolutely need to   
>    be                                                                           
>    verified manually.                                                           
>                                                                                 
>    If you think the reported changes have nothing to do with the changes        
>    introduced in xe-pw-133186v1_full, please notify your bug team               
>    (I915-ci-infra@lists.freedesktop.org) to allow them                          
>    to document this new failure mode, which will reduce false positives in      
>    CI.                                                                          
>                                                                                 
> Participating hosts (3 -> 3)                                                    
>                                                                                 
>    No changes in participating hosts                                            
>                                                                                 
> Possible new issues                                                             
>                                                                                 
>    Here are the unknown changes that may have been introduced in                
>    xe-pw-133186v1_full:                                                         
>                                                                                 
>   IGT changes                                                                   
>                                                                                 
>     Possible regressions                                                        
>                                                                                 
>      • igt@xe_pm@d3hot-basic-exec:                                              
>           • shard-adlp: [3]PASS -> [4]FAIL                                      
>           • shard-dg2-set2: [5]PASS -> [6]FAIL                                  

This is expected since it depends on IGT change:
https://lore.kernel.org/all/20240503191351.7145-1-rodrigo.vivi@intel.com/

>                                                                                 
>     Suppressed                                                                  
>                                                                                 
>    The following results come from untrusted machines, tests, or statuses.      
>    They do not affect the overall result.                                       
>                                                                                 
>      • igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:                   
>                                                                                 
>           • {shard-lnl}: [7]PASS -> [8]FAIL +1 other test fail                  
>      • igt@kms_flip@plain-flip-ts-check@a-edp1:                                 
>                                                                                 
>           • {shard-lnl}: NOTRUN -> [9]INCOMPLETE +1 other test incomplete       
>      • igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt:           
>                                                                                 
>           • {shard-lnl}: NOTRUN -> [10]DMESG-FAIL                               
>      • igt@kms_plane_cursor@overlay:                                            
>                                                                                 
>           • {shard-lnl}: NOTRUN -> [11]FAIL                                     
>      • igt@kms_vblank@wait-busy-hang@pipe-c-edp-1:                              
>                                                                                 
>           • {shard-lnl}: [12]PASS -> [13]INCOMPLETE +1 other test incomplete    
>      • igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-imm:        
>                                                                                 
>           • {shard-lnl}: [14]PASS -> [15]SKIP                                   
>                                                                                 
> New tests                                                                       
>                                                                                 
>    New tests have been introduced between                                       
>    xe-1236-e9ea5061461b07fcb7e19892a54a61aa8fa1d163_full and                    
>    xe-pw-133186v1_full:                                                         
>                                                                                 
>   New IGT tests (1)                                                             
>                                                                                 
>      • igt@xe_exec_compute_mode:                                                
>           • Statuses :                                                          
>           • Exec time: [None] s                                                 
>                                                                                 
> Known issues                                                                    
>                                                                                 
>    Here are the changes found in xe-pw-133186v1_full that come from known       
>    issues:                                                                      
>                                                                                 
>   IGT changes                                                                   
>                                                                                 
>     Issues hit                                                                  
>                                                                                 
>      • igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x:  
>                                                                                 
>           • shard-adlp: [16]PASS -> [17]DMESG-WARN ([18]Intel XE#1214 /         
>             [19]Intel XE#324 / [20]Intel XE#358) +1 other test dmesg-warn       
>      • igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:             
>                                                                                 
>           • shard-adlp: NOTRUN -> [21]SKIP ([22]Intel XE#1124 / [23]Intel       
>             XE#1201) +9 other tests skip                                        
>      • igt@kms_big_fb@linear-32bpp-rotate-90:                                   
>                                                                                 
>           • shard-dg2-set2: NOTRUN -> [24]SKIP ([25]Intel XE#1201 / [26]Intel   
>             XE#316)                                                             
>      • igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:          
>                                                                                 
>           • shard-adlp: NOTRUN -> [27]FAIL ([28]Intel XE#1231)                  
>      • igt@kms_big_fb@y-tiled-16bpp-rotate-270:                                 
>                                                                                 
>           • shard-adlp: NOTRUN -> [29]SKIP ([30]Intel XE#1201 / [31]Intel       
>             XE#316) +2 other tests skip                                         
>      • igt@kms_big_fb@y-tiled-64bpp-rotate-270:                                 
>                                                                                 
>           • shard-dg2-set2: NOTRUN -> [32]SKIP ([33]Intel XE#1124 / [34]Intel   
>             XE#1201)                                                            
>      • igt@kms_big_fb@y-tiled-addfb-size-overflow:                              
>                                                                                 
>           • shard-dg2-set2: NOTRUN -> [35]SKIP ([36]Intel XE#1201 / [37]Intel   
>             XE#610)                                                             
>      • igt@kms_big_joiner@invalid-modeset-force-joiner:                         
>                                                                                 
>           • shard-adlp: NOTRUN -> [38]SKIP ([39]Intel XE#1201) +9 other tests   
>             skip                                                                
>      • igt@kms_bw@linear-tiling-1-displays-2560x1440p:                          
>                                                                                 
>           • shard-adlp: NOTRUN -> [40]SKIP ([41]Intel XE#1201 / [42]Intel       
>             XE#367) +3 other tests skip                                         
>      • igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:                     
>                                                                                 
>           • shard-adlp: NOTRUN -> [43]SKIP ([44]Intel XE#1201 / [45]Intel       
>             XE#455 / [46]Intel XE#787) +25 other tests skip                     
>      • igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-6:     
>                                                                                 
>           • shard-dg2-set2: NOTRUN -> [47]SKIP ([48]Intel XE#1201 / [49]Intel   
>             XE#787) +42 other tests skip                                        
>      • igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1:   
>                                                                                 
>           • shard-adlp: NOTRUN -> [50]SKIP ([51]Intel XE#1201 / [52]Intel       
>             XE#787) +38 other tests skip                                        
>      • igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-7:
>                                                                                 
>           • shard-dg2-set2: NOTRUN -> [53]SKIP ([54]Intel XE#1201 / [55]Intel   
>             XE#455 / [56]Intel XE#787) +12 other tests skip                     
>      • igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs:                             
>                                                                                 
>           • shard-adlp: NOTRUN -> [57]SKIP ([58]Intel XE#1201 / [59]Intel       
>             XE#1252) +1 other test skip                                         
>      • igt@kms_chamelium_audio@hdmi-audio-edid:                                 
>                                                                                 
>           • shard-adlp: NOTRUN -> [60]SKIP ([61]Intel XE#1201 / [62]Intel       
>             XE#373) +11 other tests skip                                        
>      • igt@kms_chamelium_color@ctm-green-to-red:                                
>                                                                                 
>           • shard-adlp: NOTRUN -> [63]SKIP ([64]Intel XE#1201 / [65]Intel       
>             XE#306)                                                             
>      • igt@kms_chamelium_color@ctm-negative:                                    
>                                                                                 
>           • shard-dg2-set2: NOTRUN -> [66]SKIP ([67]Intel XE#1201 / [68]Intel   
>             XE#306)                                                             
>      • igt@kms_chamelium_edid@hdmi-mode-timings:                                
>                                                                                 
>           • shard-dg2-set2: NOTRUN -> [69]SKIP ([70]Intel XE#1201 / [71]Intel   
>             XE#373) +1 other test skip                                          
>      • igt@kms_cursor_crc@cursor-offscreen-512x170:                             
>                                                                                 
>           • shard-adlp: NOTRUN -> [72]SKIP ([73]Intel XE#1201 / [74]Intel       
>             XE#308) +1 other test skip                                          
>      • igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:                 
>                                                                                 
>           • shard-dg2-set2: NOTRUN -> [75]DMESG-WARN ([76]Intel XE#1214 /       
>             [77]Intel XE#282) +2 other tests dmesg-warn                         
>      • igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions:               
>                                                                                 
>           • shard-dg2-set2: [78]PASS -> [79]DMESG-WARN ([80]Intel XE#1214 /     
>             [81]Intel XE#282) +7 other tests dmesg-warn                         
>      • igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:               
>                                                                                 
>           • shard-adlp: NOTRUN -> [82]SKIP ([83]Intel XE#1201 / [84]Intel       
>             XE#309) +6 other tests skip                                         
>      • igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:  
>                                                                                 
>           • shard-dg2-set2: NOTRUN -> [85]SKIP ([86]Intel XE#1201 / [87]Intel   
>             XE#323)                                                             
>      • igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:              
>                                                                                 
>           • shard-adlp: NOTRUN -> [88]SKIP ([89]Intel XE#1201 / [90]Intel       
>             XE#323)                                                             
>      • igt@kms_cursor_legacy@torture-bo:                                        
>                                                                                 
>           • shard-dg2-set2: [91]PASS -> [92]DMESG-WARN ([93]Intel XE#1214 /     
>             [94]Intel XE#282 / [95]Intel XE#877)                                
>      • igt@kms_cursor_legacy@torture-bo@pipe-b:                                 
>                                                                                 
>           • shard-dg2-set2: [96]PASS -> [97]DMESG-WARN ([98]Intel XE#1214 /     
>             [99]Intel XE#877) +1 other test dmesg-warn                          
>      • igt@kms_dsc@dsc-with-formats:                                            
>                                                                                 
>           • shard-dg2-set2: NOTRUN -> [100]SKIP ([101]Intel XE#1201 /           
>             [102]Intel XE#455)                                                  
>      • igt@kms_feature_discovery@dp-mst:                                        
>                                                                                 
>           • shard-dg2-set2: NOTRUN -> [103]SKIP ([104]Intel XE#1137 /           
>             [105]Intel XE#1201)                                                 
>           • shard-adlp: NOTRUN -> [106]SKIP ([107]Intel XE#1137 / [108]Intel    
>             XE#1201)                                                            
>      • igt@kms_flip@2x-flip-vs-panning-interruptible@bc-hdmi-a6-dp4:            
>                                                                                 
>           • shard-dg2-set2: [109]PASS -> [110]DMESG-WARN ([111]Intel XE#1214)   
>      • igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible: 
>                                                                                 
>           • shard-adlp: NOTRUN -> [112]SKIP ([113]Intel XE#1201 / [114]Intel    
>             XE#310) +2 other tests skip                                         
>      • igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1:                    
>                                                                                 
>           • shard-adlp: NOTRUN -> [115]DMESG-WARN ([116]Intel XE#1191 /         
>             [117]Intel XE#1214 / [118]Intel XE#1608) +4 other tests             
>             dmesg-warn                                                          
>      • igt@kms_flip@flip-vs-suspend@b-hdmi-a1:                                  
>                                                                                 
>           • shard-adlp: NOTRUN -> [119]DMESG-WARN ([120]Intel XE#1214 /         
>             [121]Intel XE#1608) +3 other tests dmesg-warn                       
>      • igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:     
>                                                                                 
>           • shard-adlp: NOTRUN -> [122]FAIL ([123]Intel XE#422 / [124]Intel     
>             XE#616) +1 other test fail                                          
>      • igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:
>                                                                                 
>           • shard-adlp: NOTRUN -> [125]SKIP ([126]Intel XE#1201 / [127]Intel    
>             XE#455) +27 other tests skip                                        
>      • igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc:                   
>                                                                                 
>           • shard-adlp: NOTRUN -> [128]SKIP ([129]Intel XE#1201 / [130]Intel    
>             XE#651) +9 other tests skip                                         
>      • igt@kms_frontbuffer_tracking@fbc-tiling-y:                               
>                                                                                 
>           • shard-dg2-set2: NOTRUN -> [131]SKIP ([132]Intel XE#1201 /           
>             [133]Intel XE#658)                                                  
>      • igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary:                
>                                                                                 
>           • shard-dg2-set2: NOTRUN -> [134]SKIP ([135]Intel XE#1201 /           
>             [136]Intel XE#651) +5 other tests skip                              
>      • igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:                 
>                                                                                 
>           • shard-adlp: NOTRUN -> [137]SKIP ([138]Intel XE#1201 / [139]Intel    
>             XE#653) +15 other tests skip                                        
>      • igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render:      
>                                                                                 
>           • shard-dg2-set2: NOTRUN -> [140]SKIP ([141]Intel XE#1201 /           
>             [142]Intel XE#653) +6 other tests skip                              
>      • igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:         
>                                                                                 
>           • shard-adlp: NOTRUN -> [143]SKIP ([144]Intel XE#1201 / [145]Intel    
>             XE#656) +39 other tests skip                                        
>      • igt@kms_hdmi_inject@inject-audio:                                        
>                                                                                 
>           • shard-adlp: NOTRUN -> [146]SKIP ([147]Intel XE#1201 / [148]Intel    
>             XE#417)                                                             
>      • igt@kms_plane_lowres@tiling-y@pipe-c-hdmi-a-1:                           
>                                                                                 
>           • shard-adlp: [149]PASS -> [150]FAIL ([151]Intel XE#616)              
>      • igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:                
>                                                                                 
>           • shard-dg2-set2: [152]PASS -> [153]FAIL ([154]Intel XE#361)          
>      • igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:     
>                                                                                 
>           • shard-adlp: NOTRUN -> [155]SKIP ([156]Intel XE#1201 / [157]Intel    
>             XE#455 / [158]Intel XE#498) +1 other test skip                      
>      • igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b-hdmi-a-1:
>                                                                                 
>           • shard-adlp: NOTRUN -> [159]SKIP ([160]Intel XE#1201 / [161]Intel    
>             XE#498) +2 other tests skip                                         
>      • igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6:
>                                                                                 
>           • shard-dg2-set2: NOTRUN -> [162]SKIP ([163]Intel XE#1201 /           
>             [164]Intel XE#498) +5 other tests skip                              
>      • igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:         
>                                                                                 
>           • shard-dg2-set2: NOTRUN -> [165]SKIP ([166]Intel XE#1201 /           
>             [167]Intel XE#455 / [168]Intel XE#498) +3 other tests skip          
>      • igt@kms_plane_scaling@planes-downscale-factor-0-25:                      
>                                                                                 
>           • shard-adlp: NOTRUN -> [169]SKIP ([170]Intel XE#1201 / [171]Intel    
>             XE#305 / [172]Intel XE#455) +1 other test skip                      
>      • igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a-hdmi-a-1:      
>                                                                                 
>           • shard-adlp: NOTRUN -> [173]SKIP ([174]Intel XE#1201 / [175]Intel    
>             XE#305) +2 other tests skip                                         
>      • igt@kms_pm_backlight@bad-brightness:                                     
>                                                                                 
>           • shard-dg2-set2: NOTRUN -> [176]SKIP ([177]Intel XE#1201 /           
>             [178]Intel XE#870)                                                  
>      • igt@kms_pm_backlight@fade-with-dpms:                                     
>                                                                                 
>           • shard-adlp: NOTRUN -> [179]SKIP ([180]Intel XE#1201 / [181]Intel    
>             XE#870)                                                             
>      • igt@kms_pm_rpm@legacy-planes-dpms:                                       
>                                                                                 
>           • shard-adlp: NOTRUN -> [182]SKIP ([183]Intel XE#1201 / [184]Intel    
>             XE#1211) +2 other tests skip                                        
>      • igt@kms_pm_rpm@modeset-non-lpsp-stress:                                  
>                                                                                 
>           • shard-adlp: NOTRUN -> [185]SKIP ([186]Intel XE#1201 / [187]Intel    
>             XE#836)                                                             
>      • igt@kms_psr@pr-cursor-render:                                            
>                                                                                 
>           • shard-adlp: NOTRUN -> [188]SKIP ([189]Intel XE#1201 / [190]Intel    
>             XE#929) +9 other tests skip                                         
>      • igt@kms_psr@psr2-dpms:                                                   
>                                                                                 
>           • shard-dg2-set2: NOTRUN -> [191]SKIP ([192]Intel XE#1201 /           
>             [193]Intel XE#929) +2 other tests skip                              
>      • igt@kms_rotation_crc@multiplane-rotation:                                
>                                                                                 
>           • shard-adlp: NOTRUN -> [194]FAIL ([195]Intel XE#616)                 
>      • igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:                      
>                                                                                 
>           • shard-adlp: NOTRUN -> [196]SKIP ([197]Intel XE#1127 / [198]Intel    
>             XE#1201) +1 other test skip                                         
>      • igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:                      
>                                                                                 
>           • shard-adlp: NOTRUN -> [199]SKIP ([200]Intel XE#1201 / [201]Intel    
>             XE#829)                                                             
>      • igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:                     
>                                                                                 
>           • shard-dg2-set2: NOTRUN -> [202]SKIP ([203]Intel XE#1127 /           
>             [204]Intel XE#1201)                                                 
>      • igt@kms_rotation_crc@sprite-rotation-90:                                 
>                                                                                 
>           • shard-adlp: NOTRUN -> [205]SKIP ([206]Intel XE#1201 / [207]Intel    
>             XE#327)                                                             
>      • igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:                  
>                                                                                 
>           • shard-dg2-set2: [208]PASS -> [209]FAIL ([210]Intel XE#899) +1       
>             other test fail                                                     
>      • igt@kms_vblank@ts-continuation-dpms-rpm@pipe-a-hdmi-a-1:                 
>                                                                                 
>           • shard-adlp: NOTRUN -> [211]SKIP ([212]Intel XE#1201 / [213]Intel    
>             XE#1207)                                                            
>      • igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1:                  
>                                                                                 
>           • shard-adlp: [214]PASS -> [215]DMESG-WARN ([216]Intel XE#1214 /      
>             [217]Intel XE#1608)                                                 
>      • igt@xe_ccs@block-multicopy-inplace:                                      
>                                                                                 
>           • shard-adlp: NOTRUN -> [218]SKIP ([219]Intel XE#1201 / [220]Intel    
>             XE#455 / [221]Intel XE#488)                                         
>      • igt@xe_compute@ccs-mode-basic:                                           
>                                                                                 
>           • shard-adlp: NOTRUN -> [222]SKIP ([223]Intel XE#1201 / [224]Intel    
>             XE#1447) +1 other test skip                                         
>      • igt@xe_copy_basic@mem-copy-linear-0x3fff:                                
>                                                                                 
>           • shard-adlp: NOTRUN -> [225]SKIP ([226]Intel XE#1123 / [227]Intel    
>             XE#1201)                                                            
>      • igt@xe_copy_basic@mem-set-linear-0xfffe:                                 
>                                                                                 
>           • shard-dg2-set2: NOTRUN -> [228]SKIP ([229]Intel XE#1126 /           
>             [230]Intel XE#1201)                                                 
>           • shard-adlp: NOTRUN -> [231]SKIP ([232]Intel XE#1126 / [233]Intel    
>             XE#1201) +1 other test skip                                         
>      • igt@xe_evict@evict-beng-threads-small:                                   
>                                                                                 
>           • shard-adlp: NOTRUN -> [234]SKIP ([235]Intel XE#1201 / [236]Intel    
>             XE#261) +3 other tests skip                                         
>      • igt@xe_evict@evict-large-multi-vm-cm:                                    
>                                                                                 
>           • shard-dg2-set2: [237]PASS -> [238]FAIL ([239]Intel XE#1600)         
>      • igt@xe_evict@evict-mixed-threads-large:                                  
>                                                                                 
>           • shard-dg2-set2: [240]PASS -> [241]DMESG-FAIL ([242]Intel XE#482)    
>      • igt@xe_evict@evict-small-multi-vm-cm:                                    
>                                                                                 
>           • shard-adlp: NOTRUN -> [243]SKIP ([244]Intel XE#1201 / [245]Intel    
>             XE#261 / [246]Intel XE#688) +1 other test skip                      
>      • igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:                
>                                                                                 
>           • shard-adlp: NOTRUN -> [247]SKIP ([248]Intel XE#1201 / [249]Intel    
>             XE#688) +1 other test skip                                          
>      • igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race:
>                                                                                 
>           • shard-adlp: NOTRUN -> [250]SKIP ([251]Intel XE#1201 / [252]Intel    
>             XE#1392) +6 other tests skip                                        
>      • igt@xe_exec_fault_mode@many-execqueues-userptr-rebind:                   
>                                                                                 
>           • shard-adlp: NOTRUN -> [253]SKIP ([254]Intel XE#1201 / [255]Intel    
>             XE#288) +19 other tests skip                                        
>      • igt@xe_exec_fault_mode@once-userptr-invalidate-imm:                      
>                                                                                 
>           • shard-adlp: NOTRUN -> [256]SKIP ([257]Intel XE#1201 / [258]Intel    
>             XE#1562) +1 other test skip                                         
>      • igt@xe_exec_fault_mode@once-userptr-invalidate-race-prefetch:            
>                                                                                 
>           • shard-dg2-set2: NOTRUN -> [259]SKIP ([260]Intel XE#1201 /           
>             [261]Intel XE#288) +6 other tests skip                              
>      • igt@xe_exec_reset@gt-reset-stress:                                       
>                                                                                 
>           • shard-adlp: NOTRUN -> [262]DMESG-WARN ([263]Intel XE#1214 /         
>             [264]Intel XE#1638)                                                 
>      • igt@xe_gt_freq@freq_low_max:                                             
>                                                                                 
>           • shard-dg2-set2: NOTRUN -> [265]FAIL ([266]Intel XE#1045 /           
>             [267]Intel XE#1204)                                                 
>      • igt@xe_media_fill@media-fill:                                            
>                                                                                 
>           • shard-dg2-set2: NOTRUN -> [268]SKIP ([269]Intel XE#1201 /           
>             [270]Intel XE#560)                                                  
>      • igt@xe_pm@d3cold-multiple-execs:                                         
>                                                                                 
>           • shard-dg2-set2: NOTRUN -> [271]SKIP ([272]Intel XE#1201 /           
>             [273]Intel XE#366)                                                  
>      • igt@xe_pm@s3-d3hot-basic-exec:                                           
>                                                                                 
>           • shard-adlp: NOTRUN -> [274]WARN ([275]Intel XE#1639)                
>      • igt@xe_pm@s3-exec-after:                                                 
>                                                                                 
>           • shard-adlp: NOTRUN -> [276]DMESG-WARN ([277]Intel XE#1191 /         
>             [278]Intel XE#1214) +1 other test dmesg-warn                        
>      • igt@xe_pm@s4-basic:                                                      
>                                                                                 
>           • shard-adlp: NOTRUN -> [279]FAIL ([280]Intel XE#1043 / [281]Intel    
>             XE#845)                                                             
>      • igt@xe_pm@s4-d3cold-basic-exec:                                          
>                                                                                 
>           • shard-adlp: NOTRUN -> [282]SKIP ([283]Intel XE#1201 / [284]Intel    
>             XE#366) +1 other test skip                                          
>      • igt@xe_query@multigpu-query-config:                                      
>                                                                                 
>           • shard-dg2-set2: NOTRUN -> [285]SKIP ([286]Intel XE#1201 /           
>             [287]Intel XE#944)                                                  
>                                                                                 
>     Possible fixes                                                              
>                                                                                 
>      • igt@kms_cursor_crc@cursor-alpha-opaque:                                  
>                                                                                 
>           • {shard-lnl}: [288]DMESG-WARN ([289]Intel XE#1330) -> [290]PASS +3   
>             other tests pass                                                    
>      • igt@kms_cursor_legacy@forked-bo@all-pipes:                               
>                                                                                 
>           • shard-dg2-set2: [291]DMESG-WARN ([292]Intel XE#1214 / [293]Intel    
>             XE#282) -> [294]PASS                                                
>      • igt@kms_flip@2x-absolute-wf_vblank-interruptible:                        
>                                                                                 
>           • shard-dg2-set2: [295]INCOMPLETE ([296]Intel XE#1195) -> [297]PASS   
>             +2 other tests pass                                                 
>      • igt@kms_flip@flip-vs-expired-vblank-interruptible:                       
>                                                                                 
>           • shard-adlp: [298]FAIL ([299]Intel XE#301) -> [300]PASS +1 other     
>             test pass                                                           
>      • igt@kms_flip@plain-flip-interruptible:                                   
>                                                                                 
>           • shard-dg2-set2: [301]DMESG-WARN ([302]Intel XE#1214) -> [303]PASS   
>             +1 other test pass                                                  
>      • igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1:                           
>                                                                                 
>           • shard-adlp: [304]FAIL ([305]Intel XE#616) -> [306]PASS              
>      • igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6:                  
>                                                                                 
>           • shard-dg2-set2: [307]FAIL ([308]Intel XE#899) -> [309]PASS          
>      • igt@kms_universal_plane@disable-primary-vs-flip:                         
>                                                                                 
>           • shard-adlp: [310]INCOMPLETE ([311]Intel XE#1195) -> [312]PASS       
>      • igt@xe_evict@evict-beng-threads-large:                                   
>                                                                                 
>           • shard-dg2-set2: [313]TIMEOUT ([314]Intel XE#1473) -> [315]PASS      
>      • igt@xe_exec_fault_mode@many-bindexecqueue-userptr-prefetch:              
>                                                                                 
>           • {shard-lnl}: [316]INCOMPLETE ([317]Intel XE#1330) -> [318]PASS      
>      • igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch: 
>                                                                                 
>           • {shard-lnl}: [319]DMESG-FAIL ([320]Intel XE#1330) -> [321]PASS      
>      • igt@xe_exec_fault_mode@many-userptr-invalidate-race:                     
>                                                                                 
>           • {shard-lnl}: [322]ABORT ([323]Intel XE#1761) -> [324]PASS           
>      • igt@xe_pm_residency@toggle-gt-c6:                                        
>                                                                                 
>           • shard-adlp: [325]FAIL ([326]Intel XE#958) -> [327]PASS              
>                                                                                 
>     Warnings                                                                    
>                                                                                 
>      • igt@core_hotunplug@hotreplug-lateclose:                                  
>                                                                                 
>           • shard-adlp: [328]INCOMPLETE ([329]Intel XE#1195 / [330]Intel        
>             XE#1365) -> [331]ABORT ([332]Intel XE#1538 / [333]Intel XE#1717)    
>      • igt@kms_async_flips@async-flip-with-page-flip-events:                    
>                                                                                 
>           • shard-adlp: [334]DMESG-WARN ([335]Intel XE#1033 / [336]Intel        
>             XE#1214 / [337]Intel XE#358) -> [338]DMESG-WARN ([339]Intel         
>             XE#1033 / [340]Intel XE#1214 / [341]Intel XE#324 / [342]Intel       
>             XE#358)                                                             
>      • igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y:  
>                                                                                 
>           • shard-adlp: [343]DMESG-WARN ([344]Intel XE#1033 / [345]Intel        
>             XE#1214) -> [346]DMESG-WARN ([347]Intel XE#1033 / [348]Intel        
>             XE#1214 / [349]Intel XE#324)                                        
>      • igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:    
>                                                                                 
>           • shard-adlp: [350]FAIL ([351]Intel XE#1204) -> [352]DMESG-FAIL       
>             ([353]Intel XE#324)                                                 
>      • igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:          
>                                                                                 
>           • shard-adlp: [354]DMESG-FAIL ([355]Intel XE#324) -> [356]FAIL        
>             ([357]Intel XE#1231) +1 other test fail                             
>      • igt@kms_content_protection@srm:                                          
>                                                                                 
>           • shard-dg2-set2: [358]FAIL ([359]Intel XE#1178) -> [360]SKIP         
>             ([361]Intel XE#1201 / [362]Intel XE#455)                            
>      • igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:                     
>                                                                                 
>           • shard-dg2-set2: [363]DMESG-WARN ([364]Intel XE#1214 / [365]Intel    
>             XE#282 / [366]Intel XE#910) -> [367]DMESG-WARN ([368]Intel          
>             XE#1214 / [369]Intel XE#282)                                        
>      • igt@kms_flip@2x-flip-vs-modeset:                                         
>                                                                                 
>           • shard-dg2-set2: [370]SKIP ([371]Intel XE#1201 / [372]Intel          
>             XE#1226) -> [373]SKIP ([374]Intel XE#1201) +3 other tests skip      
>      • igt@kms_flip@flip-vs-suspend-interruptible:                              
>                                                                                 
>           • shard-adlp: [375]INCOMPLETE ([376]Intel XE#1195 / [377]Intel        
>             XE#927) -> [378]DMESG-WARN ([379]Intel XE#1191 / [380]Intel         
>             XE#1214 / [381]Intel XE#1608) +2 other tests dmesg-warn             
>           • shard-dg2-set2: [382]INCOMPLETE ([383]Intel XE#1195) ->             
>             [384]DMESG-WARN ([385]Intel XE#1162 / [386]Intel XE#1214)           
>      • igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:                    
>                                                                                 
>           • shard-adlp: [387]INCOMPLETE ([388]Intel XE#1195) ->                 
>             [389]DMESG-WARN ([390]Intel XE#1191 / [391]Intel XE#1214 /          
>             [392]Intel XE#1608) +2 other tests dmesg-warn                       
>      • igt@kms_psr@pr-basic:                                                    
>                                                                                 
>           • shard-dg2-set2: [393]SKIP ([394]Intel XE#1201 / [395]Intel          
>             XE#1226 / [396]Intel XE#1234) -> [397]SKIP ([398]Intel XE#1201 /    
>             [399]Intel XE#1234)                                                 
>      • igt@kms_vblank@ts-continuation-suspend:                                  
>                                                                                 
>           • shard-adlp: [400]DMESG-WARN ([401]Intel XE#1191 / [402]Intel        
>             XE#1214) -> [403]DMESG-WARN ([404]Intel XE#1191 / [405]Intel        
>             XE#1214 / [406]Intel XE#1608)                                       
>      • igt@xe_pm@s2idle-basic-exec:                                             
>                                                                                 
>           • shard-adlp: [407]INCOMPLETE ([408]Intel XE#1195 / [409]Intel        
>             XE#1358 / [410]Intel XE#927) -> [411]DMESG-WARN ([412]Intel         
>             XE#1191 / [413]Intel XE#1214 / [414]Intel XE#1608)                  
>      • igt@xe_pm@s2idle-exec-after:                                             
>                                                                                 
>           • shard-adlp: [415]INCOMPLETE ([416]Intel XE#1044 / [417]Intel        
>             XE#1195 / [418]Intel XE#1358) -> [419]DMESG-WARN ([420]Intel        
>             XE#1191 / [421]Intel XE#1214)                                       
>      • igt@xe_pm@s3-multiple-execs:                                             
>                                                                                 
>           • shard-adlp: [422]DMESG-WARN ([423]Intel XE#1191 / [424]Intel        
>             XE#1214) -> [425]INCOMPLETE ([426]Intel XE#1044 / [427]Intel        
>             XE#1195 / [428]Intel XE#1358)                                       
>                                                                                 
>    {name}: This element is suppressed. This means it is ignored when            
>    computing                                                                    
>    the status of the difference (SUCCESS, WARNING, or FAILURE).                 
>                                                                                 
> Build changes                                                                   
>                                                                                 
>      • Linux: xe-1236-e9ea5061461b07fcb7e19892a54a61aa8fa1d163 ->               
>        xe-pw-133186v1                                                           
>                                                                                 
>    IGT_7832: f4a19f8c3a506c6ef7241e80ed966230d18acb03 @                         
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git                         
>    xe-1236-e9ea5061461b07fcb7e19892a54a61aa8fa1d163:                            
>    e9ea5061461b07fcb7e19892a54a61aa8fa1d163                                     
>    xe-pw-133186v1: 133186v1                                                     
> 
> References
> 
>    Visible links
>    1. https://patchwork.freedesktop.org/series/133186/
>    2. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/index.html
>    3. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1236-e9ea5061461b07fcb7e19892a54a61aa8fa1d163/shard-adlp-1/igt@xe_pm@d3hot-basic-exec.html
>    4. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-adlp-9/igt@xe_pm@d3hot-basic-exec.html
>    5. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1236-e9ea5061461b07fcb7e19892a54a61aa8fa1d163/shard-dg2-466/igt@xe_pm@d3hot-basic-exec.html
>    6. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-dg2-434/igt@xe_pm@d3hot-basic-exec.html
>    7. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1236-e9ea5061461b07fcb7e19892a54a61aa8fa1d163/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html
>    8. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html
>    9. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-lnl-4/igt@kms_flip@plain-flip-ts-check@a-edp1.html
>   10. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt.html
>   11. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-lnl-2/igt@kms_plane_cursor@overlay.html
>   12. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1236-e9ea5061461b07fcb7e19892a54a61aa8fa1d163/shard-lnl-1/igt@kms_vblank@wait-busy-hang@pipe-c-edp-1.html
>   13. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-lnl-4/igt@kms_vblank@wait-busy-hang@pipe-c-edp-1.html
>   14. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1236-e9ea5061461b07fcb7e19892a54a61aa8fa1d163/shard-lnl-7/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-imm.html
>   15. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-lnl-2/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-imm.html
>   16. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1236-e9ea5061461b07fcb7e19892a54a61aa8fa1d163/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html
>   17. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html
>   18. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>   19. https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
>   20. https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
>   21. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-adlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
>   22. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   23. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   24. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-dg2-466/igt@kms_big_fb@linear-32bpp-rotate-90.html
>   25. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   26. https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   27. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
>   28. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
>   29. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-adlp-4/igt@kms_big_fb@y-tiled-16bpp-rotate-270.html
>   30. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   31. https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   32. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-dg2-464/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html
>   33. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   34. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   35. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-dg2-464/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
>   36. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   37. https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
>   38. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-adlp-8/igt@kms_big_joiner@invalid-modeset-force-joiner.html
>   39. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   40. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-adlp-8/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
>   41. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   42. https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   43. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-adlp-4/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html
>   44. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   45. https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   46. https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   47. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-dg2-466/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-6.html
>   48. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   49. https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   50. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-adlp-8/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1.html
>   51. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   52. https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   53. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-7.html
>   54. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   55. https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   56. https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   57. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-adlp-9/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html
>   58. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   59. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
>   60. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-adlp-4/igt@kms_chamelium_audio@hdmi-audio-edid.html
>   61. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   62. https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   63. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-adlp-4/igt@kms_chamelium_color@ctm-green-to-red.html
>   64. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   65. https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   66. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-dg2-464/igt@kms_chamelium_color@ctm-negative.html
>   67. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   68. https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   69. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-dg2-466/igt@kms_chamelium_edid@hdmi-mode-timings.html
>   70. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   71. https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   72. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-adlp-9/igt@kms_cursor_crc@cursor-offscreen-512x170.html
>   73. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   74. https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>   75. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-dg2-464/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
>   76. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>   77. https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
>   78. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1236-e9ea5061461b07fcb7e19892a54a61aa8fa1d163/shard-dg2-433/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html
>   79. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-dg2-434/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html
>   80. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>   81. https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
>   82. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-adlp-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
>   83. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   84. https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   85. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-dg2-464/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
>   86. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   87. https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>   88. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-adlp-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
>   89. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   90. https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>   91. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1236-e9ea5061461b07fcb7e19892a54a61aa8fa1d163/shard-dg2-463/igt@kms_cursor_legacy@torture-bo.html
>   92. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-dg2-463/igt@kms_cursor_legacy@torture-bo.html
>   93. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>   94. https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
>   95. https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
>   96. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1236-e9ea5061461b07fcb7e19892a54a61aa8fa1d163/shard-dg2-463/igt@kms_cursor_legacy@torture-bo@pipe-b.html
>   97. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-dg2-463/igt@kms_cursor_legacy@torture-bo@pipe-b.html
>   98. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>   99. https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
>  100. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-dg2-464/igt@kms_dsc@dsc-with-formats.html
>  101. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  102. https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>  103. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-dg2-433/igt@kms_feature_discovery@dp-mst.html
>  104. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
>  105. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  106. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-adlp-8/igt@kms_feature_discovery@dp-mst.html
>  107. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
>  108. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  109. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1236-e9ea5061461b07fcb7e19892a54a61aa8fa1d163/shard-dg2-433/igt@kms_flip@2x-flip-vs-panning-interruptible@bc-hdmi-a6-dp4.html
>  110. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-dg2-435/igt@kms_flip@2x-flip-vs-panning-interruptible@bc-hdmi-a6-dp4.html
>  111. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>  112. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-adlp-4/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html
>  113. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  114. https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
>  115. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html
>  116. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
>  117. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>  118. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608
>  119. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-adlp-8/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
>  120. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>  121. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608
>  122. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-adlp-4/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html
>  123. https://gitlab.freedesktop.org/drm/xe/kernel/issues/422
>  124. https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
>  125. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-adlp-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html
>  126. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  127. https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>  128. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc.html
>  129. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  130. https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>  131. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
>  132. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  133. https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
>  134. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary.html
>  135. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  136. https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>  137. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html
>  138. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  139. https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>  140. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html
>  141. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  142. https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>  143. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html
>  144. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  145. https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>  146. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-adlp-2/igt@kms_hdmi_inject@inject-audio.html
>  147. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  148. https://gitlab.freedesktop.org/drm/xe/kernel/issues/417
>  149. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1236-e9ea5061461b07fcb7e19892a54a61aa8fa1d163/shard-adlp-8/igt@kms_plane_lowres@tiling-y@pipe-c-hdmi-a-1.html
>  150. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-adlp-8/igt@kms_plane_lowres@tiling-y@pipe-c-hdmi-a-1.html
>  151. https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
>  152. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1236-e9ea5061461b07fcb7e19892a54a61aa8fa1d163/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
>  153. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
>  154. https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
>  155. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-adlp-4/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
>  156. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  157. https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>  158. https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
>  159. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-adlp-4/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b-hdmi-a-1.html
>  160. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  161. https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
>  162. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6.html
>  163. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  164. https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
>  165. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
>  166. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  167. https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>  168. https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
>  169. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-adlp-4/igt@kms_plane_scaling@planes-downscale-factor-0-25.html
>  170. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  171. https://gitlab.freedesktop.org/drm/xe/kernel/issues/305
>  172. https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>  173. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-adlp-4/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a-hdmi-a-1.html
>  174. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  175. https://gitlab.freedesktop.org/drm/xe/kernel/issues/305
>  176. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-dg2-464/igt@kms_pm_backlight@bad-brightness.html
>  177. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  178. https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>  179. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-adlp-8/igt@kms_pm_backlight@fade-with-dpms.html
>  180. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  181. https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>  182. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-adlp-8/igt@kms_pm_rpm@legacy-planes-dpms.html
>  183. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  184. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211
>  185. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-adlp-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
>  186. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  187. https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
>  188. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-adlp-8/igt@kms_psr@pr-cursor-render.html
>  189. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  190. https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>  191. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-dg2-464/igt@kms_psr@psr2-dpms.html
>  192. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  193. https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>  194. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-adlp-2/igt@kms_rotation_crc@multiplane-rotation.html
>  195. https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
>  196. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-adlp-2/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html
>  197. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>  198. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  199. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-adlp-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
>  200. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  201. https://gitlab.freedesktop.org/drm/xe/kernel/issues/829
>  202. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
>  203. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>  204. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  205. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-adlp-4/igt@kms_rotation_crc@sprite-rotation-90.html
>  206. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  207. https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
>  208. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1236-e9ea5061461b07fcb7e19892a54a61aa8fa1d163/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html
>  209. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html
>  210. https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>  211. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-adlp-8/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-a-hdmi-a-1.html
>  212. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  213. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1207
>  214. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1236-e9ea5061461b07fcb7e19892a54a61aa8fa1d163/shard-adlp-2/igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1.html
>  215. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-adlp-8/igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1.html
>  216. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>  217. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608
>  218. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-adlp-8/igt@xe_ccs@block-multicopy-inplace.html
>  219. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  220. https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>  221. https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
>  222. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-adlp-4/igt@xe_compute@ccs-mode-basic.html
>  223. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  224. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
>  225. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-adlp-4/igt@xe_copy_basic@mem-copy-linear-0x3fff.html
>  226. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
>  227. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  228. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0xfffe.html
>  229. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
>  230. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  231. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-adlp-4/igt@xe_copy_basic@mem-set-linear-0xfffe.html
>  232. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
>  233. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  234. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-adlp-8/igt@xe_evict@evict-beng-threads-small.html
>  235. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  236. https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
>  237. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1236-e9ea5061461b07fcb7e19892a54a61aa8fa1d163/shard-dg2-436/igt@xe_evict@evict-large-multi-vm-cm.html
>  238. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-dg2-433/igt@xe_evict@evict-large-multi-vm-cm.html
>  239. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
>  240. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1236-e9ea5061461b07fcb7e19892a54a61aa8fa1d163/shard-dg2-435/igt@xe_evict@evict-mixed-threads-large.html
>  241. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-dg2-466/igt@xe_evict@evict-mixed-threads-large.html
>  242. https://gitlab.freedesktop.org/drm/xe/kernel/issues/482
>  243. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-adlp-8/igt@xe_evict@evict-small-multi-vm-cm.html
>  244. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  245. https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
>  246. https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>  247. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-adlp-8/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
>  248. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  249. https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>  250. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-adlp-4/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race.html
>  251. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  252. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>  253. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-adlp-9/igt@xe_exec_fault_mode@many-execqueues-userptr-rebind.html
>  254. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  255. https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>  256. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-adlp-8/igt@xe_exec_fault_mode@once-userptr-invalidate-imm.html
>  257. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  258. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1562
>  259. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-dg2-466/igt@xe_exec_fault_mode@once-userptr-invalidate-race-prefetch.html
>  260. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  261. https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>  262. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-adlp-2/igt@xe_exec_reset@gt-reset-stress.html
>  263. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>  264. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638
>  265. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-dg2-464/igt@xe_gt_freq@freq_low_max.html
>  266. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1045
>  267. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
>  268. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-dg2-466/igt@xe_media_fill@media-fill.html
>  269. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  270. https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
>  271. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-dg2-464/igt@xe_pm@d3cold-multiple-execs.html
>  272. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  273. https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>  274. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-adlp-8/igt@xe_pm@s3-d3hot-basic-exec.html
>  275. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1639
>  276. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-adlp-4/igt@xe_pm@s3-exec-after.html
>  277. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
>  278. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>  279. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-adlp-8/igt@xe_pm@s4-basic.html
>  280. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1043
>  281. https://gitlab.freedesktop.org/drm/xe/kernel/issues/845
>  282. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-adlp-4/igt@xe_pm@s4-d3cold-basic-exec.html
>  283. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  284. https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>  285. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-dg2-464/igt@xe_query@multigpu-query-config.html
>  286. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  287. https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>  288. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1236-e9ea5061461b07fcb7e19892a54a61aa8fa1d163/shard-lnl-8/igt@kms_cursor_crc@cursor-alpha-opaque.html
>  289. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330
>  290. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-lnl-6/igt@kms_cursor_crc@cursor-alpha-opaque.html
>  291. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1236-e9ea5061461b07fcb7e19892a54a61aa8fa1d163/shard-dg2-434/igt@kms_cursor_legacy@forked-bo@all-pipes.html
>  292. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>  293. https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
>  294. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-dg2-436/igt@kms_cursor_legacy@forked-bo@all-pipes.html
>  295. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1236-e9ea5061461b07fcb7e19892a54a61aa8fa1d163/shard-dg2-435/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html
>  296. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>  297. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-dg2-433/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html
>  298. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1236-e9ea5061461b07fcb7e19892a54a61aa8fa1d163/shard-adlp-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
>  299. https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>  300. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-adlp-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
>  301. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1236-e9ea5061461b07fcb7e19892a54a61aa8fa1d163/shard-dg2-433/igt@kms_flip@plain-flip-interruptible.html
>  302. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>  303. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-dg2-464/igt@kms_flip@plain-flip-interruptible.html
>  304. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1236-e9ea5061461b07fcb7e19892a54a61aa8fa1d163/shard-adlp-8/igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1.html
>  305. https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
>  306. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-adlp-8/igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1.html
>  307. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1236-e9ea5061461b07fcb7e19892a54a61aa8fa1d163/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html
>  308. https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>  309. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html
>  310. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1236-e9ea5061461b07fcb7e19892a54a61aa8fa1d163/shard-adlp-2/igt@kms_universal_plane@disable-primary-vs-flip.html
>  311. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>  312. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-adlp-8/igt@kms_universal_plane@disable-primary-vs-flip.html
>  313. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1236-e9ea5061461b07fcb7e19892a54a61aa8fa1d163/shard-dg2-435/igt@xe_evict@evict-beng-threads-large.html
>  314. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>  315. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-dg2-433/igt@xe_evict@evict-beng-threads-large.html
>  316. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1236-e9ea5061461b07fcb7e19892a54a61aa8fa1d163/shard-lnl-5/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-prefetch.html
>  317. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330
>  318. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-lnl-3/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-prefetch.html
>  319. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1236-e9ea5061461b07fcb7e19892a54a61aa8fa1d163/shard-lnl-7/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch.html
>  320. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330
>  321. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-lnl-7/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch.html
>  322. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1236-e9ea5061461b07fcb7e19892a54a61aa8fa1d163/shard-lnl-3/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html
>  323. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1761
>  324. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-lnl-6/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html
>  325. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1236-e9ea5061461b07fcb7e19892a54a61aa8fa1d163/shard-adlp-2/igt@xe_pm_residency@toggle-gt-c6.html
>  326. https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
>  327. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-adlp-1/igt@xe_pm_residency@toggle-gt-c6.html
>  328. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1236-e9ea5061461b07fcb7e19892a54a61aa8fa1d163/shard-adlp-9/igt@core_hotunplug@hotreplug-lateclose.html
>  329. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>  330. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1365
>  331. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-adlp-4/igt@core_hotunplug@hotreplug-lateclose.html
>  332. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1538
>  333. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1717
>  334. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1236-e9ea5061461b07fcb7e19892a54a61aa8fa1d163/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events.html
>  335. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
>  336. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>  337. https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
>  338. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events.html
>  339. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
>  340. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>  341. https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
>  342. https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
>  343. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1236-e9ea5061461b07fcb7e19892a54a61aa8fa1d163/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html
>  344. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
>  345. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>  346. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html
>  347. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
>  348. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>  349. https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
>  350. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1236-e9ea5061461b07fcb7e19892a54a61aa8fa1d163/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
>  351. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
>  352. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
>  353. https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
>  354. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1236-e9ea5061461b07fcb7e19892a54a61aa8fa1d163/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
>  355. https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
>  356. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
>  357. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
>  358. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1236-e9ea5061461b07fcb7e19892a54a61aa8fa1d163/shard-dg2-433/igt@kms_content_protection@srm.html
>  359. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>  360. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-dg2-464/igt@kms_content_protection@srm.html
>  361. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  362. https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>  363. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1236-e9ea5061461b07fcb7e19892a54a61aa8fa1d163/shard-dg2-434/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
>  364. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>  365. https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
>  366. https://gitlab.freedesktop.org/drm/xe/kernel/issues/910
>  367. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-dg2-466/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
>  368. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>  369. https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
>  370. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1236-e9ea5061461b07fcb7e19892a54a61aa8fa1d163/shard-dg2-433/igt@kms_flip@2x-flip-vs-modeset.html
>  371. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  372. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226
>  373. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-dg2-464/igt@kms_flip@2x-flip-vs-modeset.html
>  374. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  375. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1236-e9ea5061461b07fcb7e19892a54a61aa8fa1d163/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible.html
>  376. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>  377. https://gitlab.freedesktop.org/drm/xe/kernel/issues/927
>  378. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible.html
>  379. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
>  380. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>  381. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608
>  382. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1236-e9ea5061461b07fcb7e19892a54a61aa8fa1d163/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible.html
>  383. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>  384. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible.html
>  385. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
>  386. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>  387. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1236-e9ea5061461b07fcb7e19892a54a61aa8fa1d163/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
>  388. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>  389. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
>  390. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
>  391. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>  392. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608
>  393. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1236-e9ea5061461b07fcb7e19892a54a61aa8fa1d163/shard-dg2-433/igt@kms_psr@pr-basic.html
>  394. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  395. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226
>  396. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1234
>  397. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-dg2-464/igt@kms_psr@pr-basic.html
>  398. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  399. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1234
>  400. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1236-e9ea5061461b07fcb7e19892a54a61aa8fa1d163/shard-adlp-2/igt@kms_vblank@ts-continuation-suspend.html
>  401. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
>  402. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>  403. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-adlp-8/igt@kms_vblank@ts-continuation-suspend.html
>  404. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
>  405. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>  406. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608
>  407. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1236-e9ea5061461b07fcb7e19892a54a61aa8fa1d163/shard-adlp-1/igt@xe_pm@s2idle-basic-exec.html
>  408. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>  409. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
>  410. https://gitlab.freedesktop.org/drm/xe/kernel/issues/927
>  411. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-adlp-2/igt@xe_pm@s2idle-basic-exec.html
>  412. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
>  413. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>  414. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608
>  415. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1236-e9ea5061461b07fcb7e19892a54a61aa8fa1d163/shard-adlp-9/igt@xe_pm@s2idle-exec-after.html
>  416. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044
>  417. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>  418. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
>  419. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-adlp-4/igt@xe_pm@s2idle-exec-after.html
>  420. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
>  421. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>  422. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1236-e9ea5061461b07fcb7e19892a54a61aa8fa1d163/shard-adlp-2/igt@xe_pm@s3-multiple-execs.html
>  423. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
>  424. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>  425. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133186v1/shard-adlp-1/igt@xe_pm@s3-multiple-execs.html
>  426. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044
>  427. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>  428. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
