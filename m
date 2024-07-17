Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6905BC3DA60
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jul 2024 19:07:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12F0A882AF;
	Wed, 17 Jul 2024 19:07:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MyxOnzFh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE99C882AF
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jul 2024 19:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721243258; x=1752779258;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rq5ENl3kKDGoAJLHyQjJxXOuWO8mDmYn1R2aMAnV1Gc=;
 b=MyxOnzFhcbH0UqW9OP5h/JXiagiYMt40avDNkmD6IboiKYmhFakUh+ia
 QiARnbQsDi4SDjhj7DGCGrfPIHKfYnULSsPhXK5owROrykbElJuI4GnWz
 LDP1Izwh4TCWoswhuRwo+Ip6MWdOQ9MlfRo19xIWPErzxuariiIGCCKU7
 qUHCJ1xtBPm7Z7VC+YzQ0BzJJSBI3e5yyYQ0L6Z2qIrpyfXURCL9zMDgB
 01DgLZitwpWTABTrCrYmrx+U7WkgqicjmmrWcZwEQDxEZUNMaZaz98beM
 EVKB8XWyXWW/Py56jyhPL66WysSkd9cGTNprROGjaNYgE4vG9c7sC85+U Q==;
X-CSE-ConnectionGUID: cV+/AM3qRF6BM5tpwaUNuQ==
X-CSE-MsgGUID: VB9CegNuSJ+1o2b6MjJMHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="18581334"
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; d="scan'208";a="18581334"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 12:07:34 -0700
X-CSE-ConnectionGUID: /OZftcj1SoCIO4t1z6h6dg==
X-CSE-MsgGUID: JBK1Zqa8SbC0a3mqnh252A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; d="scan'208";a="81144332"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jul 2024 12:07:34 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 17 Jul 2024 12:07:32 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 17 Jul 2024 12:07:32 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 17 Jul 2024 12:07:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mKOdiTcK+P3DlEQYaZD4o+KY6oyo8W2z1rPFpT98FcGza4HI5HjCs9Dix7yfuS/EvprXF87EYDf/5UcyWcAOIPwv+agMOdf9s/Kp91x8DlIIyAUnVu9DDmt7cNa1Sf721a+irRZ1YWGuklJF9BFlIyUkjHzGC6J4s0eduF+8IP4euA75OHKlUUd3ruKA+Ax97AI7EgylAxEPWsGYz6QVvF6us0CiHRfzJ3TIzAruzGUxaqwTc2aA9rtQXcQs4Bk/ee6VOUNPtVbcFyIsuom9u1HNgA/v3OW681km+O2KBUP/Z3JFajvBpwrRQpvvPlPiH9jwW8fXZ2S0vquIv/eOGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lqke6yrUfEDrvox6MvcyeSRNoE3CnCngrf2iuxIjnmQ=;
 b=lzpE1ELxJIRj/X8sZ4F4eizpLOR1qUFjYQEwpnLDN6i/fg3Ssb2ols5si4+aZSTwKJrFdXkW8xnreFBB+WoqOk/J2bm3TGGRz/LwQZMtN2ajDtduJ4V9JqTfZlzVfhnpHR4OVXRMrG5Y7O7+843YxA/dJ3vFf6iKPImay4Oyk+Km9+D2OgvKPx++X6Oqn/lEMBEvN7y3aQ3Cg1fo0YZu0nsuZyK5xwGUUVK2/JNVUYAJvsCOWcz9U4InKELFjAqXGye4ngNA1LhJQmRzR5XxvIxcJcmHPjC9QUZWtsOnX+CcG2RFhH4RqLIRq1KsRLuW6Gbw6NN2PNaAmw8LAx7ySQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB8425.namprd11.prod.outlook.com (2603:10b6:806:385::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Wed, 17 Jul
 2024 19:07:29 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.7762.032; Wed, 17 Jul 2024
 19:07:29 +0000
Date: Wed, 17 Jul 2024 19:06:38 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/xe: Remove used xe_sync_entry_wait
Message-ID: <ZpgWPka+7S7Yi4jX@DUT025-TGLU.fm.intel.com>
References: <20240717140429.1396820-1-matthew.brost@intel.com>
 <20240717140429.1396820-2-matthew.brost@intel.com>
 <87r0brzx17.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87r0brzx17.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BY3PR10CA0021.namprd10.prod.outlook.com
 (2603:10b6:a03:255::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB8425:EE_
X-MS-Office365-Filtering-Correlation-Id: ceda442e-3e31-4227-0399-08dca693b428
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HIxZHrk3TgI4rvKcLqpPAfD1r1Dvjkg9nutckcroe72brzkWa0WbUwwzUM02?=
 =?us-ascii?Q?jNemP2NPC2Az9ZxP/A2A+cAVasjpM8EEmsIGnPqpJ8AS8kuXTzPQkjrl4nnv?=
 =?us-ascii?Q?hPJ28nu2mp2RvVRjF5Up2pvHWqb12fa4Z/NgWx9OcBoO1JwainT5e6dhFJn1?=
 =?us-ascii?Q?RhF43RBrCafbDIRuOJ+PFAS/KXAYgkq14M2i30Jxga++YO/o+kVtOvchm8vv?=
 =?us-ascii?Q?i1rcZvAZM/nN/JrtSCEayRZCsuuYBhP0QtHwEl8QJTcpTHkdS30ERQXMgK2O?=
 =?us-ascii?Q?O5HYghCrSdJLkJe0tAesetelFU74bN9g2LCH5394VoyKKei7xwkoKOXF18lH?=
 =?us-ascii?Q?ZvGmjAMnD4BG2THy0AEE/DtaTFWOvywR3AXO/s9DfjQG8iIzYPYeDgkwdUk4?=
 =?us-ascii?Q?IV51l4fdErpUFLct1Vo/z7Jnp4R/dnUDHLmoM8J+mOpCt4mtkp7FKvyCh0J+?=
 =?us-ascii?Q?T3kbgZJ/M69UAjrr4XUHqFiLVqzzoMcMkvuLdD9Oh5JI38evSTOWvPCtokLv?=
 =?us-ascii?Q?0tVKXmZoexloSI1DGdA+86wR2o0BiJLvBYIrOWx0+judTncfVtYVuVvPQXwE?=
 =?us-ascii?Q?oOd30fYlKvHLmuZYrcYkBbdKirbbXvh3XY3f3uczwnv7lPvj2ftIvaCF4vuN?=
 =?us-ascii?Q?acZ4Y6NArocOQ4D8mv4gHUfRj4CclrfCgSJyyb/lkowH2qoJkw2xI7c7hazs?=
 =?us-ascii?Q?LOvMA9KG9BWh2guovJATooHiJJXuv6BSaIicV2IDwklQmHRFZvyQyx3xsFTr?=
 =?us-ascii?Q?pBzke0/c4cRZoHtLTP3tjujh4koNH3OiNWZD1CtEHCVDhzzCVLkPXRjdG0hx?=
 =?us-ascii?Q?1dy0WHddiruZ4FkAaSnWWAlVhv0J1isZ+PS91Mmb+kI94WkyzpgU3IW4/3uW?=
 =?us-ascii?Q?zU2WJvBjM7vzt/D5jShS/9+YEBtiXOw5Cc+d8SdeKQZ0A1Gp4B4m8ye576rm?=
 =?us-ascii?Q?VG/E+qeBqURzN0I5iVj6voyB/Pdn1Z4iuCWgkkKPxTGvDxt1yBwPAzc8TMbp?=
 =?us-ascii?Q?V4ilF2Lh/pbjgGwoaJv49/cy7V8M0I26Qzsw0ZqKaNBGD8wWwdNi9jwq/J1o?=
 =?us-ascii?Q?mxLwLBKPG/e/LQM8WtRJ2419Q2768YGpRq2Gg5kt+E4hx1q8UOG9xBO8hB3o?=
 =?us-ascii?Q?SlpDj2yKdQXMJCtFhRBHAkZCS3S75zRxC5YY7CBZ8MPgoURlPzvpytBSMFBZ?=
 =?us-ascii?Q?nKdxE0gWKatdQ0ZUrai5JF8u9mA2VUUjm9RybEWXAo0/vyzTbcdqftz/It65?=
 =?us-ascii?Q?wTrCBRAxwVTGGXMP1TYCjW1IA4t92A6n98IrS4mLzq2ZkXvezHXcFLcxSTvT?=
 =?us-ascii?Q?mGenrDV00YWnlRAThGELpp1R7/4rCc8Vx5anQSB/IXfL/w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dzAhI23E1PAG7OP31FiyOZ7bSIYQnkXJvOd/LVTEkPXtr4EEUrrjK41iu63f?=
 =?us-ascii?Q?YfGX+APWjQiIpKU5STYHFibeHL2OPbn6nuoh9DeBMf5lHCLBkFzscQ/AW8D1?=
 =?us-ascii?Q?mLmDZ0WFdvaencmAGM7SAzzpbmtSBnuuBGtV2G5TR140gOWMoqIcur5AxVYy?=
 =?us-ascii?Q?eghXh8FNTm1M/SpzbOic+Ygxv5FAJgNWvGc6HhyybML3rIc0hUVW+RMeOgDN?=
 =?us-ascii?Q?whDiuaLl+BZdT4UKGMfcPx7uBbdJaDw2+V/bMk2//5UotbejKsu/8BkuverH?=
 =?us-ascii?Q?GrQSXN6DhBqEydHSVEAfOSsK71Onm2PvJl4NpXnnfycrohmBhRPjkImX7gUP?=
 =?us-ascii?Q?Eg1JReK1fYbKEuyBziBDmekA4HJ70StfWuCx78e0+MF3ofMuP3NjMOwcAkks?=
 =?us-ascii?Q?HmpCCmKXAZZ2RUokLzMXoJ6qjU0i1Z2/618oJMRqFPeqPYMydZ3rmRKLhRI2?=
 =?us-ascii?Q?g9o2MEf0/J8faO9eAkCrr1CIvJj245AzkKDFzdSdOJRdRbgvB0MGpsIl9ldi?=
 =?us-ascii?Q?Xrgyy44+efWh5zokmJOz88wtJ34Ka3HJ4QS+KAzG5Mb50V3b/S9La3DfLITc?=
 =?us-ascii?Q?9rb4aI+3uFATVi7zT5ZwGp/GE+QjDKpeEozKyHrbAHv9HJ2SKH+EtE+BC9Xm?=
 =?us-ascii?Q?2LVCOzAIcqkrt3/kuqf4VcWmGG+LC8zSuz3w5CTr0ppsMGBrzKuh4lDUQRHt?=
 =?us-ascii?Q?1GmZAdf5auQ3SnUbDAY0qy5B9KfAveXHwp8P1ZOXN9iuda5j3qhsyRNFSpx6?=
 =?us-ascii?Q?S0v9wNmVsW3KU6JNqb8qf00yhFkQ9/7LmLjkQ28YTRvjjRd7iF4oh72hN7yc?=
 =?us-ascii?Q?/dmSOO221NLjDuY1wA1/VZIE1/1m3Mj3WdoJowZ3LAg2ts1MN7XTb0dCq0ZG?=
 =?us-ascii?Q?O4FWVmSoUQeABAaRO4/LpXNAy1mLlSy9Nw7vTDKNZ7ytHSTOle3pWRsSYc52?=
 =?us-ascii?Q?IzPyKAbK8kSgHw6G3II0jGWchyw76zgLY6ga/KPGZ5sfHn2onj0N+X9Qdd3f?=
 =?us-ascii?Q?exEoGwx49Dzwmttrd34ipc7oXygU/Dq8tBWHexH5mjMq55aEg3ZBEnRMx1zg?=
 =?us-ascii?Q?x0Nkp+UU/fP/J90d7+WeTpyvz4cpKvFpeZCWWMtEqnC0eF3KMEjiAbI5TYdw?=
 =?us-ascii?Q?stHozdtL4T9BmG9FbKvEZNyzAso4jhIGPt9J/93o5Da6lN3MN5sfNNHO/Vp3?=
 =?us-ascii?Q?zxnNRk/f+p7i8aeD2O0itCAeQhzssvJB7Oq8cd78Qq+kK/Ff7G0VDhEB2KVD?=
 =?us-ascii?Q?Pz5LFzFD8IAYa0+z+orpmwDVqWNiuS7ehr+Dbi6rO8g+grawI44BAWmfj7Io?=
 =?us-ascii?Q?dceowjeQtdfBiFU4ZY4pSk1pxxoVfAK24S1B8WVu2KGH79AfW313IAKEl3Aj?=
 =?us-ascii?Q?a9Mi3c2ELEo4phLmyhep02hcVeSZ8yGGjjK9hGeDJ6zDkkDREo71IsP5Liej?=
 =?us-ascii?Q?OlCEPKV28BN03VE73UTR8OtFvkP9zfi0MtApXmCdqyoLNKm096K7MxzU2fpc?=
 =?us-ascii?Q?8b5NxviA81iG6WSFMsqhufKDcSeVFQsYoV06JURwNsmCFDVfxK+Nzl5mz7Dp?=
 =?us-ascii?Q?KpDqTPx4/UVDNllvE7286cZMk5WiqdHefOMuAMJKZcw5GcL6rTTICsFwmZUl?=
 =?us-ascii?Q?Tw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ceda442e-3e31-4227-0399-08dca693b428
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2024 19:07:29.3544 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gmdNDklnWD2wY//lapXwS+9trYF6y20YdPxLs8BVePHnhNbqhED1Z+RkiNtJdxA1o4a5J2HeaUq8o35GO+123Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8425
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

On Wed, Jul 17, 2024 at 11:35:48AM -0700, Dixit, Ashutosh wrote:
> On Wed, 17 Jul 2024 07:04:29 -0700, Matthew Brost wrote:
> >
> 
> s/used/unused/ in commit title/subject.

Fix up when merging.

Matt
