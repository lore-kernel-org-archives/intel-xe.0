Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 133ECC52D6F
	for <intel-xe@archiver.kernel.org>; Thu,  8 Aug 2024 03:07:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D445110E07A;
	Thu,  8 Aug 2024 03:07:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V3KXoiop";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFF0710E07A
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Aug 2024 03:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723086434; x=1754622434;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8VlD487Nnlz6xsjYdU3Qv5Thu0qVpjEM50wtWQiUocE=;
 b=V3KXoiopJyLC/kY459jZUp+D8avuHbwPjbRmCv10WdFd2G0ipEhAYrjC
 39Lb8hbY57vLaKd3J+5tO65IXWUZRT1ErjyEBFcTAzITXAeKDmRZbaNlI
 cHAaTshpB522I+yWcO2KTtIrj70gSL/83BGyaOtrN521WyMZ8T3kqovpE
 hxSvPWFDoEDAHi29eF2jwefUkXSKXXIccOAWFSdf/01Ha0l/hPXA2ANa0
 DJlOsKmlHmLXd3RAxqmEQGDLj7I2RW6p4wexdVkzsOiBBaflGbSa6U3bq
 FX8MWWevYf4cN9ttEyC0t2G3Mq3Z8o+2M/24QqKZHFlAQc7WHdaS/j32P g==;
X-CSE-ConnectionGUID: RA5R0BCRSl6ZwxEnwrSMuA==
X-CSE-MsgGUID: DUs5x0fMR8yWUegYb2tYEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="38648300"
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; d="scan'208";a="38648300"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 20:07:13 -0700
X-CSE-ConnectionGUID: /w+BxiflS0e6WIccZmDFiQ==
X-CSE-MsgGUID: JQmYeLIRTr6RR3rELeAwUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; d="scan'208";a="56992211"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Aug 2024 20:07:13 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 7 Aug 2024 20:07:12 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 7 Aug 2024 20:07:12 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 7 Aug 2024 20:07:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UTxSbYk5SM9wb0tazY1nQSq7aij7deym3axd2uvJ9lbhtuOBcqi+TLskHHpIt6CS49mLeSj0GzgduEWR19tfrVNlbkObSqa07d8ofHhRcJzB9EhFQKEJLaRVUFVDa7fViWpWDrm41bi/jjTsWBkreUCK4OYq2f4lyd+7KhXghCdQru5hr1TnRhy/KcdaY9i/42DSB0DiaV5XItqVzIg3eSyPGaxXaKOsVvVCXSUkX7o+sR94mah/XwR753vsGn9A7cYCEG5sBnpn6t0m1oogYuPUJ588IJYhANklvbCAUpGZ89VuunPs1uSuYp78J20WEgwPKGGsUUGd29dpJ0pSpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WTN5Dd6YokouRPDhDikdeexspVZ38x++4oHJgClTBwo=;
 b=u5Ua7rhR1n79gdIPyYXGIoCLXuIgOp9Y2ZxUp14dYldgEw2tYmrCS/kWoA5FqW2qEWY+x3yPEV6QCD53UG748ur9uGzRyrCNHCn/k5gvBMh1AjOGk9SUi9N3V7+fzh8YlawHO8P8SV1gUR9xgfVuL3ARTysz5ifZteNxJmdJ5FaZWmE+9sStFB0gLpu5ZeVvayICZRfo6+dgUwdm6XgJRfr6/BguMdc+qpJbE+cGDzuevEzUNrTK4DQY8lvPmhKpF9v3k6KuJafQ2R/PRTWqjtobcQweSg4ARdVwzPucm6JQa6KJD46lKD9Yg9J3mjdn3syKHl1uDkIaMBd1/4kutA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA0PR11MB7212.namprd11.prod.outlook.com (2603:10b6:208:43e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.27; Thu, 8 Aug
 2024 03:07:10 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7828.023; Thu, 8 Aug 2024
 03:07:09 +0000
Date: Thu, 8 Aug 2024 03:05:50 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v7 07/13] drm/xe/hw_engine_group: Add helper to wait for
 dma fence jobs
Message-ID: <ZrQ2Dsv5wx/7ryFI@DUT025-TGLU.fm.intel.com>
References: <20240807162416.1307061-1-francois.dugast@intel.com>
 <20240807162416.1307061-8-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240807162416.1307061-8-francois.dugast@intel.com>
X-ClientProxiedBy: BYAPR07CA0041.namprd07.prod.outlook.com
 (2603:10b6:a03:60::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA0PR11MB7212:EE_
X-MS-Office365-Filtering-Correlation-Id: c4b1912a-3391-42ec-c01a-08dcb757314e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zi3gU8IlWEsPeL049QYeRJn73F7lRYembb5sFC4BB3p01sWg2qxXvLRPsesh?=
 =?us-ascii?Q?mAlitdOtKdQ9FljEQ3EwtCEirJASvRgl9F9NofdBEwPHaUZGjTg+EQyTufCr?=
 =?us-ascii?Q?D2BUSPtFft2U3eIablH6oM6hRUc/STp/T+6FEtiuY4W6rOV4Qq0qiaDysITG?=
 =?us-ascii?Q?BclN+6zJluBACovmTlG1gXIUdeM0YCXimZI98QdssaQA+7VrDFC4vQE15vc0?=
 =?us-ascii?Q?ONnbOTtgujKDUyy53e6vgeBitBnVCuFuttuUNC8vQUZ1I1Xy7ZadBk03Mk6/?=
 =?us-ascii?Q?N131xkMCeh2cbcJI5CWulbvJwzYjgwl+yV9T2Qb93pjSGirONzPF1SQxR9WT?=
 =?us-ascii?Q?/bWFATNWPJRaoAiZoG/JnuUmZ4YAU0O1VJ/89Z7TdKwa5kiNDvXF7n/HBQgS?=
 =?us-ascii?Q?1mkS81lkmxhFDGKg0Q+ZylWz+w9yVmCwp/SRr47M7fHCMXsnGjgQAcv8Qjx5?=
 =?us-ascii?Q?JRLxt4QuhaxLngpiuqvPaYqWMGg53TTn9p26UvaY4MjSobe7tn/th5oJ5ZDb?=
 =?us-ascii?Q?B4Lsy6CnTJRx71xbHstEIhQ3D8euBPSknvKlCfKdocZ5Bx4hkWSNp9PT+Ag8?=
 =?us-ascii?Q?Ui0/q26WLpV0+K6G3pIevK3EJmZlhHGuOM/+42uZJw/zwD19z3XDuB8a2xYa?=
 =?us-ascii?Q?BkZQJ7PdRNIzbrK3kxzawppYAgJ9l/yjUfl7IV4XAW4namEQOq1n10MbrBP6?=
 =?us-ascii?Q?TaN7Z3/JmhnsVLFQ0rqCQtmoKL79ftwUTK6nZf1eSbOgeQ5kjgbTo+xfRLQE?=
 =?us-ascii?Q?fd7FKP45+Mriqg7e2jSK2jsSX0Y6kOiEyjPW4vj4Mh8R6rjN0eRjcmfUaLAK?=
 =?us-ascii?Q?qEOiF6DPsHiQJSwAM11Q35GzeQyZoFp3sy8iAyQ4o5yHKSB+Ph0hmJJfePWb?=
 =?us-ascii?Q?9yL+DNySdQSripxAQOztK26A5cAo43IMJ+QusgBFUvgaRTMWwW4msEOS6PIq?=
 =?us-ascii?Q?Jxos+sEziMwrjmBetONRdyjHYaDVOYKWBWNg9XlhGfaIWNeQuRQcnwcxzMLS?=
 =?us-ascii?Q?pMBor0no9oI2gnF9/PaMJXrh+UDAQmYz2mjTW7chauxEBWxq9brZJXtmLi0m?=
 =?us-ascii?Q?QjDV0fBi95XjzWd8V1vGWWy4fkRt73Cgr1AdM00u8x2TgwF2Ex7TYJNUhkxF?=
 =?us-ascii?Q?CrXtX8HqESmXk0gcQTdX7ianM+Xs2NlmUCgMP8ri4Vudi71sdBW44c0zqohL?=
 =?us-ascii?Q?owSpejS689zgFRAsrPr4T87fhK/IO/IaJG5O6Cd9H1M/IvTb4TltpUCeDE4G?=
 =?us-ascii?Q?EK2liflI4Ffn591XCGCCJ5SWpTD8stgar279Kt8PH1y9zilyXSSRVbgIUeGL?=
 =?us-ascii?Q?B/k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Xsj1hHlgpZj0mY7kbGVqSigh83UUH9ub2nu4BdK5WR297IQrp/SNjpT3HxtM?=
 =?us-ascii?Q?0mo7ZCfrlZ487dqhDc/vkyHiyl++0iQ52EpY8qxIZ/bGAzBTEzPWX2hXpXSM?=
 =?us-ascii?Q?MrX6L6WMfMCS9El2XVtAJJNiRlribg6dy2K/B3Vfd5Vl+Z/sHfp416sIpAUX?=
 =?us-ascii?Q?1uEYVbPgKoVs7dTENV5uh+yErqC5GigGOT4YaU7/JeXJvylGwMC7rFbEqBFe?=
 =?us-ascii?Q?NTzQBfjuINs0sQnqtXRh0A+2FQyUSCA1gDCty6Nt+OxwCdsYVT5VM09LZEYJ?=
 =?us-ascii?Q?OsSPwxJskKqK4A9mIz3+XM66cmr6LpCutZmCOH1ez8GmXEj9PdF/qr8mGhV+?=
 =?us-ascii?Q?luDQXP+8QvdNaYDvpZY4Q+mNnRbpgf2h6ZjCsMkSJbAfKvmkAng8qO6zZDdJ?=
 =?us-ascii?Q?aFKxjMvYGX5C3rAfLrdRXhopM5UxctcV7ba9hw3l1sIc6KQVGHkRQbNUqoOT?=
 =?us-ascii?Q?8LNfdI/mLW1YcdLD260enucieohwLDdJ53xwUt+8YuWsl/UzEn49vCfe7eIM?=
 =?us-ascii?Q?IrMLq7OwlhnTsrApG+YL83pRKFDdT1CuoUF4b7ITC9zavIa4WOp0VTMthtCH?=
 =?us-ascii?Q?onh2ScalXzgc1Yj3m02vJ4vvHGJQ7DjLEQAfH/UPKdEVRH36rUvne2EuodMW?=
 =?us-ascii?Q?3AasPSgyCgN50h42HhK8dOCKhDmW2fmJVNuI+axkPR9CpQIJmzsQ1p8v8glE?=
 =?us-ascii?Q?Sjk3KIm9oiFK9yZcInfQMYy6G4ISWAMA7l60qKPSIr1fMyT6TjNtzRYKKjqL?=
 =?us-ascii?Q?frY27rJXU7JBe0oQpjIka/7ZV/ZD3c1iudUcUPPoWSf5nVQPHdTXE0p6PJsU?=
 =?us-ascii?Q?lQBmSwVX10+5FUAtrA/ARl9MSPrW3/fyM3ycP8tpjAV0TQ5rMQLdWF8ZHFJB?=
 =?us-ascii?Q?fmrOTL7FMd/k7fClFHaMvJlFtZ1YRUIZ7qVqF5E7w8cg6QDGPsCvM4U3+Z6K?=
 =?us-ascii?Q?gcWKivAA/Du4RJX/tkf3Yd8xuoV+K/nZZWiuUWNte/8BwJv8w8a/3A7KqSSf?=
 =?us-ascii?Q?CvxVh/oAwoaYxWQ5sMi8oOGg94M1pOeBzeRQxfVXFZAkfOzUDOI7yRZTJlVW?=
 =?us-ascii?Q?RXdU7lJG+TFztuKJgCR1C4zCGZheCP/XH+p5ZP7+WDtqudmyTJaP+O/kTstl?=
 =?us-ascii?Q?Hl7nyzhLZFu20FupyHOd2o16CVADf6fGieCMoZZgcO7KA9FQirKf/Kij93kf?=
 =?us-ascii?Q?zXLd+FEZl9DSKN8Csow+mzFRZbUkR9+X3hHCZv3O4jI1Qn0wVygrV2lMS9DD?=
 =?us-ascii?Q?1g+qvcdf2mydVTf7i/RAmvH85ILBivFoEu72Zt3s06rqJP/wgNSwUhJTh9Va?=
 =?us-ascii?Q?yfYznRko2ZV/OU2uQRFXpWEER8bzaHb576+FjTWsRIWqQCVLwShyeybZWUNZ?=
 =?us-ascii?Q?tKBBY4RvhAMsxMQabmEs5Jr2KX+uF7w6WIsoF7UCJiWgF6LoA14YzcSX482t?=
 =?us-ascii?Q?JJbMQmcgugZYPF3fElzq1JCpVJ6NadQo/nMGMDxycFnyc165vqCrzgjWShPU?=
 =?us-ascii?Q?8RNQDn5c71JJguSysDx0eJjgccdG6d2m8/JeW668blKSBpDJkHsGhAkH37P4?=
 =?us-ascii?Q?rlqF6gyDfXhgCoawj8D36Y8CA2FeR32QF1mEcJVvhuCthEn4VcEJMFwLzCvC?=
 =?us-ascii?Q?Bw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c4b1912a-3391-42ec-c01a-08dcb757314e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2024 03:07:09.8036 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lo2fXQV5GKlqi8lj88yhvzjl3V/TFsz3jWvQlqwibJhbwr27shUwK84fqX2BbBlRzolbbQjtDFboUB5Z8qRiEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7212
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

On Wed, Aug 07, 2024 at 06:23:36PM +0200, Francois Dugast wrote:
> This is a required feature for faulting long running jobs not to be
> submitted while dma fence jobs are running on the hw engine group.
> 
> v2: Switch to lockdep_assert_held_write in worker, get a proper reference
>     for the last fence (Matt Brost)
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_hw_engine_group.c | 33 +++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> index 3f74ff577a4c..955451960a3d 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_group.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> @@ -180,3 +180,36 @@ static void xe_hw_engine_group_suspend_faulting_lr_jobs(struct xe_hw_engine_grou
>  		q->ops->suspend_wait(q);
>  	}
>  }
> +
> +/**
> + * xe_hw_engine_group_wait_for_dma_fence_jobs() - Wait for dma fence jobs to complete
> + * @group: The hw engine group
> + *
> + * This function is not meant to be called directly from a user IOCTL as dma_fence_wait()
> + * is not interruptible.
> + *
> + * Return: 0 on success,
> + *	   -ETIME if waiting for one job failed
> + */
> +static int xe_hw_engine_group_wait_for_dma_fence_jobs(struct xe_hw_engine_group *group)
> +{
> +	long timeout;
> +	struct xe_exec_queue *q;
> +	struct dma_fence *fence;
> +
> +	lockdep_assert_held_write(&group->mode_sem);
> +
> +	list_for_each_entry(q, &group->exec_queue_list, hw_engine_group_link) {
> +		if (xe_vm_in_lr_mode(q->vm))
> +			continue;
> +
> +		fence = xe_exec_queue_last_fence_get_for_resume(q, q->vm);
> +		timeout = dma_fence_wait(fence, false);
> +		xe_exec_queue_last_fence_put_for_resume(q, q->vm);

Missed this eariler.

s/xe_exec_queue_last_fence_put_for_resume/dma_fence_put

xe_exec_queue_last_fence_get_for_resume gets ref to a fence which can be
dropped via dma_fence_put. I think this might be the source of CI
failures [1] [2] too. But neither DG2 or ADL should be triggering this
code path unless something else is going wrong. Can you look into these
CI failures too?

Matt

[1] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v7/shard-dg2-433/igt@xe_module_load@reload.html
[2] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v7/shard-adlp-1/igt@xe_module_load@unload.html

> +
> +		if (timeout < 0)
> +			return -ETIME;
> +	}
> +
> +	return 0;
> +}
> -- 
> 2.43.0
> 
