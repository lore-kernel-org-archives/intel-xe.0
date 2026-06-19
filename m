Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D33BBCD4F26
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jun 2026 17:55:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FD8010E0E4;
	Fri, 19 Jun 2026 17:55:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="arGiLHn2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03C2B10E0E4
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jun 2026 17:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781891700; x=1813427700;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=6YOQcBDUkUrHzjpwQvTz/NkJJnidJoCFsytkZD2RiME=;
 b=arGiLHn2msZNKlGXarL951PdElhCKnbCk/Fze3R3hn1sObUX03HMkunM
 ntGtT1mLpRKaXlGBSVOt7idiHwfMlMLOiVs3ynwdZpwg7y/mQ/9fKbZw/
 KMHcfBxwejb3N4xKICQEMq2AilB5UjwFdcnXHCgkGpixzVqNUlFNeftiK
 oFDnoq7uuBo27OZ13YxQ6oLJRVFQnoQkMHwckto/0OS/X/bUO6RR9cAAL
 qz7xgg2+XWQlyInv6VzpQKH1xOnJkXm/6CbKhy43JBiP/nENIqSNwSomB
 H+jeczx1tRrGbYXyoDK/aPTMk78uJBXU7alJ8zA9IwWm0ZA7jbx3xMXme A==;
X-CSE-ConnectionGUID: 41Ubb0DET+WahUHfC1QOsA==
X-CSE-MsgGUID: Sc+lSYcRTAmmlBp6gP5Puw==
X-IronPort-AV: E=McAfee;i="6800,10657,11822"; a="82830823"
X-IronPort-AV: E=Sophos;i="6.24,213,1774335600"; d="scan'208";a="82830823"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2026 10:55:00 -0700
X-CSE-ConnectionGUID: l3STGvOwSLCZa5XX6wATIA==
X-CSE-MsgGUID: gLTOE5TQQ52rqEiAYuIOzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,213,1774335600"; d="scan'208";a="244516228"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2026 10:54:59 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 19 Jun 2026 10:54:59 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 19 Jun 2026 10:54:59 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.42)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 19 Jun 2026 10:54:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tzgzzl4UI8O5xITDMzzL57fCxfYAzaaLaVaTT9a5N+xWo7qZxjnw/wHutg5mg2auGxDOWVwX5FtMOwoPMG01B3TZUTux9t9yqsWBGp9vXzHbzLTH/0Ej+PsjoAzCc+SH1ovrXGstZdLVsK0vjRMbDLF1YFtEm8047PJ9cJDX9ijpGS6esykCLvx4O5SjIE7ZZ34cTDvd/+jJi8Ldx68S2KkIl+sFNQqyzMT1JLlb905sK/W4tkhDXkIazYjxzQtXIY0nBC17RiKUntz3Y01BnayQjGX6N0zkjj72Ap+bLDZVgCtCbrJpwAq2JQTTjl+M9MCHX6RWbnha4eZ6CoKyIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/RGPRxotctriwS61Ry8PViU3Nbu6zCeeQUBcpCAeJuM=;
 b=qE7IPfis/nGqL5pzgXgrf86om6mkBtS6NhYhaABgkwqA0NNPURFas9Ww+Fc2ZbGGDwOwWI0cl0Djtlv4bLX9jhcMklDv6htAOygljtEiTEXh/baWgXLnO/VYw2F8lll8ZZYHFnNokSC5v6lY4HjV3JdWI5nrzFwlq+ZVZbyhse9oC7gq5kHHmGYV9D9cLMB8L3EZr1+VeZYeZHd7cz21zWHfAywRus55uixpRHBNpCFWfucZjHcMJQwsVUa8HOJ1C3RktcqWg8DyJmO6b4MnELv6Vj2oFZsLSBxEKWHToS0vy4r4NcTMInvbX+feTTFv+RD3irVUt1Oub6dQypoSIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB6266.namprd11.prod.outlook.com (2603:10b6:208:3e6::12)
 by SA0PR11MB7158.namprd11.prod.outlook.com (2603:10b6:806:24b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.21; Fri, 19 Jun
 2026 17:54:52 +0000
Received: from IA1PR11MB6266.namprd11.prod.outlook.com
 ([fe80::eda2:e570:4314:8720]) by IA1PR11MB6266.namprd11.prod.outlook.com
 ([fe80::eda2:e570:4314:8720%5]) with mapi id 15.21.0113.015; Fri, 19 Jun 2026
 17:54:51 +0000
Message-ID: <26bf8b3d-80b6-4eef-9db9-73f8d81ddeab@intel.com>
Date: Fri, 19 Jun 2026 23:24:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] drm/xe: Add devid and revid to xe_probed_info
To: <intel-xe@lists.freedesktop.org>
References: <20260609-xe-probe-info-v1-0-21e83e188e60@intel.com>
 <20260609-xe-probe-info-v1-3-21e83e188e60@intel.com>
Content-Language: en-US
From: "Bhadane, Dnyaneshwar" <dnyaneshwar.bhadane@intel.com>
In-Reply-To: <20260609-xe-probe-info-v1-3-21e83e188e60@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0086.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ad::12) To IA1PR11MB6266.namprd11.prod.outlook.com
 (2603:10b6:208:3e6::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6266:EE_|SA0PR11MB7158:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fc02d5c-f509-449c-6238-08dece2bdcbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|4143699003|56012099006|22082099003|18002099003|5023799004|11063799006;
X-Microsoft-Antispam-Message-Info: 4+jM125vpRwnuWWwTCozUv2mQ4Mey6MNomLyMs8F3KZtV+vlDIJ3wMd/IlSlMZHCXX6zxXlqKstOZ7BddLVMyTpGip/CQUqH0gQQDkYYluv3tAwZWYCQwr1JB8Ro6WsSWoczvx2ckC+QOMP2TB7LHSye/wpbohf7IgUU/7CTFK63dSUjl18BQRuhyIWM7F+Z2G/aA24ijtUQanEf7LxPnFJvXOMJtH2ALaPutoBdXSCwKja8P7QyCsYwsEPpcscD4MeCFUkKpTo6k5QovT23QUOjJaFcr9vjlWy3ZsPADJlMbyAMdJ3CfIiEAd1plFjbAAEn5mjudTikCk55B4+wP50TxAMb3NI0eaumzQCkueBHQeEIcrNpQ2qpDJnrb2J3jfLfsJ7rg7EYoO265SaZM6W4U1L+w8j5M9J7K1EdVxZP77w+J6auVWLliE86S5GLF5FEjlN0z7W7/TJnne7vBzKRwdhxyGG9Rtayn3ymdDfAplF29kGpRJtgj5w5NPGsMlZUV8m3Dzo4te2WbhwWzGBiID2YLxM1I5lwDve2PyMYY+kFQ1/PJ7jRUpVeU9wePywU9PInhherdTsXyTsQPc76ZpEchGxMtGjlcybGIMaxkUqjJBdCE8r0BSrG29fed87UoFaInnqpJvWLVKr5ziAZgc5tvUlQhiTLj87B/kM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6266.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(4143699003)(56012099006)(22082099003)(18002099003)(5023799004)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TzliQXJobk5ZbHpsemhXUUliOHRQZmxVdDU3OE03TzFnS1Myd3d6MExIaGRo?=
 =?utf-8?B?c2pQUlFwZHFFaW44ZXk1MEJrcXJ3aDI5dXB0N21SVjk0LzZ4RkxrSW9WMU5r?=
 =?utf-8?B?NFlOVHNJVkhwTmhkdDhBa2N1MkRpRVlWSTZramNPOU1ZaEV4dE45UWdZN3d4?=
 =?utf-8?B?TzFJZUJ2bUVGVGlwYnJVUFltQ2NhMGFQNjVObEJTUjlhVk5VNlgzTm9Eb3lB?=
 =?utf-8?B?OFR2aDhIc0NBN1lUOG1Ja2wyb2t2OXJ1UER6My95VjJvNEVpWXlmeTFVZkwz?=
 =?utf-8?B?RjZIeUxYdWNTM3lKaW40K2gzM3ZHRFZ1d0NzaGtDUTZNdFM1RGNSeEtLWUN6?=
 =?utf-8?B?OUIzcld2UUxaWTZoWG5rWTBRNEJlUE1SdUttcHZBVXVaWllvbkRHWXU4YjV4?=
 =?utf-8?B?VW52cWhQNGhvYVZNOGJMTmJOR2dXSXdEVit2Syt6QXVmQm1vMS80UUhNeXRZ?=
 =?utf-8?B?b1N6cHBQMWZFb0tVd3hSdmlnYnArVWJINHFVcUVjdExhNjJoZlVXMFIwU2FZ?=
 =?utf-8?B?ZEhITWkrVWp6WFhZYXM4bExRQ1ZCY1FsaWpSeU1uRDlCaW4vanMrZm55ZW03?=
 =?utf-8?B?aFpEM3RoRE9iSStmeHVzdzlNeWtjQ1crckJiRU84SVJ0WlhucGRxYmVQSG5v?=
 =?utf-8?B?V3JRVmQwUmxDTDlNSGhqN200RDE0YUFzY3JwaVZsRkdUTUtXbm1QNHRwYTVX?=
 =?utf-8?B?cDBZV1dBUVhwN0h6aGYvb1RRaEpwRU0zQmJqbm11c1VKeW5oVzZhSXByT3lW?=
 =?utf-8?B?bW1wNEIwN1phYm0yNFVEblBEV25wMjZYVk1mRjFwRGRiNmtOdjAvdzZVN0x5?=
 =?utf-8?B?U0RtT1EwS2NhV1B1RTBBVVpabEcrVlg0ZW5BMUhoYjA2enZaSi9EVDgzMHVu?=
 =?utf-8?B?a1M5VG5kRlMydVZxNnc4WHdSV1FMbGZNcThLRDJGOFMybjc3M2RDakk5VzRm?=
 =?utf-8?B?bTlvNHlsQVZob2RPUkJIdVY5c0NIa3RUQVpWN21ETmZub0VPR2cwSUxwQzN0?=
 =?utf-8?B?QWZqSVBxSW54MjlPbzUzWlh0RTZMUkRqcUVUMURHTkZBRFV3eExZOGN3WkxZ?=
 =?utf-8?B?OXlDVGZ0MWVOajFiMWErYTFWeHlCU0xVMWovaDBlZmliZytsT2c4TkIvY1hh?=
 =?utf-8?B?RjlaVDRESk01TGJIRGZJbnk2TCtjTGE5NWhoNFgzdXNtd0lXalVscnpjVGNa?=
 =?utf-8?B?KytGNXVITXRIUi9wWmsweXhRUmpVTjJOTHd2Y3J4YTl2aUZKdUlOM1dSWmQx?=
 =?utf-8?B?akhnS2lVM1JOY3hmenlkYnJmYW42cC93dzllQXBxVzVxRTZZTGtYRUdLTGpK?=
 =?utf-8?B?YmZ1UGZnRVYvOWVRK1Z3R2xzWUZ1YWQzOGpKcDhtRk1NTmVKemhidTZIZm9i?=
 =?utf-8?B?RmhHczI0TkVwUUw5R3V5Q0w5YUxJSk1Ra2ZHa3VNTk1uVG1nTXJINS9ib0xk?=
 =?utf-8?B?dTlrY1BZNVVWUXE3RTRadlRUTXBqMTdKWWlYS3NjWU5EeENnL3dUVjU5cXgv?=
 =?utf-8?B?Sjh3eS9aWEE1KzhSclVwZjNNYWVJRGJQQjFuRWp0NTJsTFZlTFFRbktCeEZI?=
 =?utf-8?B?azRoYm5jWURnY1Y2a1N5U05SdHJ1eVp1R0RDd2duVDFIU2dNS0FXZjUvc2hR?=
 =?utf-8?B?dXROWnNxdHV1L0xOMjB4NDk1dFZiNHFrV1g5U1lNQWJFcHVDUDNsRmE3ZHpS?=
 =?utf-8?B?QU9HS1I2bjlFTEtKN0toMjZiYmFOMEpVMTFBMmhmNTNMMWZTcS9ZbnZ0UHdP?=
 =?utf-8?B?UVBVanArSjFsb0J5K29xb200TFlJeVJXQTd6bFNtb1p0RUsvK3NhY0hzVjgr?=
 =?utf-8?B?cmJ0dDlka1l0UjBmUG5VeVBRaE5ETzNBSGZWaUpLdE9kZEx4T2hjcVdkZVdn?=
 =?utf-8?B?MjdpVVBxNEJ3UWUvYytzRnV2Z2F5MDdYU2NkZ25MeVo4Njd2WFZuVXhNTFFq?=
 =?utf-8?B?UGFyNGJWQXBDQW5YTm5MZGN0b3JiNk82YXBnZ0tkSDhkUWlWWGV3L2drNC9Z?=
 =?utf-8?B?ZHJMZnJkSzkzT09GOTRuL0xJT29vRUUrMDg5aHR6MFlsUkl0Wk8rTjZpblRp?=
 =?utf-8?B?NWIrcUU4SFBxdytmRmV3WG5zTkVFN293NStBRjRyUnpqSjhwaG9DRHdGMjlp?=
 =?utf-8?B?MjBPSm84TDZYeDQ4bmx6Tk10SEZYUmU4bDlGUzFKUnRSK1plNmtLaEVacGVB?=
 =?utf-8?B?anB3cGdDNTJsTWJFMzFQYnhLZ2krNE8vanFOcnpkTmd3VHd6R3hCRlJ2Y3B6?=
 =?utf-8?B?MlJLcEx0RE5KTGxSRE00bVM1aTAvdk5sM0RqbFBvaTZkZnhjUmtmSGUxdUo4?=
 =?utf-8?B?UnJjQ1p3QU1STWpya3NHMjl1L0RNamVDRU11QmZiN1h3NlA4a1FQdjJwYjhY?=
 =?utf-8?Q?Z1JYalDTndcY9S2U=3D?=
X-Exchange-RoutingPolicyChecked: WJ59VTeh++cOyz5vsOSwetHo6l+oOCYwdDtONAbq4cWu/ULxP89nHli1b6zu2w+Zpbm7QJYF+6M6KGx+1eMXjMbF9NNKXR7fM9GYpgrLF0tur2YyWSELMVtixNMqGBEdAX5089EDIUtfeOheXCNrxZmHFYk3IvnFjY67KUKC5qv0z8PYNHBBK1F5R1ezXC6w4Q52PcyCkys/kv3AXF46oR2iASJrLmn28Qi42dnsU+iK3y3Wji4HqxllNE3+CkhXpiM2VxqyEbSk8XWkmLtSuVZRUty6hCkCadUdEivv/DaBkZ39HC83RncE5yRYj9DkYuxMc/9UC7E0sYSuMXIm2w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fc02d5c-f509-449c-6238-08dece2bdcbb
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6266.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 17:54:51.8658 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 74AjN+I6EYDRAOlhyWHozI8kZn6rXF/LPQpm3CNPyzQEnGcg1LOd6mvA2FZhEsqAFEdggzbINJM4oHbsrWyIwZ8RqvdygMst/6kGHyi8OJI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB7158
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



On 10-Jun-26 1:47 AM, Gustavo Sousa wrote:
> The PCI devid and revid fields are info that we probe from the
> hardware (indirectly via the PCI subsystem).  Add them to
                                               ^^extra space.
it could be taken care of at the time of merge.

> xe_probed_info and set them via xe_probe_info_early(), since the
> respective fields in xe->info are updated in xe_info_init_early().
> 
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
LGTM,
Reviewed-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>

Dnyaneshwar,

> ---
>   drivers/gpu/drm/xe/tests/xe_pci.c |  6 ------
>   drivers/gpu/drm/xe/xe_pci.c       | 23 ++++++++++-------------
>   2 files changed, 10 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
> index 51d032a9e01a..1baf3cd0d381 100644
> --- a/drivers/gpu/drm/xe/tests/xe_pci.c
> +++ b/drivers/gpu/drm/xe/tests/xe_pci.c
> @@ -311,11 +311,6 @@ const void *xe_pci_id_gen_param(struct kunit *test, const void *prev, char *desc
>   }
>   EXPORT_SYMBOL_IF_KUNIT(xe_pci_id_gen_param);
>   
> -static void fake_init_devid(struct xe_device *xe)
> -{
> -	/* Nothing to do, just keep zero. */
> -}
> -
>   static int fake_read_gmdid(struct xe_device *xe, enum xe_gmdid_type type,
>   			   u32 *ver, u32 *revid)
>   {
> @@ -382,7 +377,6 @@ int xe_pci_fake_device_init(struct xe_device *xe)
>   	xe->sriov.__mode = data && data->sriov_mode ?
>   			   data->sriov_mode : XE_SRIOV_MODE_NONE;
>   
> -	kunit_activate_static_stub(test, init_devid, fake_init_devid);
>   	kunit_activate_static_stub(test, read_gmdid, fake_read_gmdid);
>   	kunit_activate_static_stub(test, xe_info_probe_tile_count,
>   				   fake_xe_info_probe_tile_count);
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 646e04c6254f..382df59260ae 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -727,18 +727,9 @@ static int handle_gmdid(struct xe_device *xe,
>   	return 0;
>   }
>   
> -static void init_devid(struct xe_device *xe)
> -{
> -	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> -
> -	KUNIT_STATIC_STUB_REDIRECT(init_devid, xe);
> -
> -	xe->info.devid = pdev->device;
> -	xe->info.revid = pdev->revision;
> -}
> -
>   struct xe_probed_info {
> -	/* Nothing for now. */
> +	u16 devid;
> +	u8 revid;
>   };
>   
>   /*
> @@ -747,6 +738,11 @@ struct xe_probed_info {
>   static int xe_probe_info_early(struct xe_device *xe,
>   			       struct xe_probed_info *probed_info)
>   {
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +
> +	probed_info->devid = pdev->device;
> +	probed_info->revid = pdev->revision;
> +
>   	return 0;
>   }
>   
> @@ -761,13 +757,14 @@ static int xe_info_init_early(struct xe_device *xe,
>   {
>   	int err;
>   
> +	xe->info.devid = probed_info->devid;
> +	xe->info.revid = probed_info->revid;
> +
>   	xe->info.platform_name = desc->platform_name;
>   	xe->info.platform = desc->platform;
>   	xe->info.subplatform = subplatform_desc ?
>   		subplatform_desc->subplatform : XE_SUBPLATFORM_NONE;
>   
> -	init_devid(xe);
> -
>   	xe->info.dma_mask_size = desc->dma_mask_size;
>   	xe->info.va_bits = desc->va_bits;
>   	xe->info.vm_max_level = desc->vm_max_level;
> 

