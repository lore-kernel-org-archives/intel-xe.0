Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA247CD4F4A
	for <intel-xe@archiver.kernel.org>; Mon, 18 May 2026 21:22:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7912410E904;
	Mon, 18 May 2026 21:22:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YxCQ56aW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C76D10E9E2;
 Mon, 18 May 2026 21:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779139373; x=1810675373;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=vM9YKvBSeKkLVKWGScyW415bMgDAiIW0qkzx3D3drzw=;
 b=YxCQ56aWdDoNTMxpkdhJUDDCR+whYnvUk8fSYRgUFYsYi9yrXRx4oGWW
 6+WmcyFD8uUi7DkEoGPH+z1b+oSqhKftXmSSs4gp9l1w6ci6NJ8/3nNk+
 IQIOSb6awSrojyujzHdFom5qwpNx0qUUzAdY6gdXuQwPq79gyGzVEYP/1
 XLAgHvpdoXMMnczAAuz+p3Xl3amru64Bn0xb2p7TVNhhr2g4nxBw5HOrO
 pBrEtWhd5nGyh/EtgwYLlaFSwCWiQkohbcOivQwRY6Wu1H3lErFDcbEN8
 ZAy42rHpYPIBlYQfb3eE9TadnplYUgFIH0t6EBjmFBSKOTvSVlWjFkEcY w==;
X-CSE-ConnectionGUID: T5hXZsGORHuUkZLn9WVfwg==
X-CSE-MsgGUID: hhZy45p9RPeig0dRld38Ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="79856949"
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; d="scan'208";a="79856949"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 14:22:53 -0700
X-CSE-ConnectionGUID: cFutXTD0Q0uu13KujlQhxA==
X-CSE-MsgGUID: LmYjYyt/QgmEYwJuDn+2nA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; d="scan'208";a="244550736"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 14:22:53 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 18 May 2026 14:22:52 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 18 May 2026 14:22:52 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.5) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 18 May 2026 14:22:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lVTVVr7ZGSOt3JOK4fLJcau2M9xOkdBnfHHJkkfMmj7T++FkHgjJK6/GGNe/pe+fZtFZjE5jclzHH5cNmQKi7rtfkazA7fM6SJk5QLRYqkTB8EnAPQuZsweMnO3HGgliKuvS9ZNtp0b28AxVopVseJ2FMttN4WwZOnIJp02+YVZlD0aJTQ5o4JR4Lb7uI04FzH3d1tBynnrfqNouwZtz8stRhpts430plH699qE2KYwVio1g1GUcc1pdjjJVyCPAQHJkbbnzhfzFaba9NWtnp8ei5F9NXFSuZkStI5mHZCNXZPys5CWjcrdRicgoXQgeT5GDvuYNJw2cvLSy++0QkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nl03zwy44hPPZxVaCFYO1KykoQeQlpA0w16Y9AVIt3w=;
 b=Pl2JKq0CHGvHUotpmEZP86pkkIiQlzWLd5/I28PPt2hmlEePlZrQXlw9OhPJ654QqpeknZfVbRASnjOuHocTB7zXYC2/Few/6BwNVSih4CV0m802bZPveeIvOcJij0qI8Bud++O5vOgV/GJNgyrrbgW3BvXBb2Nsgy0nUVK9lmMC3eZVQoze+gFLnyisvRXXog2xyteTEl0wKSJh316Q7b+ls+q4fwhwurIx4gsW/hLRc+WtPrdeR6arc1l8FkrLkZgJXCkG9YgRuh29MHOTgJr+Atw44NU43/lhnS/PvMpGHNCqTMoQbLwYTtjOVK1MQB/EJ5o9q8XsrsQpZGBdPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by MW4PR11MB5933.namprd11.prod.outlook.com (2603:10b6:303:16a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Mon, 18 May
 2026 21:22:48 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%5]) with mapi id 15.21.0025.022; Mon, 18 May 2026
 21:22:48 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: <I915-ci-infra@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?Q?=E2=9C=97?= Xe.CI.FULL: failure for drm/xe/guc: Use
 xe_device_is_l2_flush_optimized()
In-Reply-To: <177879455710.72886.9435006969746184334@5ab824fced77>
References: <20260513-guc-l2-flush-opt-use-xe_device_is_l2_flush_optimized-v1-1-36fa866d6ed8@intel.com>
 <177879455710.72886.9435006969746184334@5ab824fced77>
Date: Mon, 18 May 2026 18:22:45 -0300
Message-ID: <87wlx0quoq.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0097.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::38) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|MW4PR11MB5933:EE_
X-MS-Office365-Filtering-Correlation-Id: d7babba1-3fbf-481b-59ab-08deb5239c62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|22082099003|56012099003|18002099003|4143699003|11063799003;
X-Microsoft-Antispam-Message-Info: JllWV+jB4yCc/X0LhcEJH9xd+ZrleGwT1gQ5KRKX6m6EZfCBC9l5G75rM8XyP2sqQ5uqIKhMCCXqOGHy44O1c4gTeyf34nAUhu8tuOVOzJqqH290YQFiC9sbmDzf11QpYxQx1KCnVqr5cYSpvAKlRz7+gnymI3AmsfrpYl8fuFKBIZ3slHCUHoyIjTZyeR7kzS+fB/tfTZsrRiLWAytb2UaolcedRRjjfCPUNav3BL55AA4SuxehtVgmx+U5bp6VxqIHrSsBRtfLyy8bJI3QLjrev2fAw2IDt83O1lFeDqla9PNW6M73GKamLYBx0z4d8O9uhhtdY5SNih4UT1MBNP60lxE/MvVo1DNt+nYNIffjMyC6CQfx4cLEoqBuV4+5a3YVQew6LfVr5WiSqGlSBgtgXFDHRHWeTqO96zll7Y9HUEg0ObbUVdq/D0WpnQltL7RFY/RqUjWd/bSBoyGatrtiLQkRYqC7YTAMQ8/g4AI0EWw2udAQRr/2gNn0Fju2ykQKnaWp+CmVpUa9NPumu2san8lgF8s31IMjRjQg6AcnrSOTHkfgABSBDNQI1xewLXJLCGel+PMj3wzuhFT5/a1xK9ap9DgKD2pHAX9bnRcNilGIfsngrjW+lWCPGSLm1fHmg4DcvVyIIhfNbJBPtA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(56012099003)(18002099003)(4143699003)(11063799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bfoZ1Ag+Snl41LjuaNm/iqm4FHfLPNIzUOLxGUP84sQxug6IbsOP3gXfqcRY?=
 =?us-ascii?Q?Gi0MXpYwtUHo8Z+I9FRiBdTmPkZFIvzS4R5wXnPGG4+iD6ErBBIimREMAi5l?=
 =?us-ascii?Q?CN+BFdzCkXL+FqCjZTooxJ8lhQuxpmaXZBvy/Tbr7pNf3NQEyDuHALlH8Ewu?=
 =?us-ascii?Q?A1rOXlt9lL0ouAF00lkoHeBkVFWhd9qnt4cV6ioRgTusOWMKUW3yn2ZFzQa6?=
 =?us-ascii?Q?P1cjU0f5ehJ7UP2Mixx4ffFUhCvkypYY1y/9jTEJbOH5q+cB4OVrW5C6narh?=
 =?us-ascii?Q?hnedH3RZkQcX+1r0zg1Gs756RqPZpDkma3m8TabVAvzvu4wQSz+2HtclXlyq?=
 =?us-ascii?Q?5vekGU6AGdVCleHzskcJWHOzBg6vi3GHi9o5nByuZS+rJ+B21v2Dvrf0t9/4?=
 =?us-ascii?Q?Gi3+AdC1pTNViWTJTF/l/ycFZWf4BQ6DEOJPp8IFPPfZj7ekzaloIJL4HXS0?=
 =?us-ascii?Q?mGEmOZx96r0KVrJbdYd0KrH2r0wqclr+OYJDouqV/RASVD9rKDmsRs+hBaNG?=
 =?us-ascii?Q?O1E9y8xm+8kiz7aYVFPS/98kCI4Xox/RooeV1kSjDm2gP3tMhtu9JDYtghA8?=
 =?us-ascii?Q?ZwZDFjcdXoMN2defDVjGdesHnuxlIZ9BsLbo6VFBZtD50ZrRY3tmIrhjlYeb?=
 =?us-ascii?Q?oPX1UmHkXJtERxd+P5MOUyBGTLtO43+iL/iq64C9vb/padsbShiymkibZ6t7?=
 =?us-ascii?Q?T5fUXGJiVbgPxLccB+3m9Xr55WOJ7JGC0ewSQwtAJuSyaEG3CMweTdLpbQ6K?=
 =?us-ascii?Q?f957KWPGZf0o+ql70KHEzusm3J0iFJCg6kmJb8yLqJHFAGkVIp+oUwZ7tyk8?=
 =?us-ascii?Q?KJhAOIuUfDSVvC4U9k8dC8VfnKeva0pqbZyeck1Lf5kkyFGhCfrsRImxcDeQ?=
 =?us-ascii?Q?gZOi6umgdiKsxQOaimgKzUgAK9Sk4Ubrbaabe6h/Vy99EW5SIPCU9hblYQru?=
 =?us-ascii?Q?nM2aOkDi282IKD6z4gX/RfIxdFL4jrX9GTz6HRzJhcVhdb74/6V41xtUksgR?=
 =?us-ascii?Q?xV6Lc202sGDkdXcNYUT+bFzVS0ir0/VoF7fGc8sOvp2pGW9VfX/GHQxv3io7?=
 =?us-ascii?Q?WeLB4uQKf5Rp6bqFt7f3w8rcr550LpJsXxepCYEoxxsgb1AQj/eOgLW0S9/M?=
 =?us-ascii?Q?M5TJKcDRO3Pa/eEJ/3mvlUf0Ra3SxHL3eIYHM5tYAGmEY3Nv76KCHv6vlVgs?=
 =?us-ascii?Q?/el4J2e3K4dkUkitVzGRX4Ya/MasvA8YD9vXY1PSE+uNJsxQoXhYPfuapyY/?=
 =?us-ascii?Q?eBHZawW93ENERhhW4ajH8HunY0RZAQiMqY4LLRAQVTHxrKdxg9DKF3Xo03V3?=
 =?us-ascii?Q?yKmgJfQLGTOqPsQFlIOMJOe43Ks1F2/3I5Fx6/o18IxP0CFTHwnTXZU/RvXv?=
 =?us-ascii?Q?7c8CcP5PnmdwnwV/dcFozZMNGFOJIP+ZZZELo184v59o+HiVXRkJ6ZbGb0zN?=
 =?us-ascii?Q?VZAIuTk59Xut1GKYXzY+FvQOG26gbORHnLwhOIsBe4JQVXljZ5XHPPQFdbXY?=
 =?us-ascii?Q?kj9f24LZCu+UVLtdhKnzR8w+ssLPXQJMgWnPoWYfBiSTjYGa9+bNQQMfThO0?=
 =?us-ascii?Q?FcnQtyY9KrjCGjgaIdVSgGsaw62tmH9LJGZ+H3R8NRLUtatMkn+rm3arMilp?=
 =?us-ascii?Q?64aJTcerl/1E0s2yd3EavQc2SOg5qqfPLlVlvD8H5FZLSIlJ/Py2IS1tL+6p?=
 =?us-ascii?Q?eokXDZ9+qg13IN5bUfMCuMubW8sI+vTEKRbaDnGS6bbM5daH0Iegf0rnwe0R?=
 =?us-ascii?Q?+fFosG7FuA=3D=3D?=
X-Exchange-RoutingPolicyChecked: ASBdr3SOjJ8z6zuEZa9aU2iWto6Jf3oKtDKbftEgARLGnpZImh8ANqAeL3YUyCDxmQSOm64pUwtkKn0d+Pdikn5geI6rKt26afyeOWRapdBj6sXXYmZ4guGGRkMbxY8VuxZJjajIIhaCv5C7DMZ/XUeeZhMwxqfGOq3FKKFYfclSsUv67zV/IysJoIJUDYUWghcJ/bNTE2124XOJ4bB+F0EeU8QA6sFzM/RZqvxv3tnX6AUXNGNUOcDMhgTs3QcwSj4VrADJ33Io2E2+BcR7G4jXj23koWpck5qTvv0o4YPd93AHQBYDcCqWEGRg5CQgMY7cS0yLpTh9bgbuphsekw==
X-MS-Exchange-CrossTenant-Network-Message-Id: d7babba1-3fbf-481b-59ab-08deb5239c62
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 21:22:48.6196 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZYPlOeRkg5L62iUrTG4q8+9DrPvCLCwswJJomEKWo/ogobHE1kRJTHjxfu18i423FDUIgPOPlIR2bsYaSUSuFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5933
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

Patchwork <patchwork@emeril.freedesktop.org> writes:

> == Series Details ==
>
> Series: drm/xe/guc: Use xe_device_is_l2_flush_optimized()
> URL   : https://patchwork.freedesktop.org/series/166539/
> State : failure
>
> == Summary ==
>
> CI Bug Log - changes from xe-5059-848634197d2738329d56c588df7cd8f21c0f7568_FULL -> xe-pw-166539v1_FULL
> ====================================================
>
> Summary
> -------
>
>   **FAILURE**
>
>   Serious unknown changes coming with xe-pw-166539v1_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-166539v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
>
>   
>
> Participating hosts (2 -> 2)
> ------------------------------
>
>   No changes in participating hosts
>
> Possible new issues
> -------------------
>
>   Here are the unknown changes that may have been introduced in xe-pw-166539v1_FULL:
>
> ### IGT changes ###
>
> #### Possible regressions ####
>
>   * igt@xe_eudebug@discovery-race-sigint:
>     - shard-lnl:          NOTRUN -> [ABORT][1]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166539v1/shard-lnl-3/igt@xe_eudebug@discovery-race-sigint.html

Unrelated to this patch.  Possibly related to
https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/8007.

--
Gustavo Sousa
