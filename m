Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F7F5C3ABCC
	for <intel-xe@archiver.kernel.org>; Wed, 14 May 2025 11:08:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A5A710E610;
	Wed, 14 May 2025 11:08:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ETppr9IE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE11710E610
 for <intel-xe@lists.freedesktop.org>; Wed, 14 May 2025 11:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747220931; x=1778756931;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=490OXxqfB54QNQKEDl5PKEgo99yvvghAJkoXOF/iEo0=;
 b=ETppr9IESaHqTf4wTwSy6LYP4R8iEij8gkFBQrw6RHIx2WJ5e6PcneNT
 f+P1F26gm95qwBVV+Jd9jr7uSkqaNLHdmV2m0UIn4zpGrHiC8CNUZ+MV2
 eEQuCMmoFoOAVLQsHgYkx8wrBXN23YfOk5+Re2MhQmiRjAuuVzi/ofVJc
 +HY4R0qkTAbAW/FXgtSR8Xhi0t8WWBpWrJ43Ehzj3phgVquXLqKrhU4Fu
 9zoMCQk+5M/ryfuv45daMw7Nzfucpftn2E3/elXjNQ/ACgR7qWDgbORGi
 0RstuY7E7Dbx2mXrRx/+iGljKoV8G5f9q2nsZvxe7FLMQfkMjO7Sc4Gja A==;
X-CSE-ConnectionGUID: QyzrtrwTTE2gubk2SH1UoA==
X-CSE-MsgGUID: YqkukfR4Ruqg7gGkfbJX8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="51750184"
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; d="scan'208";a="51750184"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 04:08:47 -0700
X-CSE-ConnectionGUID: 2E0T4mFdQai9FqSMHATIvQ==
X-CSE-MsgGUID: z+mghnxKRXu4IsEqWdkHiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; d="scan'208";a="175138581"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 04:08:47 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 14 May 2025 04:08:46 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 14 May 2025 04:08:46 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 14 May 2025 04:08:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KJ+Q2nhKjWXOtW5ciYfximpxbg9oE/g2wMWRrZ89QjIGFKYWBBoPvZ8LKPtSs0aCxO9byzCZEBdlRJti3ppeJZjRA1kMGEFbR5ZFeINPjkg1MKv/LWJXdKohwpNjVMmj9OIK5Aq3Hx52pnIAOs/TVRFIxadtZ0spnvre/TqIYRhWjTkEf/WRYtXX7QVywyTNOy7AErmVFGoI1ephV35Cp6tux+ef0ieeowpSoTMJClhLOQ1WF5klEHPyvVLcqt5Ijz2kQ/oqfYot954EoMup9ZxJbtUAizhiSwIg+K6iwivfvZophdeoGZSqtEUImIDuEv1krrVllTJ3LEvSvrBCWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TkuA1pGLybmtYZxOIbM+zEF8eMrIdbzD22+lVyYgviY=;
 b=Ed1mj/H4Ipyz3gkZ2kvXW9hf48y6n0EcF6Ehqjui7sVUgFUfkPGIbhsmKJ3WJdONS7WxOIUKB9uB76et4SC1Vuoc6yZZWoL5okbGRnf03O7KPoKg5Z2K8otPIq9uGmcv/KcnKdAIQB4buT0qbXAUi0h9sUFfKrfoXUc6GwD7ScT/MtSKtjDK/Yxqne6709Ceq9bJUBmIA3Cvv+8dLhd2fsIU99JV8nXGtaxC35254S26CLcMEuVG81I+M910ktgFNmXE0VHuvQGV8Yj4OqwT1JroZdh2xkz9r53uy/LdGs3a+zCO/slG/0C5JjelWPjYFb06qPkbp9iIPRTuNabtTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 LV3PR11MB8577.namprd11.prod.outlook.com (2603:10b6:408:1b8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Wed, 14 May
 2025 11:08:03 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%4]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 11:08:03 +0000
Message-ID: <84aa0d72-5c7a-40a3-afbc-742c2e6f1188@intel.com>
Date: Wed, 14 May 2025 16:37:55 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] drm/xe/xe_debugfs: Exposure of G8 residency counter
To: Soham Purkait <soham.purkait@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <karthik.poosa@intel.com>
CC: <lucas.demarchi@intel.com>, <ashutosh.dixit@intel.com>
References: <20250514080721.265515-1-soham.purkait@intel.com>
 <20250514080721.265515-3-soham.purkait@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20250514080721.265515-3-soham.purkait@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0038.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::11) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|LV3PR11MB8577:EE_
X-MS-Office365-Filtering-Correlation-Id: 658952ca-f481-49b2-5ec4-08dd92d7986d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b0dJeDVkY3VxWGlrU0FjbCtoUnowdWZYWkZHR3piSnh0bitPdC9BQjcvWlR3?=
 =?utf-8?B?N2o2ZG45amh6ejF0YzRyc1RGZVVQNFNHb0ZKNVo4ZHhDSUdsdHpVMHBnRkkr?=
 =?utf-8?B?U1BrQk9taHF0OFB6WHRLdXZmNzlLckFrYTAxUlNRVksrR3JsTDErSS9wb2ZN?=
 =?utf-8?B?T3gyMmJSWFM1b3hpTFZ6RzJNaUJrWnBWbFptM0NTclZwYmRQNmRJL1VXdnFY?=
 =?utf-8?B?enludWtRRlp3QUtlcVpNNUxoUTErWGhERVgxYlk4VnV0dGxneVFaRGxRMHpL?=
 =?utf-8?B?bWRQSy9mc00xbjJMUnhtY0Zoa0VJZzMraCt0NVhQNlo0blZjWXdXRExOaUxJ?=
 =?utf-8?B?a3NuOXcxbUFhSE8rWHZyVGlIY09wcWhYbnBEdXdaNkJxMW8yeEV4QmNQbGN1?=
 =?utf-8?B?Tlo5SmJ0SSsxV2QyWlJDMEFZMTZpTDVRdUtqaml0NjQ0YUphcXZpMzJxVWVY?=
 =?utf-8?B?UzA3ZnBESFMzZGtxV01xcFZRbVdhNkwweUNubm1xWDM0ckdRQzBOSTRybk92?=
 =?utf-8?B?MzZ0Q2E5ajhVS0trcjJkT2hSZElDemlLL2ZMKzZjb20rZDB6Tkd4MVlobnQv?=
 =?utf-8?B?bFE0V04wVUl1TGJzWGg0d1pxQjZTekpDZ05lME50RGZEUENsamRMUDNrNE40?=
 =?utf-8?B?cnlheFRHek9GaFBuT1FVZ2x6SGtxSmx3TURNWlViWVQwVHMrMTc2cFNtWXZy?=
 =?utf-8?B?UDBWTmZ0VVpWUzVBTWJpTSt0Q0dIa3RQVmNBOTFPWlg0UVlLZjliSVBPUWJH?=
 =?utf-8?B?YVoydzJWM0Yya2tMYWowQjJHV01TdzVlOHQrMWV1aHJoUlV6ZmNmdGsxMGRD?=
 =?utf-8?B?SXhMVVptN09YZSs1bnFFc2hPQjhqa1Z3akREZVhBNEZ3TDU5RERCQmh4OUxR?=
 =?utf-8?B?QmVSRUFweFVWNWZYMk11cE5vSjdvNVpncjhzMnU3ZjZTa3JVQnZzK3FpTCto?=
 =?utf-8?B?RVFtbDlQdXFCckg4K3dvY0FkRkdYeWJTV1kzY2c5MFNsbk1QREFUTzlBbFcz?=
 =?utf-8?B?clZvWUNqaW1ndlVZQ09oQjY4ZnM1Z3lVYjJxaHVleE84RmJuUGRybGovTzZF?=
 =?utf-8?B?dExzbTBQVllpNFhsM3hlbXl3Q3dSZ09oMHBqZFVIZFpWbUZpWnZ5aGFESWp5?=
 =?utf-8?B?VXROdENHam5wSTZLWHFVVlgyenRNUTYwUVcxVE02aWhaclc3TmVBKzlJek01?=
 =?utf-8?B?L2hkRzBKYy83SzJCSmV3Y2JubkxZdldoVW56VzlhOHdjcXNnbDcrc3VEd28y?=
 =?utf-8?B?Wk5HS3htYzJ6SjlyY1JSQ0hIT3dpbGpjbUJnZ2tJUlFYTUNwZWlRTUNtY2VV?=
 =?utf-8?B?amd3TFlCTElRVkJneDlITkNyL1lHUXpnd0ZtZzgzTlhiTmNRY1YyemlsaWdS?=
 =?utf-8?B?bjQ2a2NqdmxDZ2w2U0o5RC9BbU1QcDcvMEN6TWEvNjhTK1V6dmo1aEpCcjJY?=
 =?utf-8?B?SFhOOGZSdU9halFJY1RSNk5rV2tNclBlUXpieWkyOUhTQUtKUG4yTzVOdkNR?=
 =?utf-8?B?M2d2dWRzRFJIVzJvTU0zV3JRTXdTVkVFZzI3MHp4NmVJODdoMjZLa3FoaW9a?=
 =?utf-8?B?dHFvNitzMndrTmJsRFRuMmZuUWJHUW1yeThXRFhuQk1EOGhNd04zYSs5VC9x?=
 =?utf-8?B?eTZ5Z0FRcTBld0N0aVNYY1R0SlFrTHZKbTA5c3Brc013Mnc5QnQvV0V4OEVz?=
 =?utf-8?B?cUVvclFSLzJYUFVsUkk2WWRvTDQxUUFjTGVqRWxzRXRML0llMXlSTDc5b3Vq?=
 =?utf-8?B?OWJRYmQ2MGZDQU1ab1hZeXhqbjJsUEtYdTV5aFNQS0VPQk5XUS9tMjJ5VXl2?=
 =?utf-8?B?bEgyODBJWkJuSE0vRWxtWE8ySlczejgvWURPN3VmWTlEbUFjaW91cmNwaTYv?=
 =?utf-8?B?VjlJU2VvVjQ5RkhwZzhZbHRnK0lQaEVwUXJ4RnNBZDlrWHUyUHE4V240Y3gx?=
 =?utf-8?Q?Sb+c9mTfTLo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MzRzZjlralFpNS9LMlcrb0ZGbU9VR2hKS0VVOU9lZlNPVWFIdTYyRE9GczdO?=
 =?utf-8?B?cWwrZkJoK3ZiN1B0dTVmOXBqRjlnanNXSnYrUkNtcS80VytLRkY3RVlod2Z0?=
 =?utf-8?B?VGdPT0F5VnMrQnQ0R0kzTjhtZ0xGTXd1R3BGMGVsWjhMNjFLbHZlWGZ5TG8r?=
 =?utf-8?B?YTgveVNvZ2NaRHBWVzNsU0I0OU9ERVp0bUxiMXFOWWFnbzl5eTJERnBPZDZu?=
 =?utf-8?B?M3F5MFM3dU9vVkx3UGlmTXBGNXFFU1diYmVVQUlkWTdFR0tab1JLVGRseitz?=
 =?utf-8?B?dkFxM0tQcUg0S1BmOXRqVXlkUTdsYkJuQU5WKzQ1UnNyNVRjSmIrNzVKR3NT?=
 =?utf-8?B?bXdpbGNuUmdMRmk2K29sRnpNWHM0bGtOcFk2eDRxMmhyTWhnRGhobEM2bTBv?=
 =?utf-8?B?NUNWZmtiUXpRakV2YjhmY0U5bTQwSnpVby9VYzJHZFlndWh2UlVPbTkyaURj?=
 =?utf-8?B?ZElBVXVtd2pvZVVENmZOWWY2SE55Uml2cWJhWmdxQlQ0S2xjM05DZUI2TTJC?=
 =?utf-8?B?cWpTUnpHM3NxeTRvNUFOeGd6cVlUNTMvejVKKy9FWVhpa1Y5Mys0UjJDZWtZ?=
 =?utf-8?B?WnRIOGJtbG9Nbld0VzIwdU4zVks0b3lRUUhLYnRxb1ZYbmZGQm9lL0laN2tU?=
 =?utf-8?B?SFpBaFlaTW1udjRxTWRleDdtRndOckVtbTh1N1pZZW02blg5Znl1ZmtaVWhF?=
 =?utf-8?B?MGhYSnZCc3I3R0piaGU0ZFpWdzFtckJkSGhEZlp1azhIOWRIQUdsbXlqRDd3?=
 =?utf-8?B?OThUNDEzU1psR3ZHRFhDa09IYUF3SjlVaE5NcnJrUnYwMzhHeVZSQVZrOTZz?=
 =?utf-8?B?SUYrMlB3Z2E2QUlnVE91c0ZuQlA2MmV2ODVHbzBha2UrT2pyd1RBMlk4K3N4?=
 =?utf-8?B?R3laQmtCSnQwUEVSSWJEWG91Zi9yM3FNWU9ma3JiR1FpRzUzdHkvK1dtMUR1?=
 =?utf-8?B?K3NxZFVaVDdBQ1JiNHQ4Sm9hSnp6RkpUTmR0LzlpWk96bzdxWmlKYktldlBJ?=
 =?utf-8?B?RmdoNnVkL2R0S3o2MkFtZmxWV05mSnJlTUFGdTdaTmk0M3JFZGxMVFYxQkhy?=
 =?utf-8?B?Z0diQ1ZSbmJMdEJUd2Urb041UFd5VE90V3NNMldiRHpmRW1PWkVCdXJCUlgw?=
 =?utf-8?B?TWpFOE5KVm1iU2ZIVkxaYnQ2TGU5TGw4b0xtUVMvUkhuei90ZnF2T2VNd1dB?=
 =?utf-8?B?YjVaemVkOWlkSmlpeE5lM1VQUmV6YVlwQmRCeHRpWEM2dWVmSlhRMGk2OVJI?=
 =?utf-8?B?bmI3dlVtYzZwT1gvdzJySnhMdXNHMXBSRlFVdHMvZ3g0UlFYNC9SRFR3R29Z?=
 =?utf-8?B?RStiSWdKQWJIY1BML3IxVktQTVg4MmxXWDRjT084Y3pwTUl3QzhLalYrT0Rr?=
 =?utf-8?B?b2FEUFlWZ2ZrWVN4QXNvUTM0dGJJVzE2Z216NmNSUHZyWTFBekE5bWIxWkpj?=
 =?utf-8?B?UE1kZGdpd2lQNEswK1RIeTF6blNBRDUra0VrRE9hZTZIUi8vV2hQTjJaeEhz?=
 =?utf-8?B?STNmZlVub09oejBySFl4UGhIYXdWV0FYMmJwcFdoMnRpdVZsNlEyVVJUY3Vv?=
 =?utf-8?B?d3Z3ekdWZGMrbWZibHN1M2wyYlFxNDFjNVRjSEFmT0Z4cjRwdDh0bmV2cStr?=
 =?utf-8?B?NkJmcnZvVVpkaHQvdVRTODBpNlNPVi9DdmdJM1I4cU5IZ2J1c1JqU0RTZDB3?=
 =?utf-8?B?WjNBYUJmUEdtc2lxdytkZzFDK21DWlA4U21URVVhWTBXZ21UcklrbkRYL2lS?=
 =?utf-8?B?bXNwRXVGWjFQOVpMMHJFVndpWEtKS0QwRFZibnRsVUI2ZkljejNUSTBhekRj?=
 =?utf-8?B?OC9kTEZsYk85YmNKSTB2TmZBRVVORzZXcWVkRFZyZ1J4U2I2TG9hVFl3cXQ0?=
 =?utf-8?B?S1hTQTJoUlBZSDRaVmZydEM4VW1XNjVRNG5Ra3V2VHZkZmoyWFJhWXYxamZY?=
 =?utf-8?B?REMxdGwwRThFL0tDR0I2bGdRbEFaRG5XY0FZeHB0cHMyUzRVNG1JbGQrV2RQ?=
 =?utf-8?B?VlNEdU5FQktJck5BV2tXR29XMFltRGJjNW54SjQ2bkF0UnZENmVGV09vdTZQ?=
 =?utf-8?B?bTYvNCtJYUtXV2p5TWpkOXk5elhpNTBRU2IxaStWeFFObFBmTXg3cm1icXJN?=
 =?utf-8?Q?W52Q0U48i1lo3Q6iuUSH+4OAY?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 658952ca-f481-49b2-5ec4-08dd92d7986d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 11:08:03.0923 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t9d6FF/XZETy4FCTPEI9tg44VY2gScEAawOuu/T85LMm1rHZCp1sH3oPpEhnmM1u5fYdNeh/Ts4bOG5m6A8FsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8577
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

Hi Soham

On 5/14/2025 1:37 PM, Soham Purkait wrote:
> Add a debugfs node named g8_residency in order to obtain the G8
> residency counter value.

If this can be read by PMT, why a debugfs again?

> 
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_debugfs.c | 37 +++++++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_debugfs.h |  2 ++
>   2 files changed, 39 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index d0503959a8ed..f9ab6a03af29 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -11,16 +11,19 @@
>   
>   #include <drm/drm_debugfs.h>
>   
> +#include "regs/xe_pmt.h"
>   #include "xe_bo.h"
>   #include "xe_device.h"
>   #include "xe_force_wake.h"
>   #include "xe_gt_debugfs.h"
>   #include "xe_gt_printk.h"
>   #include "xe_guc_ads.h"
> +#include "xe_mmio.h"
>   #include "xe_pm.h"
>   #include "xe_pxp_debugfs.h"
>   #include "xe_sriov.h"
>   #include "xe_step.h"
> +#include "xe_vsec.h"
>   
>   #ifdef CONFIG_DRM_XE_DEBUG
>   #include "xe_bo_evict.h"
> @@ -185,12 +188,43 @@ static ssize_t wedged_mode_set(struct file *f, const char __user *ubuf,
>   	return size;
>   }
>   > +static ssize_t g8_residency_show(struct file *f, char __user *ubuf,
> +				 size_t size, loff_t *pos)
> +{
> +	u64 reg_val;
> +	char buf[32];
> +	int len = 0;
> +	int ret = 0;
> +	struct xe_device *xe;
> +	struct xe_mmio *mmio;
> +
> +	xe = file_inode(f)->i_private;

runtime_get/put missing

> +	mmio = xe_root_tile_mmio(xe);
> +	ret = xe_pmt_telem_read(to_pci_dev(xe->drm.dev),
> +				xe_mmio_read32(mmio, PUNIT_TELEMETRY_GUID),
> +				&reg_val,
> +				BMG_G8_RESIDENCY_OFFSET,
> +				sizeof(reg_val));

error needs to be handled?

> +
> +	drm_warn(&xe->drm, "G8 Residency read from mbx 0x%016llx, ret %d\n",
> +		 reg_val, ret);

warn gets flagged in CI. Remove this

> +
> +	len = scnprintf(buf, sizeof(buf), "%llu\n", reg_val);
> +
> +	return simple_read_from_buffer(ubuf, size, pos, buf, len);
> +}
> +
>   static const struct file_operations wedged_mode_fops = {
>   	.owner = THIS_MODULE,
>   	.read = wedged_mode_show,
>   	.write = wedged_mode_set,
>   };
>   
> +static const struct file_operations g8_residency_fops = {
> +	.owner = THIS_MODULE,
> +	.read = g8_residency_show,
> +};
> +
>   void xe_debugfs_register(struct xe_device *xe)
>   {
>   	struct ttm_device *bdev = &xe->ttm;
> @@ -211,6 +245,9 @@ void xe_debugfs_register(struct xe_device *xe)
>   	debugfs_create_file("wedged_mode", 0600, root, xe,
>   			    &wedged_mode_fops);
>   
> +	debugfs_create_file("g8_residency", 0444, root, xe,
> +			    &g8_residency_fops);

Since there are multiple residency files they can be under one folder 
maybe (/sys/kernel/debug/gtidle/) similar to the sysfs

> +
>   	for (mem_type = XE_PL_VRAM0; mem_type <= XE_PL_VRAM1; ++mem_type) {
>   		man = ttm_manager_type(bdev, mem_type);
>   
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.h b/drivers/gpu/drm/xe/xe_debugfs.h
> index 17f4c2f1b5e4..86868a3cd379 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.h
> +++ b/drivers/gpu/drm/xe/xe_debugfs.h
> @@ -8,6 +8,8 @@
>   
>   struct xe_device;
>   
> +#define BMG_G8_RESIDENCY_OFFSET			(0x540)
These should be in same file as register

Thanks
Riana> +
>   #ifdef CONFIG_DEBUG_FS
>   void xe_debugfs_register(struct xe_device *xe);
>   #else

