Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A5E3C3DA59
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jul 2024 17:56:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C56C410E29B;
	Mon, 15 Jul 2024 17:56:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RKOKEjYT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D39E789BEC
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Jul 2024 17:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721066212; x=1752602212;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=uX+wpPqYwAL01/vIp57QH315GpmQ8DaEC7g5lsTPmdw=;
 b=RKOKEjYTTS2KbHb57a8F62Glu+0FUThxJGtJoQKR1oCPgGC0+OWBtwZs
 +sU7ZsYh7x84nICi3EAfppR7G3s5HLET9wzKB1dCyajgDqx8VA974bJd2
 BxOoMwDOBoOIpKJBXYh3LBoizvD3la/Cx9zIP0xuJ5t1qkAoACsGq/k9T
 MHg09z28l1lAxDtxOI8TYFjCcksUmSks+gymkhVjSjjYph5Vb2/C9U5We
 QtutFqU13HEw40WnFXT7iiINiZ4QeTPXWDxsAcZaX4W/WCyTWzKlwvtpC
 9ZiRT3l4BCr+vIbZ2OYuSzQnGJNsvP73j/Txe5Gi7y7OuBQuoocra+bNi A==;
X-CSE-ConnectionGUID: rtoZtXPLTz2VQWi6vGgJVw==
X-CSE-MsgGUID: KybiqCtdTXmtszIzSPyxlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11134"; a="12558628"
X-IronPort-AV: E=Sophos;i="6.09,210,1716274800"; d="scan'208";a="12558628"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2024 10:56:52 -0700
X-CSE-ConnectionGUID: YuJV3hHqR9a4AuuNbqpQ5Q==
X-CSE-MsgGUID: r3mPIp7sQVuw6EinGFcHUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,210,1716274800"; d="scan'208";a="54528626"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Jul 2024 10:56:51 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 15 Jul 2024 10:56:50 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 15 Jul 2024 10:56:50 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 15 Jul 2024 10:56:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uKj8owDG7U147Z5XJ8Mb4to/W7voShzb6A8AL/xPNvU7ecXZGoPJQNQKTPsBCji0v9WB3pPYukMygZM6nECdZdTdAnyVdOoqv268yePji23OunG60QO01jWtKrDXwiIiHMHcyLevQTEhXBCFb7GolqPpQ+vB/M0jEqvpvSSIJhPy6amsmiKutFWSyt49OrC5k5yOs0juHH6RG9pc11S3EWDRcXE3ICpcXiQ9Bq5uV9HgfD8SRhPJshBr6kcjq9Hk4+UdnM5snXQTa9CslgKSVo0sxm2BC58g8Mp7A7BoNwLkjxUGDfEEgWJGhX3Ox7lO1bpt4aAo1MZO5nmbvUvFPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wrPAzuDv/hP4RugHMMzc8nSaGzw3D56Ahv7EwYkJGjQ=;
 b=Tve1ZBt0hgOAE0HRhTKbDKw0WVOGw64jFIk9gzkVWA1QUJK8SHgCKJmAhVL5bhITVtZHNpbC8/L3ra9qNTBgLHxalU9/sBJ7wWu7aJD6CCdAeFYUoPMTu2uQIzzh/MtYK+iDELv8YAybeBUiqmXO6IedtzRKIUx+v0QZXaDNvJalHL2qLr83DGWfcbRMtu4WtRjuq8vKk40sPntPO54ryOv0/t/DRNoRddCh3d7WTNq391YYDRhEAL3400yn5nYtdlxrz3ocm7CgLWGYM9b6vkPQu+bo8Hpi7IrDzTfnLK85SSj4rgXAzBSmf0/LTo5YZP8DZifE8yRYdV69qx3x9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SJ2PR11MB8369.namprd11.prod.outlook.com (2603:10b6:a03:53d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Mon, 15 Jul
 2024 17:56:46 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%5]) with mapi id 15.20.7762.027; Mon, 15 Jul 2024
 17:56:46 +0000
Message-ID: <84b81613-0580-4baf-85fa-a1025df8d8d2@intel.com>
Date: Mon, 15 Jul 2024 23:26:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe: Remove function xe_device_canonicalize_addr
To: "Souza, Jose" <jose.souza@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
References: <20240715105555.2220444-1-himal.prasad.ghimiray@intel.com>
 <20240715105555.2220444-3-himal.prasad.ghimiray@intel.com>
 <dc1ba1cb5ec819259dda071b400323926f2e360a.camel@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <dc1ba1cb5ec819259dda071b400323926f2e360a.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0182.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::8) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|SJ2PR11MB8369:EE_
X-MS-Office365-Filtering-Correlation-Id: e93fbc21-0542-49e9-a0d7-08dca4f77e5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dTRUcTRTZ05KM25RQkhFb2R1Q1RBQkRRbTNMWGtLSjNyaUx6R29UQjNFRisv?=
 =?utf-8?B?RXdwUURxTmxsODIrVE5UVG5TOUZ4enhnOWtEVnBXditlMkJxNzZwdVZuNllm?=
 =?utf-8?B?Wng4UEg1ZE1SdEpWaHpXQnBuZGZHNGdQQTRxUzYwSHVmS2owYUZkL3dBNnha?=
 =?utf-8?B?N1BEVGZPWlBmdmZLOXNoZXAxYTNiSlNVTDl0ZXk1bUlVVVlPL1hta3paOHNH?=
 =?utf-8?B?bjJzVzdLUk5aem1qNkw4R1ZMTFdqZW90cTZnQVdWaVpaQ0NyMGE5TWR4c1cw?=
 =?utf-8?B?eG1WNlpSNHltczBvUDBtcjNtQk1OMG5IOWNHK0RVbHJuaGJ2RWhuQWNSb3Bt?=
 =?utf-8?B?VXFZNE43M2ZCcUQ5NFpXVXYxU2FQdzBZc29lckZ3RkRrc2Z5cEM1R1lqamNl?=
 =?utf-8?B?SXdoenNjblNXMlJkcldvY3JNTkErMEdwVWlEN2ltZEZRSjY0eTB6b3BpbHp6?=
 =?utf-8?B?VXJCN0hRNVJCR21PT2dkUWQ2NVFYYWdlNTB0b01ZdkRVa0lnVGFGKy9Dempa?=
 =?utf-8?B?SE9IV1pnYzBjSHdWS29ocDhaandtYlpFd2tYOGNOWi9DdUlNRmM4Q1BRbHB2?=
 =?utf-8?B?amNsZzE1bVFaZmtOV3h0WnE1QlgvN2JleTQxS0ZnK3hJMUl2eU50NFFuUER0?=
 =?utf-8?B?NHNNMnh0NDhROUFya0FsRFRUa0RiSW9wbkVqQUpVNC96ZWIzRWRUL0IxdTg0?=
 =?utf-8?B?bnNWcHowaE9qR29RZlVxK1hWbGs5cDZ0a1F5ZWQ4cGJYWWY1R3VyUCtEMHZl?=
 =?utf-8?B?ZlNLZHRPMVA4ODcwYm05cFVjN0F1SXlwQ1ZNZ3EzWmcrS3cwNHp0UTJtSmR4?=
 =?utf-8?B?L2NqTytmcmw0YVViT2YwOEVrS09lSUNWYVJ4MDZjb3M3a0k1T1dvT2RNUzVz?=
 =?utf-8?B?NEZYY1pUcVVUT3hNSDdZeWFWeVVablNvZ0R6SG4vN1VkYUJSQWpmRHIvU2hs?=
 =?utf-8?B?NXU3Qi9aQU1RYlpMcGhyTExEWVRGUEZlM0lLc1gra3YxVVNIdkl1WUEzT0gw?=
 =?utf-8?B?WmhUS09GMUVoNzM2ZVNDc2pYcXdzcTV0anpvV2NjeFJjbERNbENMQTc3bmRh?=
 =?utf-8?B?RkIrNmJCTURyVEtzL2hwRlZHUTZSK3FxS3pJbFZveGhyc0FGakVXVTdZSGdi?=
 =?utf-8?B?VWE4VHltMFQ3RUQ2emU4SkpFcWMvZy9TeFFrYmE4emwvbTZydUFaSEErWVhl?=
 =?utf-8?B?TFBJWDJJcDlmV21sYWtqSUd1TGtGSFUvOWxTMllBUnBiZEV2SXVadGZKK2lG?=
 =?utf-8?B?ZWo0aGF0ZjQrNm4rUjB2dVBmSGNzbUpRV04rU0dkVm1TYysxdGQvWG82TXBW?=
 =?utf-8?B?WDZQUjZUTUJtTXN2ejlMK1M2SkFzM1hqQ0FhdyttRy9BRVlLbzhWcmM1enJ4?=
 =?utf-8?B?YUNHZVQrTHUrTGRLWm9xSXFtWkVpNzNESXBQM3E1NXhMeTFURC9HckExZnQ5?=
 =?utf-8?B?MHJBM0NuMElVaDI3cE5scGlXOURLYzgyNzd5Z1NLSmJqWmplbU1FaUdycmVZ?=
 =?utf-8?B?M0ViNTRUSy9mWkpQcFgyU2F6LzZSbHRhdDY0OVloWTJIZ2hWdFpqQVRoMUNX?=
 =?utf-8?B?bkVsZ3BBTTN1OG1VMmt2SjVxYUFZMndIVUgxU2RCVEdFVlFhMFhUdXVDQkhY?=
 =?utf-8?B?d1JzRThjU2VUU2xjemN4TG1vRVU2dUVXNzZoL2F4Tlg3MzgxOWtJV3IxVE0x?=
 =?utf-8?B?cDNXaHlKektLSktDdUVhWDVaenZuSU53OTlZSnZyMzFoR2pvZEFZWUczR1Bz?=
 =?utf-8?B?TE41bUZYNXdqOXF3L0c2cVYvVjBXNHRsUVVUamcxQVcyUEdqNTh0WFhVQmpx?=
 =?utf-8?B?S3AyQ2JhbGVIRTM3WFBudz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c0xSN3poc0lHbXhjYWk0K1FodG8zWGtvQSs5azd3RlorWkxCVTZrb3NFTG85?=
 =?utf-8?B?ZXRpUGViYkdDdTVVdFVhSWpaNjl5cWJBZU53UHhtYVI0QmxTczNHY281aXAy?=
 =?utf-8?B?OTQ1NTJuUEk0T2k5Ky93TkJ2VytjU2pPVVd1N2RWRy9WcHNHUVFTZjVLZU9E?=
 =?utf-8?B?U0FYSFMxOG9yVUNJb1hUdEJsSEdCbkoxdkU2WVpkbnozT0xsN0RsdjRpRlN1?=
 =?utf-8?B?RUdXbEU0ZGZKM2krc043N3VVVW4yK3RudnNIVDdJNGlCZCt1U3NRRjdEbEkv?=
 =?utf-8?B?WHF5T3VhdnowbWZPNi9XNkJMb3ZoZFVnQk5RekZ1Snc4TWloYnRvNkV2Tk5D?=
 =?utf-8?B?akFla2RhdVBkLzY2dzMrdEs1MDZEQkhybDFXNVRtZkdhTk5nWDRSV202SU9u?=
 =?utf-8?B?Wm1MM1ptclROOVNGMHVTcFVPZEdWMHRIL0N0dy9uZ2FCczYxWWJmd2lzaDlH?=
 =?utf-8?B?ZTh1OUlDSEdaeUp5RlJ6dkVXNkcxaWU4empZWklvSHBMdjNQNmo1OFFmMWZG?=
 =?utf-8?B?OEEwVGxvV2E0WWpuWXhnOWZZOHJoK2FhK3E1QlZxeS9ZNHZtUXp3WWRybHhm?=
 =?utf-8?B?MkcydmdsRnBjTmVJZ0pQZy9qQ3NDTXhnNGNJVmRjRFk5bkNOTFgxcG45bG1h?=
 =?utf-8?B?KytPM2Q5bnJmU1N3N2VYelc0ZGNDbUxMbHVUWWE2dHEvUldzY3IvNFdlaFhJ?=
 =?utf-8?B?MWpnSXNpN3Y3Y1ZSN2I1VnpuNld0VUlCWTV2V0RwQ3R2bVJZZlhMRnFvL241?=
 =?utf-8?B?VjdiMU0xenY3bzhKcXRXTVNZZHlCM24vcjlteG0xcjI4WVNzSXFHMFB4M1hs?=
 =?utf-8?B?QkwzejZGN3E1YWROSDJwWFM3OGRFclRnVzlyZW5sZ2ZuVHRseSthQVBYSmFv?=
 =?utf-8?B?bE5KdG1xMjVYd0YyUjdnMmhydTZoejkwR1BZdW5DUnNHL08vUWJCU095TGRO?=
 =?utf-8?B?eS9Jb0JxVXpLV3dDMWVLMUVObEFxYzFLQXBidkM3SFZaa2xoeC90ajRCbjFI?=
 =?utf-8?B?TjFEcUFFTUppUGhabW9hcXhqcmR3VXR0RkxtaFhSMXBWVmhhQmxKTEF5bkt5?=
 =?utf-8?B?ei9xbTJEZDN2emQwblNRQXZFZyt1dm5KUllWcFQvdEttc1VXWVN5Y2xaM2Vp?=
 =?utf-8?B?WDBSbVJzcWJnN1hXalJacVptaS9FL1B5aElkNDY2b1ZNeTlVcHhBNEwyYXQ2?=
 =?utf-8?B?dlIxQit5VS9paGdvaWsxeGcwV0V2QnY4TzdCOGV4R2dGVmtVb0FlZ2N5UUtl?=
 =?utf-8?B?SnRiM2xDVDl5SWNKZE1rZnp0QnV1WEhmeUV5WVpSOWlHc3N5VUU5RW80N2Za?=
 =?utf-8?B?Rm5QVjh3dWs3ckJyN012eExTb3hZTEpUZXk2MUI4WVZCazlBVmF5WWxObnRN?=
 =?utf-8?B?YjBuUys4MSsrMm1TNUErZW5Nb1B2YUlLL1JCS29wN2R2b2ZzU0hLS0prYVQw?=
 =?utf-8?B?NXAwaGJXY2ZDSVZ0K0RGVG5ETzVCN0ppS3VQYkxuSHIwUHpsbEhqQVlwSGRo?=
 =?utf-8?B?dU12WjNtN0tiUDZhdmNaRUNtbENkemdpRFk0eXl5NFJjTTJmZFA4ZEswejBB?=
 =?utf-8?B?dHArN2FFajZaVmFkQko4elM4cC81OWZ1Q0FCU01nc1pxRDgvWTFLdXdlOVlo?=
 =?utf-8?B?SS8xb1FQUkF3akhjVThqN0tMZ3R6cE14TkJoSktJRC9iOE1JVEUvTTArWE40?=
 =?utf-8?B?UDdiaDVpQnRCTmpYMlVnTWNyYnpqZ0o0RnpCVGZGQkNqaXJpYlNPNTMvZmxw?=
 =?utf-8?B?NmY5ajVQSll4L3pIb1hheXpZbjhGL2o1WVUwaXdjeTNiTEVybVFyUWFNd3BT?=
 =?utf-8?B?MVVZekNad2wxcXYweHU2WkhQK1dPNURsZVIzRjlqaEo3TWVGL0tZRkVma3VO?=
 =?utf-8?B?c1M2SEVYOFZGWnROTk1hOTlGNWtjbnhTVjZPaUExdTBQWVBQd3NSbHRsd1A2?=
 =?utf-8?B?bFM4ck5sV1k3dnU0bE5PK01walZqTFZWcmJMNWFQZUJWTWFaNVErZVRKeHNT?=
 =?utf-8?B?Nml5VG1LWWdCNE0wY2xUMHRLTE1CR0FrWm5DZjdBWloxc2lXV09QbmJwVHdW?=
 =?utf-8?B?bHpiek5BcEVMRGc4TXNTOUYxTU0vU1ozUWdLck5ndWxFTVpDNUlkV3k5RnhG?=
 =?utf-8?B?ZnNpb3QrT0owTm1iM2wyS1hxNFc4WXl0WFFKZ2t2dXpFOTM0djhqY1BUQVhX?=
 =?utf-8?Q?zuWRNNbpzSneHCJz/mQGFVY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e93fbc21-0542-49e9-a0d7-08dca4f77e5d
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2024 17:56:46.7029 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fr6j0YOaESvmRpzzn7zVHvABb0aYBLZW9rLk9ydnGJoOf5Qprx+aE7jX2qrP5QPusqQg3PfI47XiiU/nJNB507B/57++2MbFiQavQxPI7i8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8369
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



On 15-07-2024 19:35, Souza, Jose wrote:
> On Mon, 2024-07-15 at 16:25 +0530, Himal Prasad Ghimiray wrote:
>> There is no need for converting regular address to canonical address in
>> driver, therefore remove unused xe_device_canonicalize_addr.
> 
> I can see several places that should use it but are not.
> Like every place that does xe_exec, the address needs to canonical in Xe2+ platforms.

Hi Jose, Thanks for feedback. Isn't it the responsibility of UMDs to 
call xe_exec with a canonical address ?

> We are probably not getting any issues so far by luck, so I would not remove it to add it later.

Can you please elaborate on what do you mean by luck here ?

> 
>>
>> Cc: José Roberto de Souza <jose.souza@intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_device.c | 5 -----
>>   drivers/gpu/drm/xe/xe_device.h | 1 -
>>   2 files changed, 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index 06cebaffb451..eb3bb434b180 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -885,11 +885,6 @@ void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *p)
>>   	}
>>   }
>>   
>> -u64 xe_device_canonicalize_addr(struct xe_device *xe, u64 address)
>> -{
>> -	return sign_extend64(address, xe->info.va_bits - 1);
>> -}
>> -
>>   u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address)
>>   {
>>   	return address & GENMASK_ULL(xe->info.va_bits - 1, 0);
>> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
>> index 0a2a3e7fd402..14d4171c467e 100644
>> --- a/drivers/gpu/drm/xe/xe_device.h
>> +++ b/drivers/gpu/drm/xe/xe_device.h
>> @@ -158,7 +158,6 @@ u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size);
>>   
>>   void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *p);
>>   
>> -u64 xe_device_canonicalize_addr(struct xe_device *xe, u64 address);
>>   u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address);
>>   
>>   void xe_device_td_flush(struct xe_device *xe);
> 
