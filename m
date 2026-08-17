Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59568C5DF66
	for <intel-xe@archiver.kernel.org>; Mon, 17 Aug 2026 17:29:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16C9810E8B9;
	Mon, 17 Aug 2026 17:29:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iAiDl1eP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29FB710E8B9
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Aug 2026 17:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786987760; x=1818523760;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dq/SDkqMIDuq4vYJyWxkyQIxfb2xbPogddXtzkSnn3M=;
 b=iAiDl1eP9HUW53iFN6SbkyAl6L264YspAPf9dgQms1HKFww0P5n+MsaY
 XXr53FziBr8gN/3TT35Uas7tPHWw1k1D8kKpjcu0GD1RXuvhDMtvEmOeu
 0EAJz377wlFOQEPqYZXW+NI0vVhIX5vmKWeQOIaGhCEolHjCpoIZUxCex
 gE4DWCRUPP6RZG8JP0iBZZRBVUli03TGSSeA7cRj6Q4TJcOuE+13shROk
 IdnNXiiErXhLOuXj50LfoRWfF3SxJKu47v30BrgQahQ5GGicCtFmEc5SY
 P/xy+fgFIHxPL1I7e4jbE7v9FIeCXKeJDn7MvQWm/eueixhBeFUJiQqb9 g==;
X-CSE-ConnectionGUID: oa5jw995R4KjGQn0RDUyvQ==
X-CSE-MsgGUID: tnFR0boeRcSwxEh6JzIgdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="104853752"
X-IronPort-AV: E=Sophos;i="6.25,229,1779174000"; d="scan'208";a="104853752"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 10:29:20 -0700
X-CSE-ConnectionGUID: 7CPIyzf/SPKxz952IBYCoA==
X-CSE-MsgGUID: s6jE+RZSQO6LBhYMioHv/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,229,1779174000"; d="scan'208";a="260750969"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 10:29:19 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 17 Aug 2026 10:29:19 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 17 Aug 2026 10:29:19 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.30) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 17 Aug 2026 10:29:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WDDZ8mXFVlx+a6Mf6kHJwRj9yRXk+7zKAkOcli9+C4DAcMEAA73EXznoncHlsBh87MynIlVfIDUB7tkxH7Fj/0Ijz3LYEJWq1Iern6Yts20wOkIj+jh4BGaZZgsi2/rcbWNi6mJkoodnDRJd7Zw2cQBqK0SDhZazVbpmULRnUn9lU6AVJ525ivGs+idZrC+/v202ZSgWi8rsRX3qsQBeVw7kbJUQ0c2WwP20pFUwiBCUX7IoyoTOyRRWL07gCQErg4aUFLDaXKk0DdeuqC4yvk/ny7mXfSc0/b3Yj+S8JVJwzASuTsc4Lctkb2Rlbj+UPq0Vsij3KR55UulkgFpPag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9dvBTgbqoXNMuVCb2sANo5LMu5p6+67HMD8tcRP1qe4=;
 b=hPRqBG2KD6Go+l37ale7i5THsLOyr3WLZ22m409Ccq7O1A21ZHuNUlS0OrkikxEqnTgFq3K1Vd0OzRm9hDgmUW78iSBfztjEZQcceoaJZZHo/19NjCNFsW/y8H5gPk7+TtlO7lnLzlx0SXvBB951mpqGhW/GUznKum6i38ONhZnDRBvovSSCUO2K6TUCrO6hfRQh42DkZzH6KqsYpfRfVf5C+PTaHEHY7gdw4joPkEP30nELNhKDe7HItDfMycu5ontuxoKiQ42TW550wL7tHxedhWfgEVvIbVFEHN5NofvB1DigMtW3HyiiG+s8w0XK7DklBbyuNTn8teVoh3pH+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7717.namprd11.prod.outlook.com (2603:10b6:510:2b8::8)
 by PH8PR11MB9606.namprd11.prod.outlook.com (2603:10b6:510:3a0::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 17:29:14 +0000
Received: from PH7PR11MB7717.namprd11.prod.outlook.com
 ([fe80::1405:e848:c9a7:e962]) by PH7PR11MB7717.namprd11.prod.outlook.com
 ([fe80::1405:e848:c9a7:e962%5]) with mapi id 15.21.0315.016; Mon, 17 Aug 2026
 17:29:14 +0000
Message-ID: <7c30d094-2526-432d-92d7-bfe3e0665e7d@intel.com>
Date: Mon, 17 Aug 2026 10:29:13 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Fix race around q->guc->suspend_pending access
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20260813201847.201867-2-jagmeet.randhawa@intel.com>
 <an6QqBsoQ1T43fsy@nvishwa1-desk>
Content-Language: en-US
From: "Randhawa, Jagmeet" <jagmeet.randhawa@intel.com>
In-Reply-To: <an6QqBsoQ1T43fsy@nvishwa1-desk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0101.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::16) To PH7PR11MB7717.namprd11.prod.outlook.com
 (2603:10b6:510:2b8::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7717:EE_|PH8PR11MB9606:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a2f7d31-b529-4085-e63c-08defc850ea3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|18002099003|22082099003|56012099006|6133799003|11063799006|5023799004|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info: dty4qewpHQ9AXzGrAD7CALburUoFg6X0ERgjIcUd1mgvnrVY1GdSKQGYe9G1sj52xC7vKmSnJDNMrPs0OUYMjd/g6mKk6Km1aOwXvN3dNfBfvnUuGokuouKeNcWl3cWCc8gOS4ADmwOH6BxEejiNZ+26f0B0aL0c4Ug73gB7d71KlS6OrnpCuv5ZX7rnnYrv/LcmHqkf/W4yMYSb5NpCOhTlfU37VsDgRsQUNhU5T9dK0rO4WIt4Zwpw4AVd95876mzrAl9+hZfIvngOCvOlrUxy2Wi43JqxIuBcRI0h3mciH4i0cPFOMattl9IXA+eqLW5EMYEamsQcEk0+LWtDqGBG5I0Ms52KPDugCCXeCBiNHtWI60SVLwemQ2GpCt2fPqTKlP/6a6K4kcZYVjx9WOEcumaQ0H92CPt5SYPRDO9Lxs/j1b9FqY+cGch5peyY8Arcm+kuEdAMgNRO3nFVjxdePjqXtblZcEKv2lxs7XC4PtjdwLaa6S9ggeJxECZ8xQ2SvgcIT0p6Dq+0aeyUOXg2EZg82tu5KGBB6RoqkNuwrBzsMZ5nI0kYqail+2NnXmWHdwkP4elxQJyl7yac0+vdMV/lSuZUn1hyIY/7owssA8nTbQ75XGaH5zwOrCzmnUtYD4WwHsOQTSz61B8m4aNFVCtjlDAbdeplSYvS3xk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7717.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(18002099003)(22082099003)(56012099006)(6133799003)(11063799006)(5023799004)(4143699003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aTh6QWNHR3lNNm5ieGwyeno4aEd1MHhncHI4WEhGUm9RVm9NdnVUZEpjRk10?=
 =?utf-8?B?Z2VndWo3M0toSFRLU1ZkR0pWakRmNmRuQmEvSE1aQVNEUlBIREgzZzRNRjdp?=
 =?utf-8?B?bFg2VEw3dCs4VjdGWXRDenBrcWVmVmJLWi9jaFg5T3BxTjY0U0dLcVBaNGgx?=
 =?utf-8?B?OS9VYXUvemZTNnUrTFhpQm1mV1gyQTZoSTlJWVBYSGtCMWRCRjcrRTg3WXU4?=
 =?utf-8?B?Ny91ZzZvendPNXV2STl6Qi9xTkptK2gyVnhzWmxkVGR5UDdJcXV3NXJENitC?=
 =?utf-8?B?b0NVYXhRdjRLcEpEbGVjamtwVVpNRFMrcXh0L3VxdXFEV2pwWHBYbXA3UXQx?=
 =?utf-8?B?di9XdUtOS2l2c1pVeVduV2N1dFNYUDZRWEIyb0Y0WlBWc2VuYi9GTmFpZ1lK?=
 =?utf-8?B?c0k1dUlZNGx3c1JaSkZHUGNwTEdrbEljM0N0dXJHNWZtSzcvY1p5VzBGMHhN?=
 =?utf-8?B?a29aQ3c5bGlybVd5RjFadWFqZlY2ZlVWNGVWVUh2RHVnendFK0tDeUJienh0?=
 =?utf-8?B?QUlUczNUSnphRnR4UXh4M1pEcm5TVUtJM0hHRElwNjRXZ0NrYllLV3BsOTlB?=
 =?utf-8?B?czhQdS9TTjNpVkpST1dSMHZnRVlzZDhaVGpkSmJjREFNcm0rSGRYOERIZ1VT?=
 =?utf-8?B?R204b1c0dGxiTFpTWkZwVTJiS2w4ZXlMenJ0djNsd3BmMEF4OTZFREhIL0JP?=
 =?utf-8?B?YndEZkpyc2hjNk5INk9sa2ZkcmRSck4wUmdlZzBTWExCQW5vM2dVV0lzeTRB?=
 =?utf-8?B?SGJONFdPdG1tYWwvdlpySWFhUFNGMHhkdXQ2dXNSUkVSTmMyV3hZTmdhRitO?=
 =?utf-8?B?NzhyYmlkM1VLaWRBQ2F4Zk9vaHJTVnFXVC8wanRZdkNWRnM3MzFxZ0w5NjNh?=
 =?utf-8?B?NDNKT1MyZ24rS2ptTi8zcSsxMUM4TjJ4cThnU1g5aVIwcFhYQ2ZxN1pYcjMw?=
 =?utf-8?B?Z3czaW1aanBLNGpLRkFpWEgwVmVCZTVrV01Ea284dUFMbGdpU3lHa1I2RVpF?=
 =?utf-8?B?bE9vZEhJenBNVGhxNFZGMXRRVkRXT1lQS0VlTGRtQWR2Y2piR2J0Wk5Hdkox?=
 =?utf-8?B?azQ3ZFdNZ050eHlpc013MHNsZjRQMnlpS0g2OVF0bE1EY0duMnV0UXJVeE82?=
 =?utf-8?B?N2MyVzBXOW93VC9GUXJlVm5yTFNjN0pXZ0hnQzZxMndRd2wwUnBUY2lvYi9M?=
 =?utf-8?B?TGpRamU4TWE1OTZyTS9zQmUzOFJqZGZULytWNE5Qd0lFRVN0K2xWeUVyR09s?=
 =?utf-8?B?SkFTNEZTT1VPNjY1ODZuVWQ1ZUhkaU94S0VkZEsrZ09uV2ZFTjllNEM2YS82?=
 =?utf-8?B?MVRYc1djUy82cE5PQjdlZjZ6cUoxNzQ4d0hBK3hveHY2NXFvL3kzT25vUWx4?=
 =?utf-8?B?SmZKc1lNaDNpdXlpcTFnMi9hMzZBaUtoRmhlVVZGVk1TUTJrUU5LanFQa0Vl?=
 =?utf-8?B?VmdKVWxacjYyK2xVdXRSUTlDaGMwSUFoMmJhMGxmSHFZT25ibFkvb1FZbUhV?=
 =?utf-8?B?U0VZQU1FeEIyVUx4THQ1SkpJM1Q0R0lPVWNnd3kxd2tXSWxGV1pYbzVkZ29E?=
 =?utf-8?B?U0RQbENvemozT1BodXUzOXVEb09wYlNPanpVM29MNWZHVXdkT1JXTnBxeHFp?=
 =?utf-8?B?K0xOQ1hwV3k0NzZtNjcrSmdpZnZZTnMyVU0wZ1JOdC9WSGhUWGh4bGdNdU1m?=
 =?utf-8?B?VmsyTW5iWFQzL1BGTzh1WWJMSGNQMVRlVk1RbnlYNTczQkF4SjJHSGlXOG9U?=
 =?utf-8?B?c3JTdjNTZTkxa2Jvb1RrTVNzTHhzVVQzTDdIMDNmb3FibDJmS2hRd000T0kz?=
 =?utf-8?B?VmFaMjhNdzZLMC81b0luSTlyT04yaE02YjBRT1lHU2MvQmEybzJ1VEo3UlJD?=
 =?utf-8?B?b1JzcWpQcndBVFVrT1V4aENVcjRBeERua1lOTzVubWZNcys3cmdaWXNXck4z?=
 =?utf-8?B?NEpNdE90d0NvZFBEejdXbndWREdHbGd0RENuSEYzdmcveElPRkEwd3ZiNnNW?=
 =?utf-8?B?YnZkQTRrUkUwNWxzRE9OSVd3b0hRVTgxTGJTZC9uamk1WUtoZUZNWVBHTGFa?=
 =?utf-8?B?NUJENE9vSDNrakVyMjhMdm82WVR4dENIZmJMcHI0V2ZCanZIYnd6Z1VzQmo2?=
 =?utf-8?B?V0lOYW9iemhlY0EyUXFqbmRibWhWZmRSM0tKYmlhdkRKcW1HZFNsMkZXdmI4?=
 =?utf-8?B?Wis0eC9WVVY5Mm1UTWNsN01kenlKdUdQSFI1UHhOSVdVem1xRS9QUU4xdzdP?=
 =?utf-8?B?eEpPUVM1TUwwUE55bHNrclV2YlZ5ZDUyQk5aTjVrYWtLSk5GbWowRHlxT3lU?=
 =?utf-8?B?Smtya3p4U3hOZ3ZZbk5nTHZaSFNWcFpkc2grM1NrdEdHaEVyVGNEMnlqak1Q?=
 =?utf-8?Q?ZahxDo3oTHq8mxvc=3D?=
X-Exchange-RoutingPolicyChecked: KZym1eiQ7+TNdR3N5UpkLDpQ43naIqJcJDaJUl4adxOYZ7iM2Ywz+ccULhwvySZfWi/Fwrr09UskdPL2vnW5QUdJWQmnDN8wnTsGLvuJT/W/j5T8VwhDLvjtz33zPauPJdXokn7p3JboD1A7/6PcOSX76RFa321Ec9bbb3s4YRh90q+3HaRTEg8vmQ2ejRfI7lO8PIZ/rzLhP81HJ4MMewyMtJVP1yH+16cWBQbTOYCkSrwxceD+Fdh4uIaaqnOynGweWq1yjgLCt09I8lekPzm03EneFoCQr2c82tk9Tg8PrtF7+hEpjf3inekLBJm27DUOo7z3M32x6Cjc8q2v6g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a2f7d31-b529-4085-e63c-08defc850ea3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7717.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 17:29:14.1536 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rKy2zNHssIbvkCVNHmixYMi+R3Pvy8Xl3QjFL+1s2f8eTELG4NQnKa9IG+WlXtUt+VwD0JovDUNN1LCmFfKhXKJQOgtbnUm2kERiu+w/lx8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB9606
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


On 8/13/2026 8:51 PM, Niranjana Vishwanathapura wrote:
> On Fri, Aug 14, 2026 at 04:18:48AM +0800, Jagmeet Randhawa wrote:
>> q->guc->suspend_pending is accessed without any common lock.
>> __suspend_fence_signal(), called from guc_exec_queue_kill() and the
>> suspend-timeout ban path, clears the flag asynchronously. Meanwhile
>> handle_sched_done(), guc_exec_queue_stop() and
>> __guc_exec_queue_process_msg_suspend() check the flag and then call
>> suspend_fence_signal(), which asserts that it is still set.
>>
>> As the check and suspend_fence_signal() are not atomic, the clear can
>> land in between and trip the xe_gt_assert(q->guc->suspend_pending).
>>
>> The flag is already set and read under the per-queue msg_lock
>> (xe_sched_msg_lock()) on the suspend and resume paths. Extend that same
>> lock to the clear paths (kill and ban) and to the three check-then-act
>> sites so the check and the signal are atomic with respect to the clear.
>> In __guc_exec_queue_process_msg_suspend() only the non-sleeping 
>> branch is
>> wrapped, since the other branch waits. In handle_sched_done() the 
>> flag is
>> snapshotted under the lock and deregister_exec_queue() is kept 
>> outside it.
>>
>
> Looks good,
> Though it looks like overloading of sched->msg_lock, it is not because
> guc->suspend_pending is indeed indication of wating for message process
> completion. Perhaps it would be good to update the documentation of
> sched->msg_lock and mention what all it protects (sched->msgs list and
> guc->suspend_pending which indicates suspend message is in fligt).
>
> Niranjana

Thanks Niranjana. Good point, I'll document that msg_lock also covers 
suspend_pending (the in-flight suspend indication), alongside the msgs 
list, and send a v2.

Jagmeet
>
>> Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
>> ---
>> drivers/gpu/drm/xe/xe_guc_submit.c | 29 ++++++++++++++++++++++++-----
>> 1 file changed, 24 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c 
>> b/drivers/gpu/drm/xe/xe_guc_submit.c
>> index 9036f89dff7d..c565c1d32d3a 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> @@ -1928,9 +1928,13 @@ static void 
>> __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg)
>>             set_exec_queue_suspended(q);
>>             disable_scheduling(q, false);
>>         }
>> -    } else if (q->guc->suspend_pending) {
>> -        set_exec_queue_suspended(q);
>> -        suspend_fence_signal(q);
>> +    } else {
>> +        xe_sched_msg_lock(&q->guc->sched);
>> +        if (q->guc->suspend_pending) {
>> +            set_exec_queue_suspended(q);
>> +            suspend_fence_signal(q);
>> +        }
>> +        xe_sched_msg_unlock(&q->guc->sched);
>>     }
>> }
>>
>> @@ -2130,7 +2134,9 @@ static void guc_exec_queue_kill(struct 
>> xe_exec_queue *q)
>> {
>>     trace_xe_exec_queue_kill(q);
>>     set_exec_queue_killed(q);
>> +    xe_sched_msg_lock(&q->guc->sched);
>>     __suspend_fence_signal(q);
>> +    xe_sched_msg_unlock(&q->guc->sched);
>>     xe_guc_exec_queue_trigger_cleanup(q);
>> }
>>
>> @@ -2392,11 +2398,15 @@ static void 
>> guc_exec_queue_suspend_timeout_ban(struct xe_exec_queue *q)
>>      */
>>     if (xe_exec_queue_is_multi_queue(q)) {
>>         set_exec_queue_group_banned(q);
>> +        xe_sched_msg_lock(&q->guc->sched);
>>         __suspend_fence_signal(q);
>> +        xe_sched_msg_unlock(&q->guc->sched);
>>         xe_guc_exec_queue_group_trigger_cleanup(q);
>>     } else {
>>         set_exec_queue_banned(q);
>> +        xe_sched_msg_lock(&q->guc->sched);
>>         __suspend_fence_signal(q);
>> +        xe_sched_msg_unlock(&q->guc->sched);
>>         xe_guc_exec_queue_trigger_cleanup(q);
>>     }
>> }
>> @@ -2614,10 +2624,12 @@ static void guc_exec_queue_stop(struct xe_guc 
>> *guc, struct xe_exec_queue *q)
>>         if (exec_queue_destroyed(q))
>>             do_destroy = true;
>>     }
>> +    xe_sched_msg_lock(sched);
>>     if (q->guc->suspend_pending) {
>>         set_exec_queue_suspended(q);
>>         suspend_fence_signal(q);
>>     }
>> +    xe_sched_msg_unlock(sched);
>>     atomic_and(EXEC_QUEUE_STATE_WEDGED | EXEC_QUEUE_STATE_BANNED |
>>            EXEC_QUEUE_STATE_KILLED | EXEC_QUEUE_STATE_DESTROYED |
>>            EXEC_QUEUE_STATE_SUSPENDED,
>> @@ -3222,13 +3234,20 @@ static void handle_sched_done(struct xe_guc 
>> *guc, struct xe_exec_queue *q,
>>         smp_wmb();
>>         wake_up_all(&guc->ct.wq);
>>     } else {
>> +        bool was_pending;
>> +
>>         xe_gt_assert(guc_to_gt(guc), runnable_state == 0);
>>         xe_gt_assert(guc_to_gt(guc), exec_queue_pending_disable(q));
>>
>> -        if (q->guc->suspend_pending) {
>> +        xe_sched_msg_lock(&q->guc->sched);
>> +        was_pending = q->guc->suspend_pending;
>> +        if (was_pending) {
>>             clear_exec_queue_pending_disable(q);
>>             suspend_fence_signal(q);
>> -        } else {
>> +        }
>> +        xe_sched_msg_unlock(&q->guc->sched);
>> +
>> +        if (!was_pending) {
>>             if (exec_queue_banned(q)) {
>>                 smp_wmb();
>>                 wake_up_all(&guc->ct.wq);
>> -- 
>> 2.53.0
>>
