Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61C80C3DA49
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jul 2024 21:53:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3247B10EB37;
	Thu, 18 Jul 2024 21:53:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HqGDUGz1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62C2A10EB37
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jul 2024 21:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721339623; x=1752875623;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=VXlPtlyRatxV8Jrj1gox3SK8J4SUxvcab1Z/XzeW/YQ=;
 b=HqGDUGz1exARfaKZIsLv2jmheadJfNyldHgKte1SYiBYjylgv/RSpJdM
 86zicTKxM4I7AnVpwmKe/Otf7O9FXAkmsNmvBoCIaKtPudlucz/0z+Yml
 etFaHGxd7RXnx7RCtl7k0ZGqzXbHNviBy/17xYVhpmUiyXXL7FtyS5Z04
 9lcL2ZA7xnkXeqazBTsd1UbEUsXiILYezGkBGlnSsIUNGgRTLRqjmpJNh
 iuoiC0eYoFxFKP1gfJ+8LNg0gy67KAi1Zkuepg0e1qkilnifeDlIc+VW5
 Hnut42vmDHD3YEWmIWsUS/sd+YGH2yh+UoJHUvwd7OYlck4JQpJp8gQ5a w==;
X-CSE-ConnectionGUID: zXeTKGE7RvWePqb2EIQ3Dw==
X-CSE-MsgGUID: AAbg+mClRhCf8T46fFsGDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11137"; a="30091041"
X-IronPort-AV: E=Sophos;i="6.09,218,1716274800"; d="scan'208";a="30091041"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2024 14:53:43 -0700
X-CSE-ConnectionGUID: 4pCb8+28TYS5RsDzy2uXBg==
X-CSE-MsgGUID: jLwuJ07DTH6jTTgRYsDl2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,218,1716274800"; d="scan'208";a="51190639"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Jul 2024 14:53:43 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 18 Jul 2024 14:53:41 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 18 Jul 2024 14:53:41 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 18 Jul 2024 14:53:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OX/vPxgXBDcwCGg0/Xkrifa/kUL0chWWJ0AEHSwfx64zmAk6awoSgivNDAHXe5HD3q+agjqth5nQ1Nkxmz48w9/uaQbFjHJ1oD3M9uJXWkTaJr1jPGPSaYesMwPn/ur+FLRmB+MGhqFbOJftUEnVtBfqZmW/1MFHlyC7jPRGwYE1KyLw/s9BgcgeDaV0GwTmQB4rcvtYdMxqJFqjH2POf7Y3+twfg8uvxnjXG1s8TRxBGSdPnBp6t+nQlY9h+bqZj17R9i3yF+EGu6eY9+nIiVsd5AH/FxH7XeJ3hYwPpKsN6hCXf4wXsxSM8LWLAtayJIXqzFXJKJmU1LlAY3ukZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KF8G1GLkcYsN3IYYApNRGYVpNPQv2H0gyZsVdRjzJPw=;
 b=lIMoIBE1wXUgwsjXkM0pPtvoPwrZnwS0ZUe8MW/uHca/E6nwtT2ezOSG6LGPgOUZevPNZ5P+J3vWH165OoFigMjmCSTGS/tLYOMn+6dLFZ6rfUC/S0QJOQ+O9yWYPX6pyRcy7tMYA5VSNdr2QXcgGplVQ1C9Hzh8NxoQpLNV7vonlaj6wlm6tzyAVRxYYLdsUslVRT3+6y9uK2V6ZIofSurU3RNghwPFAHSfd9zdEQ8VM/IxGZ2tAu/BsSb7BGsRE2u9UpiovBzva6YKxAEKIqLq6VdT8mXwUGGqJrxsn8WS28iewWjVOmatqqq96ZK+MkfqGE7tb/QiWY86XEIYHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8185.namprd11.prod.outlook.com (2603:10b6:610:159::12)
 by MN0PR11MB6110.namprd11.prod.outlook.com (2603:10b6:208:3ce::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.32; Thu, 18 Jul
 2024 21:53:38 +0000
Received: from CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::1be5:55ed:3261:fefb]) by CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::1be5:55ed:3261:fefb%4]) with mapi id 15.20.7784.016; Thu, 18 Jul 2024
 21:53:38 +0000
Date: Thu, 18 Jul 2024 14:53:35 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Piotr =?iso-8859-1?Q?Pi=F3rkowski?=
 <piotr.piorkowski@intel.com>
Subject: Re: [PATCH] drm/xe/vf: Fix register value lookup
Message-ID: <20240718215335.GW2906448@mdroper-desk1.amr.corp.intel.com>
References: <20240718203155.486-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240718203155.486-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BY5PR13CA0013.namprd13.prod.outlook.com
 (2603:10b6:a03:180::26) To CH3PR11MB8185.namprd11.prod.outlook.com
 (2603:10b6:610:159::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8185:EE_|MN0PR11MB6110:EE_
X-MS-Office365-Filtering-Correlation-Id: 88f0e2ea-cca2-465b-523d-08dca77414a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?7G0V3nrIqkv6l8N/5VMQ2odjJPzX1oTw5dDhyMJgGOl584QZ1XbUZSaXoz?=
 =?iso-8859-1?Q?6XnW4R3SxOJ3wcczlEmtQXVuuK8rvJj5Gk4SuYfjXMXcIRS/Rqia/VxsoM?=
 =?iso-8859-1?Q?Da2uipvcaYlp/45qU9+HnmssS6VlR1OxxwZzvU+qJPa/D4O1Drcx0nwmQL?=
 =?iso-8859-1?Q?f1x2pCgPMV4+MjBB4qe4537LbpHLDhSCwR7noXxiwKb2SZbjuTrUXqhJZU?=
 =?iso-8859-1?Q?C9LibzDQ6OQIFMkTCkPQ/Dv2h7UkIdzvHy/Kbu+svUA4lDEXvGfpeNK234?=
 =?iso-8859-1?Q?z86sByQGO/j3JEnZ2EAnLKdtGo8dI+0UHYrMmA1m4/B3Msw/vNVZknPOmc?=
 =?iso-8859-1?Q?W9e2WcY68Bb57jCMWk5XgajxwfD99ESTss7VUDav8ktko2BwwC6i7zTjVi?=
 =?iso-8859-1?Q?G03UOEPxOHDxy9rfZETl1OadC6r6sLc0DH5ewK10TilJLDDi/hW7zb3n3D?=
 =?iso-8859-1?Q?owcZjLgOujcBYT62dABNIs4uFzqErM55Idf40SowQ7XJE16Ib6kB/cM1z1?=
 =?iso-8859-1?Q?NM5KjnY4Dr19VJ5kbhTqWATMLNLlXdkCaTUNLb7NIxg1KmwUVUvglNt8ax?=
 =?iso-8859-1?Q?0fsRmlFqnqH86Ku5OwHxTY+mSfd7BwHSIqZtmWRf7l6A8nvehTQ15uX+Dy?=
 =?iso-8859-1?Q?suHJZpvMKrNpRCMuc0UwVd3iY1CmeN/rUL12juXclrjO56lsK3x0AzrOFe?=
 =?iso-8859-1?Q?A7iXDd2AaYqVkTYk+FwCquh5Wi4jCj63hxVZWlp2SWJMs1T0J5rFuc2qK4?=
 =?iso-8859-1?Q?fvscN82W0KZEBE4zFS1z4/1RKMPNBJp45IKDtrGfiPbCjYo22V9Ruznh1A?=
 =?iso-8859-1?Q?TzGU7QpovSBwUrxokhUOXHY+zxUvJw+pBDO6ikbEQlv/SjjNZNEtw/ZsBl?=
 =?iso-8859-1?Q?IwdWstsX8ohdJhvpDExULVg7oYQCOR7Z5hiDaEWx+EMZ9n9bgWQUGXeIfN?=
 =?iso-8859-1?Q?7yoD+aRfv4/6GOIFWt3oJRxoDiuaoiTgtewP8lj28tDrwOkpayRIZ96EB6?=
 =?iso-8859-1?Q?vka1z5utisrjG/sXYygo9LTsgFirU4Ufr7kNRjSxhl/C6FKx+6f2kCKDtH?=
 =?iso-8859-1?Q?XmC1xHRc8jZODnQFEiu4gZpnU410WEg1DFOP8uL7SLPWKoXjC1Wo8pVUI7?=
 =?iso-8859-1?Q?by+nAIU7rvybkUu0bqHoxajM5gnwMciySeGw2G5LR2LKZ1fzsTXybiWcJ6?=
 =?iso-8859-1?Q?wOhAWemFKYBlJ+rzulYnNQk997qS5EYM6wP7+b696qrx8uX+7NYmH5Pd/u?=
 =?iso-8859-1?Q?zTZWWX/E/PnHWcsROlQp67/P/sY+rTxNoN34UL2Ywn1jomYl4j3+tDRxAV?=
 =?iso-8859-1?Q?aNr8sua3TS0H0Zc6JVKYDtgJvvsplZCnuo6VYkcWBwG1/Uf7d8XfPgtbeZ?=
 =?iso-8859-1?Q?VOsShqFFe+6OrNtg9WaDt9BGk9FDCVcQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?hjpVwPWsuOaUIymEX7DETyD03mRHAH8KSypb06t8DhMnKFXAf/e+TvHG18?=
 =?iso-8859-1?Q?rqN2qiAKVcTFqGOyMb7HdSCbMKB06xrkGFNhOxsRW9a1UmhrVGv9SbjBuB?=
 =?iso-8859-1?Q?pvLySCd9G8PAU81fU7Xaxj01yQi47WQFRifxhJqkhmlHqnvaqfWvAt1F3B?=
 =?iso-8859-1?Q?lMAcxoaUBZ+4/UKLkABTJp07Jb3xzCPKUSHfc3Wh2xKEx3XcAThEmGbsxe?=
 =?iso-8859-1?Q?AYuogP2Bq8RXvonKBqRPv2bmPMJMt5WaA+45p73gPdhd3veCu5ZrQTieby?=
 =?iso-8859-1?Q?TgCJ9NsPkFbDAHJHiNtRXeL9GlLgb8LKfz9OYn4MZdHbc6SBBEF5vV7K/y?=
 =?iso-8859-1?Q?VGG2wURagSfC2pE/va0kOe7lLMtyB9GBSfGuyyB2oGPuX1KtLBdetkujo/?=
 =?iso-8859-1?Q?c0KFuwSaJCZpIkbiNxDJgG+PxF0BQjV/SWzAmXn5TjZWqWPul5zracp5zP?=
 =?iso-8859-1?Q?S6zRK82zYlHTjxVrpDO0SG45bgECri2QhmtdP/MZq5BFfeAXq/IrbKjrm2?=
 =?iso-8859-1?Q?3g1X1pl3lFsGtLbC5yrlXhH2UqEuZj9JqQVl2SkCXZjXX166NWnKo1gzbT?=
 =?iso-8859-1?Q?zxmooPRIV79lgfGQ9Pjopk2IXeeGBumodd7youlsa0FZsGi4a8NOfVzmsM?=
 =?iso-8859-1?Q?txx7f3nswbhJb8E1x3w0pZjxDYlRFSuIE+WeAH8VAIGObai1NRjh+VN2Ee?=
 =?iso-8859-1?Q?H99DoevvuOkbr3gQZinz8/va4C728HUEGVFE5T6lVYfLBAy4QseHV42sg5?=
 =?iso-8859-1?Q?jYHIKAx1BsAlevK/Dnw0JUj9+xzUmJaSSS47s6OMSuPvlb0A8BVFDAeCPa?=
 =?iso-8859-1?Q?cvTtbcLzHakVff1MHWCLuWeJIbq/ait93rQ06t2Elv2Ka5XtCXtUfnoMR7?=
 =?iso-8859-1?Q?y6Lf6db6gBe+QVLePLOF8sOuKGnkVfs/PVUzcYfhnJijbFvWm53xvS5lhd?=
 =?iso-8859-1?Q?ypEuu8Kwcvbrh4Y1mMlXaUOlzSoY+4NrT/kShZi2NL2ERlIJCL+5fWPj3g?=
 =?iso-8859-1?Q?2eloeuJIi2c1CEFu8G2pPH1rrb+gEWP+wWzLwWqqDCs3/IVX26pxeAtk45?=
 =?iso-8859-1?Q?kttRJBiaNZmt+M0DXr7F80G+QK1RlzsIobLxqGZDuiXcndpCyINCRRmFvx?=
 =?iso-8859-1?Q?AHfYh9m+hyF6dewsC+I6WpPDNEIgfmXfuz8BLp5t+5eJYmhBKpwKiLwS1a?=
 =?iso-8859-1?Q?ZewB7BQ0kleIRnQiztCoolFh/ysedSRcgwIaVqPMrho/hFqeIePtQXCTAo?=
 =?iso-8859-1?Q?1QG4ZkjA4L3VYkjjPxMZZG2ytIaWrJbR/uywxlsJDKEWm7A0vZf5iDsItV?=
 =?iso-8859-1?Q?KSDstW6ueSVvU3naBtUPznGSre3YDecRx+JzaaR3MX0UnatBSgkrI2Kc8N?=
 =?iso-8859-1?Q?GUUZNXtikIXM9q3tCO3pJyhHvMZOthbYhUA5xBzYe/+3Lnj7Ny7v4Hddcj?=
 =?iso-8859-1?Q?GPDqm3vGZxoJ3WS8Rf4kna8R10PjBov1rCW/cGbcPitOkWVmHD4eGdDQM/?=
 =?iso-8859-1?Q?VBpjQzGYj170aoknJciVKYRYpp8S+sKwnQ4PpK2hSE58/no6TAPp6+hZJU?=
 =?iso-8859-1?Q?Th6pDauaQ3+60Cz5cnvDJ6M+U+ussN0glCQTJlfwtVjE0yP6i3/8iDZZlP?=
 =?iso-8859-1?Q?afcr75aNUlSyi1Q4EZWzXzg7m10TlXS1aEXpG9bnDsO0yBkxV6XUFwHw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 88f0e2ea-cca2-465b-523d-08dca77414a8
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 21:53:38.5646 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jTVL8c6OgU2wWnazBLa/aENDrK3BrJoOWmSoBUbDkhdKQwcmsdr7Uoaqi9MFKtChoZwwxFyxLI9RfhCwiJ8x73SkVOTD77PtFm2AdHM7kXQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6110
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

On Thu, Jul 18, 2024 at 10:31:55PM +0200, Michal Wajdeczko wrote:
> We should use the number of actual entries stored in the runtime
> register buffer, not the maximum number of entries that this buffer
> can hold, otherwise bsearch() may fail and we may miss the data and
> wrongly report unexpected access to some registers.
> 
> Fixes: 4edadc41a3a4 ("drm/xe/vf: Use register values obtained from the PF")
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 6a87d31c44e6..47222bd9988d 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -850,7 +850,7 @@ static struct vf_runtime_reg *vf_lookup_reg(struct xe_gt *gt, u32 addr)
>  
>  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>  
> -	return bsearch(&key, runtime->regs, runtime->regs_size, sizeof(key),
> +	return bsearch(&key, runtime->regs, runtime->num_regs, sizeof(key),
>  		       vf_runtime_reg_cmp);
>  }
>  
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
