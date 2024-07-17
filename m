Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16402C3DA5D
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jul 2024 20:19:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6B9C10E416;
	Wed, 17 Jul 2024 20:19:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dpIGNUb0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B39610E416
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jul 2024 20:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721247580; x=1752783580;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=biybLaRbFIYYrDxFQ6TVLtknxttcX3TiA3jyjnETFLc=;
 b=dpIGNUb0cAzZJFUkgpzIKq/q5GrXExlFJHM/VNBMR4eq7dQpLVz1E7S9
 Xofx4UV/0KKrrrQbSgw3uGhj/NkDoyIDt92XD5QTwuVfVcj0dQuYOK0L2
 T2TZCuTt0HdPBU0OiQiVN1gOyT2pPMKR60oOH6O0pE/xCYWZuQDcc9lms
 QCOO8iJZLakqsgGynyejQ8KQESU8FZ7FoDYEaNYfX5tXGkbu0R+LV87qD
 OQ85qZCL92sivguFyG5lpJfWZnlHca+GFoamXW+uVHuxdIRP9Dymeb4JT
 RnXbr7LhgmNey9B8ADMlgILoMtRmrjdEO7v+5x+wdfF8/myF138k5tyN9 A==;
X-CSE-ConnectionGUID: /Euo/9++S9GPt/RLcIKOUQ==
X-CSE-MsgGUID: iqG37VpiR023pVHSCciQeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="18588498"
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; d="scan'208";a="18588498"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 13:19:37 -0700
X-CSE-ConnectionGUID: JstAVS3SSwSNuunKZC0Keg==
X-CSE-MsgGUID: V7f6YC1jTFScmwSPqIwRyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; d="scan'208";a="54844378"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jul 2024 13:19:34 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 17 Jul 2024 13:19:33 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 17 Jul 2024 13:19:32 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 17 Jul 2024 13:19:32 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 17 Jul 2024 13:19:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VW+SgAKYgRQzKGe4hyYLt12rBF585s6QKx6jgbso5kABxThqOg8GX2fDV8KkRn7fCIpLCypQzee76GLYrzlDcL51rNRSCcoI9sZ84IqdNItiqQJ3U93pztOdtDl9QVLpGqurhHRHpW7u5QxSQ46ijLBbSFD9091vcrbS7tE3C1CRsyWujZfJX0/mc899PzxpPBZaywARFBfmz1drCiD2y/7zGBQJQ9I7C6tYJllMk183jaFqUNkvfP/ULyxUroo+/hps2UsT6Lx6VvRukUV3TuNyEM60SHojtod2ViHY1pm9iVnCpi/0d1kB+RoDxAJM34UQ5EzDizp+4C73mboyfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2dMtIhD0CuXH3TsbSorP5aZSgBmuMYSysKG7LzvhKbM=;
 b=EwvMjrwb+i09Zc+ulfzmd8LdsDtwtVvtbvXTNfGQZcyUQbAOX6RErBatK0a62mpnfuz6QGflXfBwfJGLNSmtfF9DlXqexIO2UewLbT6H2bvQiNrjPgcAMqlv3GHnCUgkDvcl/pAAHa/0VOSJn6utX9DY0/1As04gvet1TLi+kkju+CmHCk0l1RmGEpYx9Xn8LLu57t9/8yXatAsXJ4p9ydk97peimBeRQ6NMCv7GdcYpcYjQ7DtQb2/vz9wpRr2L8K/7hg9KNbx3U3NSm4qxBdorIeLM5vPCj5DN0+xvZ7onTH8DHwi6Gfs+o8k/E9iA5doDlUOrMYU+OdRHu2ZHgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM6PR11MB4580.namprd11.prod.outlook.com (2603:10b6:5:2af::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.17; Wed, 17 Jul
 2024 20:19:18 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.7762.032; Wed, 17 Jul 2024
 20:19:18 +0000
Date: Wed, 17 Jul 2024 20:18:27 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [RFC v1 5/9] drm/xe/hw_engine_group: Add helper to wait for dma
 fence jobs
Message-ID: <ZpgnE6TR16fFUq1A@DUT025-TGLU.fm.intel.com>
References: <20240717130821.1073379-1-francois.dugast@intel.com>
 <20240717130821.1073379-6-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240717130821.1073379-6-francois.dugast@intel.com>
X-ClientProxiedBy: BYAPR05CA0052.namprd05.prod.outlook.com
 (2603:10b6:a03:74::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM6PR11MB4580:EE_
X-MS-Office365-Filtering-Correlation-Id: 999478f7-9e7c-43ac-5675-08dca69dbc97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?c2w7jqmWVBzX0xGIrzV48fxbWa0o5l50K4b1boJSElOIk/pu85/2XQ7FIOuP?=
 =?us-ascii?Q?cyJ5usvBs1894sH99IRuKT3Z6piDVFAniyNdTmu6cMJKsCNWNT9RNlneRLLH?=
 =?us-ascii?Q?j3+ciEjjvh78tjwrspBf0CaFarDXdmsaRnhaoHQwdxmSBTo+UWW8NLUBODUy?=
 =?us-ascii?Q?it/8Tp7UlEhbDRr9vUx2k/dSISjVTvGKa9J+If7fXcnD2FmcEcntI5O9JqTI?=
 =?us-ascii?Q?+neAZi3x0ypM5A9B+kfHYWA9HXP8tI6zg6ebPOQOWFfKa3l/cNyopYv8H/z9?=
 =?us-ascii?Q?lmxFryfxNvjNzjq0nrGyC9OWI66DcgUfr8H+sgJBqP4Rc30xANnjSF6Ggl2b?=
 =?us-ascii?Q?nbiebxTCCazoXEnmzK1mlVQYOFNOSJg4uxrZPO0tsrXanYeTCodldcFum2DK?=
 =?us-ascii?Q?lIZmKYPtiTFiDiX0l3H6sFp6t4mCVHx+OWUuN9USeJPPjhLjC7X5I7s8D7Ub?=
 =?us-ascii?Q?MZeYruWstmMBHF65GuiGPd2TYIwjprpqwty4pftC+qfga70GUdc9ALU2yk0o?=
 =?us-ascii?Q?Pvf4xt/UUaY19xkOEUcN7bOBa95X5nzTCUuQdvrX4Noi4Fh31jflML0nhWyh?=
 =?us-ascii?Q?A96u47qwXok6/dOwJi3yzj6GJHafBSpTVsE8qZ926hd0olGPI6OrfW13Ay39?=
 =?us-ascii?Q?75i/7EzExZnwE2cDnRt2m2EqORwuLNZjWMsQHtorpOyXykyhAlUQbK6yYYQ+?=
 =?us-ascii?Q?6vK1BoGjuV3ivMcwGGRiz8l/TELNmbc+H9SInDTdheSHW1QpT9HZTs8F8wxb?=
 =?us-ascii?Q?S4OT1P0bdhrX+cEgawdmBKHa6iKDv2c6VV1px19c7UzuWsJKFU1Xc7dzbFnr?=
 =?us-ascii?Q?pa84q6w2heuHRwPLe6fs7meUQnVe4zSRXSNHxCWEjj0+IAC0Q/zjJrB1EHy0?=
 =?us-ascii?Q?mwUYcvD+rtiRO1C8AoUf06wTLmK8n6JfUHHPecsLg0NKvPriR9XiMn/jRJJZ?=
 =?us-ascii?Q?/gU/4ekO0iIhnbpOJw+cbb3DtEwy9gpHuMYtytMm7ccHCaqBznfv6hqRk7UP?=
 =?us-ascii?Q?VRuavBw2QAHYakvMrSADbzL3MKXjYUTeplDS/WMl74GbHcWOOb5L5KotkumP?=
 =?us-ascii?Q?IC0B650HwX/+jdDeuv6pKkYQdmJSomb7ZUhAs/eKm2fvzGeBUo6Wtr6zA4sJ?=
 =?us-ascii?Q?MKRgh9R10QXodkcxyIY1fTIAeKp7078PNkT1+g5WU5EEdCSFaJJlu6RTKgZL?=
 =?us-ascii?Q?bOYHCnMh9XYXdY1EqynigUBfkqJ7ZmVwhh6O59J+ud8zA/Uu354oC+rd9GLV?=
 =?us-ascii?Q?S7WOi5ZK7oELKCUaUtac6t0/wDkGJ8RQEJD3V/bxiKzyuawyenii/4aY81Cv?=
 =?us-ascii?Q?CY/goA9qiwYaX4zo77kguofcehheKyty+Z5LLFsEndAxbw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hdqEDfVwDRG7clu3/9x/aJ8BJGU8JxA3AYxcoeykRWF/iHYUpZcjd8W+KakS?=
 =?us-ascii?Q?O2xXWltmpPJHJnOoHx38eyiPm1xMu3kx5vhc1+2djTYYk0E+y6Rgoy3bir+w?=
 =?us-ascii?Q?aR0YRwoN1KDTYAGZpDVSXkqg7s6a4WvSOzuwrlZQphBjvhH9/un9fzidWnkK?=
 =?us-ascii?Q?+5eoLYdkwAG8vU0MPKjAAKoz4HSHbZ6X2g4liWCcu9aSCLaY17TmgEqqLV9i?=
 =?us-ascii?Q?NuYxFN4CjVnPg+Pu7agMhnEzC4G1bF/hXEwz5ja18wwngQ5dy8dknIdX7qQM?=
 =?us-ascii?Q?Wt0+W4ZoolVaRfewIsgyXfC2HiNyCCZJ+9nMmQoz7XjXf967nyOivO58lK8Q?=
 =?us-ascii?Q?dNFo32sVPFmbxiRrQYKnYdX0LaqCAjt0UEjG+t7mUpKdsnHC1nNXwT0s3Nct?=
 =?us-ascii?Q?6pO2BsDZbPMitwPmTFD5InUAYMOSAYfjvphSgDdeSc/chvYI05pp/ptPZMNT?=
 =?us-ascii?Q?f2mzvdMt9mX3DdH/GwwGpB2hOthizyMUraWRBMtPEI9CQuHpDsljLlDeCJrC?=
 =?us-ascii?Q?lFsdN0tCvMmYGn8b46ZGV8DN9NaNNecfjKi29qnIRuJBRkF+stEZjolNu0Vl?=
 =?us-ascii?Q?hjqN4w/AtUi/5Rx1fbHAGPZ/VhWN7fLMjYJ9KaE/LuUX3FdYYLFjGaMqzYgH?=
 =?us-ascii?Q?AlvJxWk1DcMwCiNY5oBxdcG3cq6GjLUxw9tDZIPJ3BslxjgjyUmKHX/Z0pNv?=
 =?us-ascii?Q?vTCCwEeovDV4ArV/dk5btJ9DCSCiNByuSLqmYR8nnITWTWhbzfmMZJC0WQ5X?=
 =?us-ascii?Q?zi0y9xX832ES/zHaohyRYxldChbWRgN1foXvPEG5XnWMrHm4CsKofCByVvqL?=
 =?us-ascii?Q?onCpBYmr9n0hCnXOuO2XNfac6MED7IgprJnzqVM+ineuiohNx/6SEdcSs0IQ?=
 =?us-ascii?Q?Kk/l/2l8/H6rDlNsGnKAWGGSRWf7QVgVJ9mySO6NWDq2IbzNx/hoHGioWpBU?=
 =?us-ascii?Q?/ohqXkq4EQf2gCnh8y941wGpQAYnXjlj/iiM+7fyWZPpK+wugBpgX6AnJ60l?=
 =?us-ascii?Q?Iz3uKBznQXzzxrbRAteMKXavjvbpMMyRQtPyglI7RwomVVlr51iNv2oD/Mxm?=
 =?us-ascii?Q?MrWBd4uhst/QI152xBxIP0Tx4mAJPFuR/4Vzc4ZRgF0N6AOkRoW0fo0itDe1?=
 =?us-ascii?Q?r8t7qPDpUnfa/xmyfukddXlB95j9/yafAXpePhHLx5/TeEachbMwcZw7J7x3?=
 =?us-ascii?Q?ieCfZ6Ed8WT0nYEOWHbvckR/Q3Gr9asvOCMQlrFWGIzxBdIDdls62uCQ+CHx?=
 =?us-ascii?Q?mwo5B7i+xz51FoLS4p1t/oPTEkYk7zE1spJ/4PXfbXxIOsLccoiUkWyyuAwR?=
 =?us-ascii?Q?tC8JnqwierSUX00ZG4fL3iVojz5k3fo+0YhumZOyjjqjYbWSuvSd1BQgu7i0?=
 =?us-ascii?Q?6AZ0855Q96hKyBUT14+qk82+GSDhYC94gQEdNBLLbSyINcWjPzqw7ZjtUH0g?=
 =?us-ascii?Q?oqoQC5gt208SRTn/EPUIP1EAQRmthKeC/fHb6U/9ho+2B4dpPxHTtLEKe+wm?=
 =?us-ascii?Q?zMgqMGaeTUBCWc4JzFJDLHiYpq2M3/vxEGxcR4FbKTnw18LFfkz/xpcMblQa?=
 =?us-ascii?Q?WMklT7hLmNBKIepS/Q3fTZ/ARtNlTFfVhpJwissDfXk3l2jhGKOK9PnG5Bv2?=
 =?us-ascii?Q?3w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 999478f7-9e7c-43ac-5675-08dca69dbc97
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2024 20:19:18.5299 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mUXEkqMx1Kk+D+mN6jRscwoE4iZdyGbsYTg6O2IMXVLlz0hAac5tUJop/DpayPs/AwpHNUd57h8BXm5bsgVPSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4580
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

On Wed, Jul 17, 2024 at 03:07:26PM +0200, Francois Dugast wrote:
> This is a required feature for long running jobs not to be submitted
> while dma fence jobs are running on the hw engine group.
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_hw_engine.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 850f7b15b154..dc75dfe6187a 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -1251,3 +1251,30 @@ static int xe_hw_engine_group_suspend_lr_jobs(struct xe_hw_engine_group *group)
>  
>  	return 0;
>  }
> +
> +/**
> + * xe_hw_engine_group_wait_for_dma_fence_jobs() - Wait for dma fence jobs to complete
> + * @group: The hw engine group
> + *
> + * Return: 0 on success,
> + *	   -ETIME if waiting for one job failed
> + */
> +static int xe_hw_engine_group_wait_for_dma_fence_jobs(struct xe_hw_engine_group *group)
> +{
> +	long timeout;
> +	struct xe_exec_queue *q;
> +
> +	lockdep_assert_held(&group->mode_sem);
> +
> +	list_for_each_entry(q, &group->exec_queue_list, hw_engine_group_link) {
> +		if (xe_vm_in_lr_mode(q->vm))
> +			continue;
> +
> +		timeout = dma_fence_wait(q->last_fence, false);

Hmm, I don't think this is safe to just reference q->last_fence because
it can be NULL or for locking reasons.

See xe_exec_queue_last_fence_lockdep_assert for the current locking
requirments.

We are going to have to rethinking
xe_exec_queue_last_fence_lockdep_assert. I think we can safely reference
q->last_fence if this function is called in group->mode_sem in write
mode. Let me think on this and maybe will have more thoughts once I get
through the entire series.

wrt to dma_fence_wait not being interruptable, if this is called from a
user IOCTL can can't really do that. Same goes for suspend_wait in the
previous patch, we'd have to make that interruptable as well. Again let
me get through the entire series and maybe will have more thoughts here.

Matt

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
