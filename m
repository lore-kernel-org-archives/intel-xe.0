Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57483C5AE59
	for <intel-xe@archiver.kernel.org>; Tue,  3 Jun 2025 19:11:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ABAF10E0F2;
	Tue,  3 Jun 2025 19:11:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XpRVa2NI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27A9610E0F2
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Jun 2025 19:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748977897; x=1780513897;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=OAV7Y1OXF5n+YRU9ceOhbhkwgooLZk3B6FX1nRq7oZs=;
 b=XpRVa2NIf6/cPtfHulmmWpNRWnmCj02MAMjdH4pHO4LDjclGdCp2dLfn
 z/l+xwFAvTBG891ni6W/ZpMyOTcsLKsBpn0tGElP9urjXYJ2FjKhZV6ct
 RLszwtZxD6DQBUxeN2rEWO6k0FrnYrWgfMgLiM45O2GQ/sivqqkIaIG6g
 GBeYRlPbyjazVnv+FXoNwqLExJjbTbXEhoKT5xmFlwYdQijhFQ6918i9I
 OAxkmQMC72zGCdpT8L91haG5hMioQa6x6kPDOra7rDL9DPYbyQTJOaKer
 zRmCyPF8OHRFXVxTnJO6QvdbCNso1hM9HjJVXPjYAarsbc5NgYi2n7935 Q==;
X-CSE-ConnectionGUID: W9u7mUyxTzuVArrYbHLDxQ==
X-CSE-MsgGUID: lna5A9AvSC6Qw+lFI+gTVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="53661328"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="53661328"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 12:11:37 -0700
X-CSE-ConnectionGUID: 58WiTuRIRwmt0xsfLwUEQw==
X-CSE-MsgGUID: 8b7MV3O5Sc6UmjiMv4xYIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="149841029"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 12:11:36 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 3 Jun 2025 12:11:36 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 3 Jun 2025 12:11:36 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.76)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 3 Jun 2025 12:11:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GCMGNijgHi86Vgs1ypkF7QE9HKZB2r5VxGELPWVf4pzQ4Nptd0Hw6Ti+H17QdqM3URQdy6Slk+Lg73qPuERQpMSRWcdyvg+G+v03aAn94zLgJk5BwfR1WaEjhM1pX7gvuFp7TjpD3YBjYHCZA+MGnjju5hpMFiu9LGt1cjYK9VtpyM+7vxUbDaZ8yrAMEf8vOQxmzQ0E8+Rh68ti2TjCPcudi+2H8I795/peOWoy8oLG55DnOaTJJUwovna3weJf8HMJK0PsUcEHjZV+9aEtv0OAUFv4tgHixuvam8idm1BGeOBJPUKxHtdBaOgJw6m8sxl6Un7BumuuksD4Yb/gQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cekYj86huileH23s0xGbVFs6T8csCjGeUjrLknhFITU=;
 b=mcThBL2AMhLx2qHuc58ADqvEXBM58wa/pdwKkn3uPjy4nV6Qf9nK4x6kSyi7dInvww2syUXKFNdeVErwhicE0NIqibUZpC28552OTAzNMnX7OnmXiAVcDqszj+iFI35GOCjQnQGwmoGEKGS2TEN+CR/l/S35ubHGP9sL/LqfHvS4gDTqXLk1jGsyCKtSP4adL81qfHfvqyqkTBJZy2U0nWjmO+DbNMoPwkGQc4Vq9njioTsUsf6salMwlyw+dVYrGtnQ8V1wwTBPF/k8EanhRjjx2iCdibkcq+hJPPkJnDoGC5MOqXd221GlMdkQO9LyLa2MtY+y6JrRRONVX9FBGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by DS0PR11MB7631.namprd11.prod.outlook.com
 (2603:10b6:8:14e::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Tue, 3 Jun
 2025 19:11:31 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::2ae2:110b:2487:40ed]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::2ae2:110b:2487:40ed%6]) with mapi id 15.20.8769.022; Tue, 3 Jun 2025
 19:11:31 +0000
Message-ID: <b1e776a1-ff4b-4727-8f11-375a9ad00b8c@intel.com>
Date: Wed, 4 Jun 2025 00:41:25 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/xe: Add clear_stats GT debugfs
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <michal.mrozek@intel.com>, <francois.dugast@intel.com>,
 <thomas.hellstrom@linux.intel.com>
References: <20250603184522.2218192-1-matthew.brost@intel.com>
 <20250603184522.2218192-2-matthew.brost@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250603184522.2218192-2-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYWPR01CA0019.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::6) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|DS0PR11MB7631:EE_
X-MS-Office365-Filtering-Correlation-Id: e57f4edc-481c-4f97-8b52-08dda2d27304
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TjBrZlVGUVd3b0VTUTBVei81aUcyYnJ6TzYyWUc0TU1NNFhPc3E0ODVxMUFV?=
 =?utf-8?B?WGNVSXlzLzN0WVFHdm1pYmhHRzVwYXBNdG9oeGZIZ1lKdTM5NGc3dy9QR2xx?=
 =?utf-8?B?K3BpRTdPUmNjOE9TcnU2MHgwdzlraUk1UVV3WThWLzZVc291T3V1YkJ5dmNE?=
 =?utf-8?B?d0c3b0Q3WmVXSHBZYTI2VDloTUgyQjBlV3k3VzRlTHBSRWpobEpJdmFkVUNX?=
 =?utf-8?B?N2lVWGJrQ0U2NUVpa1ZkOVFYd1ZZN1hMcTBpemQ0cFBWQTZaR0ZtbXp3NXZD?=
 =?utf-8?B?NXZCZUk1UzRETEZKZThUWUZuODY3VHVRSXYwajNjcUpLU2dPNFBjUy9iekVv?=
 =?utf-8?B?dU80Q25nc0ZOQ0tJQ09TSmpkRGZQTWt5dGlzbmlSa0ZaSDhQRG91SkZSOVcy?=
 =?utf-8?B?a3BXeVpVYWN0M25sMjBIVk4zRHY1SEtjdFYxT1NiT1BBbTF3QUNlMVJWbGpE?=
 =?utf-8?B?VEJlOERpTC8vV1Rodng3aEg5Qis5QnVpYnNFa2Y1bWswRjJ0eHlPVU41cTBa?=
 =?utf-8?B?cjgrV09aZVZGTUZOSWNkZTJOejJOTkxrejF0MHB0VFVBNFFpUVFVQWNMYy90?=
 =?utf-8?B?ZlFoWEFOVnRXK3JyMndGZ1lVNVVwZllCSUs0OTRDNzU1SGhSRi95aDhMajRs?=
 =?utf-8?B?cGRyakIrREZwMWp1NDZuRFk4eVpaSE81RHRicU9CTVJOdkl2aWNkWHNNZGlM?=
 =?utf-8?B?cTV5MW0rek9XeU5ZRzY1a1pzMzlNbThBOVNPTTVnRFNVeUsvUzVrMTZnWFhy?=
 =?utf-8?B?UWpJWElRVDRNOTI0ZVNJeU43WVpwUlFlSG1yQ01GUGNTSUxkdFBoY2I5M292?=
 =?utf-8?B?QU9QdzdvUitETXl0NFB0b3FqWlBGOWdWNVVjMlVkK3lPNmZsL0Y2Tkx2andR?=
 =?utf-8?B?b2RheUdseUp1VjdLN2NaaFdFUWNhMkxjTUNLT1ZsSitZUFkwdUNLdEJUKy8v?=
 =?utf-8?B?bTNDZzFJNWowRFFPRXBxZHRvNVZmRTJiZnRJY0lGQzRSb3Q1QWtrYVJjTUpu?=
 =?utf-8?B?UHJJeCtHTU9IS055K0tWWnEvZjJvMHdWYUdnMi9zeVhPRmoweVJGWGtIS1Jx?=
 =?utf-8?B?T0U0VlpUU1dEV3J3L3VSZCtYVlFsMUNRYktIZHp6RVJGU3duaUtYQjZJczVG?=
 =?utf-8?B?MmZjOFE3Y1NGbDNvTk05bFR0YVpFRnhNQk1UNTZqSFJTRm5kdGJLT0VHcVgx?=
 =?utf-8?B?TGNYUlkzZlNxTlFlSUM4MWV1a1dhbHEzenlPOGhVWHIwRFYwR3VlM0FaSXVa?=
 =?utf-8?B?M3dGSkI4ak5hMXlkNXVicnZiUXEzMkJKKzdhQThVbHE2VmlOaGpCb3kvWVhB?=
 =?utf-8?B?TUlWNW1RMFpycVNVVmpXNlhPWHZSR0w2MWc2ejIwRHRUVm11dWZNSnI1TFUz?=
 =?utf-8?B?dTYwczV0ejJET0NTSXROWnZsLzhLUDFNT1pPNnZ0UTQxZ1NYb0lFNkdHZTFi?=
 =?utf-8?B?OGduemwvN2hKaUg1dis0d2t6dW4xSU9NM1o3WGQ0dlU4eDhPejN4SkR5MjVh?=
 =?utf-8?B?TElyNFdqMGhndWJ1L28vY0ZzVzFKVTJPWXhhbURNMjNZd3lFQ3Buc0JRekZR?=
 =?utf-8?B?MityUVpIQllZZ2FONlFqaG5GRzloQlB1K1AzZGVVL1BZcmM4UEhRSTlWaGF3?=
 =?utf-8?B?VW94RzlFdFBYa3lEeXRlQkp5RnRaM1RUNUt1a3NrZGluWktYYkRsWVpRV2Ra?=
 =?utf-8?B?em1Wclh5cHpmR050NXlXVm81S21qQmNTbUx1VFM1R3hyb1hGeDhDd2l5dm1j?=
 =?utf-8?B?MlFyc1Q2eGpYclFVLzVTNzBCZWtKeEV2VG5McjVkNmtoRzVjc3BjZURXQTJl?=
 =?utf-8?B?SHRBQ0VkWmNyMHFrK3dXRzBwU1daMEgyY3RIVUh5RXBjOFBKeFlvU3hkVm5R?=
 =?utf-8?B?bVNpaFhndnd0Rk41Z2FMYzY3QlZGTk11RS92ZHlWUW4zcWlmMWdva2VJd0pB?=
 =?utf-8?Q?tfNjNRwh5mo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFE5NlVQanZrZkxRYWp1VGZIb3F3KzFRak9qUS82dWFTVjEyMzhjUnMxWEtI?=
 =?utf-8?B?SGxXMkIxTysxQVpWRUxnREtIS1RzNUxidGNBeU5hYytpSnVYOGc2T2tVT2ZO?=
 =?utf-8?B?bkFBK2JLVWJwVlA1K3hSQ09NV1hkL2RIc0Erb0hJTnRvWEFaT2o3dXgxSGR1?=
 =?utf-8?B?RFRNU1ZIbjltVzFCK3NaUUZTcjZFdnJ1OCtyUGtUdGUwcE5YVWc2K1pXV2R4?=
 =?utf-8?B?NDNFZ1g4S0dsakVaejhMY05XTFdEblVwa0QxVG94ZHl4eVdlNm9zMUt5NWJS?=
 =?utf-8?B?ZDlVOFBxcFI2RHZrMkdxY1VMUTQ3Q3M0VUtGMVZrQmU2dUlORUtIZ1d5c3Bp?=
 =?utf-8?B?KzFIejFqdXZTUTM1QTVqMm9QdFNQdUFxWmh6NE40LzBFM0l5Ry9iMGJLcmdq?=
 =?utf-8?B?a3lJSEUzNmNJZ3VJYzF2Yk9lckZHZFBvQTczd2pUZmlkeFNXVW10c0pmQnMr?=
 =?utf-8?B?T1V1enNaKzZaanhvc2krWFF5Z3hiSnpVTEw2cW9hOHlZTk9ERTRWUnJsKzlU?=
 =?utf-8?B?Y2JzQ2lqYW5RVUwxVXFlRFhtNHRxZ2FYQ2h3eXBuOTloWHRzdzRkTE42SjVu?=
 =?utf-8?B?K1ZrSUQxWUh2amVWdXlYeEhiQ1hxM054TWlZRDVNUVAydUNRVWorekpxSG00?=
 =?utf-8?B?MnlibVllM0Y3a2xiZlZzTmJ0NElOVGJKMFNoV2dkQkVKQUViU09KODY1TEhk?=
 =?utf-8?B?S1lLanlsNlJLTTRuNTJIWXZ3eDBpYjJENjNzQnRBWjBBd0VZSjM1RWt1SmI3?=
 =?utf-8?B?MUd0SVpXTlNsNllEWkM5RUNMYW5XcGFWTy80aFJUYWJsL29FRXFleHIwZE5v?=
 =?utf-8?B?Y3RQNnE2ZU03Y2s4dFEyZjZmU1lycGN0a0EyUlp3S0RqdEFlWlFoUmhkSFZi?=
 =?utf-8?B?blBuYzdFU2lpclZaeFNLWDNtaDNZY2JqVHovdCtDeDdBVkxPYVh3UnY5SG5H?=
 =?utf-8?B?S0ZHWFQ0aHBzeTEwN05mWjVUVEhzYWMrMFN0d0FoY3JPeEZtUS9DZitJN25O?=
 =?utf-8?B?TG5JU2grQStpbXV0ZlVpeXRuOWpZUDg5Y1lNdTlhbDIrTmY4dmJndCtmdjBN?=
 =?utf-8?B?QjZnaUNBVUQwdlppY1c0L2pLSXpqTk9rSE1iak9YNEUyeFlFdEVGdDV4bmcv?=
 =?utf-8?B?a0RhYWgvQndMaHBBclFKSzE2bS92T29mcnVhT2hNRG9DVGVCOWFQQnl6WjBM?=
 =?utf-8?B?ZDNsWmJSaVpoSHc5bFVTR0ZUK0tlYUNwSGRSUExQVXpoY1lDcE9xTzJPZFNP?=
 =?utf-8?B?MVBQWklVdWV2SjF1L2MvZ3ZHMFMzaTN5dkl3N3p2eVNWRHRzWDZhUDRKN3hQ?=
 =?utf-8?B?VGdaZWREUHM2YUwwMFEwdHJtYy9WeHd0YUhFVlNrcXJoYXpsNE1xdEZGc0kw?=
 =?utf-8?B?b1VwN0Q1SkxlN0ZGWHJ6M0gzanl3bkt4UkxwRDZzUmU1b2lDemF2bGtONE1k?=
 =?utf-8?B?RS9jc0RmRjdTcis2bnBIU3VwTjkzOUk3SThKR0MvK3VtVXpyc1lXTnVqMHk5?=
 =?utf-8?B?UWhPRXZUSXBObzdTWTVReGZMdC8zNVAvYVpPd0Z5b2FpdVlaMzdwZTVPZ3p4?=
 =?utf-8?B?U09yR01qVXZzclZ6VmZSdTdFR01MU1NYQmRsQTRxWlVPb1BPR2d5T3BQcUtB?=
 =?utf-8?B?SkwweUdQb3RIdHFoQmVENVF0LzdsVWNTR3c5MWVhYjJKK29yL25oT2JZVEpv?=
 =?utf-8?B?TWFYTmJoV0RWWGhsOXk4bmVXTEVSQjZobFozMHBRNnNvVG1FTTdTRmw3UEx2?=
 =?utf-8?B?VFVHWEs3SUhoeWxxcFNsYlRPMys5Vk1qOXdSamVHN2lFQk9NVW5Vdm44YnZW?=
 =?utf-8?B?dkovNUZSZmhpTGZMV1J4eklkbC9TTnJCWUthbmljMWJaNnM3UGZJcmM2aHIz?=
 =?utf-8?B?K05iTG1tMy9RU05sVzdWbnYzbnloWkVuR283V2RZbmRXb0NyY0pzZCtsNlZr?=
 =?utf-8?B?anVTbnk2T0hWdmlyQnJPS2ZwS1VFYnErcHBPU3g1R1NZc1QyZXUxZngzQnR5?=
 =?utf-8?B?cWt2Vy9teXZhNm9FYUo3Zm54QWEvaDBZeVd4VEdiNFRiZzlPL3pkUTVySXpk?=
 =?utf-8?B?Wi8vWFBSYm5UaklVZHAvWTB4RHdtUGtqREJ4V1RwVS92dSt0MWs4b1JsS25k?=
 =?utf-8?B?dktBQnI1ODhSV0kxTXA1czFTOTMxSlNLTFNKYU1jOTg2Qk1kdUlLV0ZjTVhE?=
 =?utf-8?B?WFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e57f4edc-481c-4f97-8b52-08dda2d27304
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 19:11:31.6003 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YDDxOjW8YP7pMrmdFGL45NXS01fd7wmwCiOsolbSJuic7TjB0TdXHff95zJh89pS2qRw3bm66cN90tYpkTefpiBunZo9s1Pp+UOZuQXnMaQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7631
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



On 04-06-2025 00:15, Matthew Brost wrote:
> It helpful to clear GT stats, run a test cases which is being profiled,
> and look at the results of the stats from the individual test case. Add
> clear_stats GT debugfs entry whih allows the clearing of GT stats.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt_debugfs.c | 22 ++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_gt_stats.c   | 14 ++++++++++++++
>   drivers/gpu/drm/xe/xe_gt_stats.h   |  1 +
>   3 files changed, 37 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index 848618acdca8..a6888f03a4dd 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -328,6 +328,27 @@ static ssize_t write_to_gt_call(const char __user *userbuf, size_t count, loff_t
>   	return count;
>   }
>   
> +static void clear_stats(struct xe_gt *gt)
> +{
> +	xe_gt_stats_clear(gt);
> +}
> +
> +static ssize_t clear_stats_write(struct file *file,
> +				 const char __user *userbuf,
> +				 size_t count, loff_t *ppos)
> +{
> +	struct seq_file *s = file->private_data;
> +	struct xe_gt *gt = s->private;
> +
> +	return write_to_gt_call(userbuf, count, ppos, clear_stats, gt);
> +}
> +
> +static int clear_stats_show(struct seq_file *s, void *unused)
> +{
> +	return 0;
> +}
> +DEFINE_SHOW_STORE_ATTRIBUTE(clear_stats);
> +
>   static void force_reset(struct xe_gt *gt)
>   {
>   	struct xe_device *xe = gt_to_xe(gt);
> @@ -408,6 +429,7 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
>   	root->d_inode->i_private = gt;
>   
>   	/* VF safe */
> +	debugfs_create_file("clear_stats", 0600, root, gt, &clear_stats_fops);

shouldn't 0200 should be enough ? I see no real need for read of this 
attribute via debugfs ?


>   	debugfs_create_file("force_reset", 0600, root, gt, &force_reset_fops);
>   	debugfs_create_file("force_reset_sync", 0600, root, gt, &force_reset_sync_fops);
>   
> diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c b/drivers/gpu/drm/xe/xe_gt_stats.c
> index 30f942671c2b..7e12fc3759e2 100644
> --- a/drivers/gpu/drm/xe/xe_gt_stats.c
> +++ b/drivers/gpu/drm/xe/xe_gt_stats.c
> @@ -50,3 +50,17 @@ int xe_gt_stats_print_info(struct xe_gt *gt, struct drm_printer *p)
>   
>   	return 0;
>   }
> +
> +/**
> + * xe_gt_stats_clear - Clear the GT stats
> + * @gt: GT structure
> + *
> + * This clear (zeros) all the available GT stats.
> + */
> +void xe_gt_stats_clear(struct xe_gt *gt)
> +{
> +	enum xe_gt_stats_id id;
> +
> +	for (id = 0; id < __XE_GT_STATS_NUM_IDS; ++id)
> +		atomic64_set(&gt->stats.counters[id], 0);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_gt_stats.h b/drivers/gpu/drm/xe/xe_gt_stats.h
> index 38325ef53617..e8aea32bc971 100644
> --- a/drivers/gpu/drm/xe/xe_gt_stats.h
> +++ b/drivers/gpu/drm/xe/xe_gt_stats.h
> @@ -13,6 +13,7 @@ struct drm_printer;
>   
>   #ifdef CONFIG_DEBUG_FS
>   int xe_gt_stats_print_info(struct xe_gt *gt, struct drm_printer *p);
> +void xe_gt_stats_clear(struct xe_gt *gt);
>   void xe_gt_stats_incr(struct xe_gt *gt, const enum xe_gt_stats_id id, int incr);
>   #else
>   static inline void

