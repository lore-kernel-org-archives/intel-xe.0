Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 773FFC28B2F
	for <intel-xe@archiver.kernel.org>; Tue, 11 Mar 2025 19:07:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58EAF10E329;
	Tue, 11 Mar 2025 19:07:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BNpPjRt+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2926710E329
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Mar 2025 19:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741720033; x=1773256033;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Yl+sIquG8X/HYyXrPum9mug6I5LDM8NuZR59Xl/Wuf0=;
 b=BNpPjRt+2ErbJy+qnpmYLnQbn1Uj9VY7ckxEF9KvstkmTt6JyqpvCaOX
 Vaqogfskx/25KrLH+yGYBbZ5NNDL6iPXN9j6+GYpMMOqUWNwPiov23WnX
 uXUFrrysX0XHypP/KazLep4IjI+ipzwgdzO19NZR+fkCdC4yOAhRYmuGs
 mWjJd0SgA0B0OamzUfxpZSpzLyvCKgJZl8gkRPKPCpECkYCa08Z0MJFyF
 ahjhhYKGTHD3tqCex6ifPMTGQyJj6VvERYA+oLyEJIvd2Tsucv8nx+bla
 q+ZhHXnq6i906necLnHvw9GYbhaq1wujoGPAfvH+cXu4R6SlIe7/PnF4h Q==;
X-CSE-ConnectionGUID: pAExHzcLSUKW1fgvzxZBWA==
X-CSE-MsgGUID: sDUgcfmYRyyw7ibHWBRZyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="46688280"
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="46688280"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 12:07:13 -0700
X-CSE-ConnectionGUID: XS5uZhsoQeOfBOrsiWT4Kg==
X-CSE-MsgGUID: pPvlHXbdQ/+v8C3YR+n3oQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="143604025"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Mar 2025 12:07:13 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 11 Mar 2025 12:07:12 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 11 Mar 2025 12:07:12 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 11 Mar 2025 12:07:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iO/yA/rutSPJGyHO1VVH/QbrTs2eoLn/yLgj1Qs4GMdYVQHiIEGG14YRFecO6CQk6TSPjFjz40VOEgD84Zkz/bdqACWU2gAvWFM2CR3JFA6Lesl2NmkAQS6wSCeQRoGM7pHManhEZyVXXDgOXcZhGxjVtc8XZpJ1hTQww2JR+QV5q16t1lZ3ZMwy/wDSuEmZF2Z9nOhJzRrEOWilhWpNm0a9XjEeriIQ+l17g5SxkYyM/4R0r+VOP/UWq5Tr8z92hNjEZT8aL8wJbw+4+Hqq1/wIu2SA6VyDcFtBKDtInB8WHCNYx3U6ti+89PNSfmUDQwEw/aSY9hcEXY4PlS83GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h4XAMAqgVjlnMKUa6YM2H/REVmdsfbTUxTrgfqJbX0w=;
 b=pzu0baIyj09W2SBdzYqP62JV55p5uDq6g9iz8IBVEss6/SHUOPJbjC/7Wc5KW1dmll8MUvPMELngkorKw60hvOJLMVzmtaVDITGOHB0l0gS/vfkHGxvUlKfXmWJ7CbyykOdJbxuCAuTDcf+i+FjlKxe+J79vwcMu0vP+9bggRr6+2oWR4+PIfnbJLWHh3gEZRm9NFIv9h0ZvT7hRpIeqPrPmoiKirBXplgeIcj4BAJ/REmkaXyWdmyseA/5d8n0enPaAAWoTclWiaVQMHcWbejhvVtU2mYqFnVWIKS6wnaitPC4DsOnwzHl0Z0dvPfzOm11qV6j+TVHVaD39ywRRGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA1PR11MB8245.namprd11.prod.outlook.com (2603:10b6:208:448::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 19:07:02 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 19:07:02 +0000
Date: Tue, 11 Mar 2025 12:07:00 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/xe/pf: Drop CTC_MODE from VF runtime register list
Message-ID: <20250311190700.GG3701377@mdroper-desk1.amr.corp.intel.com>
References: <20250311114042.1954-1-michal.wajdeczko@intel.com>
 <20250311114042.1954-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250311114042.1954-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR13CA0184.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::9) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA1PR11MB8245:EE_
X-MS-Office365-Filtering-Correlation-Id: e363a9ef-6b1e-417e-c209-08dd60cfe809
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9BiSnBq/WjJp8nQI/3mvL8u5fOpaY5l2fguOlh6Lwzi60G4f6Ez+GWZLCN8D?=
 =?us-ascii?Q?FCn/FVPU9n0/Hip++CPdp6LKF/LDr7OrOyIEjliE9n1aFSN4C4mjWHDlgCS7?=
 =?us-ascii?Q?qoqGrm/LtAHAZJhi8I0Ewksf3M0OfjkBbkHqc/hnFeoPkPD4ZhyHOd68PbC7?=
 =?us-ascii?Q?YDxc2ceE9Sy3XTH1lfJ/V2jbhSID3wIzeM9sQUgPNKO+KUxL4eUfmiY1Kz/x?=
 =?us-ascii?Q?cHD8xBiH29uUJwK4RwFiiIQhBaxUSqXuhuKAw6B8j9PpR5Fg968ZLO3eHnmE?=
 =?us-ascii?Q?nkLQiDujn+jtqvoz4UwRi/Kok2RGCQI57xA1QFoc8zmxDxgBYG5V5WTmqgJE?=
 =?us-ascii?Q?WeWBpELYY08qSEZJFVcY1jVvBGcrD3arERDXYUcAbBRXNBCHx9GDBBVcJd+c?=
 =?us-ascii?Q?15xusQCgXsS2uSggQtBxe6rYQm/aCXOt/H2hAZLZH/WT+fqjVYFdqfArhV+q?=
 =?us-ascii?Q?T324bWZ034ttgSDmXSaLB8WtnpkMruthAlkWvt3RiS+N7zQGynQoNHIu3RO+?=
 =?us-ascii?Q?+Wf1LotjnCOw7HRNgV4n419I4rdj3y5aB0GfggBr4TkVm3WveyxVPo3cupdm?=
 =?us-ascii?Q?nID7H0OZhm7dCLYJSUvCLINXxzH5+UJrESllmrJpfzPI5YFLoEWHckwwQcdV?=
 =?us-ascii?Q?GxtfEzWqCNXIPvi3AF98Zwol2E7VgNBSpxhi0arVtaXg8bsJHpgWAZoEw07x?=
 =?us-ascii?Q?qmOA5p+HLULHwOpCHVwYeMTxw9AzwjQyyN2mvqmC12WiSHJ5VcrIUh6uyuc1?=
 =?us-ascii?Q?I1NZJ4R1jYfexGpIjU0b9dStIbSjMclQCyQvoSnDlMguCXCTEWbsXgJpBWKw?=
 =?us-ascii?Q?5Dn8rZT6QHHhzltEQRqB4z22jR+zyyOC22OfEQaDYmnbJgWx3WoQrmXhgApb?=
 =?us-ascii?Q?55mS2xnPti7N+ern5GvcI6hZRKmkI7vKtLdqif69+TqD+3HdNVk+bTLewRse?=
 =?us-ascii?Q?saOlSTXP56dO9Jd9AqxeBXxJ6kmNpmf+2VeKChtUA7s3gBjSv7S2bqDt+9eD?=
 =?us-ascii?Q?xXiTu2/d+Rav+Wvo79585CYQda94SPNiUqhQox6rLfJTwO13ftHkkA8E/PjI?=
 =?us-ascii?Q?yu5y/X4Mpv1syTf6eVMhk+zzCV/OqPE1vDTqKGY+0fZvDMCoauRWaLpD7ZRJ?=
 =?us-ascii?Q?9yuuUWO3SnkGme1sX9Zc9prYFsi0O9VHTx0rViUDTyTK07ymQXaghqzWpzfb?=
 =?us-ascii?Q?YNQ0Us8X+XILnIw94N3HKQOt/9VAy9GVGqz6kwNoyRucD90RgetK50ybcXU7?=
 =?us-ascii?Q?rSFfae4tKklnAOQH1eombNENo1sxL8L2ndM15d2qwLZZAHTwMtZ5u0fcdBim?=
 =?us-ascii?Q?X/2PR5feXDSaKErwaGQ63wWQqnjoutK7yFGKXo0TVHEujwtiTKLKyiFGGmoL?=
 =?us-ascii?Q?shOIm6iWEA7nNgPoK1DyYWmWSQ9k?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?S3W+0BEsctpOGKhOS5LYRRzWofMnVIX7q583mLfokYmARylZarp3nbk7qvOD?=
 =?us-ascii?Q?Qaf3FwK/Wnznd8AGaQb7MukLbpMeux7uhFKDM+ez+g0FuIRuI/ZnHS2sW5Pb?=
 =?us-ascii?Q?i1tRV6TFT1t0Ax1IkDt3VNj3qU766G6UNKKKhaFPRQJJWNXcI0VonqHdzFNw?=
 =?us-ascii?Q?41deog/Jt5vjRbizaEgkSpaZmhCT7/Ka/kyXehH8bq4Rs4JeNIXPXI6n4Q0O?=
 =?us-ascii?Q?Ovifsjt3BFHRjUFADhfLB//9Q9XWyNicYtyKbMIdDpcvuekRwv51XtVqWgM/?=
 =?us-ascii?Q?jgD2cTOgs5hbk44+0zqmts8ZTflRvKy8AZEowJKc4jjdTqDTGrUJgTHCRwYm?=
 =?us-ascii?Q?9FEeEE82PRQmzXWWoF7yA6e2/bDjmwZLkG8QtAnHOVNi9sTHgb9ui0VWIHkw?=
 =?us-ascii?Q?6JnvWHwktK6hx/wAx8XZRLwz2iOw2RDSnx2XpbXhBiBXUKYpzilBWWog1+70?=
 =?us-ascii?Q?SHnh6NBdgKjbHkrzHHfHK6ejBxWgJE+bpo+xkAz2DE9Avcc0BsSBHBsrRQen?=
 =?us-ascii?Q?ERKSfo3L9qXOT6vDRJRoO7cAZoQ+mLa2SVcLmLuAwwGYnVkJJOFYjEJl8fp0?=
 =?us-ascii?Q?JQ4qZqjKlqjAjzS70NIxx8IzgiVGp+8Jfr6WHVQOLLS83d22XxNkOoentgL0?=
 =?us-ascii?Q?IOPJJESisGnckpWRuRlqT0LQq01liTLXVlKTrP70Wlt98T7ZNjjYtyN8aUQm?=
 =?us-ascii?Q?Swr0MEUboA+Xej6AxuE7wFtfZYIjUf+0f4zCN7HhlpXVvpMnTtx6uu9hYkpz?=
 =?us-ascii?Q?G8A4cBPVx86zkYr2+Ol4U9tsRfVQDugF+EI11OHDXXimIrbO2578fvdpXAXV?=
 =?us-ascii?Q?pOfRUlOhDCLsqggUfwnk7yHRw1zx9bL/faxzMqqwL89g40cBWTdE94Mr7Bp3?=
 =?us-ascii?Q?vwbYWNCB/sFoVpqpSb1ERVqRBn6iI4gwNxKo0P/a5/+Yd4L43BlbMK28Dlms?=
 =?us-ascii?Q?POWvtB133ElRJ7Jd2Onkb5zHD53HkBKzfrilZ4Aq/tLhOAsayz0KzWsSGDrV?=
 =?us-ascii?Q?Nar88sb408jMUqgko6S50QamW68pR3kj8Jzmyw5L2RRwXbsPfkZRE+g/zvPJ?=
 =?us-ascii?Q?BgWH8OHakSpLQw3utrDuVwPllEU/R0sfD1cRlRWmnkgzaYrqRUxDQ9WJioL3?=
 =?us-ascii?Q?MFUajj0ehOQKJchTQxpukoU5hGBhLIx0kXNYL8DDGKX4iwoF0EUOg0zzMdfq?=
 =?us-ascii?Q?5wONczCvbgHRSayu0Q9SHW4aF/1IB+wfHa9KTYPRRmBpTWwxRrbLbHkFQJRG?=
 =?us-ascii?Q?GzWyMq8JexP8AXfW1l8Rl53B3G239WS1JOFhFbH7VP/fo/tTz2IZHSYBKVzf?=
 =?us-ascii?Q?tsNq2IkTB8MUtFOlHZmmGzV95PYjEzXBotzmZ8r0UCgEIyQ9yQykuvyBR3Et?=
 =?us-ascii?Q?/MHtvUseimVeXppXv9uP2zywiKbbhESRJQD1lSSnFBgQnGs1R7x8hb39Szpe?=
 =?us-ascii?Q?vZbyr7X0DhGoVrGtO6Z+ZQV188nPJFA23eaqk1O/LJJOQ1YsdeSymhHhnVnC?=
 =?us-ascii?Q?0D24ZIGEebTvSX67b9q2sDkDmG+6O5wDb7M4uECZ11QuxFkBuVCDjUCo4l60?=
 =?us-ascii?Q?d3mzGzMGKZ1UlAgTU7fadFQQbtA1ksuEw06PwC5TdlQp0OQlsFchZavIB4MM?=
 =?us-ascii?Q?Ng=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e363a9ef-6b1e-417e-c209-08dd60cfe809
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 19:07:02.4980 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z6nhLEYQ9XEbOVwl0wMVHEgLtKQ26icRQr7oDs/YdycPQXl89jTdXhH4RH1nEW0uVXXbiDWoK1bmrH+F57cazkhbiJ+A8Doy5DSp+R9RLqg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8245
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

On Tue, Mar 11, 2025 at 12:40:42PM +0100, Michal Wajdeczko wrote:
> This register shouldn't be used by the VF drivers.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
> index 4efde5f46b43..821cfcc34e6b 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
> @@ -112,7 +112,6 @@ static const struct xe_reg tgl_runtime_regs[] = {
>  	XELP_GT_SLICE_ENABLE,		/* _MMIO(0x9138) */
>  	XELP_GT_GEOMETRY_DSS_ENABLE,	/* _MMIO(0x913c) */
>  	GT_VEBOX_VDBOX_DISABLE,		/* _MMIO(0x9140) */
> -	CTC_MODE,			/* _MMIO(0xa26c) */
>  	HUC_KERNEL_LOAD_INFO,		/* _MMIO(0xc1dc) */
>  };
>  
> @@ -124,7 +123,6 @@ static const struct xe_reg ats_m_runtime_regs[] = {
>  	XELP_GT_GEOMETRY_DSS_ENABLE,	/* _MMIO(0x913c) */
>  	GT_VEBOX_VDBOX_DISABLE,		/* _MMIO(0x9140) */
>  	XEHP_GT_COMPUTE_DSS_ENABLE,	/* _MMIO(0x9144) */
> -	CTC_MODE,			/* _MMIO(0xa26c) */
>  	HUC_KERNEL_LOAD_INFO,		/* _MMIO(0xc1dc) */
>  };
>  
> @@ -136,7 +134,6 @@ static const struct xe_reg pvc_runtime_regs[] = {
>  	GT_VEBOX_VDBOX_DISABLE,		/* _MMIO(0x9140) */
>  	XEHP_GT_COMPUTE_DSS_ENABLE,	/* _MMIO(0x9144) */
>  	XEHPC_GT_COMPUTE_DSS_ENABLE_EXT,/* _MMIO(0x9148) */
> -	CTC_MODE,			/* _MMIO(0xA26C) */
>  	HUC_KERNEL_LOAD_INFO,		/* _MMIO(0xc1dc) */
>  };
>  
> @@ -150,7 +147,6 @@ static const struct xe_reg ver_1270_runtime_regs[] = {
>  	GT_VEBOX_VDBOX_DISABLE,		/* _MMIO(0x9140) */
>  	XEHP_GT_COMPUTE_DSS_ENABLE,	/* _MMIO(0x9144) */
>  	XEHPC_GT_COMPUTE_DSS_ENABLE_EXT,/* _MMIO(0x9148) */
> -	CTC_MODE,			/* _MMIO(0xa26c) */
>  	HUC_KERNEL_LOAD_INFO,		/* _MMIO(0xc1dc) */
>  };
>  
> @@ -167,7 +163,6 @@ static const struct xe_reg ver_2000_runtime_regs[] = {
>  	XE2_GT_COMPUTE_DSS_2,		/* _MMIO(0x914c) */
>  	XE2_GT_GEOMETRY_DSS_1,		/* _MMIO(0x9150) */
>  	XE2_GT_GEOMETRY_DSS_2,		/* _MMIO(0x9154) */
> -	CTC_MODE,			/* _MMIO(0xa26c) */
>  	HUC_KERNEL_LOAD_INFO,		/* _MMIO(0xc1dc) */
>  };
>  
> @@ -185,7 +180,6 @@ static const struct xe_reg ver_3000_runtime_regs[] = {
>  	XE2_GT_COMPUTE_DSS_2,		/* _MMIO(0x914c) */
>  	XE2_GT_GEOMETRY_DSS_1,		/* _MMIO(0x9150) */
>  	XE2_GT_GEOMETRY_DSS_2,		/* _MMIO(0x9154) */
> -	CTC_MODE,			/* _MMIO(0xa26c) */
>  	HUC_KERNEL_LOAD_INFO,		/* _MMIO(0xc1dc) */
>  };
>  
> -- 
> 2.47.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
