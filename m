Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F18A0EDE9AC
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 18:08:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA34610E8C7;
	Tue, 10 Sep 2024 18:08:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e5g7rWwx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17CF110E8C7
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 18:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725991679; x=1757527679;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Ru3hxhEDyEewlrJ2SuNp2+nHXFQL7RYpVMfcF47bbMk=;
 b=e5g7rWwxbbpzckGsBBBU7Jp6zE3WeBPw8oM9eErAfSMk/qNP/4u2OWSV
 zimP0S6Jvl5cKjJ7K84PXDiajma76ZxAEjViw5pThB4wpRWVDrB9l0gxU
 QA4B2BVfueBl2bmqqnYSWR21i5K7GY6+7G8MgX4mwo9RchZgxdbaLS8G/
 DMd163aSy8fCBYXzYqAlIfb7jkngOilzQ4q2v9/ZUaPbuawvWL5L+ekck
 XOTmSie9n+SWl4MyquWMztfi808Ib7rCs9V6givQE2M7bg3m354Kss4BR
 Oofsz9wz1XJDYC44yUwyHqg6ES1Kk0jL0h7LP2bzRcx3IGSdSSrQvmqQP g==;
X-CSE-ConnectionGUID: hOLy77x+QfGdprRyg1LurQ==
X-CSE-MsgGUID: AlEKTiJCTtyxsQujY1eA9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="13462166"
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="13462166"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 11:07:59 -0700
X-CSE-ConnectionGUID: 55C/TvAvTHqf0DEbVxiUmg==
X-CSE-MsgGUID: UdE5POf8S1K2aiONIQnTBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="66819741"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Sep 2024 11:07:58 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 11:07:57 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 11:07:57 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Sep 2024 11:07:57 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Sep 2024 11:07:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j1/b5m2A9Ksw9WIP5WG1aK+C4HhfOrWu634b7h60CKtpwPVqwB9x29/mBX5TxYdt0/d2NWutDysZTc707L56zomS74HIS8aBd2ZDcqtxxqLrxVRxdOn+tQ7i2U2l6oq9h46rQNGvzXuDsrPGO97r+7GzUEkfcE4KPdSqMABAvdU7AwQQxOds2C4uTVll8tvOcQdbvpmrbFA2cNFbtlB+IDe1veOJPUzT2SOq8Xxo5sWWo/YEXjJ7bniiq0xy2HZCgyuy+oiouzM3ZFiSd5QzPuFC2f0B8QluBUIIw+U8tpKTmtqdE42M4M+VJb2F7OZgxXd4DvSkIiEAa84FjlkPkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4QUgoFFq3EUzj/amrZ1hblM5oM+VD78qvRQgFMhohSg=;
 b=IB2BupVJvhWeSGxMLAtNXOCCblplYsi0mCQFzr/WxkqYCrqBRxYfYo5y1HJGBRbpqsalDbCL/UoxI8S0B4iPJv43SO7hX3jZ46ZelU3+jAdRQSYpIU6gzeMay3gZcLV3GiNT2GglWli8ArfUYPDqs27NrNgDE47a8nq338Q+1wLgjD0LQDdKb6/3YSLdAMFnHZETGNKDERuFAMnM2f0+4O9zpLnruNd3q5iGgdQB42KXrQxljwV6uGAzATXFkI+iVkwIMdOMUa4Q2LgQD+S9EGj6mqy6px9/w99mfHps8xEeb1BlbpHwL5Gk2yM6LTZQjknqCuGS86E+ihLUpLf1uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by IA0PR11MB8379.namprd11.prod.outlook.com (2603:10b6:208:488::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.25; Tue, 10 Sep
 2024 18:07:55 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7918.024; Tue, 10 Sep 2024
 18:07:55 +0000
Date: Tue, 10 Sep 2024 14:07:50 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 28/43] drm/xe/gt_throttle: Convert register access to
 use xe_mmio
Message-ID: <ZuCK9pnyRDewiOFE@intel.com>
References: <20240907000748.2614020-45-matthew.d.roper@intel.com>
 <20240907000748.2614020-73-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240907000748.2614020-73-matthew.d.roper@intel.com>
X-ClientProxiedBy: MW4PR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:303:8f::11) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|IA0PR11MB8379:EE_
X-MS-Office365-Filtering-Correlation-Id: 75b5a40a-c9d4-4664-a153-08dcd1c37e07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GbJf911J05ErmUBjeqmT8wSmBj5/8KIbk0sdRY92BWePYxJiAGCnnUtQeXVT?=
 =?us-ascii?Q?1Zz1t/ZK9CGC1gN9b1syPDDckiVCUa/hlQWjGlT1vhXJGVtAkHFYscbkoMal?=
 =?us-ascii?Q?S1QJm5LFyf7dy/fsrxMi6qdznutpBB8g3NRIsy7zuh3Tv32i3FwGE6qNQVYE?=
 =?us-ascii?Q?jJ314qAdK6u1VEFvF7zkf41BUBQemFuwdqmK4QVVNGQ//rv3jMeOPur4fAMY?=
 =?us-ascii?Q?XADd5d2iOQ3PEncPT/UGXzTv3Wunh/Z/uJZNokEJjDyjHMmVjkktmdd8vP/h?=
 =?us-ascii?Q?aNYQa15+r8Lauj4FnNWddocUEUIg2uVtdFDVxKyXO8SjEsLdI7jqJDMXlzxK?=
 =?us-ascii?Q?pYrMvFnlrUCEbc7/OpFxN58IYsMTdfbXSW16/A9pVlOCzXKpadjs41Ov/+eP?=
 =?us-ascii?Q?M14qWoL+k2ydNnUrw+aDvdut2Lczh2lr0l4Uz3SqOmE4sxE5FG5jVgy+Uz/9?=
 =?us-ascii?Q?Xo8tgDXyHFFAXGr7THgEugYpAgchzCtoaUEDf5Q6jVfqrLXaI5NZ+oZrUkum?=
 =?us-ascii?Q?iEicpZu4O1Ge05JBeWSHOYFFY4iumk1px3TyPoKmlV4R+I5NSjTQdlpozEYO?=
 =?us-ascii?Q?S7VuDjgTO1jqoPKvGAZP0sRV8ywXh0rUWlK1XAtEgJhEu7eklQz1Hy8ErzYf?=
 =?us-ascii?Q?sJAM+Z3IuB0t0WHcFnxmTA8s61eycx0O2cKwEsQdfbvX0lupflTxfhBuWSFM?=
 =?us-ascii?Q?/rfn6aEnm788OeAlALfAh035x0bF/p3m5OV1d6axc5isNlk7h3saT/BM+kJn?=
 =?us-ascii?Q?H0NQstqDB/hT9E4XxHT2hhqp8EUjH6QJnLhgL52MJFYRU1um67g3MbumucYv?=
 =?us-ascii?Q?TL49UDobyHEL+fL37qko6dVLe6fnR5v0JwF7CEEOYqTdzdzfZ3E4xu51QIVv?=
 =?us-ascii?Q?NNRR5DSVanN0CLwhf268qibEeQHjQH4Af4CdAaW/fq0mLyWQ6df8FCGev7LB?=
 =?us-ascii?Q?sfOFk9SK0hZA12runDH7oJWyM3go8J4IQaCNrgUsmfMPGmFjQ7H88+8M7xZx?=
 =?us-ascii?Q?YDJLVx+YseCLpmOqoKInK0cqCLNsPyA0cWwbk4tGHvODM3krCfVcK6ZlSG8y?=
 =?us-ascii?Q?gpuK8j6j22PO0kcMZIKo5RJdjcKbV2vAUm42/pr5dC/2cgcShcz3ptB1RBa2?=
 =?us-ascii?Q?vI6z8Fy9dFCPrDi+DW7610+RfoH4bA9ewDesaTW6/gEdVSbEiN8z3dbZ1/ro?=
 =?us-ascii?Q?Re86vD96BfrW/kim7T6VsVQqWvEiXf9eWAyV8sQjW14ZWeSXjEV3yWTVayeu?=
 =?us-ascii?Q?RB1MobQexEPS1Q7/AabN1wIl32JfPaYT636rFGRUt9j7hjvA7WSarPNmJL9N?=
 =?us-ascii?Q?zeD80iEjZCwwVbZ2BQTHgIwu58/KQHMK0oQlxQe1ehe6Yw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7slhTPhMckwQS7+oQYPsFoeOR5gjAyT26iVLCP6n/RRT4XvCLarq5BbpZ/08?=
 =?us-ascii?Q?gZptw+SlihVtPL87Mao93OUhXNkQKDiIXuw8e/WNpQD2k+3RoXtXoZkNDWZA?=
 =?us-ascii?Q?lmPjCKXKkBiWz+1Iw7LQlmRW8MPuffybxbLGPQE2ix6mwKVivzGaPv3OvCBH?=
 =?us-ascii?Q?vElGNZGd7KyH5/j9WnnEhy/zFJ+e7U1KjKn0CoKzlW3Wm2ePj4Sr0Ub2Gqs3?=
 =?us-ascii?Q?JzFroixKPcLAlr//XkF7zcsS9jAhZCpYKzUZi6PjvPIG03UzYMtZrDxXuzBH?=
 =?us-ascii?Q?8HvuxGqCuNzqAkF9M1M85WoqabqHX2ss9+pdDt9tnoOfcmC5xGZuIXqR6XOB?=
 =?us-ascii?Q?VUHiwKKt972ECMb0/qmA1H6HS2HeabEq5g3N05w5QSIHJEYhJA/A0o47LZqR?=
 =?us-ascii?Q?BeVStazSXB35+mot7NbGfMNS7F8EVmFkiG6QtRIcBUvHobT38nCu+okLYHqK?=
 =?us-ascii?Q?wXBmtFUePuDGTFbomF23wG51cZt1txailZjMjckHhE0d5za9VeP3jBItiTqe?=
 =?us-ascii?Q?s2SKuFIkgUs8pFt0G8BdGrC2cZSPnyXiGC0eS2hIbc/Ym5P+UqMf4OCP44Vt?=
 =?us-ascii?Q?Cj4cHbRpS2SZri4eeFP0irm4ThS1IdAipWTd/6ZVy6DpBNyg5TFQBfBz4Sv3?=
 =?us-ascii?Q?vrIjfY/5Sw3n/Z35WKpFo6O+i4iJzTvLyuHSWdzX+xpbV3JIu5IU9txPvEXY?=
 =?us-ascii?Q?FYXt5k5WxpH5Q8QSNrHjHFMuPIImyw83FR8nkMJ+RGVHtZ4TVSQw4qdIrndu?=
 =?us-ascii?Q?Sc/GXuf0lOYa/FKZPJP15riV8kHXTUlfZnlDoAJBlUNsYGIVxyXs6553+J5l?=
 =?us-ascii?Q?0CDopdzHL5XfLg2pkm0tP1Yju+on4SwiMXjs7c0TIhZ/PFWaPIw27fsmiUu9?=
 =?us-ascii?Q?M/NlITZKPQH1ee9pDc7k2Q++oZiekvTfRglKDFbKgECZLOnkFgjXKqzQ6t8b?=
 =?us-ascii?Q?muUB4/3DpipFLpZpZ+cxKnRcHf5fKqJFCcT3JXeiNLna80DMLpG3gbhVnrSH?=
 =?us-ascii?Q?yGClpj2jb2r5/QZomX8efdtMZHzGyCDEHo6k/skL2VGQJSv7XV9+JoF56KUk?=
 =?us-ascii?Q?KZyghlgGy53CPXz2uc2BN9k2tL80DT8dLOlgDcNG46tIxruOxn/BOi4J2uAx?=
 =?us-ascii?Q?5cUqMViZYDIXU6xWZ0a87gnhT3oJBaxNJsay2f+gklLmzpM3PeWsPHAijbdG?=
 =?us-ascii?Q?jALj4KbSONw0s0/2UuGGmFL1xllXKA1Vgd2Rv6vSbM5bTLLaaW06y+GEyV1Y?=
 =?us-ascii?Q?40VBbagXAOUc+3RBj05vTHo+BMsr7pw6ImOcv1WLtCaCQX3xxUgZliQcN/aD?=
 =?us-ascii?Q?ReeBrgyEiopo27NCIesVSa4x0nd/Eieqpz8kJmzXWvY9KpvK57IKNx3BYRbm?=
 =?us-ascii?Q?3vl5/CCdNfK3Eez1dJtwdzPqxAwS8kTls9BjRKqeMecwO68phonGckkvX2Hy?=
 =?us-ascii?Q?eeLAwzSQtgCdK2Q4biKF7BFTUHo4omD6DT4c/CRBbi+hwR2IXrQED7okFAXI?=
 =?us-ascii?Q?tOCecEh/VjPD1LmGmmlHiGyb40s1gxGoYPaMR2V/UsFjl+paZQXvKBL+zS45?=
 =?us-ascii?Q?1zTaCCBDa3rgxHqHP77zmUeBBxXz1FDbxlk/1uDtKBVoBZVcDXSSWj0Mxt3N?=
 =?us-ascii?Q?tQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 75b5a40a-c9d4-4664-a153-08dcd1c37e07
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 18:07:55.3560 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fQC6oSzn6o9i3jmnvyJI+DECSzSswMSZPaND79NplvjCdQR6MvTLofzSv4oorHXLgQAfLJTzFWOpJwyR1E9VmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8379
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

On Fri, Sep 06, 2024 at 05:08:17PM -0700, Matt Roper wrote:
> Stop using GT pointers for register access.
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt_throttle.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_throttle.c b/drivers/gpu/drm/xe/xe_gt_throttle.c
> index 25963e33a383..03b225364101 100644
> --- a/drivers/gpu/drm/xe/xe_gt_throttle.c
> +++ b/drivers/gpu/drm/xe/xe_gt_throttle.c
> @@ -41,9 +41,9 @@ u32 xe_gt_throttle_get_limit_reasons(struct xe_gt *gt)
>  
>  	xe_pm_runtime_get(gt_to_xe(gt));
>  	if (xe_gt_is_media_type(gt))
> -		reg = xe_mmio_read32(gt, MTL_MEDIA_PERF_LIMIT_REASONS);
> +		reg = xe_mmio_read32(&gt->mmio, MTL_MEDIA_PERF_LIMIT_REASONS);
>  	else
> -		reg = xe_mmio_read32(gt, GT0_PERF_LIMIT_REASONS);
> +		reg = xe_mmio_read32(&gt->mmio, GT0_PERF_LIMIT_REASONS);
>  	xe_pm_runtime_put(gt_to_xe(gt));
>  
>  	return reg;
> -- 
> 2.45.2
> 
