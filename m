Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B2ECC02182
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jan 2025 05:18:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5642B10E2F5;
	Wed, 22 Jan 2025 05:18:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BQuW5gOS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85DA810E1D8
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Jan 2025 05:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737523131; x=1769059131;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=yhu2r9zpBgPASs69Kr/ZBQY9XZ0dO67D9dlOHdj5f5I=;
 b=BQuW5gOSMBr9MOv8cKEcwfyCuUNAA+/uomYY76IefIf1lcHRS/vZwITL
 gezcb6AUK7G82p6e4//a+qTv0lSMekwRCwPjpoUgdlCDUgPj4fleIia2y
 vJ0sUCjN979P3w9fpOgNux3jIqNoKJvF7zOdbJan55RPov5oRxZ3lwonY
 zEk7CUDtIjRNHr+TTnY16bIoYFmmzllrT06yOTnBoIV58jPuUouZ8mM0e
 G3a5MFzMsJnp/uDvn2q0DR24yaByCtax3MbWmbvgxIEhTVByWpr10WKDr
 4Fm5A3scGR9MGN9N6VV6KaBsGc0R1vVvxrgSoMuJgekVxV0C+sa/Lxp5R A==;
X-CSE-ConnectionGUID: Db8Tx87fTumlMuSSnPRVHw==
X-CSE-MsgGUID: vQ7GkleNQTC0+7tdoBE9qQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="48630641"
X-IronPort-AV: E=Sophos;i="6.13,224,1732608000"; d="scan'208";a="48630641"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 21:18:51 -0800
X-CSE-ConnectionGUID: r/AXe9apQRiE4hyIQhMbKg==
X-CSE-MsgGUID: RMeCtUoERY2CFiO/HBPONg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,224,1732608000"; d="scan'208";a="106844746"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Jan 2025 21:18:47 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 21 Jan 2025 21:18:40 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 21 Jan 2025 21:18:40 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 21 Jan 2025 21:18:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XHjk9ctyFMxZctABBt4n3hef1zFmM7kd86QKNsH/Q4eM9GeZS5wOxzOWYZcg6JRd1arky6qzMpxbijwdtncwmnvPqfzN1WvGw+Ce5oP2/UIs4H65W2eQmwh2C2cvrJ+wqbTB6+Hv3RtfzhiBpR5+xcR7cKKR2/Gh952Z8EbmN62Jk9TKKh/yE9UDWoBKOZ3qs38bv0p9aASmPfrebL40VvfpNKl8APPOq1zCDoAzVcP8gaGho/oxE9EdGRAU3YZTxm0cAiOlRWfRafucyMCHJOgtkiKqdCWaf9iR6T8oYsM29IZxBIhA4aGG3PM8RWCP5Gi1pHe248p3WNjOMOMmxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SFZaa3yvj5BY+QsZdnq6ifz1HV3cgkaRHWhzkDr4gpI=;
 b=KQYeaw/kXXJHcj/TPdeOsCDXvpYdwpIUR3IZf/jClAHUQxMB6WQCR+L4RJ+bP6T6HpGFl3josK1T41fTYfUdPjSXHUhyI7ERQaA5HZfJL2tj6pszhWk++AmJkBkQDpoPCeK8s/mFPj2IEHxIbgqNiwpSo+nnQQt9bFPznUrN8QGgzVpIcAE4NOZ98FlelpnNo3tbl18czj9NyrbORPWic5NtmSBXyAIWVxhhAZ9YyiuPFCMbqwNMW3TsgyYWM9twOS2lfZ93yfo4+vXux+MYP9Ln559/dhtlnlIg5lwS1vdUteCjBOW85Lq/ZepJE3H30wLU5dyZUjLo+myHq/7eyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6278.namprd11.prod.outlook.com (2603:10b6:208:3c2::8)
 by SA1PR11MB5876.namprd11.prod.outlook.com (2603:10b6:806:22a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.16; Wed, 22 Jan
 2025 05:18:38 +0000
Received: from MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2]) by MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2%6]) with mapi id 15.20.8377.009; Wed, 22 Jan 2025
 05:18:37 +0000
Date: Tue, 21 Jan 2025 21:18:35 -0800
From: Harish Chegondi <harish.chegondi@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <james.ausmus@intel.com>,
 <felix.j.degrood@intel.com>, <matias.a.cabral@intel.com>,
 <joshua.santosh.ranjan@intel.com>, <shubham.kumar@intel.com>,
 <matthew.d.roper@intel.com>, <matthew.olson@intel.com>,
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH v8 1/7] drm/xe/topology: Add a function to find the index
 of the last enabled DSS in a mask
Message-ID: <Z5B_qxgj-bSkEPPd@intel.com>
References: <cover.1736970203.git.harish.chegondi@intel.com>
 <51aa2badd6fe077dd58184552d6966b94bb4ae4e.1736970203.git.harish.chegondi@intel.com>
 <85ldv9e4ig.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <85ldv9e4ig.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR03CA0306.namprd03.prod.outlook.com
 (2603:10b6:303:dd::11) To MN0PR11MB6278.namprd11.prod.outlook.com
 (2603:10b6:208:3c2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6278:EE_|SA1PR11MB5876:EE_
X-MS-Office365-Filtering-Correlation-Id: df9a07b5-524b-4ab8-1ecb-08dd3aa439d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dDI5OTMyRTQzVUUzdG1MMVlrYjhvR0F1K09HM3cyU3RHSVFRUHFYb2FMQTBB?=
 =?utf-8?B?bHRzREVQZFNLYmprVTduRHk5KzNXWjVJdWJWcVhBbkJnUllmdWNCTFJnZXpG?=
 =?utf-8?B?SjJ6WUhGbW0vU1dSNEQvNU9GM1ZzTE1POWRZczEzSWhrYVRWZkJmUDMxTWRU?=
 =?utf-8?B?aytHSG9iNEZjQTVYazk1NzNJUjB5aXE0YVJLbFJPK25JOWtMQlF6alhTOFFF?=
 =?utf-8?B?Rk9uY0tUdXpoRSt4WGRFVFVZNUxkMkIvVkV0UitDRlQ1QmdXQURIOFlvMjVS?=
 =?utf-8?B?RERQc09kNmRBZENuSUQ3NXE4eWRXSVpmMEUwbzkvQ3VNME1Pd0hCNjhveUU2?=
 =?utf-8?B?bll5bTc5R2c5WTBlSE11eWk1emNucUEvMEhYZU4yUVZqNDNla0VpbkFpQlhJ?=
 =?utf-8?B?NlRBM3JEYXNkZU5EWnZMbWtjOVg5TUhXNWJ4em9zYkVmckpjNW1SUGZQQjhP?=
 =?utf-8?B?czY3alVGWmI5YTlnclIrTjE0WjlSL05ML29wQlo2cWpXNXhIdS83TnFLVmwz?=
 =?utf-8?B?bHVHVE9qTzZrMFdEelBWQVlpZmQxMk1xM0hpNjJ1RmN6bFl5d2JJK3dZYkYx?=
 =?utf-8?B?cm5uUXllOVI1dkJ2VWExNDZ0REk1TFQ1WDA5RWtEZ0VEM2NQanMwZG55NVpS?=
 =?utf-8?B?VTc1eHRSOEFBZE0ySG9aNnA1aWtJSnBtL3BlN09UckZ4dWp0ODRRRFQ1OEF2?=
 =?utf-8?B?UWVIbG1JNk1sYTd6Z01CY0h4QmM3c081d2JmeUxYQVY4WnJ3UVl1elBLaGxE?=
 =?utf-8?B?RzhPcHcwYXFFYjJib2RQZWplUjNMN1NCczgvcVh3RUJnR1RYVC9OeUVtMDVT?=
 =?utf-8?B?NjkxMFU3UGxqOEVZMWNKU1FhaEZSMVh5bzROUHdYQnNSZW4ycC9wcW1TeVlB?=
 =?utf-8?B?T0NCUENKU2UyekI5YnRibitJTWhaQzk4ZnVXVkkzWXVCQ2tNcTFoZS8zRnEw?=
 =?utf-8?B?MXVQQlNPOXMvNGkzd21PMEY5UmxDOENOVFNHd3hIK01vUFR2MmwzOHIwZGJI?=
 =?utf-8?B?NXhUQUZ5NHcySURDeThKWFQ4cm5BMXI1YmhvTDNQVndqNGxKaWxRWmw3eUdh?=
 =?utf-8?B?TEdjUmxmazFPQ1A2WS9KbFFhQ1BaaTVYSStVREVPa1NUenhkYWRrVk9mRWdV?=
 =?utf-8?B?cjUzNmlBeXJta0dXTDZWRytQc0VUNHB6YnZ5UGFNR3ZoczJqZ0t3Z2s1SjRV?=
 =?utf-8?B?b2swd0lqd3V6VE1KUElyQTBLYlYvbzhheVBRcVNPTE1QSHkvZ1VyNGlyU3pq?=
 =?utf-8?B?L0VDV1pFOGhIMUI5QTBhbmhnTzVHUFYzcy80RS83S01wQnBUUE41VUsvckdo?=
 =?utf-8?B?UTR3RkUyWXkzSmVGUnFNY3VMRG9NNmxmTk5kQ3MwMzl1dG1DdjU0R1ljaC9P?=
 =?utf-8?B?Z1NEKys0b1ByQnUzcUlXRzF5b2R1YVRkU2Nzb01iR00vNnlEVmVEK3Nqb3Bt?=
 =?utf-8?B?OXJ4cUM2Y2Zna0NteHltbVR3OUFOSzNhZG5wOStjcFFNYUZvekVIbEZNb2Vn?=
 =?utf-8?B?cXM2STJyUjhCdEZPU1FwYUt0MW03QWdDSy81bkhTelZKc3BUTGxFTDRJVzNH?=
 =?utf-8?B?Sk9FZklvYnoyc2pjclZiZFR0aTRVWTFMaVYyVU5hOHVlNS9qQkpuVVNNYVNy?=
 =?utf-8?B?Q0xmRUZqTi9nUFY5OVlvYzYrbkJQQnlIQ0FLUGloTGYzSklRR1ZMUHVUV3lq?=
 =?utf-8?B?eUI1YytjT0JmT3J1cUdMV28yaFgwTnVGMGFNc2ErSVlqUkFyUVduRXR2VFo3?=
 =?utf-8?Q?1dTC4cpAp6XlwWqKMQz8KB7H8NkR42x3zomhpeZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6278.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MFJYejY3clhjaXlkMGpMeWhkUU91YVBOZTJ3U2FPWE8yN2VhbjZTb1JIYUdS?=
 =?utf-8?B?ZzRoUVR0Nm52MVU5cUtObW1yeEtBTUNNUVM5RUpzQ0V3M2x5aUZ4QjVTTWls?=
 =?utf-8?B?MVk2VEdsaTREUlhOWTByWXJaRDJjNTVFTjc1K0ljWmhIY3BJSllaZkNkcEJq?=
 =?utf-8?B?cU1maFFqVVliSGY1TUZJNkRId1pVSExGMEFKTTBuMC9xUFVHTHFVSXlLSmRY?=
 =?utf-8?B?dW5rWHVNczg2cjVEZ0tuU2RXMVZwaWJ3Q25WdzdETVJDaDBMajdVQ3NQU1lS?=
 =?utf-8?B?RmVJQlBrOGRjc1RkOUI0d25neGVhbUYzWFV3MXZQbmZaYW84bUR0NFpJY1Vl?=
 =?utf-8?B?K1Ezc040eWxOK09PdThHZWVxbnN6aVZWcXE3eDZpK05QckVHNlZSTTZkRUpt?=
 =?utf-8?B?LzhsUTB6Z3kwSC9vWlg0OHpubEFNNkJPenNPeVNoTU1pL3FPb0lrRktoSVRK?=
 =?utf-8?B?Y1Y2RStUN00wYmZ0K2pEbUpaNUVQVjNEZHUxMGFLUWF3RlZQWngrakFTWXds?=
 =?utf-8?B?aHltcVh2YTluRVFGZHpqUSt3VTg1WWRKZU9NYTRBZ0RCZjIyZW5DOCs4YXcv?=
 =?utf-8?B?MG0xVnNkc3hJZ3pBc3l0OG1QSTVnWFVSOVJhYkxCd0xRSy91R2hYdkcxM2lK?=
 =?utf-8?B?MWZ2aWpkNGQ3TXRid2VtSVhBU0E3dTBKTkozSWE5WGFrbzRKaFg0ZnNQTHBU?=
 =?utf-8?B?NkE2Y3QrVnU0M0haSTM5S2xpaGJ0MVB5TVBaaDNwZ0NBWnlxR1lvdWFkb29F?=
 =?utf-8?B?eG9oZG1lRUp2ZXVRdjdlTGl2dWQ5byszcWVETHEwa1lvamZtQ1hJWFBlS1FE?=
 =?utf-8?B?SWpxV2EyM211ZnBNQzdpUTZzUlRIUzhwLzBWdmh2Qk1keGE5dHIzWlRPTmNQ?=
 =?utf-8?B?SmtmZUJjUWk5Tmh3ZmxVeXRsUUl5c1Y0OVhXV1JvQUxUME1tNUE1cVFhcGpo?=
 =?utf-8?B?a3U2dXZNZWFEaFlxblBiUzl1OGVuZHd6K0ZGV29kY3hVUW1pOWxRYVdhR3RE?=
 =?utf-8?B?YmFlajZNL245em1objUxNmdTeWx3WEp5T3BXN1hnaDFHRG9VcVpyZE1jcmNL?=
 =?utf-8?B?ajZWQ1ZzZDI1bHdiOWxmOGhEeWdCZDArNVRPK3hycjFsWjFPUlNIY3hET3dl?=
 =?utf-8?B?V2N0dExtSi80WTE1ZjRDMlpGcWFqK0Y2bitHRk1zc0hEQXFaUkUyd3dHUGh0?=
 =?utf-8?B?Z2QvcThFVkM2VS9xL0xjT3ZkSzRtd2JKQkZLbzArYUJUVWZBa0NFdDB2VFJj?=
 =?utf-8?B?dGtkb3ZrOEJ6V3crTWhoVUV2RlBDT2pnU0s5Y2RCN0JSQUV0YytWZ3FFd3pi?=
 =?utf-8?B?RHVJK0JGNmMxTkRweTlPSWFUT0VwSXQxM2FETnFnekwwbVRtY1Y0REdKSUhG?=
 =?utf-8?B?TXFQc0w0NTcvZ2hwRnFEMUdFTHNUUlBET1VTQ1lIVUVRVzA5L0pqdlZwUldB?=
 =?utf-8?B?V2V4QkpTYy9PeE9VODc1aEZHTmR2dE9ITXhGNkNxcW1OU1E0K003Q0RKU0N1?=
 =?utf-8?B?Ull4M0l5OGZRWkYySktGS1UzVHVPaCs0b0VvbjFZQ3lqaVh5MEQyQXh5dnlm?=
 =?utf-8?B?c2x3UkFDMlZ6YUd4L1lrZllVVDJPNTg2VjZrbE5saVM1dkFaLzdpWDJRZGxa?=
 =?utf-8?B?ci92bEJJVzRKeTJoWmwvMjd5M2ZkOE9YMkpFMDROUStGaEhDSlR5aUowekl6?=
 =?utf-8?B?S1prdFRmYW1aenBCaGIvSDNoNnp4MTJhWENQSzVNUnZDaVppaDlBNEJud0t6?=
 =?utf-8?B?bXg1bVFHaW5wYlBNVUVvVXoxaWtueXdaTnJ0NVJJdEsrS2krd0hSZlg2S0Fm?=
 =?utf-8?B?TVkrN05hSlBOa21XaXNoa0tGc2hDYy8xNDB3VWtiREZiTGQzMHdwNG1Ha1dT?=
 =?utf-8?B?QmI2a1M0NWNRdnMzdTlURW5obGdqYzFpcUVLYjRqYVJuTnR3NmlkOC93TGVl?=
 =?utf-8?B?Nm9nTXRrNTJoWUJmWHVrVzRLOU1SWFpITTVNL2VUZ3RJNEViRS94L1hqYzZE?=
 =?utf-8?B?bFdYcXVjMHp1U0d3WEhmdW5jS2dCT3dIa0ZoY0tOSnlFU0hUaWRzN1Y5dzh2?=
 =?utf-8?B?U0Q1dk5hWS9KUVd1NENuMEdXYzFhYmtHWFZqRG1Dc0dZc3FzOFZpd29vRml1?=
 =?utf-8?B?SmhGY1RnTGVxMFdrMW5uNzRMUDNoemJtZm9aNlh3cThydERCOU5lUDduMjhw?=
 =?utf-8?B?TkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: df9a07b5-524b-4ab8-1ecb-08dd3aa439d9
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6278.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 05:18:37.7987 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WKJoZ2zcBubknACGF27PHmZlJbZvwJCAGfKikyZqhpRNBb+vH2/hbXuTPG7kCoHkbEe4yJ6wiCcocv1BbYt374wngp+w+1FbiSN4GMxum7I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5876
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

On Fri, Jan 17, 2025 at 09:25:59AM -0800, Dixit, Ashutosh wrote:
> On Wed, 15 Jan 2025 12:02:07 -0800, Harish Chegondi wrote:
> >
> > Last enabled DSS in a DSS mask can help estimate the maximum DSSes enabled
> > in the DSS mask, as the enabled DSSes can be discontiguous.
> >
> > Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt_topology.h | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_gt_topology.h b/drivers/gpu/drm/xe/xe_gt_topology.h
> > index 746b325bbf6e..a72d26ba0653 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_topology.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_topology.h
> > @@ -25,6 +25,19 @@ void xe_gt_topology_init(struct xe_gt *gt);
> >
> >  void xe_gt_topology_dump(struct xe_gt *gt, struct drm_printer *p);
> >
> > +/**
> > + * xe_gt_topology_mask_last_dss() - Returns the index of the last DSS in a mask.
> > + * @mask: Input DSS mask
> > + *
> > + * Return: Index of the last DSS in the input DSS mask,
> > + *	   XE_MAX_DSS_FUSE_BITS if DSS mask is empty.
> > + */
> > +static inline unsigned int
> 
> u32?
> 
> > +xe_gt_topology_mask_last_dss(const xe_dss_mask_t mask)
> > +{
> > +	return find_last_bit(mask, XE_MAX_DSS_FUSE_BITS);
> > +}
> > +
> 
> The convention here seems to be to keep function definitions in .c and
> declarations in .h?
Yes, usually. But if it is a single liner, it is okay to put it in the
header file as a static inline as per the review feedback in V4:

https://patchwork.freedesktop.org/patch/619491/?series=139931&rev=1

> 
> >  unsigned int
> >  xe_dss_mask_group_ffs(const xe_dss_mask_t mask, int groupsize, int groupnum);
> >
> > --
> > 2.47.1
> >
