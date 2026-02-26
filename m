Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03048FD8FC0
	for <intel-xe@archiver.kernel.org>; Thu, 26 Feb 2026 15:02:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB6FA10E976;
	Thu, 26 Feb 2026 15:02:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nLNdXjBa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63F1410E05D
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Feb 2026 15:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772118128; x=1803654128;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=NNJ5Zj5V+lqLLF2aXzgDqcJAE+Tb6PUfL4ltajgl/b4=;
 b=nLNdXjBaggKwMRsBnFX+eN3iwE6kWwsk1rNFk+TGxCaMcj38b2MLrtB3
 wBvjTUxqU7iHfALmqtH+2RnnUbvbEVtGlX/VuEgZrpl8S0RaH5GS9KDN1
 b2iZ7x8CzMC7sBk80LfVsZ1hYd+ZuGbP0H8EJAUa7kCGn5DKoOyQKToUt
 eWDsZMA4vzFSHRLMnGQCX3itJrRjx7idXVdBrbT1ZMBkcZ6lV+q5cwGg0
 ebEa0Qlfuw9f/zGnWst12Yl7WB04wYNbDHflvN00gJ4edHkudp37mIG1u
 pRN4xH7rNLgZsBmQJVY2vu9xc3TfLEwGOL2tMZX+gNV97BrcEOFlIM6zg w==;
X-CSE-ConnectionGUID: zK14cMsaTTuCPrCFtDLzaQ==
X-CSE-MsgGUID: Mrx5tJs3T7yw79GJdWcRjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="72391154"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="72391154"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 07:02:08 -0800
X-CSE-ConnectionGUID: UFfvS3qETSGBBic6gYyZ7A==
X-CSE-MsgGUID: XgAzTe9qQ0mGyEHEP8XYqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="216606871"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 07:02:08 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 07:02:07 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 26 Feb 2026 07:02:07 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.42) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 07:02:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T+eotG+2mA8KIn8f+ruaKyKM1fKwDrz5GjThQjPO3ssL/mliHhBmSlfzTJQsR3XHYbT5xUXfZuIQUk/WW26w0mM1MICGatksg48Mhb0eHMF+vrDVnEJAOAbCyPNtuo9xL5xTMXuVDVb0+v0+RREMcwge2aNqM7800V6BmEJRT5EWXOYwLE6ldHLiajHpBGopi6zspeKCqLGJLwO3hoIHpSvifMDwmQfjIbUWAXw97smX2sk6jSiGeGKLbvgQTbt5BwLdFaMWkmLLcBPJPfXnWLnCDnchpSRW1LqJP/nX8UMHNopfrGsYUgzOJXGNQfHeraV3gMmSwELvOfVCysdtrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B3x5OzqLWsoPYmRqGJd0GhupmHYgCRySS5c0L8O1MHI=;
 b=u3LqeBGVz5XawXnTJCa6aoydXJ83+lxKTlDSxgDVHtLHNk318fZIxAEsRbuqPPdmnBMAtkindJ6i26ywl/EGRVbnFnF8JVWwrIa6K1ewt8k7EDcL7TY+8rQuxyKHcPgOc3lgJkj5S+2rzI8Sry5EE/w7akMVE33CUgGo4uYgbdkHrzGQoAqkKIu0hdVZZ+uzpQDi8ctvVyTEU88nwEofDmCBqHAuz+vgt0D3BXQqd+rfvsOxV0hhufBpBzd7cgzEuZ1evF0OeefvSDhNtEUVhgdDr0CLO2VyMiZBwsq2o1hnAAgVMGL6bLXFGvMFHyKRlUVckz4gAPju0NPyK3/xTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by SJ0PR11MB4975.namprd11.prod.outlook.com (2603:10b6:a03:2d0::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Thu, 26 Feb
 2026 15:02:04 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::e0e6:a2f:a53b:4414]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::e0e6:a2f:a53b:4414%4]) with mapi id 15.20.9654.014; Thu, 26 Feb 2026
 15:02:04 +0000
Message-ID: <eb164e1a-ba9c-4578-b831-04af6d2929dc@intel.com>
Date: Thu, 26 Feb 2026 10:02:01 -0500
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_series_star?=
 =?UTF-8?Q?ting_with_=5Bv5=2C1/1=5D_drm/xe/gsc=3A_Fix_GSC_proxy_cleanup_on_e?=
 =?UTF-8?Q?arly_initialization_failure_=28rev3=29?=
To: <intel-xe@lists.freedesktop.org>
References: <20260220225308.101469-1-zhanjun.dong@intel.com>
 <177207562852.289699.5524669195276849770@a3b018990fe9>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <177207562852.289699.5524669195276849770@a3b018990fe9>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR21CA0001.namprd21.prod.outlook.com
 (2603:10b6:a03:114::11) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|SJ0PR11MB4975:EE_
X-MS-Office365-Filtering-Correlation-Id: 96d283cd-d771-45ab-e60a-08de75480063
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|376014|366016|13003099007;
X-Microsoft-Antispam-Message-Info: CG+ts03zUUjBqMjBXqdNT0cWK0FlfdlxInRjtAQGvO4dyhgqyHRDorVcy6T8lP9uE1G5iJRPNnjE8otovsrf6qfAaGk7LDYGj+yaIWYePMEyXEB8eIlRTnE1RT+1pM8kQDP3sGtj3Y38BFxfHX4j2DizP/QhQnWghIeDvZZogWGJkumiU5i3ggt521KGIyAInajOtbWaK+6fkrJDymwsv0W8AqXrzwZeo1NEfujVrqRm9OdfEldD8462epDleTSpstJ/BX+YsyeaHNAnDk5k8jQi1SwmmcyXR2moi/hynzyWmoCzNfJep+kuWs2dTYx8lAPfln/DCBCaQhMAUOEuq1JF0a4KVSWtFXutASt+4BZhUfY6zohLA2y9kaFbQaODV1juwo1ZSzoRh8dHjI8eKDRO6wbDNpC6ifUU3xHK2abH6rmaoy6hNcM/F/QVoHoSOK0wxcNuciHLGOAch5hWqYSyfZz+7oi8fmQEVKOuVS1GUazn4Kb1YIrnsS848neYmoNdO4ni8AC3w06NE72Eq297SC8IZlJwebkMhynMh/7Jp4OdLKkegIyd517iGclUgPzHSY+6gLbxvINZvsR9E0owjlrQukz1HL5ZGxZyVRo+lJewESaMYK8pJQRCrL9nioahOYtLLeyggmfEtxjaB6h2xAtTMMw8V0oLuVlR4Ag=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NDZVSTFpYnUxOTlJc3A4dElaZHhBcTBBcERDS05UUEdGck5pQ1RKMHBpVitq?=
 =?utf-8?B?RTVtZWN0UE15ek9WVStCelVIS3EyMUJFRkc3M3hWWElyZXlKczI2YlVVUnlT?=
 =?utf-8?B?ZUtYRi9abDIydFB0bk9CRHhFdlp5NXNScEJFV1l2S2MvSXdJaWNQc1k1RTdt?=
 =?utf-8?B?a1JlRm5rdlFJbThIS2Npanh1ZnZTRkdJSWxQNSsrdGNwR0lNYkN3KzZ3Nk1J?=
 =?utf-8?B?cVEzYkVkLy9KUlUzL0V1cUNFWk1aQ3pCTnlyU3hrKzJMQ0Ixd1J6UnVZZzB1?=
 =?utf-8?B?QytodmxneGtSclRNRUlHZncxNG5Da2Y2TzBnWHVjNnJyMVB4bCt0TkZwY2Vk?=
 =?utf-8?B?UmZMMXNSTlZwYVVuRnI5VW5TOE9PUEFNRVlpMnlYUDZoQ2xocFpLckt4WDE1?=
 =?utf-8?B?UnJVTXo2ZTRFZDdEd2diTFZ6QXFHYmVhUUR5UVF5YlpRN1V6NjVGMS9SLzJk?=
 =?utf-8?B?OW10SjJKSXkrNk5DYzlZeFNoZVc4RnZGQTFvZ3lidjltVTQxdHBFTTQwNWVU?=
 =?utf-8?B?NHBlSGliSmtFaU9rdFFNdDlXcHU4STBNL0Y5SklwYUVCOWk2cm1QMVF6eWpP?=
 =?utf-8?B?c1Bsd0l6S0hPNEhURHkrL0l3d29zNTJkNzNXeTY0MldJNDExVG5JM0tRRm9t?=
 =?utf-8?B?clAyb3BlTWRNakprWlR4SlhpdnBGZFZqZnlLQWNDVkVhVHZFbEZXYmZlWFlF?=
 =?utf-8?B?b1A0YklBaWRaVnNVQTQ0S2FFTUxrY1BOM1hqTTlEK2RnN3QyVUlFeWFzaHY1?=
 =?utf-8?B?TkR3VlR5aHNqZmVOcHZLMlZhZm1YbzkvUGpwWXl3ekx6NVIvN2d4Mi85bWhy?=
 =?utf-8?B?eUd3Z0lGVFVuOFVDSWNJL2k5aEVmTzNlb3VIaDhwLzFvN2tEL3pKV0Q0eHVJ?=
 =?utf-8?B?eG91aGdERUViTS9oeEg2cHJkOExVd01CRmJ3Q1RldjJWYjBKbWJaOE1rN1cy?=
 =?utf-8?B?bFJWbnF4Uit1UjV0U1lPcVJOaTVLdTlIcjdZdlBZTDNJTXVyQWsxNkxIQkN4?=
 =?utf-8?B?ZzdoZHNFOGd4TTJVN09STkdxQ2lJL2lQOWVIVExFWEZwdWZydzVaalhmT2VU?=
 =?utf-8?B?TVFIeGEyRmxES2FGNzBJVjdHbFlxTTNLeXdOak1rMkNOVmtKT3ZzL3U1Mmhi?=
 =?utf-8?B?eDJWMjRuUEpPdysrVm1NWnZ4ZzVDeGs5NzdnL25nUzdJZ001RE5NK0loRHR3?=
 =?utf-8?B?VVA5YmlHY3NScFdoL3lqNTFQcGFpRnJlWEZ0eFNOR1RaM2cySnFOSUh4SWZu?=
 =?utf-8?B?Rksvb1lZRkhBZzIxWk8yZ0cvTkt5cmo1ZGhPazlmTE5GeDBuVVFGSlhYVEJk?=
 =?utf-8?B?NkhyelNUbEZHKzlyYjdyYTgxNjNlSGhqc0s2elNrZ3RDQm9qOXkrL0VDM3lD?=
 =?utf-8?B?RHZCNTdBMmVxNDdUTGFseHBFdHNjUG9vbGo0TnBlQXRJTkhnZ252SVpKVnp3?=
 =?utf-8?B?cVdiUi90VEl4N3FVN29Sd2VsYk1TU2JhbGozY2ZQVFkzQUdERVJrbTkwMFZV?=
 =?utf-8?B?dllpN1IxcVUyNDltdDNYT1JxRDBVWmIzSmVEZXdzSnkybi9WbFVzTGYzakJF?=
 =?utf-8?B?K2I2MWttaUdSak5QQUdITlFXN0hWYUNNSXFXRFAzZnpybXRvRGhwREV2VGpz?=
 =?utf-8?B?RGV5NnphOWE3QmpSMDMwMTNnM3Rub0VjZ0Zheno3WXBMakorR0ZNd0p6RVRF?=
 =?utf-8?B?N1g4QWpHTzhIMm4rR0NqeVRvL1hMWXpxckhFY1FIbTd5SUptdVlmdnpGcExK?=
 =?utf-8?B?YUF2UUIxbjdJeTNUc2toUE0rSVd4c1JIVVFXTkRud0tSV0NsSUdqb1dZN1Ri?=
 =?utf-8?B?STMxeTdvYTV2TnBDSDltTUxQRm5WLzk4ejRIOEFpU0lQeUpHZkh6YklXZzB1?=
 =?utf-8?B?WDc5M2pJQ2xCeGR2R0hXQUtZcjV0c28vdVlwazk1ZHM5NDhUTytkOXFKMWlN?=
 =?utf-8?B?S1JSNXVBQnhPL0dTMDVMWEtPbU5xUXllZGpFN0JwMkI2RERhbDFEQTc5M2ph?=
 =?utf-8?B?Y1VjZjVkdzI0aVN2dHBFaG9CODc0d1poeFpuOEluZ2xWdUZaSkx4T3h2WGJW?=
 =?utf-8?B?bC9yOW9FQWNiOFRKdXlQU1dNRHhhNEJmSmh6Qm5QQzJmVjl0VUdzcVo4YjVK?=
 =?utf-8?B?R1ZlOWhzdGIxeVI2WUdZVDlkcnJMZ2xmRm9zWTBuTWE1VS9LbWJVTEt2aEk3?=
 =?utf-8?B?aXZQYzVvRlBFcFlMNFlCSlltYk05VnVyakU2KzcvUHZsdzNKMkM1VjhQd1Uz?=
 =?utf-8?B?TjdCS3FmUkpUMnUzRXRmT0FMZmRiV0tuaXBlNHpQTnIvWGVCejQzdkhKalhw?=
 =?utf-8?B?R09wYUZ2UEZneDQrSnVsZmIrTjVQWDhEdWNQQktVQW5rZEJnRHUwUT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 96d283cd-d771-45ab-e60a-08de75480063
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 15:02:04.0619 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V3mktVeBnxvwD63CGei3SwYBtvhdD//NbUOATjcFnR1T/bLEYxK+Cyhgtu7zLNfZeFOsmuxqI/FsoUyEG0r25g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4975
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



On 2026-02-25 10:13 p.m., Patchwork wrote:
> *Patch Details*
> *Series:*	series starting with [v5,1/1] drm/xe/gsc: Fix GSC proxy 
> cleanup on early initialization failure (rev3)
> *URL:*	https://patchwork.freedesktop.org/series/161912/ <https:// 
> patchwork.freedesktop.org/series/161912/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v3/ 
> index.html <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v3/ 
> index.html>
> 
> 
>   CI Bug Log - changes from xe-4620-
>   f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440_FULL -> xe-pw-161912v3_FULL
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with xe-pw-161912v3_FULL absolutely need 
> to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-161912v3_FULL, please notify your bug team (I915-ci- 
> infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> 
>     Participating hosts (2 -> 2)
> 
> No changes in participating hosts
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in xe- 
> pw-161912v3_FULL:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   *
> 
>     igt@kms_plane_cursor@primary:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4620-f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440/shard-bmg-6/
>         igt@kms_plane_cursor@primary.html> -> DMESG-FAIL <https://intel-
>         gfx-ci.01.org/tree/intel-xe/xe-pw-161912v3/shard-bmg-2/
>         igt@kms_plane_cursor@primary.html> +1 other test dmesg-fail
This GuC crash is not related to this patch.
>   *
> 
>     igt@xe_exec_balancer@many-virtual-userptr-invalidate-race:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-161912v3/shard-lnl-8/igt@xe_exec_balancer@many-
>         virtual-userptr-invalidate-race.html> +5 other tests skip
> 
This skip is not related to this patch.

Regards,
Zhanjun Dong
> 
>     Known issues
> 
> Here are the changes found in xe-pw-161912v3_FULL that come from known 
> issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   *
> 
>     igt@kms_async_flips@alternate-sync-async-flip@pipe-a-edp-1:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4620-f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440/shard-lnl-5/
>         igt@kms_async_flips@alternate-sync-async-flip@pipe-a-edp-1.html>
>         -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-161912v3/shard-lnl-6/igt@kms_async_flips@alternate-sync-
>         async-flip@pipe-a-edp-1.html> (Intel XE#3718 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3718> / Intel
>         XE#7265 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/7265>) +1 other test fail
>   *
> 
>     igt@kms_big_fb@linear-32bpp-rotate-270:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-161912v3/shard-bmg-1/igt@kms_big_fb@linear-32bpp-
>         rotate-270.html> (Intel XE#2327 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2327>)
>   *
> 
>     igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-161912v3/shard-lnl-5/igt@kms_big_fb@linear-max-
>         hw-stride-32bpp-rotate-180-hflip.html> (Intel XE#7059 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/7059>)
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-161912v3/shard-bmg-1/igt@kms_big_fb@linear-max-
>         hw-stride-32bpp-rotate-180-hflip.html> (Intel XE#7059 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/7059>)
>   *
> 
>     igt@kms_big_fb@x-tiled-16bpp-rotate-270:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-161912v3/shard-lnl-8/igt@kms_big_fb@x-
>         tiled-16bpp-rotate-270.html> (Intel XE#1407 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1407>) +2 other
>         tests skip
>   *
> 
>     igt@kms_big_fb@y-tiled-16bpp-rotate-0:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-161912v3/shard-bmg-6/igt@kms_big_fb@y-
>         tiled-16bpp-rotate-0.html> (Intel XE#1124 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +5 other
>         tests skip
>   *
> 
>     igt@kms_big_fb@y-tiled-addfb-size-overflow:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-161912v3/shard-bmg-3/igt@kms_big_fb@y-tiled-
>         addfb-size-overflow.html> (Intel XE#610 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/610>)
>   *
> 
>     igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-161912v3/shard-lnl-5/igt@kms_big_fb@yf-tiled-max-
>         hw-stride-32bpp-rotate-0-async-flip.html> (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>)
>   *
> 
>     igt@kms_bw@linear-tiling-4-displays-2160x1440p:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-161912v3/shard-lnl-8/igt@kms_bw@linear-tiling-4-
>         displays-2160x1440p.html> (Intel XE#1512 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1512>) +1 other test
>         skip
>   *
> 
>     igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-161912v3/shard-bmg-6/igt@kms_ccs@bad-pixel-
>         format-y-tiled-gen12-rc-ccs-cc.html> (Intel XE#2887 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +4 other
>         tests skip
>   *
> 
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-2:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-161912v3/shard-bmg-3/igt@kms_ccs@crc-primary-
>         rotation-180-4-tiled-lnl-ccs@pipe-c-dp-2.html> (Intel XE#2652
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652>) +8
>         other tests skip
>   *
> 
>     igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-edp-1:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-161912v3/shard-lnl-8/igt@kms_ccs@crc-primary-
>         suspend-4-tiled-bmg-ccs@pipe-a-edp-1.html> (Intel XE#2669
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669> /
>         Intel XE#3433 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3433>) +3 other tests skip
>   *
> 
>     igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-161912v3/shard-lnl-8/igt@kms_ccs@crc-sprite-
>         planes-basic-y-tiled-gen12-rc-ccs-cc.html> (Intel XE#2887
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +3
>         other tests skip
>   *
> 
>     igt@kms_cdclk@mode-transition:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-161912v3/shard-bmg-6/igt@kms_cdclk@mode-
>         transition.html> (Intel XE#2724 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2724>)
>   *
> 
>     igt@kms_chamelium_color@ctm-0-50:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-161912v3/shard-bmg-6/
>         igt@kms_chamelium_color@ctm-0-50.html> (Intel XE#2325 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2325>)
>   *
> 
>     igt@kms_chamelium_color@ctm-red-to-blue:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-161912v3/shard-lnl-8/igt@kms_chamelium_color@ctm-
>         red-to-blue.html> (Intel XE#306 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/306>)
>   *
> 
>     igt@kms_chamelium_edid@dp-edid-resolution-list:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-161912v3/shard-bmg-1/igt@kms_chamelium_edid@dp-
>         edid-resolution-list.html> (Intel XE#2252 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2252>) +4 other
>         tests skip
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-161912v3/shard-lnl-5/igt@kms_chamelium_edid@dp-
>         edid-resolution-list.html> (Intel XE#373 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +2 other tests
>         skip
>   *
> 
>     igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-a-plane-2:
> 
>       o shard-lnl: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-161912v3/shard-lnl-5/
>         igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-a-plane-2.html>
>         (Intel XE#7305 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/7305>) +9 other tests fail
>   *
> 
>     igt@kms_content_protection@content-type-change:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-161912v3/shard-lnl-8/
>         igt@kms_content_protection@content-type-change.html> (Intel
>         XE#3278 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278>)
>   *
> 
>     igt@kms_content_protection@dp-mst-type-1-suspend-resume:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-161912v3/shard-lnl-8/
>         igt@kms_content_protection@dp-mst-type-1-suspend-resume.html>
>         (Intel XE#6974 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/6974>)
>   *
> 
>     igt@kms_cursor_crc@cursor-offscreen-32x32:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-161912v3/shard-bmg-6/igt@kms_cursor_crc@cursor-
>         offscreen-32x32.html> (Intel XE#2320 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2320>) +1 other test
>         skip
>   *
> 
>     igt@kms_cursor_crc@cursor-onscreen-512x512:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-161912v3/shard-lnl-5/igt@kms_cursor_crc@cursor-
>         onscreen-512x512.html> (Intel XE#2321 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2321>)
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-161912v3/shard-bmg-1/igt@kms_cursor_crc@cursor-
>         onscreen-512x512.html> (Intel XE#2321 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2321>) +1 other test
>         skip
>   *
> 
>     igt@kms_cursor_crc@cursor-rapid-movement-32x10:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-161912v3/shard-lnl-5/igt@kms_cursor_crc@cursor-
>         rapid-movement-32x10.html> (Intel XE#1424 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1424>) +1 other test
>         skip
>   *
> 
>     igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-161912v3/shard-lnl-5/
>         igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-
>         varying-size.html> (Intel XE#309 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/309>)
>   *
> 
>     igt@kms_dsc@dsc-fractional-bpp:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-161912v3/shard-bmg-3/igt@kms_dsc@dsc-fractional-
>         bpp.html> (Intel XE#2244 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2244>) +1 other test skip
>   *
> 
>     igt@kms_dsc@dsc-with-bpc:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-161912v3/shard-lnl-5/igt@kms_dsc@dsc-with-
>         bpc.html> (Intel XE#2244 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2244>)
>   *
> 
>     igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-161912v3/shard-bmg-6/igt@kms_fbc_dirty_rect@fbc-
>         dirty-rectangle-dirtyfb-tests.html> (Intel XE#4422 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4422>)
>   *
> 
>     igt@kms_flip@2x-flip-vs-modeset-vs-hang:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-161912v3/shard-lnl-8/igt@kms_flip@2x-flip-vs-
>         modeset-vs-hang.html> (Intel XE#1421 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1421>) +1 other test
>         skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-161912v3/shard-lnl-5/
>         igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-
>         downscaling.html> (Intel XE#7178 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/7178>) +1 other test
>         skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-161912v3/shard-bmg-6/
>         igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-
>         upscaling.html> (Intel XE#7178 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/7178>) +2 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-shrfb-draw-blt:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-161912v3/shard-lnl-8/
>         igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-shrfb-draw-
>         blt.html> (Intel XE#6312 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/6312>) +1 other test skip
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-161912v3/shard-lnl-8/
>         igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-
>         mmap-wc.html> (Intel XE#6312 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/6312> / Intel XE#651 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +2 other tests
>         skip
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-161912v3/shard-bmg-1/
>         igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-
>         blt.html> (Intel XE#2311 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2311>) +9 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-161912v3/shard-bmg-1/
>         igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-
>         render.html> (Intel XE#4141 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/4141>) +5 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-tiling-y:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-161912v3/shard-bmg-6/
>         igt@kms_frontbuffer_tracking@fbc-tiling-y.html> (Intel XE#2352
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-161912v3/shard-bmg-6/
>         igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-
>         blt.html> (Intel XE#2313 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2313>) +8 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-onoff:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-161912v3/shard-lnl-5/
>         igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-
>         onoff.html> (Intel XE#656 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/656>) +6 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-mmap-wc:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-161912v3/shard-bmg-7/
>         igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-mmap-
>         wc.html> (Intel XE#7061 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/7061>)
>   *
> 
>     igt@kms_hdr@brightness-with-hdr:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-161912v3/shard-lnl-5/igt@kms_hdr@brightness-with-
>         hdr.html> (Intel XE#3374 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/3374> / Intel XE#3544 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3544>)
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-161912v3/shard-bmg-1/igt@kms_hdr@brightness-with-
>         hdr.html> (Intel XE#3374 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/3374> / Intel XE#3544 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3544>)
>   *
> 
>     igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-161912v3/shard-lnl-8/igt@kms_joiner@switch-
>         modeset-ultra-joiner-big-joiner.html> (Intel XE#7173 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/7173> / Intel
>         XE#7294 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7294>)
>   *
> 
>     igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-161912v3/shard-lnl-5/igt@kms_plane@pixel-
>         format-4-tiled-dg2-rc-ccs-cc-modifier.html> (Intel XE#7283
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283>)
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-161912v3/shard-bmg-1/igt@kms_plane@pixel-
>         format-4-tiled-dg2-rc-ccs-cc-modifier.html> (Intel XE#7283
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283>) +1
>         other test skip
>   *
> 
>     igt@kms_plane_lowres@tiling-yf:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-161912v3/shard-bmg-6/igt@kms_plane_lowres@tiling-
>         yf.html> (Intel XE#2393 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2393>)
>   *
> 
>     igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-
>     factor-0-75@pipe-b:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-161912v3/shard-bmg-3/
>         igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-
>         factor-0-75@pipe-b.html> (Intel XE#2763 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2763> / Intel
>         XE#6886 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/6886>) +4 other tests skip
>   *
> 
>     igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-161912v3/shard-lnl-8/igt@kms_psr2_sf@fbc-pr-
>         cursor-plane-move-continuous-exceed-fully-sf.html> (Intel
>         XE#1406 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1406> / Intel XE#2893 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2893>)
>   *
> 
>     igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-161912v3/shard-bmg-1/igt@kms_psr2_sf@psr2-
>         overlay-plane-move-continuous-exceed-fully-sf.html> (Intel
>         XE#1406 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1406> / Intel XE#1489 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1489>) +2 other tests skip
>   *
> 
>     igt@kms_psr@fbc-pr-sprite-plane-move:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-161912v3/shard-lnl-8/igt@kms_psr@fbc-pr-sprite-
>         plane-move.html> (Intel XE#1406 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1406>) +1 other test skip
>   *
> 
>     igt@kms_psr@pr-sprite-plane-onoff:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-161912v3/shard-bmg-1/igt@kms_psr@pr-sprite-plane-
>         onoff.html> (Intel XE#1406 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1406> / Intel XE#2234 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2234> / Intel
>         XE#2850 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2850>) +4 other tests skip
>   *
> 
>     igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4620-f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440/shard-bmg-6/
>         igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html> ->
>         ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v3/
>         shard-bmg-2/igt@kms_rotation_crc@primary-4-tiled-reflect-
>         x-180.html> (Intel XE#5545 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/5545> / Intel XE#6652 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/6652>)
>   *
> 
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-161912v3/shard-lnl-8/
>         igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html> (Intel
>         XE#1127 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127>)
>   *
> 
>     igt@kms_sharpness_filter@filter-dpms:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-161912v3/shard-bmg-3/
>         igt@kms_sharpness_filter@filter-dpms.html> (Intel XE#6503
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503>) +1
>         other test skip
>   *
> 
>     igt@xe_eudebug@basic-vm-access-faultable:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-161912v3/shard-bmg-6/igt@xe_eudebug@basic-vm-
>         access-faultable.html> (Intel XE#4837 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4837>) +1 other test
>         skip
>   *
> 
>     igt@xe_eudebug_online@interrupt-all-set-breakpoint:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-161912v3/shard-bmg-6/
>         igt@xe_eudebug_online@interrupt-all-set-breakpoint.html> (Intel
>         XE#4837 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4837> / Intel XE#6665 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/6665>) +1 other test skip
>   *
> 
>     igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-sram:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-161912v3/shard-lnl-8/
>         igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-
>         sram.html> (Intel XE#4837 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/4837> / Intel XE#6665 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/6665>)
>   *
> 
>     igt@xe_evict@evict-beng-cm-threads-small:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-161912v3/shard-lnl-8/igt@xe_evict@evict-beng-cm-
>         threads-small.html> (Intel XE#6540 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/6540> / Intel XE#688
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>)
>   *
> 
>     igt@xe_evict@evict-beng-mixed-many-threads-small:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4620-f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440/shard-bmg-1/
>         igt@xe_evict@evict-beng-mixed-many-threads-small.html> ->
>         INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-161912v3/shard-bmg-8/igt@xe_evict@evict-beng-mixed-many-
>         threads-small.html> (Intel XE#6321 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/6321>)
>   *
> 
>     igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-161912v3/shard-lnl-8/igt@xe_exec_basic@multigpu-
>         many-execqueues-many-vm-null.html> (Intel XE#1392 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1392>) +1 other test
>         skip
>   *
> 
>     igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-161912v3/shard-bmg-7/igt@xe_exec_basic@multigpu-
>         many-execqueues-many-vm-null-defer-bind.html> (Intel XE#2322
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322>) +2
>         other tests skip
>   *
> 
>     igt@xe_exec_fault_mode@many-multi-queue-userptr-rebind-prefetch:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-161912v3/shard-bmg-3/igt@xe_exec_fault_mode@many-
>         multi-queue-userptr-rebind-prefetch.html> (Intel XE#7136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136>) +7
>         other tests skip
>   *
> 
>     igt@xe_exec_fault_mode@twice-multi-queue-userptr-imm:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-161912v3/shard-lnl-8/
>         igt@xe_exec_fault_mode@twice-multi-queue-userptr-imm.html>
>         (Intel XE#7136 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/7136>) +6 other tests skip
>   *
> 
>     igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-161912v3/shard-lnl-5/igt@xe_exec_multi_queue@few-
>         execs-preempt-mode-userptr.html> (Intel XE#6874 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/6874>) +6 other
>         tests skip
>   *
> 
>     igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-161912v3/shard-bmg-3/igt@xe_exec_multi_queue@two-
>         queues-preempt-mode-fault-priority.html> (Intel XE#6874
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874>) +8
>         other tests skip
>   *
> 
>     igt@xe_exec_threads@threads-many-queues:
> 
>       o shard-bmg: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-161912v3/shard-bmg-3/igt@xe_exec_threads@threads-
>         many-queues.html> (Intel XE#7166 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/7166>)
>   *
> 
>     igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-rebind:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-161912v3/shard-bmg-6/igt@xe_exec_threads@threads-
>         multi-queue-cm-fd-userptr-rebind.html> (Intel XE#7138 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/7138>) +3 other
>         tests skip
>   *
> 
>     igt@xe_exec_threads@threads-multi-queue-fd-userptr-invalidate:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-161912v3/shard-lnl-8/igt@xe_exec_threads@threads-
>         multi-queue-fd-userptr-invalidate.html> (Intel XE#7138 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/7138>) +3 other
>         tests skip
>   *
> 
>     igt@xe_multigpu_svm@mgpu-coherency-fail-basic:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-161912v3/shard-lnl-8/igt@xe_multigpu_svm@mgpu-
>         coherency-fail-basic.html> (Intel XE#6964 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/6964>)
>   *
> 
>     igt@xe_multigpu_svm@mgpu-xgpu-access-prefetch:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-161912v3/shard-bmg-3/igt@xe_multigpu_svm@mgpu-
>         xgpu-access-prefetch.html> (Intel XE#6964 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/6964>)
>   *
> 
>     igt@xe_peer2peer@read:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-161912v3/shard-lnl-5/igt@xe_peer2peer@read.html>
>         (Intel XE#1061 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1061> / Intel XE#7326 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/7326>)
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-161912v3/shard-bmg-1/igt@xe_peer2peer@read.html>
>         (Intel XE#2427 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2427> / Intel XE#6953 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/6953> / Intel XE#7326 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/7326>)
>   *
> 
>     igt@xe_pm@s3-mocs:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-161912v3/shard-lnl-5/igt@xe_pm@s3-mocs.html>
>         (Intel XE#584 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/584>)
>   *
> 
>     igt@xe_pm@s4-d3cold-basic-exec:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-161912v3/shard-bmg-6/igt@xe_pm@s4-d3cold-basic-
>         exec.html> (Intel XE#2284 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2284>) +2 other tests skip
>   *
> 
>     igt@xe_pmu@fn-engine-activity-load:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-161912v3/shard-lnl-5/igt@xe_pmu@fn-engine-
>         activity-load.html> (Intel XE#4650 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4650>)
>   *
> 
>     igt@xe_pxp@pxp-optout:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-161912v3/shard-bmg-6/igt@xe_pxp@pxp-optout.html>
>         (Intel XE#4733 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4733>) +1 other test skip
>   *
> 
>     igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-161912v3/shard-lnl-8/
>         igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-
>         numvfs.html> (Intel XE#4130 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/4130>)
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@kms_atomic_transition@plane-all-modeset-transition:
> 
>       o shard-bmg: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4620-f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440/shard-bmg-2/
>         igt@kms_atomic_transition@plane-all-modeset-transition.html>
>         (Intel XE#5545 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/5545>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-161912v3/shard-bmg-6/igt@kms_atomic_transition@plane-
>         all-modeset-transition.html> +1 other test pass
>   *
> 
>     igt@kms_cursor_legacy@flip-vs-cursor-atomic:
> 
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4620-f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440/shard-bmg-1/
>         igt@kms_cursor_legacy@flip-vs-cursor-atomic.html> (Intel XE#7480
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7480>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v3/
>         shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html>
>   *
> 
>     igt@xe_evict@evict-mixed-many-threads-small:
> 
>       o shard-bmg: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-4620-f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440/shard-bmg-3/
>         igt@xe_evict@evict-mixed-many-threads-small.html> (Intel XE#6321
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v3/
>         shard-bmg-4/igt@xe_evict@evict-mixed-many-threads-small.html>
>   *
> 
>     igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4620-f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440/shard-lnl-8/
>         igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-
>         vma.html> (Intel XE#5625 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/5625>) -> PASS <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-161912v3/shard-lnl-7/
>         igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-
>         vma.html>
>   *
> 
>     igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
> 
>       o shard-lnl: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4620-f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440/shard-lnl-8/
>         igt@xe_fault_injection@probe-fail-guc-
>         xe_guc_mmio_send_recv.html> (Intel XE#4757 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4757>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v3/shard-
>         lnl-5/igt@xe_fault_injection@probe-fail-guc-
>         xe_guc_mmio_send_recv.html>
>   *
> 
>     igt@xe_pm@s4-vm-bind-prefetch:
> 
>       o shard-lnl: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-4620-f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440/shard-lnl-2/
>         igt@xe_pm@s4-vm-bind-prefetch.html> -> PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-161912v3/shard-lnl-8/igt@xe_pm@s4-
>         vm-bind-prefetch.html>
> 
> 
>         Warnings
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4620-f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440/shard-bmg-7/
>         igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>
>         (Intel XE#2426 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2426>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-161912v3/shard-bmg-2/igt@kms_tiled_display@basic-test-
>         pattern-with-chamelium.html> (Intel XE#2509 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2509>)
> 
> 
>     Build changes
> 
>   * Linux: xe-4620-f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440 -> xe-
>     pw-161912v3
> 
> IGT_8772: 8772
> xe-4620-f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440: 
> f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440
> xe-pw-161912v3: 161912v3
> 

