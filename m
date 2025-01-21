Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A351AC02187
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jan 2025 08:27:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F59910E1DB;
	Tue, 21 Jan 2025 08:27:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f8JJQYt7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BDCB10E1DB
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Jan 2025 08:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737448022; x=1768984022;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=a+CzCz2IEutRgMnp/Y4lYSit46kuLhQWdsBNGw4uAbY=;
 b=f8JJQYt70csrDYaWX7HtXVt+QPf2/j/PZFQImOlui91NkOsroUbyb3QS
 /Y/6+G0YbVHGZzWoI+8RrzqqRV9zpbMcFNvdNWuVnns8luT74doRWVxga
 vSjyZ7figUGR9GqerxRMPY+u4P19Gkba/ySm/HXMtt7dsEPeqA4dMVYVA
 TtecdoCVxyd5mAThn+p4jjtOdGo/5BY7c+FWUZplowhs7r9kuHAIxhvjz
 qPolOwR5F7JC9tskGeWaw/g6l2TwpmMoS7NZpADK5SjxS5Toa+gR4qMoa
 UyuQDyYmBgK/aBKewVJ4O/lDfj+QP8TmNS8rwQnx0iy5k3wVsS/0Gh+we g==;
X-CSE-ConnectionGUID: X8NmS7ktSXGvtgSXYxyVnA==
X-CSE-MsgGUID: 4v8WFwJtQue9r1+E5NA3Kw==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="37762916"
X-IronPort-AV: E=Sophos;i="6.13,221,1732608000"; d="scan'208";a="37762916"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 00:27:01 -0800
X-CSE-ConnectionGUID: A26oli58Qzeoq5P1ZkCgUQ==
X-CSE-MsgGUID: Yzx2xEkjTb6yzcamml8Uiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,221,1732608000"; d="scan'208";a="107345639"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Jan 2025 00:27:01 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 21 Jan 2025 00:27:00 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 21 Jan 2025 00:27:00 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 21 Jan 2025 00:26:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G4HSmnBs85kSZ1zjEyx9zBQBWuBiuo/WfloWetzbgurPXIGoABJYuPNMS+aaXMTRLv30E9oBkodCRa7b12oUTfDz92+PtDMUiK5ntVEKdh5afJxUpPWVhvZzdeVaV2GAVwjZ6tbl6mOOwiEkqViD0e2u6YSsMlXJyrztu8l4ng8hi4RsYkOm+7Ry0EY7T93NgtuATlSwoUhXZ+ryZYhrIrgTfdhOLGuWdB97h9haKBJwZ+P3Wq19RwbrRD0L+oYf8n/DBYr/qKfBiFIsQdgtMz0eU0IuefiNOD85Z9s4q3nf9wvGAhvIXlXI37UNVGRjq4VBL9TA0k52HGaTB7otvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=03PJaoorkuteHWfInuF6xSasT2IPkvNy2d7kv8mF+Ms=;
 b=eKw/3Mv0pjae4VGLm0GHHur3AT2LueFWFqGttQJFFVRGAeZhiaw2YE/TE1rE02ahFOCUdYUhcc5bviHHd1cfDUYOMJitML7Ui2ZihIomG0OZD6VQJr3x6jXeWSVrEp9xlxHc8wy+QveCGzPMpqoyYuo75n5kVWkI87DcdNFbDYZQ8u6IpP13kf0I8XGIGnkcbZgPE/dBK5Jy4b3+dhGxaH0797PKLoKKbGQQUJ0t7oMUYaAaaplsp3CGKyed5EqesQ6Qe5draPT+/Qqg8fsa+PRBr+RUCOZkN8eYrKyvWo3j+F2g2PP9ir27v+mQBGWyzIlMKFCuy2cou5nGOTzXDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CY8PR11MB7058.namprd11.prod.outlook.com (2603:10b6:930:52::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8356.20; Tue, 21 Jan 2025 08:26:12 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%3]) with mapi id 15.20.8356.020; Tue, 21 Jan 2025
 08:26:12 +0000
Message-ID: <94e0bc3e-897c-48e2-950d-777d40519ab7@intel.com>
Date: Tue, 21 Jan 2025 13:56:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/xe/hwmon: expose package and vram temperature
To: Raag Jadav <raag.jadav@intel.com>, <lucas.demarchi@intel.com>,
 <rodrigo.vivi@intel.com>, <matthew.d.roper@intel.com>,
 <andi.shyti@linux.intel.com>, Karthik Poosa <karthik.poosa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>
References: <20250108092415.289551-1-raag.jadav@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20250108092415.289551-1-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BMXPR01CA0082.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:54::22) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CY8PR11MB7058:EE_
X-MS-Office365-Filtering-Correlation-Id: 2011d83b-2343-4a31-619e-08dd39f5438b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VkFYRG1Lek1jOUFoQUptMlN4MVRvd2xsc1NFWXBLZmVNNHhHNTJldFhyZVUv?=
 =?utf-8?B?QVNmUFJjUTNPTFo2U2FTdHdZSElrME1QM1ZIZndZTHlQZlZWU25ZSnJHaWZx?=
 =?utf-8?B?dTErMkZER1RFVEhoUGpmeGNqcDVLMzIyUGlrRmVyU2RTQ3Zpd1QvWjJCb2xs?=
 =?utf-8?B?VjRsNzh2c1VqdU0wQnIva2lzNyszOXBYWHB0RWVqN1pCOUs1QXJJQ0VPb1U5?=
 =?utf-8?B?aG40OStMOW9mTWVJK2JwRmdEUFJaMVBWYTMrekdydzRIMmlOWHB2V1dXNDFR?=
 =?utf-8?B?VlBvZUNlWmlpVTJVaUxnVkgwcGZUVmkvOE03MERuOWM3TGIwZVRySmY1VG1I?=
 =?utf-8?B?T1BBWDBUdkxrTURYM1c4cWVyL21ZL1pMS2F5VFpHdjRDVHZXR00yNDErK1JK?=
 =?utf-8?B?T00wSzl5ZEdnb3poRWs2SUhlLzRiNzUvaUxRNElHRmdrTkwxdnFBS0lOdXdQ?=
 =?utf-8?B?Zk0yK3U1LzFtUHpGVXpoN2VobHNnbTVtcjdLcEJVQzc0TGhRcjlpcUJ5U25V?=
 =?utf-8?B?MmNSK2FwclNPbHhEV21lZkNkRXAzKzRTbWh3WE9GdGdJRXp4dksyeXFKS3VR?=
 =?utf-8?B?RkN5NnB3b2pxaDhYMHBJMTIxYjY2RkdGa2s5ZmF0RTB1ckZoOHZ3VmNCR1pP?=
 =?utf-8?B?dXJSU2Z4WWdLQ2tZU0lBVmRvNUdiNXRmYU80SXNzZUJ2S0FDUEt6Q0JSTGlZ?=
 =?utf-8?B?Qzc5M25xOTNBRXdqaU42cVpkZHEzZWw2SjdsaG92UWdMQW0waHYvNG84NlJu?=
 =?utf-8?B?YUc2Q05yMVg4V2oycUVYSWR1VUdGL2QwL0N1aHdYZzgwZi90Z3djbGNmNmtX?=
 =?utf-8?B?ZUJJeUtvaEpIM2tFVzRLTHk1TlpkQlUvc3l3N2swdlkyOTVTT1NyOHNIbGE0?=
 =?utf-8?B?aFJrNkZtRjVnaVdmak5WV21SMDJON3ZqU3hGWVVYanNFalBLY0c1eVBtQTJm?=
 =?utf-8?B?YytjZERvbmU5RmtRa2YrYmJiUEV0ZmtMRlk4U3hXVE5NMG5qUTQxb0xjT014?=
 =?utf-8?B?Rm50RFRNNGdzMmZSM1R5cHZ5S01ManhNMHd5RW9RU3FYZ3Z1Znd2T3hubXZC?=
 =?utf-8?B?anNRYlA2V1MxeThBSjVhRzlQUmtPcUpuRHdBNGowWFh2WkN3ekxGSEJWN1ZB?=
 =?utf-8?B?blRPRU9jUTVFQXFudmJqcEtrcTJFblFuRW5BU1c0VUQ0NlZ6SU8zV1NwOGVl?=
 =?utf-8?B?YU5UTUxBMklzNHdKOEorTkwvQjBYVGthYlNHTmROZ2kxWlVxK0luZ1phZW43?=
 =?utf-8?B?RjVZSlk3ZzhRdGdXU0p1c1NibjRnTE54cEN0YkVoUmphNnplVnNaZFBiZFc5?=
 =?utf-8?B?SUU5S2FUcndkUDNneENTN3VPODRETjZuc2R0RS9oUTNRY0hBUjEvSm04V2Rz?=
 =?utf-8?B?YURENkFtZ3RlV3A4ZGQ3UXRzV1ozV3MvYkptZDhYYjk2WlFhVkgrSTErNjV0?=
 =?utf-8?B?L3NNWXJudm1kR3dpTG4wZ2dCZjl0SDVWRGUzVEdCVFRKRlFpejhXbHExRzIv?=
 =?utf-8?B?OTQzcW5ncCtPMWQyRzdWa011TUZMRnJHOThIalAvRlFUZXI4K2d2Vk8xVjZp?=
 =?utf-8?B?TlZ4RkFMUmtPd2h3RG5xdVdHZzdhdHlMLytkUXRLdGlUTTM1QW55M2h3QkU0?=
 =?utf-8?B?VGNQQmQyelN5YTNWWTVJeVlHeUthazNFcnIveTBNZTV6bU41YXdZb2FoSVk2?=
 =?utf-8?B?bnFsRForSmtWWnowK3VteXZPTUZoM1RseE1YWlRMRE9wZnkwUTZYbXpFL3g1?=
 =?utf-8?B?OG1CNEZ1RUJLbmVJb2kvQml0K3pyaktsalJGRVA3Tng3eFVmWGkwVjJTZEhI?=
 =?utf-8?B?ck1PWnc1ODVjUlcza0p3ZmdmaDRudkFXTmo4S0FMcjFIa1hoamJHaC9DRUZV?=
 =?utf-8?Q?JIu4AS9DgvuaT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ckJkY2Q1VERTZ1Fvb2twbU5FN0hJczY1SVZGQlhxT2x0NWJ3aHdaeFdKV3l3?=
 =?utf-8?B?cDkycDUxL3p5Y092cng1bWVGRUpHMjB6WkUvWTZGUTE0ajd5YW50SmZBaS9U?=
 =?utf-8?B?MXIzRU1GS3p1TWJZcDF5WSt3Y2p2enZtZDBONWd2OWQ2M2twTkN1L1R2SEs0?=
 =?utf-8?B?OUgzSVBMSlZRWjlEUXJDbStqODNJNHFoWmE0QWhtWFJieUpINWt1YzFIN0Fx?=
 =?utf-8?B?dUpuR3JUZm1SSG9KYXFNMUpBd2toU0JnSmtQR095dlIyZUQ5ZkVVMCtMTlUv?=
 =?utf-8?B?OXRBNG1SMFVlTmVwbnAyeE5MZERPSUlVdmdaVTR0K0R1M3NRTjhiNlF2cFd4?=
 =?utf-8?B?eHNnL1oyNHRId3pCYmhsTk1sdXppMFQ0K0I5WTdYZU56U2pmZ3BSM1BmT1B3?=
 =?utf-8?B?K085dytuT1NIL1VFcThVUVBScEREc29BNDEzTDJIRmZ1ZHZMTUpOSExsVUZO?=
 =?utf-8?B?OE5WaGFxSzM0TVpHV2dMVXN4Nkt4d3RxWGY2SUxOdkRNbU1HTlE4cWlwbW0x?=
 =?utf-8?B?NktqUVFrZ0xKTjY4YWRHV0wxeDZ3dUpPSmNNb1JmTGZrSklFb0FLY2t4aWtC?=
 =?utf-8?B?OTF2NlVFNXhiRkhRdWhha0hncTEvZUNCaW5FNWdrYWttY0dvc0VtRmpWWWhB?=
 =?utf-8?B?V3BaaHdnTjZjaFo0MHhrZCtFaW5aN3p6L0dWdmpxeHhaYTdvbHpZV0JBbE9W?=
 =?utf-8?B?THVlZHh0emppZzFBang2R3psZndJdFI2dWFiemkydnJGWTZMQ0tPcnZuNjhW?=
 =?utf-8?B?Ulc3Uyt1cHNONkpCV3JWM2UxQno1NzVTUURoYXRza3pRZE1MeFgva291U2Js?=
 =?utf-8?B?ZnB5T0JQVEhCbE5GTVVZcnd4bUR4L0txeEdpYnpCdnkwUkJwS25pWFhaMG16?=
 =?utf-8?B?T0xFbDVZRWwzb2FhOGdzWlJPbTU4VUU3bkNtK3dUb2hVQ2FKNkFneDA0dDBL?=
 =?utf-8?B?b1RGZmYwYUozZzVNc1hHYWFOZ0hKWmp2TVErU1VoUkhEcm4wV3NaaWsyV2RZ?=
 =?utf-8?B?MTZ3aVFNeVZPdFBhVU1yemZIVW1oWVFUTUd2RFVjby84alJTelRGTHFid1dU?=
 =?utf-8?B?SExSNGlGOEI4ajRBbGovQkwwMkd1OTVmWmd2YlhPK3BiNXIvbTdBT3BLM0tU?=
 =?utf-8?B?cmhsQ2U5QTQwSU1idTRjaEthRjU4ZjhHbDRrQkMvWHQ0dW9KOFZDT1NXRmhr?=
 =?utf-8?B?c1U1Um5xREYxR1ZYa0t4TlJIcjQ4RFpIeS9GSXpOenZyaEJKSkIvc3R0ZExG?=
 =?utf-8?B?L3oxNzFRMDlxcEQzeTd3ZVJnMVk2TWQza3h5RVN6LzdoZFlIcE55YkhzRTZi?=
 =?utf-8?B?Y3VvbzlvM2lFVDdvOXM1dVJtOHJCYkZPYzkySXpUMktMbTUxSHdMS0xUYVFw?=
 =?utf-8?B?eVd6MHY2ZzVYSG0valJvZHRNOEVXLzZ6Q2N4NnpEbVBua3kxeDA1aFJDcCtp?=
 =?utf-8?B?dDFuejQwTEpscjRURlhBL1dZeFlZUDhZUUN1WFZlS3FXZVFZTmZJQWQycWs0?=
 =?utf-8?B?VCtHdHBFNzNScnh5QVhnWHVQL20rUjJuQk8zdlYxVWtvQjlzSElySnA3SUFL?=
 =?utf-8?B?Uk41cGVodkJSNXQ0REs5dlMvaWFxL0tNYUNaUHBIRlh6d0xYaCtiWndaUEEy?=
 =?utf-8?B?a1VrazEwSi94MUh2ME41WDZTTkhZbVpLVjVwSytNWTE3T2I3cDB4NXlxaTJU?=
 =?utf-8?B?T2pGeU56bmx2a0lrRXRXWTBFdFZBUEY4UHRpM1IzWitENE1KTnFOVmdOWEVJ?=
 =?utf-8?B?QmRieE9IeW05MVcySm9tM1VueDhrLyt5TGwydWdkQ2h5Z0tSSVNUQnBwT05I?=
 =?utf-8?B?TFdRbCs1dlFiYXRHaXdLdSt4cnljWkFRd1I0ejVBbmJQQTRVTFY4RDFpbzNa?=
 =?utf-8?B?c1lFbEFtc1VaUkxNTGV0TWlCWDFtRUVQbzhSeDExSDVmK0NzU2xTMHQzd0pG?=
 =?utf-8?B?YmZOdmpuTnUzRDZvUnlhOWJtS080ZXlSRmhZbHI3RVdRUXRsVWppZXc5WU9V?=
 =?utf-8?B?Vm9lR3lPUWV6Y0U1QmtBNEl5WHhBYzFTWkNRbS9weHdTMVJMSHJQVVVTMmtV?=
 =?utf-8?B?c3VvdFdZczN1QVp6SmQ2ZmlmZHpYZGZwVmV0Vm9LN2JpUEE3Um54QW55RXJR?=
 =?utf-8?Q?uShIbhnPOYfdF3LIycPk2yyMC?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2011d83b-2343-4a31-619e-08dd39f5438b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2025 08:26:12.2863 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k7s2A8ySEiOgjxWNTzJKl7MzeJ05JLMRtBAwTGv2XHqBIag6sUW6FV26UrNolC92MJevXJrkUNDmb3JcBTB4dQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7058
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

Hi Raag

On 1/8/2025 2:54 PM, Raag Jadav wrote:
> Add hwmon support for temp1_input and temp2_input attributes, which will
> expose package and vram temperature in millidegree Celsius. With this in
> place we can monitor temperature using lm-sensors tool.
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>   .../ABI/testing/sysfs-driver-intel-xe-hwmon   | 16 +++++
>   drivers/gpu/drm/xe/regs/xe_mchbar_regs.h      |  3 +
>   drivers/gpu/drm/xe/regs/xe_pcode_regs.h       |  2 +
>   drivers/gpu/drm/xe/xe_hwmon.c                 | 63 +++++++++++++++++++
>   4 files changed, 84 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> index d792a56f59ac..998cfb0ee1a6 100644
> --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> @@ -108,3 +108,19 @@ Contact:	intel-xe@lists.freedesktop.org
>   Description:	RO. Package current voltage in millivolt.
>   
>   		Only supported for particular Intel Xe graphics platforms.
> +
> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp1_input
> +Date:		April 2025
> +KernelVersion:	6.15
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:	RO. Package temperature in millidegree Celsius.
> +
> +		Only supported for particular Intel Xe graphics platforms.
> +
> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp2_input
> +Date:		April 2025
> +KernelVersion:	6.15
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:	RO. VRAM temperature in millidegree Celsius.
> +
> +		Only supported for particular Intel Xe graphics platforms.
> diff --git a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> index 519dd1067a19..f5e5234857c1 100644
> --- a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> @@ -34,6 +34,9 @@
>   
>   #define PCU_CR_PACKAGE_ENERGY_STATUS		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x593c)
>   
> +#define PCU_CR_PACKAGE_TEMPERATURE		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x5978)
> +#define   TEMP_MASK				REG_GENMASK(7, 0)
> +
>   #define PCU_CR_PACKAGE_RAPL_LIMIT		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x59a0)
>   #define   PKG_PWR_LIM_1				REG_GENMASK(14, 0)
>   #define   PKG_PWR_LIM_1_EN			REG_BIT(15)
> diff --git a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
> index 0b0b49d850ae..8846eb9ce2a4 100644
> --- a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
> @@ -21,6 +21,8 @@
>   #define BMG_PACKAGE_POWER_SKU			XE_REG(0x138098)
>   #define BMG_PACKAGE_POWER_SKU_UNIT		XE_REG(0x1380dc)
>   #define BMG_PACKAGE_ENERGY_STATUS		XE_REG(0x138120)
> +#define BMG_VRAM_TEMPERATURE			XE_REG(0x1382c0)
> +#define BMG_PACKAGE_TEMPERATURE			XE_REG(0x138434)
indentation.
Also you are using the same for DG2. Should have a common name
>   #define BMG_PACKAGE_RAPL_LIMIT			XE_REG(0x138440)
>   #define BMG_PLATFORM_ENERGY_STATUS		XE_REG(0x138458)
>   #define BMG_PLATFORM_POWER_LIMIT		XE_REG(0x138460)
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index fde56dad3ab7..5b5c844adf4a 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -6,6 +6,7 @@
>   #include <linux/hwmon-sysfs.h>
>   #include <linux/hwmon.h>
>   #include <linux/types.h>
> +#include <linux/units.h>
>   
>   #include <drm/drm_managed.h>
>   #include "regs/xe_gt_regs.h"
> @@ -20,6 +21,7 @@
>   #include "xe_pm.h"
>   
>   enum xe_hwmon_reg {
> +	REG_TEMP,
add to the end
>   	REG_PKG_RAPL_LIMIT,
>   	REG_PKG_POWER_SKU,
>   	REG_PKG_POWER_SKU_UNIT,
> @@ -39,6 +41,11 @@ enum xe_hwmon_channel {
>   	CHANNEL_MAX,
>   };
>   
> +enum xe_hwmon_temp {
> +	TEMP_PKG,
> +	TEMP_VRAM,
> +};
Can't the existing channel enum be used here?
> +
>   /*
>    * SF_* - scale factors for particular quantities according to hwmon spec.
>    */
> @@ -84,6 +91,19 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
>   	struct xe_device *xe = hwmon->xe;
>   
>   	switch (hwmon_reg) {
> +	case REG_TEMP:
> +		if (xe->info.platform == XE_BATTLEMAGE) {
> +			if (channel == TEMP_PKG)
> +				return BMG_PACKAGE_TEMPERATURE;
> +			else if (channel == TEMP_VRAM)
> +				return BMG_VRAM_TEMPERATURE;
> +		} else if (xe->info.platform == XE_DG2) {
> +			if (channel == TEMP_PKG)
> +				return PCU_CR_PACKAGE_TEMPERATURE;
> +			else if (channel == TEMP_VRAM)
> +				return BMG_VRAM_TEMPERATURE;
> +		}
Common code for bmg and dg2. Can be moved out

Thanks
Riana
> +		break;
>   	case REG_PKG_RAPL_LIMIT:
>   		if (xe->info.platform == XE_BATTLEMAGE) {
>   			if (channel == CHANNEL_PKG)
> @@ -431,6 +451,7 @@ static const struct attribute_group *hwmon_groups[] = {
>   };
>   
>   static const struct hwmon_channel_info * const hwmon_info[] = {
> +	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT | HWMON_T_LABEL, HWMON_T_INPUT | HWMON_T_LABEL),
>   	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL,
>   			   HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_CRIT | HWMON_P_LABEL),
>   	HWMON_CHANNEL_INFO(curr, HWMON_C_LABEL, HWMON_C_CRIT | HWMON_C_LABEL),
> @@ -506,6 +527,36 @@ static void xe_hwmon_get_voltage(struct xe_hwmon *hwmon, int channel, long *valu
>   	*value = DIV_ROUND_CLOSEST(REG_FIELD_GET(VOLTAGE_MASK, reg_val) * 2500, SF_VOLTAGE);
>   }
>   
> +static umode_t
> +xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
> +{
> +	switch (attr) {
> +	case hwmon_temp_input:
> +	case hwmon_temp_label:
> +		return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_TEMP, channel)) ? 0444 : 0;
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static int
> +xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
> +{
> +	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
> +	u64 reg_val;
> +
> +	switch (attr) {
> +	case hwmon_temp_input:
> +		reg_val = xe_mmio_read32(mmio, xe_hwmon_get_reg(hwmon, REG_TEMP, channel));
> +
> +		/* HW register value is in degrees Celsius, convert to millidegrees. */
> +		*val = REG_FIELD_GET(TEMP_MASK, reg_val) * MILLIDEGREE_PER_DEGREE;
> +		return 0;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
>   static umode_t
>   xe_hwmon_power_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>   {
> @@ -667,6 +718,9 @@ xe_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
>   	xe_pm_runtime_get(hwmon->xe);
>   
>   	switch (type) {
> +	case hwmon_temp:
> +		ret = xe_hwmon_temp_is_visible(hwmon, attr, channel);
> +		break;
>   	case hwmon_power:
>   		ret = xe_hwmon_power_is_visible(hwmon, attr, channel);
>   		break;
> @@ -699,6 +753,9 @@ xe_hwmon_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>   	xe_pm_runtime_get(hwmon->xe);
>   
>   	switch (type) {
> +	case hwmon_temp:
> +		ret = xe_hwmon_temp_read(hwmon, attr, channel, val);
> +		break;
>   	case hwmon_power:
>   		ret = xe_hwmon_power_read(hwmon, attr, channel, val);
>   		break;
> @@ -752,6 +809,12 @@ static int xe_hwmon_read_label(struct device *dev,
>   			       u32 attr, int channel, const char **str)
>   {
>   	switch (type) {
> +	case hwmon_temp:
> +		if (channel == TEMP_PKG)
> +			*str = "pkg";
> +		else if (channel == TEMP_VRAM)
> +			*str = "vram";
> +		return 0;
>   	case hwmon_power:
>   	case hwmon_energy:
>   	case hwmon_curr:

