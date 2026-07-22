Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BF6EC44536
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jul 2026 19:11:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA4D110EE75;
	Wed, 22 Jul 2026 19:11:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V7VXXRrC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41B3710EE75
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Jul 2026 19:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784747494; x=1816283494;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=AfkLaYcLfijetuLMwkwMV4o3+biGSWMRctn5DACXIs4=;
 b=V7VXXRrCYIH6y7hVLG359YTv0wHMLCYGNongCZ3xBL/JVWI6x1bQ3Fnk
 pP+WQFOVsWnHLycxhQfZ07vanuXA84Xx2z7BGncXgnyXqvQbvRjAuiUsA
 rAYedccdKNZ/zMimmdawFxzmBNPr7oS8QWfMGvy2CViSzZroomRXcoE0u
 uz1aEoKaNFlvm+zXYe9HeGEq5MwrpS7cO3DnFPCxGhJjUoRdyaGvYqP1o
 uoOU1Af4yoS/aCdoUj/kFS41WTpiSXRIwDYnWNbCM980JqV6Ejw8KmO60
 ShgonuTLGiha5HzjE63pENELqQyZXR/sis1LbA4tIHtyVI4Msitkcqsfn Q==;
X-CSE-ConnectionGUID: DB9PoohIRLuDBqodtDWb0w==
X-CSE-MsgGUID: CESB3Rq0ScmHOoBgCBGZDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="110937372"
X-IronPort-AV: E=Sophos;i="6.25,179,1779174000"; d="scan'208";a="110937372"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 12:11:33 -0700
X-CSE-ConnectionGUID: g0brXyiKScydBJ+UE1VHWw==
X-CSE-MsgGUID: amgErRwlS8Kq9OBJqSz9gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,179,1779174000"; d="scan'208";a="262499558"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 12:11:32 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 22 Jul 2026 12:11:31 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 22 Jul 2026 12:11:31 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.25) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 22 Jul 2026 12:11:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JNPLk35oyTGjzW4bKxD/1qSHoPanJIe682pTJlwQuc6cdp3gXGAG/hahuUmjWVMQ4aqY9V9WF4y2flwcROgc7xE96RjXHRg2LQoIirwkJwN0uE1gjHKu1MvRR+d3G/nlVFjhJluUJpcUgFgecMy1k9n3IHX8cfuRiMCYiV3kuiGFW2n6Ssk2jQCfxUX1Cgn7vFs4qJPjJgzRfxujSOLkxgzYXGMUtMhauXKNWgLznb8jwYaQ7Z43VtF5lJUbKi3kTxOHXKa3jioEo7Z1PXuXkxWRgYD3ylPnFin8ZTcj7PBp8M/A3T0iozyk4qYuxiJ8z3uG77oCih/9owfxsXPuSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AfkLaYcLfijetuLMwkwMV4o3+biGSWMRctn5DACXIs4=;
 b=P4g8jBiL/Q7ZxWfTfqyf4G7rq5Brd/VTJUtDqVUgvpOyBrbtj5hYt0Q7hfJZj1dSAlBaKXB1NFDFGMVHUPvp99tgxfGW0iTI+nNtQDilaxHAfuM6DM+UgRu9j0VXG20L7m2T6MbEjtY8OvwVBJZVwvemUjrmCSRelKq4xhj/ZyY6vmerczyXyqj0mtbJKsjz/NDqq6TcjBLJHH78mhSZaw5Hkhm8bj2DfP4CmyLJuC3q8lsIQIvyBHP2VaxQaF4m3EyCkv3WnD6dgaKuB0s7X3BjaWV8Qwy64psAAo7izJ8H35kge//siuB31ZYbvmk6ERTk3ICcQL3oS0vMTx4v4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 by DSWPR11MB9953.namprd11.prod.outlook.com (2603:10b6:8:39e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 19:11:30 +0000
Received: from IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203]) by IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203%4]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 19:11:30 +0000
Message-ID: <7367ab63-127e-4926-933f-d529b72d5faf@intel.com>
Date: Wed, 22 Jul 2026 12:11:27 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] drm/xe/guc: Compress GuC log and CTB dump with zstd
To: Zhanjun Dong <zhanjun.dong@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <matthew.brost@intel.com>
References: <20260722180605.2498906-1-zhanjun.dong@intel.com>
 <20260722180605.2498906-3-zhanjun.dong@intel.com>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <20260722180605.2498906-3-zhanjun.dong@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0074.namprd04.prod.outlook.com
 (2603:10b6:303:6b::19) To IA1PR11MB7821.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7821:EE_|DSWPR11MB9953:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cd3d4fb-c7c2-4659-36d0-08dee8250927
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|10067099003|4143699003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: vHnyaoxmxba46Ezl5L3zawc012zmIkLbtXDxePH0EbPt/JSGERT4eS721NXGNTe8gHUbPrligRtSLwiXoe56HstFyEVSUp4WOZyrJRUfH2/9Dnw8QfmT1WV12IPfn2RJEiEeyi+9D1jMLyFZSWmzaijLS+GQGESgC5eGTlQM4uaKd7Q4PH8uX5oDtHMnxGP7MSmZLDPrWKBE0VLksSVhheaHQx3DVS0VlVjSJDxtrdBYWy257jbIc0Cj87EicKPvAv7WjtlHYFTRPBIzlLKxb3eOkCI+8tHEhq5VOLcLBD6WCzKgGJZslmxbYw6SQpwvxo9tL4WYF4XoI7hI7QaNPKhMchLisapBrM/mX4Arj68Rou6FtGqFoaRGLAu6wILZaxKVV8Y4a//Mh51wVBMVm04HvO1dYIVxOzCu+D8fiCqOqnC7xIvo0+6xXx+SB7AlLBCAwD8iA1+cPighcj7GMoI+J6aMv4Ivf+KrWszbioGOczjEh/d7Vj3/P7tVlrBE7Gs8GS1TykWbr1k9Srp/570u5rmgtvptHMFysZSG6G7YTHXonZBxWw52ld+d0HiTmaekoslckFT9eT60cSmzIuKpSnZuSXInL94y+KRYJV1GSLCcrLy5wSMX0Uf7haauft3WoPohX8tcMPJcMUX7yDG3RilIvekwftCbiXXAcVk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UzU2aGswQ29IanpUN21TcG5yY0dCSkcwTm1GcGZkNmgxczYvRW4vZTRTakRC?=
 =?utf-8?B?OUFQd2dEb0hZWXpCRVNYaTVjZVhVZS84aGlIWVF3QUZ2enpKdnhpbHlEbEtG?=
 =?utf-8?B?clV3TkJrQmsySEVXT1RNVWJ6ekw0V200NGN6NE1HV1dzSEg5QjdiMFlnT1JH?=
 =?utf-8?B?VFQwdFRQeW1QOC94LzJPaEcvcEVCNVRySnh2c2k2Z3E1N3FrKzNlN0wvUFB4?=
 =?utf-8?B?d2xxM1FTODIybnhlOU5aTTZLZ01hWW5WS0w2dGY5dTRmRVhlOUFma1h1NFRy?=
 =?utf-8?B?b0ZOSDBZMy80bjBGclhubFl5a3BFZmJnODJWTDVEaFBhZ29Sc3FrZVN4cjVz?=
 =?utf-8?B?akhLd0xGSnhva01rRE5TeGNzWjZ0MkgxY3R3VVZFeEdSUlgzUzE5QnJEczB1?=
 =?utf-8?B?OFo3SWRxY25rbWxpRFlEbWJkclhzb0ZuSXg1b25EajlqaXdHMkxhRGZxVHpU?=
 =?utf-8?B?OXpPa1g4bWovYmMzeXJIeGVyallmRGV6cEF4Y0JQTXgvTnhXSmxpejF4dk5E?=
 =?utf-8?B?OU1HM2llamFKUjlIRGQweWFwaFF6Nk1FUWpUU3U4N2FvQ0kzMWJhYUV0ZkZM?=
 =?utf-8?B?a3FTWlNFQ2pNUXpka1BUcWZSTjk2bWJNeUVPditic3BXYUZXT1FMTEdUS2ZH?=
 =?utf-8?B?elZ3L0VNbjRmWllvYmM3ZWY4WDRXYWF0VUI4K1d3ekMvMldhdE45WlVQQ1dI?=
 =?utf-8?B?VmxNRnpZSnhEQzRmWHpvalpRbGVtcXB1Ymd2WFBTbFZxYzRMVHg2U0pQTmVP?=
 =?utf-8?B?LzRsNjFFeEU4Z0FnN3R3ZzZacXJDWjRqOXR5cnc4SEdsbjllelRzMW1MYVRM?=
 =?utf-8?B?RktJcnVueFV1cml0UmN4TEt5UU42RWZRUmJoa3R5R3lJTi9qTE1KRUVLUGtL?=
 =?utf-8?B?R1JJMU9teGNTS0p2RjFBbDVEaitXbVhwNXRGMVU5R0V5aitubkhHVlo0R0Yv?=
 =?utf-8?B?SlZaS2hzbVlWSmlKWkxkN1ZpVTQ4L3VlR3Y3Z211NGhNa2pEcUgrQmVEZHlU?=
 =?utf-8?B?ZnVDalpad1NRUWlUNzlpdFIrRDlQM0Z4Qk9xdWJ5L2ZENnlhSFBkYklYMXc3?=
 =?utf-8?B?RElNWnQ4eW1mT1AwRzBxV0xNVG5oOENaRW9iaFlPcy9Qb0p3VUpuNVRZMnNT?=
 =?utf-8?B?b0IzRnVEcmJRYkRTYVZNeG9US0pxOCtiTjNweFRPajJXajR3YVhBbmRkblZN?=
 =?utf-8?B?cnBTOHkzc0NYS2F0SlNvL3ZLYnpNYmtmTWxEcUUrRzROQWJrazZEQnJBbDVB?=
 =?utf-8?B?THk1QXQ4dGo5alJvZEhqbnpZODlkbFhscEFvVlZJTUhBU25sM2k0dnVnNHpx?=
 =?utf-8?B?Q0EveFRPWS9jekZZelF5ellDanM4UDVyaVo5d3E4aE9xc2kvU1VTaVlXemo2?=
 =?utf-8?B?a0VVdzcwQmtIaXNZSml6T2czNVFvdDdaUFR6VTBBZGJ3N0F5ME14Y2ZDa3R4?=
 =?utf-8?B?b1NGUmtlODJsRktVMGd4eVVObkVEZEI4OUQ3QnNpNGtEd2FzcFVqQW9xQUI0?=
 =?utf-8?B?KzIvQzdZQWdCTEl5NDFVclV6eGN5aWh5RDZGYlhzRWdScTlKWFN2SkhENHJT?=
 =?utf-8?B?aUI4Yi9FY3VBVTAyYkJQSEk2OGI5eFRscisyNm5DVkRlSHo5NWExMFZoUzN0?=
 =?utf-8?B?NklnZ1lkNEIwK2VQL2tIbjZHQmVOcUJRWklBczBNaTNHUyttZUd2bm1sM3Q3?=
 =?utf-8?B?ZWhBNFR3ZnJiTTYxL1licHlUdHdkQkthajNMMTJrMEJ2Q1Z4SlNiUEMyYncy?=
 =?utf-8?B?MWI3SWw1MmhlNW9QZ3UvT1lLTnFSRkEvaXp6WGdyOXMyQW93L2ZibDcwU3hX?=
 =?utf-8?B?c1dDV1gvUDArSmd4UUpiem83ek93ZHdLYnNFSnVvNEdlNmgyUUo1VEZkRnJt?=
 =?utf-8?B?UWdTYUNSeXpyMXd4emNXT1Y5cVNXUUZGVGhzMENqd1BycW9keXZIRytkTW1T?=
 =?utf-8?B?Y3doVnVPUVRmS1U0dDV3TFhSQnBSUnRXU3pEVVFCeGZpMzV3OU1KVndUVHEw?=
 =?utf-8?B?Y3FmZVpzeldWRTd4NW5BZFRYZkJSRnQ4L0RXakg2ckhoUllLZGN4QXhNQTRR?=
 =?utf-8?B?d2dxUFZKL0h1cFJFdlZwNGg3bHpUM3B1UnNZU09KMEYvMXBQRytkM0VoYmU5?=
 =?utf-8?B?TjY0QTJybGtPb29Id0pLMUcwZHY3OUxvWUVidUFPZUhOOHVjNzl4dzIzbXdJ?=
 =?utf-8?B?K2ViRURWVTM5OEV3dElnNWJVdmFkczliZk5BeEZVdGlZTmNPN1FkREwwOHps?=
 =?utf-8?B?NTV5eGJVTDdtcko5V2E0Kzk0L0ZjVW5ZUmY5Wm94MUUvRC95S3lsUzdkMWZN?=
 =?utf-8?B?OEo5dWV3UHV2VmhEaGJIL3pqcUxKWERreXdLRFJKaUgvcnRUN0J2R0V2VU1F?=
 =?utf-8?Q?Xv+CelqfT+j1o0bo=3D?=
X-Exchange-RoutingPolicyChecked: TeqrkW8ip5/Z5yKrqyQSqVc9CHtbsPUFBTQHS0RJDUg9DZfdffFVq52UY7GzpbnQ5YMoI2StoNtQFbloJH8EE+21rSx7YRR0Lu4UqBQ+DozGcvbS15hglDJSp2OYUv1c4uRYMymlNCR2R4033FHOIUJQxy6+30+ewd1pGX21jw5ieJlq8Cfj4w3LC/pWcBYA8SKONaARaQoqTtWHBX5IbyrRTbbfnucVHaFGSaU8r72+3j5bSlw08Ec+wQSx0En/NWSaYqE7OLgP3JayeCpYlgYQ6dC4x/mVls4brTPLVeR2r3ca/SsSW0za/Me+IB8vczn6OLez2GkUIr7UotRvIQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cd3d4fb-c7c2-4659-36d0-08dee8250927
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 19:11:30.0451 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WdqagXJpOFniuo0+a2Kt+RZ0YJw6Qmjsngk88F3DZu90fLtKH5DMozOkZEMcawy8xazuqnUDWspGBpIuTQ7amW771jzUtKdUcVgk5yoy+5A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR11MB9953
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


Looks good to me.

Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>
