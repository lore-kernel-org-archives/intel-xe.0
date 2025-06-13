Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBF4DC71136
	for <intel-xe@archiver.kernel.org>; Fri, 13 Jun 2025 16:31:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9805B10E1F7;
	Fri, 13 Jun 2025 16:31:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VLZWQ4ss";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F6E710EA2A
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Jun 2025 16:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749832279; x=1781368279;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=axY3HlZC3lxbZug5u3qFZ+JimXebfE0K4+/yL3t0cy8=;
 b=VLZWQ4ss7R38sRfsAcMCLxnvETM/vl8K2ppchOFp/HRUuviSsIlzZtEZ
 4sVc8872kCYJb7lMzSMu9Le4Dz6j2Hzs5Kdvk1I7aJ9eeKSgKg5rqgGyE
 0OCAcZCS3L80lVD7hgnadn60GFCtf+Dy7+o3A/9tpnoqHCSG7XBfVaYHT
 FML37rHNA+k9UhiJef+n4ks1grE8K32KbswmrhEw/fTOEmyYQkr8+s8jp
 tkQX3y6fOrxQwBMUCrpgpBNjey8WSUPVy65BuAYfCVM04gZmJfeHzZ5Ef
 XvkrslbX3+Hfcd/CXywPArPriVwBw9i6otsKWeRmCU2qBbT5LD6vagHDA A==;
X-CSE-ConnectionGUID: PKOgRhDHRTSu3KXCV4/BRA==
X-CSE-MsgGUID: V7J0iHUaTIWBnaiicqAAiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="39664633"
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="39664633"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 09:31:19 -0700
X-CSE-ConnectionGUID: vqS70fIETgmyv/GfCAAnBg==
X-CSE-MsgGUID: VrKFCioYR7eUDkm7J4X5Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="147712242"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 09:31:19 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 13 Jun 2025 09:31:18 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 13 Jun 2025 09:31:18 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.52)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 13 Jun 2025 09:31:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L1IhZD8TDdCo0AcKw2OYh8/hfBC62wKny08x2QuuO0s5Jf+nFNkBJk6ywBb7nTUxGLfzrrtUSTDI5mRXJR51wCIStLcqmH346h4XFNDzebIR2YVTQp10gq6L2f0MEg9guaVivPS+5RH7JiH0q6wF7JVzzM8QMTLe+tvgMoUqxTS8GWLbWpGWYT0P+TFsBfLINI+C8SGH1eK2RRKhHx66ZKUWF7qyvkVpBExZ8OGCL1tblEWXKFZic7MlledjSoidC6VfllboMiUy1GZJP2bfqJH74WHELGbLgV9LiGAi1LWPPHQqCjmZA5OhtzDSy2VxI4HxoxNr/HNF5ut0wM81Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VG83MRVFoGovfEfjOCEDMK/bXj4SBqWSrCr4/yDT8Bc=;
 b=VRWvvmWtiktPBM02CfV0Rgsz6yZMZSPDUW9G/+sdeKvoFn+5/bSFKlspUtvdPbWetEpgNpanM7JRltlWz/1JFrsViTM9lDmH4iNWcLDrciqZ49Ru+gsxoTlzo/dXLP/XJMINb0AQsulrpWqYibHad0syuDdmadMX/3Ah7UpNB9K55fx/+tCIfE4GPMBV9D1258YO5ff4eb4h5YTj/7K6Aiv1gVLBmAMmlD7ICyyTZ0yU8Zyf1Xh5Ou9gJ5/zG5MsiTSK7ENPUSeY+V42qvayMXqnR7eNUFcFEbD+ie2tMPHlHl/mtaN8jf1bifrEqt4srU0s+2WUjC1+n9Oi7Xu06A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by PH0PR11MB7446.namprd11.prod.outlook.com (2603:10b6:510:26d::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.25; Fri, 13 Jun
 2025 16:30:59 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%4]) with mapi id 15.20.8835.023; Fri, 13 Jun 2025
 16:30:59 +0000
Message-ID: <454b4847-5654-49db-925b-68bba716061b@intel.com>
Date: Fri, 13 Jun 2025 12:30:56 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] drm/xe/guc: Set wedged on Xe micro hardware
 initialization error
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>
CC: Stuart Summers <stuart.summers@intel.com>
References: <20250612220925.2286286-1-zhanjun.dong@intel.com>
 <48915a0c-f795-4b0a-96a5-1f2eb62cc301@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <48915a0c-f795-4b0a-96a5-1f2eb62cc301@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0323.namprd04.prod.outlook.com
 (2603:10b6:303:82::28) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|PH0PR11MB7446:EE_
X-MS-Office365-Filtering-Correlation-Id: 40cdd620-75f3-4d19-de58-08ddaa97ae13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y0F1V0pVVWpKN1o0cXR6NndyRWNxTUtwazFCNE1FODNkYTJiMThrYWs5WDUw?=
 =?utf-8?B?QlFnWk5WWDhCdE51M0hYWU1HVTB0RWNvNHBQS1A3WXI5UllsOHdEcTErbUNi?=
 =?utf-8?B?V1NPTjJTU3ZiYWR0VkNFZlZkd05qZ0owakZBTGRxT3FTSmUxU0VjZEVWdGww?=
 =?utf-8?B?bkRBaGYySTFEVjFyVGVONWFZUFAvcnppdEZxR0daWDUwT3VPRXVrQmtxbk45?=
 =?utf-8?B?aDhoNXBtV2t1KzUvM2hCdFpYaFVsSjlwL3R6c3kzZzA4U1NHbXJma1hrekc3?=
 =?utf-8?B?QXJNclRZMEFMRlBieGVKdG96L0Q3Z2x2MDJsN1RjV25jdUQ5ZnpqcDNsWi9m?=
 =?utf-8?B?YkRvTU9YUC82T1hYMTFHTnVnSnl0M3pLSk1xbWNIby9BSWhtcUh0TitHY1lJ?=
 =?utf-8?B?TVR5REordlNKV0RNMkMwQXdIZ2ZtVEZVaU13TDdycldpY2VIdUZ6b1hYV1hB?=
 =?utf-8?B?N1ZnSEM3RW1MYVVpcjZCQkFEMVJuaHlMcmdqVnFMam9MbktLYXA2WlBzVEUz?=
 =?utf-8?B?OTVKbExDcXg0ZFR3ZjYyR3RPM0N4dDhiN2NTRjdJWmZhUWE5RU5GM0w4SVpQ?=
 =?utf-8?B?VU8xb2cvT3M1SW1KUU5JV3JJNnNGekh6OUhGUE1hMzdMY2RNaVdCY3AvZVlI?=
 =?utf-8?B?T25jYVlWT01maER2aFkvOW1oeHBBY1dWbW02NzJ3YkVwQ3M1UnlRVHZKU3R3?=
 =?utf-8?B?QkIzSmpvRVVIY2U2VERmQjdxcHlKeVV0ckpZRThOUWdxRXI0V09hVCtseDdx?=
 =?utf-8?B?by95T3lNZGpjZ055M0Z4bzY2b3hYTnllaGdwNWZaMWgxeGE5eGF4STM3ZE9J?=
 =?utf-8?B?Tk1UakRlTnNrdmUwcy9JWDFkQWlMQ2VZQnMxcnNuMXcvUGNQWGdqbmtiMmdw?=
 =?utf-8?B?MTB5S3NzWHlIcmM3dHJGZ0Y4NG5yVE1IVE9uNk5UK3VoTU9hSFM5V1VINWxz?=
 =?utf-8?B?RWlzOXRtNmlSQkJiSzR6Z1lxenliSzZSdUl2RUo0V0NTY2w1cFRrWGxlUG8v?=
 =?utf-8?B?aDRhSmJVZGFYVDBXVHNwZGhvV0dad3dmVWNUeExDVTc3S0xVN3EvZWVEZ0VN?=
 =?utf-8?B?RWRqWjdQUE1WUHFSbmY1OHMwWituNzlidURWNUJ2U3hncktmSWcwSm84MFN4?=
 =?utf-8?B?T1Mwd3FMa0FGRzZRbXNOZFE3alpwTW5yRWNTSXlzcVBQVGtWa1pGLzg1SERo?=
 =?utf-8?B?UEMvYTB6SmlQbFJZSTB6SmVVTlY2bnlMQ21UVndMZnZyYXVybzlnMm1QeW1q?=
 =?utf-8?B?NFlhN0VwS29qM255QkJMQnJhamdEYSt3ZG91L0R6L3N4aGV5a0hva1JCK2NT?=
 =?utf-8?B?OEM2bFl3UVYyd3A5aEhXVTlkNWhTTzVGUHhrd3EvYWcxNWdCUTE3TG9kSXRh?=
 =?utf-8?B?TWVVa1Z1M3FjN3ZFaXRsb1I4d3RqdnJQdWh4MVA0ZzdaMEJKaHAvaWhFUng1?=
 =?utf-8?B?dzJNNmlqUXRmdnNtK0hkVzdYN25LNUNURjYzTkl6OWFoUVA3V2kyMFVoNytI?=
 =?utf-8?B?N0RZK1JKUzIxVmF3UU5mS2M5U1VSY2pzYkE2K2h0SlZ3WlR2b0Jxb0JKYllt?=
 =?utf-8?B?Q1Y3ZXpuK3FSSWhOVGVBVmJpa2VrV0dxaGpnYUZhUFZER0ZGNS96TElJVFBu?=
 =?utf-8?B?WXFuNUpMK0dYZk8xK3JLd09VK3BFakJMRytCTVBva3ZsUFFFOWFEdWR6RWpR?=
 =?utf-8?B?cEFQYlFEaldkMnVVTFNEb2NFQndKcDFmOWFqQ0hrMjhvNVkyNDdSOEFBVTI3?=
 =?utf-8?B?cmpNTWY2QzFhclRzdGlFTFpjT1E3TFlCbnV3V3cwWm5NN3lEdlhQWVUraWtG?=
 =?utf-8?Q?WgUJXWeSExXy9s6knsW4ehJJZm64EQJuF5hj8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L0lBNjhMeG9Sd2tGZ2NtMHR6dys5ME9BNFE1cjByWktpUGpKZ1Z0d3kwWFNa?=
 =?utf-8?B?dm5RdkFxUFFnNTdEdllveDl4SUp3eE5tU01oMzFNNXJTVVlPY255bXVUZi96?=
 =?utf-8?B?QS9YTm1rNGIzR3U5MlhmdXhTc0ZoYWFRQXhBNVEvTzJEeG1tdkU5SVoxcFBW?=
 =?utf-8?B?SDBGemtrTHNZK3pmU1l1WXlORzVya0hDOFA5ODdZaldkSHRWTjNjNGlsOXZL?=
 =?utf-8?B?Q1V0SnZFWWIzV21XOXliSkFVWUY3MHRYWjdJNlU0SWdhb3ZPUGNPY2E5N2lF?=
 =?utf-8?B?MzEzVGZhblZYd0JxbVliSVdiWk1jMkVkT0JuVFpkTXM3QWx3Y0lyS2hIb0wz?=
 =?utf-8?B?V3lLd2U3UVdRM0pPeG4rUDBuUFUwc1pGU0ZHaG1MQldqaVlHUHlSSEI4TFlP?=
 =?utf-8?B?SVlqM1pOTnArU0REL05VS0xGR1FxNGMyR2pYdElxVzdkbVliZm1WUkYxUW12?=
 =?utf-8?B?MEFzaUUreE5wbFV6ZTQ0Z2xydHF1QTBNKzNlVXdoTU5rdmpubkxGSnNBelZF?=
 =?utf-8?B?by83RE13ZFZseXJQb0JxN3hQOEZsM2pzbmRpNURwbUxTV0haeHpsMVZIYmJC?=
 =?utf-8?B?cFY4MHZJRFZZeHpvZ2ZiZlRFU2wxdDcvMThWaTJFUFBKb1dSTEFudXJhaytB?=
 =?utf-8?B?Z0JydU1rUUZOZ2p0QnVJa3Z5UFlzQ3dNa0ZIMC85U0NTZHpFK05rcHpjbVdj?=
 =?utf-8?B?NHdzUnh3U3V2MFpOMmhSRThZeTJ1eDFlZDNjTzhIOUpzRzZHNVN6ZThmdDk3?=
 =?utf-8?B?WXFXVW84ODI1Z3IrUFJzUmNGYWFldXpNZGpRMjJBS3cwaWZrbCtxVmltSEFI?=
 =?utf-8?B?SDhIRDgvRHFwOEo4Ykw4SUxSZVhBMGUzcU94UzFpR3paWFhPWTJsbTFzK3Vo?=
 =?utf-8?B?V1pQTEpwN28vL2RTZDZqY2RDZE1aYnZzWkg3TjRReUMyeTlYdXp5NFpPR1FL?=
 =?utf-8?B?ZWJTckpvVHJta3JULzZWdWx3MWNGUXZLN1RUeksva1lvTTc5T2RhcmYvSEpJ?=
 =?utf-8?B?ajNoRnJSaWF5RlhycHFzQlN2aEdNY1FiLzVwbHJjZjYvZVEraGZyVnB3VWpv?=
 =?utf-8?B?bzZmY0lRditXWGVPTklNaGxPVS9hV1p1em5HcVNtU2lVNGRCMDNxZVBrSG1K?=
 =?utf-8?B?T0dwZEtlNEw0eGUyMnhkdUwyY29Tb3UvRGlhTTU0MS9BN25GTUdWUldjUk56?=
 =?utf-8?B?Qi9waEdYMlNlS29CQlJ3OUFyTWkwcW5lUjBPVTRJRTZpNUJlL1VOWUJQenlC?=
 =?utf-8?B?ZllrSSs0ZVJ6VWl3RDMvenZiY3hLSklMVld5UFh6ZDl6c3Q3WGZtVmYxN2pS?=
 =?utf-8?B?L3NoMTJ3eElmY0VDUDVOai8xODdSZTZnWnFsZDVyRzFkc3U5d3J5N1RObDc0?=
 =?utf-8?B?cmJiekRzb3FXOEFvUTF3N0lNdi8wRGtBWGFtd3NtaTUvUEN3dmVZZDN3QUd2?=
 =?utf-8?B?cE5HZS9CZnl0dWhCb0MvZjMrcGo5RVQyOWU2TjRpRHl1bEU2NkM3MWdEQURw?=
 =?utf-8?B?QTNwOER0ZHM2aVNyZmZoZWZxdStwRDZFWWFDR01naDljZWMyeVRQSkh1UDRm?=
 =?utf-8?B?WjMwMmZEZzFIZ0duaG5GNFNxVXVZV3lzdmJaZkl1VlE5L0hKUWM1SGVmRnVD?=
 =?utf-8?B?Tks1T2NCSSs5cXRybDJ2UkZJL01jS1dyckpzSnFYQ0l5UERMbkFqdE9JeGN6?=
 =?utf-8?B?bDhQeUlWbDZVRUxmMENFVzZ2WGsrV0Z5SVFIK2syK25JRytkdTlzWTBHeG94?=
 =?utf-8?B?YXJTRGI2eHF4U3hyZnVMcHh1WHlWWElIaUdkQURPajlwcGI1UVJETlRTT1VQ?=
 =?utf-8?B?NWtSU2RPbE8rZ0hya0lrVERPZmNkWTVTQmVLMEdLR0xlcWI0Q294N213ditR?=
 =?utf-8?B?RWhKcmdxVWUrUWZVWGxYV2d6VHRFS3A5R1FQcGFmOGxuYUN0U3A3Y1dISjc1?=
 =?utf-8?B?eU1TWUpQWnRoT0dDN3BtenlQT0dDRDBncHhxbzBKSUIzdEZwUEZ0UjlLOFl1?=
 =?utf-8?B?UVdCSDRhUm1XK2E2ZDdDRXdxNzc4d3RmM2VBRENiYjhBOVB5ZTk1aWJvdmZU?=
 =?utf-8?B?MU5OdmxvazNPZ1lHR0xHRStsbmNyOHc5VHZQdDhhY1pNc2ZNcEt0MlNSdjRx?=
 =?utf-8?B?OXRjZW1rNWxOWEJxbmVCSk1MRVpnT1pYaWs1Z1czVU1WbndPb2RxNHJ0ZmND?=
 =?utf-8?B?ZVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 40cdd620-75f3-4d19-de58-08ddaa97ae13
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 16:30:59.5606 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6s1iOMPuQkR2ozdZ8W2DNQshNl+VDPDR5zSl0OEOAt+Zg/FpzYTudN0u8J0Ik0MVomjQAKzwCJCnS5bPlw6H3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7446
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

Please see my comments inline below.

Regards,
Zhanjun Dong

On 2025-06-13 10:32 a.m., Michal Wajdeczko wrote:
> Hi,
> 
> maybe title should start with "drm/xe/uc:" instead?
Sure>
> On 13.06.2025 00:09, Zhanjun Dong wrote:
> 
> the commit message should also say "why" not just "what", see [1]
> 
> [1] https://docs.kernel.org/process/submitting-patches.html#explanation-body
> 
>> Declare wedged on Xe micro controller hardware initialization
>> failed.
> 
> failure ?
> error ?
Will change to error>
>>
>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>> Reviewed-by: Stuart Summers <stuart.summers@intel.com>
>>
> 
> no empty lines between tags!
> 
>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4917
>>
>> ---
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Change list:
>> v4: Fix typo and add new line
>> v3: v2 CI re-run
>> v2: Remove unnecessary jump to err-out
>>      Drop disable ct, switch to set wedge
>> ---
>>   drivers/gpu/drm/xe/xe_uc.c | 21 ++++++++++++++-------
>>   1 file changed, 14 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
>> index 3a8751a8b92d..77175938fc40 100644
>> --- a/drivers/gpu/drm/xe/xe_uc.c
>> +++ b/drivers/gpu/drm/xe/xe_uc.c
>> @@ -157,19 +157,22 @@ static int vf_uc_init_hw(struct xe_uc *uc)
>>   
>>   	err = xe_guc_enable_communication(&uc->guc);
>>   	if (err)
>> -		return err;
>> +		goto err_out;
>>   
>>   	err = xe_gt_sriov_vf_connect(uc_to_gt(uc));
>>   	if (err)
>> -		return err;
>> +		goto err_out;
>>   
>>   	uc->guc.submission_state.enabled = true;
>>   
>>   	err = xe_gt_record_default_lrcs(uc_to_gt(uc));
>>   	if (err)
>> -		return err;
>> +		goto err_out;
>>   
>>   	return 0;
> 
> add separation line here please
> 
>> +err_out:
>> +	xe_device_declare_wedged(uc_to_xe(uc));
>> +	return err;
>>   }
>>   
>>   /*
>> @@ -197,19 +200,19 @@ int xe_uc_init_hw(struct xe_uc *uc)
>>   
>>   	ret = xe_guc_enable_communication(&uc->guc);
>>   	if (ret)
>> -		return ret;
>> +		goto err_out;
>>   
>>   	ret = xe_gt_record_default_lrcs(uc_to_gt(uc));
>>   	if (ret)
>> -		return ret;
>> +		goto err_out;
>>   
>>   	ret = xe_guc_post_load_init(&uc->guc);
>>   	if (ret)
>> -		return ret;
>> +		goto err_out;
>>   
>>   	ret = xe_guc_pc_start(&uc->guc.pc);
>>   	if (ret)
>> -		return ret;
>> +		goto err_out;
>>   
>>   	xe_guc_engine_activity_enable_stats(&uc->guc);
>>   
>> @@ -221,6 +224,10 @@ int xe_uc_init_hw(struct xe_uc *uc)
>>   	xe_gsc_load_start(&uc->gsc);
>>   
>>   	return 0;
>> +
>> +err_out:
>> +	xe_device_declare_wedged(uc_to_xe(uc));
> 
> hmm, but shouldn't this be really decided at the caller layer?
> 
> this is already done in this way by xe_gt.c:gt_reset() and it looks that
>   xe_gt.c:xe_gt_resume() or xe_device.c:xe_device_probe() are not
> handling that in the same way, so maybe fix should be there?
This function is on hardware initialization level, declare wedged on 
hardware initialization errors is reasonable.
I understand reasons do it at caller level, while if the reason is 
strong enough, then do it here might make it looks clean and straight 
forward.

> 
> and from the issue #4917 it looks that indeed the fix should be
> somewhere in xe_device_probe() or more specifically in the xe_gt_tlb
> code which missed to do proper unwind that would include explicit
> xe_gt_tlb_invalidation_reset() like done by the declare_wedged()
> 
> without that we could see that delayed TLB work hit UAF

Yes, this patch is not a fix for the issue.
For this issue, the solution should be split into 2 parts:
1. This patch, declare wedge on _hw_init error
2. Fix on xe_gt_tlb code.

For part 2, I already sent email to kernel-core team offline, I will 
forward that email to you guys, and might assign the issue (or create 
new issue?) to kernel-core team later to track part 2.

> 
> + Matt
> 
>> +	return ret;
>>   }
>>   
>>   int xe_uc_fini_hw(struct xe_uc *uc)
> 
> 

