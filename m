Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A4AFCCD1BC
	for <intel-xe@archiver.kernel.org>; Thu, 23 Oct 2025 05:07:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C21FD10E869;
	Thu, 23 Oct 2025 05:07:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R65ERNxD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8298310E869
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Oct 2025 05:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761196064; x=1792732064;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=UqHpdxz3ypjbMUCLJ+SAbyuQlU8+M6t2O6l1dne3BVM=;
 b=R65ERNxD98bQY4a33ZQ+5XfNDYdE1mjppvW3JJ/GqVBIxTB5rpzTBMEl
 W4Fbn0ozTzuDbKcBc6cJWi/vu55t+UQTPw7OHjh/zUFI18xANpkMOan/F
 F+yeJJ2YMjfhL/w5axW2qNHE3s/J4mcUrlgIusobJO3+DPY/FsVUyS/3O
 gnm756V5q/n259qYqqD+cvvPfLXpqw03OX6qj+q2jjLH3PJa7podqCnhD
 KzdkNAIzFjOuVQXacU4QDti+3ec9AQlYwbJCLbMTAFhH1pStCL4OSj3tV
 n1BpK7HWGGWD6BcNX0BpVME5UMINWgrH4SfArktE2ozCF6KdCQ422IEfZ g==;
X-CSE-ConnectionGUID: VFoIjDf0RKS9opxgp3yZnw==
X-CSE-MsgGUID: cwkYKKp6StumRwb+mM3U6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63059253"
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; d="scan'208";a="63059253"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 22:07:44 -0700
X-CSE-ConnectionGUID: BUGSYLbDTkKYlbsDALv18A==
X-CSE-MsgGUID: xqzsyNdZSlSqy9oqODrUaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; d="scan'208";a="184831927"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 22:07:44 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 22:07:43 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 22 Oct 2025 22:07:43 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.55) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 22:07:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FyfHKxMN8IEnK/Wutgg6xxHip207mkAfx6B12FI/KlLB6DTKVKtCqi17Hc7QaZWhHnbMBKG7EeYEDJGsshGv1p4S0LVbYSRlg1Z7rNjkgQkJPXOkKdozlkJ9uIJWWjh7u6nCnFZQOOiiWWQjDL84MyXdb5brOJjeoDXHq5diXra/9qfzeW1Qm/Fybnn2n+Zod6zWp00P6BwcpJX8ATLb0EIbN/vmfGSeo7GR9k+nfqf6yMYAeDHfyoB8ahg9g841MkUCg8ukWuPh0snVZfnmcP3FA8kvI7/agroLsqPuTG7dQn5k/VqGu++5E8m+4dJ7Fyl8bWbiJ9nzYIaKbSy2aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=arLiyUevKbei4quc0RczUKQfjUlSxKgX7X1cqBfABC0=;
 b=qOq2z7SuYIgakGGbGKXec3KG5iohSFTMWUxD79H98lMsyd527bgBKHIeZbgSC+mim3MHe0ARSMlEVHqSN53vui6O9zLmQ9SwpQiK3uD8MqzA402nNc5gbaibICPQvx2F103AXPQ23TSvls0EM2EpuxvsU6CwwIonPVYrgZOYsUTZjS29do+YTx9B1wl31lf9LmseAfBk4+rGRf2m7EXGpZPVcYcv5/Xowr1J92Jz0kWcGjDzQoAGaAQRoUD+vgWnnZTdF8ZNDdSi/8oqnuFwrVdNHsIg9a84t8zgD+lzghQ4Bnjx5UO6XL2XLpPXkqsApGkIXEgmH1Dy44FccS8JDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by DS4PPFCECA32305.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::51) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Thu, 23 Oct
 2025 05:07:42 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::803d:39cb:d276:4ee5]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::803d:39cb:d276:4ee5%5]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 05:07:41 +0000
Message-ID: <904e8691-fb2c-4f81-b4f4-1ef24042dfaa@intel.com>
Date: Thu, 23 Oct 2025 10:37:34 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Use SVM range helpers in PT layer
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20251022230122.922382-1-matthew.brost@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20251022230122.922382-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0093.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d4::19) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|DS4PPFCECA32305:EE_
X-MS-Office365-Filtering-Correlation-Id: 926872f6-7f8b-4f97-f20f-08de11f217eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z3NBbmZhRVBQei9WYVBTd1liTWxlVDdjcmZBWTBOcE5ZRUtHMlJORk9NeEp3?=
 =?utf-8?B?cjlQQVlCSGpISHdsWnRIRTEyN1ExQlg2RjFqT0dYYWFpQzliVDQ3djF1cVRn?=
 =?utf-8?B?TGx2dlc2bXpPYk94YlVCN1hKVTRhN0hjbkRRb09PWTJRUWptaEpGeTMxN043?=
 =?utf-8?B?Ny9PSnpMQlE2RnlDaGo4aUR6WmFzVXUyVkpLN2haQk5INW9EQlM2WDNBWkV3?=
 =?utf-8?B?V2RmMGxVWVdmTGJtTHJ2a0pXd3krV01leHowdlU0akx3SDc0eTdoaEFLTTcr?=
 =?utf-8?B?ZTcveWdBblFPTXN4TzNzaVVyVU1zOEFUYmZ3MnZEazFRbHpLR3FuL1pYZXh2?=
 =?utf-8?B?bFRHdFEwQ1ZWRld6UjREWmpQWG5WS1FEQ3ErcnZMZkowZjdEdHdxdEw5WFg4?=
 =?utf-8?B?ekhqdldQUlUwME1JUmV2NlpHN0pCR1FXN3NubjkyVE1JL1lMVDVFR1lURWZF?=
 =?utf-8?B?Ym43MGsxaFk2L1FpaDhGTWJ0eDV0cWdDdFIrQWxCL2lxQjk5bUFHMkNZa2xp?=
 =?utf-8?B?T1g1S2JXc1NzVVpSajhWV2JWeUVCS05pYmlWMUMzOFdvTVpTSHRrSU9nSGRG?=
 =?utf-8?B?SHowNjZSeFRBR1l4aDhWUlR2bEJabmc3dVhBQ1BvRmZsdUliNzFqMmRURmF2?=
 =?utf-8?B?OTQzTjJIUEJzQXp1dWxLeHFtUXl5ZWxvU094Vys4ZWZZMW14MU9memg3S05m?=
 =?utf-8?B?NTRzTkRHamRkbFJDUTlnYnJ2bGxla1c0Unl4bEJndFNEWkNPNGFpbnR3eVVE?=
 =?utf-8?B?NnIzUE8rL3hOUnZ0QzVNM3FiNW9JOGJaNnZLU2hYeHJUWDZRTldiMGtmMVg1?=
 =?utf-8?B?VFlXSm0wcXdnOHRCenllUkM3TnpuLzJ6WVBHNTYrdDVKMEhESHA5Zkh0eGxq?=
 =?utf-8?B?QjlSaVRpUGVlNDU2Snc0dEdONlk1MmZteTVZeXozMCtadnhhZHVrYjZmdVE4?=
 =?utf-8?B?TzFIa2JIMmlybHJJQko0Z2F5SW5tMmttaXdzWnIxaktWV0hzRkNRU2R6RjJD?=
 =?utf-8?B?T2VFcUNUSHBZY2hsUWY2S0tLUncrUm1HSUw5QUh5Z29zbXN3OGR3N20vVHNy?=
 =?utf-8?B?V0tvVUpNdHlnSHlWN0ZRc2ZqMm5ocDBPREdTeHQwUGlVSDJvdVZOOXpvcHR6?=
 =?utf-8?B?dWFZVm5aTER1b3hCMzN2ejNKTmVXRWlrcTc5YjhvVVNhSEhtK01BcXpRNTZL?=
 =?utf-8?B?ZXlMZVJMdTlaZGF4akJXangzZDl6VjBRY3Z2Ky9KRTkyL3g5NTBrZU9xeDJS?=
 =?utf-8?B?RXlla1ZzZFdGbUUyR29sR0hWM25abG9iK3JOSXNUVGNwMkcwc3pLZ0NvMWxl?=
 =?utf-8?B?NEVBK0kzWitacSs1cTU4VEFjL0JRclFlK2V1RkgwYm5kVk1ieUd0TFcwQ1ZM?=
 =?utf-8?B?TzZ0RkVlUDgzMk9ldEhJNlZIYlVPN0xkaElvVUNqYjJzNzhnR0QyWk1Ocnh3?=
 =?utf-8?B?T3RqU3BKRWlkN2w0TkkrRVRyVWwwVjN5dE9xdzN4c0xXSU5Cd2J3bk9KeWlO?=
 =?utf-8?B?cmIxdFdzZ1BBcGI1bzNQQlhrSXR6TnBOeVJMVndadDFudk8wMW4xNHQ2cVY3?=
 =?utf-8?B?aWlMcFR3c2xlOVRTY3d5dXJCMnVUa09pdkMzRVRlMWdXL2pJNkNmQlpiU2Ni?=
 =?utf-8?B?OHgzYlZRWEY5c0I3Z1IvWHAzMmpoRnQ1Ly9oWWplTlc1Rm9hVFRLeit0UnZ6?=
 =?utf-8?B?WVVPQVF6VHBqZkV2TXp3b1ZXMDVVNFVCV3A3NnQwMnR0MXk4bll6dmJheUY1?=
 =?utf-8?B?MDFkSWRBM3NMNERRam9xY1p2VnpMQXRhMzcybytYYXljK1JDRjdLY3FUT3Bz?=
 =?utf-8?B?QU56UFVLMUQzY043ZzJKWnZ3OWU0UnE5MGhRSnVDbHZHdUZXN29qYm03cFh6?=
 =?utf-8?B?TGJtSnBXdzNPdzBRbE1jZ0xMU01UbmRlTUdEbG5aVjVXTGl2d2dWZlJWdnNX?=
 =?utf-8?Q?PZCJr8dhQslmdvdQGDKFPdyT58m5ov+x?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YmxuMVgvcCs2TjJXalFPaGpUN2c4SzRHak1WT2lOeFdGdGZuY1YvZXpoaFRn?=
 =?utf-8?B?N0ZWSXFVc0t1bmkwbTVpN1JUUlNvaUllZTNpcDhXRTBGRHRzVExEbngwTUkw?=
 =?utf-8?B?NjllUEdpR09yNnpIVzFzYVRRYjZRaTV1SGpyZzRZbVlUbThBbXNaNTRpZytL?=
 =?utf-8?B?MWtWYnNBY1IzbTRVdmhHQXpnUGxMVjhWVFN0K2lnck1rUGNrTlFXNkpBVytI?=
 =?utf-8?B?c1N0bXI2RVhrR0xQdTYyN0pZN1E0S0trVGx5U0ZWWXZIbFhSaW40bkFWcGt2?=
 =?utf-8?B?K1RhNmNFY2IveEpPZTJBQmVtcUxJd05nNXM4WTMvRXZyRzhMdDFoS25jc3VR?=
 =?utf-8?B?b1VOUDVwRmRFVzNCa29Qa2dFY2I0K01Ib203OE9zVDFUNzFqWExyaVMxRDdT?=
 =?utf-8?B?Qjl2TldaTGlBNzA2RmZXMDNKNHJEY3dvUm8zbldrZU9XcW9PZkd4dXZEWXJh?=
 =?utf-8?B?SEN1ZWhjdjVuRnNwZDlwOFJlYmVqUGQwQTQwRGZ4VGxVK0ovOFA2OGN3dUt0?=
 =?utf-8?B?b25MSEdWcWhoQXJCZHdoYmIvRVRmMFpMd2VOS1haZ0VNYnJNUDJ3MFJpZURS?=
 =?utf-8?B?MkpqRDMwL2I5WXhXc0lTQW4yeXRPS1hiYlBVamFFZ3pOS1AwMHcyeEo4SWFx?=
 =?utf-8?B?WjVFbGRrMHVuVmhIWXNLUVZpZ2E0VWdjZkNxTnNDRVc5NENLN0NRQ2ZxaHNT?=
 =?utf-8?B?RFRzL212c2R1bm8weUJIeGsyd1BDUUROODUvZCtsOGZPVEpzVjJEa0ZudktM?=
 =?utf-8?B?bWIzNjBTS2lVbmRiYmk5SEJpYklKL3pnYmtTWlo4SktSSmZuRTE4NGdBUVdG?=
 =?utf-8?B?ajI3QzNRamtsWFhQR1FmbVBtTXRNZi9sTU5DYnhwSFNzQ2lNVmIyTzNLL0hO?=
 =?utf-8?B?YUt5Q0lRUHN4cWw3YUhWbzhZU3NKUDNmN2EvNlJXQ2lsa0pOWWRHUWVRZUY3?=
 =?utf-8?B?U1VQZHlWYm9OalQvMlZ4Q1p3SFNBcTYyMEsvRWhSdms0S2p2cU1nWTNQTkhu?=
 =?utf-8?B?K3p6OWRoazl3UUpOMTRVM1R0cTVvc0VUMGorbDJaU0UwalozdnBOZE55dU02?=
 =?utf-8?B?YldWUWh1K2hIL1E1T2tCdGcvejVvUXljMlJGcXRQWlpyRFlYQU9JSEMvQk5V?=
 =?utf-8?B?TUU4NFJ1YTZGYWdMS3pKc05TUjB2RzRpM0ZKK3ZSN3Nrdk5qK3kyb2syR2FL?=
 =?utf-8?B?MGRNNVhKTVc4Y3ZLZTdyQ3pzbW1iUUFJeTFrSHk0MlFCdTVnamxzcFBsTzdD?=
 =?utf-8?B?SHBCYS9pYUJ1ck9zSFZ5TDR3OGUva29DY2F2Z3BpenoxcXFIY29pVUpYM0pQ?=
 =?utf-8?B?QW41ejVnQ0x0M0JhQVNMNkpwNktHZStxYVQ4TTdRbEM0ZEdtL0pDOEJBeC8v?=
 =?utf-8?B?STFTT0NNS1JFaWFNRlBvaWFxSzBmUTYxb1ZWL1F6UlNLVSsraEFicGhOZW1Y?=
 =?utf-8?B?b0ladEtuWGdyTkZ0SlhRYjZNQS9mVmovUXoyVzFRWHhxamRFTUtRQytjckgv?=
 =?utf-8?B?bUhVOVEvUERvREVFTzhzcVUzMURhZEpHSWxOWGdJR3NjTk1EVGkzOFg5SG0r?=
 =?utf-8?B?by9LdmN0NnhRdGdreWo4bWNSZXJhdmhtVUpjUWw2aGZqVzFEODhISVRGN1JN?=
 =?utf-8?B?bDhEdGU0amgzNUdNWkoxaVgrTndyYklLM2FMVExxai9KQTFGUzhIbDIzalhP?=
 =?utf-8?B?VFZaU2FWRlZWWDFPME5FYjcvZTRydTVQZVR3T1NZajBkSndxa25FdllmWCtK?=
 =?utf-8?B?Z0Q4ajFqeWNhbGZGdVhSbGRpVUUvT3U1NTQ3WmhnTEExZzUxQVJTUEpoMTVI?=
 =?utf-8?B?ZHgyRDA2YnZJM0NxT05vakQ3ZmgzRlJpVENHYzBQS3ZKMy85ZmdBQ3Vyd05Q?=
 =?utf-8?B?L0ZvT2RmQU5hVDBYbHF0UzFuV1NOZXFRdFhhSE13R0J4cFVsUzZOU3pNTnNV?=
 =?utf-8?B?SG1vTXd1V29xeDB2RHpiUFNuKzMvVFRZcnBSS0c4WkpjNjZubG5sQ2NqSG5P?=
 =?utf-8?B?SEk1ODNscUxxVVlkajJpMDZPdEtvVHlQeXRKZUNmQ0NBUFRub0FkVk00aXp0?=
 =?utf-8?B?dzR1YkN3cHZrWVV4a20yU3ZoemNmWVlzdjZLNmpVRGxVaTRBRHZML0dTQ1Ur?=
 =?utf-8?B?VXBPNWVkcUlJM0ZldmVjL1d2TE45eTJwYW5KUDNwQ21yMUE1L21jK3Rac2hZ?=
 =?utf-8?Q?VFMdRSPfKgnzCY3+chAQGiA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 926872f6-7f8b-4f97-f20f-08de11f217eb
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 05:07:41.8583 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /8rd8U/vi/iAaq0XgyKCGID2f+LZPPO3Pr27//QWTzn5nL6Tndg4Pa1ddxGfO0ZhEnsvLwDbGXnHhc52peuOBs9FPgVi2vHLYxwnpuw+Y8U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFCECA32305
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



On 23-10-2025 04:31, Matthew Brost wrote:
> We have helpers SVM range start, end, and size. Use them in the PT
> layer rather than directly looking at the struct.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pt.c | 28 ++++++++++++++--------------
>   1 file changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index d22fd1ccc0ba..7c5bca78c8bf 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -715,7 +715,7 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
>   		.vm = vm,
>   		.tile = tile,
>   		.curs = &curs,
> -		.va_curs_start = range ? range->base.itree.start :
> +		.va_curs_start = range ? xe_svm_range_start(range) :
>   			xe_vma_start(vma),
>   		.vma = vma,
>   		.wupd.entries = entries,
> @@ -734,7 +734,7 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
>   		}
>   		if (xe_svm_range_has_dma_mapping(range)) {
>   			xe_res_first_dma(range->base.pages.dma_addr, 0,
> -					 range->base.itree.last + 1 - range->base.itree.start,
> +					 xe_svm_range_size(range),
>   					 &curs);
>   			xe_svm_range_debug(range, "BIND PREPARE - MIXED");
>   		} else {
> @@ -778,8 +778,8 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
>   
>   walk_pt:
>   	ret = xe_pt_walk_range(&pt->base, pt->level,
> -			       range ? range->base.itree.start : xe_vma_start(vma),
> -			       range ? range->base.itree.last + 1 : xe_vma_end(vma),
> +			       range ? xe_svm_range_start(range) : xe_vma_start(vma),
> +			       range ? xe_svm_range_end(range) : xe_vma_end(vma),
>   			       &xe_walk.base);
>   
>   	*num_entries = xe_walk.wupd.num_used_entries;
> @@ -975,8 +975,8 @@ bool xe_pt_zap_ptes_range(struct xe_tile *tile, struct xe_vm *vm,
>   	if (!(pt_mask & BIT(tile->id)))
>   		return false;
>   
> -	(void)xe_pt_walk_shared(&pt->base, pt->level, range->base.itree.start,
> -				range->base.itree.last + 1, &xe_walk.base);
> +	(void)xe_pt_walk_shared(&pt->base, pt->level, xe_svm_range_start(range),
> +				xe_svm_range_end(range), &xe_walk.base);
>   
>   	return xe_walk.needs_invalidate;
>   }
> @@ -1661,8 +1661,8 @@ static unsigned int xe_pt_stage_unbind(struct xe_tile *tile,
>   				       struct xe_svm_range *range,
>   				       struct xe_vm_pgtable_update *entries)
>   {
> -	u64 start = range ? range->base.itree.start : xe_vma_start(vma);
> -	u64 end = range ? range->base.itree.last + 1 : xe_vma_end(vma);
> +	u64 start = range ? xe_svm_range_start(range) : xe_vma_start(vma);
> +	u64 end = range ? xe_svm_range_end(range) : xe_vma_end(vma);
>   	struct xe_pt_stage_unbind_walk xe_walk = {
>   		.base = {
>   			.ops = &xe_pt_stage_unbind_ops,
> @@ -1872,7 +1872,7 @@ static int bind_range_prepare(struct xe_vm *vm, struct xe_tile *tile,
>   
>   	vm_dbg(&xe_vma_vm(vma)->xe->drm,
>   	       "Preparing bind, with range [%lx...%lx)\n",
> -	       range->base.itree.start, range->base.itree.last);
> +	       xe_svm_range_start(range), xe_svm_range_end(range) - 1);
>   
>   	pt_op->vma = NULL;
>   	pt_op->bind = true;
> @@ -1887,8 +1887,8 @@ static int bind_range_prepare(struct xe_vm *vm, struct xe_tile *tile,
>   					pt_op->num_entries, true);
>   
>   		xe_pt_update_ops_rfence_interval(pt_update_ops,
> -						 range->base.itree.start,
> -						 range->base.itree.last + 1);
> +						 xe_svm_range_start(range),
> +						 xe_svm_range_end(range));
>   		++pt_update_ops->current_op;
>   		pt_update_ops->needs_svm_lock = true;
>   
> @@ -1983,7 +1983,7 @@ static int unbind_range_prepare(struct xe_vm *vm,
>   
>   	vm_dbg(&vm->xe->drm,
>   	       "Preparing unbind, with range [%lx...%lx)\n",
> -	       range->base.itree.start, range->base.itree.last);
> +	       xe_svm_range_start(range), xe_svm_range_end(range) - 1);
>   
>   	pt_op->vma = XE_INVALID_VMA;
>   	pt_op->bind = false;
> @@ -1994,8 +1994,8 @@ static int unbind_range_prepare(struct xe_vm *vm,
>   
>   	xe_vm_dbg_print_entries(tile_to_xe(tile), pt_op->entries,
>   				pt_op->num_entries, false);
> -	xe_pt_update_ops_rfence_interval(pt_update_ops, range->base.itree.start,
> -					 range->base.itree.last + 1);
> +	xe_pt_update_ops_rfence_interval(pt_update_ops, xe_svm_range_start(range),
> +					 xe_svm_range_end(range));

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

>   	++pt_update_ops->current_op;
>   	pt_update_ops->needs_svm_lock = true;
>   	pt_update_ops->needs_invalidation |= xe_vm_has_scratch(vm) ||

