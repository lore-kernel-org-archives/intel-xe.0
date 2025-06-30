Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B69ECC83000
	for <intel-xe@archiver.kernel.org>; Mon, 30 Jun 2025 06:41:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78B7C10E39A;
	Mon, 30 Jun 2025 06:41:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZGT2ipO5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C745310E39B
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Jun 2025 06:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751265703; x=1782801703;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Eh6VrW0px9caOKuCJk6V74Ab4GGsvP4wKg7CjsmEDpE=;
 b=ZGT2ipO5W155OraPQDx/XNZxHaXmDHeqdQguFdUmOucuv+0XDTTDyfOS
 GkUKBK2gup7xD04nLNPCxZY4mS5pxfoEwB97vogvHS1Cy7mobUFVd55D5
 hNNjiCxhWJVz7s7iH0dclpc+8Mo9snY4CgKdVsRCMjIBJ0JnvHZg5H8dD
 A6MtCBvt/NCWUdiLBFaBPmu5j1DPN56ZnGdQC2IcIk6yuFZecx0HOzgzC
 7Q3AoZcSYt1V5MP95Z1CskWbjhwYJ+sJ6mw67foqq1UAQT3VLhQ5R9e7E
 wUv9ZI14UqKoD2dUuEmz1cs7uIuIL5vrrRqnMBcJ3o/eAH8CpkfOycxQM g==;
X-CSE-ConnectionGUID: 7g7QCuGnSKqJ73j98vQnqg==
X-CSE-MsgGUID: IFESu313R5276wtXF/XsTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="63735725"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; d="scan'208";a="63735725"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2025 23:41:42 -0700
X-CSE-ConnectionGUID: 3ARZcYlQTK+ct35Aqod+3Q==
X-CSE-MsgGUID: UeeXWKUFT7C+142pmYDl3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; d="scan'208";a="153916078"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2025 23:41:42 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 29 Jun 2025 23:41:35 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Sun, 29 Jun 2025 23:41:35 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.89)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 29 Jun 2025 23:41:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=epgcUeyBQstV8NHk0O/jxLE23ip0Z7BeTopKXcvSBcyFomaJCn4ClZvlEASUh0X+Odt6nzCMcIkqW852An9HecooQN89pEGFjTgvPoMhBXsJ2uNfhpTP4iOqCaveFJypQBPDo+1a4dNmNVQctH3K9TdXgAgb0vIfjvl+hWhUj72bjzR/8x2lucKbrFACsVL6RIYI9E1KLhaA1UdGFh9VdRIV0aV+YyPDovchSBJt7sqbVO63z0j5oiiuaGFqpIWh7N6bzcEspj2eKJvSM1/OKvrishKi4arPJQll6Dv+k/qK1qFzfOsUHzJ/wr9U9O5yMcVflzzaUswEKIpYUVh2hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uj0lB6nFSO2hnDztgy4FUREq2IWg/R3WcoBaCecJ7uI=;
 b=mdKGM3CEWaBdtg3TJG/LTA/Af2xwwuOQJG6f2M6FCnpxOHkHZ1q5LBCheC0Eorh4h4Q4EbMOS2PrYS/DcPBMR7zdcu25tOVrZYHFRgRH0bmysxkFpYO9fk240zcNP4bX4BLjnfF7f+tiGE2DMQstvbDrAkX9NGGYEAa2KSeDlPbXVUqu99ydI+do6HpnbAaLopHy0ZX9hdQaP2dyuqqs1nw6GtGYomKozz3WPQKm+6mlVIHF3NU0QxILitEOKQzzjrX0K5hH6AgdiZ1/Y3zX3z7/Al5gsF4fBnkiJ2PzO41qSarTS4DTZ84QZw6VKQF49bHHrwkcrci7CkYU47E21A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CYYPR11MB8385.namprd11.prod.outlook.com (2603:10b6:930:c1::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.21; Mon, 30 Jun 2025 06:41:33 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%4]) with mapi id 15.20.8880.026; Mon, 30 Jun 2025
 06:41:33 +0000
Message-ID: <c94716b2-82ce-4d92-af78-2038f124a3fc@intel.com>
Date: Mon, 30 Jun 2025 12:11:25 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/2] drm/xe/xe_debugfs: Exposure of G-State and pcie
 link state residency counters through debugfs
To: Soham Purkait <soham.purkait@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <karthik.poosa@intel.com>, <jonathan.cavitt@intel.com>
CC: <lucas.demarchi@intel.com>, <ashutosh.dixit@intel.com>,
 <jani.nikula@intel.com>
References: <20250627190041.238015-1-soham.purkait@intel.com>
 <20250627190041.238015-3-soham.purkait@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20250627190041.238015-3-soham.purkait@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0148.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::18) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CYYPR11MB8385:EE_
X-MS-Office365-Filtering-Correlation-Id: cb8cf7e0-f9c1-44f3-8034-08ddb7a1274d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bG9XQ0NwLytaSUJVVEJJY0R6ejdEbnQ0aHg2TmJNb0FXRDdqeGc3Y1Erei9T?=
 =?utf-8?B?SzFwSlRmMDNyUWhzendoZ2RSOStHZXVkK1k3MFAva0tVQ21QTTFFcG5ReVFt?=
 =?utf-8?B?NGl6UDJlanJpcjBmRFhadnRCWm9ncmpuUFhpVXNjMWhuNWsxR0Uzeml3Sk9C?=
 =?utf-8?B?ejA2VVYrVSt1RXlyMUQzZU1JMzFOeFFBbTMzcDZBZVh5Z00zTlczdVlvY3Vk?=
 =?utf-8?B?aU5vYmM0UzZZbUsrUnQzZzFQaXdTTkJ1T016bHViZ0R3SUwxMnU3Vm42ZjJO?=
 =?utf-8?B?TjNiTXp4ZjlvQWd0dUZkM2lTQzl5T05QTXZ6Y293a0JmZlQzT2FRV2gyUzFm?=
 =?utf-8?B?SHdBbVVUTGwyYTQwZVJnU3JVOWx1RW04L3Zid3VUQTN1RlMyVGxuSk1UclZJ?=
 =?utf-8?B?bWZYU1Q3STVTTEhCY0RMQzRiaWU1dUVuMksrSVJVZXh1YklYNyt0ZHlTbE5x?=
 =?utf-8?B?UUJVY1ZRTEhBc1d0S1dRWGpPdWxtcXVGQkEzTG9XN2lmRXlxbm8xQ2FuYVJI?=
 =?utf-8?B?TkZQYUJoWmxyamFTd29mTnJUWlJRbkdHeTRCb200aDRHQkduKzhYS1lnS1Jn?=
 =?utf-8?B?MWwveXIrekpZdHB0bUkwVEZPRGYvcU5BeHFaRE9reFZaM2s1dkdPcXRzaWE0?=
 =?utf-8?B?NGozR1MxRkJHNVlNY1Q4UmdkUVBMYS84Z3E4MmdtRzhNTXpwRzFtWXNRaDNW?=
 =?utf-8?B?RGQ0R3NTb2tKV3JWMW11c2hTVWE4Qkt4NlNiVjBubmJVTGF5Y2ZEMnZqRklW?=
 =?utf-8?B?S3oxL09wWHJpMUIxUDNBUUtKZTYrK0kzNm9ZZWJyNEF6TnU2ZHF0M0RUK3RU?=
 =?utf-8?B?KzNOUmRSOFNGT0ZJOEtBZnI2ZzczNyt4R3ZiRStXSkEwdTRjQk1sVDBSOWlX?=
 =?utf-8?B?bTNPdXI2cU9zY3daOEk3cVdQNHlmdE5SSS9OUWxscm5Wdy8yQlVMU05rSEZE?=
 =?utf-8?B?V05yWmxZdTFjZkdBazNZNXo1UU1VM25qRHhLUHZPRlJ2cWV3T3ZyeEFCV2NM?=
 =?utf-8?B?bisxRnRQaEpZd2gvb1ZwaHo4aHBSbzF4bXV6MlF4bDdtM0xjL1ZEMEdZOHV5?=
 =?utf-8?B?VG51aWVrR0FHZ1BObkRmSVMxRUxTcVRZSDNQQWVJUlFuVWdkZFY2dTlKaDQ0?=
 =?utf-8?B?RkExUUpLcUw2MXlUTFZqcUhMVGQ0bzR0elU3eDVHbmtEVHhXQVBmWVo2SVpB?=
 =?utf-8?B?cFRZcnBma1N5Um9PWWtiS1N1S05tZG9OUGJyZUlSbVdhaTkvK3VzeERYNVZU?=
 =?utf-8?B?am0rZkxRRnNmTzhiQi9tMDY5N3gwVkswN3V1NFpiQ1FEOGlJYWtyQ0VTejNM?=
 =?utf-8?B?R3NQYzBJTzEwNHJnUDVqZjRpRTlWRFNTbGJlNE9oeW5LWVZ3amhKTTU3QWFM?=
 =?utf-8?B?U3ZZQXNzTDVIRkVDTTZlNUFnS3FvQmhJMmRkVVZTVXhIOEFSV1FON09TNUFs?=
 =?utf-8?B?Q1FLb3kyVUl3VzZrMFlzMTBsNmRTS2dIVzR5cVFKalFsZjZaZkxBQzVvaWho?=
 =?utf-8?B?T3hWTC9GSTlPa2xhZU94U2xwZFRKZk1uSmRvL0x0N3UvRWR2ZDFLbkpwN2NQ?=
 =?utf-8?B?ZkJjUHZENGJ2NW9KdXFjUXFOSEJKS0hMN2Z5S2RtSG9PS3J6ZGtST0dvRjJI?=
 =?utf-8?B?RkM1a05OVlVoSzI1ckgxUzliemFYWUhQUUxvdDRyek8rampQVGovbmpidmxo?=
 =?utf-8?B?QXVrUnRFS3NsNndpRjFGRm1qUGlGVjVvWTIvMkV5RXltY0RhVjVxRFB3ZWV4?=
 =?utf-8?B?Vk1Xc0lhaTFSaGhQSHlNRGViSzdwKzRlcU1mWGJ4ZE9sQldYTGJJTU5DMHVJ?=
 =?utf-8?B?WGVmblJKWFJWSm5WL3FyTWoveWVFN2tMVnJPS2xTdDhzQ1grUzFuL0djTGg0?=
 =?utf-8?B?bXY2M3lnakxvb2Y3TGwvd05aN0tTWnJJTDI4ZGFLVWRLQ1Q1TDVYQlZxMi9q?=
 =?utf-8?Q?M5w5OAZuDi0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmZtUkY0dVB2Qm5ua0ZQZVVrQkZKQ1haRXc1SmNWWHlYN1phQUNuOHE0ODZi?=
 =?utf-8?B?YloySzdYZk5TSkFkeWlCQ1MxNjh4WEVmTnNONnVpR2Vlb2hOWmJmRTNwZ09B?=
 =?utf-8?B?ZUVvZTFtUEFMZElJUHY3cXZyRWNFa1o5d01SMXNmamFEMEQraktodkMxMG1H?=
 =?utf-8?B?T0I2VGVvWW4zSEdMWDlVRFg2N2ZBSit2SW5lZTZnWm4xVmpPMXZKT0hYd0xh?=
 =?utf-8?B?UTRqeVh6V0NmcTVpTi9SUEdpc0d3VjVPSkpHbFA4WXFHREttaWwxRFhkSEdT?=
 =?utf-8?B?WFJPenRJbzNwTlpVUUI1UTVEb21mRmVhcHBCOHVSUm5JTnl5YVhhKzlpRmpP?=
 =?utf-8?B?a1A3ajZxc2hrNXNMR3d4NkNObnFUZXc2cjJ0SmJlQ01DNnNUM2pCMCttdXZB?=
 =?utf-8?B?OVNQTVEyTm5WK1MzZ3JFUWhqSkJaejVYQ3hQOXpaUGZJSDlIRU1wMmNQM2M4?=
 =?utf-8?B?dDJ5a3FyLzIzYnhQOFBhOFlNS2RvTWM4bjlDQTg0ajl2TnhvYW9RMDJYNjFv?=
 =?utf-8?B?NnlMeVRUYkNVNlBFR2tEZDdmV0tZTUFpSDlmUEJNUGlBcy9kbThVWnpzNzFs?=
 =?utf-8?B?Slg1SlVWYjZkb3JOek1xSGlBZzlZeldXQjVOS1hZUnYrekF2aFNONHM1UVFV?=
 =?utf-8?B?aE95TE8rYWhodTdRQlA3bE5XNERIRDFuNnpmTGlNcy9LTnVLU2NocXo3SXc5?=
 =?utf-8?B?QVhJSTF6ZlJIN2FWSjNJT2FySEVKQkdWY0xhTFoxdjdZemNXZjQrYjhnY3Va?=
 =?utf-8?B?aytSRFB5VGpaZ0RXbkxxVkdmblhnQWF3eUJ3UjBGVHNZRDJSd0FEYS9VSTBN?=
 =?utf-8?B?T0pOMnMxWno3dTNsL2hpUS93eTNpSVJzOFhpZlJNY0FzM0dUc2NGS0pZWlVD?=
 =?utf-8?B?ZWpMWHAxbFRHb1ZHb0xyRmthaTZXa0VxNlRBK0x4MnpETHh3bTNQSlZ2OUd2?=
 =?utf-8?B?Q2ZHb3B0SDhWdi9rTUI5aUJ6ZTRYdWRIVjZhRnZxc0ZnRDVaZnpoWU5JbG1n?=
 =?utf-8?B?S0thMGFyTHlOeHkzV1B6STQ4Y3BkLzZmVHZQd1ZzeFd5Szh3V3RqM1grd0Z0?=
 =?utf-8?B?NkhIV0lnZi92dXplUzMvYVM2bU1pV3grMG1rZ3A3VW83SGpaVTFqaFVJQm9T?=
 =?utf-8?B?TnJrK2xFc0p4TGhPVjJvaFBPQ3pGV2pzeVZZU21pSit6Uk1yN1pkL3p5alJT?=
 =?utf-8?B?N0laVlNOUXh6bkREb3JXbk9qVXB3QndwQjBHRGFrSXdkVEdkTU9JSWhrNk8y?=
 =?utf-8?B?ZFdIOFRPVmJ2VTJadjdVclBVVTJ2aFF3cXpuRGZjNXEyaEg0ZXA2VGRqSjhJ?=
 =?utf-8?B?bks2Nnd6NXRDYWVvNDRrZ3NzZXEzenJoQWxoNTI2NVV5Z1I1d2Y0akN1MFBP?=
 =?utf-8?B?eFdtc1llTGdIdjJvZDVoTVpPZEc5NkcyeE9zZFJ6UVR3c3dFYXQrN2oyTC9N?=
 =?utf-8?B?c1JUcHJFbTVleUhTU0hFSk1zODN1OXNsS0Q2L292R3hkN21BeFp0aFJwYm5W?=
 =?utf-8?B?ZXJZQk03MS9ESU1VeGNUdTFNVzVKckZDRmsvRVZOQ3VjdkxKSmJiU2UyYmpF?=
 =?utf-8?B?R05OQ0k4blB4RkZsTC9UYmlzVkYyRzE4OXVDL2tVNnhHYUlhUW5RMGNVbXhO?=
 =?utf-8?B?dWIvTHA4SUlWNUNOSjVWWGhVUFp5QmNVTmh6N0RkUTROVjlJT3B1WTQ3L3Bo?=
 =?utf-8?B?b1BObnQxaFNOMWx5UU1NbC9sZlBabVZZY0FkdERIa2trRDRpRHdxTkhXWkdj?=
 =?utf-8?B?dHVuZXA4T3lXSTlGNzJTd0crSERTck1NNm8zNTZkd2twbmI3V0J4ai84MDZq?=
 =?utf-8?B?K2xFWWp3NUk4ODlja1dlcHNNdEV1SHNoQlIrTWdUbncyRnRPZnR2YXEyaGc1?=
 =?utf-8?B?T2dYLzBJRkE2MklNSzMveEJYVC9iRmc0REhOUDJZT2RjV2hQd0JWTHNDYTlm?=
 =?utf-8?B?R295SnVnQUV1ekVGUWdrbDVTSGlnQytrNTRsVXhEOHNJMXpXdzc1Y3VhZTlj?=
 =?utf-8?B?UGFJY2s3WjRmUDEyeUZmMjdhUzZ5My9yVkE4Mk9oUk9XbzUyRmpNOEFMT3Jm?=
 =?utf-8?B?WWtuZmE0YS9EQkc4R0Q0a0ljMngvNDdrbENNUVliWGdlaE9tSm8wMC84ZXJn?=
 =?utf-8?Q?fk1ZZyTPDy3eRhsVvQIbtk/sN?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cb8cf7e0-f9c1-44f3-8034-08ddb7a1274d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 06:41:33.7358 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A0u4iXZGffsmosW04yDdFzrd5uFNxg6PLUrEHRks8SsuoydsxDbNrKTYEH6lkPaXHf4toKiGnaWczmD7m0KSXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8385
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

Hi Soham

On 6/28/2025 12:30 AM, Soham Purkait wrote:
> Add debug nodes, "dgfx_pkg_residencies" for G-states (G2, G6, G8, G10,
> ModS) and "dgfx_pcie_link_residencies" for PCIe link states(L0, L1, L1.2)
> residency counters.
> 
> v1:
>   - Expose all G-State residency counter values under
>     dgfx_pkg_residencies. (Anshuman)
>   - Include runtime_get/put. (Riana)
> v2:
>   - Move "dgfx_pkg_residencies" from "gtidle". (Anshuman)
> v3:
>   - Include debugfs node "dgfx_pcie_link_residencies" for pcie link
>     residency counter values.  (Anshuman)
> v4:
>   - Include check for BMG for and add helper function for repetitive
>     code. (Riana)
>   - Use "drm_debugfs_create_files" to create debugfs. (Karthik)
> v5:
>   - Reorder commits to reflect the correct dependency hierarchy.  (Jonathan)
>   - Simplification of commit message and rectified register offset.(Karthik)
>   - Error handling and return before printing.                       (Riana)
> v6:
>   - Remove check for DGFX as BMG is discrete. (Karthik)
> v7:
>   - Add for loop and local struct to avoid repetition. (Riana)
> 
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Reviewed-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_debugfs.c | 87 +++++++++++++++++++++++++++++++++
>   1 file changed, 87 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index d83cd6ed3fa8..f086dba253a0 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -11,16 +11,19 @@
>   
>   #include <drm/drm_debugfs.h>
>   
> +#include "regs/xe_pmt.h"
>   #include "xe_bo.h"
>   #include "xe_device.h"
>   #include "xe_force_wake.h"
>   #include "xe_gt_debugfs.h"
>   #include "xe_gt_printk.h"
>   #include "xe_guc_ads.h"
> +#include "xe_mmio.h"
>   #include "xe_pm.h"
>   #include "xe_pxp_debugfs.h"
>   #include "xe_sriov.h"
>   #include "xe_step.h"
> +#include "xe_vsec.h"
>   
>   #ifdef CONFIG_DRM_XE_DEBUG
>   #include "xe_bo_evict.h"
> @@ -30,6 +33,23 @@
>   
>   DECLARE_FAULT_ATTR(gt_reset_failure);
>   
> +static void read_residency_counter(struct xe_device *xe, struct xe_mmio *mmio,
> +				   u32 offset, char *name, struct drm_printer *p)
> +{
> +	u64 residency = 0;
> +	int ret;
> +
> +	ret = xe_pmt_telem_read(to_pci_dev(xe->drm.dev),
> +				xe_mmio_read32(mmio, PUNIT_TELEMETRY_GUID),
> +				&residency, offset, sizeof(residency));
> +	if (ret != sizeof(residency)) {
> +		drm_warn(&xe->drm, "%s counter failed to read, ret %d\n", name, ret);
> +		return;
> +	}
> +
> +	drm_printf(p, "%s : %llu\n", name, residency);
> +}
> +
>   static struct xe_device *node_to_xe(struct drm_info_node *node)
>   {
>   	return to_xe_device(node->minor->dev);
> @@ -82,11 +102,73 @@ static int sriov_info(struct seq_file *m, void *data)
>   	return 0;
>   }
>   
> +static int dgfx_pkg_residencies_show(struct seq_file *m, void *data)
> +{
> +	struct xe_device *xe;
> +	struct xe_mmio *mmio;
> +	struct drm_printer p;
> +
> +	xe = node_to_xe(m->private);
> +	p = drm_seq_file_printer(m);
> +	xe_pm_runtime_get(xe);
> +	mmio = xe_root_tile_mmio(xe);
> +	struct {
> +		u32 offset;
> +		char *name;
> +	} residencies[] = {
> +		{BMG_G2_RESIDENCY_OFFSET, "Package G2"},
> +		{BMG_G6_RESIDENCY_OFFSET, "Package G6"},
> +		{BMG_G8_RESIDENCY_OFFSET, "Package G8"},
> +		{BMG_G10_RESIDENCY_OFFSET, "Package G10"},
> +		{BMG_MODS_RESIDENCY_OFFSET, "Package ModS"},
> +		{0, NULL}
> +	};
> +
> +	for (int i = 0; residencies[i].name; i++)
> +		read_residency_counter(xe, mmio, residencies[i].offset, residencies[i].name, &p);
> +
> +	xe_pm_runtime_put(xe);
> +	return 0;
> +}
> +
> +static int dgfx_pcie_link_residencies_show(struct seq_file *m, void *data)
> +{
> +	struct xe_device *xe;
> +	struct xe_mmio *mmio;
> +	struct drm_printer p;
> +
> +	xe = node_to_xe(m->private);
> +	p = drm_seq_file_printer(m);
> +	xe_pm_runtime_get(xe);
> +	mmio = xe_root_tile_mmio(xe);
> +
> +	struct {
> +		u32 offset;
> +		char *name;
> +	} residencies[] = {
> +		{BMG_PCIE_LINK_L0_RESIDENCY_OFFSET, "PCIE LINK L0 RESIDENCY"},
> +		{BMG_PCIE_LINK_L1_RESIDENCY_OFFSET, "PCIE LINK L1 RESIDENCY"},
> +		{BMG_PCIE_LINK_L1_2_RESIDENCY_OFFSET, "PCIE LINK L1.2 RESIDENCY"},
> +		{0, NULL}
> +	};
> +

Remove NULL and use
for (i = 0; i < ARRAY_SIZE(residencies); i++)

With above change

Reviewed-by: Riana Tauro <riana.tauro@intel.com>

> +	for (int i = 0; residencies[i].name; i++)
> +		read_residency_counter(xe, mmio, residencies[i].offset, residencies[i].name, &p);
> +
> +	xe_pm_runtime_put(xe);
> +	return 0;
> +}
> +
>   static const struct drm_info_list debugfs_list[] = {
>   	{"info", info, 0},
>   	{ .name = "sriov_info", .show = sriov_info, },
>   };
>   
> +static const struct drm_info_list debugfs_residencies[] = {
> +	{ .name = "dgfx_pkg_residencies", .show = dgfx_pkg_residencies_show, },
> +	{ .name = "dgfx_pcie_link_residencies", .show = dgfx_pcie_link_residencies_show, },
> +};
> +
>   static int forcewake_open(struct inode *inode, struct file *file)
>   {
>   	struct xe_device *xe = inode->i_private;
> @@ -240,6 +322,11 @@ void xe_debugfs_register(struct xe_device *xe)
>   				 ARRAY_SIZE(debugfs_list),
>   				 root, minor);
>   
> +	if (xe->info.platform == XE_BATTLEMAGE)
> +		drm_debugfs_create_files(debugfs_residencies,
> +					 ARRAY_SIZE(debugfs_residencies),
> +					 root, minor);
> +
>   	debugfs_create_file("forcewake_all", 0400, root, xe,
>   			    &forcewake_all_fops);
>   

