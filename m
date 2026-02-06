Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85FC2EE20A8
	for <intel-xe@archiver.kernel.org>; Fri,  6 Feb 2026 14:37:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44FA789C46;
	Fri,  6 Feb 2026 14:37:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kLQyahSv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A22C289C46
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Feb 2026 14:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770388675; x=1801924675;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dEqrT3j+g8na2eS0wnL6hY4ikInCgk2wpCL6QTM9uXQ=;
 b=kLQyahSvbG7tJwj6NctDXVFhVZssZZrSSUq1jxoc6gWRkpxaQbVRpqtB
 OpwgWy2biwvF+cWMHe1LGA18NuD6gPg29d+K4ONnIMkqMwLjYguYoUUoi
 DULR66e9oXxRu/BhzjFhAgAE+H/l4sqrLNr4BBSM4Pha5TNRuuT1LfYJl
 5t1pJRNQVPLk3Zl7sS2lU2cCS65zkkb7NUVJK5EGqGuUDHN29sw8A/1M4
 dYVUNL2B0u6LxMLT+f0TaDT8rpaoHMhDqMyB3seN1ZbjA3803TGc1qvF6
 WKxcFRl818knR4Rs5ONiotYl6cPBdbtpcKaDITF+WhO47EX+dve9iSpDo g==;
X-CSE-ConnectionGUID: MtrE1aO4QwmmxXZlAXJixg==
X-CSE-MsgGUID: rJgr+vbcRQOho9PoADWW3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="89174028"
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; d="scan'208";a="89174028"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 06:37:52 -0800
X-CSE-ConnectionGUID: RtoVCrZoRx6LHXF0mmFarQ==
X-CSE-MsgGUID: GcT5EvlYQlCbcHos5zawug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; d="scan'208";a="241336359"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 06:37:49 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 6 Feb 2026 06:37:48 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 6 Feb 2026 06:37:48 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.3) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 6 Feb 2026 06:37:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XjVO+poOVwvQ3W3UszYKgENOzTEWmE06PtyA5Cb4lD2OigLCJ+7JKmU0mS+/EJDnZqKYNrDYSMpXqavq6iA9+EU8dVju240h8SPRozcTkpjSQwrPsRDRYJycbjHEu5KdTQwMpUKxWmu/yLpGCzM+eGEBNypLwV2vQ35mn8QOncCWpxRxQ6zRY5WyEoVkoycA/lL1W8wVzxkK2+o+KHAma9M8OQYDAJ1US8wGVsHaNwjXZcRUPdBPKLLLt76D9y+49cFS8/8QMTNY/kA+/lcZGdN1OWCxM9VWqE9LcgpPu0iZmVllhM6laRChqaIf77B6AcMLapf6pBaHS2omIApTtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M5K1HSEwnSQKetyC8f97wP0mofCxg7d/gko3PlOmVak=;
 b=W0eluN2qP7QvL+0Fb59Uv7uKY1R7cHz85uxfrn0QdzJBiSCdzeRGfNBNfdkZiEDOU8eF5l2ijf7uONnSR+VCx01O9ElWQLELXYzt1R/WELCuZMrFllmuPz5/ldheaNm69bv7vAoW/Fnb6TNrU9egTau3jCYIkGhxcrBbcovKshwx/hx6bee18Q04sKT4eKDmst+HcuFcGOHGoOfa4AfGKYBymIb5aDTaXRZbUGFzZl6KFtFMheWOvHGuj6aEVLrCwta4MuSfWUps2Ce8NjyAmNqK0OrG/NBkmc4QkgyWevqHSbPIswzJBZAYwvHrJEqJW6ouivIgT5KE74Ivyx7g7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5085.namprd11.prod.outlook.com (2603:10b6:a03:2db::10)
 by IA1PR11MB7294.namprd11.prod.outlook.com (2603:10b6:208:429::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Fri, 6 Feb
 2026 14:37:41 +0000
Received: from SJ0PR11MB5085.namprd11.prod.outlook.com
 ([fe80::656d:8470:97db:5986]) by SJ0PR11MB5085.namprd11.prod.outlook.com
 ([fe80::656d:8470:97db:5986%5]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 14:37:41 +0000
Message-ID: <e8877f36-6e31-4a1f-a7e8-d2a440fd0ff1@intel.com>
Date: Fri, 6 Feb 2026 20:07:34 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/xe: Fix Prevent VFs from exposing the CCS mode
 sysfs file
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>
References: <20251128171759.2775650-4-naresh.kumar.g@intel.com>
 <20260129172246.1106097-4-naresh.kumar.g@intel.com>
 <20260129172246.1106097-5-naresh.kumar.g@intel.com>
 <fc0f819c-0712-4b27-8cb2-38462cfc7381@intel.com>
 <f40a35bc-1db8-4631-9929-87bff4372dda@intel.com> <aXzLRcMkbv7lTr6L@intel.com>
Content-Language: en-US
From: "Kumar G, Naresh" <naresh.kumar.g@intel.com>
In-Reply-To: <aXzLRcMkbv7lTr6L@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0141.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b9::15) To SJ0PR11MB5085.namprd11.prod.outlook.com
 (2603:10b6:a03:2db::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5085:EE_|IA1PR11MB7294:EE_
X-MS-Office365-Filtering-Correlation-Id: f8c79e34-3b43-4fe0-8423-08de658d480f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NWhOelY3YnRnVytzVzNaN0dmVU9ZVktNb3lraGNIczM3VWJnSEpNVTJ6V3A2?=
 =?utf-8?B?dXJnaDBFc2dUSE1uMkt3ajhEM1hQbXZwOEUwNFhWaGpYMXNOT2xSMThQditH?=
 =?utf-8?B?WG5zL1F4bnA2UVY1ZVhnQVJ4MzZMbXBWTW12MTRVOWNxMmlwUm1kSGpYYzUw?=
 =?utf-8?B?czlFM2tsM2lYYUpsZlo5ZWdWaHNkeURVWWRiQXdjSHBRYTM3bWhIa3VWWEsv?=
 =?utf-8?B?bEU4Nkk0OUFsbkxja1VZYS9aU2FhVlpFb2NIQmZlc0FJbEVaTnBhSXFrT3VL?=
 =?utf-8?B?WlU2TXpCUmRBM1lWeWpnV2p5YmgrRTA5NkhlSXRQRXVuV2s3dUV1VHBFNHFR?=
 =?utf-8?B?Q29iRjI4eGJydVY0VUVZeDdDTGNXcjlrbkhnVkRzemk3SldzY092ak9mZTZ0?=
 =?utf-8?B?RGY3TEI0RUw0ZzBZV1Z3TmlwakJERkRzZzJ0a3U1OXVwNDlVVktSVVpzd3Vu?=
 =?utf-8?B?OFd0M3RDOUgvVnlEa2J1WWljbm1ycVF3MTdxQVQ1U0FsbE9sMDhXRDBrQkND?=
 =?utf-8?B?U0FZVDZZcWFVUkx2SENMdTVCdkNIdWNoU0tRc1NRaUdyS3hKUDJCK0JTQ0Zj?=
 =?utf-8?B?T2ttT2tRUk8zRnNvNVE0UG5yQnZldGk0a0c1amZCM0lpdEpjUEp1R1VFSTRh?=
 =?utf-8?B?eVVhVm96cVo1TnZxeHYzTmFxS0liQ1BIWUc4SUpuTmJ1dWRkb1RleklwZ3lq?=
 =?utf-8?B?QWkxaGlBT3l4MERFaHVXeWsyWnB6Q3NjSmN0Y1RTVDN2VithUXlzMkxnZlNW?=
 =?utf-8?B?c0FNdWFxQzRBVi82SHJueDNMOGVNclNSczlsZzd5aU84Y0NDTkpLbGJvb2Ev?=
 =?utf-8?B?ZDJoQUUybUplOCtWT0J6UHZxYkZSSGhZY3ozK3RSMkd2WS9iTXIyODFlbTJy?=
 =?utf-8?B?SkFxLzJUVTlwdm54UzB0dXpwUEVWZVBmV2hCV0JNVG9Cd1JSRGExTk1vZlNW?=
 =?utf-8?B?QXJiUmphMGV6dHQ2UkJmKzFBRjA4S21FS1JDcm9WVkoyTi9TTGNWSUhEQXpP?=
 =?utf-8?B?QURVUHREd0J6L21JNFFsSHZscFErUERyT0QzbS9aa1FrOFdlZ0NpUUE4QVZH?=
 =?utf-8?B?bEQrU2xTakZRUTEyY1ZHRG1qQjRFQlVCQzkrTTRVeFVXL3ZQQzF3WlF3WUNV?=
 =?utf-8?B?UnhmR2RXbzBHN0pPRnNEdkp3VzZUb2o4Q212cWhaRE04WnN1a09jNEdSckor?=
 =?utf-8?B?aklNOWZ0OGVZeXBRbmFsOEdHMUpBVzJpVGFGWFJnc0JUNkhvVEhzRGFPMzZQ?=
 =?utf-8?B?dlVwM21TeUxucDc1MWJvem9tWHRoS3c5Z3JFM1Nzek92MWtrZjFiS0g2c1pH?=
 =?utf-8?B?NUg1QVJzZ1JuMjBFbkZCZXR0dnRJQ0xXUlpSZzZ2M2E4MHA1NEJudkhkRklK?=
 =?utf-8?B?dzdnWXF2QTFZRjJDVGtnTmJhTG84R3F0ZlpTbnUzSnJ0QlB4MVYrRnpkQW9v?=
 =?utf-8?B?NTV6WDExRlR0Ly9Qb3VWaFFGYWY4UnFqaU54SUQwTHkrZEpNMmZzUkZsTUtV?=
 =?utf-8?B?UjdXRG9RQmJVSG5oOEdvR0ZhYjZmVHNja3ZUZDFJSW5nSFRlVFFHd2YvUGdu?=
 =?utf-8?B?U3lCdll4TFJFbWlrV00yV0phd0VOWGhsdU1uaG5RK3NoQXR0RWpDSWdPbGNN?=
 =?utf-8?B?VFJNTWJqdWVVbHRoYXpTL2cyY0FBbjMwY25GL3BUTnovdkY1ZW0yZ1dZMUpv?=
 =?utf-8?B?VkNZckZ3d3BvUUdHd2owRVdvbDJtaUxYOGZLUGoyejFhY1RpUnRraXJOMlFp?=
 =?utf-8?B?bExHMHRFUDlrN1NPWnVhbUpLVi9SY2N2NDJpdGxFcXFOcWVWdmU0cFVQTWVu?=
 =?utf-8?B?TW9DSE1ZMXI4ZFY0TTlGSGprMHFYK3pTc0tzeUtBSTAxYjdZK1FSZG4yakU1?=
 =?utf-8?B?U3p1c2RoTUs3SitHNHY2S2VZd0pOekU3WmgwVDJHck1xVk5SVEh3Q2s2VWRn?=
 =?utf-8?B?eWhwcnUvc1BLMWt1TDAzRTNGRHgwaGVxM3pvNjNhTHlWTmxrdlE1dExneThr?=
 =?utf-8?B?VVRuZ2xGaTdUUkRaWEhPekVoUUhSc0hVTThrZDlHNlEwOHpaMkpMQXNZbHUy?=
 =?utf-8?B?MnA2MEgyNlhjSGJVRk1McVFadHVTbERrWkJCY2I1RUpvTEtLSmxIczV1UzBa?=
 =?utf-8?Q?ydas=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB5085.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VlpyeHNsYUg4RU81UHF6SFRIVnFDOTJJeDM3S1oxb0hqVVZWZFhsaEtUNUxG?=
 =?utf-8?B?bTR6L2hkNzlsdDVoMGxqZ1F3dFpSTTlBM2xydXh0cFdNOHh6WHVGaTh3VXVB?=
 =?utf-8?B?bWljckt6MVdWY2tlNHZZV1l3RC9YdFQ4NDNYejkzb0tidGJ0KytkQlZuUmdt?=
 =?utf-8?B?eUd4SXE5UU8vcTlRYXVZdmdMVzNWNTZHRC9aZlRUWmdOdngzQ1FPb3o4SkY1?=
 =?utf-8?B?cjNQVkJ4VVFERUhqL0JMVXNENTdHVEV2WXNFUEFyeCtnZVJvblRFa1JxN2xn?=
 =?utf-8?B?WFdzeEt2eUJ6d1VtM3lwYlQrSU82bmFqaVF0WGtQOEN1SnN2bTVOdTd5aURZ?=
 =?utf-8?B?Zll0UG1MSm5taGMwVnBXVWNNclJHVTVhR1BMYmZhc0p4Ky8wM1RMeTBUZ0xV?=
 =?utf-8?B?a1k3TGozQ3ZMSE5FR2Y3Qjk2eW96emhCTFJzRlNCU3F0WHBzajVLZU1pWFA0?=
 =?utf-8?B?a0VtRjYzbmQ0NExya21raUhIV1Z0dElLWlB3RE9TaUI3eFFCZktzdTk2SGtT?=
 =?utf-8?B?KzNOd2lNY1h2dWtMa2pxYnR6QWRBOER3RlBmRmZmNW51eVFRTWpqdVFRSi9s?=
 =?utf-8?B?dVcwUXNOVnhFdmd5akpkMmlMUWdSUjVoT29JVW9MNTBGSzlkdnZmdzN6RldD?=
 =?utf-8?B?RGVOdnM4ZkpjeUpOVkduRGhrSFgvMVcyU3ozeEJINGhlV2FDN2ZxekxWT2g0?=
 =?utf-8?B?WFFuZURJQ0xMRmVCem9DMzFSQXRkOER3dm51YTR5TXNyQWdDVkl2bWp0SHVG?=
 =?utf-8?B?bitKUlBKOGlwUmN1M1NRcTRVSWtpcCtZYldNSzFlTXR3aDg0VlpBTHJBQ2dM?=
 =?utf-8?B?T01saWZIYStPRllpdklOakx3TFNrSWVHYWZTRVJ2bGlKVUlpSWxLRWhobTNX?=
 =?utf-8?B?bVdFcTBmMC9QRFM1Ui96TzFhUUQzVk1BRldHTnkycE9YaUYxcG9LMW9Kdk5X?=
 =?utf-8?B?VVpRNEh1RTUzc2NaWVpBdm5RK1JueVd2bE93cC9Jd0syN2xCSGRvdHVtRVVz?=
 =?utf-8?B?T3VSS3dOa0VZY0VEZU80SlByWlk1VnhFZzUxK0NQYkxIc0htOVhFOE1wTVVq?=
 =?utf-8?B?ZUZDVnFCcFMrOEdpZENXallvRW1veURzV0gvWThvaU9oQUdFZ3ZPTWhZdHJO?=
 =?utf-8?B?R05UMzRLbkowdncyWUUyTVl2Vld3QVpPSXpSRVlDQTZBOWRFdG9TZ1d5Nlc5?=
 =?utf-8?B?RWJhODR4UmVzYy93V1JUNmdQN3lIRzErakh1RDVxUUdZS0VoKzFVMVV4bmJw?=
 =?utf-8?B?MWZ3Sm5NL2x6bkxGNzl4ZUUyZW9rTzh4bnZkU012QkZWSE1xenlNN3NVU1R3?=
 =?utf-8?B?REdJYkw0QW13dk9OdVJsdFFKN0pPc1RKWWsyL1llZFlIQUgwc3FEUVhpZ1BB?=
 =?utf-8?B?K1JXM1NVR2dyWkJ4a21UaXN5NXl0cjBqcldBQUxvc0txaHk1VEdHaDUwdUJB?=
 =?utf-8?B?aXR1RmtoSWF0c0FEeTBYeUNtSEdnSTRFNG16U0daVVoralgyN0l0azQwSkxs?=
 =?utf-8?B?b2lMTUlXUFBWdnFzZjhnU3VYSXp4ZHg0TUVVSHZ0M1MvNi9DRmJaY1F0Q2o4?=
 =?utf-8?B?M3QvMFAxbFhXUEJyZmk0TDRwS2gyZ2diRGdDZURORE5WTi9jVmIwNzFXU1Vw?=
 =?utf-8?B?SEd5a04yL1RRM042MmFrYUorZnZ3aTRWSXBYZFlmSC90VUw2UUtYVmY1RnE1?=
 =?utf-8?B?VVRlbEJlektjc0o5Z3lucmpUenhqbEtPOWZ2dDgrTlFaVEU2VEtTRmRPQ2cw?=
 =?utf-8?B?eDlsN3prY0VTMlFIR2w5VlFRaHl3dmFlOWhIZmdyZW80Y2xNN1lWSWE5VlN3?=
 =?utf-8?B?andTWURHRGk3K29nWHZldENIb3hoa00yNkpLcFVQNjE4b1hXQW85MXBIa0Fh?=
 =?utf-8?B?TzRtUUNPd1FTZjl1aHZwYmdoY21uVlAvU2N0QlNxQzB2VTJiMGtnUzAzeDdN?=
 =?utf-8?B?c3RidWZSaVdYWlo1VlNuYkdjd1V4dk5wc0pPVFpKaEo2QVFQbDRpLzA4d3ZV?=
 =?utf-8?B?NU5rZHF6VWIvSFQ4U05FWU44eWhrT2tyYitoU3JrOVVMMURGekVtQ2VLeWtD?=
 =?utf-8?B?V0JwdTIvbFZEZXJiYzR2cFlTcENSODd1UUEzQm1aWVFQZEJ6NzBJd2M4VzNy?=
 =?utf-8?B?Vmpna1RJWVpsME9hUjdXcVgzYUc4cmhkeFMwU2RRdTF0OCtZSjlsMFB1eVlj?=
 =?utf-8?B?ak5JVXBWUkJ5M0RiTXFrK3J5TUNESDcrbHZ4a25ub1g2QUYyMWlVTE9GS1dR?=
 =?utf-8?B?Zm9MQ2lBcERmUjZPKzREaXViOWtMTXhkQlgrRndkVzNNeDgza3l4aXdVNURC?=
 =?utf-8?B?NndmdVB3NER1b0ZibGNIRlJkWENlU3BUNjVNQ2poV1IzN2tudkRRZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f8c79e34-3b43-4fe0-8423-08de658d480f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5085.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 14:37:41.1011 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I0IWVaa3jIjA2vFQP2AeRAXuVczMHL/lJ55JxTNxm4dogObYuSfY752hg5F/hBXnWXuhm02FC/InuL11Pme70w9xDUE2yAFfO/sma2aEZFE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7294
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

Hi Rodrigo,


On 30-01-2026 20:46, Rodrigo Vivi wrote:
> On Fri, Jan 30, 2026 at 08:02:57PM +0530, Kumar G, Naresh wrote:
>> Hi Michal,
>>
>> please find inlined comments,
>>
>> On 30-01-2026 02:43, Michal Wajdeczko wrote:
>>>
>>>
>>> On 1/29/2026 6:22 PM, Nareshkumar Gollakoti wrote:
>>>> Skipping creation of sysfs file in VF Mode to ensure VFs do not expose
>>>> CCS mode changes
>>>>
>>>> Fixes: f3bc5bb4d53d2 ("drm/xe: Allow userspace to configure CCS mode")
>>>
>>> shouldn't this be
>>>
>>> Fixes: 97fedf015cd9 ("drm/xe: Use fixed CCS mode when running in SR-IOV mode")
>>>
>>> or since it wasn't really broken, maybe we need no Fixes tag at all?
>>>
>>> adding maintainers to confirm
>>>
>>
>> As we discussed on call, will remove Fixes tag as logic not really broken.
> 
> Please let me know when you get this respin and merged so I will port to
> the next fixes round. Although it is not a bug, I prefer to port this api
> change while we don't have anyone using that...
>


FYI: The patch is being merged into the DRM tip branch.

Thanks,
Naresh

>>
>> Thanks,
>> Naresh
>>
>>>> Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_gt_ccs_mode.c | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>>>> index 50fffc9ebf62..e146e00b0ca2 100644
>>>> --- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>>>> +++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>>>> @@ -191,7 +191,7 @@ int xe_gt_ccs_mode_sysfs_init(struct xe_gt *gt)
>>>>    	struct xe_device *xe = gt_to_xe(gt);
>>>>    	int err;
>>>> -	if (!xe_gt_ccs_mode_enabled(gt))
>>>> +	if (!xe_gt_ccs_mode_enabled(gt) || IS_SRIOV_VF(xe))
>>>>    		return 0;
>>>
>>> I guess there should be no users on VFs that would like to read it back
>>> (as CCS mode was/is always fixed/const for VFs), so this fine,
>>>
>>> Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>
>>>>    	err = sysfs_create_files(gt->sysfs, gt_ccs_mode_attrs);
>>>
>>

