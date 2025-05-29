Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58C05C5B543
	for <intel-xe@archiver.kernel.org>; Thu, 29 May 2025 11:32:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F025A10E212;
	Thu, 29 May 2025 11:32:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eKhoiV/m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB73A10E74C
 for <intel-xe@lists.freedesktop.org>; Thu, 29 May 2025 11:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748518345; x=1780054345;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=uiO+j/ItGCLnlqW6sShjQOXRW6iQZyYb8GtiS23TWyo=;
 b=eKhoiV/m/CqdP8dvA275VYLMQqhp9Ej5f2YBE3k91ViNG72alCwOXfBf
 lInGfd6Rin9ejxvzSjfSHjCTu4mSTeavVfhFtJmQGFWIlBOfj3sGlnKRK
 F0JN/n+nS9Epy4sWRu+A/4TIbPqGxRBxL1Mfsek8739S4vXaagzn645nU
 t4CbJ5f+BJJETMAlHQgtkYwVFt56YO4O3zPwxIGcTiELvA4Z3nAJ0VyLe
 hJmGla/fFuFXzXh1E2lUhyoxYhpjUEwrFmT7f04OYYbnBjHuvNF6WojdJ
 AUvdeH1aHZTTkx7nbmqGxJI1Fm7gf+XCreIM2C/4o7xnP0UZ42z9e2MXk A==;
X-CSE-ConnectionGUID: WXErLCXKSN61FVxFdOMkcQ==
X-CSE-MsgGUID: vKWynjv5Sruwf18EOEAlJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="49693038"
X-IronPort-AV: E=Sophos;i="6.16,192,1744095600"; d="scan'208,217";a="49693038"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 04:32:23 -0700
X-CSE-ConnectionGUID: BbJbVpq3RSSDVLA1aKwfgg==
X-CSE-MsgGUID: 6Ga0UtmESTiz2nfq9bqv4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,192,1744095600"; 
 d="scan'208,217";a="144520002"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 04:32:11 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 29 May 2025 04:32:10 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 29 May 2025 04:32:10 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.56) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 29 May 2025 04:32:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ThGHlH+DO/V1SHme2zV0d9obS1azfGFedWlY1Nkph5J0EgFvm02b3ws7c/cHgF4/ghaK9tlbF9GW420Uh6f+WhKW3jqccqowVa8L7lDGzdO/qFs0UNslzEnoe48Qw2jgPdnrTcZb44Ql3GAX/r7RtwTObd9mx0x5xUWKJ6pEzyTWfyxyY+2gkNVeOjJdldCjsHy7FxGbirALJu3lRpJ3rfZovDRntMt1ypKEtzTEjepYUxvGxViZSTQzuyWYWM3W0K6VRcOCMZSaKa9jcDExWOunErBAE6V0PmbAEOP6FZ8ktbheXzB43rMmPKcHe+4QLxErBm/l8Ug44bsQkgJU0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ZGawEkEWGt8j6Q0QzIUnYP1vVh+nugl6xXVf3mF6ck=;
 b=NwbE8foNqJSePE2lY+Xz6VoledAEfJl5jG2igDKx6SQLLACdS8x19DKjL1Lox5L4MJyeiNWl+XyJeV0XWdQnTWZFL6xzH8geLJc2w5vcSCu/f3E9/E3SEDDi343zTBvl351uw6GsjiQJM7oamiEs7bdYDEAdjGbp13u/U7c4r45hghFlpfj3Rvj6gVBM2+s8isYvd3J9FF2cGHlHa+xOzwomN7d3MbSK2Z4v2ipJN2Op59SljZAyxa3vHN3ubbMQGDulD80ve66kJd3cJ8oihFm1GUPqbKx4F1RM0Sw7DmbyWsUMq0jRwZfuNhYmXAnrhLZ4PVQF7xrexbtQK2KxXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by PH8PR11MB6732.namprd11.prod.outlook.com (2603:10b6:510:1c8::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.30; Thu, 29 May
 2025 11:31:24 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%5]) with mapi id 15.20.8769.025; Thu, 29 May 2025
 11:31:24 +0000
Content-Type: multipart/alternative;
 boundary="------------T85C11x0og0R78SJ5n7nC0ET"
Message-ID: <280ddb2a-7cea-4be2-b704-cb40a9d6bd93@intel.com>
Date: Thu, 29 May 2025 17:01:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/12] PCI/ACPI: Add aux power grant notifier
To: "Rafael J. Wysocki" <rafael@kernel.org>, "Gupta, Anshuman"
 <anshuman.gupta@intel.com>
CC: Bjorn Helgaas <helgaas@kernel.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "linux-acpi@vger.kernel.org"
 <linux-acpi@vger.kernel.org>, "linux-pci@vger.kernel.org"
 <linux-pci@vger.kernel.org>, "lenb@kernel.org" <lenb@kernel.org>,
 "bhelgaas@google.com" <bhelgaas@google.com>, "ilpo.jarvinen@linux.intel.com"
 <ilpo.jarvinen@linux.intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Gupta, 
 Varun" <varun.gupta@intel.com>, "ville.syrjala@linux.intel.com"
 <ville.syrjala@linux.intel.com>, "Shankar, Uma" <uma.shankar@intel.com>
References: <20250401153225.96379-4-anshuman.gupta@intel.com>
 <20250401201349.GA1676401@bhelgaas>
 <CAJZ5v0irNFX6dFrStinNXamrhP143=yjjfx4iK0pY+-dTEkviw@mail.gmail.com>
 <CY5PR11MB6211021207DE5ECAA43BF26595AE2@CY5PR11MB6211.namprd11.prod.outlook.com>
 <CAJZ5v0inCpM2UhzZ_pD52S0Hf8aaEMa40CyE-dwzVmO1n3PMwA@mail.gmail.com>
 <MN0PR11MB6207F55ABAA2187609BB872695AE2@MN0PR11MB6207.namprd11.prod.outlook.com>
 <CAJZ5v0gKBYa_N-dA1JwF0yVbc6XSmQEy1LpVytDM7uc9kbZ8fA@mail.gmail.com>
 <CY5PR11MB621174B9AF1B5C6EA4FE27F095A92@CY5PR11MB6211.namprd11.prod.outlook.com>
 <CAJZ5v0hp-bYn8JFiBnTgrSdJWHm1jgCjcvbVZkzeOaySjvAQQg@mail.gmail.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <CAJZ5v0hp-bYn8JFiBnTgrSdJWHm1jgCjcvbVZkzeOaySjvAQQg@mail.gmail.com>
X-ClientProxiedBy: MAXP287CA0020.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::36) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|PH8PR11MB6732:EE_
X-MS-Office365-Filtering-Correlation-Id: 497a3d64-3b2e-422e-5338-08dd9ea457b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|13003099007|8096899003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WUlwOU9xVFk0bUEyNDBOZFVXMWtKT2MxeTlteU5IYS83bUJUMHV1cUoxUzg3?=
 =?utf-8?B?MldDWVpwVTcydlZKQVpRbHduRDZpMlZJbExNWFA0aSt6aDhXTkY5UEFIaE1h?=
 =?utf-8?B?dmNVMXdkc1MxanZQRHlIdmU3M0U4c2Q3QUtNa2FmVTNQRmNFTC9rT0w5elJk?=
 =?utf-8?B?L3I1UXE1UkhvNXdOcDdheDBOOUVmT1YrVU1qaG4veUhPTUdjN2ZnZTJENU1s?=
 =?utf-8?B?Q0gzWGZITFAyNGRHcjVHajIyZU5GZlpxclM1aW5pZmJUY3F4RHB5cVNUcFAw?=
 =?utf-8?B?R29pRE9wMWNQelVKSnE1YmRqbWpYV1VubVVsZDZqUkVxQ2w3VEdBMjRZQkdl?=
 =?utf-8?B?SHpKaVJpR3FETGlRbFF5K3ZqYTMzR3Ztb3R3UHJHM0hVOEFSV2IveVUraFlx?=
 =?utf-8?B?dTMzVlF0Y1pTaGY0bWdFb2h5N3VTZWhyQUZYRGlYVy95WHg2RFNBV2NqQUZl?=
 =?utf-8?B?RFFqd0dOMXJueEMxUm11ZDdCOWhnRWFTN1RDVUpHRDlHNDdLN2pEZzVWaVFi?=
 =?utf-8?B?VnUyM2U1YlY4U0lvdHVzNE8yUEFycmlxQ09aSUN4M3RzeTh0QWhOYmxEdVND?=
 =?utf-8?B?UVhNTW5WMlVyTmFoSzlFMnJFVUxpb2JFY2J1VGFMVDJDV00vVGIzZ1J3c0Q1?=
 =?utf-8?B?OUoyTFlSZDIyb2U1amo0aFU5Z2w0YUc0LzJoOFNRNUFWQUlJWXJRRE94SlpP?=
 =?utf-8?B?Nms5eEdoYTZ4WGl4YUg1TXRsclYvNkQ1VDhLL2J5MzBpOHlxMk4xQ0Rkb1Jt?=
 =?utf-8?B?NlphSU9sd1hyMEpKb2NkRStyMDN2aDFJaUoyLy9jL2srS29ZZmgvd0R5MlBt?=
 =?utf-8?B?VVBPcndaMFpZazlVeHVEQ1RFVlI1bktBcU80UGZ2ZEliM2hMc2U4b09PY0JH?=
 =?utf-8?B?NWowRUFRY09nMU9LL0lHbzdHNnFjcDBtMnRXSTNqZzBDWWZoSU40eGQ1cUpa?=
 =?utf-8?B?amFkUXJGZTNudmhJaWd5R3NuN3RnY01NSU9VWXpXSUExOFNjaVBodUVkNjgv?=
 =?utf-8?B?SUkwN2hyWnU4bDRoZTRIbENrMmZERG9kcmhnRGF6STJacmRybS9hWGI0cmlJ?=
 =?utf-8?B?SHFXS1c0UFAwc0ZMNDltVXVsT0lBTjJzblBsRXpod24rUEpsUzhYa0d1Q2xC?=
 =?utf-8?B?UHlnTjNxdDB1cU1HSGczd2laWW9TN3hDRUJ1R1NvcW9odENISHdDMjRrQWIy?=
 =?utf-8?B?NjJDdFZ6RVI1dXQ0MDNXaHlGWlYxUEhJTDZzZGxlbkVBVXBzenhjU1dlbWFM?=
 =?utf-8?B?cG0wZHBFRWwrSXR4Vk1aUUFtdW9hOStSbHRUZkRUdlJXazRxNDJRN1hENEIx?=
 =?utf-8?B?ZUF6SWY3ZUFXVG5EYzR4UjhJUFlDZzhnbDR5ZHFmQkxCRGJtQm05NndkdlNj?=
 =?utf-8?B?c2FibS9HaXIyQzdKWVNUbUVzQnJaSlZ3RXpHcDJaOWx4MnFQZ1ZBRHVoRUpt?=
 =?utf-8?B?cDVhcmVXRFZjSnhqTERMb1dkNEtrd1NlQTRLRjBaT01xZm9MRWVIMGowSVNs?=
 =?utf-8?B?aG9JSXI4bVAyaWhkNXFPUTY3UEJMNEs4b3lVRkU0UGFQQmZGUU0wc2JKMkI4?=
 =?utf-8?B?QlhDdDRYeE1iWWZsZ2V3alltNEN6M3dCM3FlQk1Ya2VLdTNRdS9jczVSMFc2?=
 =?utf-8?B?L2R4QTVRK2xNb1pTQlFrdVZuNmRUd3VnL2RNYXhXc2FJUDI1Tm9ZZzdMM1Jl?=
 =?utf-8?B?cEdZeFBBcWswYThVV0VuMGpUVVZzSlVTZmh1TEtOQTY5dGVGV1ZQQUh1VVVZ?=
 =?utf-8?B?cVVzRkwrV2JCbVA3dUQxTURPWnRQemFyTjR2NUUvTDkyN29ncjFFaG1yTXFh?=
 =?utf-8?Q?4S+y3vIl7RbJldC2zXY8nuFpwT+n+XuF/gLu8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(13003099007)(8096899003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TlRodmtzdmlzNWNpdElpbHhibHNTL3VyeVduV0xFaTFNdU9KYmIvSXArcm1s?=
 =?utf-8?B?eVZaV1RpUXQyMlNHZktsSXljdi8rbFF2RXNXb0s2VlcrZUVtM3FOMHM5cldr?=
 =?utf-8?B?R1FzVXVwU3NKblljakhEUzNCT1VGSXArTGRqTjc1YUltK0pPTk5VdG5BOWpN?=
 =?utf-8?B?cVBJMUdoV0RFSUU1V0lXQWZzV09RWTFZdEowOTB3S05FUEcrMHhjanN0cDhY?=
 =?utf-8?B?dSs0QmwvVGZRNXJxaUxqL0tDWGJNaUo0UHJlVlE1MTViV00zVno0SUp0cEVR?=
 =?utf-8?B?NHhCakt4a2k0cndobXM3c01OWWZuTVJVSW5qRUxWamNDaTRGSEFXZ1VBcEt0?=
 =?utf-8?B?Y0lnRlZ2WUw4N1JLcjd6TEtydGxoRy80T1VRa0dqTkZndmRMQ255SytKSU4r?=
 =?utf-8?B?WUtUOHU4b09tZXF4UEZTd3dhR3lXUHhCb2t5MWJZZENZeVFiOW9jb1o3RkZi?=
 =?utf-8?B?bHN5UmdyeWZmaWFBRm1GcFpVMFUvRVRuZ01NQ0pPaCtQMUZ0L0hYVFMyZGtn?=
 =?utf-8?B?anRYaFFYU0FHUUFpSjZpVERTcC9nYVpUVHp5ckhMc1ViWnlwUWFha3RNNkI1?=
 =?utf-8?B?OHlPWUFzWnlwNGthUFdNelRMcDJsZlBXdTFyL1M3dHU0UHFGT245NFlHNWRP?=
 =?utf-8?B?T0hHN2lBU0NhbmY3OUZEcjgybzBSZEk4UjZBL0lhd1EzQmtjQk5uTk1lWXJM?=
 =?utf-8?B?QkFoa3FONEQ5M0tibnZncHVwSmlRWkNUV0Z3OE5lRWR4cEJwQ3hTVXF5WXRk?=
 =?utf-8?B?aTE1QkFnQ0p0NG9Vd1NleGc5eDcyYzJ6eEN1RzBSVmJ1dVF4OHdxMlFWU2VV?=
 =?utf-8?B?OUZLTzhhaUxZZ2dDWm40RFVrTk1hZ0FSbEVuQm9MOW42RXFxUlRuTHd0QkdF?=
 =?utf-8?B?VDM4bFBna1NPZ2VmeVJEWGNFcTFwME03Qyt0ZGhDQUo4bGVpbjhEM3R3YldX?=
 =?utf-8?B?aUF0QndkMFVqbjlLYlZpTzg4WDZmejgzb1F5YkFYMWlPcHlPL1ZyOVJFSjBo?=
 =?utf-8?B?Wm9USU5aY1lVK3ZrN2dtN2lDcFhjaG9qZ3RrZm0ySTNGY1NaSUVHVDRIdzdZ?=
 =?utf-8?B?K1d5Q1JNMGRMVi96QmZ2WDRhc2IrNEdlTzJSd01FdzJzQU1IYkJzS1FjcXZD?=
 =?utf-8?B?dko2OXBUcS91WkptenhUNnhhUTVZcUIzTVZSNGcva3Irc2NpTmc5dzlrQzgz?=
 =?utf-8?B?bnBKV0UyL09TY0xDQi9oajNnTkpic2RNUWhHSFhaQmFkVXk3cDFBTlY2MlB4?=
 =?utf-8?B?NVBvaHdKM0lGc2Y1WWRMNHZ6eU9hUmZDZlYrYzFicXNqYkZiWkpybUJadW9i?=
 =?utf-8?B?cjNtakVxTmRnR2htSXk4b2VVdkpGalR4SkxOMEtHTVIvT1R1bzkwV2NhWEdH?=
 =?utf-8?B?MFhrUFlyZGtaS2FVb0k0MFhNRmVqOHBUTUdIQUpOWGZ4TUgyeWNtRG9RYnR2?=
 =?utf-8?B?Q3BDTE05SEt1V2lQbVJNWTZkVUZhQ1NTN1oxd0xUYldibEJMZHRLZTdmNmUy?=
 =?utf-8?B?UTduN1RrVDYycCt6djR5TUtZbGREdjVIN3Z1aXV5TlJiSHNpdTFnMk1WMUJX?=
 =?utf-8?B?Y1NmeEs4L2V3ank0VUN0RjMwaGRpZFRxR2dlWnF4Wk1PY2tmb1R1cHdpKzhS?=
 =?utf-8?B?RzdzWTREdnVHSDlac25qU3duWHdEdzhGaVYrWmdoTTM1b1lpbWxsTDdFWXRz?=
 =?utf-8?B?NDBGYy9kNVU2N21kc1hEcXQrV2dRcm90ci9oUUFjVUV2b1JuL2JILzhENWEx?=
 =?utf-8?B?cFZTMTFkMHRKVGNoeHcyVloxK0JJYTFMbWFFWUZGdVdieFlwcXpuUHEwckVo?=
 =?utf-8?B?NlROY1Y1Sk02aFRra1pWTno1WmcwV3paRDV0L2pBbWJPeVdwRVBqcExuVWho?=
 =?utf-8?B?bzJkdVRuUHM2VEcyMHRnMnB2WG5RU1lnRnpteVhDNXNlUTdCbFNqRmdPSnV6?=
 =?utf-8?B?Z0hCd3N2dE9DbVQ5TndvbU1YZFh6ekU1N1BpSUdkVGdpWnNINXRiM0RCNmI3?=
 =?utf-8?B?S1lkL2Q2eWZYT0ZuVmxid0txWVl3U0hTV3YyMjJvdFR6S1psN0lSRkZrekhP?=
 =?utf-8?B?THR1aW0vSW9MK1JkS29GMGJMMkZjdk4xVVhrYVJTcTc2dUx4L1VuUFNqRDR2?=
 =?utf-8?Q?923NEfQFpAG4uDhodDCo7mtCP?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 497a3d64-3b2e-422e-5338-08dd9ea457b2
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 11:31:24.2849 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3LkQF019WU2b9Dru/9NAD4o9kqOs7bqW6fwHv7/Mi3/SrFyVMBFpv3PVkTlzUlJYO+I60so7cehbqUUe1dBMgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6732
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

--------------T85C11x0og0R78SJ5n7nC0ET
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 08-04-2025 18:31, Rafael J. Wysocki wrote:
> On Fri, Apr 4, 2025 at 2:53 PM Gupta, Anshuman<anshuman.gupta@intel.com> wrote:
>> /snip
>>>>> Exactly like I said: If you only allow one driver to use the _DSM to
>>>>> request the Aux power from a given Root Port, it will have all of
>>>>> the information and does not need to be notified about any changes.
>>>>> Since no one else is allowed to use this interface for that Root
>>>>> Port, no one else will need a notifier either.  For this to work,
>>>>> you need some mechanism allowing drivers to claim the interface so
>>>>> no one else can use it (on a per Root Port basis) which is currently missing
>>> AFAICS.
>>>> IMHO such kind of mechanism will require to add Root Port specific
>>>> data structure to claim the interface. But real problem is the criteria  to claim
>>> the interface.
>>>> Is first PCIe Non-Bridge Endpoint Function 0 driver can be criteria
>>>> to claim the Interface. Or first come and first serve approach ?
>>> IMV, the first PCIe Non-Bridge Endpoint Function 0 driver approach would be
>>> sort of fragile and cumbersome to enforce.
>>>
>>> First come, first serve is much simpler and should be sufficient for now AFAICS.
>> We are enabling VRSR only for default vga boot device.
>> As it needed only GPU driving the display for better user experience.
>> Can we use same logic vga_default_device() to claim the interface under root port.
>> That will simplify the criteria to claim the interface.
> Basically, you need to prevent somebody else from running
> DSM_PCI_D3COLD_AUX_POWER_LIMIT concurrently for the given Root Port
> and store the information that it has been run already.
>
> Personally, I'd add aux_power_limit to struct acpi_device_power and
> I'd use a static mutex in pci_acpi_request_d3cold_aux_power() along
> the lines of:
>
> 1. Acquire the mutex.
> 2. If power.aux_power_limit is set for the ACPI companion of pci_dev,
> release the mutex and bail out.
> 3. Evaluate DSM_PCI_D3COLD_AUX_POWER_LIMIT and if it fails, release
> the mutex and bail out.
> 4. Set power.aux_power_limit for the ACPI companion of pci_dev to the
> requested value.
> 5. Release the mutex.
>
> Of course, this would only allow it to be set once per kernel boot, so
> in order to handle hibernation properly, the same Aux power limit
> would need to be requested again automatically on Root Port restore.

  I've incorporated the above suggestion in v4 patch [v4,02/11] 
PCI/ACPI: Per root port allow one Aux power limit request - Patchwork 
<https://patchwork.freedesktop.org/patch/656187/?series=145342&rev=4> , 
except for the Aux power re-request after hibernation exit, as we didn't 
observe any issues with VRSR post hibernation.

Regards,
Badal

--------------T85C11x0og0R78SJ5n7nC0ET
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 08-04-2025 18:31, Rafael J. Wysocki
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CAJZ5v0hp-bYn8JFiBnTgrSdJWHm1jgCjcvbVZkzeOaySjvAQQg@mail.gmail.com">
      <pre wrap="" class="moz-quote-pre">On Fri, Apr 4, 2025 at 2:53 PM Gupta, Anshuman <a class="moz-txt-link-rfc2396E" href="mailto:anshuman.gupta@intel.com">&lt;anshuman.gupta@intel.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
/snip
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">
Exactly like I said: If you only allow one driver to use the _DSM to
request the Aux power from a given Root Port, it will have all of
the information and does not need to be notified about any changes.
Since no one else is allowed to use this interface for that Root
Port, no one else will need a notifier either.  For this to work,
you need some mechanism allowing drivers to claim the interface so
no one else can use it (on a per Root Port basis) which is currently missing
</pre>
            </blockquote>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">AFAICS.
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">
IMHO such kind of mechanism will require to add Root Port specific
data structure to claim the interface. But real problem is the criteria  to claim
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">the interface.
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">Is first PCIe Non-Bridge Endpoint Function 0 driver can be criteria
to claim the Interface. Or first come and first serve approach ?
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">
IMV, the first PCIe Non-Bridge Endpoint Function 0 driver approach would be
sort of fragile and cumbersome to enforce.

First come, first serve is much simpler and should be sufficient for now AFAICS.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
We are enabling VRSR only for default vga boot device.
As it needed only GPU driving the display for better user experience.
Can we use same logic vga_default_device() to claim the interface under root port.
That will simplify the criteria to claim the interface.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Basically, you need to prevent somebody else from running
DSM_PCI_D3COLD_AUX_POWER_LIMIT concurrently for the given Root Port
and store the information that it has been run already.

Personally, I'd add aux_power_limit to struct acpi_device_power and
I'd use a static mutex in pci_acpi_request_d3cold_aux_power() along
the lines of:

1. Acquire the mutex.
2. If power.aux_power_limit is set for the ACPI companion of pci_dev,
release the mutex and bail out.
3. Evaluate DSM_PCI_D3COLD_AUX_POWER_LIMIT and if it fails, release
the mutex and bail out.
4. Set power.aux_power_limit for the ACPI companion of pci_dev to the
requested value.
5. Release the mutex.

Of course, this would only allow it to be set once per kernel boot, so
in order to handle hibernation properly, the same Aux power limit
would need to be requested again automatically on Root Port restore.</pre>
    </blockquote>
    <p>&nbsp;I've incorporated the above suggestion in v4 patch&nbsp;<a href="https://patchwork.freedesktop.org/patch/656187/?series=145342&amp;rev=4">[v4,02/11]
        PCI/ACPI: Per root port allow one Aux power limit request -
        Patchwork</a> , except for the Aux power re-request after
      hibernation exit, as we didn't observe any issues with VRSR post
      hibernation.</p>
    <p>Regards,<br>
      Badal</p>
    <blockquote type="cite" cite="mid:CAJZ5v0hp-bYn8JFiBnTgrSdJWHm1jgCjcvbVZkzeOaySjvAQQg@mail.gmail.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------T85C11x0og0R78SJ5n7nC0ET--
