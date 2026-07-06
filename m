Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3F6BC43458
	for <intel-xe@archiver.kernel.org>; Mon,  6 Jul 2026 15:59:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3835710E9F7;
	Mon,  6 Jul 2026 15:59:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ft6B7EC5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7ABE10E9FB
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Jul 2026 15:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783353572; x=1814889572;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=vrNYQO9TD37XbVMHe86uvKEOzDJcN0iUTwilAtkMt58=;
 b=Ft6B7EC5m0RSAPhD+mnomCRubZWNctC9Ir4RRqclix0nAq2vwRpaZaSq
 g3uSZxDTkWFYvWFQoibgJfZaAv2nMgORs3IWXZcmiBlcxL2+5TIIn95uw
 dlLpFKySjl1iWadnNoOn6WbMrqPZjHYc3Rf/VYd69zJ0rvsK/yuY3flKR
 hR8S5x11cHUcfeYmE849XRJCsl2+dbdfm5w23mAvQE5mdu5b/ymMUl1lW
 ywPsssXIs26YVmAbYmyFov9OnGD6SOD8BsKUALkhZoS3KsM59FLkcrnJT
 gFxBSPMenhw9zXECEZl4HxXwkByKkFF47tSfBmTHUhcg8ZwENa/cnPTPq A==;
X-CSE-ConnectionGUID: sEOVRXN9RguTUG4dUahCIw==
X-CSE-MsgGUID: IUsmHi5hRI6KPf+WbQqGig==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="95370402"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; d="scan'208";a="95370402"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2026 08:59:32 -0700
X-CSE-ConnectionGUID: JQ6y07cySm6vS5RWXKAPYA==
X-CSE-MsgGUID: R1VvB1XaQ0iuFmlD0MOnww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; d="scan'208";a="250408519"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2026 08:59:32 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 6 Jul 2026 08:59:32 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 6 Jul 2026 08:59:32 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.42)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 6 Jul 2026 08:59:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TrVXNy+xDBCL6jAIUk3UGppg3S5B9zWPQsGRwbY7yfjZX0hnqaTCNyzgpAbTcKjU2Kh04bR7IvDEcIl2DEEVErIvh/sJjdGJgBMd9QvPhSS9heasC3RTwnGiHNyFwnQTpi/lk8Dacj1gm14HwYHno9SkoIinl7KWQ6uWODGR+CbzwbK9J1miN6yeFZ137pnOUWN3ycCFq6HrZeeNwg83Q/H+W1xrUhnDAeC4OcgVeo5ZrabRQufxreJi5olhtU1Bjqti4RfrWsgaoTcM69aOyPunWz0jMIysvGDzUOmi6MwSSchSHIY1m1y2LDnyMi723r4gcqmEXkHmJO9PpyvTag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lpj1FCiyXD0MjctplBQxGMPCN+k4XCf+ZI0b9RtIoHI=;
 b=VGvAj/sXtvN8lb8NHPcvwAx9LaehUI5/TyyeSbKJkBwPdYPrXPEFeT1XyCQZB2yKem5k7CfegIPGTa8ln1r+jNF0bfbvmClk2u/c7esleUhC13DUSMTi0uWzEVJ4Go2DhuciZ7lxfmbzZNXSyEAeEfrM7nWcJpQRKMjN+/0J7xPJ84il0V9mNhvDbLmMh41a9zL8uushgiN9v3hpbi6RyF60S+QvDo7EHB5lUzx44i7/CkAP0Sq/QWvA4NANp52iyPIA3jEw5Pq5dPU9ocpvu8nAbLVCPEFEPxU4ExyY8bxahwxdMXuTD62h4vYS0GuJxslw60d6eza9XpQOI0L5Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PHXPR11MB9662.namprd11.prod.outlook.com (2603:10b6:510:3cd::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 6 Jul
 2026 15:59:28 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.21.0181.008; Mon, 6 Jul 2026
 15:59:28 +0000
Date: Mon, 6 Jul 2026 08:59:26 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Karthik Poosa <karthik.poosa@intel.com>
Subject: Re: =?utf-8?B?4pyTIFhlLkNJLkZVTEw=?= =?utf-8?Q?=3A?= success for Add
 a debugfs for pcode information (rev2)
Message-ID: <20260706155926.GV6214@mdroper-desk1.amr.corp.intel.com>
References: <20260702092540.1005095-1-karthik.poosa@intel.com>
 <178305217839.146722.1334639919959484600@6beec6c84f66>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <178305217839.146722.1334639919959484600@6beec6c84f66>
X-ClientProxiedBy: SJ0PR03CA0350.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::25) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PHXPR11MB9662:EE_
X-MS-Office365-Filtering-Correlation-Id: 78a104bc-3a0e-411a-ecb5-08dedb778f45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|18002099003|22082099003|11063799006|56012099006|4143699003|6133799003;
X-Microsoft-Antispam-Message-Info: BhCEb4/f7eddgZSDB+HBooMQ/hztUMOtW6MXA0Ga2zNMakb/gz8V3k2Xljz7j49FIzSkaA2PGkAoLZ0pwcDyoAgYNh60uQUcz7leT5eg8JsGi/XBuGdzQzYKD8rXkBS8Gw27KoUoC0rHvFszGLwwK/A3Hd+rVghYl4I9LzlJIxFndelUa/2Do7kn040wha8ziyuPJSXsJNGlVg3LcWjjHG8g7xXtDOM8euog7bIIdZ6jDRbdQsd7x3bgFqQry4+TkUu7nG5sthOd35iJE9ioifwMJMa2BoyxC1LaKRjxH3FOiB+nN7GecqEjwjanLMBEDpwH4hGzetI69cilUKsUaPRsn31L5imVPmmtCAgmD91u58h0rBtKENDsMzlbWnWfW5ha7jHo8wpcsQPuqYXmlw5hqfSbIwApAD5VMcN+GA+dpslu/qQEp6c4kN2Do+iyCe+I3SY/2WoS+lNyY3q70wIFryGoKJzixKZr/8zuTvq2GMG8EfDYFeUgvlx5rLg8AGmrt3N2nJnuwoIDexOBBLSuDjf5u6coTa6aDmI1AI1ECkP9Cv3Z27J36Umb48O4A5lvjPpDG7GHhZb4sBDax2zS7fx8uo7tv6c6gQBgtFI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(18002099003)(22082099003)(11063799006)(56012099006)(4143699003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?L3vZyzt+IyvnNSj5NeId+SOOyLMPBxnYKgjHeP/Jbv1fltPjgEApjjZPB658?=
 =?us-ascii?Q?ZaVa6fJ+poQMqHcacPxQp5QREt5kShcqi28DIyKyMXHHJYwquWWKOCS3LmCg?=
 =?us-ascii?Q?ADsxd0B3Yl4ujmxRW6l/eH5h+24ZHQqtHlRVX1jF9R9czE65qtTh4D/QbWpM?=
 =?us-ascii?Q?FlwnjI1mtNenBN+CoxYqc4TTcPuCbd16Y2FXCj/TIl0glmr70FPYPTrd5oqU?=
 =?us-ascii?Q?9WMSUoACZxb2KkqdAWiivHOAGyZ3pqzLciAIeyp2Lv4TxsxZ/kKsb1DPT++g?=
 =?us-ascii?Q?7k02FG4QnOCnUogAoLPoFIKHGTXFDeIsCG+EWLhZBAiDOC0vkzKOVp1DkTcn?=
 =?us-ascii?Q?q4h/XEVlAxQ3j7uQw9+QoowrVgJuQ9nxjUC7/MGJCDNs0iDJ2ZJESnZlbFOS?=
 =?us-ascii?Q?dr2A7pGDm66syT2/zoMtmATiM/5RX14wkV7aQZXydJlJxubPIL4dpR1REB32?=
 =?us-ascii?Q?dJ1QubPQsIrC3z8QqylsAcZS6u+WkurZXHleYsKc5AjNVGrskCEnOZWSIm9B?=
 =?us-ascii?Q?UhoA1knLY4lh9kYWrCxdDIRSwUkINnyIfTSIVYJ/34p1lcQGUtDrzpmCwjzj?=
 =?us-ascii?Q?48a8aqqiBFWn3aRKepNMhWye1MN1dzOEoAwY7Z1hfdQjKwh/vkF0jawYXLvd?=
 =?us-ascii?Q?BevX/ketaE5Cgf1VImM+n3x7b+l/NF0bjXMJesKIsKI36HpYO9W7UkDxOahd?=
 =?us-ascii?Q?c/dTBfYlhaE0N6Y/VEuZJQD8oQ9IgIMGVrVfvnH4YCOXm3tTXDUaid2NQYQ0?=
 =?us-ascii?Q?h0J+4N1ER2K4BTeUQMNbzTLcRrXvhlRw0KrCWxKdrw0jNUP2b5ofi6JDqcmq?=
 =?us-ascii?Q?JcdEV/SXRF5ljzqacB6mO5DFDTidYUdOI73FxdETR4wzw23izIGOnCHvkexj?=
 =?us-ascii?Q?CBNk+CUPpgHsYmY0lyJrsUunItMFp5yYgdx5KKkidpPabxoTvL6q+BAE+F6S?=
 =?us-ascii?Q?jIjNnWSKLYzSa8uGET4/JFBdh4NlYnFnWOJ0sn4T0bVvWCduOr02yAmaVz3b?=
 =?us-ascii?Q?XsxWT+JMU2gLosJDUmgboZ83V0ABjpt+9qPPOvwjUltiE1WUdIy8JWsMjUHf?=
 =?us-ascii?Q?8C1oQOeBo3IQa2MJhuKcqBc8sWGi1H9YDDdIGpUZECPBKs5uP8HbvRL6D3k9?=
 =?us-ascii?Q?TZ4X9PuJ658ljwe23EuvMH/mSZhGnLJL7Pahu187QjlTzrBSEa08z1iYSmK0?=
 =?us-ascii?Q?yHJ7MDPUXk5eiiQ6kZUruuorW6mHljQtB/FOFhEghet+VO66tyoS/HlUiK13?=
 =?us-ascii?Q?jxsBK8hCp1BMzw9smWa7hZo7N6w7mskP627hFI0t26VoK0bcG29PigBW1Jlm?=
 =?us-ascii?Q?fAa3idQZfBC/FQ8QrCaNZBP2n/UY5dAfGUxQXrFbzHFQAPI2MAsbiimTtqzV?=
 =?us-ascii?Q?X9ZrORD4WZOr8XCQEOkvIxDNL8jkoCafcFCSJaGz7uQ03cG8fVhmnHRBDqst?=
 =?us-ascii?Q?iaciv0HTdtTwuWlK9pJGfB4YTy5JDNkz0tCaSBU+YqZTqyX7tGA1v/MvLcVs?=
 =?us-ascii?Q?BcFyG7Qgj+9lzn6iLkNUYA7+CYLhhaDcH551fmH1MNlPROS/TxexWAPVg3Y5?=
 =?us-ascii?Q?Fm+ZjOLyiO4UO6tlaKo9MK/YvBpv6/+EHY86QlCOdNQf6dEVLBr/MLemIlhd?=
 =?us-ascii?Q?YmECDzzzJfdBgpMXT8RFA8nb0AGfF7OOt7HTes7bvngFUrOPHBcMAbqTTSLM?=
 =?us-ascii?Q?xrLK5V+kkjCMrrXbfsV/ZcEpeofC59SuTl9go5jopeFiNmgvA+n+snFCqSsh?=
 =?us-ascii?Q?T2ODsyil0Tea+kzAFT4GvaizqZdbpPQ=3D?=
X-Exchange-RoutingPolicyChecked: oq+k5hEtElIGcNIIL2aFscnpCXjudV4sEI8oTTxTCVWcLQyMw971VG2+kvyvC6opaFtaCMnz9li56iVBzV2v7qsdQnP1crLPRZZoAiX4JV9qSIxxG78zMxoTprwE9lM67T0vGVpIJX0COgtaGg/u6RfCiHriskAVc7lpnD3jDDfN6HuPp4x9ksn4sbkVQffQ6iIj7xIr+RjkUodHIGjkMxKlcVxJgWp/1BbxfpOHBlyb4I9jKrHQhIAMjACtOtJwI4FD7vHTPEns+t7PocmWKErUT7KzJVeKAMSYoFdbYwKgx+Nbqbth7qlgh+9EDE5ibTD15+6j7288jWyLVBjtOw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 78a104bc-3a0e-411a-ecb5-08dedb778f45
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 15:59:28.7470 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K9vZbZJvhuq3zZDzlnXUumAE2ByxlWM8ZHVIpG23rXOfzp4nknwkGdpeHPdCviaDYQg3D/Ei9hUC13z+GAGPK8z8BzzKUlPngDgSr1fkhBw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PHXPR11MB9662
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

On Fri, Jul 03, 2026 at 04:16:18AM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Add a debugfs for pcode information (rev2)
> URL   : https://patchwork.freedesktop.org/series/168836/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-5329-4a1a395fa156b92a83b501f8e331f21cd035c2e1_FULL -> xe-pw-168836v2_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.
> 

Applied to drm-xe-next.  Thanks for the patches and reviews.


Matt

>   
> 
> Participating hosts (2 -> 2)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-168836v2_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
>     - shard-lnl:          NOTRUN -> [SKIP][1] ([Intel XE#3157])
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-lnl-4/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
> 
>   * igt@kms_addfb_basic@unused-pitches:
>     - shard-lnl:          NOTRUN -> [ABORT][2] ([Intel XE#8007])
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-lnl-8/igt@kms_addfb_basic@unused-pitches.html
> 
>   * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
>     - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#2327]) +1 other test skip
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-bmg-6/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
>     - shard-lnl:          NOTRUN -> [SKIP][4] ([Intel XE#1124]) +1 other test skip
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-lnl-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>     - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#1124]) +7 other tests skip
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-bmg-9/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>   * igt@kms_bw@connected-linear-tiling-4-displays-target-3840x2160p:
>     - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#7679])
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-bmg-9/igt@kms_bw@connected-linear-tiling-4-displays-target-3840x2160p.html
> 
>   * igt@kms_bw@linear-tiling-4-displays-target-2560x1440p:
>     - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#367]) +1 other test skip
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-bmg-9/igt@kms_bw@linear-tiling-4-displays-target-2560x1440p.html
>     - shard-lnl:          NOTRUN -> [SKIP][8] ([Intel XE#8365])
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-lnl-4/igt@kms_bw@linear-tiling-4-displays-target-2560x1440p.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:
>     - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2652]) +8 other tests skip
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#3432])
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc:
>     - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#2887]) +5 other tests skip
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-bmg-9/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc.html
> 
>   * igt@kms_chamelium_audio@dp-audio:
>     - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#373]) +1 other test skip
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-lnl-4/igt@kms_chamelium_audio@dp-audio.html
> 
>   * igt@kms_chamelium_color@degamma:
>     - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2325] / [Intel XE#7358]) +1 other test skip
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-bmg-6/igt@kms_chamelium_color@degamma.html
> 
>   * igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d:
>     - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#7358])
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-bmg-9/igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d.html
> 
>   * igt@kms_chamelium_hpd@common-hpd-after-suspend:
>     - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2252]) +2 other tests skip
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-bmg-9/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
> 
>   * igt@kms_chamelium_sharpness_filter@filter-basic:
>     - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#6507])
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-bmg-9/igt@kms_chamelium_sharpness_filter@filter-basic.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:
>     - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#6974])
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-bmg-9/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html
> 
>   * igt@kms_content_protection@dp-mst-type-1:
>     - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2390] / [Intel XE#6974])
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-bmg-9/igt@kms_content_protection@dp-mst-type-1.html
> 
>   * igt@kms_content_protection@lic-type-1:
>     - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#7642])
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-lnl-4/igt@kms_content_protection@lic-type-1.html
>     - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#7642])
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-bmg-9/igt@kms_content_protection@lic-type-1.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-512x512:
>     - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#2321] / [Intel XE#7355])
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-lnl-4/igt@kms_cursor_crc@cursor-offscreen-512x512.html
>     - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2321] / [Intel XE#7355]) +1 other test skip
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-bmg-9/igt@kms_cursor_crc@cursor-offscreen-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-256x85:
>     - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2320]) +1 other test skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-bmg-9/igt@kms_cursor_crc@cursor-sliding-256x85.html
>     - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#1424])
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-lnl-4/igt@kms_cursor_crc@cursor-sliding-256x85.html
> 
>   * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
>     - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#309] / [Intel XE#7343])
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-lnl-4/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
>     - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#2286] / [Intel XE#6035])
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-bmg-9/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
> 
>   * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
>     - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#4210] / [Intel XE#7467])
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-bmg-9/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html
> 
>   * igt@kms_dsc@dsc-with-bpc-bigjoiner:
>     - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#8265])
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-bmg-9/igt@kms_dsc@dsc-with-bpc-bigjoiner.html
>     - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#8265])
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-lnl-4/igt@kms_dsc@dsc-with-bpc-bigjoiner.html
> 
>   * igt@kms_flip@2x-modeset-vs-vblank-race:
>     - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#1421])
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-lnl-4/igt@kms_flip@2x-modeset-vs-vblank-race.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
>     - shard-lnl:          [PASS][31] -> [FAIL][32] ([Intel XE#301]) +1 other test fail
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5329-4a1a395fa156b92a83b501f8e331f21cd035c2e1/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#7178] / [Intel XE#7351]) +1 other test skip
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
>     - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#7178] / [Intel XE#7351]) +2 other tests skip
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
> 
>   * igt@kms_force_connector_basic@force-edid:
>     - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#352])
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-lnl-4/igt@kms_force_connector_basic@force-edid.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc:
>     - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#6312] / [Intel XE#651]) +2 other tests skip
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#7061] / [Intel XE#7356])
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-pri-shrfb-draw-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#6312]) +2 other tests skip
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-lnl-4/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-pri-shrfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-cur-indfb-draw-render:
>     - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2311]) +35 other tests skip
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen:
>     - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#4141]) +11 other tests skip
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#656] / [Intel XE#7905]) +4 other tests skip
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-shrfb-msflip-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#7905]) +11 other tests skip
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-lnl-4/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbchdr-tiling-y:
>     - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#7399])
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-bmg-9/igt@kms_frontbuffer_tracking@fbchdr-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#7061] / [Intel XE#7356]) +2 other tests skip
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-render:
>     - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#7061]) +3 other tests skip
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-render.html
>     - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#7061])
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#2313]) +35 other tests skip
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psrhdr-rgb101010-draw-render:
>     - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#7865]) +4 other tests skip
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-lnl-4/igt@kms_frontbuffer_tracking@psrhdr-rgb101010-draw-render.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-a-plane-5:
>     - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#8303]) +1 other test skip
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-bmg-6/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-a-plane-5.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier:
>     - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#7283])
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-lnl-4/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier.html
> 
>   * igt@kms_plane@pixel-format-y-tiled-ccs-modifier:
>     - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#7283]) +2 other tests skip
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-bmg-6/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html
> 
>   * igt@kms_pm_backlight@fade-with-dpms:
>     - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#7376] / [Intel XE#7760] / [Intel XE#870])
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-bmg-6/igt@kms_pm_backlight@fade-with-dpms.html
> 
>   * igt@kms_pm_rpm@dpms-non-lpsp:
>     - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383])
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-lnl-4/igt@kms_pm_rpm@dpms-non-lpsp.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:
>     - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#1489]) +3 other tests skip
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-bmg-9/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html
> 
>   * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
>     - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#2893] / [Intel XE#7304])
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-lnl-4/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html
> 
>   * igt@kms_psr2_su@page_flip-p010:
>     - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2387] / [Intel XE#7429])
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-bmg-9/igt@kms_psr2_su@page_flip-p010.html
>     - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#1128] / [Intel XE#7413])
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-lnl-4/igt@kms_psr2_su@page_flip-p010.html
> 
>   * igt@kms_psr@fbc-psr2-cursor-plane-move:
>     - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#2234] / [Intel XE#2850]) +7 other tests skip
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-bmg-9/igt@kms_psr@fbc-psr2-cursor-plane-move.html
> 
>   * igt@kms_psr@fbc-psr2-cursor-plane-onoff:
>     - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#1406] / [Intel XE#7345])
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-lnl-4/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html
> 
>   * igt@kms_psr@fbc-psr2-cursor-plane-onoff@edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#1406] / [Intel XE#4609])
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-lnl-4/igt@kms_psr@fbc-psr2-cursor-plane-onoff@edp-1.html
> 
>   * igt@kms_psr@psr2-primary-render:
>     - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#2234])
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-bmg-9/igt@kms_psr@psr2-primary-render.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
>     - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#2330] / [Intel XE#5813]) +1 other test skip
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-bmg-9/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
> 
>   * igt@kms_setmode@invalid-clone-single-crtc:
>     - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#1435])
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-lnl-4/igt@kms_setmode@invalid-clone-single-crtc.html
> 
>   * igt@kms_sharpness_filter@invalid-filter-with-nearest-neighbor:
>     - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#6503]) +1 other test skip
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-bmg-9/igt@kms_sharpness_filter@invalid-filter-with-nearest-neighbor.html
> 
>   * igt@kms_vrr@flipline:
>     - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#1499])
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-bmg-9/igt@kms_vrr@flipline.html
> 
>   * igt@xe_eudebug_online@stopped-thread:
>     - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#7636]) +11 other tests skip
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-bmg-9/igt@xe_eudebug_online@stopped-thread.html
> 
>   * igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram:
>     - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#7636]) +3 other tests skip
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-lnl-4/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram.html
> 
>   * igt@xe_evict@evict-small-external-cm:
>     - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#6540] / [Intel XE#688]) +1 other test skip
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-lnl-4/igt@xe_evict@evict-small-external-cm.html
> 
>   * igt@xe_evict@evict-small-multi-queue-cm:
>     - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#8370])
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-bmg-6/igt@xe_evict@evict-small-multi-queue-cm.html
> 
>   * igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-invalidate:
>     - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#7482]) +2 other tests skip
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-lnl-4/igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-invalidate.html
> 
>   * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
>     - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#2322] / [Intel XE#7372]) +5 other tests skip
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-bmg-9/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html
> 
>   * igt@xe_exec_basic@multigpu-once-userptr-invalidate:
>     - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#1392]) +1 other test skip
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-lnl-4/igt@xe_exec_basic@multigpu-once-userptr-invalidate.html
> 
>   * igt@xe_exec_fault_mode@many-multi-queue-rebind-prefetch:
>     - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#8374]) +5 other tests skip
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-bmg-9/igt@xe_exec_fault_mode@many-multi-queue-rebind-prefetch.html
> 
>   * igt@xe_exec_fault_mode@many-multi-queue-userptr-imm:
>     - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#8374]) +1 other test skip
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-lnl-4/igt@xe_exec_fault_mode@many-multi-queue-userptr-imm.html
> 
>   * igt@xe_exec_multi_queue@max-queues-preempt-mode-fault-basic-smem:
>     - shard-lnl:          NOTRUN -> [SKIP][75] ([Intel XE#8364]) +7 other tests skip
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-lnl-4/igt@xe_exec_multi_queue@max-queues-preempt-mode-fault-basic-smem.html
> 
>   * igt@xe_exec_multi_queue@two-queues-preempt-mode-basic-smem:
>     - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#8364]) +18 other tests skip
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-bmg-9/igt@xe_exec_multi_queue@two-queues-preempt-mode-basic-smem.html
> 
>   * igt@xe_exec_threads@threads-multi-queue-fd-userptr-rebind:
>     - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#8378]) +4 other tests skip
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-bmg-6/igt@xe_exec_threads@threads-multi-queue-fd-userptr-rebind.html
> 
>   * igt@xe_exec_threads@threads-multi-queue-mixed-fd-basic:
>     - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#8378])
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-lnl-4/igt@xe_exec_threads@threads-multi-queue-mixed-fd-basic.html
> 
>   * igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch:
>     - shard-bmg:          [PASS][79] -> [ABORT][80] ([Intel XE#8007])
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5329-4a1a395fa156b92a83b501f8e331f21cd035c2e1/shard-bmg-4/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-bmg-3/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html
> 
>   * igt@xe_multigpu_svm@mgpu-pagefault-prefetch:
>     - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#6964]) +1 other test skip
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-bmg-9/igt@xe_multigpu_svm@mgpu-pagefault-prefetch.html
>     - shard-lnl:          NOTRUN -> [SKIP][82] ([Intel XE#6964])
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-lnl-4/igt@xe_multigpu_svm@mgpu-pagefault-prefetch.html
> 
>   * igt@xe_page_reclaim@prl-max-entries:
>     - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#7793])
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-bmg-9/igt@xe_page_reclaim@prl-max-entries.html
>     - shard-lnl:          NOTRUN -> [SKIP][84] ([Intel XE#7793])
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-lnl-4/igt@xe_page_reclaim@prl-max-entries.html
> 
>   * igt@xe_pat@pat-sw-hw-suspend:
>     - shard-bmg:          NOTRUN -> [FAIL][85] ([Intel XE#7695])
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-bmg-6/igt@xe_pat@pat-sw-hw-suspend.html
> 
>   * igt@xe_pm@s3-multiple-execs:
>     - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#584] / [Intel XE#7369])
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-lnl-4/igt@xe_pm@s3-multiple-execs.html
> 
>   * igt@xe_prefetch_fault@prefetch-fault-svm:
>     - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#7599])
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-bmg-9/igt@xe_prefetch_fault@prefetch-fault-svm.html
>     - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#7599])
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-lnl-4/igt@xe_prefetch_fault@prefetch-fault-svm.html
> 
>   * igt@xe_pxp@pxp-termination-key-update-post-suspend:
>     - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#4733] / [Intel XE#7417]) +1 other test skip
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-bmg-9/igt@xe_pxp@pxp-termination-key-update-post-suspend.html
> 
>   * igt@xe_query@multigpu-query-topology:
>     - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#944])
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-bmg-9/igt@xe_query@multigpu-query-topology.html
> 
>   * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:
>     - shard-lnl:          NOTRUN -> [SKIP][91] ([Intel XE#4130] / [Intel XE#7366])
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-lnl-4/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html
> 
>   * igt@xe_sriov_vfio@open-basic:
>     - shard-lnl:          NOTRUN -> [SKIP][92] ([Intel XE#7724])
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-lnl-4/igt@xe_sriov_vfio@open-basic.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
>     - shard-bmg:          [INCOMPLETE][93] ([Intel XE#7084] / [Intel XE#8150]) -> [PASS][94] +1 other test pass
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5329-4a1a395fa156b92a83b501f8e331f21cd035c2e1/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
>     - shard-bmg:          [FAIL][95] ([Intel XE#7571]) -> [PASS][96]
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5329-4a1a395fa156b92a83b501f8e331f21cd035c2e1/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
>     - shard-lnl:          [FAIL][97] ([Intel XE#301]) -> [PASS][98]
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5329-4a1a395fa156b92a83b501f8e331f21cd035c2e1/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
>     - shard-lnl:          [FAIL][99] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][100] +1 other test pass
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5329-4a1a395fa156b92a83b501f8e331f21cd035c2e1/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
> 
>   * igt@xe_module_load@many-reload:
>     - shard-bmg:          [ABORT][101] ([Intel XE#8007]) -> [PASS][102] +1 other test pass
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5329-4a1a395fa156b92a83b501f8e331f21cd035c2e1/shard-bmg-10/igt@xe_module_load@many-reload.html
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-bmg-6/igt@xe_module_load@many-reload.html
> 
>   * igt@xe_wedged@wedged-mode-toggle:
>     - shard-lnl:          [ABORT][103] ([Intel XE#8007]) -> [PASS][104]
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5329-4a1a395fa156b92a83b501f8e331f21cd035c2e1/shard-lnl-5/igt@xe_wedged@wedged-mode-toggle.html
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-lnl-8/igt@xe_wedged@wedged-mode-toggle.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-bmg:          [FAIL][105] ([Intel XE#1729] / [Intel XE#7424]) -> [SKIP][106] ([Intel XE#2426] / [Intel XE#5848])
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5329-4a1a395fa156b92a83b501f8e331f21cd035c2e1/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern.html
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-bmg:          [SKIP][107] ([Intel XE#2509] / [Intel XE#7437]) -> [SKIP][108] ([Intel XE#2426] / [Intel XE#5848])
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5329-4a1a395fa156b92a83b501f8e331f21cd035c2e1/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
>   [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
>   [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>   [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
>   [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>   [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
>   [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
>   [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
>   [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
>   [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
>   [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
>   [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
>   [Intel XE#3157]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3157
>   [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
>   [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
>   [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>   [Intel XE#4210]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4210
>   [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
>   [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
>   [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
>   [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
>   [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
>   [Intel XE#6035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035
>   [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
>   [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
>   [Intel XE#6507]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
>   [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
>   [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
>   [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
>   [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
>   [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
>   [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
>   [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
>   [Intel XE#7345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345
>   [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
>   [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
>   [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
>   [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
>   [Intel XE#7366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7366
>   [Intel XE#7369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7369
>   [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
>   [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
>   [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
>   [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
>   [Intel XE#7413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7413
>   [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
>   [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
>   [Intel XE#7429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429
>   [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
>   [Intel XE#7467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7467
>   [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
>   [Intel XE#7571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571
>   [Intel XE#7599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599
>   [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
>   [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
>   [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
>   [Intel XE#7695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695
>   [Intel XE#7724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7724
>   [Intel XE#7760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760
>   [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
>   [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
>   [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
>   [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
>   [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
>   [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
>   [Intel XE#8303]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8303
>   [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
>   [Intel XE#8365]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8365
>   [Intel XE#8370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370
>   [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
>   [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-5329-4a1a395fa156b92a83b501f8e331f21cd035c2e1 -> xe-pw-168836v2
> 
>   IGT_8989: a8e2cbd2854d7980a9eccecc6e0c801d0824b88f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-5329-4a1a395fa156b92a83b501f8e331f21cd035c2e1: 4a1a395fa156b92a83b501f8e331f21cd035c2e1
>   xe-pw-168836v2: 168836v2
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168836v2/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
