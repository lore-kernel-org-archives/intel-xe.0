Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AF68D2D8FE
	for <intel-xe@archiver.kernel.org>; Tue, 27 Jan 2026 11:23:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 334F710E534;
	Tue, 27 Jan 2026 11:23:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MlecF84c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC9CA10E534
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Jan 2026 11:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769513008; x=1801049008;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=lshfj5/ETUCVw0OnmXNZ8qn/SGMRGOdeU1KRyLu+JGw=;
 b=MlecF84cjsjGri/vqDwXOZIOCom003RQk1FkGbKNlLR13kQMMwOaDtLb
 lTlArv6OZKpSNMDoOxJr/3b82rAK6Vt2Tyo5QM6NsMP5pMqbWvQD7mluu
 w+kR7L9qKc1ncJ1zdRb/cA6LbUla5v085OwNGCmbzkjdtH197PWLMWRYA
 3HionAJUPhZ7ywgrSGBWA8Wtdsz/RfxCyjwdUOVFDY3xIgkbwvz5mAFOb
 5KTZaAyJvsm+8c4yZ40E/iyfCkx5HYzEf1VAj3H3+SE1uC8vNDTfuFasu
 KDuS0/tE4RY5ZcmCBwfnHgQs3Qbha+T2S6m0wRnT4Hiy6/pS0IAqMszro w==;
X-CSE-ConnectionGUID: xMmfaHToStiXjHR2CSLT2w==
X-CSE-MsgGUID: hsA8vEISRvOra0OdeFrVBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="70762838"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208,217";a="70762838"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 03:23:27 -0800
X-CSE-ConnectionGUID: 6J+gEVq6QnWXGuIXup6s2g==
X-CSE-MsgGUID: 4si/Dt6hQzm5Tp6+9DPpxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
 d="scan'208,217";a="208006746"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 03:23:27 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 03:23:25 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 27 Jan 2026 03:23:25 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.65) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 03:23:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CgA/VdSQGG/n61JgaPX4vZ0JhPHcTuwKt+uZDBHA0KVI6L8zyRc5o+sSnc81+Qan1A1b1en2Lgetv6Jui/+tP8DtV2Tb6Rj48vRKybSvI4b1nGwF/WU7bkXp+ELtsc5jh25e5QvyfcbOFY+QrszljS3AQNQIApgVtuRii//uGcTzTurJUrJpEtTYrah5G4u70vKBsD1sl3ttDkVh2V6fqFAKXkdnJwvKzYgRnHAoAdjt1HPiazqUkGZfQTWKceyA1W0l/7tTkemFlXxWvoNCZyg+bNGUOqGLpZZ2Purgo/2LhaGH7ItAxIcDhI+8CKnEsBDqwotUS3eeulc4p6w1uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PaUDc8XHKYZrHO11ZanT8nqIxRCkkVlegTueUSJoD9U=;
 b=L9fpHe4Yham7UryJoi/za+NQtN2VtDvpzoXkk0b2geKw3YzJY1SHoraD7f60vFk26kVN8ys0rnW0Guz+A0/f0f0r7fnNAnb+B2pKBEE0JeKuuEwR/KSUC4Az4ohvdea7gRYn7QMvm9pIL50BhYth6aA5uA2KI6Z0UYATUAM6gNBfuwIKflhZr3k70F9ofl0Wm7Fr6j/RgY5UYqkF9PpW40xDXnxFq724YwM8UP1CZAS0wmgmZ0pY+aysmiFDz3odjhqKg91ETj6JjyBlzXUwpN7KcbM3L0QDMur7rI12rbtOaxpQJPk22K73NNclW2E+dnKSQEyCOEbhAMewvtOulg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by SN7PR11MB7604.namprd11.prod.outlook.com (2603:10b6:806:343::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Tue, 27 Jan
 2026 11:23:23 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.20.9542.010; Tue, 27 Jan 2026
 11:23:23 +0000
Content-Type: multipart/alternative;
 boundary="------------2neXBMhap1dzvcXSOihIAx3E"
Message-ID: <fa728edb-2929-43f6-bd4d-9009e6539079@intel.com>
Date: Tue, 27 Jan 2026 16:53:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] drm/xe/xe_pci_error: Group all devres to release them
 on PCIe slot reset
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>
References: <20260122100613.3631582-10-riana.tauro@intel.com>
 <20260122100613.3631582-13-riana.tauro@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260122100613.3631582-13-riana.tauro@intel.com>
X-ClientProxiedBy: MA0PR01CA0005.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::22) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|SN7PR11MB7604:EE_
X-MS-Office365-Filtering-Correlation-Id: 29845a9a-780f-49ee-484d-08de5d967b37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cG9UTk1TaktyQnhqWFk3endzdjN4SENKb21OYWxHU0ZkMU4weDRzcTQ3Tk91?=
 =?utf-8?B?TTBndXJVYVpQaUZOSFVIU2xmaDlLbmRGaXZybjVzNVg5ZlR6ZWtNdWlLcllK?=
 =?utf-8?B?Q3hKVjZYcXYwd0xTT1NieU44YzhFOENXN1Q1eEpSWWNIUFVVUEdyUmZIUWxm?=
 =?utf-8?B?QktwM205N3VJWm1ncHJ3RWFDbjlFb2lscXFPMXlRcHRnRkxnR2V0cWMvYXZU?=
 =?utf-8?B?YmFPSVJJRDk1OVNjSDlwbGtwdGVNVzVaUG9uRE1RRUZoUGJOOWx5OWZzK2ZZ?=
 =?utf-8?B?aEU4YTBJREVLa1RkUHlUQWU5S0Vlc0xTRTE4OEJkTmZ5aTJqNHprSGpBemFT?=
 =?utf-8?B?aW0wY2RDL1hQUFpSeDYvYUx0TjNCZUlJeUhaNE14QmhFSWUvejdFRlJGTy96?=
 =?utf-8?B?bnl4ZWt5c0lYZnhob3BmTDAvRVBrQXZydk4xWTlvbjBJMXBLM1FRazJyMGgx?=
 =?utf-8?B?QUpaUjRjVmxHSEdSeGFocTczOFJ4enVCcjJ3SnNWRlhYWGlYYWRDVDN5c05U?=
 =?utf-8?B?KzVyNFo3dTFzTGhseTVNWEdqbXpIYlJKYWtzdE0rbVRqWGRPcFZ5VFBsNkVv?=
 =?utf-8?B?MlMwZTVLdTJxOEpQd09IZzh4WVo1U2JEU2RodWJJNWU4KzVjL0VmbTh4Vytp?=
 =?utf-8?B?OVI2R3padGVGclp0ZnZBOFd0MkNHZXJpWXRVZkdqT0IwSURYWFZMSlh1VmV5?=
 =?utf-8?B?ZDkxUXZlVHZQc0VxYVg2d0oxT3dndlZhbTgvZUJWa3A3R2FzRDBZSmxvSnJ0?=
 =?utf-8?B?UkZVcjFOMGFvUW40SFFMaktJaDZpaTI5amRjVnQwZFlaaU11UTNnUDFUUXdM?=
 =?utf-8?B?VmdwMEp5WFZheDlUZ2lZU3AxWGdVc0lXVllPVU01UWV2N2xwNk5uVXJLckVK?=
 =?utf-8?B?U1ZFSi9MZnZZN25LaHRYODFtbWowa3dYZFV1TWNCdDdJY292UVlZdG90TWQx?=
 =?utf-8?B?OEtGUjEvZHVpamZvU1Rack9yN3Nld1JJZys0b2pwWVBzdCt2RElLajdpUW5h?=
 =?utf-8?B?T2JQQi9TUXJPU3FGZ2pGQUcrRElGVHJpUC9wTGV6dXFGTVc2Y3NvVGFQdVdN?=
 =?utf-8?B?ZVJQUUhhSHI3TG9MZ0tzUE5BV0NRZkhTYUMvdzBXWWpnZGxFUXNuSVNsbHRY?=
 =?utf-8?B?OHBidDlLRyszeVRDUE85Smk3YUZwclhLRWlCNDVkMVZrTkM0bnFJazhsOUFq?=
 =?utf-8?B?bDljZlQ2N09TbWxxSHpSZUZTeXZDUWVOQ0E5bEkzVG9GU3c1aGc0Y2N3K1Zz?=
 =?utf-8?B?U1NKWmp5WXRVM3JBRmF0Q2o0cndxQS82aUZidmZJelBFYXhYWHRiNzYyak83?=
 =?utf-8?B?SmFxZ3B3eDRPNTdRR2VZK2dMcmlpNGRmYzg5WDFGOXlFZS94eGRpK1o2VHdv?=
 =?utf-8?B?VnQwc05BWGI3eFN5MTYxSFRjRjRPUW81UzNQMSsvK2pIZFpWanZUaU9UR2tk?=
 =?utf-8?B?UzNsQ0MvcXhOanVkRjFib1Rlb0VKbkJXYTUxdkpLK3lOQ0FoaWhUbThoR0ZJ?=
 =?utf-8?B?MGtZb3Q4M1hSTEdncEUwRlZjby9VWW52eSs3UVhIY0k2NjN4VVVlK3JKb1Bl?=
 =?utf-8?B?VlloNnMzKzMwZUR0UkVIYktvd2FLSEhFTHFnSU42WUxxckl3VEFEU29rOUdv?=
 =?utf-8?B?cG1XYVZQWU1oVVFyREVqbzU3V0RlNkdmZnlSSG56YlJLSEhZeURleTRqM3Fv?=
 =?utf-8?B?ZFdFd3ZMTUJVV0E1U1FHdy9VUlgxU2ptUnhqRzFXMHlRd2Y5UHNOaWoxZ1hT?=
 =?utf-8?B?OGd5WWo2QVRRaFFzQy9MQWphbEcwMXdjdUZyY21zbWtmdDVDMVlBS1N2ZXRY?=
 =?utf-8?B?UTFTSmcwWUNqV05OSlk0cTkrNzZqRG1HVmcva2RkSzBwQkN3VmFGSzZ6K2gy?=
 =?utf-8?B?NTB1SDRZN0VDMkJJUkJKeDl6ZDBrZU8rR25ORGw0TTgvVWZwNmFjZXV4SjZn?=
 =?utf-8?B?RGR1RUJlL3FTWUl2M0NYWVpPcko0RzZhQWhmellUOVZuUy9aQzJNZUtQUWMw?=
 =?utf-8?B?OVB2VlBYMFBiOEtPZGMzTEMxaW1xWStyMGM2dCtiUEJLRjhVc3Q2ZkU4QU8r?=
 =?utf-8?B?ck9BaE9LN1pCQUgzajVYeWtCanhXZ1A4MDk1cVFMK1hWTjltY0QvN1hYUGZF?=
 =?utf-8?Q?zLyk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VTlmZU0zZzc0ZGFVSldMc0RYSS9pOW01RjZ6SWxzU1p4WUNoNkN4S2x1cWVJ?=
 =?utf-8?B?WEIwZE5kNU5XbEpTdTRETWhXd3hnbG0xZTdJSERWNk02M1dKdVc1V1phc3Zv?=
 =?utf-8?B?enlsUFIrZERjRUpoNmtnM3U5SGR1d2JFT09pYjFqY2c0c0FIRVFvWnY1Q29t?=
 =?utf-8?B?YlRpZTRNVVMwVzZGZWswcmRHOXp6TkdrMlpLZGFkUFR6ZC9XOURiZ0tab2dN?=
 =?utf-8?B?RkNBcTNDR3BSWm9TWVJmTnlETWJzOTBsWDlwUngvR1ZkSW1LQU1jYktDVGVC?=
 =?utf-8?B?dHRTMlJNNGxIWmtnVm1jalZicFNXNXdFNllyTTMxeWxMenh4eFAzS0tQcEUy?=
 =?utf-8?B?ZUtJbW91RzNWUVdKSFAvR3dSOUlkQlo0OVU1UTBiVFRsc0JPL1NQZW1WNVRu?=
 =?utf-8?B?Ynd3YkdUYndraXdXWVZCMWlaeURadW1Dc1gybEZ2amtGaDYzdTlFYXd0Ni9k?=
 =?utf-8?B?ZWtoN2hDSEMvcVkwejNETjU0bEoxMVBSL1JzNkhUK01yOW14TVcxUVdwV3FT?=
 =?utf-8?B?ZmQwMVpRbHNjWGI1YVB2WjR1bWl4ZENOOTNkRnU0bktSd3JYRTdIYVZOa3Zz?=
 =?utf-8?B?TUtaQmtKZ1lFZXVoOU1tNjhOWGt1eTRSY0NxTlZKWk9TUmJYSXJaQmVZd0JR?=
 =?utf-8?B?dS9LRHU1Mkh4S2EvL09lY0x6bGxUN0xQeEdnaTNpOENDam1BamZvaVV0V0NF?=
 =?utf-8?B?UXkxTmxSZTBEUFdwUlNsSUREbFg3aWpEbzZXbHA2MGtKRTZFaXAyZS91WW94?=
 =?utf-8?B?VGJ6OGNMVklYRlpaV0RyMCtKbitMV1h2WEdkUms5cWt6TU0wYjkxUDBtMnor?=
 =?utf-8?B?MUg0T3Q2YVVyRjdLZmRCY1JpdGZ0ZU1lNFpScFFpaExTTWNTdUdsdFEwUWFB?=
 =?utf-8?B?aXFXaWhoK1AxZUZHMjVNUnFnVWZvSzhXZHo0V3U0UTZ0aStJbjVnOHRmTXpF?=
 =?utf-8?B?dnpIb0lYYjJjY0ZDdm0zQ1BNd3ozQ25kUTdVdUI4dzVQUnZrTXAyTk5aYmJv?=
 =?utf-8?B?KzB2WTF2YXl5SnU1YnRhbVF6eTNOVDVsVENPZldWeEw3QXY2VDV3OTEya0hy?=
 =?utf-8?B?bWxWdTcvbW9MWllYSnhLODNvUFJtc3VpZUI3UXNTZWhWbDJGdFpNUDZ6QVFZ?=
 =?utf-8?B?bHg0MEUvbmJtQW5qRFpXWm1Sdll4WXhadHBWMFYxdUNjT2xYaWxSOGlrcFJK?=
 =?utf-8?B?UDYvZGVPRnl5K01WY21YcWZTNzlCUThYTWM4NE1tNkpLTDVBeWoxZGVENkhQ?=
 =?utf-8?B?ZnVrNzdSb2tOUHVOdDArRm5zOE5WNS9hQlNYVWloaGxvV21mbEt1NkI3K09R?=
 =?utf-8?B?ZUhRRjMvRXF3aFpyQTV5eDJUZCs4Q2lNTU03Rks2UUxVNlZSMmQ4R0t0cENY?=
 =?utf-8?B?WkNBK0FKeUlmN3FkTFZsNEU3WWJTVmwva2M1ZjNhQlhES2xoVllSdmdkcDFk?=
 =?utf-8?B?eVlCeEZCdUxxbWFMcTRGdXJkSytBSy9MUXB4aC9rU2hOZDVub09TaTZZUnYw?=
 =?utf-8?B?SkxyU2l3SEFrWFpIdGZaUlJ2dDdkL3NURkUzTmFXZXpNR3ZFSWExVk5lQUZw?=
 =?utf-8?B?S1BVZnRrU21ZY0ovblhQQmpmclNjb2ZDQWg3L3ZMZTVLY25QeXp6ZXBQaDhz?=
 =?utf-8?B?Y1ZSTzhUa2F3ZUhJSGNTRUdQcUxaZVU0SGdReEk3U296Ty9sb0FKV2ZoMWN2?=
 =?utf-8?B?MUY1N1NaWVllK2FHRGppYjlkVmlhdWNEQmZuRXR4RWhwT2dDWjRtMFN4anpT?=
 =?utf-8?B?RnJwYk84MEpKblB0WVcrcmlXRHpFM1U2Q3NSa0Z6amgzak0yeVFiME9VdHNZ?=
 =?utf-8?B?S29PTi9mWU9jQVVjaWNkMVdqZGhMNGNQMDE3U2ZzdVMra01yejNpaGcxcXdV?=
 =?utf-8?B?cmdkL2taOW5ZZEdPKy95RTh0T2JkTTBVQW9FZ1BaQ3ZXSXg2b1B4T0lTSmZX?=
 =?utf-8?B?MWdtdUJpcjc0QlAyTmlraDlGOXhWdy9KK25SZ1h3N3BybGlNSWpnRFNTUk1Q?=
 =?utf-8?B?SlExNVVtN05QcnNoTVRqYzFuODBNbkV4M1ZmaEllZVpxTm9QMUM1dVJ6Skh0?=
 =?utf-8?B?bm5keFpNU25odEVRcmIvS3dYeHFXZStUV0pTTzRoMXpMMm5aNTliRU9lZkhm?=
 =?utf-8?B?bkF3QXNIVmZEWVJOTlhtanpFb1BLa21hSEI2ZGllR0FmSUpJT3hWT0tjREtU?=
 =?utf-8?B?YUN3bDNiZWNqc3lyVnJianVFZUI1dUpaRWU3bG1wajZBWlhmNjdsOVdla2lj?=
 =?utf-8?B?Q1A1ajJHOTZ2aWRVMUFpeUtYUnJTS1ZteDJpam14dW5aU2ZmVFdLdldJYVFC?=
 =?utf-8?B?MEtDeEt3bC9hYUpZTmNvSjY5TjR6aVo5WFBQZlZqZ253YVJPY0FWOGNSVC9j?=
 =?utf-8?Q?eI7rlcOB36uoQ16U=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 29845a9a-780f-49ee-484d-08de5d967b37
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 11:23:23.1381 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fOAyn+dGKHQSIUglqNyjdEN8/anppmWHguvSCPF8lG86KMDpDflKMX+/95vfoa+wks+Q6YsFfRpqdDCK3IoznlgQFYH72sd1Mzbo7lHrg6Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7604
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

--------------2neXBMhap1dzvcXSOihIAx3E
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Riana,

On 22-01-2026 03:36 pm, Riana Tauro wrote:
> Add devres grouping to handle device resource cleanup during
> PCI error recovery.
>
> Secondary Bus Reset (SBR) is triggered by PCI core when the
> error_detected/mmio_enabled callbacks return PCI_ERS_RESULT_NEED_RESET.
>
> Once SBR is complete, the slot_reset callback is triggered. SBR wipes
> out all device memory requiring XE KMD to perform a device removal and
> reprobe.
> Calling xe_pci_remove() alone does not free the devres allocated.
> Since there are no exported functions to release all devres, group the
> devres allocations and release the entire group during slot reset to
> ensure proper cleanup.
>
> Cc: Matthew Brost<matthew.brost@intel.com>
> Cc: Himal Prasad Ghimiray<himal.prasad.ghimiray@intel.com>
> Signed-off-by: Riana Tauro<riana.tauro@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device.c       | 7 +++++++
>   drivers/gpu/drm/xe/xe_device_types.h | 3 +++
>   drivers/gpu/drm/xe/xe_pci_error.c    | 1 +
>   3 files changed, 11 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 16fc6da01357..0cf6480b8aad 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -440,6 +440,7 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
>   				   const struct pci_device_id *ent)
>   {
>   	struct xe_device *xe;
> +	void *devres_id;
>   	int err;
>   
>   	xe_display_driver_set_hooks(&driver);
> @@ -448,10 +449,16 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
>   	if (err)
>   		return ERR_PTR(err);
>   
> +	devres_id = devres_open_group(&pdev->dev, NULL, GFP_KERNEL);
> +	if (!devres_id)
> +		return ERR_PTR(-ENOMEM);
> +
>   	xe = devm_drm_dev_alloc(&pdev->dev, &driver, struct xe_device, drm);
>   	if (IS_ERR(xe))
>   		return xe;
>   
> +	xe->devres_group_id = devres_id;
> +
>   	err = ttm_device_init(&xe->ttm, &xe_ttm_funcs, xe->drm.dev,
>   			      xe->drm.anon_inode->i_mapping,
>   			      xe->drm.vma_offset_manager, 0);
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 2d140463dc5e..3a19e9b5dfae 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -672,6 +672,9 @@ struct xe_device {
>   	/** @in_recovery: Indicates if device is in recovery */
>   	atomic_t in_recovery;
>   
> +	/** @devres_group_id: id for devres group */
> +	void *devres_group_id;
> +
>   	/** @bo_device: Struct to control async free of BOs */
>   	struct xe_bo_dev {
>   		/** @bo_device.async_free: Free worker */
> diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
> index a3cc01afa179..0960aa5861bc 100644
> --- a/drivers/gpu/drm/xe/xe_pci_error.c
> +++ b/drivers/gpu/drm/xe/xe_pci_error.c
> @@ -65,6 +65,7 @@ static pci_ers_result_t xe_pci_error_slot_reset(struct pci_dev *pdev)
>   	 */
>   	pdev->driver->remove(pdev);
>   	xe_device_clear_in_recovery(xe);
> +	devres_release_group(&pdev->dev, xe->devres_group_id);

We see use after free issue. In pdev->driver->remove(pdev); call xe 
structure is removed. We can handle devres_group_id by assigning locally 
and release it.

Thanks,

-/Mallesh


>   
>   	if (!pdev->driver->probe(pdev, ent))
>   		return PCI_ERS_RESULT_RECOVERED;
--------------2neXBMhap1dzvcXSOihIAx3E
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Riana,</p>
    <div class="moz-cite-prefix">On 22-01-2026 03:36 pm, Riana Tauro
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260122100613.3631582-13-riana.tauro@intel.com">
      <pre wrap="" class="moz-quote-pre">Add devres grouping to handle device resource cleanup during
PCI error recovery.

Secondary Bus Reset (SBR) is triggered by PCI core when the
error_detected/mmio_enabled callbacks return PCI_ERS_RESULT_NEED_RESET.

Once SBR is complete, the slot_reset callback is triggered. SBR wipes
out all device memory requiring XE KMD to perform a device removal and
reprobe.
Calling xe_pci_remove() alone does not free the devres allocated.
Since there are no exported functions to release all devres, group the
devres allocations and release the entire group during slot reset to
ensure proper cleanup.

Cc: Matthew Brost <a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>
Cc: Himal Prasad Ghimiray <a class="moz-txt-link-rfc2396E" href="mailto:himal.prasad.ghimiray@intel.com">&lt;himal.prasad.ghimiray@intel.com&gt;</a>
Signed-off-by: Riana Tauro <a class="moz-txt-link-rfc2396E" href="mailto:riana.tauro@intel.com">&lt;riana.tauro@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_device.c       | 7 +++++++
 drivers/gpu/drm/xe/xe_device_types.h | 3 +++
 drivers/gpu/drm/xe/xe_pci_error.c    | 1 +
 3 files changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 16fc6da01357..0cf6480b8aad 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -440,6 +440,7 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 				   const struct pci_device_id *ent)
 {
 	struct xe_device *xe;
+	void *devres_id;
 	int err;
 
 	xe_display_driver_set_hooks(&amp;driver);
@@ -448,10 +449,16 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 	if (err)
 		return ERR_PTR(err);
 
+	devres_id = devres_open_group(&amp;pdev-&gt;dev, NULL, GFP_KERNEL);
+	if (!devres_id)
+		return ERR_PTR(-ENOMEM);
+
 	xe = devm_drm_dev_alloc(&amp;pdev-&gt;dev, &amp;driver, struct xe_device, drm);
 	if (IS_ERR(xe))
 		return xe;
 
+	xe-&gt;devres_group_id = devres_id;
+
 	err = ttm_device_init(&amp;xe-&gt;ttm, &amp;xe_ttm_funcs, xe-&gt;drm.dev,
 			      xe-&gt;drm.anon_inode-&gt;i_mapping,
 			      xe-&gt;drm.vma_offset_manager, 0);
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 2d140463dc5e..3a19e9b5dfae 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -672,6 +672,9 @@ struct xe_device {
 	/** @in_recovery: Indicates if device is in recovery */
 	atomic_t in_recovery;
 
+	/** @devres_group_id: id for devres group */
+	void *devres_group_id;
+
 	/** @bo_device: Struct to control async free of BOs */
 	struct xe_bo_dev {
 		/** @bo_device.async_free: Free worker */
diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
index a3cc01afa179..0960aa5861bc 100644
--- a/drivers/gpu/drm/xe/xe_pci_error.c
+++ b/drivers/gpu/drm/xe/xe_pci_error.c
@@ -65,6 +65,7 @@ static pci_ers_result_t xe_pci_error_slot_reset(struct pci_dev *pdev)
 	 */
 	pdev-&gt;driver-&gt;remove(pdev);
 	xe_device_clear_in_recovery(xe);
+	devres_release_group(&amp;pdev-&gt;dev, xe-&gt;devres_group_id);</pre>
    </blockquote>
    <p>We see use after free issue. In&nbsp;<span style="white-space: pre-wrap">pdev-&gt;driver-&gt;remove(pdev);</span>
      call xe structure is removed. We can handle&nbsp;<span style="white-space: pre-wrap">devres_group_id by assigning locally and release it. </span></p>
    <p>Thanks,</p>
    <p>-/Mallesh</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:20260122100613.3631582-13-riana.tauro@intel.com">
      <pre wrap="" class="moz-quote-pre">
 
 	if (!pdev-&gt;driver-&gt;probe(pdev, ent))
 		return PCI_ERS_RESULT_RECOVERED;
</pre>
    </blockquote>
  </body>
</html>

--------------2neXBMhap1dzvcXSOihIAx3E--
