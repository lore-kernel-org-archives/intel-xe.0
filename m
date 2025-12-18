Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CDD4D68BE8
	for <intel-xe@archiver.kernel.org>; Thu, 18 Dec 2025 07:38:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05E1210E142;
	Thu, 18 Dec 2025 07:38:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BXokPbeo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A122010E142
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Dec 2025 07:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766043489; x=1797579489;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NneJ6Ly9JRyY/yan8vKo8QMySt2R+YyUWjfZ9V/F1Aw=;
 b=BXokPbeoeALB76qn6tzTQyRRoUKud3DD4N3mNBoN2r1eHD/LV6FVDx88
 mpz8DYav76TVqb3GUR1GxCTSY+LoTeB/PCIAtE7lOnj+B9Z9LnJmBBM31
 y5DwTsDytBlHkYCHGnih5HL71Tnkd5PXUXFg3U4HEjDopgh9lhQ7V8VLO
 uvRFNZdVqGqjq4ybd4+gPSGtHZkhe+ILJsBdat9opykGYcPCZYsRFbb3e
 L5rubgS9PBfy4sWPc7nqaVKXu85YS/5eAUTpXnGYyw2FtXImThG1IYyeS
 xRmCh/zwZrn+nLuTKE/OJflhGRS46obgoqsNmmKOjzFOcWYc+4uN+IC7U w==;
X-CSE-ConnectionGUID: 81JRcOx5T2+B2Wg9LPxsTA==
X-CSE-MsgGUID: A6q99mB9QHmU82rayzwWGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="79113480"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; d="scan'208";a="79113480"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 23:38:09 -0800
X-CSE-ConnectionGUID: gmEo3k+7R1qctR3eCWYH6w==
X-CSE-MsgGUID: 5oWfCxJUT+yN1vy2YAslww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; d="scan'208";a="198991560"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 23:38:08 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 17 Dec 2025 23:38:07 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 17 Dec 2025 23:38:07 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.39) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 17 Dec 2025 23:38:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hk5dtA8gypnegeFnALw7w1cmZmnb2ycGFOCUpNvUFW8kYI6QtOuqykn6yaBbauU5mV8/6smQnBLSbKKFLhg/WDTs/zwdWuwTTDLL53ShSk60lDdsMAzNTDLpoxSXDNVcrm56QEyaJzDAc50ZNqK8UulmnK9kl2XqBGXpD0h288KeISkTgi388HNbEUzKBHFDhUr1z/TdGvvodOh1/n7yKqtPIoKRp6h8Y2rnHFIXiSGCNUqH2f68su7NViQ+cFsQxUYXi1gWcC43SYlMLr+edRK4tU++gto0xcE99Atcx7D398VRZyighwWV0Ah96dft8w3iygMYt46SWIjenY+ABg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YyJOuZZl9PULy7pZ6kT3Er0HstvhzhEK7w268p2pHiE=;
 b=WRtSVvbhWJSL2xy6i4JNxiQt+Ngj3S+mL0NMuZYPSuuB9qo69asdu+FR1WZyDV10XKSdJQKn96jLe0okKmG1JmQgcp1qWzNZ1zi828FVi8MkHSvf1zD1W+BwUDA6bbaHoX75A9g3Hv1xPVmyqSQlX5nNPlysdWdDFsELnB97/WUfXE3KzMkUoDSSWJVFpZX4tQE8EuLfRUyIhebijF/wg3Rzq4oX7oON83/jtwuJTmxnxMM87rfT2UAAUTu1/o8/Dp9ylKWMmwRCyEFOeU7nGvl//THlSRwTo+G06Da9iOBKJkPGFqw6TYE5BaYY6j66eKmcvNMfcIc1gebC3vCOqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by MN0PR11MB6158.namprd11.prod.outlook.com (2603:10b6:208:3ca::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Thu, 18 Dec
 2025 07:38:04 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%4]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 07:38:04 +0000
Message-ID: <3849de5d-2cf9-4a06-b35f-428253a4e0d3@intel.com>
Date: Thu, 18 Dec 2025 13:07:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] drm/xe/hwmon: Expose temperature limits
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <rodrigo.vivi@intel.com>, <riana.tauro@intel.com>
References: <20251216114030.226399-1-karthik.poosa@intel.com>
 <20251216114030.226399-2-karthik.poosa@intel.com>
 <aULiyK1tWOxKZLI8@black.igk.intel.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <aULiyK1tWOxKZLI8@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0015.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:177::8) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|MN0PR11MB6158:EE_
X-MS-Office365-Filtering-Correlation-Id: 3aa1d07c-f65a-47ac-7bc0-08de3e0860bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d2xKOFVKTXorV2ZxSUVTS21QRG5rVytIWWlTQW1ZcDJ5UzVRY0FUTWxjVGFO?=
 =?utf-8?B?WWlTNVBWaUlacHlPamFqTWpGUDRoMTY2ZmJxajZrdEllQTRnT21oTkwyR3E2?=
 =?utf-8?B?VUgrWTFRVTB1dWhkRXI1dWNDM0VkTkVhR2tabFJ2MENmaWlRM2c1N2N6VkNp?=
 =?utf-8?B?ekdzRTVLbFQvTDZmZCs2TjhWYmNSTVZnTlJ2SHNQWEF0VmF4VVRuZUVaL3l4?=
 =?utf-8?B?N3JXMFhNaDdLeVhzRTNkSjhCOHhHWTZrd2JHUElaMmEwcFdncndKMmpEZXhl?=
 =?utf-8?B?d25HYnBpOGNUMktzR3VpQllSOXFCNlpnRVZ2UTVPQTZhSitveStwMjd1RDNN?=
 =?utf-8?B?M2ZOYkNiNXoxcytsVGRIYXFJTzFINStWVE9aMy9hSDJBZUlRMEgxM3h5Q1o2?=
 =?utf-8?B?dW1BeWNic1BEWUwyWnAwZ1QzSDQ2MjNXcG9mY0h0VVRyeXJCdjk1OTBUdFhE?=
 =?utf-8?B?MjFhbTR4NkpUd1RhOUJPN1BNU0k3Titta3A2NU91Y0ROUDM1SWZIdjVBYTFK?=
 =?utf-8?B?SnVXVC9jY00ySmg0K2dyNVFDNWNpWmNKRXYxcERZaVF1cGVFaWNYU3hVSWE0?=
 =?utf-8?B?T0ZFMW1OWGRQWmY4bE4xNjZuRUNGbzNYTFpsSm84ZnNXamY0S2J2bngyUEEw?=
 =?utf-8?B?L0UrV3N3akI4NTdSbkUrQXpFaTdYMXh6S0JLa0JyVk4xQ2l1Yk5FVUVRUzNB?=
 =?utf-8?B?UDZFM0FYM3FSWUs3Mm56ZjZyR2pBSlFrUW1YVTNGWnc2MUFpbjhSNlJpaytv?=
 =?utf-8?B?eTNxYStTOC9VWitvTkVvVWhBRWJWWHl1d25PZnJaSVhydWdlVHN6Nk5EZS9l?=
 =?utf-8?B?WHpPMk5QNlJQYW16MlVtZFdiSkFoZm8xdWs3WStOSXlGUGVTZkw0NGR5ZzR2?=
 =?utf-8?B?N3N6TDlEeDFCUGY0cDBSQ01RSXIrZ3RDdDg1RkV1UE43MVpRdFUzTkJvUE04?=
 =?utf-8?B?OG95VmJkSlFpUStTVXE2NVJxazIzWkN5K25ZUnV0TlpuOTJRMnVrdWJjdWNn?=
 =?utf-8?B?aW9GclVKbDFpYVJrMTVsZDk3Y0J6dmRTYnlSY29KSUhzMUdXRjZVcDZrVFVU?=
 =?utf-8?B?MHUxWTdpajd6TVdCM2l0K2k4VnBhVFNsd3lwZ3lvWDZSWFpGdWxCSzY5WERO?=
 =?utf-8?B?Q3NML1ZZN1BzRXEyV1FVdlUwUmtCUllZdzIwZ0dnbWdyczZqUEFKSnJjWGV0?=
 =?utf-8?B?cERkSnRaQ3BFc09qT2FwcHhwRVpzbDJJQlFSQ3piOU9Fdk9HUDBKYXhtMk9C?=
 =?utf-8?B?UHlNS3c4Z2pKNC9TMnNXY2pNZGY3MFhudEY0K29tN2NKOWhCZEo5ek1VN2dR?=
 =?utf-8?B?WHFQOU04V2w3dndWaDFuT0JyS3pYeXJyS0NkbjlwK1ZIaVJlQ1pjT2ZSRGVx?=
 =?utf-8?B?djFwbEZwdU5EdmNkaEFNajJGV2RFTHZYUEJxSTRFSmVFMGh3akl1cUtpWGVw?=
 =?utf-8?B?TnBCbjhES0pGYUJuZFVJdEZGVmNmU3c5dUFnSzBwZk5XbWlUNXpEdjMxQkhz?=
 =?utf-8?B?Y2Q2VzdldmpiVVh3VnhnWnJoVnFDUWlwRm5GZDVXMVlRRW0rMmdHelBJK2dk?=
 =?utf-8?B?cXhheXpCeWUwQ3d0SlVDWnVnMmVwQmxDek5SS0RzeEdKZDVRU1ZwaE03R2tl?=
 =?utf-8?B?UjIrY2pRT1lwRExxMTc1RnZJWGViYmtWTkVrMXJZbm03QzdjUzBoZ1I1dUl3?=
 =?utf-8?B?VVZBZUlIVkFHR2pEcU1BTGg3TnFKTFBpV0RKNTRiQkdWNm41UXNWaFdrdWZp?=
 =?utf-8?B?Wm9OdmxCL1RETEVmZHVRYTFBcVhMVjBJeTliSnh1amIxWmdZRnpPSWlDR3N1?=
 =?utf-8?B?ZmQvdU1SZ0hjaXFGdlpPQ1FFaW5tNzZOWTZMR1pvM0dIcWxUdTJhNVdDOW1K?=
 =?utf-8?B?MW8vQ2pXd3ovY3pLU2ZnTVpFQmtOWlNiN2tWS0E3MnJVR2dmaFp1YTRCOEhz?=
 =?utf-8?Q?kXmxUAJgmUtOubR4sb6yh2OA9S/4FKAe?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eVErcnNZSW8yS1NXUGhuTW45RVRPR05OazJndDFmdERvQ201YnJ5MDk0cXF6?=
 =?utf-8?B?SFEzcVlNRzdRUk96dFNoT3ZGdGkvVDIxOUdQWWJRRTVwOUNNVXBNUjIxUnA2?=
 =?utf-8?B?Z0VuaTIrQXFBZ0xiWUIyS0lvcnRnVncyakxGK3FnbEd0M3V2UE5aeEpFVGRZ?=
 =?utf-8?B?Nk1FMGU4OW1MeUtNNnlkanFBdE1WOEdkcG1FOHlYdVRRSHFXUHZFYTFDdWk1?=
 =?utf-8?B?NTFrTnUrc2ZVdEx6OUNJSHBqQzYrVktReTk3Q1NrbnlVS0FNVDE5YWo3dUl3?=
 =?utf-8?B?dUUvM05vblhDS0l4U0tGaFlUUmlPakxMdnMxYTRSQzhSekxUNUZiMThyUFdJ?=
 =?utf-8?B?SFBlZC80WkpXZVRZdFd4MmVaMEVTTUJ5Y1I3VGZwR3lGcFB5REVIT1M1Tmk0?=
 =?utf-8?B?b1d5ODRkZ29keVd2WHRoZ2Vza1RCVjE2K1JLWWhtRjg5OFhmbUNxNHZjMEpl?=
 =?utf-8?B?SVU0M211a29reE5nQkQ0Y1U5SDlXVkpRYVh3NWRQSnZRTTBDNjlTT2ViaWtW?=
 =?utf-8?B?cm5OM3Z2Q1VUbldnSjZJL3lXNG5wTXAyNlBJNlhhZ2YrRUgzWFhGcUhNb2Zi?=
 =?utf-8?B?VW16RFQxdHV2RHZ1bU11bzBZZ0Nna2s0c2txUmJyK3VicERvYklIaGRnL0pZ?=
 =?utf-8?B?MmZ4dllhdjFCU2Ewa0pKUFhZMVR6Z3JWTDNyVSt1SFFYeUlGUU9HVGhNMUlh?=
 =?utf-8?B?UE9YK1g5dVlGeTlyVWxHcEs5bVdlZUJhZ3A4MnF1bEVNR1pDdTJqcDhRallS?=
 =?utf-8?B?WG9nSnZTRThnMnBFd2VpSjhIMnhXYjhSNjhVOUY2R2pPZGg1UkVYSmt0S0lO?=
 =?utf-8?B?WUQzc042WlI2U2YwNGtKWXFwRnpxU2Z5OGxRaU5hWnNVa2xRcEUyZmVjZ0tM?=
 =?utf-8?B?NkNZdkNjaDFUVjBZQVVacVFveWhoMmg1bXhVUXVQOVZ4VVV6T3hHTENyVlh5?=
 =?utf-8?B?cjI4VzBkblVjL0Ryb0NTc01nNFFGYUhtZ1cvdlFqdVo4ZjNNZ2NodW93R2Zm?=
 =?utf-8?B?N3NaTW5ERGYwMFlwQ1J4ck1LZlJwdVZPcTA5RHEreHRodkNvN3pwYmRCV0s1?=
 =?utf-8?B?R2RKUm9pSHFDWHRCalRPaEtBZDAxVVIxcXhkTzhUOTNzeUllQ3dCS2VReGFw?=
 =?utf-8?B?NVhWWFp6UlZKbGsyczF6Z3l5R0p5UWlaRTUzSWY5RUJ1TjBoY0lkNTBMSldL?=
 =?utf-8?B?U3RFWTJUUk1mOFZkL01Hb0lJWk9ZelowQ3MvaEY2NHRtOVBldmJKSnRYemg4?=
 =?utf-8?B?OXRIVmkxaUFLSjAzMFR1SXJnbHdtN1BQcHc2VVRVaXJaWGlnK2UyYU51cEt0?=
 =?utf-8?B?RjRwL1k3SC9hQkpxbVJxMXJiOUlPelV0K2Q3ZVUwaHROWE5xRlBGMCswVnhX?=
 =?utf-8?B?aHF0ZFdqY0RZV3IrSDJGci9UZDNXcnJRMUZIMFp0Zk5sbm91MG5xby93L1lN?=
 =?utf-8?B?Z2ZtcXM5bnJKa2lJZFg5aHRWcUptVTdsbE9PeDRDYjZlOFM4V21lYlZsb0ww?=
 =?utf-8?B?cUl5a21LMlVnc1JQTWlKTVhDRmlneVBxVzRxb25qOFY4a0dkSHYvTTRzekFJ?=
 =?utf-8?B?ckJZRkpRTzMvVm05OWFET0FqTS9MQnR3Tm0wSktzYUNxck5VdXhsU1BDMENG?=
 =?utf-8?B?ZkR1MHFwek5GT05mZllUU1pQNzJvRlZiZkVXUlQvSytxa3B4ajBsUEdFMlVz?=
 =?utf-8?B?Q2VvL2ZISjYzNE9zNmdkanBUbGtYS2Nsd2NzWENJUlIyaC9kUmROSmlIa2R4?=
 =?utf-8?B?MDVDeTE3R01nWTI4U2xTeFBUZnIwWkxPNWxuU1ZQTHJ0bm5MTlRnb2x2TEpq?=
 =?utf-8?B?cVlPcTZrZmVhYWlGR0tobndzMXREQVA2d3VpUlJGNlg4MFBIMGt6Y05TKzdY?=
 =?utf-8?B?N0poY2ZyUWFYZFk5NzBROHhtZ0VaSzRGeHJBNEM5SE56eiszUkJ6bEwzc255?=
 =?utf-8?B?czY2d0NVVC8zU09Iems2aStZM292WFNqQ1R0VGVFam9wSEgwWUVnZ3ZnOFRJ?=
 =?utf-8?B?OG5nejRkSVZ0WDN3aG9kdGFrYURvbktEdjhMZTZLOHRYV2pjSGdZOHN3TER6?=
 =?utf-8?B?NURsZ1pYa1ZPS3JrNWFzWTFMUGF4Mk5mY3RuMG04ak5Qc1dWWWE3djRyRDV2?=
 =?utf-8?Q?1TDw0K//Y0OEROD58rAaQqSng?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3aa1d07c-f65a-47ac-7bc0-08de3e0860bc
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 07:38:04.1507 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n+JhHECTdKfpHKXlJ+3y9qRyVds/M2AuFa3P0Ow05/meHwrH+mNcBLgPtkjcenAon65KkJAxWE1x814NLKAAtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6158
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


On 17-12-2025 22:35, Raag Jadav wrote:
> On Tue, Dec 16, 2025 at 05:10:27PM +0530, Karthik Poosa wrote:
>> Read temperature limits using pcode mailbox and
>> expose shutdown temperature limit as tempX_emergency,
>> critical temperature limit of as tempX_crit and
>> GPU average temperature limit as tempX_max.
>>
>> Update Xe hwmon documentation for these entries.
>>
>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>> ---
>>   .../ABI/testing/sysfs-driver-intel-xe-hwmon   |  40 ++++++
>>   drivers/gpu/drm/xe/xe_device_types.h          |   3 +
>>   drivers/gpu/drm/xe/xe_hwmon.c                 | 116 +++++++++++++++++-
>>   drivers/gpu/drm/xe/xe_pci.c                   |   5 +
>>   drivers/gpu/drm/xe/xe_pci_types.h             |   1 +
>>   drivers/gpu/drm/xe/xe_pcode_api.h             |   3 +
>>   6 files changed, 164 insertions(+), 4 deletions(-)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>> index d9e2b17c6872..c8f211c336be 100644
>> --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>> @@ -196,3 +196,43 @@ Description:	RW. Package burst power limit interval (Tau in PL2/Tau) in
>>   		milliseconds over which sustained power is averaged.
>>   
>>   		Only supported for particular Intel Xe graphics platforms.
>> +
>> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp2_emergency
>> +Date:		December 2025
>> +KernelVersion:	6.19
>> +Contact:	intel-xe@lists.freedesktop.org
>> +Description:	RO. Package shutdown temperature in millidegree Celsius.
>> +
>> +		Only supported for particular Intel Xe graphics platforms.
>> +
>> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp2_crit
>> +Date:		December 2025
>> +KernelVersion:	6.19
>> +Contact:	intel-xe@lists.freedesktop.org
>> +Description:	RO. Package critical temperature in millidegree Celsius.
>> +
>> +		Only supported for particular Intel Xe graphics platforms.
>> +
>> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp2_max
>> +Date:		December 2025
>> +KernelVersion:	6.19
>> +Contact:	intel-xe@lists.freedesktop.org
>> +Description:	RO. Package average temperature limit in millidegree Celsius.
>> +
>> +		Only supported for particular Intel Xe graphics platforms.
>> +
>> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp3_emergency
>> +Date:		December 2025
>> +KernelVersion:	6.19
>> +Contact:	intel-xe@lists.freedesktop.org
>> +Description:	RO. VRAM shutdown temperature in millidegree Celsius.
>> +
>> +		Only supported for particular Intel Xe graphics platforms.
>> +
>> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp3_crit
>> +Date:		December 2025
>> +KernelVersion:	6.19
>> +Contact:	intel-xe@lists.freedesktop.org
>> +Description:	RO. VRAM critical temperature in millidegree Celsius.
>> +
>> +		Only supported for particular Intel Xe graphics platforms.
> As per hwmon documentation all these attributes are RW so they don't
> match with ABI expectations.

1. These are read only values for our hardware, write is not supported.

2. Couple of other drivers are also supporting readonly for temp_crit.

Ex:

a) drivers/net/ethernet/broadcom/bnxt/bnxt_hwmon.c - bnxt_hwmon_is_visible

75 static umode_t bnxt_hwmon_is_visible(const void *_data, enum 
hwmon_sensor_types type,
  76                                      u32 attr, int channel)
  77 { 82
  83         switch (attr) {
  86         case hwmon_temp_max:
  87         case hwmon_temp_crit:
  88         case hwmon_temp_emergency:
  89         case hwmon_temp_max_alarm:
  90         case hwmon_temp_crit_alarm:
  91         case hwmon_temp_emergency_alarm:
  92                 if (!(bp->fw_cap & 
BNXT_FW_CAP_THRESHOLD_TEMP_SUPPORTED))
  93                         return 0;
  94                 return 0444;

b) . drivers/hwmon/intel-m10-bmc-hwmon.c -

static const struct hwmon_ops m10bmc_hwmon_ops = {
         .visible = 0444,
         .read = m10bmc_hwmon_read,

3. hwmon also doesn't report any violation for 0444 return from 
xe_hwmon_temp_is_visible.

>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index 413ba4c8b62e..8e6dd2665596 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -321,6 +321,9 @@ struct xe_device {
>>   		 * pcode mailbox commands.
>>   		 */
>>   		u8 has_mbx_power_limits:1;
>> +		/** @info.has_mbx_thermal_info: Device has support for thermal mailbox commands.
>> +		 */
> Can be one line.
>
>> +		u8 has_mbx_thermal_info:1;
>>   		/** @info.has_mem_copy_instr: Device supports MEM_COPY instruction */
>>   		u8 has_mem_copy_instr:1;
>>   		/** @info.has_mert: Device has standalone MERT */
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
>> index ff2aea52ef75..66a8c3e40027 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>> @@ -53,6 +53,14 @@ enum xe_fan_channel {
>>   	FAN_MAX,
>>   };
>>   
>> +enum xe_temp_limit {
>> +	TEMP_LIMIT_PKG_SHUTDOWN,
>> +	TEMP_LIMIT_PKG_TJMAX,
>> +	TEMP_LIMIT_MEM_SHUTDOWN,
>> +	TEMP_LIMIT_PKG_CRIT,
>> +	TEMP_LIMIT_MEM_TJMAX,
>> +};
>> +
>>   /* Attribute index for powerX_xxx_interval sysfs entries */
>>   enum sensor_attr_power {
>>   	SENSOR_INDEX_PSYS_PL1,
>> @@ -111,6 +119,18 @@ struct xe_hwmon_fan_info {
>>   	u64 time_prev;
>>   };
>>   
>> +/**
>> + * struct xe_hwmon_thermal_info - to store temperature data
>> + */
>> +struct xe_hwmon_thermal_info {
>> +	union {
>> +		/** @limits: temperatures limits */
>> +		u8 limit[8];
> What are the magic numbers? Can we have proper defines?

We can use xe_temp_limit max value and keep remaining bytes as reserved.

>
>> +		/** @data: temperature limits in dwords */
>> +		u32 data[2];
>> +	};
>> +};
>> +
>>   /**
>>    * struct xe_hwmon - xe hwmon data structure
>>    */
>> @@ -137,7 +157,8 @@ struct xe_hwmon {
>>   	u32 pl1_on_boot[CHANNEL_MAX];
>>   	/** @pl2_on_boot: power limit PL2 on boot */
>>   	u32 pl2_on_boot[CHANNEL_MAX];
>> -
>> +	/** @temp: Temperature info */
>> +	struct xe_hwmon_thermal_info temp;
>>   };
>>   
>>   static int xe_hwmon_pcode_read_power_limit(const struct xe_hwmon *hwmon, u32 attr, int channel,
>> @@ -677,8 +698,11 @@ static const struct attribute_group *hwmon_groups[] = {
>>   };
>>   
>>   static const struct hwmon_channel_info * const hwmon_info[] = {
>> -	HWMON_CHANNEL_INFO(temp, HWMON_T_LABEL, HWMON_T_INPUT | HWMON_T_LABEL,
>> -			   HWMON_T_INPUT | HWMON_T_LABEL),
>> +	HWMON_CHANNEL_INFO(temp,
>> +			   HWMON_T_LABEL,
>> +			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT |
>> +			   HWMON_T_MAX,
>> +			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT),
>>   	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL | HWMON_P_CRIT |
>>   			   HWMON_P_CAP,
>>   			   HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL | HWMON_P_CAP),
>> @@ -689,6 +713,23 @@ static const struct hwmon_channel_info * const hwmon_info[] = {
>>   	NULL
>>   };
>>   
>> +static int xe_hwmon_pcode_read_thermal_info(struct xe_hwmon *hwmon)
>> +{
>> +	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
>> +	int ret = 0;
>> +
>> +	if (!hwmon->xe->info.has_mbx_power_limits)
>> +		return -EOPNOTSUPP;
>> +
>> +	/* Read thermal info */
>> +	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_LIMITS, 0),
>> +			    &hwmon->temp.data[0], &hwmon->temp.data[1]);
>> +	drm_dbg(&hwmon->xe->drm, "thermal info read ret %d, val 0x%x val1 0x%x\n", ret,
>> +		hwmon->temp.data[0], hwmon->temp.data[1]);
>> +
>> +	return ret;
>> +}
>> +
>>   /* I1 is exposed as power_crit or as curr_crit depending on bit 31 */
>>   static int xe_hwmon_pcode_read_i1(const struct xe_hwmon *hwmon, u32 *uval)
>>   {
>> @@ -787,6 +828,34 @@ static umode_t
>>   xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>>   {
>>   	switch (attr) {
>> +	case hwmon_temp_emergency:
>> +		switch (channel) {
>> +		case CHANNEL_PKG:
>> +			return hwmon->temp.limit[TEMP_LIMIT_PKG_SHUTDOWN] ? 0444 : 0;
>> +		case CHANNEL_VRAM:
>> +			return hwmon->temp.limit[TEMP_LIMIT_MEM_SHUTDOWN] ? 0444 : 0;
>> +		default:
>> +			return 0;
>> +		}
>> +		break;
>> +	case hwmon_temp_crit:
>> +		switch (channel) {
>> +		case CHANNEL_PKG:
>> +			return hwmon->temp.limit[TEMP_LIMIT_PKG_TJMAX] ? 0444 : 0;
>> +		case CHANNEL_VRAM:
>> +			return hwmon->temp.limit[TEMP_LIMIT_MEM_TJMAX] ? 0444 : 0;
>> +		default:
>> +			return 0;
>> +		}
>> +		break;
>> +	case hwmon_temp_max:
>> +		switch (channel) {
>> +		case CHANNEL_PKG:
>> +			return hwmon->temp.limit[TEMP_LIMIT_PKG_CRIT] ? 0444 : 0;
>> +		default:
>> +			return 0;
>> +		}
>> +		break;
>>   	case hwmon_temp_input:
>>   	case hwmon_temp_label:
>>   		return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_TEMP, channel)) ? 0444 : 0;
>> @@ -807,10 +876,46 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>>   
>>   		/* HW register value is in degrees Celsius, convert to millidegrees. */
>>   		*val = REG_FIELD_GET(TEMP_MASK, reg_val) * MILLIDEGREE_PER_DEGREE;
>> -		return 0;
>> +		break;
>> +	case hwmon_temp_emergency:
>> +		switch (channel) {
>> +		case CHANNEL_PKG:
>> +			*val = hwmon->temp.limit[TEMP_LIMIT_PKG_SHUTDOWN] * MILLIDEGREE_PER_DEGREE;
>> +			break;
>> +		case CHANNEL_VRAM:
>> +			*val = hwmon->temp.limit[TEMP_LIMIT_MEM_SHUTDOWN] * MILLIDEGREE_PER_DEGREE;
>> +			break;
>> +		default:
>> +			*val = 0;
> Do you need this?
>
>> +			return -EOPNOTSUPP;
>> +		}
>> +		break;
>> +	case hwmon_temp_crit:
>> +		switch (channel) {
>> +		case CHANNEL_PKG:
>> +			*val = hwmon->temp.limit[TEMP_LIMIT_PKG_TJMAX] * MILLIDEGREE_PER_DEGREE;
>> +			break;
>> +		case CHANNEL_VRAM:
>> +			*val = hwmon->temp.limit[TEMP_LIMIT_MEM_TJMAX] * MILLIDEGREE_PER_DEGREE;
>> +			break;
>> +		default:
>> +			*val = 0;
> Ditto.
>
>> +			return -EOPNOTSUPP;
>> +		}
>> +		break;
>> +	case hwmon_temp_max:
>> +		switch (channel) {
>> +		case CHANNEL_PKG:
>> +			*val = hwmon->temp.limit[TEMP_LIMIT_PKG_CRIT] * MILLIDEGREE_PER_DEGREE;
>> +			break;
>> +		default:
>> +			return 0;
>> +		}
>> +		break;
>>   	default:
>>   		return -EOPNOTSUPP;
>>   	}
>> +	return 0;
>>   }
>>   
>>   static umode_t
>> @@ -1263,6 +1368,9 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
>>   	for (channel = 0; channel < FAN_MAX; channel++)
>>   		if (xe_hwmon_is_visible(hwmon, hwmon_fan, hwmon_fan_input, channel))
>>   			xe_hwmon_fan_input_read(hwmon, channel, &fan_speed);
>> +
>> +	if (xe_hwmon_pcode_read_thermal_info(hwmon))
>> +		drm_dbg(&hwmon->xe->drm, "Thermal mailbox support not present in firmware\n");
>>   }
>>   
>>   int xe_hwmon_register(struct xe_device *xe)
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index 673761c8623e..a47637900e84 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -311,6 +311,7 @@ static const struct xe_device_desc dg2_desc = {
>>   	.has_display = true,
>>   	.has_fan_control = true,
>>   	.has_mbx_power_limits = false,
>> +	.has_mbx_thermal_info = false,
> Why?
>
>>   };
>>   
>>   static const __maybe_unused struct xe_device_desc pvc_desc = {
>> @@ -328,6 +329,7 @@ static const __maybe_unused struct xe_device_desc pvc_desc = {
>>   	.vm_max_level = 4,
>>   	.vram_flags = XE_VRAM_FLAGS_NEED64K,
>>   	.has_mbx_power_limits = false,
>> +	.has_mbx_thermal_info = false,
> Ditto.
>
>>   };
>>   
>>   static const struct xe_device_desc mtl_desc = {
>> @@ -365,6 +367,7 @@ static const struct xe_device_desc bmg_desc = {
>>   	.has_fan_control = true,
>>   	.has_flat_ccs = 1,
>>   	.has_mbx_power_limits = true,
>> +	.has_mbx_thermal_info = true,
>>   	.has_gsc_nvm = 1,
>>   	.has_heci_cscfi = 1,
>>   	.has_i2c = true,
>> @@ -418,6 +421,7 @@ static const struct xe_device_desc cri_desc = {
>>   	.has_flat_ccs = false,
>>   	.has_i2c = true,
>>   	.has_mbx_power_limits = true,
>> +	.has_mbx_thermal_info = true,
>>   	.has_mert = true,
>>   	.has_pre_prod_wa = 1,
>>   	.has_sriov = true,
>> @@ -681,6 +685,7 @@ static int xe_info_init_early(struct xe_device *xe,
>>   	/* runtime fusing may force flat_ccs to disabled later */
>>   	xe->info.has_flat_ccs = desc->has_flat_ccs;
>>   	xe->info.has_mbx_power_limits = desc->has_mbx_power_limits;
>> +	xe->info.has_mbx_thermal_info = desc->has_mbx_thermal_info;
>>   	xe->info.has_gsc_nvm = desc->has_gsc_nvm;
>>   	xe->info.has_heci_gscfi = desc->has_heci_gscfi;
>>   	xe->info.has_heci_cscfi = desc->has_heci_cscfi;
>> diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
>> index 3bb51d155951..34d2b66188e4 100644
>> --- a/drivers/gpu/drm/xe/xe_pci_types.h
>> +++ b/drivers/gpu/drm/xe/xe_pci_types.h
>> @@ -48,6 +48,7 @@ struct xe_device_desc {
>>   	u8 has_late_bind:1;
>>   	u8 has_llc:1;
>>   	u8 has_mbx_power_limits:1;
>> +	u8 has_mbx_thermal_info:1;
>>   	u8 has_mem_copy_instr:1;
>>   	u8 has_mert:1;
>>   	u8 has_pre_prod_wa:1;
>> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
>> index 975892d6b230..a3bff76a074d 100644
>> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
>> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
>> @@ -65,6 +65,9 @@
>>   #define       FAN_TABLE				1
>>   #define       VR_CONFIG				2
>>   
>> +#define	PCODE_THERMAL_INFO			0x25
>> +#define	READ_THERMAL_LIMITS			0x0
> Does this match with spacing convention and ordering?
>
> Raag
>
>>   #define   PCODE_FREQUENCY_CONFIG		0x6e
>>   /* Frequency Config Sub Commands (param1) */
>>   #define     PCODE_MBOX_FC_SC_READ_FUSED_P0	0x0
>> -- 
>> 2.25.1
>>
