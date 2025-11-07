Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2880CCF9F8
	for <intel-xe@archiver.kernel.org>; Fri,  7 Nov 2025 18:51:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8939B10E085;
	Fri,  7 Nov 2025 18:51:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fbBm7dfx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2455510E085
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Nov 2025 18:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762541516; x=1794077516;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1JRndx3EmfmYlOb3k/rTbWrg95c+fh3oLDiVQ/oEn2U=;
 b=fbBm7dfxg/qqdsqflAaswdx+vfE44EUC0J0koa/0I5z2M3lM55zPnX2Z
 Qo2ABUGktKaaalq8mUH19AAwvyuoNPdyymDTKehOTPdLcvUuWoiYaJ7gN
 uUaFyqT3jg+yqHQv5MbrzFCuSh49Y9PpVB2b8llfnpOgSS/PSWVtRCWLK
 2reu9VvXfpyZN8fj390b0FVMygYDaXmMsHOuMPIBsJvJZ6kEyHGn4eJfw
 UvHfAE0Wh6jASHipxTx/dmvfulNJi8jT3sWiaoFj+Zb6B6EYYRG5Zaeh0
 iXUTsmL4NHi0SM1MzBiDGzPvQHGCWlQ0+nvDAkNQJamoDFFn+ecwJhKt2 g==;
X-CSE-ConnectionGUID: FSDE/voMQWqlsoK1aYIgMQ==
X-CSE-MsgGUID: GW76PFLSTqSBTfxyW1yVHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="75387233"
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="75387233"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 10:51:56 -0800
X-CSE-ConnectionGUID: rMeH4MLoQhO7pnJRj7JEQA==
X-CSE-MsgGUID: +WymPyRpTnuLHKcSadXONw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="187754344"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 10:51:55 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 7 Nov 2025 10:51:54 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 7 Nov 2025 10:51:54 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.40) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 7 Nov 2025 10:51:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fSWuOJbac4fWnxG6hmFOBNHQzgTIzPENnQQJQH3UKUXs2vffvd1+weAfZh+YOh7KhG5WxZuFwSnJsJZEuzZgAyAwTlq0GzQ/WXBlKJYMhENCY4st4YN/1VL2kRuDjcvh+CxIXG+Bnx9d44DeqqJxNH2yNNA12pmn0wN7uWyRSHt40Ba6LzO68KDMW+17UAbzgWQCSVUVST84E3qQQVmOX7SZAOjhwDZbl+yoSQqiEdDyXO+1wrmlEXjaHXDeXQVeJSDOXnjHV8hhrI8xEkydO9MBr1KSuU7f7DAEbYoGn2lChnBMoMMRqBewoR2tWJ2adg2uUhI0rmpU26UJ1Q34FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BpH/S3K36kZyoZbOZ6OJQhGv591uE1iKCCRa/JVciGY=;
 b=lWmYSZxUwnv7vh2iFqvYXK53K59p/h9ABRjLySY7GwoSOJCFOgRf+oaDYkMu/dU/KPKD477dYJ71Q00zRlim6e5EEZWA4mX3cIzyuZJk8iaYB18daJ6nL2atd5pScsW6YfOorU4ruquAy1/jxQTMBfy96PZoexyqWLYdgSsR109eIZ5R6/dcjwF0g53McGvo3xVHcnaBvibCF1Q9sKe0rVClRpk/Neyzy2qAxy3+Z59fN2G9kxFzMAfdlzIghpHmG7hh/tJQLNSCRNYhPOT7blk5mj69AK0eWQxD+f7UG2qjcffIXGVzCD/eQHOWkCY6Awb3OuZdZ+7rQ+pulS0C7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH7PR11MB5887.namprd11.prod.outlook.com (2603:10b6:510:136::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.13; Fri, 7 Nov
 2025 18:51:46 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.9298.010; Fri, 7 Nov 2025
 18:51:46 +0000
Date: Fri, 7 Nov 2025 10:51:44 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>, 
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, Francois Dugast
 <francois.dugast@intel.com>, Priyanka Dandamudi
 <priyanka.dandamudi@intel.com>
Subject: Re: [PATCH 2/2] drm/xe/xe3p: Add support for prefetch page fault
Message-ID: <20251107185144.GI3905809@mdroper-desk1.amr.corp.intel.com>
References: <20251107-pagefault-prefetch-v1-0-93291d619126@intel.com>
 <20251107-pagefault-prefetch-v1-2-93291d619126@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251107-pagefault-prefetch-v1-2-93291d619126@intel.com>
X-ClientProxiedBy: SJ0PR05CA0170.namprd05.prod.outlook.com
 (2603:10b6:a03:339::25) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH7PR11MB5887:EE_
X-MS-Office365-Filtering-Correlation-Id: 528b977e-2ce8-47db-b47f-08de1e2eb3b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9Oc2R50tSJcqKFOpChzCktw0F2gtDT3WCmZctkp8XIOITUYuYY/mshqgCjkT?=
 =?us-ascii?Q?7tXHTAbwv9G1YMgm48dabNPB/9IxKkBGWqiZMknu+IpdE61FZImG8RHmFSUj?=
 =?us-ascii?Q?jg00y32A7hfziIzwdyDbohs11MR6aJGM9GuDjr9XEt87YaXQU/1WVGcpsO6A?=
 =?us-ascii?Q?4p4dfosnhCUNlf+ibTPgYRHbxzHrB4aSSoJ946FX+lmx0OLMkJ+dbG5gMHBZ?=
 =?us-ascii?Q?3fJXlDcxA2XzmvFmcSuap5MXMJMnw94OWx8QC4yVS6l/8l5qAZBZArB5JwQi?=
 =?us-ascii?Q?krgEuaAVU9wlQqctztuk2EhbBl4fdxcvMvbaudyKN6OQVyG4olTU3ESLZKI2?=
 =?us-ascii?Q?tu3it2J/2jOJwACOBJH1YTkgDAM8PTkgB5fH4DpFDI5yn27JNmdQaURG2Osd?=
 =?us-ascii?Q?TPKkqsPZc877I1If9Ths9fvjFnrThcRxHtTKZCOSlCDnF8+6kkY0x7IHhCAb?=
 =?us-ascii?Q?oLxX7lbkwfh4908NdQ9iiJAqMYONwjShDuJSsRafAhVtgyKv/8FYbYkUu8bq?=
 =?us-ascii?Q?fYaDhHYc5DwYO5lq0N7IUd6+Ij1+YcDPs2HTnuw5tHWHF4Q95TBaBpPr7BOe?=
 =?us-ascii?Q?bNAsoSKdPukhBT7x7zBgIS5axSJIPE75TZlofQtmht585VnA1+LwvYupDItK?=
 =?us-ascii?Q?+LN9NQpp9yYtejEZ9s/5JeAUgkyjnAmSXqB3iAdsu4fCD3MwltFq3Yh3V0Sy?=
 =?us-ascii?Q?AZE9yGLyND4zQ9Ta4lpSatK3+dyio2c2s+B80iE1SmtaFjy+fXpsewH7asG4?=
 =?us-ascii?Q?gmE9QHNAM0tjAxC/sSQxG0V1mndwZzPoa9VuIQMeHKlyaI2jjafZk9V2CYem?=
 =?us-ascii?Q?KrQyfrHV0QiMvS044j4IQNmdkEbaa3VpDcNZrWYdixL5S62ftqHS/Dfy+Wk1?=
 =?us-ascii?Q?xf2d2kyq3hX8dqWPcE3HpLzH0WhU3tXDz9Bd4EWvjFtQBLNFR0y8yu4kuQA4?=
 =?us-ascii?Q?lDbblPuu1Rwndd4iUnqH71rE/jqCgMmrmQ6AqGUSW1WQoD7XN61ZJ40q2CHR?=
 =?us-ascii?Q?I0L/fR+vegmVAaFXuHDUCMrPyN6mkCuR7U/YKQj8PpnT6wOj/DXKxlL0/d15?=
 =?us-ascii?Q?eVSaMj9e8VP+3jc2DBUuMaSnuHW0i4BzuDz+LBmVE66broScmzyQd9NynX/h?=
 =?us-ascii?Q?JA85nDF2JiBuRstG+qPbn4v9X/1Gen0bDIUn75Pa/yoFag1oZ/fvIDY8EMWQ?=
 =?us-ascii?Q?nLXUqS+szaPw+RoyRYisS95/fFkxnACcXRrvjkF3r4VgaZvD3555lBmpayxL?=
 =?us-ascii?Q?jU3/D/vfnQ8qKxut5AEC4xLBn3n4EFKOgmMYfbXL7QySZKspLdWqlqAsANdS?=
 =?us-ascii?Q?VbbRGm4MS+FCfcGPjPLhGfz5G67CabIt1xvI5VsIqTIbAOKkIpBgfp4a0nBe?=
 =?us-ascii?Q?oiP3eS7ZEo/D7oPXw/rLoIgcUOXNOz7qZZDnjQpWXaTCov/sSmKM4PkpJrxB?=
 =?us-ascii?Q?7SSAgJT6ezfQDAlIP6F7BewFFoeVp1ke?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IucbHaF8VEiC1CLw3vy3ihVIdMmzG0D62RvlnBBUDGMi8WnsL8UbVeEU+t4u?=
 =?us-ascii?Q?O/Rrpuqgxej0Y7zqtv2z6ZcauwV1HUGMKZMwUhYLWdpERY+vtMMSI+ovQH5G?=
 =?us-ascii?Q?p4Q79WtvLSTQTDY0bj737ENjK9MHmeHuNP9u6ye47r8wYgj0rHfCEGJHM5T4?=
 =?us-ascii?Q?26qp7H6unOAbUASHJLjvGB0fc0CsnsONKDbEHTLIXlEDxgxXDCWYf6GAB4DN?=
 =?us-ascii?Q?G8V0Aa9rP8Qiq5i3eAk9XPoAeSsgyycAlyeIYozmg3iAbQuDefJNadYqQSKw?=
 =?us-ascii?Q?UJpNymfcWTdRKNHRdyJD1X4iKPIiBKmo+Of/dAK58bsxJiklK9LxMyP3vBIV?=
 =?us-ascii?Q?Cve2QdRYz9p8jBtZJOksV3vKKnsF0Tmjp+DHk3bymTC7jICpko1pHuS4LSs5?=
 =?us-ascii?Q?p+QcgRliGTOlnOyNnqVWzw3GCACG2rvpw9S4Oj9NDO2IFHIXDZQh2qx9i8AF?=
 =?us-ascii?Q?r10/vpkD0PbzKYvX/D1MrajYON80K52Doqu2SuMT/OGGmhwBDzwt8N6nEFKk?=
 =?us-ascii?Q?2B6bHZPzKKeRzagCWg+gAN/bEo2ZcGwKkjn/r6zAHcPAYtnvbc5ruu5H4H8D?=
 =?us-ascii?Q?Q9bCh3H2698R6XaCI+K2DBqrrArC2r/aN+BvBxPAxVniV2RiBJFstLV5TbeY?=
 =?us-ascii?Q?BwK0Dxfhgg5zeZUhBrnpl2dULTutHEekkWvlF/q3jWn+/X+rmxWt45iRaHRw?=
 =?us-ascii?Q?OP1pcwBCkrkm0VwGJ8J9ilU6ZSfbwlmTIcSB2E9kCGqU4W6PskVFtwDqUReu?=
 =?us-ascii?Q?7Q+NC6y60IH8d/jaHU02q0Sfw4dlCEdWLF7reiIxU1R2KmAXEcNkEDQJFW+0?=
 =?us-ascii?Q?GMXZGbnNa92lXZtIFXc62xFlQFelgk1/VhaE5xfEGxQxdSuUViZ1qtZJv8uV?=
 =?us-ascii?Q?BmzrRv9LQK7vjNLmF3svM4Wzy7+YQUqyE//p+FpbRnvFZCAmghACrT4FvoEw?=
 =?us-ascii?Q?o1WLVozyU1Bqz/9Zo27gaUyWe+8HoqIBLY3j+XZOOTuC26t0eteLdbz8qV2S?=
 =?us-ascii?Q?nzP9GFsoL38zbKMcqruSa0nreVH/a3oxkDEWI908Dl+nCjbpyxgiIb5MM5xR?=
 =?us-ascii?Q?xwFC3tTmYLyNzqf37jrKhAMpFGhUwa9/g0wBgkgissJZbZ7ID/v6hNFfM7wz?=
 =?us-ascii?Q?qjh3m3TkKc8c3LnYp3i5R4kBBM684Ho1lbWNGiNhZkrJdlemjK8PORbLUKD7?=
 =?us-ascii?Q?/095DbBDtfA1yMZ9FEE28mjh+XiTcU8EaiLUeL6R+gL86w/OPXM9f+NpzkJ/?=
 =?us-ascii?Q?ladBHxPEz7WbW6G+x8G6bl6pk8gmr3ESLhpmfRhdT75NYho5ER4sWEJfZTDg?=
 =?us-ascii?Q?uQfj0vsIYa68ZAr9TNR3XeT2B71K9Yj7/5NiJtnikbIhmmWIphM2v2rloulY?=
 =?us-ascii?Q?hNo4GLJd7rR7YdLPKzyIB/t79yfCp3jlRMfQyCEDksTRJIEffekOMC4e0kGV?=
 =?us-ascii?Q?cA7DXwrXr46x6cUbFd/xfZeiCVaAU6NGaWQbTeB8aCZL5TJh1N9PLS4kJbwq?=
 =?us-ascii?Q?t8bvkte4J0X0y6R0NHs7dLDHHNZMxw0SRwtTZTgN+YFbGD7GJKNalYzBGdPJ?=
 =?us-ascii?Q?LA8Bxl7I10C/7RvvzNoPkgeykJgp2BOvvRWLckGTbCxQsAJsopBThQS6ra8w?=
 =?us-ascii?Q?5Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 528b977e-2ce8-47db-b47f-08de1e2eb3b4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 18:51:46.6902 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LKLyK3XlqVZqVOy+A/DQ+9ERJOJ22AQD0dKb2eFJ3Ko0tlNF2WM2XPfMDqHI+pLJGJZynNVeJKMkwYWSp6c2AXj1yG34+d075V//CXejF38=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5887
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

On Fri, Nov 07, 2025 at 10:10:25AM -0800, Lucas De Marchi wrote:
> Xe3p prefetches memory ranges and it notifies software via an additional
> bit in the page fault descriptor that the fault was caused by prefetch.
> The prefetch bit should only be in the reply if the page fault handling
> was not successful, which allows the HW to avoid generating a CAT error
> for prefetch faults.
> 
> Based on original patches by Brian Welty <brian.welty@intel.com> and
> Priyanka Dandamudi <priyanka.dandamudi@intel.com>.
> 
> Bspec: 59311

That covers the response, but we should probably also add 77412 where
the descriptor is documented.

> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_stats.c        |  1 +
>  drivers/gpu/drm/xe/xe_gt_stats_types.h  |  1 +
>  drivers/gpu/drm/xe/xe_guc_fwif.h        |  5 +++--
>  drivers/gpu/drm/xe/xe_guc_pagefault.c   |  2 ++
>  drivers/gpu/drm/xe/xe_pagefault.c       | 13 +++++++++++--
>  drivers/gpu/drm/xe/xe_pagefault_types.h |  7 ++++++-
>  6 files changed, 24 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c b/drivers/gpu/drm/xe/xe_gt_stats.c
> index 5f74706bab814..af7b859861730 100644
> --- a/drivers/gpu/drm/xe/xe_gt_stats.c
> +++ b/drivers/gpu/drm/xe/xe_gt_stats.c
> @@ -35,6 +35,7 @@ static const char *const stat_description[__XE_GT_STATS_NUM_IDS] = {
>  	DEF_STAT_STR(SVM_TLB_INVAL_US, "svm_tlb_inval_us"),
>  	DEF_STAT_STR(VMA_PAGEFAULT_COUNT, "vma_pagefault_count"),
>  	DEF_STAT_STR(VMA_PAGEFAULT_KB, "vma_pagefault_kb"),
> +	DEF_STAT_STR(PREFETCH_PAGEFAULT_COUNT, "prefetch_pagefault_count"),
>  	DEF_STAT_STR(SVM_4K_PAGEFAULT_COUNT, "svm_4K_pagefault_count"),
>  	DEF_STAT_STR(SVM_64K_PAGEFAULT_COUNT, "svm_64K_pagefault_count"),
>  	DEF_STAT_STR(SVM_2M_PAGEFAULT_COUNT, "svm_2M_pagefault_count"),
> diff --git a/drivers/gpu/drm/xe/xe_gt_stats_types.h b/drivers/gpu/drm/xe/xe_gt_stats_types.h
> index d8348a8de2e1b..23d72c95a2b5f 100644
> --- a/drivers/gpu/drm/xe/xe_gt_stats_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_stats_types.h
> @@ -13,6 +13,7 @@ enum xe_gt_stats_id {
>  	XE_GT_STATS_ID_SVM_TLB_INVAL_US,
>  	XE_GT_STATS_ID_VMA_PAGEFAULT_COUNT,
>  	XE_GT_STATS_ID_VMA_PAGEFAULT_KB,
> +	XE_GT_STATS_ID_PREFETCH_PAGEFAULT_COUNT,
>  	XE_GT_STATS_ID_SVM_4K_PAGEFAULT_COUNT,
>  	XE_GT_STATS_ID_SVM_64K_PAGEFAULT_COUNT,
>  	XE_GT_STATS_ID_SVM_2M_PAGEFAULT_COUNT,
> diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
> index c90dd266e9cf9..1d6f9ebb376df 100644
> --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
> +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
> @@ -309,7 +309,8 @@ struct xe_guc_pagefault_desc {
>  #define PFD_ACCESS_TYPE		GENMASK(1, 0)
>  #define PFD_FAULT_TYPE		GENMASK(3, 2)
>  #define PFD_VFID		GENMASK(9, 4)
> -#define PFD_RSVD_1		GENMASK(11, 10)
> +#define PFD_RSVD_1		BIT(10)
> +#define XE3P_PFD_PREFETCH	BIT(11)
>  #define PFD_VIRTUAL_ADDR_LO	GENMASK(31, 12)
>  #define PFD_VIRTUAL_ADDR_LO_SHIFT 12
>  
> @@ -329,7 +330,7 @@ struct xe_guc_pagefault_reply {
>  
>  	u32 dw1;
>  #define PFR_VFID		GENMASK(5, 0)
> -#define PFR_RSVD_1		BIT(6)
> +#define XE3P_PFR_PREFETCH	BIT(6)
>  #define PFR_ENG_INSTANCE	GENMASK(12, 7)
>  #define PFR_ENG_CLASS		GENMASK(15, 13)
>  #define PFR_PDATA		GENMASK(31, 16)
> diff --git a/drivers/gpu/drm/xe/xe_guc_pagefault.c b/drivers/gpu/drm/xe/xe_guc_pagefault.c
> index 719a18187a31d..b6c12e5630672 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pagefault.c
> @@ -27,6 +27,7 @@ static void guc_ack_fault(struct xe_pagefault *pf, int err)
>  		FIELD_PREP(PFR_ASID, pf->consumer.asid),
>  
>  		FIELD_PREP(PFR_VFID, vfid) |
> +		FIELD_PREP(XE3P_PFR_PREFETCH, pf->consumer.prefetch) |
>  		FIELD_PREP(PFR_ENG_INSTANCE, engine_instance) |
>  		FIELD_PREP(PFR_ENG_CLASS, engine_class) |
>  		FIELD_PREP(PFR_PDATA, pdata),
> @@ -77,6 +78,7 @@ int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len)
>  	pf.consumer.asid = FIELD_GET(PFD_ASID, msg[1]);
>  	pf.consumer.access_type = FIELD_GET(PFD_ACCESS_TYPE, msg[2]);
>  	pf.consumer.fault_type = FIELD_GET(PFD_FAULT_TYPE, msg[2]);
> +	pf.consumer.prefetch = FIELD_GET(XE3P_PFD_PREFETCH, msg[2]);
>  	if (FIELD_GET(XE2_PFD_TRVA_FAULT, msg[0]))
>  		pf.consumer.fault_level = XE_PAGEFAULT_LEVEL_NACK;
>  	else
> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
> index 68bcc25f27890..81e641a9b2274 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> @@ -222,8 +222,14 @@ static bool xe_pagefault_queue_pop(struct xe_pagefault_queue *pf_queue,
>  	return found_fault;
>  }
>  
> -static void xe_pagefault_print(struct xe_pagefault *pf, int err)
> +static void xe_pagefault_error_account(struct xe_pagefault *pf, int err)
>  {
> +	/* Don't spam log for prefetch accesses, just add to stats */
> +	if (pf->consumer.prefetch) {
> +		xe_gt_stats_incr(pf->gt, XE_GT_STATS_ID_PREFETCH_PAGEFAULT_COUNT, 1);
> +		return;
> +	}
> +
>  	xe_gt_dbg(pf->gt, "\nFault response: Unsuccessful %pe\n"
>  		  "\tASID: %d\n"
>  		  "\tFaulted Address: 0x%08x%08x\n"
> @@ -262,7 +268,10 @@ static void xe_pagefault_queue_work(struct work_struct *w)
>  
>  		err = xe_pagefault_service(&pf);
>  		if (err)
> -			xe_pagefault_print(&pf, err);
> +			xe_pagefault_error_account(&pf, err);
> +		else
> +			/* Prefetch faults should only be acked on error */
> +			pf.consumer.prefetch = 0;

The comment here makes it sound as if we shouldn't send any ack at all
if the reported fault was a successful prefetch fault.  However the
actual implementation (and the commit message) has us still sending the
ack, just with the prefetch bit cleared out in the response descriptor.
We might want to rewrite the comment here to clarify.

>  
>  		pf.producer.ops->ack_fault(&pf, err);
>  
> diff --git a/drivers/gpu/drm/xe/xe_pagefault_types.h b/drivers/gpu/drm/xe/xe_pagefault_types.h
> index d3b516407d600..f42336602f974 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault_types.h
> +++ b/drivers/gpu/drm/xe/xe_pagefault_types.h
> @@ -84,8 +84,13 @@ struct xe_pagefault {
>  		u8 engine_class;
>  		/** @consumer.engine_instance: engine instance */
>  		u8 engine_instance;
> +		/**
> +		 * @consumer.prefetch: fault is caused by HW prefetch - should
> +		 * only be acked on failure

This one also seems slightly misleading to me.


Matt

> +		 */
> +		u8 prefetch;
>  		/** consumer.reserved: reserved bits for future expansion */
> -		u8 reserved[7];
> +		u8 reserved[6];
>  	} consumer;
>  	/**
>  	 * @producer: State for the producer (i.e., HW/FW interface). Populated
> 
> -- 
> 2.51.2
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
