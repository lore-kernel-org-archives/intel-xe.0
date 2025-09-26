Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBF02CAC5B9
	for <intel-xe@archiver.kernel.org>; Fri, 26 Sep 2025 09:30:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E42610E35D;
	Fri, 26 Sep 2025 09:30:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kMh20z2D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2336D10E35D
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Sep 2025 09:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758879058; x=1790415058;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/J14qEcFjvBx9j0BzLiR8SjS5hpnRj8SX069LEz7SdA=;
 b=kMh20z2D4DG7jeYWaOnR1PGJ8pCTlCa1VwMvKWOXgLRMqQ347/YVT4Ay
 RywlLhOg9MyzKp6tatVIf/JyJaoHaDaZDmzJQLdOD4NdmWPNvBEllF9aQ
 Gyeo8e8XNFHU/CsrluDhbWxve10M3tKCtwxBGbbGWPrk68PFkAnXF4q6p
 R1hbmHsow97Frcd345fYefxdLlneTHYKw0UuOxzctJYtmF9+iacDqpgho
 a5O2S/oeCndyXf9CpBA/+inPAGRUkaTN7J4BgQDKNUYde8rfFBYDBlm/5
 cSvYAnDDS0lEga1ax3FKmfcttyWAK52a84dJRtgAQcObAr8Ac86ZjkVCB w==;
X-CSE-ConnectionGUID: d7q8WEn3SC+7gDMM49X1+g==
X-CSE-MsgGUID: enIIyzcZRMSx6lgjrMinaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="60908521"
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; d="scan'208";a="60908521"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 02:30:57 -0700
X-CSE-ConnectionGUID: sfItBiv8SOm1d3tYeK+inA==
X-CSE-MsgGUID: H7voeL+0TPe4TcQoREkj5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; d="scan'208";a="178024102"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 02:30:56 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 02:30:55 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 26 Sep 2025 02:30:55 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.57) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 02:30:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QyvqqtYlne8p52IFMcq5hw1H4g3kBf5dn9KPmMV9fN7wy2hujJ637HZe6PeHTR6GzlhalSjnCDg/07Uo8yUaElkntZobPyQPKJZNvseLHIFmnb1GAMvOSrZC8oNN5nw3Q0xogdoCaDyXZBIjedEsSxhQjJx9PvQqb5DLYpsozWfQe+J8pVm/alzMzfSN2d6Vk0dEgHc5lrAkGnC085CiP4X5Ul5G+2KFHllaonVqRrdzSCwOm9WURqj7NATdB5WB2P1/ah/cpBX4t/Ty5hKtUqa8FLggz7A2No5rRPItvUec/3FlEZLTeAfuHbXcoGfitB20Ptq+8LfNkktPnp1n3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=twFspJujSDPMb2GnIG1RwL1xzGY2PqfWyxGAfqDn68I=;
 b=UhhsXWqainyRhIp/0Ur93NZugXTg85HhcV2ZOgdsH0v6teiW7maXBG7bF1RhRXKpJtHVhWITszYyv5wV73v96BLP4OlxR1102IrKF3mmd8x94s3oORlr74quTXGbPrQ85/sPnFnSyRRm/wDJ5GZhV9NXfLXkZt9I0FQM5itJwXosOYHTh5QBjj3C0t0fuOMos/SQHCdpcTrJRyJst2O/V9ovU0rWq5jhxzwL/LzBaRFO/AjNqkjaxSumQiemP/rGfbaBsBUhPKg5gN+RmTWfGG97016t4JR75cASb0RQglVbn6WLr38wJ1ntsYjDEUAHorlzrtrhveP1K+MDOBIJlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by PH0PR11MB5109.namprd11.prod.outlook.com (2603:10b6:510:3e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.14; Fri, 26 Sep
 2025 09:30:47 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%4]) with mapi id 15.20.9160.008; Fri, 26 Sep 2025
 09:30:46 +0000
Date: Fri, 26 Sep 2025 11:30:39 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/hw_engine_group: Fix double write lock release in
 error path
Message-ID: <aNZdPzh4uaqnHtmP@fdugast-desk>
References: <20250925023145.1203004-2-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250925023145.1203004-2-shuicheng.lin@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: VI1P190CA0007.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:802:2b::20) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|PH0PR11MB5109:EE_
X-MS-Office365-Filtering-Correlation-Id: b2fe2fa5-dac2-436e-2873-08ddfcdf5f8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sgdJhUDZPDran2YKcrGllBBy7Pmit+2BO3ou4novCswJHtKpQKoAG4qcM+yc?=
 =?us-ascii?Q?cFPJBCBmtEl6j2NgGjTXWrB12XXChGf2ALEGIY5D8aAc9/o+7fl7v03C9Ezv?=
 =?us-ascii?Q?exMBLuRhIpuEb15YHYsGZlFZmwT9cKNfnaaRZAyyZrexL2YYZAbAsT3UDNt8?=
 =?us-ascii?Q?aCuKqBm7nblcppXFmpMJ5N2Mmfw9YhwvzqW2k2LWR/4alZcZ9mAZr67exIqj?=
 =?us-ascii?Q?eSluVrYnQ5dg+JVu9RhA2tjHtGeuNNI3j5+qXKF8TJeqkxpDbBXjMDpk+TiF?=
 =?us-ascii?Q?7A+WL0NP1LT89LZReb8cjNeTatQvMTZ2nqFGjom5mQfw1cQSzCiCoopeDK/7?=
 =?us-ascii?Q?66O3rVdMf6cUgTFW+v7tcVWTb78Tt9+zGNbNQ/B9o+g3tX2TRofEfzSScrSq?=
 =?us-ascii?Q?AWR/toLxUsywOC4oJhqfYi3XF3yMCimeN3vL6RPhAzv+zReGWut8jpUj7r5W?=
 =?us-ascii?Q?acFnX2wVj423XRH1dJvxdAxwBMIkWrd4G97dFpV3DYwkL19s2CRCAn29ZKmf?=
 =?us-ascii?Q?rrcgamBVATZaR+G6FW+LOpngfNgaQFU2tvMITJMeWFzBOGfvqNeW9GaVG4Il?=
 =?us-ascii?Q?YqboMutNKUX/7mqiaJxNmWzMyyP/IHkH3Cu7xDN14wrTnR5q7uiFVabeTMB/?=
 =?us-ascii?Q?2PbIG0ZVnI1YRErNLVDALFcBYZq8o0WjJgn+fPWiNRgemmTPOtOOl3U3X9NS?=
 =?us-ascii?Q?E0OVFihZMbOw8PkmrrVPxCqgQrePMeojggO+n/qdFY6lcPfI8aFiNVLz3n1r?=
 =?us-ascii?Q?zcQaXqfT/eI/Ve67j26BDmJyDPzCU5wOhIDehiANrKgKvZY5Wd3d1JE95Lqb?=
 =?us-ascii?Q?krzBPGZeyCbJpb/1OHgj10qZrxPEZAN6Knk9C3dRmmmqIPfooZ6/5JeeaPmC?=
 =?us-ascii?Q?zJEdeL0tfoTuKNcxEzLgZhvBC01XoXWXahdONE39Rropm+Tj8Cugy6JEZR0A?=
 =?us-ascii?Q?u9S1IBjrnxdYT95KcH/RUrFyU4u5wX1kfgr/w+6o0lfV5LTIz6Zy+dSYJg3j?=
 =?us-ascii?Q?DzpODk5hgasclVC/i2vapXavUUgzIPldoxVbabH858oVCHya3mluYXXZKnTP?=
 =?us-ascii?Q?+mvB4j2c4DSq4nIlt0nIprH3aLhw0pYi0u3/Riol8wwU5c6Z6yiIGyOPMLbi?=
 =?us-ascii?Q?w6BZeaOtGBYpY7kCwjdjjDw6f5eWRIh7OrxU/++l/Z5xO0puLjqx1Ay6EgyK?=
 =?us-ascii?Q?b0ckgEHwUF8DQDu2ncUdxt1KN0SeqDOTt71w0E8v9uy9Z58WoSQ0qp6Rt8T4?=
 =?us-ascii?Q?W/0VpxQfbjMZNyZmwnKGATfXZk9tPKtO5o6l+9dxv8+AICFRsXF4dCjWTT1w?=
 =?us-ascii?Q?U6vlUhXePjA5QhX1ARkJj40Lsl8ndAKqsryZx509XtcyIwL372KYQCPsUPNG?=
 =?us-ascii?Q?b5aBT9CLbzht7xIJu4tupdytqf9OQiP/S99jlmXH+gnmJNhnyDYpsB/vu2ns?=
 =?us-ascii?Q?ABMKFKYbkC5wngHBhWszjd6h2gwf3QSO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zLmsgtOq0T4WAatxfc2F+XcyyDiGSiD1tYXXY9bBHa0UfEqw2g1Bg+crVY90?=
 =?us-ascii?Q?Q47dh+8qNa6uTR/KPevqUHdMmUMp/OEnnT9KVT9JiypIugioBfEnSbKj6pBF?=
 =?us-ascii?Q?FVg6eKXACYLzX9Ojd2uhiOAd+VSZA6EJ1iw37D7JCrQykyr8JccaRUscvmYG?=
 =?us-ascii?Q?UH3yK67GYwuQsW5T84jyI0SswWlXAcyWvow/heSczfN8ZOzVfUBPfb4aD3g8?=
 =?us-ascii?Q?paahsjw9cTWDpmwo7XyMwzEtnBOOAuU0K+C1B8QDNWMEFSyC4RPFkjaZlzUU?=
 =?us-ascii?Q?wLYfYSkQ6FeIJXgWcCOEYPOQtW/i0+MOMSGWHUm+eS35BMNhlJ/VAjy/KhQc?=
 =?us-ascii?Q?MZUY1U35Xno4/+gYgqZZ3mGsTZCHfaCmUU/tsJNAePmsTOAYDqUdiiOJneuT?=
 =?us-ascii?Q?aR/QcMVDNvXd7EEnvuf7mE6/L/SUpOaz/2UY61aXjGGa85rtlAZZj1uvT8z3?=
 =?us-ascii?Q?vSKF5J+7lX/56fboBxCGBtXaBlk2RNXcaEQ23LvEcms27Gqnu7+215dWdMnN?=
 =?us-ascii?Q?Ya8esQFYyC7CzKIbobn3ARYO2SdApfOKlexa7D3Yc0QW3Eqnp/eBcAGdNCWU?=
 =?us-ascii?Q?sjQsLFd99qJeXzMH8WL8fehEZq4Ud1zQBVUn9Wp3lmAoJxFdYvuUEaD+iHMY?=
 =?us-ascii?Q?lDhGw/55G8T4odDrDgZSXB5mz16AYFhOjLI6ogPXCuiyZCBH9+1aKrl33FXz?=
 =?us-ascii?Q?RDs8z+vnEhMJqNBUgkWND+AfynNWejF26NkXE1vzAp5K5YNUZj7F7+pHWXe4?=
 =?us-ascii?Q?U6kOWyjHRJTuGF2YccMIbYFtpIG/7AvRQntv5z2Vqj9HD+DtD00tqBJ8j/U2?=
 =?us-ascii?Q?9FXteIRTlC2Q3DXAfzE5ufeTuG5ew4qZLztvoM5jLGIMoThYMoTXK28aMzF7?=
 =?us-ascii?Q?RUk5xpwne88ob4+PqYfdfqbMrUfoZu0brs8mdPY0tR9fF0upL4S6Zj8RbvyJ?=
 =?us-ascii?Q?qPx/Ifuz9BFVWpQDCpiicJjB2cKl/b30jGm5kLVZXPSCTdNmhVp1d+lNgfA9?=
 =?us-ascii?Q?20nmbUHecb/jVxhQiOi55oMiDUCVyGIeSB1cpCN5mny1LSqKc3dRZVgnkF4O?=
 =?us-ascii?Q?0B8NonKU68GvFp/kK+fof8Gesi63MvHVKIHe+HFbmtDe1lboIlt4fFFCXlIW?=
 =?us-ascii?Q?LEmG4ZYVH338WnSzYENuVMlgrbfhsGpjg+WJG0ZaVKGBf0iIJollbxMSIwc8?=
 =?us-ascii?Q?OqduXaHLlreE+sJS9QGmlQiIjcsePirEUbsKqXxLhkd+J8sAxhin08HhV0+1?=
 =?us-ascii?Q?sLWOiGiGrd/cHGDdyXrKrzDnfbmbCj2t/lJdw6NHrNFrHJEjfh2sC9JTTOiC?=
 =?us-ascii?Q?yzcKaIUQR4NvdVAqpWh+JXCo9E0cfQBnOuGYJyZFxdo+3eFuuvpA7pADJEpm?=
 =?us-ascii?Q?hxpPnM4zPj50029Qlr6sU2tX9t+Rc1Mt6lruW92UFjDpce0sTwld2z0T5+ai?=
 =?us-ascii?Q?kbEK2tB5IHqozNH5F1GYe9IC5Ba+BzOfqs/fvVU6BdgXQkQgpTqRQXyTj8Sd?=
 =?us-ascii?Q?FqwvCQtAFKxofHxhHkvEgdtlGiwfCqBHAne5rNKlgSdTbxRHYE67D3ftE1Sx?=
 =?us-ascii?Q?9UP0vSxwXooIWpto6zn3+R0I24SYgPXpkVCegznFauqzFM3GXebCSku6430j?=
 =?us-ascii?Q?/A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b2fe2fa5-dac2-436e-2873-08ddfcdf5f8b
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 09:30:46.9295 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lvPjix7541lUhff1yGYQFF4ZsP5/Y4pBel28utdAsnQdt1Ose0VGV3CB9a/ZYeKuXB9Zq86o/FWRMbTeBMjZa2ht7131QLo6oKLnxUDI2RM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5109
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

On Thu, Sep 25, 2025 at 02:31:46AM +0000, Shuicheng Lin wrote:
> In xe_hw_engine_group_get_mode(), a write lock is acquired before
> calling switch_mode(), which in turn invokes
> xe_hw_engine_group_suspend_faulting_lr_jobs().
> 
> On failure inside xe_hw_engine_group_suspend_faulting_lr_jobs(),
> the write lock is released there, and then again in
> xe_hw_engine_group_get_mode(), leading to a double release.
> 
> Fix this by keeping both acquire and release operation in
> xe_hw_engine_group_get_mode().
> 
> Fixes: 770bd1d34113 ("drm/xe/hw_engine_group: Ensure safe transition between execution modes")
> Cc: Francois Dugast <francois.dugast@intel.com>
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_hw_engine_group.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> index 58bee3ffe881..fa4db5f23342 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_group.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> @@ -213,17 +213,13 @@ static int xe_hw_engine_group_suspend_faulting_lr_jobs(struct xe_hw_engine_group
>  
>  		err = q->ops->suspend_wait(q);
>  		if (err)
> -			goto err_suspend;
> +			return err;
>  	}
>  
>  	if (need_resume)
>  		xe_hw_engine_group_resume_faulting_lr_jobs(group);
>  
>  	return 0;
> -
> -err_suspend:
> -	up_write(&group->mode_sem);
> -	return err;
>  }
>  
>  /**
> -- 
> 2.49.0
> 
