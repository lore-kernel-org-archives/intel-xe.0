Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E6D9C27C4F
	for <intel-xe@archiver.kernel.org>; Tue, 18 Jun 2024 23:04:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DF1610E7EF;
	Tue, 18 Jun 2024 23:04:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SvXwnG+a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 534F410E7EF
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Jun 2024 23:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718751864; x=1750287864;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ajX7GOKNQI1TU4Y3CSzzMi7SIPkQXqXkmdwTxdVykZk=;
 b=SvXwnG+aSOThAfUi3Q6AMgyEOYtYPZ69dUXE67PgTizwKeQOZlE7CHeQ
 QX+gRcvMmAfgNxVkBf7s6MIuYs/3qU6yPGaQgWICo54nD7D/SGZjCErUe
 yLM3ZvrPvn/9qMJwoSf9At05O7SbHReticUM89opy515la7MMqkCEIBi1
 8CDb6LkSSz/w0kmmSj7Xw0sCDaJTIe99Zp4CjQDudzzQ/Ixkw5vLXZH5g
 Yc3ExOZ//ss4nu473tT8R3R5dyBS1BXYe/96yj8wo+d8V+eStqLVsFX0w
 TravoWerRchaQW4QC1Y1x0c/PB5FYXxnZAELT6bTh6BoXlpIl0bHaCcB2 w==;
X-CSE-ConnectionGUID: N5bn6mBuSs21sZF31ta8dQ==
X-CSE-MsgGUID: 8KDlyDjfRI2kU2c4Xagfkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="41072152"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="41072152"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 16:04:22 -0700
X-CSE-ConnectionGUID: MaacLZ/2Sgm0icZrCjZ9FQ==
X-CSE-MsgGUID: 8P1Jcx0yRc+pEQH0foRhuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="72917350"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Jun 2024 16:04:14 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 18 Jun 2024 16:04:10 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 18 Jun 2024 16:04:10 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 18 Jun 2024 16:04:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dDXwfJgjs1lnyp5p2YjM05mV1ocd+dCam/ZobOkVFGQS3e0ntFH+m9KyA8Om6II45Xmdcpcqwo6emdB9ijzZelPTX6Qirkbg3SaMxqS3nRnYLB1iE6ne04FFbTUUPL9wl++Kh6EL4KRspL0yWB80717sUf8KyOz9wn8jgI5kcqYgb2mpCzZnis2ho/9LnSCupy0BN1ZsdWzuSlSeFiwL5H5RuI7ul7Cg3BaRGUy56MOhucFYZyup0C14r5jMhJJrD8MOh6H72LeyCMfwsOsavkXzypRpTpMaD3hGxAt3cfmYm1S8LA0yyRG5CnOvrjhTsJe8BSlmImAiGcmkAqlJ2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q2ST6jF2Bmk385wz4QmzLRLjRgUiIkwBia+NvNU0j8E=;
 b=II/vHBEmG6mBtteT58NjAyRE2gZ3sU8fTHEVECvOLlC2umMQAYjlICxnwY+cSG+z741yfi/LHECvG11KJWaDmR6tA0waKl7/UyuS3cd3iyThppHB6DuCMVB4GTVcC+gG7+aljEgx0KwakDRfWI/g4W9D3CPzLQabC+Nd5aKiQkxJkRuDY/mv5VqaTT1sxKYGiECRoW7JhpU7oVJGXnLodCjG4LNMxtUw0LF8ZJphwp9r8lt8Jr0zvFXVGQ/xPamrajIxC/vectFu8SBvHBkIZBmHhG5+vNsULr3w6y5JylfaRmX8oqn9zYHWfEQWgR0p8UruhDeACJv0G1NBs5UCZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CO1PR11MB5028.namprd11.prod.outlook.com (2603:10b6:303:9a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Tue, 18 Jun
 2024 23:04:08 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%3]) with mapi id 15.20.7677.030; Tue, 18 Jun 2024
 23:04:08 +0000
Date: Tue, 18 Jun 2024 16:04:05 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH v2 1/2] drm/xe/rtp: Prepare RTP for VF actions
Message-ID: <20240618230405.GR2905419@mdroper-desk1.amr.corp.intel.com>
References: <20240618220026.773-1-michal.wajdeczko@intel.com>
 <20240618220026.773-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240618220026.773-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BY3PR04CA0019.namprd04.prod.outlook.com
 (2603:10b6:a03:217::24) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CO1PR11MB5028:EE_
X-MS-Office365-Filtering-Correlation-Id: dae183db-ee49-453e-b868-08dc8feaf57f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|1800799021|366013|376011;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6ihvbZL7mFzom4Mngu68W8oi6mMPvGM5axk5hOW9hmq8k6+u7DLQucskmI5M?=
 =?us-ascii?Q?9tdk23IZUCqaEY4CoPX2EfSMS7RFrr6+GwgOPNSXmi7IfOEQouSG9Y/Fqs+w?=
 =?us-ascii?Q?Ipt/1/R2oAIUstJGuR9jM/6E34MNBy3WXJ5hmBtANm76Yob1zV9bVK0BJyAS?=
 =?us-ascii?Q?L2sKpDSQhR1wp4at3h+hnDJT0qupc9gbuxOVwHLWjCCOHElHzJrudbRgipFu?=
 =?us-ascii?Q?OhtUHkHcqkrZ9UNUEVJfTdfG5uI+jK0QNwWUbgoimhEVIetNUsj3pLI9EOPA?=
 =?us-ascii?Q?0FDqu36UZm25j6Xn9sys2mnpaiBzyb9mKpDBsifJbkbd3AsiWFdemaWfN2V6?=
 =?us-ascii?Q?u14qnDek8WSsvO4D0Ll1C+6MKhHWfD6aK938rHfY2T+Z8V2x2IkEg1usgzdH?=
 =?us-ascii?Q?nb7jAKvYDdh+ORG+olDkUpOoRDspt6ivYnsaisRj87rcW5lmhpyWl979VZA7?=
 =?us-ascii?Q?EGul7IHN4Cta3Ia7IehgMQgwEhRdY5PKv+AJy/uSJOpKBW7xpEJAnQzJSPDw?=
 =?us-ascii?Q?4dO9dKA4lzh+93Gkt/IQlDLFxvnvW8xDqQVlLrNctx+qGnup5wu0cM85fxQB?=
 =?us-ascii?Q?uAcH2oIh4qmrmrsiJg0c3FW74Zvd9kqOy/N2dknL/UhATlE9vW6vGy+W291Y?=
 =?us-ascii?Q?Ni2OwfNLHDerOcAhv8ocsRIhIg2WYH+v2ROsoB+stezr6BZA0W4JJ/wVF6en?=
 =?us-ascii?Q?hmj+WthuijVqGbxRpncMtOr4cLYAO/S/OEOTswIZijWg8inU6U2yi9M4YYeY?=
 =?us-ascii?Q?LbqegufkgL0MxnUaplZ1evTRRiKEBwHah6yqbyR6FT206aIKQ+XFR8Fz/egi?=
 =?us-ascii?Q?iKgcZ2EnVK+nw0+xuB/eNHR7ybRYZfCgq1djymv90wQZdHJCXmtHbAR/8leS?=
 =?us-ascii?Q?RBeya25wpy/HI8WwrEjj5Rppp1stSymBooMlAStZ5v6Mp0nOsjOTczEZAB3R?=
 =?us-ascii?Q?eXPeVz5JmmaLsaE47Nd+nHky3ILujHgFOtvtlREHz6e6puhMazW9D8WjFepn?=
 =?us-ascii?Q?qGRxtLlQS9GQUQzNTHyqKAOp+osoIezb7XYLbIigtNPcpMy9ukLU5stTZijK?=
 =?us-ascii?Q?aErzMvqszQi61ILXFKbUmlvLZrbeTRW1Tr5EgX3YoRciTNGzsVkBJHW62lTG?=
 =?us-ascii?Q?stGhYlMBzD77bsesFBlxdilX5ks65MHcNxZdM88FGqd5bjEuBAyt19mZyZoU?=
 =?us-ascii?Q?OCLvYK7c5LHhx0pB7f4eLHaaHU2BTGc42nY0grdYYfhbuKk5p2tivbYASDde?=
 =?us-ascii?Q?13RKiAKX/pAto3dyAtGG5l3cXOOrIgr9ABxzbM9yHKT3+jeJplH42yYdVLuG?=
 =?us-ascii?Q?QK3DZx3d3EXAADLroZRoWG30?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(1800799021)(366013)(376011); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rYA6lQ2k+dhUZlSWOwXRXxPiwYHb4nVsKfBDKW7ce+C91dGkK+wZSHC1b7on?=
 =?us-ascii?Q?K/7/Z1euWZt34dhwwqW6OcLifTJhR5ylJIkK9zMqI66ao5N4Dj2N7cdhr1Sv?=
 =?us-ascii?Q?x45Z7z6tLUeggMEhFclA5eq8h2NAwcU1r7IThc2/f7A/0Sqq7P1K4jm68hdf?=
 =?us-ascii?Q?FEmggu0nLdcsgySYrUeFMlDFEe5ukwe9YX+dihKJ7A9Bx3vW6LaHREK+2/zY?=
 =?us-ascii?Q?QTFgly0re1VNrRubNiIgdH4hzpVSa4do7l5ZDjOqPHZy1JjgSJ3koL3A6OKz?=
 =?us-ascii?Q?X43AVlJuMaKaDLCm8zWjrdmxwK9nwNY5m9lbcvR8q/+MYwuE+HT4BLIp94nz?=
 =?us-ascii?Q?soh3Evg98FqFvH7/QpKRLy0XUXelbMrqfz2Y6X2TRjJQU3sWzWzJylAJP+Nb?=
 =?us-ascii?Q?yItKCCU1k56ahgmuK4JOvkYTllLzmNDWKJZqeRf5MKN+cAjVaeZs0nFBMfeT?=
 =?us-ascii?Q?854jo3eBReB/i2fZ0Zt7U6JP79lf/gniSH5aC3p0t6JrYDNdLPwgS0FFmzR0?=
 =?us-ascii?Q?pyg5zshvoXXimh1tAn/D2uZE2f0kz49NcZbTzM5o1qATW2NMKCjVZuhpBhv5?=
 =?us-ascii?Q?AuX6ED8LvWotMOY8MgT276SHu+DV8cxsxb9p5HJaBuY3Bg7KMhyoSvOj4p3T?=
 =?us-ascii?Q?ofvqmwhEUgAR89IvSbMs+1eCjVng/kvgIBZyPvYVVrj46laZ0H+vx98MvXM6?=
 =?us-ascii?Q?5c/j3dRTQOHiW4b56sMGNhWksWpR9OA4K6G3eE+a9237fs/UZ/0dksG9mSTJ?=
 =?us-ascii?Q?NXW8Zc6zEvCqz8Aw3T7tA4g6ZNIFCH0SWrFkjFLv6odTvaLB2UoqnbGJkNz6?=
 =?us-ascii?Q?ysIEdlHBezoW/dm4k9HaAPB1RTLPypCAhvCkkhb/BUJeMmR+uDw1MT7irBDi?=
 =?us-ascii?Q?TeP1qsS4lpIq+tAQFHdq03tgvhvX3O9g+YDKfhenpWumAOYF1uWc/owTXuFE?=
 =?us-ascii?Q?MU4KbfQj+kc4meTrKX8RI0KWhLvnxPI969dMh7ude3g5a20/qwTu+6ZoTfsG?=
 =?us-ascii?Q?lTn7h23oVTYElQDk2LfExMib7yGR7e8phn1CKgXKU6RkNduFA5bZvV71TDuS?=
 =?us-ascii?Q?v1/8gLlJVDVNqZrZPdMN8XnJS8jrXUseYiC6nS162n9klIfJh9QJh1DjFh7C?=
 =?us-ascii?Q?O4Eor4Xe8jwE+PtYvO7TpJPvxNFrUjjr3l8mV3ZnqU2t4xkAwg/5LKKjpbqP?=
 =?us-ascii?Q?HVHSIfxtxADyUQbti06/uYkRAjjJKHyEUVKBfhC0zKKnfu0KnWRXA72rhZWP?=
 =?us-ascii?Q?i8ajU6GBibc+eM4UmuwyrnPazoSs8OOo//0pyX5wSif45hEQSt94wT2812kB?=
 =?us-ascii?Q?T2wuYvOeybc9DT+H96HG0pchYj1SX86rpnRwZtwnl6Pr9UjfizjdizzSJ6SZ?=
 =?us-ascii?Q?I0TjCoVIaLmMzrC8ecbWDllXQ/fy2YPeZwPtsGcxT85xN5kK2HhvXNtR0khs?=
 =?us-ascii?Q?73HM8Sw6QV3kxnyTRH6kcGcjCOx8xy12ldenX/hkKI4BTBkxcghihEvB/NmL?=
 =?us-ascii?Q?thn+6p49vAvgnDIt8Pa2+8REIabUcrOd+4we7JDUIoO8CH5/OnUzYnFq3IG9?=
 =?us-ascii?Q?Ji3vovJjM46YerdBGGBE0K9+PmfbAkjSqppqQOepQMGsQOT53+I8HG+HoK3N?=
 =?us-ascii?Q?8A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dae183db-ee49-453e-b868-08dc8feaf57f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2024 23:04:08.5046 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OC61ClsgBAd+4vQ0UNXqSVmROqxD+L5g2iZ9oY2J0OBtzfsn9uoJPE7n///gN+JbP25UhJLZYWUpCx/nx2lyWr264u10OuB2WlGp50oNJc8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5028
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

On Wed, Jun 19, 2024 at 12:00:25AM +0200, Michal Wajdeczko wrote:
> We don't want any current RTP actions to be processed by the VF
> drivers, but instead of blocking them completely, add new flags
> that would allow VF-ready or VF-only actions to be added later.

I suspect that if we ever wind up having VF-and-PF or VF-only RTP
programming, we're actually going to need some additional changes to RTP
beyond this series.  As far as I know, the only registers that the VF
exposes for CPU access reside in the sgunit (e.g., bspec 53221), and RTP
doesn't currently have the ability to process programming for registers
outside the GT.  I.e., XE_RTP_PROCESS_CTX_INITIALIZER() currently only
accepts either an xe_gt or an xe_hw_engine as the scope of RTP -> SR
processing and both the GT and engine registers are outside the domain
of the VF KMD.

While we could certainly update RTP to work at the tile level (which
would also allow us to convert xe_wa_apply_tile_workarounds() to RTP),
I'm wondering if we'd ever use it given how few registers the VF KMD
actually has access to and how unlikely those specific registers are to
be the target of a workaround.

Personally I think it might be worth just sitting on this until we have
a specific workaround or tuning that requires RTP inside the VF.  Then
we'll have a better idea of what kind of other changes we need to
support such workarounds/tuning and we can upstream and review
everything together.


Matt

> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> ---
> v2: use entry->flags instead of rules (Lucas)
> ---
>  drivers/gpu/drm/xe/xe_rtp.c       | 18 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_rtp_types.h |  2 ++
>  2 files changed, 20 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
> index ac31cba1dbea..a9525e056019 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.c
> +++ b/drivers/gpu/drm/xe/xe_rtp.c
> @@ -13,6 +13,7 @@
>  #include "xe_gt_topology.h"
>  #include "xe_macros.h"
>  #include "xe_reg_sr.h"
> +#include "xe_sriov.h"
>  
>  /**
>   * DOC: Register Table Processing
> @@ -233,6 +234,17 @@ static void rtp_mark_active(struct xe_device *xe,
>  		bitmap_set(ctx->active_entries, first, last - first + 2);
>  }
>  
> +static bool rtp_check_entry_flags(u8 flags, bool is_vf)
> +{
> +	if (flags & XE_RTP_ENTRY_FLAG_VF_READY)
> +		return true;
> +
> +	if (flags & XE_RTP_ENTRY_FLAG_VF_ONLY)
> +		return is_vf;
> +
> +	return !is_vf;
> +}
> +
>  /**
>   * xe_rtp_process_to_sr - Process all rtp @entries, adding the matching ones to
>   *                        the save-restore argument.
> @@ -254,12 +266,18 @@ void xe_rtp_process_to_sr(struct xe_rtp_process_ctx *ctx,
>  	struct xe_hw_engine *hwe = NULL;
>  	struct xe_gt *gt = NULL;
>  	struct xe_device *xe = NULL;
> +	bool is_vf;
>  
>  	rtp_get_context(ctx, &hwe, &gt, &xe);
>  
> +	is_vf = IS_SRIOV_VF(xe);
> +
>  	for (entry = entries; entry && entry->name; entry++) {
>  		bool match = false;
>  
> +		if (!rtp_check_entry_flags(entry->flags, is_vf))
> +			continue;
> +
>  		if (entry->flags & XE_RTP_ENTRY_FLAG_FOREACH_ENGINE) {
>  			struct xe_hw_engine *each_hwe;
>  			enum xe_hw_engine_id id;
> diff --git a/drivers/gpu/drm/xe/xe_rtp_types.h b/drivers/gpu/drm/xe/xe_rtp_types.h
> index 1b76b947c706..f802ac26e01c 100644
> --- a/drivers/gpu/drm/xe/xe_rtp_types.h
> +++ b/drivers/gpu/drm/xe/xe_rtp_types.h
> @@ -99,6 +99,8 @@ struct xe_rtp_entry_sr {
>  	u8 n_rules;
>  	u8 n_actions;
>  #define XE_RTP_ENTRY_FLAG_FOREACH_ENGINE	BIT(0)
> +#define XE_RTP_ENTRY_FLAG_VF_READY		BIT(1)
> +#define XE_RTP_ENTRY_FLAG_VF_ONLY		BIT(2)
>  	u8 flags;
>  };
>  
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
