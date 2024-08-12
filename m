Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F8AAC3DA7F
	for <intel-xe@archiver.kernel.org>; Mon, 12 Aug 2024 18:44:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E25810E27D;
	Mon, 12 Aug 2024 18:44:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JrxIWpwF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 290D810E27D
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Aug 2024 18:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723488238; x=1755024238;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/roJ0nUhNI4OdiCbPtyBIftA/Lcb8WaNuhb3gWqqRjs=;
 b=JrxIWpwFbSwcDBbT1AAcfW2GL8lvqTWv3DU/Iwi/xxiBPAM8GcJhoHTy
 jq+EoksjaCOWbtfRt6f8xIEEB++AmGH8vGnahIpCCqe+2EZTutPEhw02U
 d9QoVsdHoI/LBgHKbOZTDrKM9XygxMlZz6uep/YjpSRux18sdBsYx0uai
 LhEaAk44ESlEcKU7N1uVYIw79CKJ20mvLJ6EZRyWiUh0shrwYa/2mGRS0
 iW/I1PTEtr3UdKVoPZzLDkp5zkRvJOxhCq2fRqBvI/AmQNdG5Fs3TG4Nr
 MtiQdglSvXxtR6Zn5sfz4s1I3LH9h2g9R41rRminRZjheHPdPRkdqgK+s A==;
X-CSE-ConnectionGUID: 2XDtvIUTRj6u1080pOmaww==
X-CSE-MsgGUID: gKtAQlY7TSK5t5zgl5AD5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="33018296"
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; d="scan'208";a="33018296"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 11:43:58 -0700
X-CSE-ConnectionGUID: MqZfOm15RM22JZWAzEka0A==
X-CSE-MsgGUID: Pa/6leH3QMm0XCt15AZAFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; d="scan'208";a="89183953"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Aug 2024 11:43:57 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 12 Aug 2024 11:43:57 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 12 Aug 2024 11:43:57 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 12 Aug 2024 11:43:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vnaRj/94mG4tTGmU2ZRj3r6ukHM302V1zC0HAobNcCDtAUEQWnHTpTvxPN68AW6vSsb0YnoHDzHBhS5dixVT9C8VkMWCmM+01fLaloqb8Vv14FiBR2LASZS8C9umcthoZ8eE+zz9EgAIigVEgICRsEed51++gSXfWujujeqtwoD6Ve8R2h/e7+S7BXN93KaHz5m+QQ0hfapka0l7/SGW8DVWVnpQ5SPFYcwM39Lwm+7DkpVhqHXXi9zzm0qNtmnihlUplBAdWxS9f7zdXxF64V0A2oaEBmz99NfJk1RXt5320eDWZDShAB0qnfRWAnTeG8gB19t3dTWOakJXfrpQvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oluHJqHq7z+ZZh7fRYZfPgW3FSF+2E98YwdpIFUGNeQ=;
 b=iwp3cBRM1etSxKDrMw+qVfVMzy8HwFEBxUNNXyjE9s6+n3uEBLLUyLhQf0vE4izc953oynhLY+14OhLjdH9h7oO609tyRkjCBgInGWhqsII9NoFZTn7+amtO9RU8WoH3YT0jSsjLbYSIMHZPgyhoQ9d/6H5vf9wh0hVFXbPbWIxPl/JiskGi0RLAVHLhKvJf4uKaUAKtHkfp1QEoXOiDLsZjyO3Yda0fJoXRP5lAmRY3zIMXtF79Kn6vK25hteqGM+e9Gk3W+hNjiGzkmD6FcrzjD93LmdIpc66qGN2F1+lKtHB1CAILvWa/PNo5oHtirBEeyF6T3EEH8SdBCjmOOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by SA0PR11MB4767.namprd11.prod.outlook.com (2603:10b6:806:97::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23; Mon, 12 Aug
 2024 18:43:54 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%7]) with mapi id 15.20.7828.031; Mon, 12 Aug 2024
 18:43:41 +0000
Message-ID: <2dcabc82-254c-45d6-8b74-0e37b1223ccd@intel.com>
Date: Mon, 12 Aug 2024 11:43:39 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/xe: use devm instead of drmm for managed bo
To: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Lucas De Marchi <lucas.demarchi@intel.com>, Matthew Brost
 <matthew.brost@intel.com>
References: <20240809231237.1503796-1-daniele.ceraolospurio@intel.com>
 <20240809231237.1503796-2-daniele.ceraolospurio@intel.com>
 <d1758683-cc9f-4a6f-96dd-6180e91133a8@intel.com>
 <33aaf2aa-c8d8-48f5-a234-dd3358a872f0@intel.com>
 <fc87fc66-9782-430b-941a-b3cb4f08a2b5@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <fc87fc66-9782-430b-941a-b3cb4f08a2b5@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR13CA0007.namprd13.prod.outlook.com
 (2603:10b6:a03:180::20) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|SA0PR11MB4767:EE_
X-MS-Office365-Filtering-Correlation-Id: d0cb2b34-93ee-4d0b-0ba3-08dcbafeaffb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TkFoQjBPUkRmdjUyVjR0Ti9IN21EbW9EQ2JwMlArcWxSYUVsdm8vR2QyQ1Zn?=
 =?utf-8?B?OTNSaEQ0RjB5a3JucGdTaUxrME1pZmJWeHl6azAyalRSYVM3ZXMrRitXdjVX?=
 =?utf-8?B?ZmZIK1ljYnZ2NDZ0eVhiR0xlV2d3Yll0UUJpRHNNbEtTdEJPMmRySDZPa2Q3?=
 =?utf-8?B?c3VTN3hHdUp2aUkrakI1VVJTU0pQTlJjY1ZEZTR2dTRKWmxkWXEvOGFtS0Ri?=
 =?utf-8?B?bWIyclU1VG9YcVVvd0N3cEF5bmxIM0ZOckduVTB2NElNRmNzaExGN0o2Z3Nk?=
 =?utf-8?B?MDVVbnBKa1ZEMG5jTTl5WVVkaFhMbUtDbWZxUm5QSWNOUlUzVjlUeUM4L3l3?=
 =?utf-8?B?cFlqYkFvSk15c3Jaa1N0MlVOemI4TWxpcFNkQVZJTjBUaHpnOVZMdmpGS1M1?=
 =?utf-8?B?ekhoalNFeVdkdDJ2dk0rbVcyM0JoUnVoVU5CKzRScXB5a3lkSlpZVXdSa0ZN?=
 =?utf-8?B?MTBId0pmQmQrMDBpaXl1R0sxSjFSbEw0NVdSU1J1U1J2MkdIWDA5TDVaK3lG?=
 =?utf-8?B?WkFoZU5zWE5tcmRBWUZhemZVYllBa2pLN3o4L013TFU3VFVXMzZINzVjRFZZ?=
 =?utf-8?B?NE9hOWRrRzBEa1M1Y0xPUDZiMnc3Z1BrVmRFcE9zZFZVT1NzRXpjU0pMeG9m?=
 =?utf-8?B?ajQ2UlhMalJteUNYV3ZScTFpVjJaOENIVzNJbmlCNytxV2w2R0ZKTUlDaTlr?=
 =?utf-8?B?WWpOM1VWNDZOejA4aGZ5bFFmOTdKbXI4b3pTRzV5c1dMT1FCbEdHYWVWUHN3?=
 =?utf-8?B?Ri8wT080dzJUOXQ4SHNsTDkwaU1tUyt2djViM1lkandJZ1I1cXJQbVp3MEJT?=
 =?utf-8?B?cnMyMUczM1FIcnlUaFFRN3dxeUhnMjBKWHgwSEhLSXZteTRCT2wraU9saTRE?=
 =?utf-8?B?d3lkeC9rTDQxNS9pbDRrbGd2T1NzYkR0WktLemd0bU5DOFh6SHdMTXpFVHdp?=
 =?utf-8?B?OUZ3VlROWWxZeElPUFdhdnRsMUtxVVNJL0d6dzVHNFRta0dVcHVaekJvWVAv?=
 =?utf-8?B?bDNnYk9UR3d3R1B5djhsTU9EcjlYKzB6REhaZU9hbTVEMzY0bmxkR3l1MmJM?=
 =?utf-8?B?WEtiRENhL25IZU5QUXUvUjh0QWdUSkxTaXRmSFlZUDFTZ24wamR0Ryt5cDNk?=
 =?utf-8?B?NktLTzgweU1ZMzlKRWVuR2RKd2VZdkNURS83ZVNYd0Z2ZmVXamFpWVRKMWNH?=
 =?utf-8?B?bVNDYzNONlBmaXQwSUV1TkI4bFBwWWFDL2MycmxYU2ptcDM2c2l5TWEvRGxs?=
 =?utf-8?B?S0M3T3Jic1dtUG5WbkVxWUdZdWpzcHI5VFlTTUxuaFptaGlkTldhZnd4K1Fn?=
 =?utf-8?B?dStzbEs4WTRSdzd5WkluTmNrOGNreEhpS3YzK05ORzk5ZndVZlVrdXQ3MEZ2?=
 =?utf-8?B?LzFhRnNXaDBQVXltTGVwQjI5NWFLbDhNelpwOFlvaThob25Sb3QybFNvWnJ0?=
 =?utf-8?B?WG9sTzhXamxHOHpyZldTZ1dLU0NFL2JubU9PeE1aU1cyMHE5dlVOOVZtdjZB?=
 =?utf-8?B?bFE0VWZRaWdFMkRMNjhnUmU4SmN1SnJuSjZsd2w2T0J6S0RvQ2xERXRvbG56?=
 =?utf-8?B?Wittd2Vhdjh0R09vYXUrKzBLRFE5U3BSRVNkdmJkWCtOS1B3SWVoTHdkZG5o?=
 =?utf-8?B?d2VwWDNQcjlRVG1BNGFaRVAzamhWR0JQbmhmcWFVVFJaNVJoY0hUUmM0Y1hn?=
 =?utf-8?B?ak5WemRPS1BHVVIyK3dMQy9oWTBKei9HY0NQMmVkSllqWjRybHZBTGtwc1Y3?=
 =?utf-8?Q?E8ds34hZYVXmyOEgdk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cFRwTkRvWEVrYlp6S05iazROSm5icHVUVER2eWorNlRKcnNVMURjeFdDRGJn?=
 =?utf-8?B?ZGtZN1NtN1FoVXRwd2VkTU5YM0N1N1hTQkJ6NkdaSlozN0NKWXQwZ1drMUtq?=
 =?utf-8?B?T3h3UDNHUURPM09xd01sMWUrazNSMkxKMS9BNlR5a0J4T29oaHBzQUFhTFlF?=
 =?utf-8?B?c09IMDYxUE9nNEJyUlVCL0tKM2dkTGdyMUtFYjFOVUpsUmxSOG8yWFcxWEJu?=
 =?utf-8?B?N2ZoNGI0L3ZhT0h1dmtZSzBnc0ViRjE0Si9OUXNTK2lqcVJjWkVqSHoxMFBp?=
 =?utf-8?B?bmJpR0RhMCsxdXk3L2dmMERNbVJUKzdsTGR5aXVxaVAwS1JQdjVobm03M0pR?=
 =?utf-8?B?b1V1RHYwSHFVeWtORFljcEt5WWJPSmtQc0NjSHM0UVlTdnN4WnJvNjVtMmNl?=
 =?utf-8?B?bWJLUUFQVFlTVDllVUpUVWM4cGcyWnI2dE9QMEtDekNWTjJZY1FjakQva3lm?=
 =?utf-8?B?YmlCR3A0b21wc0FBd1RaMTRtVU40N1B0WXE5cnVzVk1yMWRsU3pscy85bGs4?=
 =?utf-8?B?SUg1SjRCSEx1eFNnbVRPYThTdUorSVd2MHRjK3B4K2VmVmYyU0VLei92L1Ba?=
 =?utf-8?B?WDZFejUrRkNiRGlDTHk2TDEyNFNYbko2dFZFVVJvSUdkKy9FancvN2hSc1VF?=
 =?utf-8?B?c0E2a2ptcVB0bnpyUENlTUNkbndIODROb3FMaGpTVUE4V3FPS205RzVNcXRt?=
 =?utf-8?B?amtkR1JrMzB5NzBDbXBIR1lYa3RqYUtZN3J3M21KV3hVV0RkTWU0b0Q0dS94?=
 =?utf-8?B?NjdXeXRPbFJnS1ZnSzhiRGMzemFFZW9LMkVOUHYyVFFhZmJmWjNRbXc5Q2ZX?=
 =?utf-8?B?eUZ3dFYxRm5ORzFCYWh1a05vc1NqWkdtS29TcU1MVFpkRCs0dm01dnVYOXhQ?=
 =?utf-8?B?RHJiNzR0ekF3T1hGTUtwYzRtZ0YrV3AyektIOVphcTViWXNHNTZ3c1BaNXZw?=
 =?utf-8?B?eC9XYzY4N3R0RHhZWTltZmI0Z3ZTZ1JFSnNMYmt2YWZvdVlRQVVUenEwMGFM?=
 =?utf-8?B?ei84NGpsd1FKN3N4WlNvcUdTODJrVGt0NWJVRWw4c2RaT251RXF6N0RIUjFl?=
 =?utf-8?B?QmdJY203VWprZ1F2d3FJRHI3YWovcXluSTNjVUNQYnhUczFqUC9SVWtXZG90?=
 =?utf-8?B?cHhHNnFFWTlVZy9oRGUvY2kwMU1CalBvSEM1R05sVU1tRDExNnJSZHR6cTJm?=
 =?utf-8?B?NVRxbTY0R0dXRDB3bFpiL0cyaXBVS2hxS0J0M3RpbGg4UFROTjBMYmpPWEtR?=
 =?utf-8?B?ZGZpa2FLZTNORGlVeHBONys0VWt5Q0w1blJ6WEhUSDZZaDdHMDNGY3NYem5M?=
 =?utf-8?B?SmhkK0Y5dHBiT3BUUUx0L0IvRGlIcExwNjc0QkdGWHY4RThyS0JQTzdXSnB4?=
 =?utf-8?B?YVBQbi80dUZwRkZOYnBiRG5COGdIWGZTUXZNdFkzTDdLVGxEdlJnbG5wZFgr?=
 =?utf-8?B?eGJ1VXMvY2c0aWdyblI3dkp6SW5tQ0FkSG1MSTRIbHZkY1RsWkNqS29KUnlp?=
 =?utf-8?B?YjYvd3RranhXRkliM3Z4d3Nwdjdac2FzNFlkUGdXMjJXTVBFVFFOREFJMDFs?=
 =?utf-8?B?ZjdNSXp4M05pbjhQaWJ1SVF4K2hMV29jZzFMdlJOVzB6VGdDdlVES2hLeTRx?=
 =?utf-8?B?bjF0NUFPYjN6MVVFZTkwRU1KR0hlREpLYkJMazRPQnBKaERzNm96LzE4emdt?=
 =?utf-8?B?ZW5YcUErZzRibXNoaGt2dEREMW41ZGdCRUNnYUtyRDNKODVsVjUybFF3TWYw?=
 =?utf-8?B?U0p5U2U2bDVHWmRXSkVGK3JuQ1dWelYzcVd0Y0V6QVQvWUFPQnY4dUFRT090?=
 =?utf-8?B?Wk9KZWp2U3REWFM3OS9ibFlkdlJ4dUlwdkZvcWFqbndyMmlpT1lEWHJVNlFj?=
 =?utf-8?B?ZXdRNkVRcXp1Y0Q1cFdRQmJvVW5PRmNrSzV6TkxoRzFrTjF6RzhuWmNzbS9U?=
 =?utf-8?B?bDQ3V0kwdm1xeHE5dE5GdWFIZzZQeFN0anc3QmpIaTFFQzVTekVyTzZkTkdC?=
 =?utf-8?B?OGtVWkpEdTFYb2pIOUZaY1BpaW1DZnVKajBLYVBMTllCc2x2aHdCZjFzVzQ4?=
 =?utf-8?B?b3lvM3FFNkU0SHhXNmU1aitNbjBMUXlqQzVYUGxQTExxQjh4VFpyaE5lSE9X?=
 =?utf-8?B?d2NXWDZxajhibU1oQ3J2YktUZjIvVWt0RCtvYmdZazhtVDFudlpOUzhuV0JM?=
 =?utf-8?B?NHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d0cb2b34-93ee-4d0b-0ba3-08dcbafeaffb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2024 18:43:41.8021 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kijCLkmbfkLZXrjZ9mFscMVqsV614+CfgFyxjDU3GQM2NKaXSTFOIojXii2SgvZ7rbhWsKp/GVMpPlokYb7X8ax9uWiRke2XzXZdyNA/tbM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4767
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



On 8/12/2024 11:17 AM, Matthew Auld wrote:
> On 12/08/2024 17:38, Daniele Ceraolo Spurio wrote:
>>
>>
>> On 8/12/2024 3:41 AM, Matthew Auld wrote:
>>> On 10/08/2024 00:12, Daniele Ceraolo Spurio wrote:
>>>> The BO cleanup touches the GGTT and therefore requires the HW to be
>>>> available, so we need to use devm instead of drmm.
>>>
>>> In the BO ggtt cleanup we have drm_dev_enter() to mark the critical 
>>> sections that needs HW interaction vs the bits that just touch SW 
>>> stuff, but looks like this only works once we have marked the device 
>>> as unplugged. If something blows up during the probe, then the mmio 
>>> stuff is still unmapped and set to NULL (mmio_fini or something 
>>> IIRC), but the dev_enter() still sees the device as attached as part 
>>> of the later drmm and we blow up.
>>>
>>> It might make sense to tweak the driver to call the dev unplug() in 
>>> the error unwind during the probe sequence, that way the 
>>> drm_dev_enter() will catch this (I think). If we error out during 
>>> probe, then device can be considered unplugged at the end. Or 
>>> perhaps we should anyway make this change regardless of this patch?
>>>
>>> My thinking with not converting xe_managed_* over to drmm was that 
>>> we anyway have to deal with userspace objects existing after the HW 
>>> is removed, and there we might also have to consider ggtt, like with 
>>> display surfaces. Also the BO is largely just software state and can 
>>> be tied to life cycle of the driver state, but I guess here this is 
>>> internal and closely tied to the operation of the HW.
>>>
>>>>
>>>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1160
>>>> Signed-off-by: Daniele Ceraolo Spurio 
>>>> <daniele.ceraolospurio@intel.com>
>>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>> Cc: Matthew Auld <matthew.auld@intel.com>
>>>
>>> If calling unplug doesn't make sense, or is considered orthogonal 
>>> and only makes sense for other drmm users:
>>
>> I'm not familiar enough with this code to know what's the better 
>> choice here. I didn't even know drm_dev_enter() existed before you 
>> mentioned it, but that explains why we only see this problem on probe 
>> abort and not on driver remove, because we only call drm_dev_unplug 
>> in the latter case. Weirdly, drm_dev_unplug is called as part of 
>> xe_device_remove_display(), which makes it look like part of the 
>> display cleanup instead of the more general one.
>>
>> IMO, using drmm for HW-accessing functions and relying on the fact 
>> that we correctly mark the HW-touching blocks with drm_dev_enter/exit 
>> seems more error prone than just using devm, so switching seems 
>> safer; is there any advantage to sticking with drmm instead of 
>> switching to devm?
>
> It's just that this is technically for the GEM object put path which 
> is generic, and you can get here without drmm or devm, so I don't 
> think we can really avoid drm_dev_enter() for these types of cases 
> where you can hit the same path with the device unplugged. Maybe we 
> can for the ggtt thing, but I don't think you can in general.
>
> Just to be clear, the hotunplug thing which motivated the drmm vs devm 
> stuff basically ends up calling into your pci remove callback even 
> though there could still be multiple open driver fd, GEM objects etc 
> for that drm_device. So here the object or other resources are 
> released only when the user chooses to close everything, which can be 
> long after devm fires and any other stuff that happens in our remove 
> callback. That seems to be part of the idea behind drm_dev_enter(), 
> where you have some generic path which can be triggered also after the 
> unplug and doesn't fit neatly into drmm/devm model (only makes sense 
> for driver init resources).

Ok, so it looks like we definitely need to review all cleanup paths that 
can be triggered from file close to make sure they all have the 
drm_dev_enter/exit call. Exec_queue cleanup is the first that comes to 
mind as something that might need extra checks. Also, I think some 
remove paths assume that all fds have been closed already (e.g. the GuC 
code will fire a warning if there are open contexts at remove time), so 
this definitely needs some attention. I am going to review all the 
uC-related paths as that's my area of expertise. Can you have a look at 
the more generic MM paths? It's probably also going to be good to add a 
call to drm_dev_unplug() in the abort path anyway, so we have additional 
checks if we do something wrong.

BTW, do we have any tests that cover the unplug while objects are still 
allocated? I checked core_hotunplug but it doesn't seem to cover this 
scenario.

>
>>
>> If we decide to stick to drmm, we'll need to review all callbacks to 
>> make sure they have the enter/exit calls where needed. E.g, the 
>> permanent exec_queue cleanup (being called from both the migration 
>> and the GSC drmm callbacks) does an unconditional 
>> xe_pm_runtime_get/put, which seems wrong if this can be called after 
>> the HW has been detached (and implies that the function can end up 
>> accessing HW).
>
> Yes, if we wanted to do the full thing then there is still lots of 
> stuff missing, in addition to adding all the test coverage.

The series from Matt B with the error injection should help a bit with 
the testing, but we'll definitely need more.

>
>>
>> Thoughts?
>
> I think your patch is fine, but maybe it also makes sense to set all 
> the bo pointers to NULL? It's easy to have some user trying to access 
> the bo pointer after removal, before the drm_device is finally closed? 
> Up to you though. Either way r-b.

Those are kernel objects, so it shouldn't be possible for user to access 
them directly. The only thing userspace could do is trigger a kernel op 
that uses one of those objects, but those should all be disabled by the 
remove.
Setting the pointer to NULL would require a rework of the xe_managed_bo* 
calls to actually pass in the pointer that is going to store the BO 
address, which IMO is not worth the time given the above.

Daniele

>
>>
>> Daniele
>>
>>> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>>>
>>>> ---
>>>>   drivers/gpu/drm/xe/xe_bo.c | 6 +++---
>>>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>>>> index 3295bc92d7aa..45652d7e6fa6 100644
>>>> --- a/drivers/gpu/drm/xe/xe_bo.c
>>>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>>>> @@ -1576,7 +1576,7 @@ struct xe_bo *xe_bo_create_from_data(struct 
>>>> xe_device *xe, struct xe_tile *tile,
>>>>       return bo;
>>>>   }
>>>>   -static void __xe_bo_unpin_map_no_vm(struct drm_device *drm, void 
>>>> *arg)
>>>> +static void __xe_bo_unpin_map_no_vm(void *arg)
>>>>   {
>>>>       xe_bo_unpin_map_no_vm(arg);
>>>>   }
>>>> @@ -1591,7 +1591,7 @@ struct xe_bo 
>>>> *xe_managed_bo_create_pin_map(struct xe_device *xe, struct xe_tile
>>>>       if (IS_ERR(bo))
>>>>           return bo;
>>>>   -    ret = drmm_add_action_or_reset(&xe->drm, 
>>>> __xe_bo_unpin_map_no_vm, bo);
>>>> +    ret = devm_add_action_or_reset(xe->drm.dev, 
>>>> __xe_bo_unpin_map_no_vm, bo);
>>>>       if (ret)
>>>>           return ERR_PTR(ret);
>>>>   @@ -1639,7 +1639,7 @@ int xe_managed_bo_reinit_in_vram(struct 
>>>> xe_device *xe, struct xe_tile *tile, str
>>>>       if (IS_ERR(bo))
>>>>           return PTR_ERR(bo);
>>>>   -    drmm_release_action(&xe->drm, __xe_bo_unpin_map_no_vm, *src);
>>>> +    devm_release_action(xe->drm.dev, __xe_bo_unpin_map_no_vm, *src);
>>>>       *src = bo;
>>>>         return 0;
>>

