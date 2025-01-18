Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B59EAC02185
	for <intel-xe@archiver.kernel.org>; Sat, 18 Jan 2025 05:19:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D2B110E08E;
	Sat, 18 Jan 2025 05:19:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d+0uRl2+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F7E710E08E
 for <intel-xe@lists.freedesktop.org>; Sat, 18 Jan 2025 05:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737177547; x=1768713547;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4oUbPVU32pUcDMaUORgpRbj6Yii80Ginzlbq6DjgoKM=;
 b=d+0uRl2+6LGyDlj5IcPj9yjSwbMnWYykxbSYJ3bMYnJbM2RVC2Nl7F/O
 dKIoeBwaOwdklPKOiRrU8EV36g2NglAyVoj71xPem5KAwLuPfkmpuirQZ
 WcXV09B018p+xD2/4N0HA6nIS5eI1cr+uCfnealJRdUj7Fw75dm05NAdq
 /bjfO7DcwTWjnaE4YlaiE3LpmDn7XsHLORlz+uk58yJCgHczH1ErmoLeE
 3AHPPpmxEZ4PRi29cBDI+XRgt1Z+DLvIrx4NJ7994oiNHPS9wdHhag34W
 19+enDank7enZMuWclSTiz8rIMhhN0C1GCRXOKG3e/eNHnqlqLsXi4k4m Q==;
X-CSE-ConnectionGUID: 7tCI8RcZQ92FwkhUV/Kttw==
X-CSE-MsgGUID: cbX2v+0lRaSEa9k9p+2k/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="25218019"
X-IronPort-AV: E=Sophos;i="6.13,214,1732608000"; d="scan'208";a="25218019"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2025 21:19:07 -0800
X-CSE-ConnectionGUID: NZKOJs92TCe3jgNd4RevEQ==
X-CSE-MsgGUID: 3hSCY0aaRk6/4Z5yRCL2GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,214,1732608000"; d="scan'208";a="105842681"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jan 2025 21:19:06 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 17 Jan 2025 21:19:05 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 17 Jan 2025 21:19:05 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 17 Jan 2025 21:19:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qS401fN2AmwnPW4cejM+iBh9MJT2/6BhRX/N1z391SgbmLst7KVeEB6qEL30cd/tUv4FvA7WdKLR0CbM/mCOeKryvpHOfYj4g2K1qRRodoGILPGTPVBnBKPXH3UK2vbgSTRgjRY9ggfR9ytuji9hDIxkSPzLp8mBfOPYnPjrmx1gfKJnlsHEG3F+uxjnJ3Mh7yE4yUVr5EO35Xl7O0wikWeZZQrT/HGCUabaXYI1PmFIHUaHQX+pYPklcd3COmycCHgfs0pasmpoyw1a6mtyNwEUTpEhjKZ7jGp4G9WTZ17ayoy450mwTKRA8vzg4BPSwxU3D74QLnfFpJy0t/6w5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H4xXpoNyKunsu/sRL25ePG34s1wnBjS6gjTZqlygzco=;
 b=mMrsla1+XTs9CkX0RLA17ElPgtM+vceoKxoUUJN+ZqCVa79E3Z+cEgXhTD4Rbb0J1t6OrE/Q5Y+CMuTsK3b6NxS/Dkuz1IpMkZDgSpB4c45QnLME0LRhja1vS1n9jLN6QJmYhkcNn97WYxv4KiVPDEoqKh3WpI1uH/hHwKsngB16Dn7lu6j5TzLszd10MX28azgeCBA62mrqmcwjBYv9B54qmpvbefPbYV4diQXtWvQB917xc91iZbyF8Yz/fArz4qa6dCUsUb97yHLCmUSLcY2J7VgnQJPcGCXVMi5Dl0a7wx0eRi0YuAbpz7Wn6oj7it/KsYIAsjfDqfVLrcZh2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6278.namprd11.prod.outlook.com (2603:10b6:208:3c2::8)
 by IA1PR11MB7727.namprd11.prod.outlook.com (2603:10b6:208:3f1::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.17; Sat, 18 Jan
 2025 05:19:03 +0000
Received: from MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2]) by MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2%3]) with mapi id 15.20.8356.014; Sat, 18 Jan 2025
 05:19:03 +0000
Date: Fri, 17 Jan 2025 21:19:00 -0800
From: Harish Chegondi <harish.chegondi@intel.com>
To: "Olson, Matthew" <matthew.olson@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <ashutosh.dixit@intel.com>,
 <james.ausmus@intel.com>, <felix.j.degrood@intel.com>,
 <matias.a.cabral@intel.com>, <joshua.santosh.ranjan@intel.com>,
 <shubham.kumar@intel.com>, <matthew.d.roper@intel.com>,
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH v8 0/7] Add support for EU stall sampling
Message-ID: <Z4s5xCVP6qx64kfo@intel.com>
References: <cover.1736970203.git.harish.chegondi@intel.com>
 <Z4l_LkmTYPaXjzZ7@bolson-desk>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <Z4l_LkmTYPaXjzZ7@bolson-desk>
X-ClientProxiedBy: MW4PR04CA0123.namprd04.prod.outlook.com
 (2603:10b6:303:84::8) To MN0PR11MB6278.namprd11.prod.outlook.com
 (2603:10b6:208:3c2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6278:EE_|IA1PR11MB7727:EE_
X-MS-Office365-Filtering-Correlation-Id: 91a7582d-a7f1-4ff1-5477-08dd377f9f86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SUZhSE5BS0lVOTVvUzgyVDI0QlJ1dnpRWlRnanFnaHF4K2JIRVZBS01nbE9p?=
 =?utf-8?B?a3pTMHlTVi9JUW80OWt0MlJ0VXZyWXRaMi91RENkT2J4WDFidXBES2J5UzlZ?=
 =?utf-8?B?RHkrZ2dRc1NkY0ZUbVAwbk42U0NvS1E0UzAyWUpLcTRvcFdCTWo3eHprVXoz?=
 =?utf-8?B?a29uTnhqZHBpbjVyV0NEZ3RubnhVL1Z3NTd6S3pmQ2w4cE1OT3hESlZzYTJD?=
 =?utf-8?B?UnJvU3JxWnhYdStpV3B3Zm4vMGJPMEordEhmY1N4VnhKeDRvS2Znb3JQYjU2?=
 =?utf-8?B?dEhoNk1hQmFHMjFRVjVTKzRQc1NVS2tzS2Z6aGtOc21sK3pvblJtL0wxdnFp?=
 =?utf-8?B?Si91TmlPZGtDVG14SjdjcjVuTFNaa2MrWE43OHJDeG45M0kvZWRhWkhrTm83?=
 =?utf-8?B?TjdpT1RyVE00RHZ5RnhkMnRsMGtjRlp1R1Zqb3JTcktvQ3lmaHFJYjRHN21U?=
 =?utf-8?B?QmtQZzdsRHpmT0JvTEhQallHSHozUC94SGs0L2l4cmtDeVJZOCtjV3R3UktQ?=
 =?utf-8?B?WFlnTkpFQ1g0dXBtZ0NuaHVnREhSTE9DclFVMjZyZ0hmdFZRL21mT2ZNbTVG?=
 =?utf-8?B?UlVQNElodFBudUxkTkdOOUVTeTFsRSs3aHpmcW94NWFOcGFWK3c5KzQ0Rjdm?=
 =?utf-8?B?WkNLcVIxS0xucEQzOVl1eUtBTk43bWpEV1RWem0reGpURXJpSVlERHlPUVhE?=
 =?utf-8?B?dzFTTFovU2JoeHNDTU9tbjNBWlZRS1JVekpPTWUzMmZHSUZuLzJaM3lRWW55?=
 =?utf-8?B?YW14MExJd2hQckx1TFZYZDJRcEM3aWNBWXdaUG9WWkVONDFqd1VCVHVxSjQv?=
 =?utf-8?B?bSt2RDRKVW1rZFlqTmtCN3FpTElnWWVtM3czdXVpY2djN1NCcGpKUHFiNk9H?=
 =?utf-8?B?WHZ3NFRJbDZYVjFaanRrdnJBb0JYODJEY3RKRUdFSWRVZDJ2YlhLS0xCMktW?=
 =?utf-8?B?M0J1Z1F0MjkzWlIxNGlieVpBdWpxckFacTlhTy9pR0VzRUlKbFhpVDZoVi9G?=
 =?utf-8?B?OVplODgrZmxGQzJ4WFpKM2hPSitGcmYyS01Gbmh4WXpuYnN0dGlxMkpaR0x5?=
 =?utf-8?B?M1pWWkFEMlVjQ1VOd0gxdzQ5UnRZSEtBWFRJR1B3VWNEbWluaHowa2N5c29D?=
 =?utf-8?B?cVdlRnpGUER5bTNJT3UvUENWUUdvaU1BR3ZrTUlMdHZKdEcyREtGN1Z6TS8w?=
 =?utf-8?B?bDFKVkpwaGZhejRLbGFROHhuVmFjQlhaZ25md09QK2c1Yzd2ZlNWcFFGdUdD?=
 =?utf-8?B?ZEpBK2tIcU9hcGsvVjJtalBIQ01GK2JJZzg3SEYyZTNyR0JTYkp6c0Y5emVU?=
 =?utf-8?B?MXF2K1ArOGp6ZUd3SklBTHN2dUhuN1hZYTlBTDVSb2k1WVN0eUI2VzdTTDdi?=
 =?utf-8?B?UE5ad1BsS09iaFRGQlhiOGU3WFB3Vm92SGRoVkxtSEd5UUpPajIvRDU1bHVO?=
 =?utf-8?B?c0N1Tm9uZVVQWnc0THZpaGdieGZYQkVTVHJZOElmd3hDRktndUFUODFIcnp5?=
 =?utf-8?B?V0NVVGx3aWc3elB4ZEpndGxBdmZqdUdIa2k2ZmYwQmkrOE81b2ZlbmdOcWdQ?=
 =?utf-8?B?RWdhTkk0N2w2MExLWWlkVXIycUNKOEprcFJRRzBCV1lOU2xWd3J3UjNHR2Y0?=
 =?utf-8?B?d3lGL2JXa2k4NHRjYjVUZGtZUzNNMG1XYnJETjFOajVsanBUUXcvZ25qU05k?=
 =?utf-8?B?Rk9KSS82d29YWUdiazlOZmRnT3FucE8valdVbHYyZDJtdlM4cGVKTHZTQm5x?=
 =?utf-8?B?WVdDWk5EU0VUeG5GS2FUYXFkaVc4U0ZwSS9QL3NadkcrYjhXZG1odENJbHh3?=
 =?utf-8?B?R0FhcG5PcHJZZUk4RGVBQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6278.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OC9oNW5zV1d5MVBNNjk0eHQxMUt5SEd5NUE2cy9qa0RqVmN0QU9yakttdnZo?=
 =?utf-8?B?SUdIcHJpb2lvQzZlTU9icmVaZVIzbzltYUo3STNSVlN0QmQ5eUNQMWcwelRi?=
 =?utf-8?B?RDQvblB6SFJpL3IycXJrL3p0WUJjTVUxL01mTG5BUGNBbTVLTmQ2ZGwvaDRj?=
 =?utf-8?B?bUU1WllKY281ZlFONzhGT21xb21tcjJKV05zSkR2R0p6cFhYMXhyMGxzSzBr?=
 =?utf-8?B?ZjBuTlVCTWNjcTRiNmRhTVZHcVRNZDZ3djF2bG5PL0Rubk5ZWFR3dVBvVWdN?=
 =?utf-8?B?a2o0Ni9BQ2JlNlpIcHlpV1dmcHNkMStpNzY4VkE3T1MyZEY4Sk5yRFgvRTJh?=
 =?utf-8?B?UWFFbUFlY2lMeEw4RmlQNE5nTG9zTjVWcllRVHV6Z2RyMDBkdS9hVXRwSE9G?=
 =?utf-8?B?SXNPbldETWJmdFRRVlJCcHdGU3l6c2d5RnNldHltc0VoYm1SbTdRc0wrWk54?=
 =?utf-8?B?ZTBzVG1hRVZZQ0hUYW9qcGdCKzZiengrZDRaYmpEcUxxdlY5ZS84MWtSNGc1?=
 =?utf-8?B?cXN3bUk1WVJPWCtVaTdJZm9pSCs3dXYycDFhZGFFbUdJUEtCTzZ1YXk2Z2hC?=
 =?utf-8?B?aXlyTDg0U0l3WkRlM2Q4dHowdkd2UWZCaVlSYXdIdFd3SzhveE51MEFSQ1d0?=
 =?utf-8?B?Yk1NVVd6QVQvYitHanpCcU1ZcDQ5bzNwc2xhUzZ4SlZOWHZMc3N4NTUyS2dn?=
 =?utf-8?B?c0pNZk9Pc3ViQkpnM1ZNTFJuU0hGU0d3RHhUQmF6TDB6ZWlGamVpejRqWFFE?=
 =?utf-8?B?OUk5d0UwMHRCSjhBY3Yzc2Y1T3dLYUxKSkRnV21adm41NitqT3lxWDN2OGJr?=
 =?utf-8?B?ZmVrQTAwY3FSSTJrLys0Y0Fmc094S3dIUjdLTWplNXI1UEdWMmc2NWs4Ykov?=
 =?utf-8?B?YjIzZGJ4Y2N6Y2ZJakRvc2U5Rk9lOXZxamczTFJwc3BpNSsyVXgxbTVtU0ZY?=
 =?utf-8?B?cms4V3NOOWpZQitCYlU5YTdPUWVCMTUxejNyR01NTlMxWW4vY0p0MWJCUEZG?=
 =?utf-8?B?OHNjeXpRaWU3QjJTR3JRL1RJVWhUeHIzOTVmUVBmTDNmVSs3Zis3ZmppNFhz?=
 =?utf-8?B?OFFVQUhObks3N2NEODJ0dEgvcFU1NVV6cDY0Smc5eFhBR1U0MW1ZbkltY3Qz?=
 =?utf-8?B?MWtiTFNNMG8rTjlPRzYrN3VSN1UwSUdVck1qaG1VemhxajhhQi81WlF0ODlo?=
 =?utf-8?B?THQvZHlySEY5ZnAyQXI4NThEcit1V0ptbUhUNndJRmppNzN3OURyaWZyWHNh?=
 =?utf-8?B?OFJVc09wTFM5dHp2dVJOOGRIOXVTaHJsanZJOTJuSStCaG1IdmdYWHVtb1dI?=
 =?utf-8?B?OTBOVThHcGVYbnJYTDk5alFjMlYvQ3J5NGlLSTA1MG5WSG5KU2lQeWlJVllm?=
 =?utf-8?B?dGNvMFpVN0tsVmxnUCtHOWxCRGgvbHlpM1BXaU1CUzBFbGxKSlJNRU80TFBR?=
 =?utf-8?B?Q0U3UGk1dWpLblh6UWR4NEY3ZmNxSktjbVgrMGJGVUFtaWRQOE5LWGt3ZmRY?=
 =?utf-8?B?cWlocGlaeEZ6Ym1xRUNLdDV4L3JiMnFsS3BvdTVlS0dlenlvbUJUakJwRERm?=
 =?utf-8?B?WVN3emFvL2tGQmhYT0xxMHV0M0k2Z2xXdFNwaE93d1Q4UHMveE1kQ3ZYcExv?=
 =?utf-8?B?Z3ZRVjlpcURBZkp5YXRQRmg2RXl0UERmelNnNnFrOGZpMEJJYzlWRTIrU3lN?=
 =?utf-8?B?c2I4QW5VK1cwV1BPbG0zNUl5cjlURi9mZnVxek1reUhBend4NkdITzQ5RGN6?=
 =?utf-8?B?aVBlSUdmTVNjdUlKcnBtS3JzZHpTOTlIRkpBN2tSZWdyQ25TdnIvakovRkIr?=
 =?utf-8?B?bTAxVEpGQlRxeXZ1dnZCKzBiRkRMZHFUeXluZXMzRHdQTzIyakp2WHJna0Vx?=
 =?utf-8?B?OU5GQXlYUlYzQXN1OXczS0ZXa1FlNU9XY3pDemFyNUpDT0prc3BjL2xaR0tE?=
 =?utf-8?B?L04rTHpGUmw2M0VJdmpjNzVFeGllSThPZ28yT3VKVFh1Nm4zVndrSE9YV2JE?=
 =?utf-8?B?Y0lzcjY4MWdTaUJVbGhiVHJEeFNDWnZBV1A5WFNEVnhHUXg2Vjl3cDlBZmta?=
 =?utf-8?B?OGsvaDdQeW14R0wrMlU0NlhGTWJGSGNzandPT2t4dmRCTFZmODhyZ0FNVEpQ?=
 =?utf-8?B?QnlIWnJiRGV6eWJpRUNnenh3RkZ6QXFickN5RkhrNzhoeGY2eDFubzlqTlZD?=
 =?utf-8?B?VXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 91a7582d-a7f1-4ff1-5477-08dd377f9f86
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6278.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2025 05:19:03.4360 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IZUjGcROBNT7WVAd8wzsG65kM0Djr7pOwtSNqKg6cqbXaAZWlgjGs2lpbw2qS0ko6YbGvNxNYNMKqKS8ZUyssjUUv1LP8SmqUAyUQigj/W8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7727
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

On Thu, Jan 16, 2025 at 03:50:38PM -0600, Olson, Matthew wrote:
> On Wed, Jan 15, 2025 at 12:02:06PM -0800, Harish Chegondi wrote:
> > The following patch series add support for EU stall sampling,
> > a new hardware feature first added in PVC and is being supported
> > in XE2 and later architecture GPUs. This feature would enable
> > capturing of EU stall data which include the IP address of the
> > instruction stalled and various stall reason counts.
> > 
> > Support for this feature is being added into Mesa:
> > https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/30142
> > 
> > New IGT tests for EU stall sampling are being added:
> > https://patchwork.freedesktop.org/series/143030/
> > 
> > This patch series has undergone basic testing with the new IGT tests.
> 
> Our profiler, iaprof, also consumes EU stalls using this patch series and
> generates AI flamegraphs using them. I've been testing mostly with v7 of this
> patch series since it came out, and have had no issues with it. The stalls are
> reasonable (both the reasons and the GPU address that they point to), and we've
> been able to poll them well enough to run our profiler in the background.
> 
> I suspect the following was already discussed for one of the earlier versions of
> this series, but is it possible to have even lower sampling rates than what are
> currently provided? We're already selecting the slowest sampling rate (the last
That's the slowest sampling rate supported by the hardware.

> in the array), but CPU usage is too high for our liking, and we're still getting
During EU stall sampling, a timer thread in the driver keeps polling for
new EU stall data approximately once every 10 milliseconds. I am wondering if this
could be contributing to the CPU usage too.
> tens of millions of samples per minute.
> 
> > 
> > Thank You.
> 
> No, thank *you!*
> 
> Reviewed-by: Ben Olson <matthew.olson@intel.com>
> 
> > 
> > v8: a. Used div_u64() instead of / to fix 32-bit build issue.
> >     b. Changed copyright year in new files to 2025.
> >     c. Renamed struct drm_xe_eu_stall_data_pvc to struct xe_eu_stall_data_pvc
> >     d. Renamed struct drm_xe_eu_stall_data_xe2 to struct xe_eu_stall_data_xe2
> > 
> > v7: a. Renamed input property DRM_XE_EU_STALL_PROP_EVENT_REPORT_COUNT
> >        to DRM_XE_EU_STALL_PROP_WAIT_NUM_REPORTS to be consistent with
> >        OA. Renamed the corresponding internal variables.
> >     b. Fixed some commit messages based on review feedback.
> >     c. Changed sampling_rates from a pointer to flexible array.
> > 
> > v6: a. Changed the uAPI input to accept sampling rate in GPU cycles
> >        instead of sampling rate multiplier.
> >     b. Fix buffer wrap around over write bug (Matt Olson).
> >     c. Include EU stall sampling rates information and per XeCore buffer size in the query information.
> > 
> > v5: Addressed review feedback from v4 including
> >     a. Removed DRM_XE_EU_STALL_PROP_POLL_PERIOD from the uAPI (Ashutosh)
> >     b. Separated the patches for Xe_HPC and Xe2 (Matt R)
> >     c. Moved read() returning -EIO into a separate patch
> >     d. Removed spinlocks around set_bit() and clear_bit() (Matt R)
> >     e. Renamed several variables, structures and enums (Ashutosh and
> > Matt R)
> >     f. Addressed other review feedback.
> > v4: Addressed review feedback from v3 including
> >     a. Split the patch into multiple patches (Matt R)
> >     b. Added a new device query to get EU stall info (Ashutosh)
> >     c. Renamed all Dss to xecore (Matt R)
> >     d. Removed buffer size and disable at open input properties. (Matt R)
> >     e. Removed the "_SHIFT" macros (Matt R)
> >     f. Allocate the EU stall buffer only on system memory.
> >     g. Changed the work arounds to OOB (Matt R)
> >     h. Other review feedback.
> > v3: a. Removed data header and changed read() to return -EIO when data is dropped by the HW.
> >     b. Added a new DRM_XE_OBSERVATION_IOCTL_INFO to query EU stall data record info
> >     c. Added struct drm_xe_eu_stall_data_pvc and struct drm_xe_eu_stall_data_xe2
> >        to xe_drm.h. These declarations would help user space to parse the
> >        EU stall data
> >     d. Addressed other review comments from v2
> > v2: Rename xe perf layer as xe observation layer (Ashutosh)
> > 
> > Cc: Felix Degrood <felix.j.degrood@intel.com>
> > Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
> > Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > 
> > Harish Chegondi (7):
> >   drm/xe/topology: Add a function to find the index of the last enabled
> >     DSS in a mask
> >   drm/xe/uapi: Introduce API for EU stall sampling
> >   drm/xe/eustall: Implement EU stall sampling APIs for Xe_HPC
> >   drm/xe/eustall: Return -EIO error from read() if HW drops data
> >   drm/xe/eustall: Add EU stall sampling support for Xe2
> >   drm/xe/uapi: Add a device query to get EU stall sampling information
> >   drm/xe/eustall: Add workaround 22016596838 which applies to PVC.
> > 
> >  drivers/gpu/drm/xe/Makefile                |    1 +
> >  drivers/gpu/drm/xe/regs/xe_eu_stall_regs.h |   29 +
> >  drivers/gpu/drm/xe/xe_eu_stall.c           | 1103 ++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_eu_stall.h           |   61 ++
> >  drivers/gpu/drm/xe/xe_gt.c                 |    6 +
> >  drivers/gpu/drm/xe/xe_gt_topology.h        |   13 +
> >  drivers/gpu/drm/xe/xe_gt_types.h           |    3 +
> >  drivers/gpu/drm/xe/xe_observation.c        |   14 +
> >  drivers/gpu/drm/xe/xe_query.c              |   38 +
> >  drivers/gpu/drm/xe/xe_trace.h              |   33 +
> >  drivers/gpu/drm/xe/xe_wa_oob.rules         |    1 +
> >  include/uapi/drm/xe_drm.h                  |   74 ++
> >  12 files changed, 1376 insertions(+)
> >  create mode 100644 drivers/gpu/drm/xe/regs/xe_eu_stall_regs.h
> >  create mode 100644 drivers/gpu/drm/xe/xe_eu_stall.c
> >  create mode 100644 drivers/gpu/drm/xe/xe_eu_stall.h
> > 
> > -- 
> > 2.47.1
> > 
