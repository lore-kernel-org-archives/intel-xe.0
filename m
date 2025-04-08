Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B81ABC369A2
	for <intel-xe@archiver.kernel.org>; Tue,  8 Apr 2025 17:53:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7030210E71E;
	Tue,  8 Apr 2025 17:53:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AL4dFo0a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E181410E731
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Apr 2025 17:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744134798; x=1775670798;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=WZKbRzjhNI2ZjgUhecgquh2hB7IIBMgbHww3W1MyMbI=;
 b=AL4dFo0awYU80I7YD/OY+RGPvDn1ZnwElUXvqE063DVV2nH36DItGHHT
 Ble4Yz8R98JUQVIEwPMbVUSgndgZtALnNec6i3xajVfktH5sd7F8ii9IZ
 r8bdCwzxJUGBgR+gI3otrmENNGDxQyIq0mTZPNt20RsEBs9GHpXUVeoC/
 JeqQTzCQKAMPIZzAlATiThnlJ4iWiLqIjGBhga9lSxInccopsLUvBiG09
 qI2NiYkIayg80F2aqxo62YW6K5FeMoxQTek8sGDCyh/QejP80jMLAz0QE
 QqAxKrBgEm0L25YWDxcMORpHi6scDQa5U/vl9E9EI6RCf2bRqcFC2nMst g==;
X-CSE-ConnectionGUID: 3lB6/HaxQ3K0YEfNGYAJog==
X-CSE-MsgGUID: l+A4hQIgRH25KteKDHy7ZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45747985"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; d="scan'208";a="45747985"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 10:53:18 -0700
X-CSE-ConnectionGUID: EAhLrNEQT/aqSWXm1SOLUQ==
X-CSE-MsgGUID: VwrOLHPNSbuHYXlKHWLQVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; d="scan'208";a="128879074"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 10:53:18 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Tue, 8 Apr 2025 10:53:17 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 8 Apr 2025 10:53:17 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 8 Apr 2025 10:53:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BwVJswgH4nRfXdPaciJga7HMhXM2/b4E/xZRc+k85zlaWVxllmxLuTL32HAzwpItHHoOS5VHIF7Wo8M1saZLXqkJoeJzB/uYrnFrsLH0T/gL/yg4T8u2mU1/fQ4AjMQ7SXDLCAj5MsCIHVwcQkbEQ8x4zWMIC8XeI3idjAETgwdEgfYlvKWvz72Uy08GZbZJbbOmIZnNXRN2lmo4sTbNKMD+Y0p05fYXiP8F5logX0QhlRiRqrBfTfsBF7WVAoniyzEG3ArEvrQGkpUoXUJB3Le45GkKdZW17OyGoCwSfMCtZK+eVsNUsuC+do+4oBoLtft+yvRK2ZJGeaVz+/nlpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8uQbVaDl5cySna3ABgvMaWoT/UpCqsu6g6DoYgtgZGM=;
 b=dZVN++ijtZU9XIffpXVYvyVI/4ng2n0r9+nQNBHkIA/ESLZeNyWlphRfp3GFsBXvFMTUrobhpqqmcSdxDI7PyHsWINMiisB/WSIXUtiG2KJTTVYucutY9UR1lDfwAgZVZfUW+6bZDHQ78M32lNRP7RseIGb4+FATYsC+fqIMEKevYbU4cJ+W073YKa56fuhe/VL7SdrBgPswVqBiys+D0Hm4Jgw5Xb/PbPj/NRDPfgBm56JuVHV7Vl0v0VzhxMlLbwDkpffaK6wGJlSLZxMQxYaD00hGNoOYJEwEAVsj9rAJhWADhnuJhKCqx+q87VcZsTw+tHUALKU5nQrMu7CLSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7717.namprd11.prod.outlook.com (2603:10b6:510:2b8::8)
 by SJ2PR11MB8404.namprd11.prod.outlook.com (2603:10b6:a03:53f::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Tue, 8 Apr
 2025 17:52:32 +0000
Received: from PH7PR11MB7717.namprd11.prod.outlook.com
 ([fe80::a546:1ad2:2379:b848]) by PH7PR11MB7717.namprd11.prod.outlook.com
 ([fe80::a546:1ad2:2379:b848%6]) with mapi id 15.20.8583.041; Tue, 8 Apr 2025
 17:52:32 +0000
Message-ID: <4927a798-17e6-42aa-8d81-f5d9c4ee98fa@intel.com>
Date: Tue, 8 Apr 2025 10:52:31 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Add page queue multiplier
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250408155915.78770-1-matthew.brost@intel.com>
Content-Language: en-US
From: "Randhawa, Jagmeet" <jagmeet.randhawa@intel.com>
In-Reply-To: <20250408155915.78770-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0155.namprd03.prod.outlook.com
 (2603:10b6:a03:338::10) To PH7PR11MB7717.namprd11.prod.outlook.com
 (2603:10b6:510:2b8::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7717:EE_|SJ2PR11MB8404:EE_
X-MS-Office365-Filtering-Correlation-Id: e3dc4f74-fadb-4ca8-eda8-08dd76c62301
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VitRUmxwdTg0b3NadnJCNC9oUmFoZlcrQXFDRUZ4VG1PYmJMcTBFTVROeW5t?=
 =?utf-8?B?b2p0SXlxSHgwZW5vK3BqNndHTFZHTHU4WVlCQ09hZ0kyaUE0QXpUeGF5bGpM?=
 =?utf-8?B?Y01rRjY3bDBOcGtYVk1lTnNibEpoNXFjdlhWNWFEK3hBVVVyS1N5YmpJTkZF?=
 =?utf-8?B?RXhrbmVGK1ViS21SNnk5KzhjQk1MaWZQZ0diNHRFUjliRXlheGFUQXNSeHFk?=
 =?utf-8?B?RGkyNkErKzU0djdYdnBaanphbTVOVFVHanU2UDdvaXZtTm5FekZYeFFvb1BZ?=
 =?utf-8?B?b0hQVmpGUG1IZjRQc0xtZEo2d0Z3WFlyeVhmVU1Eejl2a2Z6Vm05NG1CQWxw?=
 =?utf-8?B?MlZScWlUUmVtU3dHUjk0eEcvb1JRc1dpb256Q0o0YUpTY2JsT2JabWpLNTQ2?=
 =?utf-8?B?Vy93NlRYb2pkWWg5eHdqOGo2NFVXUVk5VFhDTlM2V3VJdC90M01QTGl3aEhT?=
 =?utf-8?B?bjRPR1FSck9yQzQzbmR5eWpITnRHZ3FWODYzN0JHYTh3aWY0aXpYWFpYMGZQ?=
 =?utf-8?B?RzNtblMzTFYwTDIwbjYvcG9TSVlDNGxiM3BMNWs4NHJETWV6NWU1T1U4a1N6?=
 =?utf-8?B?cU1hZmVNTHFiQzFIdGIzbFU1MTZzZGt4MFJ5eDVIbjJsQ2hBcnFXZm9nU09D?=
 =?utf-8?B?ZE9IYUMzWEpLU0hoSTYrQnV4TWx2Uk9VOGY1N25HZlNBckVVSmtJZTd2ZDBp?=
 =?utf-8?B?ZG1zWW92bTIvNi9rSjJsKzhwb21FVE9PeFY2Y0NDZEhtcDZzc1hZbDFqZHlH?=
 =?utf-8?B?b1h5SXl3S09pL2ErSXdQOXcvTkRKME9XZUtVWlhMYWkzK2xyWmZOd3VYNkxj?=
 =?utf-8?B?RTBtSTVRT3FPdWp1WTRMNFNYMWtLY2xsYkZ2MXVDWFliaUM3WTY2d3MxdjFy?=
 =?utf-8?B?TFBYQ2dUTFY0WURDcnVVcmtncFZGb0VtNEYyZHVqUU5kdXJ1YWwwMGp0RGdr?=
 =?utf-8?B?RkJKeUZPQnhYMUo2MGNmVWw2WmZGSlVZWEhLaDQxRUovalRQVm5aVzUrb0JC?=
 =?utf-8?B?Q3l4UkxFSnhoaENIblRoUFF1WlRqcktuT3JXZ2l1T0phbDVwMEhDa1NMNXhK?=
 =?utf-8?B?UStqNTNYbXY4MzRwNStSanFPRkllMnBvdDFWallPU1ZhajZLOWd4VU92UmI0?=
 =?utf-8?B?ajFOdjBiVlNFakFsMllVcDkzajN2ZzAyN01LWWpmNnVPT3pzU0Q0SXp5ZjMv?=
 =?utf-8?B?N00veWVzR2dwL3RmQWZ5VklaVnVTaFlHN2plL2NJbEpncWRrbG1yQytzZEFL?=
 =?utf-8?B?THVjSlhQSGVqV09mRUwrUUFuZ1Q1ZnEvWjNvaUVlTXV2bzNQVk1yZ29Od3J6?=
 =?utf-8?B?QS9tcFBYUFFnNFVNc0NUd2NlcmhJaEFTWE5VUlg3ZkJkbEx3SkZHek1oT1Bx?=
 =?utf-8?B?OFJYV0U1UG8vTTZoRUxFLzIzMFVPVFhTZGk0UHUyU0dEeFk2cU5HMldsL3k2?=
 =?utf-8?B?S3htYnlpWWlWR2ZsNFFIVytlS291RDA3TDAyTmxhbVRQYVU0MGl5MkdJREdU?=
 =?utf-8?B?dkp6aTJaZTkyaGcyOEtaRlg5MFVjQUNkOXRrbnFBY2hvUXJIdkt3NmVnbi85?=
 =?utf-8?B?MllVZVFEK1JPTDFKQU5Tc1hTWGFmb0xNQU84V2NjZlptM1hLekFGVk5TR1h6?=
 =?utf-8?B?cjRPY3h1M256TFFORWdQMklLOFFuRkRJN0x3NXhWQWhsRHVra2taYlZyVG8r?=
 =?utf-8?B?ejVqN09udDVYSUcrOS81LzZkMGdHVmtJVzd4WkRUdlFEcXRLdkVod3pXd0N6?=
 =?utf-8?B?cGdDUEhyZTJpdjdBQXBtMHdzOUIxb2g5SkRzSmZ2NDVMS1YwY3JTOTZzaWtQ?=
 =?utf-8?B?K2dMMWxUUEN1UjIyYVlEWkRNeFV0Tm1OcWNmUXZNbFlIZ1pqKytnRUNiS1VX?=
 =?utf-8?Q?u3RJeDpsLflMT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7717.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d015RnIrblpwKzQ0cVR3UGRUSUxYVmdDbWtiYXpodDc1TmZjN0FtQ2Q5cWNi?=
 =?utf-8?B?V0NnOTE1NTFKTTlKUGJmWERpNU1saHdaWlRTU0lETlRpTUk5c3FYMk1lQVky?=
 =?utf-8?B?SWlTSFE1SENHdUlSRVFsVlA0T2F3VkZrZFU1bE9YTHZsbU1yWFdKNDV2V09J?=
 =?utf-8?B?Wm85Z2FZUkpuaWZxaFdlaE02TzRuZlkvMjIyc1RGUUhuYmtqZjNmVkZnQ09y?=
 =?utf-8?B?MGZYUWNDNTVLVndYWTNnYWloSzJvdDNjWDM2ZW5GZ0Mvc3V6MUduQStTbnhv?=
 =?utf-8?B?TWp3UWYxMW9BTDJwYWxXOUJHMDNiSkNyWmYvbHRFQlBSRjFucWlzeFNvV016?=
 =?utf-8?B?SGsxK3d5UUl3Z091MVlEY1ZZWHpLM1hob1FwekdSM0E1aWRUQnlRbXEvVXRr?=
 =?utf-8?B?cEdvci9DZER5RkoxN2M2c1d0N1p1QzgyaDFhcWJwNVF5L0xGTGhjSDJ6KzNL?=
 =?utf-8?B?S3o1TFVValB1SWtBWU0vN0plLzhEME1DZDYyWHFndk9TclpjWTQwNjMveC95?=
 =?utf-8?B?R2tiRS9BbytsQnJXTW9xTkF3UFNQckF2ekxvMk1JZ2R4NDZCYk1OM0REb0Rq?=
 =?utf-8?B?OFp5bUt2ZmVtMysycEw2cWNvQktGVkM1cXBrTkU5bmN2cmFXdXN2Ums5aHRp?=
 =?utf-8?B?djJZeFFublpIZVBCSUM5aWM3elgrMFJYSzBYcEd2bWludTBIT2xyaURQQU9W?=
 =?utf-8?B?REx0a041WU1MQ084SlBXY3l6TGcxVmdMZ1FEd2Y0TS9RRDNUZlVSeXI1WHZN?=
 =?utf-8?B?MWtqY2RxbEZMZHFIOXM4aWMvYmhLMUhicWg0a1FGeHZaUisrWllYVkdscnlF?=
 =?utf-8?B?b2ZJc1lUbjByOVpJL0V1b0ZSNUhkOHB1a3JpOGxhY2RqZ0xpRWZWTHVtZWlH?=
 =?utf-8?B?ZDUyOHhVWlcrekNwaE52RVFMcUNNZUxRU1l2UHVaZHJycmQwTzhGWFN6bDRn?=
 =?utf-8?B?Zy82N2ZxZlR0ZDRDc0RDc2t0UGlOZzdsMTFKc1A1cUlpdDk5SnFoYkVQSGdn?=
 =?utf-8?B?Zm9qQTRWbllvWW51ZFp0RGdsK1hQSjFFZTc4L3BLdTlUb202U0NhenZrazV0?=
 =?utf-8?B?OEhFUVl4UHU3N2NORVpjb3hzMFJoNkhmMWh0M0pWZEl5RXMzelFTenZlVWNQ?=
 =?utf-8?B?OUFjUmVjRTRaZ2pPajZxMEZZWUxtdDhCUnZsa2ZtcUF3TlFrMWNPQzd1WDJY?=
 =?utf-8?B?b1RxWTFpNSt2TTBBeFIzWURzUC9IL1hiL0Jka0hLRFg5NmRFSnh5Sy9kZGpB?=
 =?utf-8?B?dWVQMFVYNEFacnVUcFNlRFRNeXM4S3g2SWw4MVg2NlJjZ0dGV3hzVmpockMw?=
 =?utf-8?B?MDVUc2VlUWdYd3hlRGdEWGltNHAxT0tmek1JSlVmWklINXRmNzJtZHNBd3M1?=
 =?utf-8?B?VnViM1FqQ0RhTzVSV2VWWlNnbDZtU3lJVWdJRDNlMS9xbk9CUGFTR3M2NmEz?=
 =?utf-8?B?RHJycHdQTkZvcTVKUmhVL1h1ZnBlSTh2aEZ4NTkyaU4xOGtnV1JLeXY3ZmxN?=
 =?utf-8?B?aUJZQVJYTFJqZGV0QU9lZ0s2Q2w2YzRGSzkvbEtvZWIwc0RvMG5rQ2RDRFV3?=
 =?utf-8?B?RXRGaVBFRTE3dFo2U0lsMEppQURjcGdUb2s2dGZLSHpzVTV4emlQKzk3a2pa?=
 =?utf-8?B?SlJqN0VOQXNPTXZxQUFER3JzTDNVYTlXMXJuS2VheFZZM250NTVBbVViR3VO?=
 =?utf-8?B?Z2FSMFdyWEFEU3dzNE90eE5IK3h5dEt3dytKMzc0TlgyRjdsdkFMaGNrZHhx?=
 =?utf-8?B?aUpZZkJycnlwWUFiSlRYNFNlU2sraGJRQlZMMmFncG5tVGRLUnh1OGVhaHFU?=
 =?utf-8?B?YXlMcHZsSmQzbVkzY0hOK1JHZjJFRjdmbTFRQ0cwWVVvRGFCMWZtQXRXZzlM?=
 =?utf-8?B?NzlJN0JweC9BbWE1dHNPNERzZ0hLUFkzR3FrWk1tSDZTemN1UC9aemk0WFVN?=
 =?utf-8?B?cGxibTA2aGdQRjNvbGlFWHdnMzFycmEwY2toV0luNlpYMDV6aG52eDdSaGtZ?=
 =?utf-8?B?R1IwNFlwSnRDZUFacjE4RjZqWVNESGkyWlhxdWlHb1ZDOEE0ZHFWUkdpYzAz?=
 =?utf-8?B?RElUYUpEVHY0bk9rT0kxQ1p5MURRY1llc0h5WHgrbnFsZSs3SndEbGxaTjFX?=
 =?utf-8?B?WVhHVzc3NFVKanY4Y2lQTThqcE4wWFJqN0F6V1RlV0hESG9ZV3Bmc3lLeEoy?=
 =?utf-8?B?S1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e3dc4f74-fadb-4ca8-eda8-08dd76c62301
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7717.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 17:52:32.1171 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zrR79x36w8NgNdzwxzEoygM6hURwRPWKG1mj4NbRCbFyGuiaOJluceFl3Ut29JQmv8IPMSrwOuijw+jtR8pntGIxTe9igcqiBWrOBrbiLS8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8404
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


On 4/8/2025 8:59 AM, Matthew Brost wrote:
> For an unknown reason the math to determine the PF queue size does is
> not correct - compute UMD applications are overflowing the PF queue
> which is fatal. A multipplier of 8 fixes the problem.
>
> Fixes: 3338e4f90c14 ("drm/xe: Use topology to determine page fault queue size")
> Cc: stable@vger.kernel.org
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt_pagefault.c | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index 9fa11e837dd1..10622ca471a2 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -435,9 +435,16 @@ static int xe_alloc_pf_queue(struct xe_gt *gt, struct pf_queue *pf_queue)
>   	num_eus = bitmap_weight(gt->fuse_topo.eu_mask_per_dss,
>   				XE_MAX_EU_FUSE_BITS) * num_dss;
>   
> -	/* user can issue separate page faults per EU and per CS */
> +	/*
> +	 * user can issue separate page faults per EU and per CS
> +	 *
> +	 * XXX: Multiplier required as compute UMD are getting PF queue errors
> +	 * without it. Follow on why this multiplier is required.
> +	 */
> +#define PF_MULTIPLIER	8
>   	pf_queue->num_dw =
> -		(num_eus + XE_NUM_HW_ENGINES) * PF_MSG_LEN_DW;
> +		(num_eus + XE_NUM_HW_ENGINES) * PF_MSG_LEN_DW * PF_MULTIPLIER;
> +#undef PF_MULTIPLIER
>   
>   	pf_queue->gt = gt;
>   	pf_queue->data = devm_kcalloc(xe->drm.dev, pf_queue->num_dw,

Patch looks good and addresses the PF queue overflow issue seen with 
compute UMD apps.

Minor note: there's a small typo in commit message ("multipplier" to 
multiplier).

Reviewed-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>

