Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BC0ACCF9F8
	for <intel-xe@archiver.kernel.org>; Mon,  3 Nov 2025 22:59:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0854610E4D4;
	Mon,  3 Nov 2025 22:59:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fq2fMqLo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8A3610E4D4
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Nov 2025 22:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762210769; x=1793746769;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=wR1PQv1Hktw/AQXPNCKLclHA+fKkpWyqqiTEe/KKqn4=;
 b=Fq2fMqLorME5sQj1HRg9KrG9l1XrMlB75NosQb8OxZmw7x2nbCjz6cvX
 pp87/LEihnwP8Q5J/MLKYDWo2oGH1f153gf1I23pqgmvaa/Igd9v6yMj7
 wIqsNaOlzvP95l/JczOMQFjrLwAOxL56TXv1dFJcAX6JDDpBXxwEbttyn
 TMr6oPR0IGBjowE/e/k0dj5b5AbV0YNMgRk7YiYFKtANlEhvLwKyIWB3M
 ekVWMKKsolSBrCqqFkUI30uT+KwTRlUT1pM4fey0wrjC47CSmJsp9FYQu
 GcA75Px6fbEkXn6/qHuvUsZbhXm1E+LXFHUqu9k+jW/imN8hc00WRhUG+ g==;
X-CSE-ConnectionGUID: cayHj7BsTSKLulKcIYpZXQ==
X-CSE-MsgGUID: w9ZVUaUwQxaPTWHO0WmJ8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="74589303"
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; d="scan'208";a="74589303"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 14:59:29 -0800
X-CSE-ConnectionGUID: zYSwT5U/TTG5WnOBsQOVTg==
X-CSE-MsgGUID: 4M9D0SyWSTia7cz5FAn/Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; d="scan'208";a="187710896"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 14:59:28 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 14:59:27 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 3 Nov 2025 14:59:27 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.17) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 14:59:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v1rqntswq2yp1TWGa58ssKdMa+V433cylLJI1RsSbltixBGhBh7jcTXwO4hrSc3iotXKy3gfGbyjSo8HWITcW6V+GCxqL2Vp0xgfoC/aZ4F6LnMt08AZNFWerdXgolPgZ9yI3X+C2lco/GRKYO7KDmrjhv4D14XC1YVfb6HlcI+6r8xQP0J53bVy3w0n/aj3XbotLlcTvApYF9pkV+0R6N6+vX6cI2LvFD29+arD4lal6eXUvzsyZLGfSZZkKJ6L99cRidXehTw2R3Nz0MYEYMBQb94slYAzlwomysmVSAk95fzG7D+ariNdrjhYd92sudvQuo194RwJ+QWJwUuuhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QRulHJilIPnbkwNUEPJnpuOIOL8WvEwHc29nNYKDT7A=;
 b=lobXuxUYo7FJk61KrBfwC1TO8Cb2wGTPjCFiL1wf3ZufPDpjar9wP5K+v/8JpGzWwN305m/TAYVmRqzsei/FhOFKptyPFF/nDkT/OxDSouaXvDlcnSTkQjtSZOCNVacwmXgDbeGLbJpoKyKAijsN4QBkKfjOX7/CYTXH6cVQUv33bzIGCuiAMxbyNXHWmRTyOIRtRHX4WAhU4VQXIAATj7BdRXevPp41LN3Urtbb/+RicR6wQTXc1QNgYPkRplDXb7TY4c6Ubu+cGK/2V3kvdN7X9ESDzYlLUN7jxa378L81Wu4mhFJotLLuVyYGZDRdTOfkfpSlD6c6hsyA686Wnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by IA4PR11MB9155.namprd11.prod.outlook.com (2603:10b6:208:569::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Mon, 3 Nov
 2025 22:59:25 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%3]) with mapi id 15.20.9275.015; Mon, 3 Nov 2025
 22:59:25 +0000
Date: Mon, 3 Nov 2025 14:59:23 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 02/16] drm/xe/multi_queue: Add user interface for multi
 queue support
Message-ID: <aQkzy8ffn3QH9czr@nvishwa1-desk>
References: <20251031182936.1882062-1-niranjana.vishwanathapura@intel.com>
 <20251031182936.1882062-3-niranjana.vishwanathapura@intel.com>
 <aQakd8Y53qfxpmvk@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <aQakd8Y53qfxpmvk@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: SJ0PR03CA0161.namprd03.prod.outlook.com
 (2603:10b6:a03:338::16) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|IA4PR11MB9155:EE_
X-MS-Office365-Filtering-Correlation-Id: 5efba284-637e-4c3f-cf01-08de1b2ca2a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8nE5lRKgwGFT/ibKRazgrK4VLVPBoi6OcxAJOav15rTG9hLtzyEjNjDPokeE?=
 =?us-ascii?Q?gdxI6PjXs5G6MzNSwX0BlTmAN6jY/sjCdlHdEqGObnQybRiCIOfavu7hdiQw?=
 =?us-ascii?Q?YOW8KTQB+jwxQ+iQNGh0GAuLWLbAobLjrtHdb/RDypzn6yhyMMAPl2+IH/GC?=
 =?us-ascii?Q?kODB33zNiflX/Vpq1/6hBNwjea2sqzyTOwXn4/GVF4Lo5ZO9HwTLTi5VKDmV?=
 =?us-ascii?Q?FIgkYLrGWNvpunuqhyYFDd8m54rwxNbz2F2F/16ngCNgQbnF1YfOjpDe84+g?=
 =?us-ascii?Q?qCqdWTD489+EncChc4JlaNreSZ/5ipAzhSatUdwo9LkCiDm+BPK31vMvgqQh?=
 =?us-ascii?Q?wM7tGm2jYn6fjux11msACoF3c8/0yoGCmGWjYsLHEyRxNpjSzHvCL/0fHktt?=
 =?us-ascii?Q?6b27tUKzDtfMqtq82igzCoh1/OkSQFymw2MV4+/wwd4iDcKZuJE34a9R04JD?=
 =?us-ascii?Q?JZzB+McbBap+lGtfgdOTlMpUbqamGh5JV0Z8Tbxm9eoffEEZ4RM0S9psqi4/?=
 =?us-ascii?Q?uX/Og+5/yQsx/OnIMfW6XQzQSPJL+Sk4zUIMADUMDOGbEAXEHDZVVrtDWhqF?=
 =?us-ascii?Q?3sCEp9y6vdRXVqYBpkGd/CwGxgAmtWEgFNTwyOP1qI+RbD1Quyd01kgZyGp2?=
 =?us-ascii?Q?SE2LG7gxMkjDRDKadVmlh2NoAH2JzemwlQWwK2O52WsDqjL/kVLr2Ek0Z9PP?=
 =?us-ascii?Q?KKm+MR2XddN7++FIxYB0+qhgqTti0hzo1jgrMxgM/yFIScV34L6YgNeWFYsQ?=
 =?us-ascii?Q?3WdHql+A2mwLAsqivZcfAuCZ7cxzk9elFtM3KRfgoG2Eg1lYnq52YXL1ADj8?=
 =?us-ascii?Q?/b5rH6lxgqbRspWaKZVruox/aElbFeSzWGw61H6ecQth13/X6EDfCkIzySaK?=
 =?us-ascii?Q?F1j7H9/nMoacmpo7g4XiV0X8U4iNTF83cU0pHt1T6CBI9l3KF3YroXJsWV/t?=
 =?us-ascii?Q?T4HHLjT1W0OvA4+hsSRN5avIW1wMlqA6plDM4IqC/rpiffViVGtx2Fkrmy66?=
 =?us-ascii?Q?vy66yBYj9H9KQpIk15A/nlDMwe+JpFLLSL66jf2ghJt4zOUojUH9sV53Ihg1?=
 =?us-ascii?Q?lvd5CBQ7N3gG44RCwuDnGK0xbYuroXS2yrtS0hEBUv5KJsPRdMFkZCsyw0kE?=
 =?us-ascii?Q?Plg8DON6+BMjFEwKw6C+01qTBNGEQD+bCOWwOXwgew7qHJ0zR35A1uu6lMA2?=
 =?us-ascii?Q?fp88VX1R+8c6PyJO9xIPrpYCHPSiwI44udyGVJrCElwBq+igNl2doAe5DA3T?=
 =?us-ascii?Q?zqcZg3S3lf9taWBxtq5KRrpoPVyDvZZhpQkO80Oji17pvBopUT/TwqrxEdhh?=
 =?us-ascii?Q?/79ffl+AZB3peXNT8T9N6FWtOKMiSVmSzjZSoIlVi5JFtZS2tgzINw7VvUd/?=
 =?us-ascii?Q?/DaXr7M0ZKLcUF98p+f3vuguovOzJX0kdjHho5QV8qsrwTJ5BpUnPsI7ecM4?=
 =?us-ascii?Q?Uw0QFCZRBLViF7Luk2wGe4f0GNKstEn6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?p0ALCx4HMoOylh/6tzbkgy5wF8ftoqWHshMOwLTHMbe5TTwDve9vSg2LDwBB?=
 =?us-ascii?Q?y3V/lKDkoWlKHLs95AVoBO9QpVknwJEKu/kPbDA1Pm1V/QnMuo1jWuQsDFO6?=
 =?us-ascii?Q?4Ul9s4rmx8JyRU3nrOx6JWWKtKmrLwpVJbXfXpEssOIvTyPR6Qq+vKj1hIS1?=
 =?us-ascii?Q?SeAJS2wiGvMEKHzDPL6+7S2LbFbWl4zb5RB3aWiMccvU0jALqEZSh1MOm+JW?=
 =?us-ascii?Q?d/Eijf4Dg7iIMlNKxI1ZuigC7DMn5diEzWDNIgrOni4uKHy82x3pZJE7DKLD?=
 =?us-ascii?Q?xfGobkxa4bwYYrMeljlSDsVikJFMBhUgsr2KwRdnCQcVcrCYRdCxVHNrBjv6?=
 =?us-ascii?Q?3K6Gn7xPxG91IxaHLM0M3bv83Yhf+YfGd6w3jf9sGXEAmWDp15WytiOtmy4p?=
 =?us-ascii?Q?vVZ2SSiDxbSgdAGxAfOuZX/9Gpp9oCaIYIg0SLeMT5tOMbGKURlgpFPXAOxn?=
 =?us-ascii?Q?IDV9IfsioO7VSvoftmXZRIPGu2FHN9MjoRU1FV6FggZI9gTN1l5pRgOTvFDm?=
 =?us-ascii?Q?h7OcgTJwkRAXwWuppPR2qjmmMp3Nu6ax9catBhbervtGxJas6MfYzoO6K/0k?=
 =?us-ascii?Q?wbQ87g1UnS4TapAwcpqhhBH2Bry+rJWVWu+3qR+qxX/msHJ85QW9Zfo9oY53?=
 =?us-ascii?Q?T5J/z0949W76HEJOb3sJth3IJxcu8IsN2jR1a4arTvwuklzDoSLI1BRUnnIQ?=
 =?us-ascii?Q?HeGF08TEVuYeciwVTbI9nhsgY1Vmd1qpzkfbUUh5ZM5D5VKphXFcZ62bGLk/?=
 =?us-ascii?Q?93QLLSRDMdyRbzFG4QeS0PNeCPCyA/De8eh9rOW6vGA37u77wINpWchgE5fW?=
 =?us-ascii?Q?y3Dym4L0mNnq441DE5ZrAGbQTtbvaDhFJ7AK/KoE9aDricMu4bN5a7YKnJhI?=
 =?us-ascii?Q?QRG/+bT+EEcZZLzBzDB3i+3uPJ5on8BDWqRDFkfsrADyZkC0g2AUIO4abmP7?=
 =?us-ascii?Q?IGn1uJjszs+B46gX8mNnJCAgMgQS0smnpv6WYDRzmjvixnEdbazlR1bSmpdc?=
 =?us-ascii?Q?zGrWOTs/TSnETp6a1QD5hbzx17Ull3oVbiFrqeGjGG/60TfG8fhhqBCmCAZP?=
 =?us-ascii?Q?1a3RnMfAdKEbvvzNwempKrBl+ZY8Sz8ru3V6MiMJmFloJXX/H6UIHGEUxVI8?=
 =?us-ascii?Q?tcHsrkCeYr07R62urg0XyaSuyzFLpl2PbV6G5NXT7caqrixx2g+eTaiVgW9Q?=
 =?us-ascii?Q?3Bm/HqSppePap8M1F9Pl/1X3avOZ8FauuIzBOil8w8MJiFT855383CT+0/Vk?=
 =?us-ascii?Q?28emyO6XbbporooB0lrhsao5jLCkCJMVgcXUG7OJYDrvIpLNiOjHSh93tvze?=
 =?us-ascii?Q?S+99eu26/ElHcgAHgW/FK4n/5+6eZH1e9h0VtUjAF0pMBOFQpcudIwLaweKC?=
 =?us-ascii?Q?87WrBnV9TkH4zPBEybG6X8vrFwtgSNKgj8UbgyXA3G4W1Zlb8z5tUntQRjcy?=
 =?us-ascii?Q?7pBRnd7OPKQ0Pz54HSLHZV7OgIzoHm+4y00MhzE7N49FLivVBcEdqdZJsfsv?=
 =?us-ascii?Q?3UzmTsm1Ea4ecmTvDVXUest62gjUzYd69HOvLM+uIv4m7adHlJ8aMe7wd5jV?=
 =?us-ascii?Q?USTJCCOED+OnDvucqHYV+6q/Nuhgl21uVwDoFX6pL4VBIecDLRwVf7gPNDv+?=
 =?us-ascii?Q?EdXGFhh/SmAqtvtlc1nGhd8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5efba284-637e-4c3f-cf01-08de1b2ca2a2
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 22:59:25.5263 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TKu9PFWFV4OdD4bwQL6/6Y1WpFCAfngavPtNoRm2bmFtE6dD7aVToiuUdRZv/UkrvGEWtfKMnB8++nFRnx6iT/HIw33rDeXIC0wBG2aZSPYj1Cum890+yajT7gXP0k8I
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9155
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

On Sat, Nov 01, 2025 at 05:23:19PM -0700, Matthew Brost wrote:
>On Fri, Oct 31, 2025 at 11:29:22AM -0700, Niranjana Vishwanathapura wrote:
>> Multi Queue is a new mode of execution supported by the compute and
>> blitter copy command streamers (CCS and BCS, respectively). It is an
>> enhancement of the existing hardware architecture and leverages the
>> same submission model. It enables support for efficient, parallel
>> execution of multiple queues within a single context. All the queues
>> of a group must use the same address space (VM).
>>
>> The new DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE execution queue
>> property supports creating a multi queue group and adding queues to
>> a queue group. All queues of a multi queue group share the same
>> context.
>>
>> A exec queue create ioctl call with above property specified with value
>> DRM_XE_SUPER_GROUP_CREATE will create a new multi queue group with the
>> queue being created as the primary queue (aka q0) of the group. To add
>> secondary queues to the group, they need to be created with the above
>> property with id of the primary queue as the value. The properties of
>> the primary queue (like priority, timeslice) applies to the whole group.
>> So, these properties can't be set for secondary queues of a group.
>>
>> Once destroyed, the secondary queues of a multi queue group can't be
>> replaced. However, they can be dynamically added to the group up to a
>> total of 64 queues per group. Once the primary queue is destroyed,
>> secondary queues can't be added to the queue group.
>>
>> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
>> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_exec_queue.c       | 191 ++++++++++++++++++++++-
>>  drivers/gpu/drm/xe/xe_exec_queue.h       |  47 ++++++
>>  drivers/gpu/drm/xe/xe_exec_queue_types.h |  30 ++++
>>  include/uapi/drm/xe_drm.h                |   8 +
>>  4 files changed, 274 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>> index 1b57d7c2cc94..86404a7c9fe4 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>> @@ -12,6 +12,7 @@
>>  #include <drm/drm_file.h>
>>  #include <uapi/drm/xe_drm.h>
>>
>> +#include "xe_bo.h"
>>  #include "xe_dep_scheduler.h"
>>  #include "xe_device.h"
>>  #include "xe_gt.h"
>> @@ -62,6 +63,32 @@ enum xe_exec_queue_sched_prop {
>>  static int exec_queue_user_extensions(struct xe_device *xe, struct xe_exec_queue *q,
>>  				      u64 extensions, int ext_number);
>>
>> +static void xe_exec_queue_group_cleanup(struct xe_exec_queue *q)
>> +{
>> +	struct xe_exec_queue_group *group = q->multi_queue.group;
>> +	struct xe_lrc *lrc;
>> +	unsigned long idx;
>> +
>> +	if (xe_exec_queue_is_multi_queue_secondary(q)) {
>> +		xe_exec_queue_put(xe_exec_queue_multi_queue_primary(q));
>> +		return;
>> +	}
>> +
>> +	if (!group)
>> +		return;
>> +
>> +	/* Primary queue cleanup */
>> +	mutex_lock(&group->lock);
>> +	xa_for_each(&group->xa, idx, lrc)
>> +		xe_lrc_put(lrc);
>> +	mutex_unlock(&group->lock);
>> +
>> +	xa_destroy(&group->xa);
>> +	mutex_destroy(&group->lock);
>> +	xe_bo_unpin_map_no_vm(group->cgp_bo);
>> +	kfree(group);
>> +}
>> +
>>  static void __xe_exec_queue_free(struct xe_exec_queue *q)
>>  {
>>  	int i;
>> @@ -72,6 +99,10 @@ static void __xe_exec_queue_free(struct xe_exec_queue *q)
>>
>>  	if (xe_exec_queue_uses_pxp(q))
>>  		xe_pxp_exec_queue_remove(gt_to_xe(q->gt)->pxp, q);
>> +
>> +	if (xe_exec_queue_is_multi_queue(q))
>> +		xe_exec_queue_group_cleanup(q);
>> +
>>  	if (q->vm)
>>  		xe_vm_put(q->vm);
>>
>> @@ -549,6 +580,148 @@ exec_queue_set_pxp_type(struct xe_device *xe, struct xe_exec_queue *q, u64 value
>>  	return xe_pxp_exec_queue_set_type(xe->pxp, q, DRM_XE_PXP_TYPE_HWDRM);
>>  }
>>
>> +static int xe_exec_queue_group_init(struct xe_device *xe, struct xe_exec_queue *q)
>> +{
>> +	struct xe_tile *tile = gt_to_tile(q->gt);
>> +	struct xe_exec_queue_group *group;
>> +	struct xe_bo *bo;
>> +
>> +	group = kzalloc(sizeof(*group), GFP_KERNEL);
>> +	if (!group)
>> +		return -ENOMEM;
>> +
>> +	bo = xe_bo_create_pin_map_novm(xe, tile, SZ_4K, ttm_bo_type_kernel,
>> +				       XE_BO_FLAG_VRAM_IF_DGFX(tile) |
>> +				       XE_BO_FLAG_GGTT, false);
>> +	if (IS_ERR(bo)) {
>> +		drm_err(&xe->drm, "CGP bo allocation for queue group failed: %ld\n",
>> +			PTR_ERR(bo));
>> +		kfree(group);
>> +		return PTR_ERR(bo);
>> +	}
>> +
>> +	xe_map_memset(xe, &bo->vmap, 0, 0, SZ_4K);
>> +
>> +	group->primary = q;
>> +	group->cgp_bo = bo;
>> +	xa_init_flags(&group->xa, XA_FLAGS_ALLOC1);
>> +	mutex_init(&group->lock);
>> +	mutex_init(&group->list_lock);
>> +	q->multi_queue.group = group;
>> +
>> +	return 0;
>> +}
>> +
>> +static inline bool xe_exec_queue_supports_multi_queue(struct xe_exec_queue *q)
>> +{
>> +	return q->gt->info.multi_queue_enable_mask & BIT(q->class);
>> +}
>> +
>> +static int xe_exec_queue_group_validate(struct xe_device *xe, struct xe_exec_queue *q,
>> +					u32 primary_id)
>> +{
>> +	struct xe_exec_queue_group *group;
>> +	struct xe_exec_queue *primary;
>> +	int ret;
>> +
>> +	primary = xe_exec_queue_lookup(q->vm->xef, primary_id);
>> +	if (XE_IOCTL_DBG(xe, !primary))
>> +		return -ENOENT;
>> +
>> +	if (XE_IOCTL_DBG(xe, !xe_exec_queue_is_multi_queue_primary(primary)) ||
>> +	    XE_IOCTL_DBG(xe, q->vm != primary->vm) ||
>> +	    XE_IOCTL_DBG(xe, q->logical_mask != primary->logical_mask)) {
>> +		ret = -EINVAL;
>> +		goto put_primary;
>> +	}
>> +
>> +	group = primary->multi_queue.group;
>> +	q->multi_queue.valid = true;
>> +	q->multi_queue.group = group;
>> +
>> +	return 0;
>> +put_primary:
>> +	xe_exec_queue_put(primary);
>> +	return ret;
>> +}
>> +
>> +#define XE_MAX_GROUP_SIZE	64
>> +static int xe_exec_queue_group_add(struct xe_device *xe, struct xe_exec_queue *q)
>> +{
>> +	struct xe_exec_queue_group *group = q->multi_queue.group;
>> +	u32 pos;
>> +	int err;
>> +
>> +	if (!xe_exec_queue_is_multi_queue_secondary(q))
>> +		return 0;
>> +
>> +	mutex_lock(&group->lock);
>> +	err = xa_alloc(&group->xa, &pos, xe_lrc_get(q->lrc[0]),
>> +		       XA_LIMIT(1, XE_MAX_GROUP_SIZE - 1), GFP_KERNEL);
>
>Not a complete, just another few quick comment.
>
>I see the documentation patches mention the ref counting scheme but it
>is easy to over look that. Can we we have a quick inline indicating
>primary holds a reference to secondary queues LRCs?
>

Ok, will add the comment.

Niranjana

>Matt
>
>> +	if (XE_IOCTL_DBG(xe, err)) {
>> +		xe_lrc_put(q->lrc[0]);
>> +		mutex_unlock(&group->lock);
>> +
>> +		/* It is invalid if queue group limit is exceeded */
>> +		if (err == -EBUSY)
>> +			err = -EINVAL;
>> +
>> +		return err;
>> +	}
>> +
>> +	q->multi_queue.pos = pos;
>> +	mutex_unlock(&group->lock);
>> +
>> +	return 0;
>> +}
>> +
>> +static void xe_exec_queue_group_delete(struct xe_exec_queue *q)
>> +{
>> +	struct xe_exec_queue_group *group = q->multi_queue.group;
>> +	struct xe_lrc *lrc;
>> +
>> +	if (!xe_exec_queue_is_multi_queue_secondary(q))
>> +		return;
>> +
>> +	mutex_lock(&group->lock);
>> +	lrc = xa_erase(&group->xa, q->multi_queue.pos);
>> +	if (lrc)
>> +		xe_lrc_put(lrc);
>> +	mutex_unlock(&group->lock);
>> +}
>> +
>> +static int exec_queue_set_multi_group(struct xe_device *xe, struct xe_exec_queue *q,
>> +				      u64 value)
>> +{
>> +	if (XE_IOCTL_DBG(xe, !xe_exec_queue_supports_multi_queue(q)))
>> +		return -ENODEV;
>> +
>> +	if (XE_IOCTL_DBG(xe, !xe_device_uc_enabled(xe)))
>> +		return -EOPNOTSUPP;
>> +
>> +	if (XE_IOCTL_DBG(xe, xe_exec_queue_is_parallel(q)))
>> +		return -EINVAL;
>> +
>> +	if (XE_IOCTL_DBG(xe, xe_exec_queue_is_multi_queue(q)))
>> +		return -EINVAL;
>> +
>> +	if (value & DRM_XE_MULTI_GROUP_CREATE) {
>> +		if (XE_IOCTL_DBG(xe, value & ~DRM_XE_MULTI_GROUP_CREATE))
>> +			return -EINVAL;
>> +
>> +		q->multi_queue.valid = true;
>> +		q->multi_queue.is_primary = true;
>> +		q->multi_queue.pos = 0;
>> +		return 0;
>> +	}
>> +
>> +	/* While adding secondary queues, the upper 32 bits must be 0 */
>> +	if (XE_IOCTL_DBG(xe, value & (~0ull << 32)))
>> +		return -EINVAL;
>> +
>> +	return xe_exec_queue_group_validate(xe, q, value);
>> +}
>> +
>>  typedef int (*xe_exec_queue_set_property_fn)(struct xe_device *xe,
>>  					     struct xe_exec_queue *q,
>>  					     u64 value);
>> @@ -557,6 +730,7 @@ static const xe_exec_queue_set_property_fn exec_queue_set_property_funcs[] = {
>>  	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY] = exec_queue_set_priority,
>>  	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE] = exec_queue_set_timeslice,
>>  	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE] = exec_queue_set_pxp_type,
>> +	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP] = exec_queue_set_multi_group,
>>  };
>>
>>  static int exec_queue_user_ext_set_property(struct xe_device *xe,
>> @@ -577,7 +751,8 @@ static int exec_queue_user_ext_set_property(struct xe_device *xe,
>>  	    XE_IOCTL_DBG(xe, ext.pad) ||
>>  	    XE_IOCTL_DBG(xe, ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY &&
>>  			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE &&
>> -			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE))
>> +			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE &&
>> +			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP))
>>  		return -EINVAL;
>>
>>  	idx = array_index_nospec(ext.property, ARRAY_SIZE(exec_queue_set_property_funcs));
>> @@ -626,6 +801,12 @@ static int exec_queue_user_extensions(struct xe_device *xe, struct xe_exec_queue
>>  		return exec_queue_user_extensions(xe, q, ext.next_extension,
>>  						  ++ext_number);
>>
>> +	if (xe_exec_queue_is_multi_queue_primary(q)) {
>> +		err = xe_exec_queue_group_init(xe, q);
>> +		if (XE_IOCTL_DBG(xe, err))
>> +			return err;
>> +	}
>> +
>>  	return 0;
>>  }
>>
>> @@ -780,12 +961,16 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>>  		if (IS_ERR(q))
>>  			return PTR_ERR(q);
>>
>> +		err = xe_exec_queue_group_add(xe, q);
>> +		if (XE_IOCTL_DBG(xe, err))
>> +			goto put_exec_queue;
>> +
>>  		if (xe_vm_in_preempt_fence_mode(vm)) {
>>  			q->lr.context = dma_fence_context_alloc(1);
>>
>>  			err = xe_vm_add_compute_exec_queue(vm, q);
>>  			if (XE_IOCTL_DBG(xe, err))
>> -				goto put_exec_queue;
>> +				goto delete_queue_group;
>>  		}
>>
>>  		if (q->vm && q->hwe->hw_engine_group) {
>> @@ -808,6 +993,8 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>>
>>  kill_exec_queue:
>>  	xe_exec_queue_kill(q);
>> +delete_queue_group:
>> +	xe_exec_queue_group_delete(q);
>>  put_exec_queue:
>>  	xe_exec_queue_put(q);
>>  	return err;
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
>> index a4dfbe858bda..8cd6487018fa 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue.h
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
>> @@ -62,6 +62,53 @@ static inline bool xe_exec_queue_uses_pxp(struct xe_exec_queue *q)
>>  	return q->pxp.type;
>>  }
>>
>> +/**
>> + * xe_exec_queue_is_multi_queue() - Whether an exec_queue is part of a queue group.
>> + * @q: The exec_queue
>> + *
>> + * Return: True if the exec_queue is part of a queue group, false otherwise.
>> + */
>> +static inline bool xe_exec_queue_is_multi_queue(struct xe_exec_queue *q)
>> +{
>> +	return q->multi_queue.valid;
>> +}
>> +
>> +/**
>> + * xe_exec_queue_is_multi_queue_primary() - Whether an exec_queue is primary queue
>> + * of a multi queue group.
>> + * @q: The exec_queue
>> + *
>> + * Return: True if @q is primary queue of a queue group, false otherwise.
>> + */
>> +static inline bool xe_exec_queue_is_multi_queue_primary(struct xe_exec_queue *q)
>> +{
>> +	return q->multi_queue.is_primary;
>> +}
>> +
>> +/**
>> + * xe_exec_queue_is_multi_queue_secondary() - Whether an exec_queue is secondary queue
>> + * of a multi queue group.
>> + * @q: The exec_queue
>> + *
>> + * Return: True if @q is secondary queue of a queue group, false otherwise.
>> + */
>> +static inline bool xe_exec_queue_is_multi_queue_secondary(struct xe_exec_queue *q)
>> +{
>> +	return xe_exec_queue_is_multi_queue(q) && !q->multi_queue.is_primary;
>> +}
>> +
>> +/**
>> + * xe_exec_queue_multi_queue_primary() - Get multi queue group's primary queue
>> + * @q: The exec_queue
>> + *
>> + * If @q belongs to a multi queue group, then the primary queue of the group will
>> + * be returned. Otherwise, @q will be returned.
>> + */
>> +static inline struct xe_exec_queue *xe_exec_queue_multi_queue_primary(struct xe_exec_queue *q)
>> +{
>> +	return xe_exec_queue_is_multi_queue(q) ? q->multi_queue.group->primary : q;
>> +}
>> +
>>  bool xe_exec_queue_is_lr(struct xe_exec_queue *q);
>>
>>  bool xe_exec_queue_is_idle(struct xe_exec_queue *q);
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> index c8807268ec6c..3856776df5c4 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> @@ -31,6 +31,24 @@ enum xe_exec_queue_priority {
>>  	XE_EXEC_QUEUE_PRIORITY_COUNT
>>  };
>>
>> +/**
>> + * struct xe_exec_queue_group - Execution multi queue group
>> + *
>> + * Contains multi queue group information.
>> + */
>> +struct xe_exec_queue_group {
>> +	/** @primary: Primary queue of this group */
>> +	struct xe_exec_queue *primary;
>> +	/** @lock: Queue group update lock */
>> +	struct mutex lock;
>> +	/** @cgp_bo: BO for the Context Group Page */
>> +	struct xe_bo *cgp_bo;
>> +	/** @xa: xarray to store LRCs */
>> +	struct xarray xa;
>> +	/** @list_lock: Secondary queue list lock */
>> +	struct mutex list_lock;
>> +};
>> +
>>  /**
>>   * struct xe_exec_queue - Execution queue
>>   *
>> @@ -110,6 +128,18 @@ struct xe_exec_queue {
>>  		struct xe_guc_exec_queue *guc;
>>  	};
>>
>> +	/** @multi_queue: Multi queue information */
>> +	struct {
>> +		/** @multi_queue.group: Queue group information */
>> +		struct xe_exec_queue_group *group;
>> +		/** @multi_queue.pos: Position of queue within the multi-queue group */
>> +		u8 pos;
>> +		/** @multi_queue.valid: Queue belongs to a multi queue group */
>> +		u8 valid:1;
>> +		/** @multi_queue.is_primary: Is primary queue (Q0) of the group */
>> +		u8 is_primary:1;
>> +	} multi_queue;
>> +
>>  	/** @sched_props: scheduling properties */
>>  	struct {
>>  		/** @sched_props.timeslice_us: timeslice period in micro-seconds */
>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>> index 47853659a705..d903b3a55ec1 100644
>> --- a/include/uapi/drm/xe_drm.h
>> +++ b/include/uapi/drm/xe_drm.h
>> @@ -1252,6 +1252,12 @@ struct drm_xe_vm_bind {
>>   *    Given that going into a power-saving state kills PXP HWDRM sessions,
>>   *    runtime PM will be blocked while queues of this type are alive.
>>   *    All PXP queues will be killed if a PXP invalidation event occurs.
>> + *  - %DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP - Create a multi-queue group
>> + *    or add secondary queues to a multi-queue group.
>> + *    If the extension's 'value' field has %DRM_XE_MULTI_GROUP_CREATE flag set,
>> + *    then a new multi-queue group is created with this queue as the primary queue
>> + *    (Q0). Otherwise, the queue gets added to the multi-queue group whose primary
>> + *    queue id is specified in the 'value' field.
>>   *
>>   * The example below shows how to use @drm_xe_exec_queue_create to create
>>   * a simple exec_queue (no parallel submission) of class
>> @@ -1292,6 +1298,8 @@ struct drm_xe_exec_queue_create {
>>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
>>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
>>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE		2
>> +#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP		3
>> +#define     DRM_XE_MULTI_GROUP_CREATE				(1ull << 63)
>>  	/** @extensions: Pointer to the first extension struct, if any */
>>  	__u64 extensions;
>>
>> --
>> 2.43.0
>>
