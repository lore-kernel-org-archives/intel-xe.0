Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA642CAC5AC
	for <intel-xe@archiver.kernel.org>; Tue, 23 Sep 2025 22:20:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5219510E1B2;
	Tue, 23 Sep 2025 22:20:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b9dgVTYz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 517CA10E1B2
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Sep 2025 22:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758666011; x=1790202011;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=B3x60LDCk+pdb7rhNsiKW5GgaznokESw4O0hldVfUpo=;
 b=b9dgVTYzEOwTBBIBws9EYgxTBk3NOZH6qLGbYBaTdVsQXLaagfPOUxII
 daWVor9yDkDStSle+x4bzEgKXqEsZmJjnJxQzZ4E0TdNUKvRv+lY7x6hO
 Hdeic4mZ1yyfchidnRO7P/iwMWB9b+r0ui4N9YpG4EpZyUwpC0rS9voVw
 2q6ABBh2CcdwnSEJAugdEnBYkDLLlBkk/fipxE83ZeMD3SBhCocLgyjtF
 zYUG0t1nv/YMCLjvaBXtFDFc2D/s1rYVbt5pigV8v+5beXNlO9ck2sLYB
 BMJDEjwl/8RqrRQb9B30bnaRFNaR0/2KJk14mQCSacT10huS9wwfMCWXo A==;
X-CSE-ConnectionGUID: gpEEJoyYSgGNKbgQRrpH0A==
X-CSE-MsgGUID: VF3z5LJfRNqUK99ugwp/Jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="64596496"
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; d="scan'208";a="64596496"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 15:20:10 -0700
X-CSE-ConnectionGUID: yGfetnLgSXuqcWSsRYqjvA==
X-CSE-MsgGUID: 5LG1qx/QTw2a5F3+hhjSlw==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 15:20:09 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 23 Sep 2025 15:20:08 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 23 Sep 2025 15:20:08 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.55) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 23 Sep 2025 15:20:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hp+m2pJddPoKpPCA53nsTTHkGYMrXrc80k1nMj7wjHmJUX9CbX1AiFbizz/G5w/O+HkccMDI4tnRExB9/QDf0/BTY7pHk/qDkhbfl8z5z0ktfUIEvATNOaU5cfJ172eFwrlaEPFQJ3iVRAAUfpL/+j1jvYmGwNigvzhz9LFAVtz4a81TCa08mG4e+301x5Ic4x35fzRB2x9Fq8cCOwaME7hc9y5ZCi/2ryIqYaZIB6uRtyDPhLDZaLyQlKem4aezmWqLGrcu6vpvf/cREZzB1zBnb+uUMkGVKdu6Sr/OWvv+2Rrfj5bQMzcGiIhKD51GKeSW/vJ0eUUTBHAVORXr1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z7ME4n8wBiCoPvb2kvsecqDuC9uM/IGzPrejF1PHLgY=;
 b=bHP4Pk5ZqH7xyS1oRo52ihlNeuStCKCRSnJj8Rt4NRqCu7qNBCIKBWorBC33v18qNcb9MkptBq6k5+nHMtTtm43e7JtiO3RuOgCVVFqQ2iRcKeZWfJJu5CdQuxXUiSs4XcRKl168OnI6JbhvZQFG/fvdPY4eNUjkKDmDkvsCdJJPf2k63eFJL+dDHHnNp8G2h2pcgJ/dr4N37cqZmc4Lb5WzA6jbz8A/FpsPXd3sO5I+0fUC5gFlWt/wGVYIlwj/0QrXMcrhfOCnl7m9lWssMwQcIL+YeNL0BvQPDB+E0Xd86yaTkZw0FuMDKLIkB+NQr4RZwGEV3OdY6sS/BndCLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by CO1PR11MB5140.namprd11.prod.outlook.com (2603:10b6:303:9e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Tue, 23 Sep
 2025 22:20:06 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9137.018; Tue, 23 Sep 2025
 22:20:06 +0000
Message-ID: <44a754f4-78a3-4cbd-9f1f-55d62f19c957@intel.com>
Date: Wed, 24 Sep 2025 00:20:01 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/guc: Update GuC log buffer type value
To: Zhanjun Dong <zhanjun.dong@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <stuart.summers@intel.com>, <john.c.harrison@intel.com>
References: <20250904151406.736972-1-zhanjun.dong@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250904151406.736972-1-zhanjun.dong@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0020.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::24) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|CO1PR11MB5140:EE_
X-MS-Office365-Filtering-Correlation-Id: b1d8254e-4fff-4773-50ff-08ddfaef5952
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WVhYVXpqLzl2alJxMWoxcFdDSk0waXVhR2Y5SFVCUklHcVZ1VWM5bHQ5bGpv?=
 =?utf-8?B?b0lwUHdPS0dpQ2djSnBybVE0MWZqSWx6eWNZNEVmNnVnYjVranBBRGxQS1Ux?=
 =?utf-8?B?ZWdvR0NqdzJqcmRGOGRDek5wbnBOY1pnTVFISVlFRTZvUjZWQ29na2g0blF1?=
 =?utf-8?B?UlBkK1g4NS96eHVnUGJyRzVsNWJRNWF6VTJxbTRCTERmNVM5U2J2d2FISUty?=
 =?utf-8?B?eGplOHdXdXhGZ1VLbnpkQW9EVjRuQS9vSGZpbDdFUUhPcDZaUEVnQVdma3pp?=
 =?utf-8?B?Y05zc3ZocDhPZnpOUDRSNGg4bFNJUmtIdjk2Z1QzZ09ERjZHb09jS0hDbjFQ?=
 =?utf-8?B?SHdqYzdGeEo2Zm01THBpWEE3TTJTbkt6dUNyWnlQLy9WcitzOFJZRXkwTmcv?=
 =?utf-8?B?OTFhSkVPTGkxUGlOOHR5VFkrUDF4K0VMM3g0WEtSNWxRWVE3UVZ4d2YyaXBj?=
 =?utf-8?B?ODNITGV3cTBVNWdLSUJuRGRpREQ5MVg5Tjlnc1ZuNUhzRFZtUkhOQWcvOGdG?=
 =?utf-8?B?OEgxQ21hWVhLM3ZQdzNHVzZPM1p2V0o4VGE1dFZwQVJ0QlNLRyt5bjZuWW9u?=
 =?utf-8?B?bi81RDkwWnhVRkdEbzIxRXJsWm82Z08zcTJKaXFUODFxSm8zZFNNdFBoSkxa?=
 =?utf-8?B?cWMvQzNHZE9sWkp6SGFDbVdFWll1YkZoK0EwanEzMXRhV1NCdWdDc05NLzNR?=
 =?utf-8?B?TVhmVEFmM0pTckpWSTJTelU1SXZrWEMyTFFLOUVjUml1UTlSZGhYS3UwZmVO?=
 =?utf-8?B?Y1JhTVdieWtjT3FwQWVzWStaMWU0Q2NmOTIrRkdXcEJIWkRiNzFDZHlzcFM3?=
 =?utf-8?B?L1hsaUNCUFArY3lNSE1Jazc0UW1XT2dlSWE1RmZLNVFRSGdXRGFTZVZSNmJl?=
 =?utf-8?B?SE5oc1pDZVUyc29QdE5TTktlVlpGOHpoUzNDRDNFVnVCMWo3SjRHbDZIODJZ?=
 =?utf-8?B?czNuZGV6cjg2VmlkeVF4clFEZjVnZCtwZnRid0FicUQ3K3NJNXhRZVpnWnQ2?=
 =?utf-8?B?ZVE0TDJUbnAybWIwOWZBR01ad3UyVUZKWW9leG0vdEEzWjlGQmRCMHBLRmNB?=
 =?utf-8?B?RTJocEFoaG1BbHk4RFhkc3YrUVNCL204Y2VCSlM4cmVwZHFiNHdZcFJGa0Vz?=
 =?utf-8?B?QWNlMGw3UlJDRHNsRXo2KzYwMmVYSitDSjcvMXJBUHdnT0xwOWN3REtPT01Z?=
 =?utf-8?B?SFlPK1daL2xaVkpPUU5KQkx2Tmg0SS9RSGhQWjlCLzdlQ2wrbzBiMUYwVCtm?=
 =?utf-8?B?Z2w4OTRuc1poZ3NxajIzTnhiVTk5L1M2RkthRWs2d3BaNEZVV3RTV3d0bVl1?=
 =?utf-8?B?RkxtWGd2MHNrNmRCSDNGUU1jazByMXloTEtlblprZ0xsblhFbVhpTUprdTRZ?=
 =?utf-8?B?Um1LNWtFQUdvNWluUXgwTGExZzZCVmVmTWtEWElCY1lSQndIZkZKeE91bnM5?=
 =?utf-8?B?bkxKbWFNR2N1b2RTa0o5ZnJ0eURNTGxlWVQ3c01sYW4vVFRHK3NYTTB2MEVt?=
 =?utf-8?B?YmYzUVVXU214b3ZvWXBzMFlQelhVbEU0RXpWZEUxL2UwZzRCMW5NMzc4RTZn?=
 =?utf-8?B?RHM0Z3ZaRnBWRTlteVJadFlTMkhiam9rczhNbFVLUHlVSzErUkUwNkJydkxs?=
 =?utf-8?B?OWMvblRRcnpkV2VWZ2hNUEtEZGt6N2ZWWDZMNkIrSThGMEhmN3VnbDZDMzlW?=
 =?utf-8?B?VU9YMWdDNVNzeWZtN2dOeHdzM1JLZ0ZnNk1RY21tR1pYOC85SjVmUDdTK3ds?=
 =?utf-8?B?Ujh3alM3ZHFwd21QdEJnTE5pbE1WRDZCS2J5Rjl4SzN6RkIwd0NTc3cyKzN3?=
 =?utf-8?B?UVQ3VzY5RFlrVFhkSDZSNVNROVkzdTJ5RjJLdnBNZS9SMnRhU1NnNzMzNU1Q?=
 =?utf-8?B?bjlkaXBGUUR1STB1RHdEViswbDdYaVF1UUFpRkh2TUlYS2c9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZnRIWGN4U1Z1TlU1Vk81VTFZbStxa3NRMC9BMjlzVVRYbzVGdXlEcklUY1ZQ?=
 =?utf-8?B?a1dicFIzbEdKR0pvb0g0amFha1F1S2c2NVR1alFOWTZHdlphNnRmRGVCU1lR?=
 =?utf-8?B?QlcwUmVoQWZtOXVNdlFnOUdta0xwTEpuYVlQdDE2aWdzRHd4RytKdy9hNkgw?=
 =?utf-8?B?RjdrV3BCbzlNM1BhMzBESjcwN2VoU3JNN3VNWU42RWJzRlZGUUpRdjI4Ti9L?=
 =?utf-8?B?M0krcG9CMnBRYXFsZnhWRCtpM3ZGbEJzRFJ3UWwyb1RDTTBsaFF4anBpRDk0?=
 =?utf-8?B?ZkhDbXYwMXVlbk8vY0xqVDhHMzRJR3g4ZzZpZVFPSFdmTmQ4TzRkL1hKTDlh?=
 =?utf-8?B?Uyt3alQvVzU3WFpPS3ZsUDdpM1lvM2ZBbHlGRHN2NThmWnk4VlFnVkV2RHhz?=
 =?utf-8?B?VFArZC9tMEoySGNOeXZLNkxnTG96MHczUm1xcG9mWEhuaHgySTMzams5K2xh?=
 =?utf-8?B?OUVVaWtOQjB0V1JPR2VuZlBxaUhUMzBuNjdubDdYRmRad3htSmFJWm1TRzJB?=
 =?utf-8?B?K3JscXlRUUFxdGJmNGVCa2FqQWlBRks5ckhtRW4wa3g0d2pkcnY0VDg2NUg3?=
 =?utf-8?B?Y2RYL1ZxTFR3NVBQSlErYU5Wc0I2eVJvL2haZTE3Vm15NG9QUHhaS3BMN3pP?=
 =?utf-8?B?eW96d3J1WU05U0UvOXNINE12VHBucmgwS01CWWlzSitSZVAya1pQck52Ym1p?=
 =?utf-8?B?bWxPUFpibzRUWUgreXo2aU1OOXc1RXFWb0ZRRkZrcVJHelRRNEhNTFBZKzcx?=
 =?utf-8?B?L093ditCUzltVWxJNkRwMFpuTkhwR1B6cnEyditKb1JtRDlrN2JsOUR4Wmxu?=
 =?utf-8?B?L2F5Vk1NT01rYWpLY1ZiRkNWL1NGMDZJWVJpekJUVE9rT1JNOTk2NDBycVpK?=
 =?utf-8?B?V1pDVGw5TVg5TGluSm1SMXpiQml0Z2NaZ3RwT2VjdFNzT0U4NG8yREVub3BN?=
 =?utf-8?B?ZHhQZjY3V1Q2VytQa0tRRDFZeGduaitia01VUHdyWjI4M0xETFJHU0pTNUJJ?=
 =?utf-8?B?SCtIejNyb0k0dXRSMk5NazNocWtiRHBsWGpuVi9pWUNIbnU1Y2F1dU9SQUR6?=
 =?utf-8?B?eW9NUHVVZnhNSkxKUklJMHo1VkN6dXAzdjVNdzF6eG1hV0pqQ0IvMS9kaEVV?=
 =?utf-8?B?Q2E1Rkw1WDR4Y2VXME9pWDRxQTkyL2ttUlErM3JVdUZiU2ZwMDhRcnhDZGpW?=
 =?utf-8?B?TEVoUmZPSEJ3UEdHOURvRzk1cm1rNzFIa3l4QVBtblNWSTd1NTErMjVTUFo0?=
 =?utf-8?B?ZFpzVGpSbGk5RlVQUlJHN3pVVExpVXBzenBBeDlGei9TL3NaZWpQVDVOMGE5?=
 =?utf-8?B?dElnWWRjVmpCQUtUVVhWU29Jcnc0VTZNK1cvc1ZwYjdPWEtNT0xxYnE0V3M4?=
 =?utf-8?B?WkkrR0gxN20rb0lIRTBWZkMzUkdOQVhHc3ltQTg4c0g3NDJ1T1E1RC8xaGhL?=
 =?utf-8?B?d3B0V0RQUldnMFV4QlZndG54bWoxOURGaHZIaEJnOGptUTVuM1lLTjU1RU9V?=
 =?utf-8?B?dWVRdmorTU9KZXAvVGVvRUNoOTNHTzJ3TUpDVXJtWlloWTRZK29yMGhuN1dS?=
 =?utf-8?B?R3dpMXlFQ1ducnNJY2hpVXNWYjVlVGs0K1FhRHBrRWxQdnVrYjNWWVA0UzVi?=
 =?utf-8?B?Vjhyek1sK2tROVhFbXdQQVUrSnVHc2NiVndGVDYyN0dHMksydlFNL2ptQytS?=
 =?utf-8?B?aEZ3UFdCTVFVcnBHNXhDZ0JtcnUzQUp5QWw0dGVzRklxeHptQlN2MG9yaG1R?=
 =?utf-8?B?eDR6a1VKcXdIcUh3dkJ2OEVTQVZKeGRRZkRTakZuS1lIZWx6QjF0Vzg0dEIr?=
 =?utf-8?B?VDJkd3hnMkNMakxKWHhBbEhwbyt5MjI1alFmMml1UTI2dXVPUXNHZWY5dk9j?=
 =?utf-8?B?ZklZN2ZYeVdkV3dlYTBnVzZqQzhZNmJ0M0tucXB6a1A3TEliSFppWmhSOFp1?=
 =?utf-8?B?RXlNT0lXUjdabDZ3S1FybkNvT3FGblVwWlNEOTh3MVhXTFk1a2FTOG9Cb1RZ?=
 =?utf-8?B?emI3b09HSE4rOVZTeDFqRWw1Z0JNbEVzU0ZXcUROcm5CRTV3S0hPamN4a09s?=
 =?utf-8?B?Uy9jMG82REt1TEQxSnZROWVvdmJ5cG56V3BnejNZVTYzdkFVMGIxMkhqcVlL?=
 =?utf-8?B?Q1J0REtSb0pRRGFka1NPV1Fjd0poYXI3Q3NRL3h6UG82aWpBV2FFTm5aZndp?=
 =?utf-8?B?UEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b1d8254e-4fff-4773-50ff-08ddfaef5952
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 22:20:06.1403 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c6ytmW385a0QVhWIgPWw0Ws1t4/aNfSP5FPpEAb9nrPLd20TCTLmgdqobUVvP11Nbf5l71RNo4joK5eZYQj2LhP2Hu4TaLS7nibNg0a/40w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5140
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



On 9/4/2025 5:14 PM, Zhanjun Dong wrote:
> Update GuC log buffer type value, to align with the GuC specification.
> 
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> ---
> Change list:
> v2: Use SZ_4K, instead of PAGE_SIZE
>     Expand for loop with switch and fallthrough
> ---
>  drivers/gpu/drm/xe/abi/guc_log_abi.h |  2 +-
>  drivers/gpu/drm/xe/xe_guc_log.c      | 20 ++++++++++++--------
>  2 files changed, 13 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_log_abi.h b/drivers/gpu/drm/xe/abi/guc_log_abi.h
> index 554630b7ccd9..b1819679fa35 100644
> --- a/drivers/gpu/drm/xe/abi/guc_log_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_log_abi.h
> @@ -10,8 +10,8 @@
>  
>  /* GuC logging buffer types */
>  enum guc_log_buffer_type {
> -	GUC_LOG_BUFFER_CRASH_DUMP,
>  	GUC_LOG_BUFFER_DEBUG,
> +	GUC_LOG_BUFFER_CRASH_DUMP,
>  	GUC_LOG_BUFFER_CAPTURE,
>  };
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
> index c01ccb35dc75..6cbb0378d2ba 100644
> --- a/drivers/gpu/drm/xe/xe_guc_log.c
> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
> @@ -50,7 +50,7 @@ static size_t guc_log_size(void)
>  	 *  |     Capture state header      |
>  	 *  +-------------------------------+ 96B
>  	 *  |                               |
> -	 *  +===============================+ PAGE_SIZE (4KB)
> +	 *  +===============================+ 4KB
>  	 *  |        Crash Dump logs        |
>  	 *  +===============================+ + CRASH_SIZE
>  	 *  |          Debug logs           |
> @@ -58,7 +58,7 @@ static size_t guc_log_size(void)
>  	 *  |         Capture logs          |
>  	 *  +===============================+ + CAPTURE_SIZE
>  	 */
> -	return PAGE_SIZE + CRASH_BUFFER_SIZE + DEBUG_BUFFER_SIZE +
> +	return SZ_4K + CRASH_BUFFER_SIZE + DEBUG_BUFFER_SIZE +
>  		CAPTURE_BUFFER_SIZE;

nit: can you do the math in the same order as on diagram?

	return 4K + DEBUG + CRASH + CAPTURE

and btw, since in this function you are using hardcoded values

>  }
>  
> @@ -327,13 +327,17 @@ u32 xe_guc_get_log_buffer_size(struct xe_guc_log *log, enum guc_log_buffer_type
>   */
>  u32 xe_guc_get_log_buffer_offset(struct xe_guc_log *log, enum guc_log_buffer_type type)
>  {
> -	enum guc_log_buffer_type i;
> -	u32 offset = PAGE_SIZE;/* for the log_buffer_states */
> +	u32 offset = SZ_4K; /* 1st section size */
>  
> -	for (i = GUC_LOG_BUFFER_CRASH_DUMP; i < GUC_LOG_BUFFER_TYPE_MAX; ++i) {
> -		if (i == type)
> -			break;
> -		offset += xe_guc_get_log_buffer_size(log, i);
> +	switch (type) {
> +	case GUC_LOG_BUFFER_CAPTURE:
> +		offset += xe_guc_get_log_buffer_size(log, GUC_LOG_BUFFER_CRASH_DUMP);

do we need to use fancy helpers to finally get the same hardcoded value?

here it is just CRASH_BUFFER_SIZE

> +		fallthrough;
> +	case GUC_LOG_BUFFER_CRASH_DUMP:
> +		offset += xe_guc_get_log_buffer_size(log, GUC_LOG_BUFFER_DEBUG);

and here DEBUG_BUFFER_SIZE 

> +		fallthrough;
> +	case GUC_LOG_BUFFER_DEBUG:
> +		break;
>  	}
>  
>  	return offset;

then since XXX_BUFFER_SIZE macros are already in .h maybe we get kill those helpers?

and btw, those BUFFER_SIZE macros in .h should have likely have XE_GUC_LOG prefix
(since those are Xe driver specific) - something for next (or prerequisite patch)


