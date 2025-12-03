Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84666D1CDA9
	for <intel-xe@archiver.kernel.org>; Wed,  3 Dec 2025 23:02:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 446A310E163;
	Wed,  3 Dec 2025 23:02:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k+Ekw9X1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 077BC10E163
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Dec 2025 23:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764802931; x=1796338931;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=S+uQmun0dIAju9ZQxyLviJ8ULole9inXG6scNei0ZuU=;
 b=k+Ekw9X1CA0fonnKmZACGKNLcvVdnJ4YfnvsEXdRKRYQ7uDb/uehaKJu
 8ww2aYzO8dlmdT8CPftcccTKPySyXAugo5ecEZvUsDwQmCTGvl+ovAziZ
 U2CsMQ17647l71RW1PlVtz9ZZjqUJ2DsmvnWD4owy6qTIkf0jnBWmttMk
 Vu2vsbRNtgomQZ+tGH12kzDscesf/39oZ5T8fTCpbWJGoC/IZ3bKmeGyV
 7Y/RKOl4jP8FzpUmnWxJAhLQyWDbVq/FopXc0VDGzjPsQGLM04+sMD8rB
 9lwqgKl8d8+75CgcgkX1XIXk5rULBVtLMLxsr0E8Kyt9xMf/7o3Wc6Sct w==;
X-CSE-ConnectionGUID: Gi4BQT0hTYqk3dFDfL0VHA==
X-CSE-MsgGUID: /H0/GyEUQBKYmC81Jjln3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66706123"
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; d="scan'208";a="66706123"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 15:02:10 -0800
X-CSE-ConnectionGUID: yzdRXxMWQcKeTtlZ1Bye5g==
X-CSE-MsgGUID: jR+vmD/aR/Sdrgog8sHRLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; d="scan'208";a="194911743"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 15:02:10 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Dec 2025 15:02:09 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 3 Dec 2025 15:02:09 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.36) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Dec 2025 15:02:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W5PuDymCYFHPYpXKmxo9fEDuPgSx1Rb39TK0meODCeXFNowOLJnFtgAw5p+NRqxuVKVimBPb7J1+Vo8RWoNHARlVGZr7OF34umrbD7xvhDRD+uzqieCrxnY4o4BmqEjELLC5Cl3jg4OUvn6yleMCGrglBbSjTTC1cPoDt+v7CVG4VU3ttceiIAMg+fCgYM4YvfF1iCYRzx3R1HhifI+GnofJXBf4Lo0n7XhftJNEjIQUV8e2gNKn8wRs8zQDr+P+56Y6sRN6b2PfCH63nTI/ntdrz01sTQpVK0MPL4LW3tme8VdvrHmE81AX1y7+VSYtoYJ14roplKU+5rmafqKc3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zgtMEdTzTc4ZeWhRFOPvCd4E/xKno6OohCI4XJEGyg8=;
 b=A6S/izSMLKoMTr96gKP79UeMbv7nViUbaYEKXEoU+x67zIXT8/HDnVgD87MiS/UBb9p2OxoZ76Z9wM90ugk58YF04iiKZCdDjdy5Ir6g3xF+Ksjgqs7aFCboDZqfwK5UlCol5xDp8FFcrqj9lmi1xgAkCryZCQMFgLXn8+ySCJjOSVK5TOBKzYMvZVJhSFhpBcEGE+SUJS6lTyYHhtX/a27+It0Kb6WPy4FAxojaPb+NZ31ZX28dxiE/1FZl7VO2JRnCk9a6iuJXyARQbo+QCE+4KPolLRQnUBdOhP63U3msAELlaNCA8Hj53GGx6qVG2UQPr/I7Dmw7d6D0qArE9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA1PR11MB9472.namprd11.prod.outlook.com (2603:10b6:208:5ae::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 23:02:08 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 23:02:07 +0000
Date: Wed, 3 Dec 2025 15:02:05 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Xin Wang <x.wang@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <shuicheng.lin@intel.com>,
 <alex.zuo@intel.com>
Subject: Re: [PATCH v5 1/2] drm/xe: Refactor PAT dump to use shared helpers
Message-ID: <20251203230205.GP4065316@mdroper-desk1.amr.corp.intel.com>
References: <20251117230156.366860-1-x.wang@intel.com>
 <20251203225355.24972-1-x.wang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251203225355.24972-1-x.wang@intel.com>
X-ClientProxiedBy: SJ2PR07CA0018.namprd07.prod.outlook.com
 (2603:10b6:a03:505::22) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA1PR11MB9472:EE_
X-MS-Office365-Filtering-Correlation-Id: cbe68b3c-143e-49f3-d17c-08de32bffb99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5Vtd6gbcG/cMTrlZy9PrBiCZK6RSGtPZJTuVLocywKWfrDJrz6G8kNVlRm61?=
 =?us-ascii?Q?VZk1xCY25Vvyl0Lf6+Uu4iE82RmcOQodcXt8SY6fkkRI4JMPv+ixv2N7KpoK?=
 =?us-ascii?Q?Y8eZpp3joG/xFibwJoUSxAT4ZhHpuzx2BYlOTlEL3CZKpNjOWIGO/hGx1HMM?=
 =?us-ascii?Q?j2dfAuCYj7e8xIj0+n9WDkZfoD8aw1MonJDmq3ua+/YmarS3m2EzAb7Q9Hac?=
 =?us-ascii?Q?xkjbfKsTdGlnUvrqpGx3Y3XXjT/PdtzG8jN8xD2GTZBSwxWn7q9mmlQQUiJQ?=
 =?us-ascii?Q?k+Pw1cpl71EKeke36XAflHtDIIRZSUH5IvYfFBzz2CasyzS9vgdBHJCXQrvQ?=
 =?us-ascii?Q?+kur03qE4Gx5snp8aZPhehVrwJ/Q1HxAQ9oTBAEEQpGJ1Yc55cBQDWf8odJ4?=
 =?us-ascii?Q?JQa9ay+WMvcidePdblAd54DscFjzRcPXMQ2kaKPmuFFtVOBcIGqh7xO0U4j4?=
 =?us-ascii?Q?eywIK5ctgwf7OfxUNcX2qAo2XGWaR3OaNNZkypfolAGkypQkyQOSy9aXawjj?=
 =?us-ascii?Q?A5LXOiIdF3MRHB+7ZFMeYn4jCxDrE9hyqyhJSvP2rZi/PQRf/kORmsQQAaGO?=
 =?us-ascii?Q?9T44/gyO97qyNYrxDI5oMFShc/vvMbWpONjTFnIMsyrJAUuauChxAYA+nqcO?=
 =?us-ascii?Q?J5VZPWMHkFcxLfhXqQ3oWyKxx5zfpXtHwbzfaqCzgcOLVN/GSN44T3pg6Iwh?=
 =?us-ascii?Q?CWsFGKQiLuoxaU7e3+WG47sCwfwr9HOxCq+dPVweWIqzMVSXTgxudTNgnFEE?=
 =?us-ascii?Q?9GbUrC48smWpQEJTdGAUDbNv8vqvr0g6vKub3Fk4wYmlZcj1JKx47VDbW60o?=
 =?us-ascii?Q?CJbqqYs2ACmbB0GDUAQZfaMfy/uqcrdbYUFHOMNwvBXa21Xqig1D1n82wXcq?=
 =?us-ascii?Q?UfzbqeihkWkUmo9Lfv6jybCsCldzp9Dw4vSzxKFGr3BIHaWFWYwlCMyF0BUu?=
 =?us-ascii?Q?s39YrLryhEMMyi+c9whFCjqf6MV3sN1DGAjtZtrwvZGB+3NyhkJ5WuQl2oH9?=
 =?us-ascii?Q?amiPj3QrPsEVBk6GD6R7AxRy6Q+SUtMM5eZOLejgmIlJGyJ1nK6GwXk/Q2Y9?=
 =?us-ascii?Q?s/qPnE42XEDi9mG6EJXoK6+Lbk44GNxoO+sdm0oByzTtp19O0+cPNauTIsE1?=
 =?us-ascii?Q?AFHg2QJ71Gdrz8RKaxym+FXy3xUxeS+94CQiFy2O5sX3Q3ZPU+6gE/nU2EA+?=
 =?us-ascii?Q?PSqKITuB0IMDMJzZB3vndTiSpmvlg39xvQPZEEE0dobDeZQUAzoJxZoM/t7M?=
 =?us-ascii?Q?tcjktnlPsdcLXVvCLhZBW8ne7Fzto+EtJ94ru/RaZjtIC5FZ7VFap7P5EWIv?=
 =?us-ascii?Q?Ib+i0gDmhqktxhPizFvkleV1+LXQTAjOjmrPUwbrhDhEITPNabDpqUAUcNJV?=
 =?us-ascii?Q?4uLT8VPGHn3bwfnj7U4LeNUlGldm9UMicIbzpzFUUdMU8YhnxWqEpoZd9uaM?=
 =?us-ascii?Q?LXf3jJbOPZkqIOCYlQPrd7LT3B9NgfYU?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sCw/tszutVr87ePq4G95i9Q0ekCNl0WsOTAmQX9iUEbZjyFn6UuBAhRSsJQX?=
 =?us-ascii?Q?r/3mGBbgNgT3+slYvwjBehF/wNwp9JkvTS3W9CEuAgySKFjNt1FRDiF/fMqD?=
 =?us-ascii?Q?YuDjA1BJgrvl/pS1kRJBeYG5cfaRrP3EyXcFh0kXykhUHfl1TYbK9XNh3toi?=
 =?us-ascii?Q?nT6UHMNw1p9cfttLaoTlJCowcBTe8+xEPmb1ilahH5aXZjkrm0K4Bj6RuMyP?=
 =?us-ascii?Q?4kUtacGC6MO2F0n6KbJ2YUah8HWYijNiWD2P4rWkm1PuXXwXGes/4QF/R/b1?=
 =?us-ascii?Q?F8R6yR20Iz+5q46tyV6CXULHByMXx2lqo+cMfV1kjIHqUxuA2bWlwtpvj74G?=
 =?us-ascii?Q?RXxkU3BHWsEeFg+V6Nnef/t7tR+fmrywOmxglB1LKKEInvmy2L/FcZxhJv2Y?=
 =?us-ascii?Q?ACbDxMbBFZ1uNyv15otC19NhjmGjkKzHHIMRPtGQjKDSkiC1kTau6okei7St?=
 =?us-ascii?Q?/T07xKjcC599WRtWCOdo+1k0v51PnMJ/mghDP/4UGnb6vyPO3advNAQM8TSo?=
 =?us-ascii?Q?Px8l8mb9UfdrQbzWQ3n3sj7xAIFqOcBXO4ftVMDx8IDaDZ6FSmoGRezd24lY?=
 =?us-ascii?Q?clsd72LBUeUVXYLHGOOnKns1Kdo+Mh5yBZ4WtEUTCvJdc6rsY5Gs4VEIdlz+?=
 =?us-ascii?Q?Q9JY+q4MqmlbK+lcBT7Y2wwIioJQoKNOOpyqk0kQ5VMKVOBLMfRY9N7i+ire?=
 =?us-ascii?Q?yXfhutUI/xnR5etEKSvryuRSp/yb4wMhWO+hLm+JX/F27QFGDRbteL5JyGdI?=
 =?us-ascii?Q?+C1BGlxn1QI3u+otxotyqRcbtU/wbXpnQU1OyWliydEwurodYXG9g4N/cBRm?=
 =?us-ascii?Q?8C/hBrM5EXwAEfiB3mRpPFM8tKogXLqVlG15/Ue7gAIl5qzLhiBUQ3Hnhapp?=
 =?us-ascii?Q?6C+Kvr00P7naVp5FGItJOji60eKgzCcRUFHat7sVn1xoqqUd8fGrZefwSik/?=
 =?us-ascii?Q?RSt26WYqyEjoEoSWlbc0kAgfrHW/DJUB63+8lftEH/rFhogMAnhvRteOW6Vg?=
 =?us-ascii?Q?+obetIkWHYA+M4cEhBhmP3t31ctiGauuLImFkXwTfwHGeu/sG1I9yulTqqv/?=
 =?us-ascii?Q?GYlcGwg9y1/BRgX/syU2zGeTxZ91RmkoDIzdCPkyhV5LwTTRA9YuCAO90ZDX?=
 =?us-ascii?Q?f3nEgmUNWFd0+eK/GBkXRU0cmyZs2WSNPA+20eGSH5kQS9AfHxIWQq/M/Bap?=
 =?us-ascii?Q?VvVxjivgOGVDTCIJwOfHOcDApbYEV+9pYG95DqLjceQ+zvIXUOl/FJoiriJi?=
 =?us-ascii?Q?CoLhsmetKQ5Xq2GWsmtnNuixX9qRgnuZx9aRx3M5Pz+hcU6EEjqLR6aCqE5w?=
 =?us-ascii?Q?BgVDGQklYjxPHTSxEuMyOjQhj1BtDtdg/Y0Sl5UER2dgIaXwZJTJSEqzHCng?=
 =?us-ascii?Q?K+eSTEEmVYd2dvAMef/64uwO+cx0lwRiGmWTQ9f/ho6X61Dg5PndWH7sF5XZ?=
 =?us-ascii?Q?zHkuIwsNkAwQRvUUG/JvlVhCebXNEUNAE5ZsT2QdIy2PdbhFRCZ9f0ISMs/U?=
 =?us-ascii?Q?o6Iu2Y0EH5kimzSayk1J/K8ZcA3IhGQXr/4Rk8RW+f2QMyBeVqkRyw8vegxi?=
 =?us-ascii?Q?fvha/JjdWGSK2BNN9jIPSp1nw404jM/7FYKfRwKrSjjqLQIBad3p6J1wds5Y?=
 =?us-ascii?Q?gA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cbe68b3c-143e-49f3-d17c-08de32bffb99
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 23:02:07.6341 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9ZHqxreRARhrRr87w1Zx3jYHZtvN63SqPYhl6r7RcuWXNhTCIFs6PEVETtbeHKJXPRnyvOFNemtI1oQqVMNjgBMn8oENNa/qj31AO/9UVUc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB9472
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

On Wed, Dec 03, 2025 at 10:53:54PM +0000, Xin Wang wrote:
> Move the PAT entry formatting into shared helper functions to ensure
> consistency and enable code reuse.
> 
> This preparation is necessary for a follow-up patch that introduces a
> software-based PAT dump, which is required for debugging on VFs where
> hardware access is limited.
> 
> Suggested-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Xin Wang <x.wang@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_pat.c | 97 ++++++++++++++++++++-----------------
>  1 file changed, 53 insertions(+), 44 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> index 717425dd0475..b8146724a60e 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -50,8 +50,37 @@
>  #define XELP_PAT_WC				REG_FIELD_PREP(XELP_MEM_TYPE_MASK, 1)
>  #define XELP_PAT_UC				REG_FIELD_PREP(XELP_MEM_TYPE_MASK, 0)
>  
> +#define PAT_LABEL_LEN 20
> +
>  static const char *XELP_MEM_TYPE_STR_MAP[] = { "UC", "WC", "WT", "WB" };
>  
> +static void xe_pat_index_label(char *label, size_t len, int index)
> +{
> +	snprintf(label, len, "PAT[%2d] ", index);
> +}
> +
> +static void xelp_pat_entry_dump(struct drm_printer *p, int index, u32 pat)
> +{
> +	u8 mem_type = REG_FIELD_GET(XELP_MEM_TYPE_MASK, pat);
> +
> +	drm_printf(p, "PAT[%2d] = %s (%#8x)\n", index,
> +		   XELP_MEM_TYPE_STR_MAP[mem_type], pat);
> +}
> +
> +static void xehpc_pat_entry_dump(struct drm_printer *p, int index, u32 pat)
> +{
> +	drm_printf(p, "PAT[%2d] = [ %u, %u ] (%#8x)\n", index,
> +		   REG_FIELD_GET(XELP_MEM_TYPE_MASK, pat),
> +		   REG_FIELD_GET(XEHPC_CLOS_LEVEL_MASK, pat), pat);
> +}
> +
> +static void xelpg_pat_entry_dump(struct drm_printer *p, int index, u32 pat)
> +{
> +	drm_printf(p, "PAT[%2d] = [ %u, %u ] (%#8x)\n", index,
> +		   REG_FIELD_GET(XELPG_L4_POLICY_MASK, pat),
> +		   REG_FIELD_GET(XELPG_INDEX_COH_MODE_MASK, pat), pat);
> +}
> +
>  struct xe_pat_ops {
>  	void (*program_graphics)(struct xe_gt *gt, const struct xe_pat_table_entry table[],
>  				 int n_entries);
> @@ -249,10 +278,8 @@ static int xelp_dump(struct xe_gt *gt, struct drm_printer *p)
>  
>  	for (i = 0; i < xe->pat.n_entries; i++) {
>  		u32 pat = xe_mmio_read32(&gt->mmio, XE_REG(_PAT_INDEX(i)));
> -		u8 mem_type = REG_FIELD_GET(XELP_MEM_TYPE_MASK, pat);
>  
> -		drm_printf(p, "PAT[%2d] = %s (%#8x)\n", i,
> -			   XELP_MEM_TYPE_STR_MAP[mem_type], pat);
> +		xelp_pat_entry_dump(p, i, pat);
>  	}
>  
>  	return 0;
> @@ -276,12 +303,8 @@ static int xehp_dump(struct xe_gt *gt, struct drm_printer *p)
>  
>  	for (i = 0; i < xe->pat.n_entries; i++) {
>  		u32 pat = xe_gt_mcr_unicast_read_any(gt, XE_REG_MCR(_PAT_INDEX(i)));
> -		u8 mem_type;
>  
> -		mem_type = REG_FIELD_GET(XELP_MEM_TYPE_MASK, pat);
> -
> -		drm_printf(p, "PAT[%2d] = %s (%#8x)\n", i,
> -			   XELP_MEM_TYPE_STR_MAP[mem_type], pat);
> +		xelp_pat_entry_dump(p, i, pat);
>  	}
>  
>  	return 0;
> @@ -306,9 +329,7 @@ static int xehpc_dump(struct xe_gt *gt, struct drm_printer *p)
>  	for (i = 0; i < xe->pat.n_entries; i++) {
>  		u32 pat = xe_gt_mcr_unicast_read_any(gt, XE_REG_MCR(_PAT_INDEX(i)));
>  
> -		drm_printf(p, "PAT[%2d] = [ %u, %u ] (%#8x)\n", i,
> -			   REG_FIELD_GET(XELP_MEM_TYPE_MASK, pat),
> -			   REG_FIELD_GET(XEHPC_CLOS_LEVEL_MASK, pat), pat);
> +		xehpc_pat_entry_dump(p, i, pat);
>  	}
>  
>  	return 0;
> @@ -338,9 +359,7 @@ static int xelpg_dump(struct xe_gt *gt, struct drm_printer *p)
>  		else
>  			pat = xe_gt_mcr_unicast_read_any(gt, XE_REG_MCR(_PAT_INDEX(i)));
>  
> -		drm_printf(p, "PAT[%2d] = [ %u, %u ] (%#8x)\n", i,
> -			   REG_FIELD_GET(XELPG_L4_POLICY_MASK, pat),
> -			   REG_FIELD_GET(XELPG_INDEX_COH_MODE_MASK, pat), pat);
> +		xelpg_pat_entry_dump(p, i, pat);
>  	}
>  
>  	return 0;
> @@ -356,11 +375,24 @@ static const struct xe_pat_ops xelpg_pat_ops = {
>  	.dump = xelpg_dump,
>  };
>  
> +static void xe2_pat_entry_dump(struct drm_printer *p, const char *label, u32 pat, bool rsvd)
> +{
> +	drm_printf(p, "%s= [ %u, %u, %u, %u, %u, %u ]  (%#8x)%s\n", label,
> +		   !!(pat & XE2_NO_PROMOTE),
> +		   !!(pat & XE2_COMP_EN),
> +		   REG_FIELD_GET(XE2_L3_CLOS, pat),
> +		   REG_FIELD_GET(XE2_L3_POLICY, pat),
> +		   REG_FIELD_GET(XE2_L4_POLICY, pat),
> +		   REG_FIELD_GET(XE2_COH_MODE, pat),
> +		   pat, rsvd ? " *" : "");
> +}
> +
>  static int xe2_dump(struct xe_gt *gt, struct drm_printer *p)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
>  	u32 pat;
>  	int i;
> +	char label[PAT_LABEL_LEN];
>  
>  	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
>  	if (!fw_ref.domains)
> @@ -374,14 +406,8 @@ static int xe2_dump(struct xe_gt *gt, struct drm_printer *p)
>  		else
>  			pat = xe_gt_mcr_unicast_read_any(gt, XE_REG_MCR(_PAT_INDEX(i)));
>  
> -		drm_printf(p, "PAT[%2d] = [ %u, %u, %u, %u, %u, %u ]  (%#8x)%s\n", i,
> -			   !!(pat & XE2_NO_PROMOTE),
> -			   !!(pat & XE2_COMP_EN),
> -			   REG_FIELD_GET(XE2_L3_CLOS, pat),
> -			   REG_FIELD_GET(XE2_L3_POLICY, pat),
> -			   REG_FIELD_GET(XE2_L4_POLICY, pat),
> -			   REG_FIELD_GET(XE2_COH_MODE, pat),
> -			   pat, xe->pat.table[i].valid ? "" : " *");
> +		xe_pat_index_label(label, sizeof(label), i);
> +		xe2_pat_entry_dump(p, label, pat, !xe->pat.table[i].valid);
>  	}
>  
>  	/*
> @@ -394,14 +420,7 @@ static int xe2_dump(struct xe_gt *gt, struct drm_printer *p)
>  		pat = xe_gt_mcr_unicast_read_any(gt, XE_REG_MCR(_PAT_PTA));
>  
>  	drm_printf(p, "Page Table Access:\n");
> -	drm_printf(p, "PTA_MODE= [ %u, %u, %u, %u, %u, %u ]  (%#8x)\n",
> -		   !!(pat & XE2_NO_PROMOTE),
> -		   !!(pat & XE2_COMP_EN),
> -		   REG_FIELD_GET(XE2_L3_CLOS, pat),
> -		   REG_FIELD_GET(XE2_L3_POLICY, pat),
> -		   REG_FIELD_GET(XE2_L4_POLICY, pat),
> -		   REG_FIELD_GET(XE2_COH_MODE, pat),
> -		   pat);
> +	xe2_pat_entry_dump(p, "PTA_MODE", pat, false);
>  
>  	return 0;
>  }
> @@ -417,6 +436,7 @@ static int xe3p_xpc_dump(struct xe_gt *gt, struct drm_printer *p)
>  	struct xe_device *xe = gt_to_xe(gt);
>  	u32 pat;
>  	int i;
> +	char label[PAT_LABEL_LEN];
>  
>  	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
>  	if (!fw_ref.domains)
> @@ -427,13 +447,8 @@ static int xe3p_xpc_dump(struct xe_gt *gt, struct drm_printer *p)
>  	for (i = 0; i < xe->pat.n_entries; i++) {
>  		pat = xe_gt_mcr_unicast_read_any(gt, XE_REG_MCR(_PAT_INDEX(i)));
>  
> -		drm_printf(p, "PAT[%2d] = [ %u, %u, %u, %u, %u ]  (%#8x)%s\n", i,
> -			   !!(pat & XE2_NO_PROMOTE),
> -			   REG_FIELD_GET(XE2_L3_CLOS, pat),
> -			   REG_FIELD_GET(XE2_L3_POLICY, pat),
> -			   REG_FIELD_GET(XE2_L4_POLICY, pat),
> -			   REG_FIELD_GET(XE2_COH_MODE, pat),
> -			   pat, xe->pat.table[i].valid ? "" : " *");
> +		xe_pat_index_label(label, sizeof(label), i);
> +		xe2_pat_entry_dump(p, label, pat, !xe->pat.table[i].valid);
>  	}
>  
>  	/*
> @@ -443,13 +458,7 @@ static int xe3p_xpc_dump(struct xe_gt *gt, struct drm_printer *p)
>  	pat = xe_gt_mcr_unicast_read_any(gt, XE_REG_MCR(_PAT_PTA));
>  
>  	drm_printf(p, "Page Table Access:\n");
> -	drm_printf(p, "PTA_MODE= [ %u, %u, %u, %u, %u ]  (%#8x)\n",
> -		   !!(pat & XE2_NO_PROMOTE),
> -		   REG_FIELD_GET(XE2_L3_CLOS, pat),
> -		   REG_FIELD_GET(XE2_L3_POLICY, pat),
> -		   REG_FIELD_GET(XE2_L4_POLICY, pat),
> -		   REG_FIELD_GET(XE2_COH_MODE, pat),
> -		   pat);
> +	xe2_pat_entry_dump(p, "PTA_MODE", pat, false);
>  
>  	return 0;
>  }
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
