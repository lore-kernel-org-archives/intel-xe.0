Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78A4BC27C4F
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jun 2024 07:51:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3918210E164;
	Wed, 26 Jun 2024 07:51:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nb1MzKIJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1EF410E164
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jun 2024 07:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719388306; x=1750924306;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=U/7BTD3KEaJWkE5DqmxkRC7aJusBWd+hmQW3txbDKb4=;
 b=nb1MzKIJCpnuPsyPb+KuI2QOzBMweJin+tN1MuHKtHRvyhyUCo4AAQ4w
 uu4IafameWAqQ/YWp7HNGcBlDBXez29pXOGUUc6Zq7/dSkCsC24tORZJm
 VWfWG9j7cUep3D1arGACojtKSgPuWeL4E/2LDcOmIFexm2hTPuvhlSfQQ
 QaKQMQ/mu07kEF/Gs0qsyuX6O09qraBrqqpvNvv0tRT6L2kNqbcjJb24J
 6uEG8wXI7er6GyPyj9JPoqmfTku1EdOz8d+TpuGf+VVPmOSNrzNHQeHNs
 4vgjynMxJh92cMg/Rg9QTM4LXsSKtS183iqGU97nDMnftta7V03FyoKpW Q==;
X-CSE-ConnectionGUID: FR99iMUqSPuYkEADAr0b1A==
X-CSE-MsgGUID: PdNQs7UuRDqceKV4j1zNEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="27034727"
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; d="scan'208";a="27034727"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 00:51:43 -0700
X-CSE-ConnectionGUID: QQNLWp80TCeZbQRKnK7I7g==
X-CSE-MsgGUID: Cukj0zDJSR2lUNgad5ud5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; d="scan'208";a="43812512"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jun 2024 00:51:43 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 26 Jun 2024 00:51:42 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 26 Jun 2024 00:51:42 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 26 Jun 2024 00:51:42 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 26 Jun 2024 00:51:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y/kwVDBnua2wN2u4ueRUWig1cD5tR/pkCAKsoyHMHDMx6Dmx6TocZ69ZMjyFsIoO/q+17Y1M/7DdL/g2TMMBXFl7F5jtTSGmcwhEWTXRrK9UxLnsv7qck+S8JWo17ocxcVT0YmKlyWsVndG9HeU+j9klTHKSNcU2BVZgAofENsVDQmP5HFPx1f5EQYSKHy84pRMGLASagUKPvzfkKmKFU18sAyuIvDGl+xhA3WWRnm8IOYRCqUYosC9YSvT5wRvNhlzLY8GWyUzh0mri/nD3xHKiVmmTzifgLhnp1RyDtVR56VzQXaUS6LMU5i/L0UOaFoEk+V7Mw3TL5dhgh24ftg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qu1/cMGxbl+SeKABRne0Uv7VZKALrPa6E/uAUnMkL/4=;
 b=YwDDdt1zo1bx+nB3HvagaEnI54SoUBFNAN/q++gZ8Chtacaavli2vumnEiRslIXJsEwzMKYEOT6BhohGG82NH+k8v9ZgrxAuZVQOpl4aQTBrf5cSWkNUyDTpEQ2tORyOgnPNB9weUQFb3y1aSrYxmYOJ8vhDZZ1s51kEchatGJf1nNGH1xfGiNNlMr3HKsuc916QeAc8Fmgq/JcoYoRuOIeNvBLGGat1Ug3/D6oOcda/WEel8FNoe1Gzi1HsoSoyZedqYKVqAQOqdl4VYosiyRbBx1TQa2ppfRVNaZN49QmpQudryebfzvMALOKNvXNwAWd+AD7bflpsnDLa0OCo2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 DM4PR11MB5279.namprd11.prod.outlook.com (2603:10b6:5:38a::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7698.32; Wed, 26 Jun 2024 07:51:39 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347%5]) with mapi id 15.20.7698.025; Wed, 26 Jun 2024
 07:51:33 +0000
Message-ID: <c5aab7ab-ee88-4d6f-b7df-7e970d0d7e1b@intel.com>
Date: Wed, 26 Jun 2024 09:51:28 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Configure TLB timeout based on CT buffer size
To: Matthew Brost <matthew.brost@intel.com>, Nirmoy Das
 <nirmoy.das@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>
References: <20240625084947.30869-1-nirmoy.das@intel.com>
 <ZntAuUNTiHbYENzS@DUT025-TGLU.fm.intel.com>
 <f9bec61b-dafe-4762-9f69-2a3d403fd825@linux.intel.com>
 <ZnvGOtmxkY2gRkyy@DUT025-TGLU.fm.intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <ZnvGOtmxkY2gRkyy@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DUZPR01CA0074.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c2::20) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|DM4PR11MB5279:EE_
X-MS-Office365-Filtering-Correlation-Id: 34914063-27c0-48a4-e0a5-08dc95b4cc09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230038|366014|376012|1800799022;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YzU0bTFpWVhLanpNQXBwUTdWZXdjNk43OW12T0lSMHNsNDN4Nm5rVmhwQzVj?=
 =?utf-8?B?ZHdYdFFEbk1QNGs4RGUxTjdnMWd0cmUrODRFOTRRUW1lc25KczBNS04xU0RJ?=
 =?utf-8?B?aldIL3Exa3paeTVwTjFkTk9YZ2FMNHNZaytrTC91dUdUV2EzNnBNSmlXVm0v?=
 =?utf-8?B?cldxb0FMclF5M3VQdUl5S0w4aXBWOXBITktieERRM3JSMVphYXJ5UzRDNWVF?=
 =?utf-8?B?Qm56NHlZZmx1V1ExNzZSTjVFdTk0ZVlHb0VGWlVqSi82SExxdFN2NmZlRFNp?=
 =?utf-8?B?cHhEVEhEWDBpamt6bTlxejBkdjVFYzBNb1JxQUhiMUM2QXU1YzRLRWJja2Ex?=
 =?utf-8?B?WHVEL3pLSjArUzFrSUNOdVVVaHhaTGVlZnpCSGUyWEx0bFMxaEI3MU92NnRI?=
 =?utf-8?B?elFmaWFSM1QrSHpXREZFYUF1YXlqSkVvS2JGYy8yRXJZK3pFZ0t0RWNxYU05?=
 =?utf-8?B?ZDVlalQ4RFUyd2xwVlpCWFVsaXFCenZYWS9LL0dZSHpmREJrUTJYbUxKU1hL?=
 =?utf-8?B?ZkR3V2xiM2pzbzR4SG80RlZQQWVaRktFd3pJaVpJbU9BN216bzBBbk12V2dK?=
 =?utf-8?B?NERVNmc2amN3WS9JaTN5eUgvNDBkK0ZuWW10ODlHQzNld3RpN2drZUFpd2lt?=
 =?utf-8?B?YlBidWN5MndRK3ROUmNQV2M3d2UwdUowejJrZVJwaFN5WnhpOWhiUnViOVBD?=
 =?utf-8?B?Y1ppT29GRElHeW9id2krWlRzaGNCZkw4S0tpcEhqbFROM1ZrNWFpbHpBY3Bo?=
 =?utf-8?B?UGxmK3Npb09odkk1UVdGdWM0OFlLMVM2RW5hVlhBN0xLZ2FBY3l5S1Z4YkZ5?=
 =?utf-8?B?VGRGdHg2a2E2SHVPOHR2QVdNUkNxNkFONWxUZ2pGRzU0Rk0waVhyQTI3dVRM?=
 =?utf-8?B?K0dPOHluMW9aeGxFdm53aHNXd2NTU1dzRkRzc2p2UFZXWDJxY0Vkc3hyNVAv?=
 =?utf-8?B?TGFyLys3RkEvc3lLZzJJcjMrelkvemNMOWFBdWRhOWdMK2JDbVpiQ3BaY3VB?=
 =?utf-8?B?ODMxR3Q1N2NJYThlc1JyZjZjR3MwWkx2UC9uZUF5ZEoycFlkREhudWJwT0Js?=
 =?utf-8?B?UlpTVkRXYis2R3dBMkJaeXJneG1iOFcvRjlTWWF3c01WdXpWRmMrUkkvN1l1?=
 =?utf-8?B?WG5paVYzMTYwemtoSSs3MVJTNnFwY2R4TlEza280aVNQVzdReWxJb3BjNUR4?=
 =?utf-8?B?VGlTVmlPV05BSFlXM1dKZmJoV2ErRWVlanRTVTN0S3hMb05qMU9GNGhmOGJr?=
 =?utf-8?B?eEh6eFEyeXdncC8zQ3IzaEllMEJLMk11cUVoZXhDTGJGTHV0a3RZei9ZS0tr?=
 =?utf-8?B?TVNDdnhWMjhVWW9RbHB6M280THBxNnRYblhiZG42eFgzYTRqeElrREVmMm9S?=
 =?utf-8?B?NkZXSFUweW1CZ21RSE9hRXF0RUlOY3dsZWlWQWh5RmtXUjZpaHdHa1R4eVNH?=
 =?utf-8?B?cHl0RnpZVk5jbDlmVkpJaVAzL1I4aDVLQVo1YnhxS0NraHhUVFFNOTRoaWQz?=
 =?utf-8?B?MHBLcHBZTWxjN21wV1lPOWdjZEZzbjQ2bTlyUWthZmt5RTd1NFBGR056QlJh?=
 =?utf-8?B?SnNBOERzTHQwRDJSeWNkc09yREo3LzJhWlRlRDNSbFpTeHo5dkRjMVFPaXh2?=
 =?utf-8?B?cURxek9ueXNxaG43MVdXL3ZyYllLTnpTTDRjYTZwQUtSbFN1cDVlbUhRdEwy?=
 =?utf-8?B?LytMOHF2WGZjWU9iaTlyTXNucWlRdThZQjJ6S0ZyQy83NzdNK2t0ZkFCQWYx?=
 =?utf-8?Q?oP0bt4/d/Mieb15n1k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230038)(366014)(376012)(1800799022); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N25EdWowN1c0UnIwbStkTFY3eUI1Wmdnb3lKM2syUmpsbUtBSVR1UUNOTFl4?=
 =?utf-8?B?RllxMzA0WGQwY3NmalVJRTlEL3d1dUE4OExHMHlXR2t3cWlLa0tpOHVDcFFF?=
 =?utf-8?B?a1FXbFhiZTVXd3huSUF3M0pJeU9CSGVjZWpZOGVSbWJpcTRaSEI3bjBBZjVz?=
 =?utf-8?B?bFlVa3NHWnBmVjRVQURFcU1qUGJJZzJSczNqVFN2OFBjTmR2eTI2SHI3bjJP?=
 =?utf-8?B?c3VzcTVkWXQyWitDT2l6L2NHTnBMazJCck95UUkwS29YaHFRZWEwNGMzdU1s?=
 =?utf-8?B?VTc5L1FtcWxPRE82V0VhZWxwQUpuZVNKd0U5Mk45NEFYajgrTXp2akREd1Bk?=
 =?utf-8?B?QUNWV1EyZlg4TStqR0ZwVjF2Y0laeHNhUTNWcUZaa3NndVhDVS9NZFhwbXZq?=
 =?utf-8?B?RllSTCtPKytxbGtCQndmTVFQNUtNS0ZxRVZ5Q1c2Uks2aGt4Y1hnVk14Vjhh?=
 =?utf-8?B?QkJLZXQ0QVAybmdJZVdxaE9pYU9zUU8xaFJhSktXdU9qeTdCTHN5TzNiSi9m?=
 =?utf-8?B?eHJvb1BRQk94c0pvaE9MbThZTXdJY3Y1dk5ITlhZeVJHaEVVeWdjcVMzM3pV?=
 =?utf-8?B?NURQVTRDZlpOTEtiM0cyR1N2M0tMY0h3RE9pUEo5VGxVQXBlbldab2JtZHhY?=
 =?utf-8?B?SnIwZEh3Y0c1NFRlSFJla053NUF5anJLemllNkhWcUl2NmxXVXVVbjhqYXBY?=
 =?utf-8?B?M0ozWUNtcnRZcWlUMFpndlBFRitwM0R4NFFldXc4Q3RFZ2dhdW90dCthcWFH?=
 =?utf-8?B?WUFIT3ltdGd4TUJzTVgrckZrTUVYNklDbVJhbnYyOWlWcFpTVHBIZVlvVno3?=
 =?utf-8?B?c2E2SDF6ZFpocU50TFdCMWNwR1NrekZ1KzdCSVduanVJalJmb2pkSVRBNnJR?=
 =?utf-8?B?SWZQeDlZWjFtbWY4bXdoTjVxZDNGTW9LaENBVmNZZkxzZXNpVHRiMWdNVjdT?=
 =?utf-8?B?bmhaa1B3U0VKL25yRnBOeEFxWnhhdCt3djZ4NnVJZFpDN1VIOU9iUEtSeUZX?=
 =?utf-8?B?aFRRK0ZSUFJjTUQxQUdGbktxMk5QTnFwT2FnMm5ITmRCUGlnZnM3ZWQ3RlBS?=
 =?utf-8?B?WHJlQnV4Ky9EL2hDay91TytMSlBDMzZsZkJINStxWmt3dkZObzZaN3JCRWNz?=
 =?utf-8?B?V0gyeHBCanB1d2hLeUhid1FIQVZhaGtTamo0VEFaNlN6amZUWU9YL2FiYXls?=
 =?utf-8?B?RzF1NXREUWxnYTFFd1h4SE5QN1h5U0x4cCtpRW9UNEY2SnFZaDExVTQ0cGVn?=
 =?utf-8?B?TGROZkc0WFNvVzBkQjBxUTFxUm1wMXd3ZGswVjE2aWtIMDRKazYzY3JyQ1B4?=
 =?utf-8?B?RkgrMkFHS0dIa2NOckNDUTdjeFdJZVZwR1Q4bFhxcXloT2tFdk9EV0NlREVL?=
 =?utf-8?B?a1ZML2lJM3J5RDVNQVBYaUpGcmZGRGJDWVZXM1ZUTXhRbXFwNDZBdnRGOFdv?=
 =?utf-8?B?ckxUYkx3TUZUV2t4bGVOMGxIOHQwNWhiazVYWmFRQmNqNlVWOXU0elpRMWZE?=
 =?utf-8?B?Z3d1ZUhlaXYva2gwaS80UXhHM2Q5alRHZjIweXVOMHQra2RWY1ZCMGVTOGdx?=
 =?utf-8?B?cmN5WEdtajAwMUU4aGkwSTNsWHUwYkxxVjNvY1poajEyanNLL1NCMDZxUWV3?=
 =?utf-8?B?djJEUHI0REREbFVUa1NRYnZldjBjWUlJZ3BDa0ZSZkNFdVEwNW1TdE1pU3l0?=
 =?utf-8?B?RnJpOWJNK05vSFgwb2E3dURHMFJnZFZZUkphajB5Q0NwQWY4TlBwdXAyZjFU?=
 =?utf-8?B?NWhTT3ViZDd4UkRrY0JydXM2dVcrT0pSR2FMNWtLOGFSOTRZT1FiL1pDYXEv?=
 =?utf-8?B?dEhUd0tvQW1zMmFHRTFxT25oMkRDczFGUjdDVTVYQXVTbVlrdDhXQW9iRXRa?=
 =?utf-8?B?d1BaREhudGFDUTNtMEtrVUV2QlpNZWU4Tkxsb2xBWEJrc1VHTC8rVXhRb1oz?=
 =?utf-8?B?ZzZSTnlBcThFS3crTmYvYnVXUTFXazdNSmsyaGJBMDQ2OUF0MWJLaEZYZ2Js?=
 =?utf-8?B?d3JwNmJQZHZnQktmNUg2VW5oM0JsMUJXMUYyVGZtN3V0M3ptdHBpUDQ4RWdI?=
 =?utf-8?B?V3BOekRiSld6QWI5aG5Hbzk3YmdsdWJkV2UyV2ZZRXZHdnZ2b0VhOEFYczV3?=
 =?utf-8?Q?w+/+OuJ/U4MXpuQD1Qj13AEyj?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 34914063-27c0-48a4-e0a5-08dc95b4cc09
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2024 07:51:33.1407 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C5AIwaW6w4YogRGtNOwNTYblTNcohzvfUmcJMCNgGr89iaz99WQb2b1PgVppjher/bfu5QL+t3fi5l8zt6gzdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5279
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

Hi Matt,

On 6/26/2024 9:41 AM, Matthew Brost wrote:
> On Wed, Jun 26, 2024 at 09:33:46AM +0200, Nirmoy Das wrote:
>> Hi Matt,
>>
>> On 6/26/2024 12:12 AM, Matthew Brost wrote:
>>> On Tue, Jun 25, 2024 at 10:49:47AM +0200, Nirmoy Das wrote:
>>>> GuC TLB invalidation depends on GuC to process the request from the CT
>>>> queue and then the real time to invalidate TLB. Add a function to return
>>>> overestimated possible time a TLB inval H2G might take which can be used
>>>> as timeout value for TLB invalidation wait time.
>>>>
>>> Not reviewing this patch as some reviews seem to be inflight, just
>>> adding some thoughts. I will say that this patch looks correct as a
>>> short term fix.
>>>
>>> Longterm I think we need explore coalescing TLB invalidations targeting
>>> the same VM when pressure exists (VM bind case, [1] should help here
>>> a bit) or
>> I assume you mean to queue tlb requests in kernel for sometime and then
>> coalesce before sending.
>>
> Yes exactly. A rough idea would be:
>
> - Have a water mark between TLB invalidation seqno of send / recv
> - If difference between send / recv is higher than the water mark, start
>    holding TLB invalidations in the kernel coalescing them in each VM
> - Once we drop below another water mark of send / recv, issue all
>    coalesced TLB invalidations
>
>>>    optimize out invalidations
>> What do you mean ? Queue ggtt invalidation and send only one ?
>>>    (GGTT case, at one point I had
>>> logic in for this but pulled it out as it was buggy).
>>>
>>> I say this because when debugging [2] I found that lots of TLB
>>> invalidations can overwhelm the GuC to the point where it can barely
>>> make forward progess on submissions.
>> This sounds very serious!
>>> The former is likely a fairly large refactor, while the latter shouldn't
>>> be too difficult.
>>>
>>> Something for us to keep in mind as a group.
>> Created https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2162 to track
>> it.
>>
> Great! Thanks! Maybe add some of comments from this reply to that?

Yes, the above idea needs to be documented in the issue, will do that.


Thanks,

Nirmoy

>
> Matt
>
>> Thanks,
>>
>> Nirmoy
>>
>>> Matt
>>>
>>> [1] https://patchwork.freedesktop.org/series/133034/
>>> [2] https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/799#note_2449497https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/799#note_2449497
>>>
>>>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1622
>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>> Suggested-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |  2 +-
>>>>    drivers/gpu/drm/xe/xe_guc_ct.c              | 12 ++++++++++++
>>>>    drivers/gpu/drm/xe/xe_guc_ct.h              |  2 ++
>>>>    3 files changed, 15 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>>>> index e1f1ccb01143..fa61070d6201 100644
>>>> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>>>> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>>>> @@ -17,7 +17,7 @@
>>>>    #include "xe_trace.h"
>>>>    #include "regs/xe_guc_regs.h"
>>>> -#define TLB_TIMEOUT	(HZ / 4)
>>>> +#define TLB_TIMEOUT	xe_guc_tlb_timeout_jiffies()
>>>>    static void xe_gt_tlb_fence_timeout(struct work_struct *work)
>>>>    {
>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>>>> index b4137fe195a4..e30c0da86acc 100644
>>>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>>>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>>>> @@ -112,6 +112,18 @@ ct_to_xe(struct xe_guc_ct *ct)
>>>>    #define CTB_G2H_BUFFER_SIZE	(4 * CTB_H2G_BUFFER_SIZE)
>>>>    #define G2H_ROOM_BUFFER_SIZE	(CTB_G2H_BUFFER_SIZE / 4)
>>>> +/**
>>>> + * xe_guc_tlb_timeout_jiffies - Calculate the maximum time to process a tlb inval command
>>>> + *
>>>> + * This function computes the maximum time to process a tlb inval H2G commands
>>>> + * in jiffies. A 4KB buffer full of commands takes a little over a second to process,
>>>> + * so this time is set to 2 seconds to be safe.
>>>> + */
>>>> +long xe_guc_tlb_timeout_jiffies(void)
>>>> +{
>>>> +	return (CTB_H2G_BUFFER_SIZE * HZ) / SZ_2K;
>>>> +}
>>>> +
>>>>    static size_t guc_ct_size(void)
>>>>    {
>>>>    	return 2 * CTB_DESC_SIZE + CTB_H2G_BUFFER_SIZE +
>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
>>>> index 105bb8e99a8d..a9755574d6c9 100644
>>>> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
>>>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
>>>> @@ -64,4 +64,6 @@ xe_guc_ct_send_block_no_fail(struct xe_guc_ct *ct, const u32 *action, u32 len)
>>>>    	return xe_guc_ct_send_recv_no_fail(ct, action, len, NULL);
>>>>    }
>>>> +long xe_guc_tlb_timeout_jiffies(void);
>>>> +
>>>>    #endif
>>>> -- 
>>>> 2.42.0
>>>>
