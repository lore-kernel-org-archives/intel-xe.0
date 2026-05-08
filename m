Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74625CD342F
	for <intel-xe@archiver.kernel.org>; Fri,  8 May 2026 16:50:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3439B10F566;
	Fri,  8 May 2026 16:50:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bjxvt/vw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FECF10F566
 for <intel-xe@lists.freedesktop.org>; Fri,  8 May 2026 16:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778259024; x=1809795024;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=HtsQ/F+5XcTJJQrrA5h1rGtztS9lUEguIE4tEp2u/Pg=;
 b=bjxvt/vw9TcAOdytFLKUiwLxcVoVxNkt6JIT/tbf73muQwYlfSGISGkt
 /2mYiukO7znx9IYoLuK0pLC4TjtBQ+jcKZd3DBo3jF8a/BaJ/jDENAGCr
 YV0aWD13Yxa4pbgdmVrO1VcRdvCBBWBeLyP/q2GzQrjYEidI9BjQQUFOb
 Tj0hp5d1zwtIDmYxGqAdm+AT5HCOh2sGVIENhFoqikBakOU5y7Nf5cI8f
 IKuzagoL9CNkZ6fFwa8N2vyY+LKZpBCLa7YoT+2hFCCIviT0xCHplcvTB
 +9QWeFjzVTShPQhmwWz2Apo4ileNr5Ue/0yLfP9gBhLsnIqPnDPRKjyz1 w==;
X-CSE-ConnectionGUID: zyNLmthdSqm9a4hhAQ5W9A==
X-CSE-MsgGUID: kFu2mZFzSTapdvBgWgU82Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11780"; a="66759493"
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; d="scan'208";a="66759493"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2026 09:50:24 -0700
X-CSE-ConnectionGUID: M0Am1tb0TSq2jZgp/5UUNA==
X-CSE-MsgGUID: 7am4lP41QsyytlTDuxFbIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; d="scan'208";a="260263521"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2026 09:50:23 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 8 May 2026 09:50:23 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 8 May 2026 09:50:23 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.27) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 8 May 2026 09:50:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=asNhq3aevB/m0RXT4byd23rh7UTBapqVddO0N1lDsQl4RTlUE9SmauQZc9RAquJMHSChOOilV0hvVOr0JZGRrkfH9rsKAcU+xmoW+njOrikrB/z4jE1o1olJnR/t45eO4HK/9u5YafhzMf0FZaVu1PKpumEZWFphT18PNkKZAo0kC0ydjI04fUjHefBaGwA/Mt+7ozVxhvssTMly832s+C4pjDV04ki0zTLkFSuNS4TtBF1sNSKSo/RZpQhofPGdeNI4FrA4YSRR2/Y4Wp9lujZV3K4ae4WUNvdEyBf4w+Tv5XQP4WolJ9lT3lIYKsIDhaLyM/ZGFkvQb2xTrHKE8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NZ+LZS8aOEcMEpOTibBsvbV7Ios6fHfN22OQNi+93V8=;
 b=Tv6YKENy3HyR4MfxoQ/eGHjb8ekjgs72IGFJbFjsDp5+vzDkjPvBs5IW2b7ZoQdW3mOYtGjSLHpmivlr2GCKc6gJhwdpSFoiJ7K3EPM/20iAmWlJUhSCzk4GWCUefkRxRw8Y5ry8BMFXlA44Ak8Uah/6dpZSSl2f8cemNYgJf6YFA1sX+1ndBI/gQsF0VmQjaJqZvMvynMeT5AKVutoWpykImpAHkIXAnh1MXdq3sRDX4H8mtLgBFDGpyYdOB9EmdBLagYkwKUgKB7wgpDbuSldrAOzmxKbg2Zy49FmHLtvhoIy0zGcofgK8UrJu5HAgX+Pmqrkp9Z/LIkMWoc2YXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DM4PR11MB6357.namprd11.prod.outlook.com (2603:10b6:8:b5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Fri, 8 May
 2026 16:50:19 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9891.019; Fri, 8 May 2026
 16:50:19 +0000
Date: Fri, 8 May 2026 09:50:17 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZVTEw6IGZhaWx1?=
 =?utf-8?Q?re_for_drm=2Fxe=3A_Mak?= =?utf-8?Q?e?= decision to use Xe2-style
 blitter instructions a feature flag
Message-ID: <20260508165017.GQ2131374@mdroper-desk1.amr.corp.intel.com>
References: <20260507-xe2_copy-v1-1-26506381b821@intel.com>
 <177823625317.50384.2752224703665758790@5ab824fced77>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <177823625317.50384.2752224703665758790@5ab824fced77>
X-ClientProxiedBy: SJ0PR03CA0166.namprd03.prod.outlook.com
 (2603:10b6:a03:338::21) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DM4PR11MB6357:EE_
X-MS-Office365-Filtering-Correlation-Id: dfa8b155-be2f-4f66-9374-08dead21e345
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|22082099003|56012099003|18002099003|3023799003;
X-Microsoft-Antispam-Message-Info: nx4EO17xC1R4rDCymGyYUH2t564Zvj6ivyfLoZ/5QbS5RPwUEbMhwTxMWJoOm30WSoLRiDUUnSrcbFHJRRLr+HzLCg7i3M0vbnHtrXJzfNv1IRS/tXhKbOlr0hRbiC7C4uDUyw4lYgw/LJfSOTbwWyBKyTHfAebPRCPsS4vzJHF/GWnhq3rSlt1J1AWOEu8T5bi6//OgANKFAzVfCYzuxWu9dwwW+G0i64xdXjM42gx3CVDQPgG/+PJFlRMVkEN7lYb/aw3+cPejdMrSSiUScRTXAEamG+Qmf1GkVG0cjxnQMAJGhIC6SsxCmw8cdySrAUutkYtr0fuYP+7jU0q+YG4qn36krUPVjdmNZAPogQMUwFy7nrE4DLpquwY6PZVn57XACnAHAFBQojcZdWtL3c2a4ydwdBbJBVojM7pvVCPyUl8Ik/hdri72LPOYAZwXfESYjU0zqBf9cjFqQ0cW4JBVIgThmbGlkkI0GtC3n65V0m0ExMPgvpGHPX++qxCab0DzANq+JdsQuzmo1otcvPySHk6zqs9VVJ7OkDzXJjTV4xRPLGSw0Hs/sutGagdZMB3niFephUnpncSJ9Tr6+vgNp2BPfjmC0EcdtF4EObP4bRog8d0zXEFmIXd2Yrvkd/iVtAeSdfn5Bn6B5DlJPQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(22082099003)(56012099003)(18002099003)(3023799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VSn2It+LR/iaHKo6MnTmbIF5iGKM3hb+kp2R1+TelNmIbnd5iBQaOHs4gz0/?=
 =?us-ascii?Q?gI0HcnjlLEqrft45f1xZQS9pK28aaXKdCt7o0tFIgi4qCJJudYywWRwS1l7u?=
 =?us-ascii?Q?AR8JrTlzKKVDTe85zzFwMMbx9LL37uWAhqb7W0kaaKU//sINzb0IPybkiRsK?=
 =?us-ascii?Q?dN/K+qdoMV7P9Itn3FClcqISoK3vC1kOyfJROxBnCXz0A+Vd7ORevT9TtKPy?=
 =?us-ascii?Q?cKQPM1zCe8dlmb8tvU07sNhYRgI1CsBQaYfIj0tl+YlShg/1U8azbqG8n4zV?=
 =?us-ascii?Q?3ILJKnUJMvHQMqd1hU1d25B4VuEUFsj93mUjzbPS+l7LJbb7uU5I49Jd6Yic?=
 =?us-ascii?Q?/y5hDSR0CaMWkg/u6tDX++BUXESvbEloNfr5/4EOhrd4alRWnCs2LTmpZ5Sp?=
 =?us-ascii?Q?rAVmCPCnwUZRnZTo+8cTDHL2alLBCKT863fSPi5WiVFrkExs0R9ADd5Gb7UP?=
 =?us-ascii?Q?oQ7SLIYShoqfVgY7TlJu3l5q190UKy5coC3R8iRUdLXJYZBrtWbkpNhROJSX?=
 =?us-ascii?Q?uW/mm60GWUj9P1SnHU2iUkcszvo6CtCBeMBxJkpzozQTg3t7/NmQXHilRr9I?=
 =?us-ascii?Q?w0ICu7GuYi3XjLKkYgQZ1oc/GSs/T5z8+V0nLVfLsDENyn1mObEUJ1tmREHL?=
 =?us-ascii?Q?zvNSGrvo5JkG9Vw1mwrYSyOA7pl2nYy27vFRqG7fUpG4TaS1tfkoiCGTP4qt?=
 =?us-ascii?Q?gXa2XkhTXgMOSQo4h0LCj4klEVKLFhW7Dlg4aVsux7FAAJsdnWOYR6xF5Eov?=
 =?us-ascii?Q?3aCe04YLo6XIW4hwbs1D51q6e/NqIO7aH0Xdf75VG3g+WThpJw2GK2UeMqCk?=
 =?us-ascii?Q?s8E6cuzcxzJND70KYtCAX8+CmTBy3mbqEDCqd43cc96gjX5r6OFYWkUXQRyE?=
 =?us-ascii?Q?G2iJuj3A6rZN9FUN0UX4voVQb4Mb0ktiT5tf7i/mwbI1biAUNd17uZLZj+Fv?=
 =?us-ascii?Q?8rjm0bOzpkAhoq0igYEg3+Ysr+47c6mEFZVm4LyPB8cxsqHlggLrbh4oDOn1?=
 =?us-ascii?Q?Vo753CnhY8eBHnyMo4f2dzAExbn8OFhBjLC3QvgeYT4vgKkgeGrH5G7z5tzI?=
 =?us-ascii?Q?ziNML4F8qyYWvpsZ6V9VKewn/wy/4HGv/idIxBtz0ILJLirDeDBC7Nb8MZib?=
 =?us-ascii?Q?cDY+uDAztKLavmro8mUCpX3O9/LG9jweSjTch6B+R8actGTPkaNTsmylZ31P?=
 =?us-ascii?Q?7CvyLJdgLmsYIS4siqWbLcC7cCbEAGmSfmdHHFvPGUR6G91ZC0nd2qb12fhP?=
 =?us-ascii?Q?XTBWGEztq5dU3B6d513ffcdBCXdKX5ZkTx5s6tp76gi+3+zOmQ11/+kCrmOQ?=
 =?us-ascii?Q?mrPt02gyjMEYIzM79Ln424VHDZWHgN+DZm4jiTZRlbvf2wvg7Wv5L+AgeRrO?=
 =?us-ascii?Q?DO94r9LLi+OirEisB1MT7ajy080rbch7rvpBReN2+ggroFUYQ0RU0FvLTz0J?=
 =?us-ascii?Q?Bsjw+mKkajm8/hZ+8pOmjzJGq+i9BzT57zOy8Q9bVlU3DzpaYHnQnUlq3I/C?=
 =?us-ascii?Q?+PRMy/812kQMXIvtLQhy46s8Q2rngD2KUJ2vhGAmQZx4E5u3t+Eafhu3avZZ?=
 =?us-ascii?Q?Xk/Grw8jyXqg0WPtxOLs8BC1xsfuAdKxSIfYQM8Jhr3aLzcMWt1NIsMe/zdL?=
 =?us-ascii?Q?zA3JyO9seoJ3ClvY61nAGD0ogkz+CYCfhLxfCNQQ0EdgukuRkr3+ALK1FOw8?=
 =?us-ascii?Q?8Xov4MS/aKRlMW99UyCkcmA6ldy9UKL92pNdAs54zF9Qspzphdm2zjMgSQp6?=
 =?us-ascii?Q?++UjV/TS7TjgOb6usWidfGqG1AxzpRk=3D?=
X-Exchange-RoutingPolicyChecked: fueqyPfII+iavlFNHSDbS66eY/1vSDGog7g3EFOi5ceH0lzl1NuMybxq8ftNi0qQyFdrw6oYStyyVPUrrbEvhptl0NNHWhZ6Yld+gUEf3w6WOl+rvXH6VUIM4UCkFbyQky+0fnqKASfU+mCiMucbqLo5eUr8pHCnkC4GK/9t78wVq7xiafhYM7Nz1JKJu1A6baw3kaOdbL4ZtVkerOMdiJFdM+Kuuk4Jbj5kH7pbjvzqzSOSeFs6dCfZ2B8RAE/02uVn7U6MKubcgB8HA8O87ibLPIgyE/jmhxDhyoEnIVui4Q94K6VVvlIm3S7egbPhcVY5Pkko/bvzF+V98zxZ0A==
X-MS-Exchange-CrossTenant-Network-Message-Id: dfa8b155-be2f-4f66-9374-08dead21e345
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 16:50:19.4376 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kS3FYutlsKk+GOCEITo3CZkZROiSVBMpvylPPEKdi7kodL3nLi7W/NkytZ02lMUuFdgQI48q8vOAQQqIc8g9E9fDTgSqQCbfVKzUdWAqNF4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6357
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

On Fri, May 08, 2026 at 10:30:53AM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe: Make decision to use Xe2-style blitter instructions a feature flag
> URL   : https://patchwork.freedesktop.org/series/166165/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-5017-99d679968a150a5f062fcdceb2e31211cef81143_FULL -> xe-pw-166165v1_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-166165v1_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-166165v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-166165v1_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_exec_system_allocator@fault-process-benchmark:
>     - shard-bmg:          [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5017-99d679968a150a5f062fcdceb2e31211cef81143/shard-bmg-3/igt@xe_exec_system_allocator@fault-process-benchmark.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166165v1/shard-bmg-2/igt@xe_exec_system_allocator@fault-process-benchmark.html
> 
>   * igt@xe_exec_system_allocator@process-many-large-execqueues-new:
>     - shard-bmg:          NOTRUN -> [ABORT][3]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166165v1/shard-bmg-4/igt@xe_exec_system_allocator@process-many-large-execqueues-new.html
>     - shard-lnl:          [PASS][4] -> [ABORT][5]
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5017-99d679968a150a5f062fcdceb2e31211cef81143/shard-lnl-5/igt@xe_exec_system_allocator@process-many-large-execqueues-new.html
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166165v1/shard-lnl-5/igt@xe_exec_system_allocator@process-many-large-execqueues-new.html

These xe_exec_system_allocator failures have been showing up on a few
other recent patches as well, and cibuglog shows a bunch of them in the
'unknown failures' bucket too, so they're not caused by this patch.

Applied to drm-xe-next (with the small kerneldoc fix).  Thanks Bala for
the review.


Matt

> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-166165v1_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
>     - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#2327]) +1 other test skip
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166165v1/shard-bmg-10/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:
>     - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2652]) +8 other tests skip
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166165v1/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2.html
> 
>   * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc:
>     - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2887]) +2 other tests skip
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166165v1/shard-bmg-10/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc.html
> 
>   * igt@kms_chamelium_color@ctm-0-75:
>     - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2325] / [Intel XE#7358])
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166165v1/shard-bmg-10/igt@kms_chamelium_color@ctm-0-75.html
> 
>   * igt@kms_chamelium_sharpness_filter@filter-basic:
>     - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#6507])
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166165v1/shard-bmg-10/igt@kms_chamelium_sharpness_filter@filter-basic.html
> 
>   * igt@kms_content_protection@atomic:
>     - shard-bmg:          NOTRUN -> [FAIL][11] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +1 other test fail
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166165v1/shard-bmg-10/igt@kms_content_protection@atomic.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x170:
>     - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2321] / [Intel XE#7355])
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166165v1/shard-bmg-10/igt@kms_cursor_crc@cursor-onscreen-512x170.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
>     - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2286] / [Intel XE#6035])
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166165v1/shard-bmg-10/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
>     - shard-lnl:          [PASS][14] -> [FAIL][15] ([Intel XE#301]) +1 other test fail
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5017-99d679968a150a5f062fcdceb2e31211cef81143/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166165v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
>     - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#7178] / [Intel XE#7351])
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166165v1/shard-bmg-10/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2311]) +7 other tests skip
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166165v1/shard-bmg-10/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-render:
>     - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#7061] / [Intel XE#7356]) +1 other test skip
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166165v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
>     - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#4141]) +1 other test skip
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166165v1/shard-bmg-10/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2313]) +9 other tests skip
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166165v1/shard-bmg-10/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f:
>     - shard-bmg:          [PASS][21] -> [SKIP][22] ([Intel XE#7915]) +1 other test skip
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5017-99d679968a150a5f062fcdceb2e31211cef81143/shard-bmg-9/igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f.html
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166165v1/shard-bmg-1/igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f.html
> 
>   * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
>     - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#4090] / [Intel XE#7443])
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166165v1/shard-bmg-10/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
> 
>   * igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping:
>     - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#7283])
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166165v1/shard-bmg-10/igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping.html
> 
>   * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
>     - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#1489])
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166165v1/shard-bmg-10/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html
> 
>   * igt@kms_psr@fbc-psr2-primary-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#2234] / [Intel XE#2850]) +1 other test skip
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166165v1/shard-bmg-10/igt@kms_psr@fbc-psr2-primary-blt.html
> 
>   * igt@kms_sharpness_filter@invalid-plane-with-filter:
>     - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#6503])
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166165v1/shard-bmg-10/igt@kms_sharpness_filter@invalid-plane-with-filter.html
> 
>   * igt@kms_universal_plane@universal-plane-sanity:
>     - shard-bmg:          [PASS][28] -> [ABORT][29] ([Intel XE#5545] / [Intel XE#6652] / [Intel XE#7814]) +1 other test abort
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5017-99d679968a150a5f062fcdceb2e31211cef81143/shard-bmg-3/igt@kms_universal_plane@universal-plane-sanity.html
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166165v1/shard-bmg-2/igt@kms_universal_plane@universal-plane-sanity.html
> 
>   * igt@kms_vrr@lobf:
>     - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2168] / [Intel XE#7444])
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166165v1/shard-bmg-10/igt@kms_vrr@lobf.html
> 
>   * igt@xe_eudebug@discovery-race:
>     - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#7636]) +2 other tests skip
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166165v1/shard-bmg-10/igt@xe_eudebug@discovery-race.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:
>     - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2322] / [Intel XE#7372])
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166165v1/shard-bmg-10/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind.html
> 
>   * igt@xe_exec_fault_mode@twice-multi-queue-imm:
>     - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#7136]) +1 other test skip
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166165v1/shard-bmg-10/igt@xe_exec_fault_mode@twice-multi-queue-imm.html
> 
>   * igt@xe_exec_multi_queue@two-queues-basic-smem:
>     - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#6874]) +4 other tests skip
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166165v1/shard-bmg-10/igt@xe_exec_multi_queue@two-queues-basic-smem.html
> 
>   * igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr-invalidate-race:
>     - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#7138]) +1 other test skip
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166165v1/shard-bmg-10/igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr-invalidate-race.html
> 
>   * igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:
>     - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#6281] / [Intel XE#7426])
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166165v1/shard-bmg-10/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html
> 
>   * igt@xe_multigpu_svm@mgpu-migration-prefetch:
>     - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#6964])
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166165v1/shard-bmg-10/igt@xe_multigpu_svm@mgpu-migration-prefetch.html
> 
>   * igt@xe_pat@l2-flush-opt-svm-pat-restrict:
>     - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#7590])
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166165v1/shard-bmg-10/igt@xe_pat@l2-flush-opt-svm-pat-restrict.html
> 
>   * igt@xe_pat@pt-caching:
>     - shard-bmg:          [PASS][39] -> [ABORT][40] ([Intel XE#7893])
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5017-99d679968a150a5f062fcdceb2e31211cef81143/shard-bmg-1/igt@xe_pat@pt-caching.html
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166165v1/shard-bmg-8/igt@xe_pat@pt-caching.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
>     - shard-lnl:          [FAIL][41] ([Intel XE#301]) -> [PASS][42] +1 other test pass
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5017-99d679968a150a5f062fcdceb2e31211cef81143/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166165v1/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
> 
>   * igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010:
>     - shard-bmg:          [SKIP][43] ([Intel XE#7915]) -> [PASS][44] +1 other test pass
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5017-99d679968a150a5f062fcdceb2e31211cef81143/shard-bmg-1/igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010.html
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166165v1/shard-bmg-10/igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010.html
> 
>   * igt@xe_wedged@wedged-mode-toggle:
>     - shard-bmg:          [ABORT][45] -> [PASS][46]
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5017-99d679968a150a5f062fcdceb2e31211cef81143/shard-bmg-4/igt@xe_wedged@wedged-mode-toggle.html
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166165v1/shard-bmg-4/igt@xe_wedged@wedged-mode-toggle.html
> 
>   
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
>   [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>   [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
>   [Intel XE#4090]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090
>   [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>   [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
>   [Intel XE#6035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035
>   [Intel XE#6281]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6281
>   [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
>   [Intel XE#6507]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507
>   [Intel XE#6652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652
>   [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
>   [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
>   [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
>   [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
>   [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
>   [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
>   [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
>   [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
>   [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
>   [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
>   [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
>   [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
>   [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
>   [Intel XE#7426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7426
>   [Intel XE#7443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7443
>   [Intel XE#7444]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7444
>   [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
>   [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
>   [Intel XE#7814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7814
>   [Intel XE#7893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7893
>   [Intel XE#7915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-5017-99d679968a150a5f062fcdceb2e31211cef81143 -> xe-pw-166165v1
> 
>   IGT_8899: 3e5747e536f148bf232049e49a00e2b683f91a83 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-5017-99d679968a150a5f062fcdceb2e31211cef81143: 99d679968a150a5f062fcdceb2e31211cef81143
>   xe-pw-166165v1: 166165v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166165v1/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
