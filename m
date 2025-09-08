Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87C9ACAC581
	for <intel-xe@archiver.kernel.org>; Mon,  8 Sep 2025 11:51:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4620210E13C;
	Mon,  8 Sep 2025 11:51:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CM22G5+k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7F3110E4D5
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Sep 2025 11:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757332269; x=1788868269;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lV/DeGHO8EXH0M92V57ksYkKOc6V1zT3ZKKf5K6FDpc=;
 b=CM22G5+kNzwAp42HfddC680Fk51eKM+M4TxWrsRq+ZGO4MwBLfgu8wqM
 xrJrksvcgI5B6GgfeNVgjDGNI0n+MQbr/TLx/fHUeitvN1VgzE2POYciT
 hhiGTAOrg+m/bj2gw6TsR0pKlr7chhafkJapc1Yk63X0FbKFIP3g8YD33
 npQnZ//b4ZlSH9eoHQ16EUeeJj+k/LHZMRPSeoPQGGFSnnnR87ufC+RQa
 IGoXv8drRxlZS9siNBviwNO+T7cajRmQSzTNDTCqxlRfu7DHMi+FvxJjX
 0hppgy5BayRe9wdvJBr8N2NTY+pNPcu730C3ENxA3/hjzJNILdSjZ5s1A A==;
X-CSE-ConnectionGUID: NNpYhnGDQB+F1mJ1o1ZLUg==
X-CSE-MsgGUID: q+mXVPViRDuVLZtyYZan+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11546"; a="59733297"
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; d="scan'208";a="59733297"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 04:51:09 -0700
X-CSE-ConnectionGUID: KK2PP1zGScuECF8rW4SXew==
X-CSE-MsgGUID: mdVscY2rRmabAQdutxCzzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; d="scan'208";a="209930101"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 04:51:10 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 8 Sep 2025 04:51:09 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 8 Sep 2025 04:51:09 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.73) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 8 Sep 2025 04:51:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r4h+AiscV7eZX2WTZaiXEwwCpmJTMKqTL2x1eTZUAMAmlTcnkhfBiwjFKxpQ/p1USE+xD7XK7up4+djiHsY9Y1+oVy0kWFGL9XM+T2TUZeqlvUj1ulQKxeVeJwemYst1ZdMtTjlo1GD4j4rqvNrbXocWLGZ8GCczxUEvGIyTExgnXSiJ6dFVpxe8visGFUx5kc5vptsR+M22VfTQZwxZ+6ZqranxtY3/v2njr2DOilXBoj6K2vexhK1z4YyaQPziKRqiO3K86s5YZzzhnzs1vSpW2kuHde2o4dvsz4r3CDDGn7Jc77Uc1u6zJixUP7I4kedSepZNlYJEOLQEdOl6og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ucdvXEVZouTaoCI5IKKjo9PUNAFw0StI8/j/725VoD0=;
 b=iu1GIhZ7NlgN6g3OzgW3oOGyaSTUNOPO5S+NWtt56L2iAxghe/dNAmj6V/8u679xFbfkiQvu1vTnF2jXBPMCpvYQWvt+0+sxjEiBY7VLaCeF18OgoFl9BETkcGaKhEK9VzXxaNmc65dGF3vot+a6PDBsppgWylT4UhMHtLmGvdF2++ik3FxKhfnO4dkaoeOXZ0WsdqL16AyXDleMoEYhT2TaCgvvXVxMDzUQKzSugIFJ2qE31uq7Vulc+ewxADmIpmTNLolaCAOZuEBr35nZ2ge7xY9/rcOPWtThkE/4UL88Fq3YO8GVQVz08qAsA6epCSp/zeaVoIplMSdOwFXztg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by IA1PR11MB6348.namprd11.prod.outlook.com (2603:10b6:208:3af::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Mon, 8 Sep
 2025 11:51:07 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%2]) with mapi id 15.20.9094.018; Mon, 8 Sep 2025
 11:51:07 +0000
Message-ID: <4a8a73c0-27ec-4042-b4ea-d84c20da496e@intel.com>
Date: Mon, 8 Sep 2025 17:20:59 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/guc: Always add CT disable action during
 second init step
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>
References: <20250908102053.539-1-michal.wajdeczko@intel.com>
 <20250908102053.539-2-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
In-Reply-To: <20250908102053.539-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0156.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26::11) To LV3PR11MB8695.namprd11.prod.outlook.com
 (2603:10b6:408:211::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8695:EE_|IA1PR11MB6348:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e7bd39e-3180-4634-b0a1-08ddeecdfeac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R2NCbFA2YXFqdzNscHc5cHJRY2VYblE4YkFKTHNPTW9FM0dXbE5sYlZyN2hI?=
 =?utf-8?B?ZmkzTDYzN202NjU2TE85TlFoK0lBZnpLeUhBbjVTanpBbm5sQkhvRG5UZnRi?=
 =?utf-8?B?czl3V1lLU3pyRHc3M29JTDlITmVJRmc1bXZBN1RueXo2MU1JN3BTQ1Y5dHBB?=
 =?utf-8?B?K0hKTjJ6MFBHUWN6R0ZoaG83WTY5QTlJeEVTdVJBSWlERUtzSW5CN29RNEUv?=
 =?utf-8?B?MjR1cU9yd1NERDRsdkZwcStNZ3E4dGplYXJZZnM5b2JUeGkrQ21WVTU0bGxG?=
 =?utf-8?B?QnNGSnpycTRrMVVKcS9iV3ZtTlF2Nmd5amJmMnZneHhwelB0aldtc3FIY1Ny?=
 =?utf-8?B?MTkxcW1aV2VFcDgyRkdaVldOVGZ0UGQrbTJ3YUlCY2ZIMktTcXdMWGhxZXZt?=
 =?utf-8?B?aC9KTVhicDZmbG5CRGZMNVgxL3RwQjJjRVoxSFFTSXpscWlaSzdITUZQdHpH?=
 =?utf-8?B?am9nVU1CM0ZJTS80ZElmMlk3QnhzNXRNWWtrWG45U200dGFYaG9KOGlQVlZ5?=
 =?utf-8?B?WmNpb2VHdmsyeXdXNmNQOTd0eCtXZ0MwQitxeVBlRklualZFTHhJMGE3d2dY?=
 =?utf-8?B?cEtYdDdGZ1RIWTVpVFdXeWdCdGNaRldmd2tsTCtZTGowVE1heGZTeVFFemdW?=
 =?utf-8?B?QjVVRExFcWxscWo1M1RYT1BUc284anViTTJxb2pqcTlxelZmelUxdTVBZzFk?=
 =?utf-8?B?L3E5MTZ0YlRnVEluakkzdk5JWVJrSTdxemlCaW9BOUdNWUNMWW5jZGlpQUV0?=
 =?utf-8?B?SFZFYzNCMkUweTBydVozRjcvSTVvSUpCeURORHZVRExMRWlLMlhZRkFsZmk3?=
 =?utf-8?B?L2dVbnRTNEViaVRqckJmMVJyRXBSUnQreFpTNkhEUnIzdDJJMFJQa3EyUFdG?=
 =?utf-8?B?eTdBUnM0RXRPRk1aaXUyZ3ZTK0RDeXVDOTEvdTFWUDZZYUs1emFKa2xld3Rm?=
 =?utf-8?B?UG9YUUtVb0tJQ0hzdVNLWWNnTkhYeEgra0ZyTEtqbjUxN2xqVk5MYkx6QitS?=
 =?utf-8?B?WFBOWnE0cjg2c3NLcXM1eXk0YUJXUWhoUmc0bXF4Y0FZdkR5cFI3V3hCWG8w?=
 =?utf-8?B?QnU1VGY2cDhkREFBcDB4clkrNE14NTFCeXFieXBVcG9yRTRmbjE0TnZEeEl6?=
 =?utf-8?B?d1RJOVJ2YnQ5ZVVyRUt2cjBackRwT05OMHBTaW1BaFgwWDlsRkFIZ2MvdUMr?=
 =?utf-8?B?VVpRbEQ5VUZyUkkvM2ozNWNnOVlCYmVzSFZrTTVRRDh1d1Nza2ZqbDhGaEhw?=
 =?utf-8?B?L3U0bG1UR3lqMnhNTkZoY2RaUU51Wlh5SlR2RnRrV2d3RkhuTVkrVUFBQlZk?=
 =?utf-8?B?Q0k2Ukl3TzlsM0NMU3FLcHVEZEV0czVLcVo5YXQ2Z0VaYWI4N2NpV29HZUhZ?=
 =?utf-8?B?SnJ5UkdyL2xaUHJ1ZjR2a1dtWUZ6aFQ5VVVKT2VvclJyL2hqeDNCUUhFRkNm?=
 =?utf-8?B?cEFYbmRmRko0Z3ZhNmg3VVNLTXVzL2c0MktMNXpJWlFFdjBud1ZMOXRGZFZj?=
 =?utf-8?B?bVIvd2NKKytkZ2FzOU52blpCU1NYWFB1ejlhKy90akxvMm41ek4rQTlzT1dy?=
 =?utf-8?B?M3pCOGVOVzJTNkhOUFZHMG1lZVlWTmVZNWJaLythWHdPUGh5dmlmN0RwTm5s?=
 =?utf-8?B?NDlSZmlMeThFNzVrek1INityZXNuNnlJYUhqS1lIOGFhb3h4TGtOTGZidGVl?=
 =?utf-8?B?a2tYWm5ZTjB6MS9ibTltSkJZMzBJOGRQSURDSS8rSkRjbHk4UGM1MHBTQW1Y?=
 =?utf-8?B?S1JTdnpLYzRlUVp0VTVFUW9pckxyVVdHeDRkNTBxcFRySGEvY2hqSWZrWjZa?=
 =?utf-8?B?REg0bmpuZ28yMzdhTWpyRnloMGVwZVBnMTVNeU5wYlc0SFB6eFYxbWozcEZw?=
 =?utf-8?B?czl5dEFXZUMzODFsSnYxRXZXVVZsN0FNZytUQ2JZMU1QalJ6UlMwVzcrdjhZ?=
 =?utf-8?Q?XyOItYAOnAs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0hhQ2p0SW9Gazh5bVUwWUJtdW9YbzVvdVEvZUdyWXQ2cVpuSE1XVGw3VlVm?=
 =?utf-8?B?YjNLSlhCWktTM3dCNll1MjVYRGFOSVZXd0ovYmFMemw5dnBzN1d1dW50UVNp?=
 =?utf-8?B?VHF5TEo3WEhvb1JRQzBZSk9naUk5S0VZWUljaE5pVEpPUjZZRTV2T2tWNnNi?=
 =?utf-8?B?ZTl6N3ZxVGQzTWh3YUs5dDdZQTJMZFRYSGlvUDFDRGtscVg3dW9FNmtqUlht?=
 =?utf-8?B?cURlclg3YVJYRVUrWDNwZ0syT0NwZzVMVlJranJQMm43bDQrRnhQR0tIR1l0?=
 =?utf-8?B?NUZXaTJiTDlVaytGYUxIR2JveHhzbnJrR2QzWEFOQ3lrNDk3Yk5wOFVrMEJ3?=
 =?utf-8?B?N2twekNkaHVjWjNKbFJZK295OVJDam1ZTTVlczBPSFhnTzI1cVI3QkZsclhP?=
 =?utf-8?B?Z2UwUmFpTlpKUHRaK3R0QlRUVEVqUDBOSE9lU1pldlZOM3poNjUybUxzZmdP?=
 =?utf-8?B?RjRtbGJnaUQwTUNGTHY1ekhmQ1A4R0VSR0RoZHlzSXN0N3VkN2oxZC9HWG5H?=
 =?utf-8?B?c2FIOTFVRVBmTkhYaXVnSytiSW1URThPTFN1QUNIS0JqVHJpRUhQRXc0QWpS?=
 =?utf-8?B?S1d3T1JxVVdxNVcwa1NmVkpSNC9ZaS9mMFY2Qnh5T3hoTHVCVjZFdmRrZ1RK?=
 =?utf-8?B?OEdTbnM5MVVLNUdCMHU1SmwzazBzQ2IycXloVktHZnBGMlhJUWdXUi9jUXBy?=
 =?utf-8?B?Wm01R1dXYzNCblBZRTRYUnhlUjVRNldpMlZrT2JIdDhYdk15NndzcFpGVUJN?=
 =?utf-8?B?dWloSVNHay9WYTVhcWJWdkxoeVFOclc1am5VSlNvZjg4Q2VSYWNOVEFKYlBD?=
 =?utf-8?B?M2ViUWdRMTBLNVMveDViN0loUnJoR2tIbFhqWUJMeTRzaTZqWTh6eFNZazI5?=
 =?utf-8?B?ZGZFY2xoR0JrbEY2YzVtekRIL3VGYk5pT3ZLdG9oV1dOTVlYaUpGelp2a0lG?=
 =?utf-8?B?cUFtYi9NbTJ6d09pN1FLYzI4Mmhvcnh1bnNVa2U5VGxiS2ErNU1oeUxVQ1pp?=
 =?utf-8?B?LzAvL2JuQitEZmQ2eEdFZ3kycEc1QVRUcFl1a3U0UUtqTzlwMjQ3bmZUbDJv?=
 =?utf-8?B?Tm1SZ2xyWU1CY1dLVjd0UkZMRkVOYWtaTE9nL0FkT0FNaHFKeG5TZklLbVJL?=
 =?utf-8?B?NEIya0haN3pCYmpFQmJiSFBrUFBCMld0aGsvMFF0SFlKb3hyeDFxb1dyeDd6?=
 =?utf-8?B?QXlEZ2lBMU5QYUF0RXI4U1I0M1h3cXpKMG5Da2VvVmEwNkFodkJBSGFMUlND?=
 =?utf-8?B?RE9OQnBveS82WDhWSEkyVVhFSkxFdERieE1tTjR1L0tMRU5FQ2c5TFl6VnJt?=
 =?utf-8?B?WE9ESlBQektnMWZGOFFtekZOSnpCVWVXeUE1NmFCKzdTdW1WOGNCeU9KdFUz?=
 =?utf-8?B?WWdmb0pRR2J4dUNUS3dDckRybzZTKy84emFiZC9uSWVDUk1McTM2OHdrbmNT?=
 =?utf-8?B?alVkcnVaOGc0Tjh4YndnSTdnRzVmWTZqMHdIZG1HcjR0eVhRRWsxZkZQamlJ?=
 =?utf-8?B?STlveDFlaHlSOU5QU2R1Ti9TNnJZemhSL3FDQzhmWnhPWVVsRCs5R2NyUEV2?=
 =?utf-8?B?MkxlZWNhK05HY3owTDRWNVh4ZmtYazQrK1IvUEoyQ2gwYU1wTTBHTjZOc0Js?=
 =?utf-8?B?clI4VHNXSUZYbjVkMzUzS0xGa1RxdUg0K2d5WDh3RFRVamltZHdQdCtjejUv?=
 =?utf-8?B?aVdkMlNnK21iRHZXYUtyY0ZVVWNQS0ZFNjlTU2NHQ2R2aEkvdWI1L2pjbm9J?=
 =?utf-8?B?S01TTXg5elZQa2lSWTFXUEVOZ0w2MituVmdqeStYc0RNOXYweXFjWEpTaHNY?=
 =?utf-8?B?SGRzM0xaK2hiNlNQbHdSUXk5MFpaNm9MZ2dFL3NpVXpTeWQvUFJhWVdjaTZV?=
 =?utf-8?B?ZnVpRDN1L3NXcTZwRWh0MURxYTRTd2w4TjlqbHUvRzFpUVVOZHJVaEk3aC8v?=
 =?utf-8?B?Qkdsd2NqSnBicDRNWnBLcFFTKzBoSlA0YmprRndKTlhrbktIT1M5QkZsUXA3?=
 =?utf-8?B?d2dCSTBQL0t4MkZPZk5pU2tGTnNITm5zOHBwRE85Tkh4MHB2alVKOHVMMkpz?=
 =?utf-8?B?d2lYdDBoT0cyNXF2NnhFTGJvRXFQOWdReHA5MnhHVUtnZXZCRTRGY0w3Zm1B?=
 =?utf-8?B?cVRqbjAyVDlNWjFjOThiMXcvaGlZeVFEQ2tCZjM3ZkgrdElNZEd1VitwczhU?=
 =?utf-8?B?WUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e7bd39e-3180-4634-b0a1-08ddeecdfeac
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 11:51:06.9971 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YnkHbZYrO7i8bZ2FaZHC1QYHk22ABxPofh9zHo4JyfEJ7kyQqRVQcRaWdPSIUGa0D/0o3ZTe4F0NbE2wcfGufYCZG32VxFWi2kIkzGNQs+s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6348
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



On 08-09-2025 15:50, Michal Wajdeczko wrote:
> On DGFX, during init_post_hwconfig() step, we are reinitializing
> CTB BO in VRAM and we have to replace cleanup action to disable CT
> communication prior to release of underlying BO.
> 
> But that introduces some discrepancy between DGFX and iGFX, as for
> iGFX we keep previously added disable CT action that would be called
> during unwind much later.
> 
> To keep the same flow on both types of platforms, always replace old
> cleanup action and register new one.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_ct.c | 11 +++++------
>   1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index f40543b040d6..12372d5b7067 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -300,12 +300,11 @@ int xe_guc_ct_init_post_hwconfig(struct xe_guc_ct *ct)
>   
>   	xe_assert(xe, !xe_guc_ct_enabled(ct));
>   
> -	if (!IS_DGFX(xe))
> -		return 0;
> -
> -	ret = xe_managed_bo_reinit_in_vram(xe, tile, &ct->bo);
> -	if (ret)
> -		return ret;
> +	if (IS_DGFX(xe)) {
> +		ret = xe_managed_bo_reinit_in_vram(xe, tile, &ct->bo);
> +		if (ret)
> +			return ret;
> +	}
>   
>   	devm_release_action(xe->drm.dev, guc_action_disable_ct, ct);
>   	return devm_add_action_or_reset(xe->drm.dev, guc_action_disable_ct, ct);
LGTM.
Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
