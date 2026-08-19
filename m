Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF5BCC5DF6D
	for <intel-xe@archiver.kernel.org>; Wed, 19 Aug 2026 10:44:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D44810EDB8;
	Wed, 19 Aug 2026 10:44:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aTFERpBh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E66BC10EDB8
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Aug 2026 10:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787136289; x=1818672289;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Yb9k0WXyWgZ+joWt+pkdJpUeUEMFfB7a6UXEEy5UG08=;
 b=aTFERpBhH0Tbx43QFWGRyat6JS7AC9kd9K8wADspazgXYuztk0UsSKpB
 ac/VYoOp2fF2WCROXoEzeaPebkQwmuy0+KuUoUl36a8wUBRCy8AN9hUEg
 W+f3cAshqMYm1TP+b82KJd9+Oiy/0AWfGzLOW6Lp/4nQmg8VAoRPePBqG
 IhirschJ3IYBzmbCsoMJY/CXOY6ZoS6s/O27p1xMvbdiiq+ULBoobOT8g
 4PQvsWAa+IkWepqCJzmjZ0VG1sMpad5hllxzXT0gRpXGvknaRfL62+BfE
 n17hCOIN4KNtDE0T4WH9ycqVRbVOVZGamoIn4ubaNskLCp551erqjvqYq w==;
X-CSE-ConnectionGUID: 6TNom5+0SqumNvETHHUOMA==
X-CSE-MsgGUID: sm6rXWPPTWm6mSxFwsycVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="91519918"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="91519918"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 03:44:49 -0700
X-CSE-ConnectionGUID: muDEJ5FqSMq2LiWStLQS1w==
X-CSE-MsgGUID: SG02TzOMSH+vqbV0+P/h/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="266123158"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 03:44:48 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 19 Aug 2026 03:44:47 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 19 Aug 2026 03:44:47 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.15) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 19 Aug 2026 03:44:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qmNS5EsKErGj/8hzk6p1Y7ZCPkoVvoIGenFR3o9cqDD2ztFGzipX+Y0/GSxRreKm9y4gIT2JudRXbljy/+xUrOzKcE39QalCOHb4owUg37rtSmspvJXFnw+gvoOwimczcIqhePxh1hy+UZZ1pdVQSVOaaaLtFuarlWy+v6wpKnot74ijxNvzsoNnzXWWqGsx3X/MoiCcSlne9Ih5eQL4iScwZqFcv/SmmTuae0akj77Irv8/LMZm2chxxFG8CNOhY15zuWsJXUNnfY2AdDMnaJ0iwAjpVBc4SQhk5aiOFk4/v0dfnVw9BMoUVqvOMzpJ02FNOQXPTntU9v9WRZXYUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1b5ea0XM8TT3pr4XKaPGM7mSF1t/bCYtYfD2OcrK5RM=;
 b=Hr7/Ilr2cZVh07pCF2oQMq/P8iSbiEMOGbyJDwr1oCYSJHanfQQ/KrgVijueURkBLQUPC3h3xgX6ou4j36octrlc5MJSXGuNWbvH94rShw1zzPRL0FSpJIAlVFq68bhE72mLAImdeZehz5k7LshU5l4PlBL/9c/ITXvvHO/Z/szSQRAMmK5GLsl/kkFGsUfgwQnWse5ojUHUbBAJk6ZIpUFTyWHI2yCwVxd6Y2olY1ZEQ3BypF4DZ6wVPuJJM3PBRx4tFkByHnYkYjy7CjUEb09SmYZei1E6fxLFn+RmDhB2S7haA7jDtlnRxuff8aLA1OucagHrKwOwD8JTpTIUeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SJ0PR11MB5053.namprd11.prod.outlook.com (2603:10b6:a03:2af::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 10:44:45 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 10:44:45 +0000
Message-ID: <effa9774-baeb-4f92-a83e-380279552b9c@intel.com>
Date: Wed, 19 Aug 2026 16:14:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/pci_error: Allow debugging PCI errors
To: Raag Jadav <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <michal.wajdeczko@intel.com>, <matthew.d.roper@intel.com>,
 <mallesh.koujalagi@intel.com>
References: <20260818103050.493252-1-raag.jadav@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20260818103050.493252-1-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0012.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:176::15) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SJ0PR11MB5053:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fe23e5c-d4c1-4d5e-22f9-08defddee21a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: sz+2c/5QjZw4enCvAv/uI+d303AHQfKFjEWK4owRdlBacs2WA3alPknc036I5tCadIHT9/eXaCneROLi2YMGxK44c2qNRkqK83NnNOrTMeq0zUo5pOjipjeJUBsbwzpC3DnTaOubtkCM1OYCRsKKpLXhePyJnCW7DxiQd+iaubS66YGPcfZUDUeUkvwhGQL40zZCs//wiUYBHKBfpkL7XVsWKXC7lNVbS8L+x7hUWMtkJTnrH/I/tn6m6tmZVpq1lEL6PC1XFu8Mj/TlP8wNLek/RGGH3GwDT9wAQ3f2hX8g0IqnoH7N59y8pGBJ7ER89sV/Kzz/DAex4JYAhNLzyZDbww34iAehMo91TYUQ3fu39S8QQVHbdaMIwcf4Qp1Xh88RRxAW6IfAt4fUTo6EWIME37hAFVGdXL9AQTSsv4VRv9wLMGkUDkHlvUofhRxg5n+zAjP5Vb0uGMg3Tg2IvQr5JivEcQTKryuukn5hYM8x+1spTSW2KRtitFlw/B3q3qkOaH+D+ePUuPgCZ07jEOXckE24CfDe/vWihup0i1oV3/9vLiKaTLn3IIB1fFnmLO6nky5uh/Rr6s7nWCajK22ji8hpDT6bwMpFTerKEvXd+5eT2aWnLxrO45MUuZESlI+1qK5eyZr4TT+g+HeD0Pgyq1+dx3596Ay5Z6TVK+w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QTJNZFhscWN0aXIxd0ZabkpacWl3Rnh2TXRBby9La2xqNGQySGs5ck9OQjY5?=
 =?utf-8?B?emd6Mkd1WHlrNnJzMFBWZkpUVmRwYzRqckRobmluUTBXUHVhWkFBb2RzNkVS?=
 =?utf-8?B?b3JpTm5ROFhoWVZETElseW1GS09adnUxcVhQMzNYSUxmUnZVSEQ0UE1pS0Fu?=
 =?utf-8?B?c1VsR09CMnlEWDFTaXcwT3BtZVd5aitXM2xUNVUzODBkMGV2Mi8wWHBLYmJw?=
 =?utf-8?B?ZHcxN3hCN3BCNzRUSjdPTHJaVmY5MG5zYzR6QjVCcDk0L0JWWWY3N0YwUWR4?=
 =?utf-8?B?Y1VvSEdHTFBKMWhLTG4rM0ZIc05FUy9Dc01LVjdudEJYL3dpWWJPM0E2NGpN?=
 =?utf-8?B?QWZXTFZ3aXdOWndmREZTL09YVWVyYm9vdW5IRFQ1MzdlQ0pTQzlYVGJEbXhJ?=
 =?utf-8?B?by9zNUVWTlNlRGVEemJJSW9OdEpYejl1TUNXbDd6alQ3emlPZHNqRmQxZ20z?=
 =?utf-8?B?Wld4bjh3Q095eHVwdWM1TFgyb1NSczdLUVllaFhpQWE3WU80NDJpWGZlcHli?=
 =?utf-8?B?YTZCOXlGaFl6VklNc3RqendlWklwc0RCM1RzaC9Jbm5xR2VOUm83YkhaSlJU?=
 =?utf-8?B?dzV0ZkhxUFNoNGFtMVlibXY2SkZCTWRZMjk2UzRjQ202M1dsRjVpYXhWcGtw?=
 =?utf-8?B?c0plSGNqN0x3ZjFRT0JxQW9mNDIrRTlWaDZCOXNiYjdSSWxDTUcwUDJmZjNL?=
 =?utf-8?B?SzlCQ3BKUHltNitOOHhiSzBtUmx6RGJpaHhzOWlaRk95c2U5R0VMRUpnQzA0?=
 =?utf-8?B?RzcwYnpRblBmRHNqSUtyNkNHQ0tPeHRIaDV0T2hIblpnV2o1ZjBuNGZwRnht?=
 =?utf-8?B?Z01LNUFnL2l0OWpNTkJXNXAzbWtFMWNLckdvYlBXUm1uaG9xNW1XMzlsMFFv?=
 =?utf-8?B?MUxvV0U2WktpUUZrWGtpNkNkL1FlMXRCYkJZUS9qcVZyaHB4UnNjVVd6QlND?=
 =?utf-8?B?cmw2bmRxTlpsem9UQUhFakFqUnRBT1VQZEMvYVI3ZzE4ejZMQUpSRSszOEJz?=
 =?utf-8?B?NXpHVm5rckNqdmszYmsyRlZ3Z0x5bVM2aHB1dExWWVRIOFkvYmRPQkIxSDN0?=
 =?utf-8?B?dkNIb3kraEd6eGhnYlRBNzBSNWQyYVhYN2RSRzV0eHI1WjdTc1hzUlc3bzZz?=
 =?utf-8?B?M1ZlTEQrRzlKMDJpWUlKNkZWTTVyT29TT0JzMmoxK24zcFBXVTJpa0kxRlNl?=
 =?utf-8?B?aVQxUnlHbUxoUHBsQ1FLRTVKT1N2YWZPUTI3ZkZXaThQYUNNc0JpSEZnVU1z?=
 =?utf-8?B?b25TdVc2WG16YzBYTWk2ejNYUnlUbDAzaGtraDFhR0F3WFlldVNzMm94OHVr?=
 =?utf-8?B?NENoRTBrcy96cFpjdG1WZ05XN0xIam4rNlFmdjhaUUsrNE5UZDdtUUk4Y2xN?=
 =?utf-8?B?T0NDYmRuVnEzVXdOT1RsQjRUb2V3djdET1R0eEpBOHdxZ3ZvME0rTE1HTlZD?=
 =?utf-8?B?TVVCZDNuT0svZExLaEFJbmtqNWU4VDJhc21RLy80ZlBadFdaNFRsZGpFT0p2?=
 =?utf-8?B?cEI3U0gzVVVqanY0ZzZ0ZVpFM3FqVzIyUFpmQjNTa2pOMW1xUGdvdGMwb2hS?=
 =?utf-8?B?eWdHNGdPQ0dOUjhrelJKaTBTYi9waWFyZW1JNy9YTlVScnJUQU5SSWFFa1dy?=
 =?utf-8?B?dTJFdTB3dFZGV3ZDNDc0azFCdVZKWjdoMlEzS1M3M2FJVU1zYjFabTVEZmYr?=
 =?utf-8?B?ZlNmZ09UaEF3bXVRMGtBWEEyY0xPQmYzVFN5VHBDZlJOS2RDV1VUN3FFVjFP?=
 =?utf-8?B?akVXL1UwL29QY0hMU2ExcTFlTlJXSS9kLytpb3pzenFTckVKakdXOXR0VFZE?=
 =?utf-8?B?WXRtOGwyVkZud3lIMU15OE10L1BNS0pNeVdvZHJQWmc2QWl1V2JrbGExVmF3?=
 =?utf-8?B?bkdzVUhSVStwM0t0SlcrQTVyQUZjY2hMZTBRMURYcnZmN2RhOHB1ZkRlNjVr?=
 =?utf-8?B?REREdzNWWDlkeUFxVEpuWGVWSHB4UHNmV0xEQk9wYzdIWE5EV0YvQ1RzRUJh?=
 =?utf-8?B?aFZxMDZoTnJTT01NTTM1RENwMGM2cDFXa3NtNE4zQjFGYzBwMm1OdzJuN25m?=
 =?utf-8?B?UzRYUVJDa21tY3VwM3R0U0dkc09KejMvVHBQZWlnUXNyclYwQkNPeUNZcHdm?=
 =?utf-8?B?S2JGNUlmejBoa1FXZFpzZWJmVSsrdWR0SUxtMUFkR29pZmErRlpJeTg0dXdD?=
 =?utf-8?B?RGNLbjBDUUtvQWdrWTlmWG05Z3g5YWxaN09oS2ovaUIwQUkvKzNrODFlRHhX?=
 =?utf-8?B?VjRtU0xJZFczTHVEUk1EV3pzK1VJYVkyVEUxLzVZOHIzZEpMd0dPaC9sTU5m?=
 =?utf-8?B?ZXVKOEl1bGdYL2F2bWtEUUZjT2xTZU5ETGdwaklLUkVTWllGRDR3dz09?=
X-Exchange-RoutingPolicyChecked: UdKhtvnr8M2GFPTP16ZBlw8ESerFQhnWgK26AJ6KKbYkoFkKOx1wDy4YjlPZc8g9hfZtqtmMh76SDl0eA1rbYO+qtj36X3ePAVd6vyO64DDrxnD2Vadc95hIq9kUlgCvKjbMH6xBLVuFpzpZqOtDYxyrKBneeH7bAM5DARwNSDXCbQNBYA7MsZUmtlsi056lPXd9Z0sHD0AK2lm7/aK4O7qrP4fu9dzUBG1QbG++ND3WwhhreEEkbLpShiO6ZS3XE5jXHtdkBA+r6V826qE6O98JMQKl80YPSQtiCmEH5IR/4iRi8+jLQSs9PfkJxuBpENIk67tHBylpgFjemlSQJQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fe23e5c-d4c1-4d5e-22f9-08defddee21a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 10:44:45.5528 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MEP0bsVSmTwoCikD0iYXbgc7EFPJBUvBzalB4g5ov5cH3huUWwkQU1JMYUn04BCEZqVnyI5Zpfy+Ggi7YcgJyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5053
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


On 18-08-2026 16:00, Raag Jadav wrote:
> XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET is intended for debugging hangs.
> Disconnect the device on AER and prevent bus reset, so that it is available
> to the user for debugging.
>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
> v2: Process errors before wedging (Riana)
> ---

Sorry RB was meant for v2 not v1. Please ignore the first response

Please rephrase this according to sashiko suggestion.
With that fixed, v2 looks good to me

Reviewed-by: Riana Tauro <riana.tauro@intel.com>

>   drivers/gpu/drm/xe/xe_pci_error.c | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
> index fb965f52be5e..79ce0c671549 100644
> --- a/drivers/gpu/drm/xe/xe_pci_error.c
> +++ b/drivers/gpu/drm/xe/xe_pci_error.c
> @@ -84,6 +84,12 @@ static pci_ers_result_t xe_pci_error_mmio_enabled(struct pci_dev *pdev)
>   	xe_info(xe, "PCI error: MMIO enabled\n");
>   	action = xe_ras_process_errors(xe);
>   
> +	/* User wants to debug the error, prevent reset */
> +	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET) {
> +		xe_device_declare_wedged(xe);
> +		return PCI_ERS_RESULT_DISCONNECT;
> +	}
> +
>   	return ras_action_to_pci_result(pdev, action);
>   }
>   
