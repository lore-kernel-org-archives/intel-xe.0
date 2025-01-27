Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69C34C02188
	for <intel-xe@archiver.kernel.org>; Mon, 27 Jan 2025 18:29:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28FFD10E0A0;
	Mon, 27 Jan 2025 18:29:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GBqmDxWz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5646610E0A0
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Jan 2025 18:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738002540; x=1769538540;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=f5af7afNjtX/kQzbGGxWM9h2a/aJesko8CdI2S5KClo=;
 b=GBqmDxWzMZcm4A6/WmaSd3H2rQSkbzwvqPOJG0ZtORpB56oLvzBx3ixU
 ImqMK0tzpdTtn8Pq+/txVWQc7NmB/bERMqmMHskYO2+JPVL2CudZGEnwz
 Ojq4OVignqoQGsFJhJafdRRR8prBozLc/+DG1Gg9llNrZds4TtV3ojGbG
 /azbdebGpgxIFgJK65bq9P1PtMSb8Op2+Aj2crhncmdsnICfleJ9z416V
 Wbqn678GiUzG2KOlB5UY3YlGynmZdnR6/rELaneJnK2SL4hYVeIsGtvNc
 59Eg1L2JRap8aBD43OwV+ghhxg+GpbtgtM2OJSVsqwijcWAYP1bX+2tnH w==;
X-CSE-ConnectionGUID: JFx9PDPhQXGPaInbtA/6+g==
X-CSE-MsgGUID: KHu9vfegRSqAsL4RNo8U6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="55904091"
X-IronPort-AV: E=Sophos;i="6.13,239,1732608000"; d="scan'208";a="55904091"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2025 10:29:00 -0800
X-CSE-ConnectionGUID: F9LLy1GgQS2pLBldRWRiwA==
X-CSE-MsgGUID: l3pg7Mn9SmenoBuuNT2kvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,239,1732608000"; d="scan'208";a="108322118"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Jan 2025 10:28:59 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 27 Jan 2025 10:28:58 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 27 Jan 2025 10:28:58 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 27 Jan 2025 10:28:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=unvhVWa3BtGb6wuyiDSuyVgeXO0GDTl5mwy2mh47xoNjnEmx+1OO80T9XiTV2U4nYxeSzszlqX5/JRdfjHcjTintEmwGnDMjXO7KYa956d98C0Q0dInnYYq+jVfY59HLi8rRHh8o3+oHVXdzIpZtuaL8MxjU2FGqi/kQxzX7LCyOXEfOtykh8aP6Rqbz1W1UaA1ALb7CLMw2TpL438IhI/iepf5m0TIQr8JJsKJZa4jIMGE6I9wjR7ThAVKFlNV5E7J4lyT4TOZYk4aS0nYzxRk8Tvejo/aQbGhRHnyWUKLQVyf5OmFBCA1xY6POPhKA2lVQJQyavGJCuSNnQqS0LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7kU7S2HNWISibHTyDw7rYBEAsV74KLyDL03bKlcpVxg=;
 b=gl5i9EWlHwKGuqUIuNQDuZdhyzSxnTxURiFCVtG5ces0CHOXlOFCHIMPJ0bxmSCH8ag+DaIue+g5wBiHU6UNhJv6MVXkFPYj2D5SyU0lbES6lRrq6vA8OPy4QBQed/mhmWSCksDGSjDwlg0QqdXoWYVnnof7Dkhcix52XeWwn0uYJs+ZRNcOb2oa4VwY1px3FFZ5XX9udvdibFL+4nVisju/2lGMongyg2ShY/5rAnEgnEDfF1QmZzL8g0a6uuFr214JpagAS0QdjjydI7nDHI48B0/4raqni7OwBxLVv5mQlvX0m//KuCqbrbFAazxLKYDkn3dzm2RL/QgAi/RABg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Mon, 27 Jan
 2025 18:28:54 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8377.021; Mon, 27 Jan 2025
 18:28:54 +0000
Date: Mon, 27 Jan 2025 10:29:50 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] drm/xe/pf: Move VFs reprovisioning to worker
Message-ID: <Z5fQnoMaELjJIvBW@lstrano-desk.jf.intel.com>
References: <20250125215505.720-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250125215505.720-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MW4PR03CA0107.namprd03.prod.outlook.com
 (2603:10b6:303:b7::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB5214:EE_
X-MS-Office365-Filtering-Correlation-Id: a3ebf934-fe1f-463e-accc-08dd3f007486
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Mnid9y49nndD7xdlTQluard85CwD66PPQ5Gx+n9TzaikChrcoGkPywDA5l?=
 =?iso-8859-1?Q?FnRjU8h2q3+LNmQaIA65HGqGZMwX1PM15qin8rflM5ypm04BpVg5Ywa3eY?=
 =?iso-8859-1?Q?WZ9/SJBifSAfjcS0LYpltSbyUn2SNMNC9570PO3djQj46KUAZW1rQfzBb2?=
 =?iso-8859-1?Q?xnlu/tzTiXXLiwUzUo3p75x0L5Kn5otmIobcP8ihXPeiMhxjpZixVZkhdB?=
 =?iso-8859-1?Q?24YxIIqn/tf0DlHm1xEemq8rTE6cD0yqwjGh7Ze++G9mGvKkCfwD009T/K?=
 =?iso-8859-1?Q?CxAOylbYFP5tF6kNM9BAFcWWrgjd7pRQR6IFrVZBgw5/avIVg1hByiNELO?=
 =?iso-8859-1?Q?TqWHTQsrV9kyjdyYjB3jYPEt7DJZ2cEPkmBRTa3lvLBBJrX+DF5z/iVe50?=
 =?iso-8859-1?Q?jY8dL+Ut/i/BWY3RipnB5/v1gXqftcHa9+N2ibiAzj0EO8QZuC4zN4zpvd?=
 =?iso-8859-1?Q?IOCwKFqydAT5tswTyYggjaN5zTsLk0HfgCn7THECeDE/QC3M/wEAvvr72i?=
 =?iso-8859-1?Q?gstc6lUiBzyFs5J5zgQDeHLQdmI1OuvibUGRvaJwA25j6NBPsWkqpv0zZb?=
 =?iso-8859-1?Q?hjpD1q8HvXMo2m4tkrK8qdKuBMngJ6qtGySds+70cxZ9VWhHBA99D/c5vh?=
 =?iso-8859-1?Q?YnHlnqAbzKWW0sUx1vlEQTGXVnVF5XE6hV3gUHVJ8BVzOM62ZflQk8xYVH?=
 =?iso-8859-1?Q?Ged0iXfyCovCQm8nfWG9ZDgcbCtMkWYgvkfBjXsbuTy5rPcz8IwxWwaSV0?=
 =?iso-8859-1?Q?WFgQm6aK7nTwdD/87lbGyxyvYMCtJN4uA56sslWNT0zSoobTHIljHTIp0m?=
 =?iso-8859-1?Q?AAcWuPUO6Z7DatqPutEz0Azz/JOuU4QAJ6QXhsyXjVRwTw7k47JeONbjKi?=
 =?iso-8859-1?Q?J7fw5TBER+9EWqg9japTuZiBRTGAGqrFCrQdPO804bMg0J5qPyCF1SUjwp?=
 =?iso-8859-1?Q?76NiBuIOfrpL5DgoXuBYY5huNB9fPdLQrqQKHCWLNs20tSIALmq+2gjvRq?=
 =?iso-8859-1?Q?TPQexhQ6gEL+oi1jb4v/y3UyClzSL9u+o9cO06GZJf0DLueFsBl50VRaCK?=
 =?iso-8859-1?Q?iJH/5V5N1GzNLiT9HfuRfW0ECIvOMiYuSfstAx8CDWsHoXU5IIpDZNcbLh?=
 =?iso-8859-1?Q?1OvtknCGn1wzNyGzWCKFLWHdkFz8yLgU8GAiFee72uiGzDXA4M2rkeAobO?=
 =?iso-8859-1?Q?Jnzx81hbNEt5Ol5g7yH+D2IfvTkN5fv6BIC+5KMlLDVHI+rSus90cH9Ph0?=
 =?iso-8859-1?Q?Es6m6XIrgmY3MJcZwsjKXsF7kgcEs3mjv3AcE/hRNB7ZmeT/TBPNNnzdKe?=
 =?iso-8859-1?Q?UtM5Qp58JfmXhhn9/ElZCNUn0RrnHDrpag7J97L+5/OtToxWhqiVmYAlsV?=
 =?iso-8859-1?Q?aOoiMD8tFbZ5FBANx5fkMzRFf4ee+Zf0E6kqQcR7GSMYfZtwE3wxjlcdcT?=
 =?iso-8859-1?Q?EhFtppNVmGsAgbeM?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?vuFkmuB2Dgxk+sxshiXCHqlu0ZrgCY0EfVzcjDvnxRT2/iPvcJ3vnIWi9B?=
 =?iso-8859-1?Q?oAdl11m1PrdUP87DItWcD5iHBZl7t9VFGyKTIQkBETEdx6z0RpJxEAowwd?=
 =?iso-8859-1?Q?82xstK6CroPAtWUTEuwhHNGhfEER0hiOT+YUOpUgAygNNcPdmcjjVXrGDU?=
 =?iso-8859-1?Q?GKluxLjHNzUslJsbQKwJysJuolKCUEtYwi1Ue8O04CWxVnfAElIEj4sWtR?=
 =?iso-8859-1?Q?i7C5XrBtRozb0QptrzMuUgHnSdLUToaE3IyK+Dl3Kpa0W6leh2TjX2/6ik?=
 =?iso-8859-1?Q?ua4OKf48b9hvVYr8m+vslccK2OM+0b3htVZeH3OV5E+NEcZMvWfy1bWsrJ?=
 =?iso-8859-1?Q?eBzGGVIqhBkpxBnUElspRuqyJEQjaO2au+3ubtURiBNWSnv32/sysH7Fxj?=
 =?iso-8859-1?Q?+spdQIAodh6ieTXMlZxcrWfNmmSocVijsErAWU+kpCIfOtkTHA8dQ1KnPk?=
 =?iso-8859-1?Q?zkyXlHi7UwdAGFP1uI7J14dWgLpRQD2wvDXLoLsdxrfugwMovNybbcC67Y?=
 =?iso-8859-1?Q?SaGPqzL0gKTvCtyG+JPG1nLySVq0egZxdCMPSa/3ELtw5ha4k7hVxCNxCg?=
 =?iso-8859-1?Q?EJ5Du5BtYUzGAcPOuRHcyps4iFHMw3c3Z+PsgsJckvtkN/X5FfQuF5SvnM?=
 =?iso-8859-1?Q?BLoBBVSGMP5jJDWZ9ZDFaztwsKQz799YayMyfBechVP4VqGh6/sT4UjUlK?=
 =?iso-8859-1?Q?oBsuyxaIPp/m+o2Cq8DlTO9pZ/OO2wefXnPbxeP95hPj0S4fgS65kP0i20?=
 =?iso-8859-1?Q?kumVqJZu5OuWsoet5tTjhzfEwcwpQMKBSmdBXa2OJMP/qDmo1XTVf70Vfq?=
 =?iso-8859-1?Q?TPt3VU1oeEdiNbnZmcET8ip20c9XgcMbPkX4sN2/nSHjFzcNME7wmJi6uO?=
 =?iso-8859-1?Q?MLFz5GhFAzOd9L3XyTQEPTWdKgbkdzlFkadtXSyC+00GeLr9XHG4GTv8TH?=
 =?iso-8859-1?Q?doyI0sUzysSRCT7jmRbt4TcmJ3UKQuRZla+AlB8nhiyTmryikX2DUrARjE?=
 =?iso-8859-1?Q?k3Ng9A/0iKYMbFt8WUkHsYsEg4pIeYpGt4C0WrztmLihmnU4wBrvsV3Zvc?=
 =?iso-8859-1?Q?FVz5SGIRKSigodYe3IGfvhPWtjuPbVWIB6z8lIDaI+v5V4CIJXL2k2Vd2K?=
 =?iso-8859-1?Q?evpWYPlIGCUiELVReIeB/WCG1PccFd0xw6ZT6CtLrDIMHXrdyqhq/eXkqR?=
 =?iso-8859-1?Q?BkNGwyIBXv4qnY5NXvBTrPY7vxfEd3kQHq8AZjq/F0blEr8swL1/O4E90j?=
 =?iso-8859-1?Q?X+gIQEvcP2GbM08kyu1Xu92SCOkDSu0LOLsWkVFVrj2YlJIhOtRLfgZel2?=
 =?iso-8859-1?Q?uwaArQJAP+IHaI2xJ+feGMfYvwl0RLwIGv19fWYQxIUT43eyG9tmsyzlUL?=
 =?iso-8859-1?Q?i1JUSkrFIAFZB15YSJVWtQeef0SMIvgAWOSKAKVF9RjuaLy3Zy7fuRpBas?=
 =?iso-8859-1?Q?KGFMwCsTR/utRhfxjRfLzswBAKXWFhhf6QYeNWKP5b6LgrZJZxx9rllFGv?=
 =?iso-8859-1?Q?xeaa81DivLKQXOGZ5uDOTyerolFclmso+4eFBp4456i+QEIwu0DpeCfpN0?=
 =?iso-8859-1?Q?SUxXD75n6FGYr/T6Nmd8NgFb+AMbuIPhACD98bPnUP5HWYrBiGgoYaBKmh?=
 =?iso-8859-1?Q?weP8uG0A/63tr8wmW2BrU4cztNHifjp138uphxGQBez2NJ4ebSPiAzWw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a3ebf934-fe1f-463e-accc-08dd3f007486
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2025 18:28:54.5569 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SxW0MIZAoKRD4iFE7/aTfDCMzr2bB7GKl+YwqEcZvsM4SANzzec90TgXhH+0rNe+8hvc/flXjU21BB8jOz1uxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5214
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

On Sat, Jan 25, 2025 at 10:55:05PM +0100, Michal Wajdeczko wrote:
> Since the GuC is reset during GT reset, we need to re-send the
> entire SR-IOV provisioning configuration to the GuC. But since
> this whole configuration is protected by the PF master mutex and
> we can't avoid making allocations under this mutex (like during
> LMEM provisioning), we can't do this reprovisioning from gt-reset
> path if we want to be reclaim-safe. Move VFs reprovisioning to a
> async worker that we will start from the gt-reset path.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf.c       | 53 ++++++++++++++++++++---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h | 10 +++++
>  2 files changed, 56 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> index 6f906c8e8108..d66478deab98 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> @@ -15,7 +15,11 @@
>  #include "xe_gt_sriov_pf_helpers.h"
>  #include "xe_gt_sriov_pf_migration.h"
>  #include "xe_gt_sriov_pf_service.h"
> +#include "xe_gt_sriov_printk.h"
>  #include "xe_mmio.h"
> +#include "xe_pm.h"
> +
> +static void pf_worker_restart_func(struct work_struct *w);
>  
>  /*
>   * VF's metadata is maintained in the flexible array where:
> @@ -41,6 +45,11 @@ static int pf_alloc_metadata(struct xe_gt *gt)
>  	return 0;
>  }
>  
> +static void pf_init_workers(struct xe_gt *gt)
> +{
> +	INIT_WORK(&gt->sriov.pf.workers.restart, pf_worker_restart_func);
> +}
> +
>  /**
>   * xe_gt_sriov_pf_init_early - Prepare SR-IOV PF data structures on PF.
>   * @gt: the &xe_gt to initialize
> @@ -65,6 +74,8 @@ int xe_gt_sriov_pf_init_early(struct xe_gt *gt)
>  	if (err)
>  		return err;
>  
> +	pf_init_workers(gt);
> +
>  	return 0;
>  }
>  
> @@ -155,14 +166,42 @@ void xe_gt_sriov_pf_sanitize_hw(struct xe_gt *gt, unsigned int vfid)
>  	pf_clear_vf_scratch_regs(gt, vfid);
>  }
>  
> -/**
> - * xe_gt_sriov_pf_restart - Restart SR-IOV support after a GT reset.
> - * @gt: the &xe_gt
> - *
> - * This function can only be called on PF.
> - */
> -void xe_gt_sriov_pf_restart(struct xe_gt *gt)
> +static void pf_restart(struct xe_gt *gt)
>  {
> +	struct xe_device *xe = gt_to_xe(gt);
> +
> +	xe_pm_runtime_get(xe);
>  	xe_gt_sriov_pf_config_restart(gt);
>  	xe_gt_sriov_pf_control_restart(gt);
> +	xe_pm_runtime_put(xe);
> +
> +	xe_gt_sriov_dbg(gt, "restart completed\n");
> +}
> +
> +static void pf_worker_restart_func(struct work_struct *w)
> +{
> +	struct xe_gt *gt = container_of(w, typeof(*gt), sriov.pf.workers.restart);
> +
> +	pf_restart(gt);
> +}
> +
> +static void pf_queue_restart(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +
> +	xe_gt_assert(gt, IS_SRIOV_PF(xe));
> +
> +	if (!queue_work(xe->sriov.wq, &gt->sriov.pf.workers.restart))
> +		xe_gt_sriov_dbg(gt, "restart already in queue!\n");
> +}
> +
> +/**
> + * xe_gt_sriov_pf_restart - Restart SR-IOV support after a GT reset.
> + * @gt: the &xe_gt
> + *
> + * This function can only be called on PF.
> + */
> +void xe_gt_sriov_pf_restart(struct xe_gt *gt)
> +{
> +	pf_queue_restart(gt);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
> index 0426b1a77069..a64a6835ad65 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
> @@ -35,8 +35,17 @@ struct xe_gt_sriov_metadata {
>  	struct xe_gt_sriov_state_snapshot snapshot;
>  };
>  
> +/**
> + * struct xe_gt_sriov_pf_workers - GT level workers used by the PF.
> + */
> +struct xe_gt_sriov_pf_workers {
> +	/** @restart: worker that executes actions post GT reset */
> +	struct work_struct restart;
> +};
> +
>  /**
>   * struct xe_gt_sriov_pf - GT level PF virtualization data.
> + * @workers: workers data.
>   * @service: service data.
>   * @control: control data.
>   * @policy: policy data.
> @@ -45,6 +54,7 @@ struct xe_gt_sriov_metadata {
>   * @vfs: metadata for all VFs.
>   */
>  struct xe_gt_sriov_pf {
> +	struct xe_gt_sriov_pf_workers workers;
>  	struct xe_gt_sriov_pf_service service;
>  	struct xe_gt_sriov_pf_control control;
>  	struct xe_gt_sriov_pf_policy policy;
> -- 
> 2.47.1
> 
