Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECF40CDD55D
	for <intel-xe@archiver.kernel.org>; Wed, 18 Sep 2024 22:37:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F03110E20D;
	Wed, 18 Sep 2024 22:37:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BEzqj6Yp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55DAD10E20D
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Sep 2024 22:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726699056; x=1758235056;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=CCrdZI7C4Z/yMbwvkgiiDtscwrsKirG6YJf2f/hR6no=;
 b=BEzqj6YpY4EqmBb9G+iTiJqqN/CvoV7ZdowqToIxBYKeW5FwDURS7oas
 S0bttiBSZzXKYh8NYrBz6IljIKNG826rxNzY+iF3W7+iTGGAoVtAb2CZB
 Hof+HxbKWn7QTsELt8a77abvaVpBGZCU7clGPG9nG3/hnbAwF+YOHhT9n
 NT/N1PLdEsro8b3pyi3x5yGShfib1ctPk/J7wc748eP1XV0kQS2J7OCcP
 RhKNfNJG6BvhMnrVpKsRtnjF0eIVDFgJzpuQ0AzCE1d+m/D4U2qdeiv69
 cgQ15o7EKuYWI01QTf+YP32NkhGhEZR23g8Q1dwmxKotoF5GfXMwobpE8 w==;
X-CSE-ConnectionGUID: hSaT6ZdAQ3yFGPOsxwFTDw==
X-CSE-MsgGUID: 7KZRyLbMQfeNaQaOFPU+Bw==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="29534377"
X-IronPort-AV: E=Sophos;i="6.10,240,1719903600"; d="scan'208";a="29534377"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 15:37:36 -0700
X-CSE-ConnectionGUID: 9RnzQZgbQJCiYjP1opd/cQ==
X-CSE-MsgGUID: Yl7SNuinSkO+eii87yFoVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,240,1719903600"; d="scan'208";a="69326486"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Sep 2024 15:37:36 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 18 Sep 2024 15:37:35 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 18 Sep 2024 15:37:35 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 18 Sep 2024 15:37:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M36a6aXN2e/G/LvAePi2ZaLFa2cW2T0dy1soy+thdHzLaeTEIIhrCnEKM7atXYpUNuuLgPWEIyzz4k8oU3D0Wr4c6sItSTk7+LEZ+lrQG8LoQdYpwVmI+txnCVtLkepJYxMj9BQYieeRH/bnruiT+srRjjgG+8U3DBVXGzhF2WugghlLqCkOXirJlKgOM+nk2DzUpxq7UUsilWZet5cg0rcUBjBERDM30d01Fl194jEaTvJhOafzUhyBeHjRYMqcj2cEY5B9LLTOe4+fDdditZe65pu60FRb3X2NxupJHgbx4HCwInEizjoLK2P1xEw3wUU3Bjbi83JG/Emp/4Qm7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p1tXi9VXxI3uyy1JGqNEd6Opjj8HKFguyZxZKzruQGE=;
 b=jfIaT98V7cFTpGlZzVZlKLN0Lf1nZIUa6DkUnhT2rJUzkNoUitKgqxJBeY4/2FZaveXNi5qQtzCd+9wipnvJmi+MuCnRcN5J4YT+nis8NR0BUQ6fHBgo8330Sg2t/UU0MEGS67+UBin8u4mmPsusFo4RkvEfbEYYWRbjJVmrOSv5D4YsjQy1lJ6UvHEr14YfU/Gnm+OR9JXt/HQBVSlnEygWY/5gA08Wc+EP3VET1vLgJDOzEcTrdS4AI2yIUircydyHONFregCio1xfFACYC1P5cJz4Yy/4+K2svi8AJaAFiozDS8mtL4eJ4hauzFiQHWYHcpUnSaAFYcChcM4LpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB6143.namprd11.prod.outlook.com (2603:10b6:8:b1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Wed, 18 Sep
 2024 22:37:33 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.7982.012; Wed, 18 Sep 2024
 22:37:33 +0000
Date: Wed, 18 Sep 2024 22:35:56 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Zhanjun Dong <zhanjun.dong@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/1] drm/xe: Add null pointer check for xe_migrate_copy
Message-ID: <ZutVzBOBcklkarY1@DUT025-TGLU.fm.intel.com>
References: <20240918221000.1124248-1-zhanjun.dong@intel.com>
 <20240918221000.1124248-2-zhanjun.dong@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240918221000.1124248-2-zhanjun.dong@intel.com>
X-ClientProxiedBy: BY5PR16CA0005.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB6143:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f06ba90-ce1a-491b-364e-08dcd8327c7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7NoOKS1Nj5rhr1/Jaq73v90F9Z1/MAC9eZIz2S8Cnyk2zkBZr0RBJF45qT1P?=
 =?us-ascii?Q?seUyyAFtvs65uwA06xymefQ51W3NSZ3I6njEUfu3jOvQ98gKbRIgAP9ukl/3?=
 =?us-ascii?Q?E3B54MGYre5oJJsgRK8TNisBwz+BrYvJw1oiuqS0D0GyDjpdfu4tLCUHxH+x?=
 =?us-ascii?Q?0ugxsKgEzb7VGVVY+bGoiZ3peLR8k/FsUoFqW11HOHPzcdNgURYGvBe6MC5E?=
 =?us-ascii?Q?b3eX2Z+qfPHGMd3Ix7m1WUNmsIkGvzJ0oS4SKj2igUxAjCZawPProQEkZrfi?=
 =?us-ascii?Q?JnbASd704fNhXIMtpLrVAiNNjHXMf+gGSLaHKb3wy2kn5f9vCk7J6T7nJo3Q?=
 =?us-ascii?Q?PtwkRqI0hxl1OOYj8xiat2F/SbIT8kQwqB8HvWkA8kKNy7euvgMpEQeCZ3m1?=
 =?us-ascii?Q?erteflT7YC2nrXkgaBAXvIHkRuQGikuxV/U6Nifx5OVIvDFw6BTWYPAgAuvt?=
 =?us-ascii?Q?Q2BGiactsj3AnwJV1BWrkdBA0L0AMbd/2/nW9bVpL++SCwLzDxT6LzUm+KGG?=
 =?us-ascii?Q?38ymkkSVArHMpyKFpxkZ3mGxym1+FG85N6XHWPkTa5g8YD4Ii+iyBoE8e7za?=
 =?us-ascii?Q?o4GvRQd6XXaE/MI7wotDPZD+4V2RBsE0JBwNHeMoNbt8Ibt75VR9UtxNkN9w?=
 =?us-ascii?Q?ksIf8J97RpDZGLcIusaETQsf4mBmeBVn0Y923roQa1HvcM551kFRMaCuOGz0?=
 =?us-ascii?Q?rxQ9Csa4jQMv6K37cbZnwJVlZZ1ajTnujoQybBwLh429v3cRT980wqOrevUh?=
 =?us-ascii?Q?OwocpSvBIbBOxF5JqQ3ljhPc+t+l5H4V2Dgx6Pi0QrhKZfvYvFVvDE9LDSfY?=
 =?us-ascii?Q?Iysr/GOnmQf6JsNmWQhkeZZ+Oxu9yfKta9rMRFnpnkMpuStcGpPgNK7dkIrl?=
 =?us-ascii?Q?z9s7+1KyrWk56RYfciMMJemPY/YwEC6NVS3CbXUJdoHbzFqrFhIIAHT8mRy0?=
 =?us-ascii?Q?4Ed/iBex5ylnQJCozIm5gyUvlDoXfeRYn9xgNoQSbANAZHv77xTQ5DQv/Mec?=
 =?us-ascii?Q?o40SrGkRpLCoWFSS7uMZfUXs3QRwOXgq+ZfaB6t+QL8Wh9eCTUQBWMUlu3az?=
 =?us-ascii?Q?1+uDCXY+UmRpQkA5LPbrLj7mJTq5gyXrK1tDABeQdJ7tjDZQ45rG1vriUDLE?=
 =?us-ascii?Q?Bz1yalRvLRZ2IyQOE8H2QGXuSVUBLXkgZEDbHCwZOW12Z5XKk3YWbst1Mpdk?=
 =?us-ascii?Q?Y0bX6ijMd1OlQ76d4dBxC46je7YLhpyw3y/DriqopjgVenWL4GX158MA/6b2?=
 =?us-ascii?Q?S2TyqkIRZ4heT6KuTRvThDJtxwbBnt0L+FozS0wSJ8nbJVYGAjKey0uA2QyZ?=
 =?us-ascii?Q?BB5DjYmoSnSC6xt0CWNJ8mg82D0mn6EMIL2sZPUNbUL6zQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/E5+2/ZMaDV5CBlXom9gp4Hxa5EGHLgU8NagF6HSxc8mkQSUYlxELkR87ouF?=
 =?us-ascii?Q?da6yUh/L39ZAlQlpAFS9+q2032G5XasHpiEDdgQHIfVLqCGeyiJ4k8WKMRyb?=
 =?us-ascii?Q?IvqT7N5i4oXGc4Jl3zK7WqlMwHGZMIebvfHUBjNYXyzN4hQlzPLjXe8RHM6X?=
 =?us-ascii?Q?Z0QeWYYEIdkjWx0zMs8xnm/rbI6BFEty+TU9id4fgokJvElph7Hxvofc3fkA?=
 =?us-ascii?Q?2ZQFNmeJigU9QkpPCUXCM055I+WA/eQHdvJulEAZxxrNr7ftYL68um9rThZo?=
 =?us-ascii?Q?y/Vb9oL2oEiep0KOboC6P/tHZEGyVNGnZh7j89Lqu2HyKXFl+9MROkuBzzHy?=
 =?us-ascii?Q?pL6eAxL+VEDaNwZreV4SMY/WHHBMR251JIl3u+/LByTc/COKkmKscdjB2YOa?=
 =?us-ascii?Q?+a964LoXXWDDU5vBHTOgNcv3jq3pCPQm5fOIcUE8EmL94nXTcRcPx7ZdynOU?=
 =?us-ascii?Q?CPDEuE1v3yYJgMCWdIE6ogb7tVSZjx3NI7u1hUlkFAnLEs8o3ONeIjX9b8Wz?=
 =?us-ascii?Q?R3mlL5tbJAfVmPhzEwulb2OsrTP2aFvKWul9VTK+dH/4NlZ4sFOAqO7uqblJ?=
 =?us-ascii?Q?dscDZGmFvzWHDfGtFR89LZEnPuuF65GyD1f6hK8Jq7p67kXVCSJJdiTFJSDY?=
 =?us-ascii?Q?j4YPm0yi8Gg0XgdS6vetg/JQsFg6w9HRTd8f/TSgfqubbzIoVvyB2BTd7b6N?=
 =?us-ascii?Q?L1frbBZ0LEzTvfrMf9bFaOZ97QL9g7HKef0vSMVxwu/xxDJDPAvnT2RUpjsD?=
 =?us-ascii?Q?BOtj3DKbGFMEiMECsopsveFr83ZGiyfU4pQ8LAgeEqdBxFsmzVHQbAXFCn/c?=
 =?us-ascii?Q?bu5sCsvAIkSiLq1Sbqg3pIkY4XS4WopQBYgh7TH5YnmQsjvAoCj1FZDBt/Zo?=
 =?us-ascii?Q?Gz4mSpLY/g06SybqUyi/Y06V1LL+9PZGx91seVkWdHLPp+qf94xO5ScEbi5r?=
 =?us-ascii?Q?3Xo61OPlx8RlGD/b+XBI03htFAsLCQ4Hm6JHevLPLYQGNZ/wcmM8LGrOaC7t?=
 =?us-ascii?Q?wPFDwnw17Q3AYd4it3hUjtzw0CKivwhKVeoAPB7UKbYjy3GZMFjRGZnrr+Ow?=
 =?us-ascii?Q?h2tPJHO7xXDchLD5GzAKZoCZ5OPfDq9YI35VYWP8h2igbzfp9mx5HepheHfP?=
 =?us-ascii?Q?ObAesaabhboVDNrCTTItmSkVrvcNX7OXk0X1ywu5VfMa81W4y55nd+A+efXa?=
 =?us-ascii?Q?FzeaZB1IE9wX9nx98cSbxwzvtMY5NlVZLYg1L7uR4L/6WgajNFsRvirpRKi1?=
 =?us-ascii?Q?RRiyBlAmrmkFnLU3hpFnqNm76+/lXmljRhH5rI18t4iwABG3vaFscXYw9F29?=
 =?us-ascii?Q?3sX0AaNrhXl09dUo8d9uW6fb5DGV9IJ49cCGS0wx7n5Uu0fOBxHNNz/uZvUh?=
 =?us-ascii?Q?dWS8qP2htbFzAw0hpJBpuCizv4rnIR7gyHuqYfqZV7sR4aLPr5SjUfeFtDdL?=
 =?us-ascii?Q?ram0zh9QWG6/IRIkQ06XxiA6QVkC+3ZHcp+yer3PEpbS+bEFdOyAMG7FA/+F?=
 =?us-ascii?Q?cqwVH7gLr1m0lW1n9zwdyjgvHQmf0fHq57Rj5SL9Q05PIZjaRx0YHSxWISFO?=
 =?us-ascii?Q?9Htjy3ITdIvrJjcnXNOxnwJYPqp0BoP3k+IWxcQ0d+8PCRJHofcmJimW+9S0?=
 =?us-ascii?Q?og=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f06ba90-ce1a-491b-364e-08dcd8327c7f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 22:37:33.0153 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8l/PuGK4yShMWsT7V2THh9qJcKBmrfchX1dLfnyqWCRU9qQ1GV+yvold71/sd0U8Q2F7SvzNnT9GDeu1NS12qQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6143
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

On Wed, Sep 18, 2024 at 03:10:00PM -0700, Zhanjun Dong wrote:
> Add null pointer check for parameter src.
> Update lack source flag to include resource is null case in xe_bo_move
> before xe_migrate_copy called.
> 
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c      |  4 ++--
>  drivers/gpu/drm/xe/xe_migrate.c | 24 ++++++++++++++++--------
>  2 files changed, 18 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 5f2f1ec46b57..761130f0e9a9 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -682,8 +682,8 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>  	tt_has_data = ttm && (ttm_tt_is_populated(ttm) ||
>  			      (ttm->page_flags & TTM_TT_FLAG_SWAPPED));
>  
> -	move_lacks_source = handle_system_ccs ? (!bo->ccs_cleared)  :
> -						(!mem_type_is_vram(old_mem_type) && !tt_has_data);
> +	move_lacks_source = !old_mem ? true : (handle_system_ccs ? (!bo->ccs_cleared)  :
> +					       (!mem_type_is_vram(old_mem_type) && !tt_has_data));

I'd write it like this:

old_mem || (conditional)

But I think if old_mem is NULL this condition always evaluates to true.

- old_mem_type will be XE_PL_SYSTEM.
- ttm should be NULL (I think), thus handle_system_ccs should be false
  and tt_has_data should be false

>  
>  	needs_clear = (ttm && ttm->page_flags & TTM_TT_FLAG_ZERO_ALLOC) ||
>  		(!ttm && ttm_bo->type == ttm_bo_type_device);
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index cfd31ae49cc1..45bba0d731ec 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -774,14 +774,22 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>  	u64 src_L0, dst_L0;
>  	int pass = 0;
>  	int err;
> -	bool src_is_pltt = src->mem_type == XE_PL_TT;
> -	bool dst_is_pltt = dst->mem_type == XE_PL_TT;
> -	bool src_is_vram = mem_type_is_vram(src->mem_type);
> -	bool dst_is_vram = mem_type_is_vram(dst->mem_type);
> -	bool copy_ccs = xe_device_has_flat_ccs(xe) &&
> -		xe_bo_needs_ccs_pages(src_bo) && xe_bo_needs_ccs_pages(dst_bo);
> -	bool copy_system_ccs = copy_ccs && (!src_is_vram || !dst_is_vram);
> -	bool use_comp_pat = xe_device_has_flat_ccs(xe) &&
> +	bool src_is_pltt, dst_is_pltt;
> +	bool src_is_vram, dst_is_vram;
> +	bool copy_ccs, copy_system_ccs;
> +	bool use_comp_pat;
> +
> +	if (!src)
> +		return ERR_PTR(-EINVAL);

Can you explain if this function is called with src == NULL? That seems
to be problem in the upper layers if that happens.

Matt

> +
> +	src_is_pltt = src->mem_type == XE_PL_TT;
> +	dst_is_pltt = dst->mem_type == XE_PL_TT;
> +	src_is_vram = mem_type_is_vram(src->mem_type);
> +	dst_is_vram = mem_type_is_vram(dst->mem_type);
> +	copy_ccs = xe_device_has_flat_ccs(xe) && xe_bo_needs_ccs_pages(src_bo) &&
> +		xe_bo_needs_ccs_pages(dst_bo);
> +	copy_system_ccs = copy_ccs && (!src_is_vram || !dst_is_vram);
> +	use_comp_pat = xe_device_has_flat_ccs(xe) &&
>  		GRAPHICS_VER(xe) >= 20 && src_is_vram && !dst_is_vram;
>  
>  	/* Copying CCS between two different BOs is not supported yet. */
> -- 
> 2.34.1
> 
