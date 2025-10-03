Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE91FCAC5B0
	for <intel-xe@archiver.kernel.org>; Fri,  3 Oct 2025 13:25:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92E5E10E91D;
	Fri,  3 Oct 2025 13:25:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f+z4hmbx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6062F10E90D
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Oct 2025 13:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759497933; x=1791033933;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=JxRlI4ufRncElzQU25KSFRZM9kYu6Rr9KwPJdFlgDrQ=;
 b=f+z4hmbxq/JQUS7PDe+fCaLo4vos3LsVquhrd9hTUkU1Q15zZO5RdcC0
 MOIDP4C6nNIC+naygV52Hz6ktHw9qqCVWQOajJ37N0CzqbwIGuoeefC6H
 JiR/fV/AA7vKMRkDdUaHlFbHYi+XBvYFoxNQKAwO9DN+gQBFMu4QhtV6Q
 jd3LTvaFpQb/k4sQD/VP4USD6dGz81+U2h8TGhoXgSCAc8K+8M1yyO7O7
 tkQMsKTrItAtepKXwjOpzGPPlPi9F1EaWPIHUahxZrh6ddhtOIz7FukSU
 B5ZmEzSRedIxmN7FzJ7ikg1n/LSisvUfxM1UktbSqXehjFH7lTTRlEC6Z g==;
X-CSE-ConnectionGUID: bcf26bmxSHmFBpG3QuXJsg==
X-CSE-MsgGUID: 2k/UUVFBT3+ATV0bH+8Png==
X-IronPort-AV: E=McAfee;i="6800,10657,11571"; a="64394476"
X-IronPort-AV: E=Sophos;i="6.18,312,1751266800"; d="scan'208,217";a="64394476"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 06:25:33 -0700
X-CSE-ConnectionGUID: +lZwbE4tRgmIqKW16tOMzA==
X-CSE-MsgGUID: tODvmHrmRNeoSKZKobORCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,312,1751266800"; 
 d="scan'208,217";a="180084974"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 06:25:33 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 06:25:32 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 3 Oct 2025 06:25:32 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.15) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 06:25:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KY8pNB9MJ9XHnYVVvKBUIoPbUtPEK6y0oJ1xLUfToWRGYjKhkCnJ0xF0Kw6YqtqfClOz79LJNho1NCWDNdKiup/O2wxRYooVV9h49mJzL4In4XhEIwMHS9iO5dEAmBvS0EhAAFQCO/1WtBRLUQ6+9OP0sCrHIBm91bKQniRJsVXppT9hDrWgESSA+YiDNgqLz1HdZIk2OjdExASdlcyXPJYmwsqxlOZUXWMkoL5xxg1XwbAADXKBL9Z/HDoe4WF313DimWi17G0gbXmCk0YSKOZ4YGsOL2HTXZRXt8XFMa4NFza+D+S0ojaDTBYFtFuBA1orTAzvCw5gT+yJS8G+3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P1PQJIL6xdGR89EyfzvqNgoHcPQKjyNmpBMU7S+tOvU=;
 b=pCIABQIoMHCYttIaS2cRKRwiINzlJz2R+ixrjusfKTmcOJR5UkW8RxVjDvya4LHuOXt3wj2MK3SMrgkDiYKRO11caNg7erSqMOL8tl9SyIdD7tZOMKKys4GNYAE/qSaYa5PSo8CPKLOlaZ0AdfpPzbY72hemebWfWkzuPBsDCdxr2rL1u5/cPtbbXlpHC1geVIsRExUMmpCaawxaoWf4kPIjS6ytGFuOMhvUoSHwDrRRcqJ/D3JDCmmD3qxpK7Wke6ioiF8bgYp2pA6Acvfc42naYFOJ4SqYisIyl0KkjiIAb5VnBOebuNxyHcpu8g6aAY18PyXCc1azG82uxeGaGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by BY1PR11MB7981.namprd11.prod.outlook.com (2603:10b6:a03:52f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.16; Fri, 3 Oct
 2025 13:25:24 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09%6]) with mapi id 15.20.9137.018; Fri, 3 Oct 2025
 13:25:24 +0000
Content-Type: multipart/alternative;
 boundary="------------2Hfq010CHao0rvJAJbLP3AhP"
Message-ID: <f02466e8-cf05-4b16-a55b-e759b3236b05@intel.com>
Date: Fri, 3 Oct 2025 15:25:19 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 27/34] drm/xe: Move queue init before LRC creation
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20251002055402.1865880-1-matthew.brost@intel.com>
 <20251002055402.1865880-28-matthew.brost@intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <20251002055402.1865880-28-matthew.brost@intel.com>
X-ClientProxiedBy: WA0P291CA0017.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::16) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|BY1PR11MB7981:EE_
X-MS-Office365-Filtering-Correlation-Id: eee2268d-d9a8-4dac-c742-08de02804f22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QjQxVWt6N0M4VkVGTGpDU2htd2R2d1FIV0szS0tuekV2U1c4eDNwbGZSVklK?=
 =?utf-8?B?UHlUTHBMbkJUL2x6dXRIcVNkZzVsQklhYjdEaVFmVFFoR0VtMnZoK2VpWE14?=
 =?utf-8?B?aVlxcmpVQ09kVFZLN1ZNa2J1SzVJRGNnM2NlVjdGd25DbDFydmVqcDJ5Mk1n?=
 =?utf-8?B?dGtTV2lKNFNaTnVHS2l3L2R0NnB2ZXVFcXNpc2FKQjUyOTMybDdQZzlCM25F?=
 =?utf-8?B?UW9rQnlBT2ltc0NkOC8rM1BvR216L2VadG9LcmowTEsvS0JmNlJiR0pqbEV1?=
 =?utf-8?B?N2ZoM01NMllNcWRFNHU4VE9ZRHNVeHNLZVZGaDJERFZRYUMvT01GTnowVFZI?=
 =?utf-8?B?bnc4U0l0TUNjNzczMnd5MlJsd2JyTlk2Y1NtWEdscXB1UURNL0kvcEE0cVJv?=
 =?utf-8?B?TlZoWGdpK2tVUEpFOXJvMVVDU1V0NVdxMmY2SEZzTnVvMytOUHdLd1EzanFw?=
 =?utf-8?B?ZWZuMU0waHppeVNiTld6bmMrSDE2Vy9yU3pHVFdpQXRHNHFDbm9jYmhqc1NW?=
 =?utf-8?B?TU5qZ25ZZERoSDZIZ1JCbE9yczQ1dWU0M2FZN3BvNDNCUUNJaisrOU51MjNm?=
 =?utf-8?B?NnB0Z0pPVDRwVzV6bDZMajJjdWFmVmNKaWhnV1l6aUtFTXAwKzZNYm1TVU5P?=
 =?utf-8?B?dkdQUlZxUENoeDdLaEFJMnI3ZWlad1ZiLzRLbVQzNDUrWGVneFVPcnR3aWQ2?=
 =?utf-8?B?WmJadnFkMTdvQ0FWamlOM1ZTYWllOFlPNlF2Znh6TU5HLzNIMVAvanNxTzU2?=
 =?utf-8?B?WkxvNjJxUG91eStMS2plMmRjR0J0MVFBTXRSczNGQ1dZeFcxa2VMWTRiOGcr?=
 =?utf-8?B?ZVcvRHNoazQvcTZ6VXk0ZU5xUUkzTjFZV3RFNWJJYnlWNnF6MWE5UFlmQ29W?=
 =?utf-8?B?U0RZakY1M1dBdy9iWktCZkZjdkdEWDAyRWVsRFFWc0lZTER6ODRWZE14NElC?=
 =?utf-8?B?a1R5NGxRcW1ma0sxQTJ6NFpXM2RsY1BxV09xSmxRUjZqYU1qRXkyMXJsZ1Zw?=
 =?utf-8?B?Ry9RZnFJdWY0WjgycGpDYzJHdU0yZGE3NC9yTnI5alRIOEVnTDVxQ2N1eUlD?=
 =?utf-8?B?NTdCS3FPMCtZL3IwUkY4UmxQN2xxcStLeGFDVVhsejdKc0FGVWhVMG1yQmNi?=
 =?utf-8?B?R1p0eW85UTVSanhWZUxHenY0WFZTYkhXakNpSGxtekZLZ2dSTlR4dGZlOURU?=
 =?utf-8?B?Umo1Q0J1L1J5cDBvVmlDR0JONE4xSElOemJPSDBJTEcyTllzZEhZNCtSZmli?=
 =?utf-8?B?V0tkMHBLYjk5V0ZNVkNoTHc3anF2SldYM1pwMEFtWGFGblZNeCs0cFhBMWVS?=
 =?utf-8?B?OU1SdmVTM2xGVW5vQTY1ZlpudFAxWmo5Ulc0N3lyQk9VM0hEaitxVytkNnRw?=
 =?utf-8?B?dnRxeXlNdkNTL052d093aW5uaSs1QldlUFVPUmpTYTFlejJSNjEwakw2ZEpF?=
 =?utf-8?B?WGNidzRUVDFZd3J2MU50T3FwMmtFRmpKZis1YXB5b2ttSjh0UjNVMEVkTXlV?=
 =?utf-8?B?NkppRFR3Z1dVQ1pRN3NWYXFTY0hsVVAralVHT3lHWURhVnZsUFc1dGF3Ykh0?=
 =?utf-8?B?Ty9GbXBJQUNPUXh4eXppZVZQU1ltdXRUK3RqU2x5NFpzZnVPR3lqTm8zTHhv?=
 =?utf-8?B?VENWWlJsTVZ4QU1pd2k4b1d6RjVNNm9rZUZkNXdQNVEzL0dIRklPK0cyTjlI?=
 =?utf-8?B?dTJUajBRbTlJVDQ3dFk2UUExdWtSbklBUEZGeUFCS2lhZ0h2aGNtTVFCeU9p?=
 =?utf-8?B?SUNuV0RrTnAyS09IdUVDV3IyelpBc01EckRnOEpNUDNXY09KVU1XWXZLZkVj?=
 =?utf-8?B?eFdnemFISU9QMU9Od0ZrWmxQc05HdTJ4eFN2ejByZlZLL2V3dnZHTkNIMDRX?=
 =?utf-8?B?YUFjYklQM1l5OWxzb0UzcWw4dGkxWlY0bEpvOVlIUGJBMTMwLzVTb21oWDVB?=
 =?utf-8?Q?Ng2Z3qsEIuXZhZKN7NrmWtNHgqxgYILb?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?STkzVUxaNCtsQlcxRXBuZG56QWxoMnE0aUFMRStYVXFOWDlsY3BhdGNYNkxL?=
 =?utf-8?B?amZUVzBOMTRLSnVaOTNPaFNENkVnQStya0k4ODMwck10WUZ2NjJDcWtxZExu?=
 =?utf-8?B?ODgxOGM5NXUxL2tQMkZzZUV1T211TSt2SWJnVFpleEVvZGZXS3NEWEc1N203?=
 =?utf-8?B?ZHh0YkxvSk42Z1JvY1hobGtWUFl6UmhzTHovU1FpMHJtcGxvLys4U1RPY3Ni?=
 =?utf-8?B?VU52N29ubmhEeHhCZ2ZrYUpYT1k3Mk5JQVU1aEV2MGkyckt4L0xUQ25xQ0gz?=
 =?utf-8?B?OThXdWtWUmREK3d6anMyR1EyNWtaa3ljUjJQREdoWU9ac2ltYmVrUUZsT1Q3?=
 =?utf-8?B?NE1qZ3kxdFpmWExKMmJZVWRENk5UbjArTk5aR0NKSFhTMmhYT0hESm9DeXQ5?=
 =?utf-8?B?cVhha29wT2hqOHd3WUtySHZuKy9BbE1iUXljeWt5V2p4RExMQVR5R0laL1hJ?=
 =?utf-8?B?SkFJbmJwZDFLVExCdTFPR21CTERzNDhoSHlXeGZhZWpra1dkbVB3K3gyVTFr?=
 =?utf-8?B?RnNqUmlSQ21NRWE5L3pDSHppYlcvaUN4Q3V2MHZ2bGJiMGdwQitCTUV5bmhW?=
 =?utf-8?B?WmN0S25Pd2FGaVM5K2dxemNmMEtLQ0IwSE5RRmhRaTQ5blJqUzRHVEVkVnox?=
 =?utf-8?B?SmFGMkFUdGZzRFZJbTkxdno5SU1lamtOOVF4cXRUQmQ0Y1FmakxJYzltaWds?=
 =?utf-8?B?RUZVUlorcVRZbWp2SWpBNHhNTThDdGxNNXdmRHc5S1NFbTIwbDRjUGhxUXY0?=
 =?utf-8?B?YjFnNnlJTlhndnFnZC9oZDFCZmxRVEEyWEZMWldSOGFrcHB3YUxZbTU3VHJm?=
 =?utf-8?B?K0FkLzJxQmpEcmpuMGw2bE1INDhEd0c4bUQycEhhaklLUUVhWGtNREw2Ylgw?=
 =?utf-8?B?RFBwS3FFNk1PSE1ucTZRaldqTnorSkVwcTJnQmNQNE1MQXM0Nk5MV0xFalU4?=
 =?utf-8?B?dDNkM1lyUWxaQTQ5UmRkdVJDaXNCK3JRMnVTR3JaaUN1NVBkeTlSdkUxaTRX?=
 =?utf-8?B?NGxMMmJCYnJGQmdUS3NtR0tsUnplaGx3TkJVY1BXc0x3VXZSV3JZVXRMd3JW?=
 =?utf-8?B?aVdjNDNjS2dTTkdNSEVpMU8vY1JBVVZVcUxrUHIweDlMLzdjRExaNGV2MG1h?=
 =?utf-8?B?aWVydGNkRHBYbjJRekM3WWEySzN3SmNJV1pBMGRXa1J6OEo2RG8zNlEvdFJX?=
 =?utf-8?B?Q3JFTU9YOFVqdHIwUUdiWmlXMEF2czhnSEpvckZVY0l4UG1KUE1BR28xcmV4?=
 =?utf-8?B?U2lmVHd0eDdIQnlrOERIRGhybFByRWtwZWx6ZkxYcU16UFVjTFIrUStmWDFD?=
 =?utf-8?B?ODVzZ1l1QSt2ZmxwdXFqNW9UOUR0K2tsMlBUM0tocjZ3Y0puNUgwdW5mRTBW?=
 =?utf-8?B?NlRSWlYwMFBtYVJhUFVvSzdZZUErSmdYYnVJN01iZkt1eUpjU3dNM05WN0h5?=
 =?utf-8?B?bFpFWEIycnBHTjNwMUpiYXhXRTl6bU9IbDMwSzRXNXErVFJrMk1zdXlvWXRo?=
 =?utf-8?B?THQrL1NzcGMyMWJzWHg5T2c4MDBobWR5cmdJaGhYa2hiczI1VjlsaHpDOEZB?=
 =?utf-8?B?QndBbk9nMFJhVHhmTXMrSkU3cTN5ZEs4MmFWZUk1cS91bUJxUHFKbGR1WWY1?=
 =?utf-8?B?VEpoYUc1dnRlM2F6Z0FkdGNwWVYxQlJBdE5DZWZzbm9wZHJza0toRCtFRjlE?=
 =?utf-8?B?TEV1aFkvM2xLYlFWWlBlVTJyVjZLdm9QZGsvRFdVdlErSUY0VnFjMXlEbVIy?=
 =?utf-8?B?bURQbkdoUU43RXp1Q1FMOTRobVlVQmF3bkI0SjlFdHA0N1lsZTlEa1B0NTZT?=
 =?utf-8?B?ZjZ2elQyS2RVU3hpd1U2QUprL0p3ZWJ0Zk1zZ1ZRUk5Id2MwRWxzUzdFZ3RR?=
 =?utf-8?B?WTNHR0k0cVVJVk5IOXBranV1K004cFByVGJpNHJhaXVJcEhCbytyRGFOcG1J?=
 =?utf-8?B?UmgzRVBjb1pPRnlqa1BrN3UvT0czUDU3OEdXM1JTZ0lUNUdCOEdwaUJwSG9R?=
 =?utf-8?B?dEM0dWJEc1NNZEx2TVlRUkxhVzR5dC9qWmJiVTJHdjRvbGZ1U0d0MU9KZkNT?=
 =?utf-8?B?cU1tbEhUQURzb1FKN0RYTldIM2RvK2tYbUhjdjBFZFA0NGlBajFmZ3Awcitl?=
 =?utf-8?Q?+wVCEk3OuOZ7n2+t2f1cE9DT4?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eee2268d-d9a8-4dac-c742-08de02804f22
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2025 13:25:24.2132 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ok+Pu+2fA1foxkT+P34UK6xntiYRopAcEiyySwBL/jhLp5AjNX0sKgKFK6rFgYpfHhRxt75ecDuWuXu5mXX9Og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB7981
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

--------------2Hfq010CHao0rvJAJbLP3AhP
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 10/2/2025 7:53 AM, Matthew Brost wrote:
> A queue must be in the submission backend's tracking state before the
> LRC is created to avoid a race condition where the LRC's GGTT addresses
> are not properly fixed up during VF post-migration recovery.
>
> Move the queue initialization—which adds the queue to the submission
> backend's tracking state—before LRC creation.
>
> v2:
>   - Wait on VF GGTT fixes before creating LRC (testing)
>
> Signed-off-by: Matthew Brost<matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_exec_queue.c        | 43 +++++++++++++++++------
>   drivers/gpu/drm/xe/xe_execlist.c          |  2 +-
>   drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 39 +++++++++++++++++++-
>   drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |  2 ++
>   drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |  5 +++
>   drivers/gpu/drm/xe/xe_guc_submit.c        |  2 +-
>   drivers/gpu/drm/xe/xe_lrc.h               | 10 ++++++
>   7 files changed, 90 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 81f707d2c388..3db8e64d9d13 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -15,6 +15,7 @@
>   #include "xe_dep_scheduler.h"
>   #include "xe_device.h"
>   #include "xe_gt.h"
> +#include "xe_gt_sriov_vf.h"
>   #include "xe_hw_engine_class_sysfs.h"
>   #include "xe_hw_engine_group.h"
>   #include "xe_hw_fence.h"
> @@ -179,17 +180,32 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q)
>   			flags |= XE_LRC_CREATE_RUNALONE;
>   	}
>   
> +	err = q->ops->init(q);
> +	if (err)
> +		return err;
> +
> +	/*
> +	 * This must occur after q->ops->init to avoid race conditions during VF
> +	 * post-migration recovery, as the fixups for the LRC GGTT addresses
> +	 * depend on the queue being present in the backend tracking structure.
> +	 *
> +	 * In addition to above, we must wait on inflight GGTT changes to
> +	 * avoid writing out stale values here.

This paragraph needs expansion. Maybe:

```

In addition to above, we must wait on inflight GGTT changes to avoid 
writing out stale values here. Such wait provides a solid solution 
(without a race) only if the function can detect migration instantly 
from the moment vCPU resumes execution.

```

> +	 */
> +	xe_gt_sriov_vf_wait_valid_ggtt(q->gt);
>   	for (i = 0; i < q->width; ++i) {
> -		q->lrc[i] = xe_lrc_create(q->hwe, q->vm, SZ_16K, q->msix_vec, flags);
> -		if (IS_ERR(q->lrc[i])) {
> -			err = PTR_ERR(q->lrc[i]);
> +		struct xe_lrc *lrc;
> +
> +		lrc = xe_lrc_create(q->hwe, q->vm, xe_lrc_ring_size(),
> +				    q->msix_vec, flags);

Previous discussion still valid:

---

>> If migration happened at this place, it is still possible to create a
>> context with wrong GGTT references in the one LRC which was already filled
>> but not integrated into the queue yet.
>>
>> I don't think we can avoid races without a lock.
>>
>>-Tomasz

> There might be a small race here, let me think about this. I will say
> this change xe_exec_threads --r threads-many-queues though. Locking is
> definitely not the way solve this though - reclaim rules are in play
> here which make locking difficult and convoluted cross layer locks will
> always get nacked by myself and others.
>
> Matt

Ok, if you can find a lockless solution again, that would be beneficial.

-Tomasz
---

> +		if (IS_ERR(lrc)) {
> +			err = PTR_ERR(lrc);
>   			goto err_lrc;
>   		}
> -	}
>   
> -	err = q->ops->init(q);
> -	if (err)
> -		goto err_lrc;
> +		/* Pairs with READ_ONCE to xe_exec_queue_contexts_hwsp_rebase */
> +		WRITE_ONCE(q->lrc[i], lrc);
> +	}
>   
>   	return 0;
>   
> @@ -1095,9 +1111,16 @@ int xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q, void *scratch)
>   	int err = 0;
>   
>   	for (i = 0; i < q->width; ++i) {
> -		xe_lrc_update_memirq_regs_with_address(q->lrc[i], q->hwe, scratch);
> -		xe_lrc_update_hwctx_regs_with_address(q->lrc[i]);
> -		err = xe_lrc_setup_wa_bb_with_scratch(q->lrc[i], q->hwe, scratch);
> +		struct xe_lrc *lrc;
> +
> +		/* Pairs with WRITE_ONCE in __xe_exec_queue_init  */
> +		lrc = READ_ONCE(q->lrc[i]);
> +		if (!lrc)
> +			continue;
> +
> +		xe_lrc_update_memirq_regs_with_address(lrc, q->hwe, scratch);
> +		xe_lrc_update_hwctx_regs_with_address(lrc);
> +		err = xe_lrc_setup_wa_bb_with_scratch(lrc, q->hwe, scratch);
>   		if (err)
>   			break;
>   	}
> diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
> index f83d421ac9d3..769d05517f93 100644
> --- a/drivers/gpu/drm/xe/xe_execlist.c
> +++ b/drivers/gpu/drm/xe/xe_execlist.c
> @@ -339,7 +339,7 @@ static int execlist_exec_queue_init(struct xe_exec_queue *q)
>   	const struct drm_sched_init_args args = {
>   		.ops = &drm_sched_ops,
>   		.num_rqs = 1,
> -		.credit_limit = q->lrc[0]->ring.size / MAX_JOB_SIZE_BYTES,
> +		.credit_limit = xe_lrc_ring_size() / MAX_JOB_SIZE_BYTES,
>   		.hang_limit = XE_SCHED_HANG_LIMIT,
>   		.timeout = XE_SCHED_JOB_TIMEOUT,
>   		.name = q->hwe->name,
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index e1af5f9084ea..49b68a4a1f2b 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -480,6 +480,11 @@ static int vf_get_ggtt_info(struct xe_gt *gt, bool recovery)
>   				 shift, config->ggtt_base);
>   		xe_tile_sriov_vf_fixup_ggtt_nodes(gt_to_tile(gt), shift);
>   	}
> +
> +	WRITE_ONCE(gt->sriov.vf.migration.ggtt_need_fixes, false);
> +	smp_wmb();	/* Ensure above write visible before wake */
> +	wake_up_all(&gt->sriov.vf.migration.wq);
> +
>   out:
>   	mutex_unlock(&ggtt->lock);
>   	return err;
> @@ -743,7 +748,8 @@ static void vf_start_migration_recovery(struct xe_gt *gt)
>   	    !gt->sriov.vf.migration.recovery_teardown) {
>   		gt->sriov.vf.migration.recovery_queued = true;
>   		WRITE_ONCE(gt->sriov.vf.migration.recovery_inprogress, true);
> -		smp_wmb();	/* Ensure above write visable before wake */
> +		WRITE_ONCE(gt->sriov.vf.migration.ggtt_need_fixes, true);
> +		smp_wmb();	/* Ensure above writes visable before wake */
>   
>   		wake_up_all(&gt->uc.guc.ct.wq);
>   
> @@ -1262,6 +1268,7 @@ int xe_gt_sriov_vf_init_early(struct xe_gt *gt)
>   	gt->sriov.vf.migration.scratch = buf;
>   	spin_lock_init(&gt->sriov.vf.migration.lock);
>   	INIT_WORK(&gt->sriov.vf.migration.worker, migration_worker_func);
> +	init_waitqueue_head(&gt->sriov.vf.migration.wq);
>   
>   	return 0;
>   }
> @@ -1305,3 +1312,33 @@ bool xe_gt_sriov_vf_recovery_inprogress(struct xe_gt *gt)
>   
>   	return READ_ONCE(gt->sriov.vf.migration.recovery_inprogress);
>   }
> +
> +static bool vf_valid_ggtt(struct xe_gt *gt)
> +{
> +	struct xe_memirq *memirq = &gt_to_tile(gt)->memirq;
> +
> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> +
> +	if (xe_memirq_sw_int_0_irq_pending(memirq, &gt->uc.guc) ||
> +	    READ_ONCE(gt->sriov.vf.migration.ggtt_need_fixes))
> +		return false;
> +
> +	return true;
> +}
> +
> +/**
> + * xe_gt_sriov_vf_wait_valid_ggtt() - VF wait for valid GGTT addresses
> + * @gt: the &xe_gt
> + */
> +void xe_gt_sriov_vf_wait_valid_ggtt(struct xe_gt *gt)
> +{
> +	int ret;
> +
> +	if (!IS_SRIOV_VF(gt_to_xe(gt)))
> +		return;
> +
> +	ret = wait_event_interruptible_timeout(gt->sriov.vf.migration.wq,
> +					       vf_valid_ggtt(gt),
> +					       HZ * 5);
> +	XE_WARN_ON(!ret);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> index b125090c9f3d..3b9aaa8d3b85 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> @@ -38,4 +38,6 @@ void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p);
>   void xe_gt_sriov_vf_print_runtime(struct xe_gt *gt, struct drm_printer *p);
>   void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p);
>   
> +void xe_gt_sriov_vf_wait_valid_ggtt(struct xe_gt *gt);
> +
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> index c1bd6fdd9ab1..f0bc45a782a4 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> @@ -8,6 +8,7 @@
>   
>   #include <linux/rwsem.h>
>   #include <linux/types.h>
> +#include <linux/wait.h>
>   #include <linux/workqueue.h>
>   #include "xe_uc_fw_types.h"
>   
> @@ -50,6 +51,8 @@ struct xe_gt_sriov_vf_migration {
>   	struct work_struct worker;
>   	/** @lock: Protects recovery_queued, teardown */
>   	spinlock_t lock;
> +	/** @wq: wait queue for migration fixes */
> +	wait_queue_head_t wq;
>   	/** @scratch: Scratch memory for VF recovery */
>   	void *scratch;
>   	/** @recovery_teardown: VF post migration recovery is being torn down */
> @@ -58,6 +61,8 @@ struct xe_gt_sriov_vf_migration {
>   	bool recovery_queued;
>   	/** @recovery_inprogress: VF post migration recovery in progress */
>   	bool recovery_inprogress;
> +	/** @ggtt_need_fixes: VF GGTT needs fixes */
> +	bool ggtt_need_fixes;
>   };
>   
>   /**
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 497a736c23c3..7fe3fb07e35e 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1943,7 +1943,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>   	timeout = (q->vm && xe_vm_in_lr_mode(q->vm)) ? MAX_SCHEDULE_TIMEOUT :
>   		  msecs_to_jiffies(q->sched_props.job_timeout_ms);
>   	err = xe_sched_init(&ge->sched, &drm_sched_ops, &xe_sched_ops,
> -			    NULL, q->lrc[0]->ring.size / MAX_JOB_SIZE_BYTES, 64,
> +			    NULL, xe_lrc_ring_size() / MAX_JOB_SIZE_BYTES, 64,
>   			    timeout, guc_to_gt(guc)->ordered_wq, NULL,
>   			    q->name, gt_to_xe(q->gt)->drm.dev);
>   	if (err)
> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
> index 188565465779..5fb6c74bdab5 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.h
> +++ b/drivers/gpu/drm/xe/xe_lrc.h
> @@ -74,6 +74,16 @@ static inline void xe_lrc_put(struct xe_lrc *lrc)
>   	kref_put(&lrc->refcount, xe_lrc_destroy);
>   }
>   
> +/**
> + * xe_lrc_ring_size() - Xe LRC ring size
> + *
> + * Return: Size of LRC size
> + */
> +static inline size_t xe_lrc_ring_size(void)
> +{
> +	return SZ_16K;
> +}
> +
>   size_t xe_gt_lrc_size(struct xe_gt *gt, enum xe_engine_class class);
>   u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc);
>   u32 xe_lrc_regs_offset(struct xe_lrc *lrc);
--------------2Hfq010CHao0rvJAJbLP3AhP
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/2/2025 7:53 AM, Matthew Brost
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20251002055402.1865880-28-matthew.brost@intel.com">
      <pre wrap="" class="moz-quote-pre">A queue must be in the submission backend's tracking state before the
LRC is created to avoid a race condition where the LRC's GGTT addresses
are not properly fixed up during VF post-migration recovery.

Move the queue initialization—which adds the queue to the submission
backend's tracking state—before LRC creation.

v2:
 - Wait on VF GGTT fixes before creating LRC (testing)

Signed-off-by: Matthew Brost <a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_exec_queue.c        | 43 +++++++++++++++++------
 drivers/gpu/drm/xe/xe_execlist.c          |  2 +-
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 39 +++++++++++++++++++-
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |  2 ++
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |  5 +++
 drivers/gpu/drm/xe/xe_guc_submit.c        |  2 +-
 drivers/gpu/drm/xe/xe_lrc.h               | 10 ++++++
 7 files changed, 90 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 81f707d2c388..3db8e64d9d13 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -15,6 +15,7 @@
 #include &quot;xe_dep_scheduler.h&quot;
 #include &quot;xe_device.h&quot;
 #include &quot;xe_gt.h&quot;
+#include &quot;xe_gt_sriov_vf.h&quot;
 #include &quot;xe_hw_engine_class_sysfs.h&quot;
 #include &quot;xe_hw_engine_group.h&quot;
 #include &quot;xe_hw_fence.h&quot;
@@ -179,17 +180,32 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q)
 			flags |= XE_LRC_CREATE_RUNALONE;
 	}
 
+	err = q-&gt;ops-&gt;init(q);
+	if (err)
+		return err;
+
+	/*
+	 * This must occur after q-&gt;ops-&gt;init to avoid race conditions during VF
+	 * post-migration recovery, as the fixups for the LRC GGTT addresses
+	 * depend on the queue being present in the backend tracking structure.
+	 *
+	 * In addition to above, we must wait on inflight GGTT changes to
+	 * avoid writing out stale values here.</pre>
    </blockquote>
    <p>This paragraph needs expansion. Maybe:</p>
    <p>```</p>
    <p>In addition to above, we must wait on inflight GGTT changes to
      avoid writing out stale values here. Such wait provides a solid
      solution (without a race) only if the function can detect
      migration instantly from the moment vCPU resumes execution.</p>
    <p>```</p>
    <blockquote type="cite" cite="mid:20251002055402.1865880-28-matthew.brost@intel.com">
      <pre wrap="" class="moz-quote-pre">
+	 */
+	xe_gt_sriov_vf_wait_valid_ggtt(q-&gt;gt);
 	for (i = 0; i &lt; q-&gt;width; ++i) {
-		q-&gt;lrc[i] = xe_lrc_create(q-&gt;hwe, q-&gt;vm, SZ_16K, q-&gt;msix_vec, flags);
-		if (IS_ERR(q-&gt;lrc[i])) {
-			err = PTR_ERR(q-&gt;lrc[i]);
+		struct xe_lrc *lrc;
+
+		lrc = xe_lrc_create(q-&gt;hwe, q-&gt;vm, xe_lrc_ring_size(),
+				    q-&gt;msix_vec, flags);</pre>
    </blockquote>
    <p>Previous discussion still valid:</p>
    <p>---</p>
    <pre class="content"><span class="quote">&gt;&gt; If migration happened at this place, it is still possible to create a</span>
<span class="quote">&gt;&gt; context with wrong GGTT references in the one LRC which was already filled</span>
<span class="quote">&gt;&gt; but not integrated into the queue yet.</span>
<span class="quote">&gt;&gt;</span>
<span class="quote">&gt;&gt; I don't think we can avoid races without a lock.</span>
<span class="quote">&gt;&gt;</span>
<span class="quote">&gt;&gt;</span>-Tomasz

<span class="quote">&gt; There might be a small race here, let me think about this. I will say</span>
<span class="quote">&gt; this change xe_exec_threads --r threads-many-queues though. Locking is</span>
<span class="quote">&gt; definitely not the way solve this though - reclaim rules are in play</span>
<span class="quote">&gt; here which make locking difficult and convoluted cross layer locks will</span>
<span class="quote">&gt; always get nacked by myself and others.</span>
<span class="quote">&gt;</span>
<span class="quote">&gt; Matt</span>
</pre>
    <p></p>
    <pre class="content">
Ok, if you can find a lockless solution again, that would be beneficial.

-Tomasz
<span class="quote">
</span>---</pre>
    <blockquote type="cite" cite="mid:20251002055402.1865880-28-matthew.brost@intel.com">
      <pre wrap="" class="moz-quote-pre">
+		if (IS_ERR(lrc)) {
+			err = PTR_ERR(lrc);
 			goto err_lrc;
 		}
-	}
 
-	err = q-&gt;ops-&gt;init(q);
-	if (err)
-		goto err_lrc;
+		/* Pairs with READ_ONCE to xe_exec_queue_contexts_hwsp_rebase */
+		WRITE_ONCE(q-&gt;lrc[i], lrc);
+	}
 
 	return 0;
 
@@ -1095,9 +1111,16 @@ int xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q, void *scratch)
 	int err = 0;
 
 	for (i = 0; i &lt; q-&gt;width; ++i) {
-		xe_lrc_update_memirq_regs_with_address(q-&gt;lrc[i], q-&gt;hwe, scratch);
-		xe_lrc_update_hwctx_regs_with_address(q-&gt;lrc[i]);
-		err = xe_lrc_setup_wa_bb_with_scratch(q-&gt;lrc[i], q-&gt;hwe, scratch);
+		struct xe_lrc *lrc;
+
+		/* Pairs with WRITE_ONCE in __xe_exec_queue_init  */
+		lrc = READ_ONCE(q-&gt;lrc[i]);
+		if (!lrc)
+			continue;
+
+		xe_lrc_update_memirq_regs_with_address(lrc, q-&gt;hwe, scratch);
+		xe_lrc_update_hwctx_regs_with_address(lrc);
+		err = xe_lrc_setup_wa_bb_with_scratch(lrc, q-&gt;hwe, scratch);
 		if (err)
 			break;
 	}
diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index f83d421ac9d3..769d05517f93 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -339,7 +339,7 @@ static int execlist_exec_queue_init(struct xe_exec_queue *q)
 	const struct drm_sched_init_args args = {
 		.ops = &amp;drm_sched_ops,
 		.num_rqs = 1,
-		.credit_limit = q-&gt;lrc[0]-&gt;ring.size / MAX_JOB_SIZE_BYTES,
+		.credit_limit = xe_lrc_ring_size() / MAX_JOB_SIZE_BYTES,
 		.hang_limit = XE_SCHED_HANG_LIMIT,
 		.timeout = XE_SCHED_JOB_TIMEOUT,
 		.name = q-&gt;hwe-&gt;name,
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index e1af5f9084ea..49b68a4a1f2b 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -480,6 +480,11 @@ static int vf_get_ggtt_info(struct xe_gt *gt, bool recovery)
 				 shift, config-&gt;ggtt_base);
 		xe_tile_sriov_vf_fixup_ggtt_nodes(gt_to_tile(gt), shift);
 	}
+
+	WRITE_ONCE(gt-&gt;sriov.vf.migration.ggtt_need_fixes, false);
+	smp_wmb();	/* Ensure above write visible before wake */
+	wake_up_all(&amp;gt-&gt;sriov.vf.migration.wq);
+
 out:
 	mutex_unlock(&amp;ggtt-&gt;lock);
 	return err;
@@ -743,7 +748,8 @@ static void vf_start_migration_recovery(struct xe_gt *gt)
 	    !gt-&gt;sriov.vf.migration.recovery_teardown) {
 		gt-&gt;sriov.vf.migration.recovery_queued = true;
 		WRITE_ONCE(gt-&gt;sriov.vf.migration.recovery_inprogress, true);
-		smp_wmb();	/* Ensure above write visable before wake */
+		WRITE_ONCE(gt-&gt;sriov.vf.migration.ggtt_need_fixes, true);
+		smp_wmb();	/* Ensure above writes visable before wake */
 
 		wake_up_all(&amp;gt-&gt;uc.guc.ct.wq);
 
@@ -1262,6 +1268,7 @@ int xe_gt_sriov_vf_init_early(struct xe_gt *gt)
 	gt-&gt;sriov.vf.migration.scratch = buf;
 	spin_lock_init(&amp;gt-&gt;sriov.vf.migration.lock);
 	INIT_WORK(&amp;gt-&gt;sriov.vf.migration.worker, migration_worker_func);
+	init_waitqueue_head(&amp;gt-&gt;sriov.vf.migration.wq);
 
 	return 0;
 }
@@ -1305,3 +1312,33 @@ bool xe_gt_sriov_vf_recovery_inprogress(struct xe_gt *gt)
 
 	return READ_ONCE(gt-&gt;sriov.vf.migration.recovery_inprogress);
 }
+
+static bool vf_valid_ggtt(struct xe_gt *gt)
+{
+	struct xe_memirq *memirq = &amp;gt_to_tile(gt)-&gt;memirq;
+
+	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
+
+	if (xe_memirq_sw_int_0_irq_pending(memirq, &amp;gt-&gt;uc.guc) ||
+	    READ_ONCE(gt-&gt;sriov.vf.migration.ggtt_need_fixes))
+		return false;
+
+	return true;
+}
+
+/**
+ * xe_gt_sriov_vf_wait_valid_ggtt() - VF wait for valid GGTT addresses
+ * @gt: the &amp;xe_gt
+ */
+void xe_gt_sriov_vf_wait_valid_ggtt(struct xe_gt *gt)
+{
+	int ret;
+
+	if (!IS_SRIOV_VF(gt_to_xe(gt)))
+		return;
+
+	ret = wait_event_interruptible_timeout(gt-&gt;sriov.vf.migration.wq,
+					       vf_valid_ggtt(gt),
+					       HZ * 5);
+	XE_WARN_ON(!ret);
+}
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
index b125090c9f3d..3b9aaa8d3b85 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
@@ -38,4 +38,6 @@ void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p);
 void xe_gt_sriov_vf_print_runtime(struct xe_gt *gt, struct drm_printer *p);
 void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p);
 
+void xe_gt_sriov_vf_wait_valid_ggtt(struct xe_gt *gt);
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
index c1bd6fdd9ab1..f0bc45a782a4 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
@@ -8,6 +8,7 @@
 
 #include &lt;linux/rwsem.h&gt;
 #include &lt;linux/types.h&gt;
+#include &lt;linux/wait.h&gt;
 #include &lt;linux/workqueue.h&gt;
 #include &quot;xe_uc_fw_types.h&quot;
 
@@ -50,6 +51,8 @@ struct xe_gt_sriov_vf_migration {
 	struct work_struct worker;
 	/** @lock: Protects recovery_queued, teardown */
 	spinlock_t lock;
+	/** @wq: wait queue for migration fixes */
+	wait_queue_head_t wq;
 	/** @scratch: Scratch memory for VF recovery */
 	void *scratch;
 	/** @recovery_teardown: VF post migration recovery is being torn down */
@@ -58,6 +61,8 @@ struct xe_gt_sriov_vf_migration {
 	bool recovery_queued;
 	/** @recovery_inprogress: VF post migration recovery in progress */
 	bool recovery_inprogress;
+	/** @ggtt_need_fixes: VF GGTT needs fixes */
+	bool ggtt_need_fixes;
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 497a736c23c3..7fe3fb07e35e 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1943,7 +1943,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 	timeout = (q-&gt;vm &amp;&amp; xe_vm_in_lr_mode(q-&gt;vm)) ? MAX_SCHEDULE_TIMEOUT :
 		  msecs_to_jiffies(q-&gt;sched_props.job_timeout_ms);
 	err = xe_sched_init(&amp;ge-&gt;sched, &amp;drm_sched_ops, &amp;xe_sched_ops,
-			    NULL, q-&gt;lrc[0]-&gt;ring.size / MAX_JOB_SIZE_BYTES, 64,
+			    NULL, xe_lrc_ring_size() / MAX_JOB_SIZE_BYTES, 64,
 			    timeout, guc_to_gt(guc)-&gt;ordered_wq, NULL,
 			    q-&gt;name, gt_to_xe(q-&gt;gt)-&gt;drm.dev);
 	if (err)
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index 188565465779..5fb6c74bdab5 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -74,6 +74,16 @@ static inline void xe_lrc_put(struct xe_lrc *lrc)
 	kref_put(&amp;lrc-&gt;refcount, xe_lrc_destroy);
 }
 
+/**
+ * xe_lrc_ring_size() - Xe LRC ring size
+ *
+ * Return: Size of LRC size
+ */
+static inline size_t xe_lrc_ring_size(void)
+{
+	return SZ_16K;
+}
+
 size_t xe_gt_lrc_size(struct xe_gt *gt, enum xe_engine_class class);
 u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc);
 u32 xe_lrc_regs_offset(struct xe_lrc *lrc);
</pre>
    </blockquote>
  </body>
</html>

--------------2Hfq010CHao0rvJAJbLP3AhP--
