Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2CC0D0EE0F
	for <intel-xe@archiver.kernel.org>; Tue, 25 Nov 2025 19:18:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FC4610E074;
	Tue, 25 Nov 2025 19:18:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UbWp3oDo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0981910E43B
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Nov 2025 19:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764098280; x=1795634280;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=DVLp2p7ZdhBeDQgutUZydltCnrQ0JyzQSHMwl3H7j8M=;
 b=UbWp3oDobMA6aUWEhDRnk4H/HP/QIPhKcwhGcFiaIGS/4TiS968ote3O
 zVEZJ5hXWOhktcAddMm4CEflK6XPwzyXK/pe3cSoVnAaj49e6h6ebQ6PR
 Oj+I/iaw8LrdtxO4DOyqSbAKTDiA0y6ezmdCBYM5cjO3l4Kh9dVZGWu3/
 zFKH34IybU2dqV8eZFZIl0oPtDKHQjy12Wr6PDlxU1sjzPwKDMH5+P1Nb
 J4UEjOxMNCNz6o48M5zhr+caI4qr1qJ4AyPDlV/KCBrQzmL1uu2PAIcDV
 Gd3vrtDAw59DRpFL6xfquoBAsHuYKgQsgBBCt2NZ72RNJS8cgDGj/d5o2 g==;
X-CSE-ConnectionGUID: iJLBDQuxSqCWx9SBS+6/Fw==
X-CSE-MsgGUID: InMcVu8PRqKnWVWuqw0XSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="77604354"
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; d="scan'208";a="77604354"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 11:17:59 -0800
X-CSE-ConnectionGUID: agmMI5I2ShuB/fiPD7WCYw==
X-CSE-MsgGUID: R8iAvU3lT+qyxnyfKALoTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; d="scan'208";a="223419240"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 11:17:59 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 11:17:58 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 25 Nov 2025 11:17:58 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.26) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 11:17:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cuF2oEYqnqUexDbOkoC6pFnfpRxEXsr3TSVBo1g1r5Gkw67laFOZVVo7+cWYESYFIIR7Y/hMTPwMAzBlJqM3bDVwUBgITIaxNQwLrCdrnYH5h3i29nbH7tNq77+Nk0vvLsxkBsF3KWOz/UPj/c0D26lJ9KSVGv6KbLK2AA1WJ0bXxNOqplcEdY4Hhsa0iRg542+7IfKmJfCaHOtF+UTlt60hjasG/kQh8Doy0sBCcrA78iLD6yGdyAX/TIAO4NXHdyHzJpEKx0PVeo05GqN8W7Oi7dW3jF6cOTtXsxxjz49YbvDkmaf4e3CH1e2zOXSBKRrHT7tU8+ZmNkJm3q1UVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J8T76V6x32X/qkAEAuj1hNsAIVHub/zVs9RffoxvuAA=;
 b=Ue7R1/32sR30+Rz+IQhsSSMeF6qgrbQJlTBf8SaJVZvbC0HqljpR+XTds6CdIxi8VZaqD4uQTwCrBUL/A7Uhqufa5BUrMpooM8jlQA8tfH1uFbF0Mvet9M678mbMZ3uyl8twycfWWF/n2fDnI7xjNK+E2L/MyuvJ5AzKtYmCMKUETlhQCCUEd3MPm4PJ+S9AlU/TR5dVvZdWuork6M2R09+QkHEQTQqVigyA2qczViZjU50c6THjVeJSfwrpS8Jk4txuXTRBzIPZPzNGXcBwI/N5FoGHlSolprqTgomvNfb5Orlbs09xqaTd44NGcobgF3xxMVfSch+XoPYQnl+A3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 by IA4PR11MB8889.namprd11.prod.outlook.com (2603:10b6:208:565::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Tue, 25 Nov
 2025 19:17:49 +0000
Received: from IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203]) by IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203%6]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 19:17:48 +0000
Message-ID: <b3290aaf-90cf-4aad-a1e9-0c48755e9c70@intel.com>
Date: Tue, 25 Nov 2025 11:17:46 -0800
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe/guc?=
 =?UTF-8?Q?=3A_Recommend_newer_GuC_firmware?=
To: <intel-xe@lists.freedesktop.org>
References: <20251125014134.2075988-10-julia.filipchuk@intel.com>
 <176407852649.25800.17110598523800123230@a3b018990fe9>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <176407852649.25800.17110598523800123230@a3b018990fe9>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0165.namprd04.prod.outlook.com
 (2603:10b6:303:85::20) To IA1PR11MB7821.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7821:EE_|IA4PR11MB8889:EE_
X-MS-Office365-Filtering-Correlation-Id: e9a091aa-67d0-443f-29dc-08de2c575225
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eFkwZEUrMW0xYU1Od2FqcXRrMnRrRnU4TUNrOFh1VEdySnBQZmQ4U2h2dCti?=
 =?utf-8?B?eHdnemFPK0ppUVVxN3U3REtqNGQwYk41Vi9jTkpPWWZmd2FMandkclAzaHY0?=
 =?utf-8?B?OUM1bmdmTUlrZjZUc1dRdDVjQzk5SmtZa2FEeTJzZDBVNllpNHlPUGZqS3lE?=
 =?utf-8?B?Rm1HUUh0eWhaR0RXZU1rOUZPeTdtYkUrTEUyU2VPS1lsdmNjTFJpVkh6eS9Z?=
 =?utf-8?B?eXJlUnVIRGdFcEZwS2NyYXVoK3o5eGVZMFRWVEJMUml3OU11SHIvam84ZFhh?=
 =?utf-8?B?Znp6SXJSMWFvM2JhYXF4anRVbmtGYmNIcjZ3amRjQlZ1VE5SNm80Q1IxWFE0?=
 =?utf-8?B?OHBxd0Q5bklnbDMya0FmaW5WL09JYkNaVTMzZnc1RUZmMkdDTktNelFYRGJL?=
 =?utf-8?B?UmV3UHg4eGNqNSswUFJUbC9JbVRPNVAzZi80QmdkRmExWmxGZk5KUDhyVzJm?=
 =?utf-8?B?b3BiMlRqdlhKL0VnUkpuTlVrRHF5UHJzOEgxaFYrS1VpazZ5MTRKSEdmL1Nk?=
 =?utf-8?B?eGF0em9wdm1tTXR0VEJrOW9HV1Z6Qm9RbXR2eFF4eXZDUll4UzJScFNYZXI5?=
 =?utf-8?B?N0xuRnB1cHIxOTFuRi9YMUg0VkF5WmQ4YUdob3lDR3BKK3l3YktLMDVyQm1t?=
 =?utf-8?B?d05aTEdndVNsbHlWVUFMYmgzY01JU3dRcnZ1eTREb3ZWbFc2OWw1dEk5YlJ6?=
 =?utf-8?B?Vy9ZckcwbmxjbllrQ2JsU0VuVjBCMThRK3RwNVdDY2ZicGJGd3FOUHZ0TEVa?=
 =?utf-8?B?TnJmSEREdXd2OGZRdmFhRU11M1IxVVFGcTZIOXZaQW9JRTlvZFVVbU9WVy85?=
 =?utf-8?B?eGEzQW92ZE1sVmM3RThQdk43a0lpY2lEbFBhRFVpQmlXc0RmWU51d3lqOWxV?=
 =?utf-8?B?b1BIRFEzNDdjaTNqa1poT3pNazk2ZXNrdUQyQVE0OGZjZWo1MllZQWJJajZ4?=
 =?utf-8?B?SEFrS3FGdlBCWVZXVVdRWHRjWkI5dnBrQ1A1K2NYeWU5VXJmS0NoSnNxbnpO?=
 =?utf-8?B?MDdDNEE2cFJBZlVET09HTUNJamdsaG52S3hhVitFazlZV3hVR0xZQStWK0FL?=
 =?utf-8?B?Y2FPc2JiOGxCc0VVaXoyc2RDa21uNEQybUo0NTB5UTY0ZFVwRDU0M0IvU3o0?=
 =?utf-8?B?VHdLUkpMUXRCT3QxQVVnSTBkcDFGRzFIS0gwZmlIdzV6dW42L1VhT1Vpc243?=
 =?utf-8?B?QXczMEVwbWxFRVREeU5YVW1CUWF2NFVKSG9VUkUvQWJkdTNuUXZwOVBEODhs?=
 =?utf-8?B?aDlUTXpBaFFoNTFVWHZjNTlBcnFLWko0b2NZUHJUVVpPc0IwZ0gvUEZ0dDRr?=
 =?utf-8?B?dE1sbExhUUtyUU40NU9ZdCtCbGJrRmZNYjllR3NGdy8yZi82aW43NzdxS0JO?=
 =?utf-8?B?TUFtL1VUZEJPeVhMZEVubU5HaDhrNnFwY2s2UnoycVdnTEx6dzdVbTRCN2g0?=
 =?utf-8?B?K2p6QUxtNGp6RjdFMEJ6Zi80WW5QWVQybGtNZ2tNQkZoS0NIbCtRYnpFWU9v?=
 =?utf-8?B?S0NhMmVDWG5OT211bStQeWlFWTVSejdyQnZFc2ZadkZMeFBmSHBQQjd3a25N?=
 =?utf-8?B?MEgyUkI5bm1qQ0NJN25VWnhrOFRnT2RlMEQ5UWUyMExFL3NLVFR3LzgxYWZT?=
 =?utf-8?B?dHY2TTM1eEdvWWUrZncvaHFHUTFLYVRJRXNBaXBnY2VBNTVQQXNxRVFlT2Ry?=
 =?utf-8?B?b0NNR3UxaVJNc2xQRUhoRy9DSXU0MC92ZmlVOXFxMXNJLzhjeUU0ZDRwaHQ1?=
 =?utf-8?B?UVdwMG9wd3hUYTNVV3NsWnhaZU1DY2YwUlE5NklDLzIyOFRIblFsODByS2hh?=
 =?utf-8?B?NVRML3BVYlNyYkxtSmN2eFRrR2NvVGUzallsVm10L0dIU2U4UzBFQkZaemY2?=
 =?utf-8?B?cnRuU1ZhRW8yVW9XNEdveDkxZWEvNGk1U1R1NlRPcmo5cmc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWhNdjRyS0gzWjgvSnVkVkpJcnhzWXBmZGpMSk4yT01HanZxWlpUeHYxRG9o?=
 =?utf-8?B?OERIZGovZUllS2c2TGwvSU1uNExJYnZoYWRyVXZJMGljbmgrSTU2Y2k2R0pC?=
 =?utf-8?B?cnpNejBVanVzTHRmNlhpa1B2UzY1V05pV2Vibkh1Mk0vTmxGTklnM3IvSCtR?=
 =?utf-8?B?L0ZXaFRaT2NxNy9CV2luSEZVTXFZenNralB3V0FsVnlKb2l3L3hKWlAxcXp6?=
 =?utf-8?B?dFd3Q2hVUHhMMjZ4L2VoSUx1MHRVNkdjenpLYmVINU1XcElyci9rbGxZZktN?=
 =?utf-8?B?N3ZnLzk5RS8wb1I0Y2RicjhkcG1zc0VtQXFCcHcvMUp2QTN5eGxWMFAxMVlC?=
 =?utf-8?B?Sjk2U3M5ajZpdlk3cXlmaGxxbDJoOS9qdXNsVUFMWW9vZDM3MXR2RTM2VjF1?=
 =?utf-8?B?V3Z6aHR2WmZYYzU1dnlCNTBkSjMyWENzYjBDc0gvR2dTSk9IRVh1eHRIMmZh?=
 =?utf-8?B?OEIzaFNlQWYvZVRiTW9jNzhpNVBieUlwNm1DZmFOeEpsUnFtWGNaY0tXWU9r?=
 =?utf-8?B?WmMzSFJ0YmQyN0tJV0VRdHdJMFI3U3dEbEt4bW5Ca2NuUFNyR0YyTjNDSzk3?=
 =?utf-8?B?SzA3SHI4OUZjcmFSa3VzdDNWUmsrVUkzb1IyOTkwZDd4WWVQWDFhVnJGR3RV?=
 =?utf-8?B?RWl5OGR1MVQ1VzVWRHBDZ3hZVUNjdVRiNk9GbGkzZlllNFZ6cFNNNVgvK2FW?=
 =?utf-8?B?THY2a2YzQmcxaEVtVzBqRzQySG9hRUc1c1pvV1pZVGEwY0N5Wk84bW5RQkZi?=
 =?utf-8?B?M3E2M2E3TCtQKzU4RVlCQTQvTk13WklZQVdpQjMvL2lMMjV3bGZLY05uTGM3?=
 =?utf-8?B?QkpUMXhrbHNFTjVKazNQRFpiRG9TYURDV0h0NC9NeFlIa09rQW1ESW5JdTZZ?=
 =?utf-8?B?MXcvNHJheWxleEpwb2grVUxKeDBuTUYrcFpLNWIyUTJaTXFZSklMdk14UHFJ?=
 =?utf-8?B?a3FaTEkwSTFsRWdBMUh3bXZ3bUZ0VXVXcGxIRk1rSTl1UmRRb2c0d3hyekhO?=
 =?utf-8?B?NXFZcjRvNXZnZTI4N0Y2QXVMQ3ZLelQ4TDhCWm8yUjZWN1phaFJaNExGS053?=
 =?utf-8?B?bnZtUUNQN0NOSGZ6d3BBUWtuN1ZpdGY5WG9xVGQrMXkzSjhESUg5QkhDUHNM?=
 =?utf-8?B?dHlaOE5XMnVaL3VYWkNkNHdYNHlwNjR3VUhSbWJsK2cvdHNpUkpsSzI5ZEFq?=
 =?utf-8?B?TUJpMFNJNHhGdW5mWkc4TkxsUVl4YnYvemxRcWVGRkh4RmhQUmhYVXFHc29M?=
 =?utf-8?B?RnpkbXZsekYzMHM4WjhhZ0hRY09LTTZsQXREQmhBTy9oY0FJRnBiYkFHWXpz?=
 =?utf-8?B?YXdNYzhIVWdhKzJOM1hYN00vSWtsdlVWb08zeUhoSTZBL2FxK0JlWXVsNjAw?=
 =?utf-8?B?aXU1MUhBM0drMlpwZzB4S1VzbUFYVUZZdThGamNrMi9IRWwweVZ0dU9oSjVQ?=
 =?utf-8?B?ekZwVDdPSFJTM0tSUCtHeGRmYXEwWVpQR0dQeWwvaEZ1ekhRMDNrOHZUZm5K?=
 =?utf-8?B?ak01aEhSVHU2SFhSU1FwS2haVmdQdGZqeGtndkZhL3ZjWGt2c2w1N2dEaXNR?=
 =?utf-8?B?eE5LVTIyK2gzZGdTWHhUdjR6MVJxb3hOV2ZsSGdBdzFvb2txWUd1enZpcU9D?=
 =?utf-8?B?Ykt1Y3pkWVJqbnZVb0hwcVFBNFNwVkdrdzIxVE9mR3llbElsTERVK2RaSVVi?=
 =?utf-8?B?NmlmNDVWNE0xZmtNLzc0bE1qSW5CbmFFTWhoVlFldkhmeU1BeENNdzVTdSti?=
 =?utf-8?B?VGpCU3R5RHdFdXduSldzck8zdVNoVEdoWDZWNlJsNWlxa3l3ZVZzQVYrb1Qr?=
 =?utf-8?B?S2hIOCs5V0FMMEdJRkRvNk1yUWpNNEM5N2FjbGFHTG5pVFB5UHB6NDJ1TTha?=
 =?utf-8?B?Uk5pK3ZHcjViSmQ2R1FQbnZNVVdITVRkWkNBMGN1dk5jY1huVjJnZXpUdHVl?=
 =?utf-8?B?UXhEeE1YM2NMdlFiOU53TmgzaXdwNWhqbjNEYXpSYTVSWlF3d2xDdDd4dnlJ?=
 =?utf-8?B?UHFEUTFBN2gwQ25EVnp6cDNoRUpDMU1IUThKcmp6eWxoZmVtcS96ZGJLY0dE?=
 =?utf-8?B?Qnh1R2ZLZk1kWGV2UDE3WlVwSFlHd1FVTkxwSzNRWUpOWFNVd29PUGtiQm1a?=
 =?utf-8?B?LzhzSUk3cWc3UHlSK2Mxbmd6WUx2eHM1U25xbzlpUGs0R08ycG1SeFkvZlM1?=
 =?utf-8?B?Umc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e9a091aa-67d0-443f-29dc-08de2c575225
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 19:17:48.7095 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0v4ZUHnQwMC7xuSCQOgqxU+8v0b5v4uqqRq3kjUUWCOVRiBCn9sJntzszMrVth5e3WMPUtzfad+63d6029H7zlwxAfiph4E2+aC6kFW7z38=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB8889
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

On 11/25/2025 5:48 AM, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/guc: Recommend newer GuC firmware
> URL   : https://patchwork.freedesktop.org/series/157996/
> State : failure
> 
> #### Possible regressions ####
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
>     - shard-bmg:          [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4142-d4e10540f736e4bf0f07b1d4b27a15a8bea5d7c1/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157996v1/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
Failure unrelated.
>   * igt@testdisplay:
>     - shard-bmg:          [PASS][3] -> [ABORT][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4142-d4e10540f736e4bf0f07b1d4b27a15a8bea5d7c1/shard-bmg-6/igt@testdisplay.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157996v1/shard-bmg-5/igt@testdisplay.html
Failure unrelated.
