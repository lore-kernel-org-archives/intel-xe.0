Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45FD7CA0EFA
	for <intel-xe@archiver.kernel.org>; Thu, 21 Aug 2025 22:10:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B5FF10EA3C;
	Thu, 21 Aug 2025 22:10:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="koCa2xUU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B22EE10EA3C
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Aug 2025 22:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755814201; x=1787350201;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=HKBuELjFpKFhWOUAkhGpb2AH4LIljxaUrpPAaiSD0do=;
 b=koCa2xUUD6OSOvihcsqabOae+LLmrwD+ogWhwS7q6sqmo1/nEhTApK85
 KSjnGW67xuh7wTRl40LJNQgvFOExmRZhSX58DD4Y+bxiiebVToMmhJGTp
 jwcyLKtW9izSO7zsqcrhlph4fLAnwu1GO2qRk5jVXE8vfey2WXTzVLWd4
 Wvdy5qYX8ZCa/b73DRdZsY5G5Zj8pchIsNgtii+l94fZYnCfINdLptwpZ
 KhAaMK+ZbTkp/H4dN4NP4lRBddN8yh8U1nBsgR+CK4QX95ltRMvDJgjBQ
 QgZD/7X3QGcFg6ag0Slvk8fhJIRcfujTfQpOnrcNd3PVM0XJ6hnMYFn1b A==;
X-CSE-ConnectionGUID: fQZm8C/6Rwq9RbyOtOya9w==
X-CSE-MsgGUID: AQgerY8cTUWYTGuTokVndw==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="68716560"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="68716560"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 15:10:00 -0700
X-CSE-ConnectionGUID: SqURwXmbQlyx6zkF1thzjg==
X-CSE-MsgGUID: sfVAf3JuSdKdVpwP19p6Xw==
X-ExtLoop1: 1
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 15:09:59 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 21 Aug 2025 15:09:59 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 21 Aug 2025 15:09:59 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.67)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 21 Aug 2025 15:09:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=clo/sCzoa6RrspQrdcWGEvh0Y4HMQcjKJSPOpRzXE8+fiUYZS91dal8q6nbAB7BaD1WacVUSXuAJIKrdy8vLi85pWq4zMh1ZaIPUZ56O3tkRWoKeUnT8QR5Ci7iCQazM8gmd1w+NyJPehq2t8HaC10s77ezvW1TDpntZ7NiUroGhxvAM95LJHxtcZHIqOdJFA3sB+DYfsUlCvJXM8BgmEqna/5sug06BOgvmaEqtZgC8QlH+DRAJt5i9Dxj09toOqgM02DRcLsA8Lz3bVjYuvzGKfESxdbduw8Au/krJJ7Iy8WnXINqTfnuV8FA3aeLtcTpdkZWc8TdQv3ez732kvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=51DVcRzlgOBegvjqyCUtooroMwGXl1xtN8MSd6YR42c=;
 b=Cnc/eK6a6QKmNJLRRCcviPDQsNcEHnQvI/1Dz4CnG+ya6A5URiB6O/uqXBVjSzlaJdHoB7ybuqqjzjk5j035J9ip9KkGiMWwZRuYnBfaSDvhyIEmc+xg8uNvNVH4Pe9vUiTqjr02hzQul1vU46dkbtvEh6i7LzYkPb/EOz6D/1nkCn4YQSnoFyaLT+gG1nnm+JtAxK6BG5UgVb2QSf41gSKnLvGCWHBAlEFBdfeOgBg7vKrNhDx4R1x2NO3ACipPTTkDtes7ZsPVwQHf2BYGgz1qLNY4hLNl4wCQnL4+BGXubYTQDFE45wyAKLo1i31eATFgx4b8/zWXyN/T7Bsn0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ2PR11MB7600.namprd11.prod.outlook.com (2603:10b6:a03:4cd::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Thu, 21 Aug
 2025 22:09:56 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9031.023; Thu, 21 Aug 2025
 22:09:56 +0000
Date: Thu, 21 Aug 2025 15:09:53 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Stuart Summers <stuart.summers@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <farah.kassabri@intel.com>
Subject: Re: [PATCH 1/9] drm/xe: Move explicit CT lock in TLB invalidation
 sequence
Message-ID: <aKeZMX6pHiR4aw36@lstrano-desk.jf.intel.com>
References: <20250820233057.83894-1-stuart.summers@intel.com>
 <20250820233057.83894-2-stuart.summers@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250820233057.83894-2-stuart.summers@intel.com>
X-ClientProxiedBy: BYAPR02CA0028.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::41) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ2PR11MB7600:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cc62294-a599-47f6-551c-08dde0ff7608
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KzwnoLd/kBY/bKtocLG5FvwQwpfWP3iHkUFBFQwHqUHmJ1h76YEnh+QKQnQi?=
 =?us-ascii?Q?Y+VRjY4beZyiX+yHU2VW4g6XUxPea61L7I6JjgpVVoGpIrvVvHK18FOiqMeM?=
 =?us-ascii?Q?o4miFk1VAEkTIdn63urJM0XecbSiFBTJneMhnBo6NC+ySxwMV5LcDiNr0D9a?=
 =?us-ascii?Q?6NlRicHbJQ6rBNNGYvIRYwuX47ggBW4j8eT4aE8Fsp8YWwlPu1ZlCar/8OjQ?=
 =?us-ascii?Q?LZO3ryy5Wy+w2l7jpVjps3fo9CJGtC1x1XPWH210D1xBPUzIVg7nYYSVnajX?=
 =?us-ascii?Q?lzePKZjPHNyaI0cnoxN69hj9qHXUUbrVgv85tbkKYS3ZEX/cGSmwQTuzM4rg?=
 =?us-ascii?Q?HKNNTcBjfI/VSRMng/3RPH6TXy9KhIV6lprdCqYH2GUwrBzpTiVsLJwQObhK?=
 =?us-ascii?Q?/7gzJ7ILJr2PSP4kA5ofgQ4lIy6J4nf/S0KMMlj3ve+tN4qijKrUM6crxM9u?=
 =?us-ascii?Q?673fCB5/UMF0ZFGXxPjLnik6dZjmkA8b0POXU5cjDGdkTzX4WYAfdWODz+v2?=
 =?us-ascii?Q?+cZtMJotPffM2Af8hm6i7UHcrs0Gb//fWecqwV5T45psthx9s4wD4g+2vOUp?=
 =?us-ascii?Q?S06ZFFCXxqv31X3nSlwsXSLP79ofT0XwLy/9U4ClIWVdLXtYXXBchGurNguc?=
 =?us-ascii?Q?jHbOI3RNLJY9u1yJHa5tx7SlH5l+AgQjfuOR4tf2TAwQvir4Ii/FNWbDIZdc?=
 =?us-ascii?Q?B0GcmDGwr/hxqv/mwyz1V+q4lMl7OIXmL+SV6exXyW+fbKMiGE7wqJSecntY?=
 =?us-ascii?Q?c1+Vn5FrAtS94ozoUFK3N0U5PPUswBrzSnVNNSXpIOcqmFHDGtwRxzu48UZb?=
 =?us-ascii?Q?Gxt4Yi7a0d/h/3lkJi156XOQhUMzVYMx4oE24ET0XG6vpm9B0nAkvQE5r076?=
 =?us-ascii?Q?ykMzZcbpCde75Qg+nie/cuEksBe3UGC02HlEGOxVtzeNPD8VCSEsf7ByNiOQ?=
 =?us-ascii?Q?t3yzTeDdXXwuW+EZH5NOPd1lSL/cB4f2ylXANXIBSHpEwOfBL07DlIPHtPrp?=
 =?us-ascii?Q?0Prk08gq4lN5x7e46IwN5sUu1Z+zspMrX/72KPZCFJCBKc9a1Py/Upl6eRYQ?=
 =?us-ascii?Q?E2pO6nYo1stok17LuinlFcTMrSJ+nyAmBPn8mUQYVfpSqWALDiDFyVptfnxL?=
 =?us-ascii?Q?vLH7bIqK8MUzH9472qMmAvkefwwyOJuvOH6J6ypxWWzJIwH4nabk5PzP81Vf?=
 =?us-ascii?Q?JiLy+J6qj0WOR0V8Xt+rIPg7kSwlLetD6ODpOh9i8MwpdVxDxkhh2WblZehy?=
 =?us-ascii?Q?/IEONAtFuWTGEPt33rA2lA50S+gWalx2gZA7WzgGnXuAno8FdUeSKU186yIi?=
 =?us-ascii?Q?Fned97PhzZO/8RFnz/mnLfS3HfpM5pIWn5YBQOVVmyrwxrNRi5+rdzPIkGmN?=
 =?us-ascii?Q?mefKEt9vMVmZtc5/xkk0brplV1TlFY9P+RhEoeZ+FCV+v++ADWxUExzaRKZE?=
 =?us-ascii?Q?KvCdYMSySRk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qmEO6trq/55/QWlHQp5q1wfpLTPapCk1ZF5qyya4EhXJTCXXjEKhf76k4KNk?=
 =?us-ascii?Q?HNppHwMnvBM7X92mGpcWgu/Ta399qO74VUq7wNErhtFjwgrRB3dM+Dur8aur?=
 =?us-ascii?Q?E+owaSp2ziDmZK8Nmzyb5jb+aW6EGqtB2GPOTbFwe3NfH9WNK7gBIMAxvNOg?=
 =?us-ascii?Q?W+zoISjbfRSIYHSw/lFWYdJbSFLjFDLsKGrt5t40wD2fXWkhT2113fxREFQx?=
 =?us-ascii?Q?oeyFtTWXMFa1z6IwwJMNireXGO5tXe+Fx9QW9E3cMV1olIxUOmlofo4Z/jYv?=
 =?us-ascii?Q?QTpR3ZqPnagBhlJvr+0g4qrRvX6PlMzWZSm7miycpoeJxCYt+x6zCR0L4dx7?=
 =?us-ascii?Q?4qcV0OV61lukj10Fl57/FJ+pS2E0T27OkHkzyvA3Aw0aNFLzXhXCAnRb12nF?=
 =?us-ascii?Q?bmA1mLhPn+/JDgrzk1RdV1r+mbtIFEg53HGsN7qmqYOlsPYH84tcKLdU2XcQ?=
 =?us-ascii?Q?I0hBKDIptrde5lDXC0KCK1wh5UDy8KmRAkxzyu5z6JxsNm5VB8MRNgP91hx5?=
 =?us-ascii?Q?LyRDxdH+RgjVxQDkJV0dlsHoldXefeWuMYkwL7RNTa+3HMOUvRdgvqWm+SBQ?=
 =?us-ascii?Q?YafpBOBMwnoDc/YlkfZ/l4v8lyanYubKQk2uDMTDT/PXaVE/0dF7zUJloKwH?=
 =?us-ascii?Q?IaMXDyKj1Dhkg826uXclBAbO+XGc6LmR4JQBCnMhX3xo3heYfNmwec+Nf0EW?=
 =?us-ascii?Q?mEFlhaGIMVh08IJDJUSbUYzFLnwfg72a2fuBlL85E3B/+vj6xoGKlC1JTTpL?=
 =?us-ascii?Q?FcZ38011itfilePVGu8mB0oRWXU8Uy5UY+ltX5thLLv1rEGuOD+JE/Di494F?=
 =?us-ascii?Q?yxdjfuFb/uxOc0jlhGJOPxqVb27nhjphy0hW4TNXIrgzIhfPbIq5J6kgA0AK?=
 =?us-ascii?Q?xuLABqHjUrtgUgmhuMGErA4U0QrKmHZVa6xSxGfFW8FsLGsZcKtst+eu0n20?=
 =?us-ascii?Q?zEmHuZyog4CuvyVKJEzMhd2Qb4hOoyrvIzj3rqo0z00z+L6OGOVWfTbTWS+k?=
 =?us-ascii?Q?iCcfcWly/vTwWf5ftLE4TsOlpYC1pOMylvROo3C21Y0wJT/uUUMi0cNJdVaZ?=
 =?us-ascii?Q?sQiWqxofvWpsobCf4z9sTMQOuWCROrHsO5GVXelY6+4rdNa+N4QzdFgsj3Hl?=
 =?us-ascii?Q?4kFbchotj3b9jF1/U/WcEYgVq+YpuJV0IS7pv3Ga+Q2Q24lvNAGBvZpepJcm?=
 =?us-ascii?Q?XLojhEMdNQHHHWpmF5A0wYUjt+5wO2bt49Zgl6Dyi2BMiSLiQubCGzMlujcm?=
 =?us-ascii?Q?8LAFoPPTsRvmmmZh4vsGnACvJo5Ui295QxRvmOnExItfa0JmKestwBnsn4TN?=
 =?us-ascii?Q?7CWeey1ZDwebmciSxhe9f9flkcOcNEcoI/v8fWXtBXpeShWpBUHrwxXSdLBW?=
 =?us-ascii?Q?h6sh/3M2Vw854siS2V9rbs6l/xwR8ic92Az/E7/M+vT1PvTWcjw3BJ0bTD30?=
 =?us-ascii?Q?CH/jegRQoLl1iZA8DRXvPR4o6UQ6cHGhsfDw+/N0GuWrfD5ozW8ljCTQn0Uw?=
 =?us-ascii?Q?RlEuixsnQALu15HsspRxvT6QkTtAoIjfym4Eb7CqKKEwO5HkFvJQCjK33ZFp?=
 =?us-ascii?Q?/eFRoBALjosLvcI6I/UdPvDwjqvzbeCk3cvwgb0oHRWH40lIRmi7nmohKBpO?=
 =?us-ascii?Q?3A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cc62294-a599-47f6-551c-08dde0ff7608
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 22:09:55.9671 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gm3FwofAo2asfPnPJTcReKaPbxkFsKOGBVInbu/ZHlftmsyXo84Ib/kHJ1kymsmSHrtA0I8ORzzYIXrFtshZ9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7600
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

On Wed, Aug 20, 2025 at 11:30:49PM +0000, Stuart Summers wrote:
> Currently the CT lock is used to cover TLB invalidation
> sequence number updates. In an effort to separate the GuC
> back end tracking of communication with the firmware from
> the front end TLB sequence number tracking, add a new lock
> here to specifically track those sequence number updates
> coming in from the user.
> 
> Apart from the CT lock, we also have a pending lock to
> cover both pending fences and sequence numbers received
> from the back end. Those cover interrupt cases and so
> it makes not to overload those with sequence numbers
> coming in from new transactions. In that way, we'll employ
> a mutex here.
> 
> v2: Actually add the correct lock rather than just dropping
>     it... (Matt)
> 
> Signed-off-by: Stuart Summers <stuart.summers@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 19 +++++++++++++------
>  drivers/gpu/drm/xe/xe_gt_types.h            |  2 ++
>  2 files changed, 15 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> index 02f0bb92d6e0..75854b963d66 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> @@ -118,6 +118,9 @@ static void xe_gt_tlb_fence_timeout(struct work_struct *work)
>   */
>  int xe_gt_tlb_invalidation_init_early(struct xe_gt *gt)
>  {
> +	struct xe_device *xe = gt_to_xe(gt);
> +	int err;
> +
>  	gt->tlb_invalidation.seqno = 1;
>  	INIT_LIST_HEAD(&gt->tlb_invalidation.pending_fences);
>  	spin_lock_init(&gt->tlb_invalidation.pending_lock);
> @@ -125,6 +128,10 @@ int xe_gt_tlb_invalidation_init_early(struct xe_gt *gt)
>  	INIT_DELAYED_WORK(&gt->tlb_invalidation.fence_tdr,
>  			  xe_gt_tlb_fence_timeout);
>  
> +	err = drmm_mutex_init(&xe->drm, &gt->tlb_invalidation.seqno_lock);
> +	if (err)
> +		return err;
> +
>  	gt->tlb_invalidation.job_wq =
>  		drmm_alloc_ordered_workqueue(&gt_to_xe(gt)->drm, "gt-tbl-inval-job-wq",
>  					     WQ_MEM_RECLAIM);
> @@ -158,7 +165,7 @@ void xe_gt_tlb_invalidation_reset(struct xe_gt *gt)
>  	 * appear.
>  	 */
>  
> -	mutex_lock(&gt->uc.guc.ct.lock);
> +	mutex_lock(&gt->tlb_invalidation.seqno_lock);
>  	spin_lock_irq(&gt->tlb_invalidation.pending_lock);
>  	cancel_delayed_work(&gt->tlb_invalidation.fence_tdr);
>  	/*
> @@ -178,7 +185,7 @@ void xe_gt_tlb_invalidation_reset(struct xe_gt *gt)
>  				 &gt->tlb_invalidation.pending_fences, link)
>  		invalidation_fence_signal(gt_to_xe(gt), fence);
>  	spin_unlock_irq(&gt->tlb_invalidation.pending_lock);
> -	mutex_unlock(&gt->uc.guc.ct.lock);
> +	mutex_unlock(&gt->tlb_invalidation.seqno_lock);
>  }
>  
>  static bool tlb_invalidation_seqno_past(struct xe_gt *gt, int seqno)
> @@ -211,13 +218,13 @@ static int send_tlb_invalidation(struct xe_guc *guc,
>  	 * need to be updated.
>  	 */
>  
> -	mutex_lock(&guc->ct.lock);
> +	mutex_lock(&gt->tlb_invalidation.seqno_lock);
>  	seqno = gt->tlb_invalidation.seqno;
>  	fence->seqno = seqno;
>  	trace_xe_gt_tlb_invalidation_fence_send(xe, fence);
>  	action[1] = seqno;
> -	ret = xe_guc_ct_send_locked(&guc->ct, action, len,
> -				    G2H_LEN_DW_TLB_INVALIDATE, 1);
> +	ret = xe_guc_ct_send(&guc->ct, action, len,
> +			     G2H_LEN_DW_TLB_INVALIDATE, 1);
>  	if (!ret) {
>  		spin_lock_irq(&gt->tlb_invalidation.pending_lock);
>  		/*
> @@ -248,7 +255,7 @@ static int send_tlb_invalidation(struct xe_guc *guc,
>  		if (!gt->tlb_invalidation.seqno)
>  			gt->tlb_invalidation.seqno = 1;
>  	}
> -	mutex_unlock(&guc->ct.lock);
> +	mutex_unlock(&gt->tlb_invalidation.seqno_lock);
>  	xe_gt_stats_incr(gt, XE_GT_STATS_ID_TLB_INVAL, 1);
>  
>  	return ret;
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index ef0f2eecfa29..4dbc40fa6639 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -190,6 +190,8 @@ struct xe_gt {
>  		/** @tlb_invalidation.seqno: TLB invalidation seqno, protected by CT lock */
>  #define TLB_INVALIDATION_SEQNO_MAX	0x100000
>  		int seqno;
> +		/** @tlb_invalidation.seqno_lock: protects @tlb_invalidation.seqno */
> +		struct mutex seqno_lock;
>  		/**
>  		 * @tlb_invalidation.seqno_recv: last received TLB invalidation seqno,
>  		 * protected by CT lock
> -- 
> 2.34.1
> 
