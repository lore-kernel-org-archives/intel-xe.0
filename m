Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBC65C55174
	for <intel-xe@archiver.kernel.org>; Wed,  5 Aug 2026 05:39:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9190F10ECA8;
	Wed,  5 Aug 2026 05:39:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b87PfAL0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8EB310E159;
 Wed,  5 Aug 2026 05:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785908351; x=1817444351;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RJTNy2kyx6YZXf4vVajS2lauaeR4A6EH6R01ob8kzYY=;
 b=b87PfAL0fNWqYPOkzxtSM82zkEi5Ex5Dja4CUWMlyWgregctaWEHgdsm
 sMxnhnIslAI0JTVIt9bnavUXog89AW/4cRGAUFNaAWhCXzBBGdI3IfwFR
 sLwc3Swmzv6frWaEC40AetNcxzpgp+uq2gMmLtztZmD5rgv962rqC9P4f
 fyxw+OxEbxQleQc/g46BDqer1xsHhl0DItLOu6e3bNEcyDrOpt9M1nbl7
 l58dqLEqazYALSyIji13AXbAColLGOV+8B3Dg78F1p7wZ5Yoer7Kyc4Pm
 eazEwM03G7IqT1lGUO8OAFzxPAO/jAzvAchhDLs6BqeWDAfELa6VheGIx w==;
X-CSE-ConnectionGUID: 4IA1nlMDR86tRlj8wgbGCw==
X-CSE-MsgGUID: v3oiMqYVSAaJ0GAeJaFTTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="86331837"
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; d="scan'208";a="86331837"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 22:39:11 -0700
X-CSE-ConnectionGUID: akdVdxh0SCK7Ar3gSu0niQ==
X-CSE-MsgGUID: b6y5SMDaRvWzHXUV/dlqcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; d="scan'208";a="299915384"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 22:39:11 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 4 Aug 2026 22:39:10 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 4 Aug 2026 22:39:10 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.47) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 4 Aug 2026 22:39:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E+9v7ZTSrV8kAChsiClFTnYRBKW5HoUqkSO2uxYjQ0dDAgPeUav2oM7YHraNn/5JVugZLpQ4UHjyRqyAUxZmdZMsj7eMCxVDzOD0y6LEWrZhEsMskhknuQhTVFroc//STDL1VQuo8Ogk8gnNmUgMYkTgVHqAT5dLFJklylIo/jlZhY+CGeW3qsX5JE1Mqx3QoOGWG/fAnUJMgRyFH6j2WSD3vRdWVf8A0T2YlWmfuKEmPOxdvGsaB1TeJ9mMPT5wfU7/tSQU4G/NU+EKTrPcuY1/ojMSMFvQvXbwdpiPMC5+bNe+eP49gL1z3rMMY0pxz9q9ZZcmMcrb2plpVCVghA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rRvpjFrRPUr2pMgS2wjUqbMzmolcwbLDPebQo6S06to=;
 b=eBmrlRNNVVWCnCrhyZWLNA2JcZHGw8BDyABr7HYCkovmqx5Kjx+4RP3FeacpwsgH5ulDOS7bZcA+b4OYxWhxYl4H0Z91CNaBqbUd5u/iLjlfxiVduDotRDCGXXHgc+Z4wNID45Nc6IMgj4uVBzA2DY2ZfLuPz2xzWAvjf3w/dT/sxdk9VaqXHq2JCJFeLBPH0LtWSGYn9JJsZ3imLo6YqjeenGkMbZo4UVMMq/6IVsNIwbFGuKn48ULVcpqQdHMqJR8L+Ui+qY5flseN9iS8Cgeh6jcicOLGPDZLseOG1IW8fq1vm3hq09G5vgbcspRK29r3kCAoJNmlkEp3IB0jPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 by IA4PR11MB9012.namprd11.prod.outlook.com (2603:10b6:208:56d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.20; Wed, 5 Aug
 2026 05:39:06 +0000
Received: from PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b]) by PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b%5]) with mapi id 15.21.0292.013; Wed, 5 Aug 2026
 05:39:06 +0000
Message-ID: <4af6b668-e117-4ab3-a534-82564feb9002@intel.com>
Date: Wed, 5 Aug 2026 11:08:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/i915/dp: Use array size for intersect_rates() bound
To: Suraj Kandpal <suraj.kandpal@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <intel-gfx@lists.freedesktop.org>
CC: <ankit.k.nautiyal@intel.com>, <jani.nikula@intel.com>
References: <20260804085658.1306761-1-suraj.kandpal@intel.com>
 <20260804105549.1435154-1-suraj.kandpal@intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260804105549.1435154-1-suraj.kandpal@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0349.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21f::8) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7636:EE_|IA4PR11MB9012:EE_
X-MS-Office365-Filtering-Correlation-Id: 59ad68b8-dfdc-4c15-9ecb-08def2b3dd8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|10067099003|56012099006|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 1o0Wm0nLhnHqo6nZFkpGXbS4y4WcsY35+8vaHwH3iagm8PYbdiO6jOOofFxxCT7R4I9Yy5u/9RCvZJYNJfp/Q+XY7sjSZugDUbllYAt9RQ2hfKcTA46/DOsDQmFgVGHycaVOf1nHZEQFMamQrBE+Ml2JjEGpiI3b68sbnwNrZ4UC/AfkDclR5iXp7yrh/KyZ3niUiKZs9ZFPu/ifOUhZD2mY0WtHwC1+bcCpiZ5IdCnhbeTZ/Yf58qd0j7coSsxUf8/0aTEwrjZpU0XagtL12VfSb3L8/TucuDZ693UDZ+OypE3lcQ7h8AIFFQJjY5u/1Ja939rsIHk8F0+d7mhm7wJ+9MSokBAWCsumDFIctDqxqlSDvL5+v/74/z+JtSKGra5RbWk0JyCtC+mWIZ3wykcxHNVDA/UdIXLpEF+Hatc+or47T2vZGtqY8rd3FxaPSOOWnByLaqK7SEpgN6kzldkmYedeai8bp9BIe/8acFvK66uDHSsXjjCa1g5Fti+ooB1FM+y4Vlf+Q1B6vGfJ6nk/sYhCPEWUc6xER1AABH+iJ0bDWso9QqlsMpaw7ZdNGvIMxq0qppRDOTQP24i3r6Jgpz31+QwbUrR4y0x1VHPqFX9YIIz3byWJqdYFRK2E7pfklySnpTfYnTfESxTHLxttcAuzV4yD1tA/uAO0Tvg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(10067099003)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N3M2VHprdFFPNzZiemVEcXk4VlZPZ3dUZWQ0cmU0MjV4cVB0TVpVSjJCeDVU?=
 =?utf-8?B?SmtQTnpYNDNpOXRpTThidUNicGNUdHVrbUhFakdSTHByMzhIaFBpdnlHdXVx?=
 =?utf-8?B?dWFjNnVlNWlMYVVRRm8rSS9SQzJjdXczRDhTeXNzQ2FhTWVzR3BoemVOdEhF?=
 =?utf-8?B?anh5ZW41cjF5K3pUdjZGTVBPSXFURGhqUDdZWTl2MXNqSXlIQ1lBcmJNbTlO?=
 =?utf-8?B?aEdmZzNvd2hCZFZVaGVyRGdxTExrYTRBek1hM3ZxTHp2Y0pzM1E4aWpVWEhp?=
 =?utf-8?B?aUhOZ0h5WTlERWozSjVhb3c1WVBMYk9sSkRDN1psSkdnNk50Qk5MbHdBQkp0?=
 =?utf-8?B?WW5xUGdmdG1NODZIbzJKOVJvbzM3WHB5QkJrSXpCZjl1ODRjSEU0Smx1OTZD?=
 =?utf-8?B?OEtZUWc3ZUs3UHBoeThDcHkzTGFueExaSng3UVFTelVmNFVQVDc4S0hUeGR2?=
 =?utf-8?B?eFYySzZrWVk5MnBKOUx5WGU5SE4rTUZDd1hLb2xOV2xDb3ZIM0xlcllGRUdU?=
 =?utf-8?B?NGwrSFJsaHZucGhXeXUzekZkVEhvTm5jUzYxaktrbG5jMzNxR093N0h5RC9V?=
 =?utf-8?B?QnA0MGYyL0tENGlBd05NclJkaXM3V0p0M1NTSGkyMnczOEt3NktVMzd6V29i?=
 =?utf-8?B?Ulc4RGc1b0RHanhXbmhnc0ZMZXdnbDJ0U0VWamE2QnZTc20zTjF2R0JJTE1Q?=
 =?utf-8?B?YjBrNjNRNWROVENoeXFaWkhzWXpmMENvU25MemVCdnhCUWtTNnIyNTRjQ0V1?=
 =?utf-8?B?cmZ4MjNUK0ZwcW5SeVpaemlLMmNBQ2x5QWoyNjZRaE91TjhkL3Q3ZDRSUTgr?=
 =?utf-8?B?ZE9OTHpKQTRrRlQ5NDh3L0l1TXhZUWhscVhOeVZmaVJCMGo3bVROWW1Vbmxu?=
 =?utf-8?B?d3J2YVZvY1BtNGhXSnpjYnh5Q3NQSlZwNDE5Nk8yY1U3TURXNjBZdGpudGph?=
 =?utf-8?B?TGVWRjhRTU8wM0N0cFdCbGVmZ3JQSDhrM1g5SVZSQ0ZvZ2hlQWJ5bWM3aW1j?=
 =?utf-8?B?eEttemUrT1pMblhyWTNPaXVaU2U4MElPeDBTcjBQQk1kNnhKc0xGZndlRWZD?=
 =?utf-8?B?cUFEbVNpU21DRXVmYVlicFVvM2VWaTExakFVa2tQL2Erc3EyQmc1Ny93THpm?=
 =?utf-8?B?RVVTMlVsQlZueE1qWnc5VzNNeU9vQnlvSlUrNHhMaWdOOXdQaDV5MmdQcmpF?=
 =?utf-8?B?TVJzaHJjdDYwVm9SOElhOHc2S2VaaEVTak11bUNDTklyRVNITGlYeTBuUjZa?=
 =?utf-8?B?L3YvM3NHTnZoTFF3aURVYnZQS1dXSWxMVWxldlFTOXRwUTRDejhWcm5Id2dV?=
 =?utf-8?B?TTlZaGZ2UEpKUzRCNUxYN3NpOUR6WUhYREo1MDYwbGphcEt0Y3U0VjBXR3Fp?=
 =?utf-8?B?aFpxZFdCS3NWY2NIL3dhVHc1cHdpYWs4bXFhNytrK0cyM1pSQlB6ZmZNMm5k?=
 =?utf-8?B?RXkxQWQ5bmFzY3lTdmZ5K3RTaUhML1kwNGlGS2x4bG00QlRqVjcyL0JNUUsr?=
 =?utf-8?B?ekUyS2NYcndLZmhhNmhJSFlpV2VnY05kUHdNbEowRStvbVplUDV4V2xHYXI3?=
 =?utf-8?B?cU9tZk5GSGV1U2cvQkFiMU83SlRibkNjaU5tRGpBeW5SZk5ydG1jWXgySWor?=
 =?utf-8?B?N1RRWlFEZitiN1EzT0xnZWdwWld2VW9MT2REZWVFM3hUbmUwblI4QVZ3aW0y?=
 =?utf-8?B?UjVhZ1Q2MWk3L0JObXhHNFkxM0Jrb2VPVXlzL3Vaai9DYXVXdjFzbEw0em1t?=
 =?utf-8?B?d0JnZlh5ZWYweW5JSTViaDVCYmM2SE9vZnRNanJDdC9waU1LK1JXR2VDY1Jt?=
 =?utf-8?B?cEg1dnMwakg0N2x4OXdaajVHRnpwaDg4VTNPdFRtek1vWll4ZnpwSmxHSVpy?=
 =?utf-8?B?TEtJOThiTHZJNk4vb1doN240M1Y1M3NkeGtVU2ZHaDlGMVdFY2wxQjY5MVFC?=
 =?utf-8?B?amNVN2xRS3JyZ0NlemVCc2NxYWxlUEFSRHp5ZHZkdys3ZGlwekt6c0dnRVNq?=
 =?utf-8?B?YWJ2ZW5lQ2FyUU5NSDJVS1dUeTZJejRqWUxsTjJaNkd0M2lJbXZtNTN1SVB0?=
 =?utf-8?B?R1hiU1hrenlaQ2h4SkFiZFpQOVYzUlFwWkJnWi9DNnMrMVY2QWZQcGNkaEl1?=
 =?utf-8?B?UEJ3TEsvTm0rSzNIQnVIZkNWUC83V3pzVkVuUmY4MVIzQkdrM1hmRnZNSjlv?=
 =?utf-8?B?bUpkMXl2eEd0QXRuUlNsaEJEWXRxbE1FaXVqMDB6SHVqY1ptcWhncFVMS0xy?=
 =?utf-8?B?QWFhVloxTnJCOFk3bGdIblVjRjVRNUJ1TUZhbU9QOTZRWThKdGxvTU9YOXdu?=
 =?utf-8?B?Y2U3aU1qY3JsSnI1NjF6NXA0cE9mTTVUdzM5VHBMd016dnFOazQrT0M5MVhZ?=
 =?utf-8?Q?o8LfdHYdVVtNFcrQ=3D?=
X-Exchange-RoutingPolicyChecked: J29R8husHl5lXSwJLP9qAyqkkyk49s4wnKF8nrKTUojifa7GHwERCgrGOKki9FO9EJD6f4fw5EunSkEDq1paREceQG9ALlCSnR01zlNW5KiKLKgTobVz7TrHx7gWqR+/VYUL3Uyv11EnNJiwhO3ZUEdlsWw6tbSgTLoYtYNxYbzCLmieYbBVracraCAIOqJoKFHZdSWcUDlUHmDWyXa+ombHpglwiSULw/hDOB2fl7Up98IUS4z4GTXpeQ7krvR0cxt/20RZDfGltfDkAz+7x7F0rFlfRBcDLJUPii7uUTVrQnH9Xk6c+FObSPtTN+de6um/J7/If3M/PKe4tJ7rKw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 59ad68b8-dfdc-4c15-9ecb-08def2b3dd8d
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 05:39:06.7106 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DYqqGO9VvqjY1i/LbI+ai5z64uKaEOKMqEaUteiaPbHjVz5eAqb6gxxLlk9cAIIiRHO9ckvHBijBeZhxbIKlYNXGoLqsL1E6/rjYuup/kLM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9012
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



On 8/4/2026 4:25 PM, Suraj Kandpal wrote:
> Take an explicit common_len parameter and pass
> ARRAY_SIZE(intel_dp->common_rates) at the call site, so the bound is
> tied to the destination array.
> 
> Fixes: e6bda3e4cb43 ("drm/i915: Avoid overflowing the DP link rate arrays")
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
> v1 -> v2:
> -Use latest baseline (Jani)
> 
>   drivers/gpu/drm/i915/display/intel_dp.c | 11 +++++++----
>   1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index 7f13595f40c1..1f1324c99130 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -625,13 +625,13 @@ intel_dp_set_source_rates(struct intel_dp *intel_dp)
>   
>   static int intersect_rates(const int *source_rates, int source_len,
>   			   const int *sink_rates, int sink_len,
> -			   int *common_rates)
> +			   int *common_rates, int common_len)
>   {
>   	int i = 0, j = 0, k = 0;
>   
>   	while (i < source_len && j < sink_len) {
>   		if (source_rates[i] == sink_rates[j]) {
> -			if (WARN_ON(k >= DP_MAX_SUPPORTED_RATES))
> +			if (WARN_ON(k >= common_len))

DP_MAX_SUPPORTED_RATES made more sense here because it keeps the size of 
the common rate (and sink rate) from drifting away from the standard macro.

>   				return k;
>   			common_rates[k] = source_rates[i];
>   			++k;
> @@ -660,6 +660,7 @@ int intel_dp_rate_index(const int *rates, int len, int rate)
>   
>   static void intel_dp_get_common_rates(struct intel_dp *intel_dp,
>   				      int common_rates[DP_MAX_SUPPORTED_RATES],
> +				      int common_len,
>   				      int *num_common_rates)
>   {
>   	struct intel_display *display = to_intel_display(intel_dp);
> @@ -671,7 +672,8 @@ static void intel_dp_get_common_rates(struct intel_dp *intel_dp,
>   					    intel_dp->num_source_rates,
>   					    intel_dp->sink_rates,
>   					    intel_dp->num_sink_rates,
> -					    common_rates);
> +					    common_rates,
> +					    common_len);
>   
>   	/* Paranoia, there should always be something in common. */
>   	if (drm_WARN_ON(display->drm, *num_common_rates == 0)) {
> @@ -687,7 +689,8 @@ static bool intel_dp_set_common_link_params(struct intel_dp *intel_dp)
>   	int common_rates[DP_MAX_SUPPORTED_RATES];
>   	bool params_changed = false;
>   
> -	intel_dp_get_common_rates(intel_dp, common_rates, &num_common_rates);
> +	intel_dp_get_common_rates(intel_dp, common_rates, ARRAY_SIZE(common_rates),
> +				  &num_common_rates);

Is this patch in response to an actual bug or just a defensive code 
change? If it is the later, does it add much value?

common_rates and sink_rate are already locked in with 
DP_MAX_SUPPORTED_RATES. There is a hazard of them drifting away from a 
common size for which we could add a static enforcement of

BUILD_BUG_ON(ARRAY_SIZE(common_rates) != ARRAY_SIZE(sink_rates));

Something similar is done in intel_dp_set_dpcd_sink_rates() to keep the 
sink_rate within limits.

Regardless, if there is no actual bug then the Fixes tag is unjustified.

==

Chaitanya



>   	if (intel_dp_link_caps_update(intel_dp->link.caps,
>   				      common_rates, num_common_rates,
>   				      intel_dp_get_max_common_lane_count(intel_dp),

