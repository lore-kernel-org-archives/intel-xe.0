Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28086E77173
	for <intel-xe@archiver.kernel.org>; Mon,  9 Dec 2024 10:39:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2B1D10E6BD;
	Mon,  9 Dec 2024 10:39:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AfaYIuaN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41C2F10E4BE;
 Mon,  9 Dec 2024 10:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733740793; x=1765276793;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nvhN3F1i1FUyn7WsBjzsMQ9x7qM9Bd6KzdE1UgQH+1M=;
 b=AfaYIuaNsWwctmS/hKLX45UviRMh4tISxNR+CxznWLudVQGgZEE5O+qc
 sPdeAXsg6Eg5/gLvICf50axNiDbqzZB4ddYjgV6gmC8hT7D2/JFhKKeym
 +JfalR5A7QrMb1lDjPlKTs/6Id1uDE5bO3IrRBk1SE/RmMxSyub6Vrdua
 uNB/qG6exj8DmdfX6n9KqSLd+JjI2sDYL2RKk72q92HLDZ/PlX3E9L9lx
 CR9afJ9EU8u9HYNNfg+fxYURXJjnmbbLmlLTQMqd5m47k/e/FfNv3r9iJ
 E3JF0nacpAG3tGt8lkAZ7iMuCNfgAa1f+dzuKRSnhlEGMbKixUpA8rccX A==;
X-CSE-ConnectionGUID: UWWwhjmwR8qGK9urFU2/cg==
X-CSE-MsgGUID: cOTElPVtQY6yvtmvMUzHMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="51445379"
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="51445379"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 02:39:53 -0800
X-CSE-ConnectionGUID: lm9RAm0HRUypCH29mgl7BQ==
X-CSE-MsgGUID: rZ7Ee5dsTYCdvLPSRhp6Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="99985190"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Dec 2024 02:39:53 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 9 Dec 2024 02:39:50 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 9 Dec 2024 02:39:50 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 9 Dec 2024 02:39:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZRVWZtetgtvfibFRM6V9Hx2TVEP3zHSlUd/+kSeuckpdCZDvKTpd0QS9wNVBho6RmXpQduZcuwQu7IlENk5XQ/QYa8nFQsVH4C8RXnlqgvsrpkfVCoFZl7m6hqv0b9A7m9IjLGt9vetWvcSw3DuWQnH8yhwmhf5JGCzWF3yQWKhLZvMGOOVWtV6JVoL+XgayOrW5vfjtosaW9iSlPVMBAvZs7U0u5CfJ80O6BKuWkhLXPAlj1xsB1knAg8gW3eTwmtslTe0qTYDxiC6VU+kuoA0HOHC/ddCnA+udKmAwR4x5vwJfWmeiGj78+8fyfKzfdGJX91VtMtRRXLx+3jLMTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9w6C43atMHoMLhFrORQScfv1ZFYi1kIiXvo+hQVIDW0=;
 b=b4iR2BetmuH0LKCtH8P3YErA/vf6ocQd6vTQ9Go0tep5KfNPU25/ujUaR4B+KpWRUYIvUYiweXAFvq1PuzV2nmLhY4d99vPzgSOaLTC50kqakqKbvlTG658IF6lEcMT4tfT+7e+dh0fvyO8ejZ/y++EsAz6mFgGtoeZ/xEjs2lUGz+nCsq867gWQzL5J46S43/YxmEQMw8bh6LiZCBkK2YB3GelGPmxDNgDEfT5Jjl5V/xA7nhvffhjCvGfLwoUHHoAKw83l4hRdOppgXm0PLU55oTxyH+HblNUvj77s188Gzf5v7K7DfUM+DyGGTFUO20OjJXKooh8Q3DDP2sDEIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6614.namprd11.prod.outlook.com (2603:10b6:806:255::11)
 by MW3PR11MB4570.namprd11.prod.outlook.com (2603:10b6:303:5f::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.16; Mon, 9 Dec
 2024 10:39:17 +0000
Received: from SA1PR11MB6614.namprd11.prod.outlook.com
 ([fe80::aa2a:7e7a:494b:3746]) by SA1PR11MB6614.namprd11.prod.outlook.com
 ([fe80::aa2a:7e7a:494b:3746%6]) with mapi id 15.20.8230.016; Mon, 9 Dec 2024
 10:39:17 +0000
Message-ID: <012b2815-6bb6-4089-860c-dcedbf029b87@intel.com>
Date: Mon, 9 Dec 2024 11:39:13 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t] lib/xe: set hwconfig NULL for unsupported platforms
To: Tejas Upadhyay <tejas.upadhyay@intel.com>,
 <igt-dev@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
CC: Matt Roper <matthew.d.roper@intel.com>, Jan Maslak <jan.maslak@intel.com>
References: <20241209085709.1979242-1-tejas.upadhyay@intel.com>
Content-Language: en-GB
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20241209085709.1979242-1-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MI1P293CA0004.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:2::13) To SA1PR11MB6614.namprd11.prod.outlook.com
 (2603:10b6:806:255::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6614:EE_|MW3PR11MB4570:EE_
X-MS-Office365-Filtering-Correlation-Id: 5864d4eb-512a-4ad5-eda1-08dd183dbb2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SGd1ZEFXSTRsQkoxZ0tQdGdPemVYUkRyS0Jyc1N1cEpLaUlVNUp3cER6MkZm?=
 =?utf-8?B?cy92ZkZWV0s2M3R6SFF4djV1K3BIVkFJSURMM0d3K1ZlVTU2a3NSU01BaXZm?=
 =?utf-8?B?RnY5MTZhbXF5UVZqTUJBclduWjFucUV2OUpma0pQbEloeDVEMUNjQkVGaEdI?=
 =?utf-8?B?UXhJSzRFSVhSUTNMb0lFVWxsWTUralJuSldGMXdIc0l4Sk1IUXpNNHUwUUNz?=
 =?utf-8?B?TGR4c3N0blNTTmRoVEoxZ2ZWZWVqMTA4S2ZTL2E2eE1mSWVNMXc5MDBqKzRJ?=
 =?utf-8?B?MGVmZXpnYzVaRjQ2NWlmaHJnaHFQZWhuSmpPTDBOdmhJbGRocVpqREdKcFcw?=
 =?utf-8?B?OU9BWGd1YXF4T2xXNGNORVdvbGNWdnFDSXkvN1ZCWDlUTENnSnU3VGVFL0wy?=
 =?utf-8?B?dyt6QTZUZFZDRm1iYmFDdDZYQVRQTU9ublVqZVhEZmo4WmhnK1pKMTV5MkY0?=
 =?utf-8?B?VnhPdzhORTRrejlNZU1QeTUrc3krZTFlNllCVkk1R0tUOW16a0tYWTAxVXZo?=
 =?utf-8?B?c2JsZC90aTN4S0o2aFhvRzh4bjFObWpqdXdwZk13Rm9nZWJ4T1NZQzZNVmJy?=
 =?utf-8?B?UWZncm1wMkdVK0JVNUpOV0lUSm1ENUJKcGU0eE50b0FpUWJibmdFWEx3V1JZ?=
 =?utf-8?B?L3lFa3pMM204R3pxSWNLOWEvaVNya2F5OEp0TEVXVWxudWRobXBJWVNjNGhG?=
 =?utf-8?B?bUxsRVFYSnlGUERySlBpTURkNmJ1S3dGaHVtbVRueTllaHhwTUx6WC9qYUxM?=
 =?utf-8?B?dVcyRFR1S0oyVmdWSjN5K1c4MjJmUkYvc1dwd1ZJdE9rYTdnb0JXbjFzakdm?=
 =?utf-8?B?b3l4NFBVUzkzMGtLOHBZQWlMWHpjT3BNQTdSZllLL2hkV3YrZjNCMWFIcFlu?=
 =?utf-8?B?b25Pd08rd2R4U2d4UzViQkVjbjVUc3VFc0JCd0xwdjZWdlVxc3c0OUYwb0U0?=
 =?utf-8?B?VGlXa2ZvcXhsUzNBQmc5aFdYMmY2cTJmZzlENk1jbjZZblhZbWp1RitSZ09L?=
 =?utf-8?B?anFtT2dIZUlZNERvMWd0U2lXQUxaTVJzQTlTczZlNHkzUTNGc0JHdkh5SmtZ?=
 =?utf-8?B?VDRWdURobndqKzI3d0YwZGFydnpMR2ovbVhwQmxGRzhxL1ZyZktwQzVzaXhI?=
 =?utf-8?B?d2NDUWk2azhQT0oxU1YrVHNiZmVDUlpnSnVGdGZDTTNsQWZEbVJEbUpaQ3NY?=
 =?utf-8?B?cUtHMjV3dWJ6SGVsZk9tTjRpNWpmQXhtWHh0MnJ0ZGU0U0ZFbEpYT3YrdGRm?=
 =?utf-8?B?VTQ3T1hJbk91QzEveFJJTHMvQ1B5Unh0azlhYldSOGU4T21KV3UvMlpxU1lR?=
 =?utf-8?B?d2tIbEVRQlZnMXB2WnVxZ1hKUUpSc09iZ0NzZ2d0cDQ2dThoZUdBSkttRDRu?=
 =?utf-8?B?R3NNSzFNNzlNcmdQUkpOYmQrcjFTRW9hUlBxRWFPUnZJbGhHWHdXbVJ2ZFVy?=
 =?utf-8?B?eGZXOE8wN3BtOS9acVRLVWpRUWcxZnpIZlcvL0hIMVg1MjdvUVBGcWdUUUpZ?=
 =?utf-8?B?V2FNUFlYRUpHTG0yYm81VktXMWI2QmRwcFNmVm90VUJXTG1wY2VpKzQwYWVM?=
 =?utf-8?B?RmVGTDgza29tK3Y2N2xjR2c3cFFjalZERHdHNzAzcFgrMWN6WDV4UlZZODFT?=
 =?utf-8?B?RUJhYmwrVzg1c3ZlazNHYjQvWjFpTkJXMEVxYVk4RWQ3TW51Tkp4Y0tUTXB2?=
 =?utf-8?B?eDJ2WWluUzI1QUVNbTI1UCtSc25PVzl0R0pkd2pKcmtLOWNzV1Jja2FNbXdh?=
 =?utf-8?Q?sVeeR73vCn6zij/gQc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6614.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bU5HYUhEckxHcHQwY1hpSUhhWS9kRE9aRVJPN3VsNlNiYWhaQzB3RjVNUnBD?=
 =?utf-8?B?YjMydWlKN2VOUGYxYUgvRmJRWmt1amc2N0xuYkdteTFaVXB1VlovTERIckZq?=
 =?utf-8?B?MnF1cTJ1b0R3a0F2dDUvN1lZcXVBNWN4WHVYTnBmTFZYVEgwTENBOGpzbjZk?=
 =?utf-8?B?NVd6LzhMVlJTNjRNakRDemJkaGpKVnBEdUQyeHhIbzA1amlqSStVWEdjYTJY?=
 =?utf-8?B?N3hZdkdkZFFLWU1JRWJ4RTBIT2Zla0EweVFwWHZVUk9VTzFidVp3VDBYUzZK?=
 =?utf-8?B?aDdxNjNKMWpPaUlOam1JTVliOC96aWh4OTUzWGdYTW5pTkVCOHRyQTJEa1hI?=
 =?utf-8?B?T2NhV2tmNys1N25paUNPQ3pGQyt0eFI1SHB2TW5vWTBRVWFRU20xODljajRi?=
 =?utf-8?B?L2Z2dUZsVVVjejcxdTh4TkRmdkRBQnB6cEIwWlNZQysxWkppb2xudHVMOTUr?=
 =?utf-8?B?VnkzdkxCRXA4UWloZXVXYlBUNFpIYTh5M1A4bDFtcVVyb3p1QTl5UlhVaGwy?=
 =?utf-8?B?M2tyZlRVelhWOWU2R0NtQVVkMk9wSkNKWFNQeGQyTmx0RmZhWVNnQTI4WUZs?=
 =?utf-8?B?S2JTczZ1Y2FNRTMyc0s4VjNlL2U4S1BXU0I5Mk1WSXdNeFJQUThHalFLVU50?=
 =?utf-8?B?N0d0d1pHUCtOSWVRTU1PZ2loL2QrclZuc0xhUmc5dWI4Umg3VEZ4L29XQU1J?=
 =?utf-8?B?ZFFqZy9iZkZyVVZrVWwxNTVSMWxBYklWdUtOQkhqUFVRT1YrbkhxVzNZckZ2?=
 =?utf-8?B?VFVZSXVSUExNRi84T0JRY0xjVFBvSDVKWE9JRTNidE9hQVJkbFBhWk1FK0NL?=
 =?utf-8?B?UkRIdC82SE4rc3A5bEthRkg0Wmk1RUN1VG1WalQzRmJhbkZDSXpFVzNoV2Ny?=
 =?utf-8?B?SzhuQlV2dFBSSkt3WUpZdGVEenRjTVkxN2RwM1lpeWt6L3EvZzR2NW4yNW50?=
 =?utf-8?B?NnZUSlNLSW93NHpXc3JnZ0FxZ1BrUHIxK3pmbGhQandjc3dneCtpSkhodjhN?=
 =?utf-8?B?bmcveXJONTFXQ0lvK3BLQ29LNVNxQXlOdzBUOWNQMWFlUTRlY2V0NElNbzVK?=
 =?utf-8?B?bnRQazhmMFgwc0hRaXFYaDNzakJhZy9RbllKOHRyaFhURTZjRGszeDlCUEt1?=
 =?utf-8?B?NEtHaW80c2J2Y1A2MmpQcWcydlNCQy95eDF6SW5FK0Vnbis5ejFpeUM1eHdD?=
 =?utf-8?B?RlUycW5pc014U2FwY3ZMV1NKbWtMbUhmNUF4dGhPYnVNRUo1NFhUS1U1eFJ6?=
 =?utf-8?B?bE9zZTFNaU1aeHVUQlgwa296dCtmblVxSGFtWHNNbVJDVis4QWQwb3JlY2dk?=
 =?utf-8?B?WFFPaS9PNEw5WkZSNHFCK3g2bXB5OTZIVmhPTDFHaEhNQU13NnVSU2hVL28x?=
 =?utf-8?B?M3FCZFpiTDZRcUJBT0VRcU5kUy9WRUtSUWVSVXBBMmM0cnkwZVc2TE44ZzV4?=
 =?utf-8?B?SUdMTXZMdXhwTVczNlp6TzBqOHZtbTVYbEdMb3BhZ1BsRk5TcHNhSWl5MHpj?=
 =?utf-8?B?T0hHV1drdGcxc290N3owWUhmQkFKWFdLS3F2Rko1cnp3MWJHeUkyTjVkQzhk?=
 =?utf-8?B?YlFkZGhZSkFyVjczdEhXdlcyWW4wS0FjRmZOZXNrQ2hQenhBTEZMTnpVdTZ5?=
 =?utf-8?B?NWk3U3pqbDlwZ0M3ZmdwVmZzR2V6bDVYc0ZESWhEcDJUNzAyRXdJRmZRbnFt?=
 =?utf-8?B?cWE0ZjMrd2J0QTc0eklTVXk4OWRYcWkvd3BHbUMzdk1iQ1UwZS8xdnFEZGhO?=
 =?utf-8?B?S2t4UzAxaUg0L0VkRE1iZnByNU85QllJQXp6S1lTcXBJU24yeWo3Sjc4eFZO?=
 =?utf-8?B?aExtcWpoZWlZVzQzSHpiaWFFdkJNazNDeEp6RGdqKzNURzhweW1jMW1mQU5u?=
 =?utf-8?B?ZklSZmtjSDF3N1dKM2kwdmhpUTJ1VHBoTC96WXZnWHI4dDlaTy94SjlwZ0hP?=
 =?utf-8?B?RVlTbFZrZHQ2UGsxdXlnckVyRGJiTDJSOGVaV1lLWXQ5UExFM2NIUEZMSHg5?=
 =?utf-8?B?cXhRUHltNXowNTNVejd1VmdiTFdUbm9yWHdBNE1Ma2c0cTRmbTVVaW94eFZk?=
 =?utf-8?B?QTNYWkNkTE5PUzQyN3ZJckc1Vno3OWsxTGFpRTEwNU9lQ2ZpMWhyMUp1U3Ew?=
 =?utf-8?B?MkQvbDZlSXhwSTMzVElaZmM3NTd5eER5T1hoS3I0YzNiVlVoY3ZTMDVUeUZr?=
 =?utf-8?B?eEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5864d4eb-512a-4ad5-eda1-08dd183dbb2a
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6614.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 10:39:17.1289 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zx3lgDOzGR8OmWn2MH7U2PcLIU9sO9hzZwgGFbYDid2+DkNZZ89ZesqAFWRDGRkvP5qvuhYhkmK8u4lsx3kEjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4570
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


W dniu 09.12.2024 o 09:57, Tejas Upadhyay pisze:
> There are hardware platforms which are not supporting
> hwconfig table, for example ADLS. Querying hwconfig
> on unsupported platforms leads to assert and failure
> for some of tests like,
> ./build/tests/xe_module_load --r load
>
> https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3683
>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Jan Maslak <jan.maslak@intel.com>
> Fixes: 37a230e50 ("lib/xe_query: add hwconfig to xe_device")
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>



Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej

> ---
>   lib/xe/xe_query.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
> index f3731d9d3..8f0a5392c 100644
> --- a/lib/xe/xe_query.c
> +++ b/lib/xe/xe_query.c
> @@ -51,7 +51,8 @@ static uint32_t *xe_query_hwconfig_new(int fd, uint32_t *hwconfig_size)
>   
>   	/* Perform the initial query to get the size */
>   	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
> -	igt_assert_neq(query.size, 0);
> +	if (!query.size)
> +		return NULL;
>   
>   	hwconfig = malloc(query.size);
>   	igt_assert(hwconfig);
> @@ -858,7 +859,8 @@ uint32_t *xe_hwconfig_lookup_value(int fd, enum intel_hwconfig attribute, uint32
>   	igt_assert(xe_dev);
>   
>   	hwconfig = xe_dev->hwconfig;
> -	igt_assert(hwconfig);
> +	if (!hwconfig)
> +		return NULL;
>   
>   	/* Extract the value from the hwconfig */
>   	pos = 0;
