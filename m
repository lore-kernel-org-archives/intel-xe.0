Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E412C2BD09
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jun 2024 07:08:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F93A10E173;
	Thu, 27 Jun 2024 07:08:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z9b2UIUe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A360610E173
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Jun 2024 07:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719472124; x=1751008124;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=dpqokYZQazln/l5Uj+zf3+bO/p7ajGpLf2G1Z9zAbYI=;
 b=Z9b2UIUe6kTVXwEP25RtvkA+qjV2UbbBHpBUiwC0222XT/X+hbaXwSMU
 EbRaKHX6YIx6e8RQqIZZ4d/9uZdcRM7GlF2EH2OV7TgXLPBzsb3AtFXhk
 UOLl5BWiJ5CLB7vmDwtxpVHVmkHNlR77sSLhxwlkY00higqH5eGzdxVw3
 u6V9cbqtr1QJ9jgt8KORXsfq1omOyfSurLDziQzZVBVKY9Vhp7yjq6qcC
 Vz8EF78pu7qOcZhfOcs/ldwvb83o7buH5xS7goU3ZxTHjrHYvyDt1hfsk
 Xe2PQgdgK6g7NBZJRiR8rHFyqKpOvcfwx/sYY+uFqg+mNNO1bn51odvlk w==;
X-CSE-ConnectionGUID: RODKfNSVSmaV7PyEAd1H1A==
X-CSE-MsgGUID: 4D7ojhpDS5aDEwSXc0qmpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="27977773"
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; d="scan'208";a="27977773"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 00:08:43 -0700
X-CSE-ConnectionGUID: esGSxsspRZKeSdPR5cijUw==
X-CSE-MsgGUID: hhpuGvtrS0aYynh2p4coaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; d="scan'208";a="48647675"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Jun 2024 00:08:43 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 27 Jun 2024 00:08:42 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 27 Jun 2024 00:08:42 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 27 Jun 2024 00:08:42 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 27 Jun 2024 00:08:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RCllSuAcOZscy7ZwSF6vZq0gzr7XIc5emk4so010luBJJOhrevCpAM+fbar8ZSDnhb0wzQdvOZHMuqMrD/2y2c5eHHriAAjbQ+A3pS4JsQW5m/Ou0qNArkIL4Kfl6IeG7oqS6ig+b0wDKOJzUlwC/xTJlZdJndB0cYMNwKlcGboDuKMSZD4wotB5EKMlx9JeNx+EaVTECbO5pYK55YgRu51ftNp0CVj+1So5M9+vEdBsm8swEiWGTGdjewa2VIZkAjYwz2IlqnNTrKw3E9qHTs/Daha+NQC/CW6pknSLfjoE3JOITYg5bOUU9zqM8WCZ7/8Whnlml6UtaFVAWZpvwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=koAF9KJrW1hsXmgTYqf8BS9XnfpO0NdmARD28KgDjMY=;
 b=KG8KmVM32yepCRLB53oSg/EFk3lXGEalxOWDADvfyaXzGRQyzmjBrNzP04MYvll+qO367m4/OF3/JCwpTjNDPfVgOAPRzH9xiXD9rTDJ10Tw0M1XHj3JZMStZ7zkpqxCIYNC6B9wutjqFg9b1MwaYcZRj+sPLQASbmMSH05lgroCZ+xbu5enm6dSHsnnIXXuo00jZqbSeiDsVf7Ijx77sNBVfDgTqCPc9kWtFcg4ut1mKGCu4fHyxv+yhBKRQwrLn8crT6eEhvcocNdUR0Xgo5C4nMKfuBh6FMLQafgoxDVE5pTQ4A3GUE0DmoQImEn6btmtD5+96vR69u3ru+rlbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by PH0PR11MB7423.namprd11.prod.outlook.com (2603:10b6:510:282::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.30; Thu, 27 Jun
 2024 07:08:40 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::ffd7:2656:a8c4:43b0]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::ffd7:2656:a8c4:43b0%4]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 07:08:40 +0000
Date: Thu, 27 Jun 2024 00:08:37 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.auld@intel.com>
Subject: Re: [PATCH v3] drm/xe: Add timeout to preempt fences
Message-ID: <Zn0P9X8yZAVsgdZw@nvishwa1-DESK>
References: <20240626004137.4060806-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240626004137.4060806-1-matthew.brost@intel.com>
X-ClientProxiedBy: BYAPR06CA0046.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::23) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|PH0PR11MB7423:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bda3f6c-b932-4cc9-c6a8-08dc9677f8c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VZY4i1b0waJfw7NRnIU5b70Dwk1kmXZjRDXgLV1zLoiOG9zx/Z/Ca5AWFG52?=
 =?us-ascii?Q?jofRGVS1I4kspNUU3do9IUTde99Ll7LDQEId98DhWe/lyx097G6p5MVl8fwY?=
 =?us-ascii?Q?Z3Dk8KRgT+EAtsdEnUW9XmVH0ookpQ3n6xCTBoqMnPk0HOIB1ylPrwqLZJT4?=
 =?us-ascii?Q?fDmLqFbPP0UKOBtSlU8VSvjGPhodkB8bwSACSebnbwC+0jWK/hInwlkPilSW?=
 =?us-ascii?Q?BkGjAO1hVQ/z/YYyx7jsUxRNDT7hDd+xvETt598v6caFBtIY2fg27cc2Qopj?=
 =?us-ascii?Q?+/GFk9DMYof5EJMbaX5awlJBUnu5EmNRPHbAW5w1vWBlU7hgU8q4GwfgryQr?=
 =?us-ascii?Q?jReXEYYL8eMdoAR6wMZVK0N8x8xkDllRh5LYa5JVDUU7c2MPFuioWIZQ3m6G?=
 =?us-ascii?Q?1QR0ItthXRGOCJrW7hdI7fV3FlmstoXmoUh7Haq+Y4ycvm1qhKqdCnQQmlor?=
 =?us-ascii?Q?5JR/tV+d9Cp1EAT9yUtmh9CuRKX13JfxdPQ+ZCKoilUv6OzNxcVJ2OlyG8r/?=
 =?us-ascii?Q?BiI3vcARe+l9efiiDrFwpqn1JAP3Aq2xANyQBb7a1Kf2uRo9jYiqCZ24fNgc?=
 =?us-ascii?Q?sgE2WexIpYVebEuSeCEakl962UGyyAFw5T3AtFO8ETFpqCfPFj70Zc51Y2LS?=
 =?us-ascii?Q?5x1VCpqapMen9DSpLjUJNoeNF5Vo4wf8LSW2kwzHXy9KQaxcIyWWPb3xpt9J?=
 =?us-ascii?Q?AigHtZcWCsujnOSlAWzjUBv7FUXaVVsLlB4tTHXaQLhepMvGfkD/UqEwTHMY?=
 =?us-ascii?Q?Tdz54iJ6WnCenyV+jDR1AULCVIN5//Y7uABZgJwUHyfWYiOdZIXVOeBvPDqp?=
 =?us-ascii?Q?UIRjg5cUYF+nUi6bTwtpJaDntSCNDNif8arvD1KK+krcHqyArj7COoxEC/Nf?=
 =?us-ascii?Q?edeNYjUpOObIFPll8PR+PgnIprpFYkjyC2TOxC1rUZsTWRSjvyvAcd6YS7Iy?=
 =?us-ascii?Q?90o9WrE2IpmKQ5dDDD5rmTDWTFVQJHANn0OUcWFOz9QhgyROYuHW7+qwbAFK?=
 =?us-ascii?Q?e4TaOhA3VelMtjMyNcYkJuVQ4ebSVJeQhbl+cMa/gNlYqv1RGfn+GvGfY8dk?=
 =?us-ascii?Q?ahsf+H8waQ7gIaoxgFGNa66kDPyXNaqQCH3HG9qX62dq3gbr16b2Yhuasxa5?=
 =?us-ascii?Q?eqf4g7a3lnCo7hFMOdQBNfuzN+9BXG58t22CPXMQIDn5H1R655N1txH/yWhq?=
 =?us-ascii?Q?b0VRlhkwAxlBCbo3zbVQysLJzJeXRiyaNCA4WA6mo3sqR/SZ1HLexaXiGCV0?=
 =?us-ascii?Q?GxFWR0fy0GTvhuT9wMII0aB2p/+LKLK9wWVRduM1zcMlH9FbyIuE80SJMfs+?=
 =?us-ascii?Q?LS4aNtKZwVEXqzL8Zv9L7QgR1Yagh6fTZFYI2QSEEco4Gw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TvHaKPrcxL+TCMwDY2jp5HfSe5Eq+citr/UWzFXGpEGOSwZhW7XjQTJqGzAI?=
 =?us-ascii?Q?+DOYBiPOL1ErAHhdW1lEU5QI2YIGN/hl1VPSMUBZ3pOtJKjJYJ/XYnTWwcai?=
 =?us-ascii?Q?o28Ws4haaWUaznscgKLwq9kJHpQdc/HBui8HaxL4PRj6dSPAT6ZOjAym23i2?=
 =?us-ascii?Q?08wYNUjqRk3VlKMOp6ZksXkdeuOt9vvzCf8+Uq+7VnhhXpgXDPAiPx4mheFz?=
 =?us-ascii?Q?UrBkirRWwTK2MZJ15tRLuxs7c93uwZXOUCDLIYR/teMuBrPZEGtIDUFweQ7W?=
 =?us-ascii?Q?NjbQEAVViHAxqzHQ0QrU9+ZWnG6Q+bWVZSpSzgZJzhaFdx34G13XNZrlCszf?=
 =?us-ascii?Q?5xKaXL2Ksk+73rcE7i8RhRRBbeFu7dp5jfFMG4UKSXu5oSdTsShfNcKLsvwQ?=
 =?us-ascii?Q?1b6ufOLFuTOjeIO4anNm3QkECJh/cDzJklvlatKRyQU43/PTEjeFcUNw/0V4?=
 =?us-ascii?Q?MvLaDiKMPQkN80ogXHnB/ZDvknjyeS5jdp5E4x6XZK2NYVFZ8a71m0D6V2H/?=
 =?us-ascii?Q?8IvZbiM5WqWeiz9ADFaZQZ63Sv8BTanxVt0kDZ6XSWQ+fLORyRww9QrzDNsM?=
 =?us-ascii?Q?QkeJVvjrhqe6hYur7MX1rspN1ClkbHsRhA1HHl2Zx9lwJyLagJvfpmxA4Zyf?=
 =?us-ascii?Q?teTCht3EShdDUo1s7y2DFg71st/FiIRUx32EK0NGFl2Zk2pvBjaiADAg1cC5?=
 =?us-ascii?Q?oLKTFNj/jGEy71KOY7EIBpeQmWCbTer267QuaM3Gpv0dHATkhNoB8W37WtHM?=
 =?us-ascii?Q?E5DJJ1gqmEvFzhd9kR4PYoU03SStISSkSx+o0R4Ht9WDnmQjw2uC/rf8SHDM?=
 =?us-ascii?Q?Qer83axY8rO1BWY0Fov7kgL8H1RChyP0E4IpEfoTE77LnpXP1JNwU56bZYm3?=
 =?us-ascii?Q?PESbFut0XWVtNvfef8iePPOJMbZ6l1PZrJs2Qc4mBfllYU2FGLrwxBlS0p07?=
 =?us-ascii?Q?T1bhET1LZlETk7ccT3o+v7kBfd6B4WZvO81IxL35VJ5l719QXy4sIRkmH41Y?=
 =?us-ascii?Q?si31SokeADwaURC/MdZEPmWwNwhwvTcizRYfBoshQ3QzW8+IMockBXdAmq8C?=
 =?us-ascii?Q?E8p+y6KvX086ZbBjyoeA6+bZ2F+B+tilOdzS9nWVgU7YpBRjOZbqwY49mZSI?=
 =?us-ascii?Q?6uOmZqJiNJDc68GHkVgHt5KmuV5+w9MgGmLhUhPbLq8ZMjDbJ2pJckwz4K+u?=
 =?us-ascii?Q?rhmqSyEpgEuHY+pkmUgwEtEZRbuXqUBuVmqIzzACbrXqVK0L5rhhVq7QX0Am?=
 =?us-ascii?Q?APoz6EbIXn2+YkF1TUnsNOcQiiZ/38AwQ2pE2WUjGHTDVnOhfqoQuXGmVRMN?=
 =?us-ascii?Q?Xl3hkBrJx+iqoUcWHafO3IBqAXmhBReOGSWKagFiTwjF3qJNi1Uh7pSRqvQy?=
 =?us-ascii?Q?Dqe32UcECd8R4tbV6NdEyYlTR1cV+CeBSbb+kGmkbn4cdoEE2LMx666KiVZV?=
 =?us-ascii?Q?kwlsGfnc3njZzfQ1nUu4pbS3Wui6NIElAou5XU1QRjZI9RcYl7jeI+jzpVIL?=
 =?us-ascii?Q?LjT0z9wCsgN9cHsOQxwEEQeX1jlgFsdUMOLBfgSahCD1R8J4f+Filp0te5PB?=
 =?us-ascii?Q?kQuF7otgzpx68rZlfr9cJfTv8KZ2FXh3BlwQRue9z3jOE86szUkfk5yodFJu?=
 =?us-ascii?Q?MzRan1swBQkuHF12j5lssoA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bda3f6c-b932-4cc9-c6a8-08dc9677f8c5
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 07:08:39.9942 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M4P9w8J8XzWj1SYJMtnDCgPmaSH5XWuwzIgyMSdUVyAhCmnwewyZZOCYebr6dESww6TdKV72gL+dAX7wIViYsrcKOmE/JTWZPxM3/biRlN8Jn2OyQHCYAsWPWqoJcc95
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7423
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

On Tue, Jun 25, 2024 at 05:41:37PM -0700, Matthew Brost wrote:
>To adhere to dma fencing rules that fences must signal within a
>reasonable amount of time, add a 5 second timeout to preempt fences. If
>this timeout occurs, kill the associated VM as this fatal to the VM.
>
>v2:
> - Add comment for smp_wmb (Checkpatch)
> - Fix kernel doc typo (Inspection)
> - Add comment for killed check (Niranjana)
>v3:
> - Drop smp_wmb (Matthew Auld)
> - Don't take vm->lock in preempt fence worker (Matthew Auld)
> - Drop RB given changes to patch
>
>Cc: Matthew Auld <matthew.auld@intel.com>
>Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>---
> drivers/gpu/drm/xe/xe_exec_queue_types.h |  6 ++--
> drivers/gpu/drm/xe/xe_execlist.c         |  3 +-
> drivers/gpu/drm/xe/xe_guc_submit.c       | 39 ++++++++++++++++++++----
> drivers/gpu/drm/xe/xe_preempt_fence.c    | 12 ++++++--
> drivers/gpu/drm/xe/xe_vm.c               | 14 +++++++--
> drivers/gpu/drm/xe/xe_vm.h               |  2 ++
> 6 files changed, 62 insertions(+), 14 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>index 201588ec33c3..ded9f9396429 100644
>--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
>+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>@@ -172,9 +172,11 @@ struct xe_exec_queue_ops {
> 	int (*suspend)(struct xe_exec_queue *q);
> 	/**
> 	 * @suspend_wait: Wait for an exec queue to suspend executing, should be
>-	 * call after suspend.
>+	 * call after suspend. In dma-fencing path thus must return within a
>+	 * reasonable amount of time. -ETIME return shall indicate an error
>+	 * waiting for suspend resulting in associated VM getting killed.
> 	 */
>-	void (*suspend_wait)(struct xe_exec_queue *q);
>+	int (*suspend_wait)(struct xe_exec_queue *q);
> 	/**
> 	 * @resume: Resume exec queue execution, exec queue must be in a suspended
> 	 * state and dma fence returned from most recent suspend call must be
>diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
>index db906117db6d..7502e3486eaf 100644
>--- a/drivers/gpu/drm/xe/xe_execlist.c
>+++ b/drivers/gpu/drm/xe/xe_execlist.c
>@@ -422,10 +422,11 @@ static int execlist_exec_queue_suspend(struct xe_exec_queue *q)
> 	return 0;
> }
>
>-static void execlist_exec_queue_suspend_wait(struct xe_exec_queue *q)
>+static int execlist_exec_queue_suspend_wait(struct xe_exec_queue *q)
>
> {
> 	/* NIY */
>+	return 0;
> }
>
> static void execlist_exec_queue_resume(struct xe_exec_queue *q)
>diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>index 373447758a60..b06321897cf3 100644
>--- a/drivers/gpu/drm/xe/xe_guc_submit.c
>+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>@@ -1301,6 +1301,15 @@ static void __guc_exec_queue_process_msg_set_sched_props(struct xe_sched_msg *ms
> 	kfree(msg);
> }
>
>+static void __suspend_fence_signal(struct xe_exec_queue *q)
>+{
>+	if (!q->guc->suspend_pending)
>+		return;
>+
>+	q->guc->suspend_pending = false;

Hmm...don't we need WRITE_ONCE here to write to suspend_pending flag
(along with READ_ONCE() elsewhere) given it is also checked in guc
callback handler etc? Possible that it might not be an issue on out
our platforms though. In any case, this patch is not causing this,
so, I am fine here.

>+	wake_up(&q->guc->suspend_wait);
>+}
>+
> static void suspend_fence_signal(struct xe_exec_queue *q)
> {
> 	struct xe_guc *guc = exec_queue_to_guc(q);
>@@ -1310,9 +1319,7 @@ static void suspend_fence_signal(struct xe_exec_queue *q)
> 		  guc_read_stopped(guc));
> 	xe_assert(xe, q->guc->suspend_pending);
>
>-	q->guc->suspend_pending = false;
>-	smp_wmb();
>-	wake_up(&q->guc->suspend_wait);
>+	__suspend_fence_signal(q);
> }
>
> static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg)
>@@ -1465,6 +1472,7 @@ static void guc_exec_queue_kill(struct xe_exec_queue *q)
> {
> 	trace_xe_exec_queue_kill(q);
> 	set_exec_queue_killed(q);
>+	__suspend_fence_signal(q);
> 	xe_guc_exec_queue_trigger_cleanup(q);
> }
>
>@@ -1561,12 +1569,31 @@ static int guc_exec_queue_suspend(struct xe_exec_queue *q)
> 	return 0;
> }
>
>-static void guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
>+static int guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
> {
> 	struct xe_guc *guc = exec_queue_to_guc(q);
>+	int ret;
>+
>+	/*
>+	 * Likely don't need to check exec_queue_killed() as we clear
>+	 * suspend_pending upon kill but to be paranoid but races in which
>+	 * suspend_pending is set after kill also check kill here.
>+	 */
>+	ret = wait_event_timeout(q->guc->suspend_wait,
>+				 !q->guc->suspend_pending ||
>+				 exec_queue_killed(q) ||
>+				 guc_read_stopped(guc),
>+				 HZ * 5);
>
>-	wait_event(q->guc->suspend_wait, !q->guc->suspend_pending ||
>-		   guc_read_stopped(guc));
>+	if (!ret) {
>+		xe_gt_warn(guc_to_gt(guc),
>+			   "Suspend fence, guc_id=%d, failed to respond",
>+			   q->guc->id);
>+		/* XXX: Trigger GT reset? */
>+		return -ETIME;
>+	}
>+
>+	return 0;
> }
>
> static void guc_exec_queue_resume(struct xe_exec_queue *q)
>diff --git a/drivers/gpu/drm/xe/xe_preempt_fence.c b/drivers/gpu/drm/xe/xe_preempt_fence.c
>index e8b8ae5c6485..56e709d2fb30 100644
>--- a/drivers/gpu/drm/xe/xe_preempt_fence.c
>+++ b/drivers/gpu/drm/xe/xe_preempt_fence.c
>@@ -17,10 +17,16 @@ static void preempt_fence_work_func(struct work_struct *w)
> 		container_of(w, typeof(*pfence), preempt_work);
> 	struct xe_exec_queue *q = pfence->q;
>
>-	if (pfence->error)
>+	if (pfence->error) {
> 		dma_fence_set_error(&pfence->base, pfence->error);
>-	else
>-		q->ops->suspend_wait(q);
>+	} else if (!q->ops->reset_status(q)) {
>+		int err = q->ops->suspend_wait(q);
>+
>+		if (err)
>+			dma_fence_set_error(&pfence->base, err);
>+	} else {
>+		dma_fence_set_error(&pfence->base, -ENOENT);
>+	}
>
> 	dma_fence_signal(&pfence->base);
> 	/*
>diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>index 5b166fa03684..bf1764249724 100644
>--- a/drivers/gpu/drm/xe/xe_vm.c
>+++ b/drivers/gpu/drm/xe/xe_vm.c
>@@ -133,8 +133,10 @@ static int wait_for_existing_preempt_fences(struct xe_vm *vm)
> 		if (q->lr.pfence) {
> 			long timeout = dma_fence_wait(q->lr.pfence, false);
>
>-			if (timeout < 0)
>+			/* Only -ETIME on fence indicates VM needs to be killed */
>+			if (timeout < 0 || q->lr.pfence->error == -ETIME)
> 				return -ETIME;
>+
> 			dma_fence_put(q->lr.pfence);
> 			q->lr.pfence = NULL;
> 		}
>@@ -311,7 +313,15 @@ int __xe_vm_userptr_needs_repin(struct xe_vm *vm)
>
> #define XE_VM_REBIND_RETRY_TIMEOUT_MS 1000
>
>-static void xe_vm_kill(struct xe_vm *vm, bool unlocked)
>+/**
>+ * xe_vm_kill() - VM Kill
>+ * @vm: The VM.
>+ * @unlocked: Flag indicates the VM's dma-resv is not held
>+ *
>+ * Kill the VM by setting banned flag indicated VM is no longer available for
>+ * use. If in preempt fence mode, also kill all exec queue attached to the VM.
>+ */
>+void xe_vm_kill(struct xe_vm *vm, bool unlocked)
> {
> 	struct xe_exec_queue *q;
>
>diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
>index b481608b12f1..c864dba35e1d 100644
>--- a/drivers/gpu/drm/xe/xe_vm.h
>+++ b/drivers/gpu/drm/xe/xe_vm.h
>@@ -259,6 +259,8 @@ static inline struct dma_resv *xe_vm_resv(struct xe_vm *vm)
> 	return drm_gpuvm_resv(&vm->gpuvm);
> }
>
>+void xe_vm_kill(struct xe_vm *vm, bool unlocked);
>+
> /**
>  * xe_vm_assert_held(vm) - Assert that the vm's reservation object is held.
>  * @vm: The vm
>-- 

Changes in xe_vm.c and .h are not needed.
Given that is taken care of,
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Niranjana


>2.34.1
>
