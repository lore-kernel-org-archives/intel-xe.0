Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81FB5C83F18
	for <intel-xe@archiver.kernel.org>; Thu, 10 Jul 2025 07:57:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4406910E89A;
	Thu, 10 Jul 2025 07:57:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ImKHdlZs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34E2A10E89A
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Jul 2025 07:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752134258; x=1783670258;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=q5+cOMGpIelwltbSRTvpRZrxzd8MJLDNGP1rT3vGdKM=;
 b=ImKHdlZsn3M8+grd2GYXYxDYnPFznlfDCbn4r329+wevcDpN43nOklEL
 lWLh9yzCoLnLW336ggPGk+Z+1O/aAWVDoQd7XvoB3LQn+20xyUDszqE1w
 nyJv5JaFkCBR5BlQDDgBgyS5/ZR+LkcDkvPZEPti0GysQDuHYrmQZrx25
 HOoMMNHZyJxiqil0ZblHPmWqHBK0t+W6rUo81m5/LzrSMZuxi37rnXwTX
 0Cf6S/Zfd+RwtFk34nbGyRRPyimYR4wlUyZsvzcNG5a0taP5/8A0sB/2R
 QehpQsBOcUKUcHYcMut8xPJt/EEZNdOnK51WUoUZRYoy8khfo8wcpNJLT w==;
X-CSE-ConnectionGUID: hB1ZVvS/TT2Q89YE85adPQ==
X-CSE-MsgGUID: 1S9ksgDNSMKEQhxPdwLB/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="54554747"
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="54554747"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 00:57:28 -0700
X-CSE-ConnectionGUID: liNhaTLRSLKVkIT2uyJOzA==
X-CSE-MsgGUID: AgGMqUTbSJ6mHwtrMVb5Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="155427671"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 00:57:28 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 00:57:27 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 10 Jul 2025 00:57:27 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.85)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 00:57:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EMGQnpGYj1qdk+gP0N9F7PcljlKQ92A4+zFzB3NG0gCYJg4J5yCpfYrLAJM1ciWNlMBoSvADBymk6D8ljVrqnlLiWml4sqNGbuGC6UZAVBecUGlf8bO2p6HdOQMUpHMmOpYoBeD8ex90x73ez+BeJgQ/NtHxy8Of2cDSRLoMF6mN/fSj6Gazt4ZJNOuXdrBfdTW0w93GGBLOtDAl+YaF9mdIX8/RD+uDQnPPdWgy2vU7FINvpbsuEdBX4q41OcT/QsUuFuB6Lg0Pz6//C0SajL2vVKTKUarkpMaE6BPc0oHd4sjl/nVgbHh8NzBPmWoi6Xq0wmt3yNr4LiNGNXMJQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lMSrevCpcqfPjOnRt2d1FkDONp70ysLBvMy4UN9cDrM=;
 b=Es5P/kKvUELWQ262z0MRX4Rik1OZJsYXOP+gpW7oyqAK0mIhFNOgS3fLCwMcA5tVYWBA0oRjVksaeOE/9AEWZNC1GpRvmU6LXDLJV1k2JW3WzYD+mDYlOGDNSBYuWNSRxWrfjNtxvqjny60BOqlN2zcvjziMNmqnFvzzfBL7Wei1WJA/QbmsQCJPDdu0ddMh+2EU4L6Bwyea52nGHjTuF3v1pDmHXF18f2LUleGdApyyHlxcVLxoBWSIuOxqZ+BZfMLMilzJs6vsyjr0WVE4nadbZ1Oe4Q/Ov320zH6JIdPfG94qjuZSv/7SIzrx9Xe6ew9BqUFGvm6HwBnJDFOQPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH3PPF6D09CA9CB.namprd11.prod.outlook.com (2603:10b6:518:1::d2c)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Thu, 10 Jul
 2025 07:56:58 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8901.024; Thu, 10 Jul 2025
 07:56:57 +0000
Date: Thu, 10 Jul 2025 00:58:41 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Nitin Gote <nitin.r.gote@intel.com>
CC: <tejas.upadhyay@intel.com>, <rodrigo.vivi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <joonas.lahtinen@linux.intel.com>,
 <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH] drm/xe/uapi: Add
 DRM_XE_QUERY_CONFIG_FLAG_HAS_DISABLE_NULL_QUERY
Message-ID: <aG9ysag/KlIc3ZJH@lstrano-desk.jf.intel.com>
References: <20250710075435.407068-1-nitin.r.gote@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250710075435.407068-1-nitin.r.gote@intel.com>
X-ClientProxiedBy: MW4PR04CA0352.namprd04.prod.outlook.com
 (2603:10b6:303:8a::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH3PPF6D09CA9CB:EE_
X-MS-Office365-Filtering-Correlation-Id: e7c4917f-8260-45c7-6598-08ddbf87582c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XK+/nZtTQ37kROekonM/8Q6/nkcRHoaH/ejJmy1zdppYXTE7/pSn3rhvZlYj?=
 =?us-ascii?Q?7yABd5vs690+B4kiEYQovWJ8XXtba75Cc4Vvik4rdus7irGc4C4MvGlFelqU?=
 =?us-ascii?Q?nG8aq9a9A+A4YwZO65nMRrWDPCoOA/kvcr6TuT0F/J8+QARbRiy+H+JD8+jc?=
 =?us-ascii?Q?qnvOvfz7O09xlpf6GRyytpVMapQIJgNFFst4bs96ByuYN7Hlhrk0LNJ4A64E?=
 =?us-ascii?Q?9smkGlPh/X60M92xYtzUj4uxiPrx1LV6Ro/9nRb+nuWHTHCVnm3I+FDPtYdN?=
 =?us-ascii?Q?bgl50zk3hE24t0tYpSFDldIS+uBVn6tDQFivdK3h/2PnKKvpXCaFKYXx+VGg?=
 =?us-ascii?Q?YBqvG8OQS9bhuYS5VdFnjkTmO/sUrTm9/0z5cZCx63sIDrTUgJIQeNSOYyKX?=
 =?us-ascii?Q?m+G5K3OIEK4EFh/U+RalqqdXPqfl5iW78JpUqMBqz5smtpEh/WdN8C8ysaT2?=
 =?us-ascii?Q?jl1IXuWevosfvYEfoKs+6xNEu6G95c86FP5gVW6DPNoRRxyl1WwS/uv4KTzP?=
 =?us-ascii?Q?7PzyUPnDX/hbQzQ1EjL2Dkq6t7G0E5mrzGjnKx5BBiu+uz2CuGhrvXjGeWOX?=
 =?us-ascii?Q?UPkCJriDubtJBXROltUY307gfYWN5pKqIgcnF+8q1ziFliSrxnJJTe2tvEEe?=
 =?us-ascii?Q?JMhM7gXl3htbczK9/ejIA05btdx4Q8eX+L5wqeB61oqKzkXr+/+U6SDGJ/jn?=
 =?us-ascii?Q?aHAO1nAEI5WoaRQpHU5kgCoZC6IEvqIp7oKbzsEAU4RuL3bx/j8MeF8+aEiR?=
 =?us-ascii?Q?LJzIHKqjXvJ7sLXIx/ZvXAIqB9VGIhsrHmgj8dEFYtifoXwRmOQtfee3f/3W?=
 =?us-ascii?Q?wwH5NAkvC7oorufEk6v2HodUIze4vzv8cEj7E+9sBFD9fuGPRmN4p7H135FB?=
 =?us-ascii?Q?5XModGPJs6cZSJ7yBBcSHOWgVHjUFf5MgbFI6tyf+gOzzwEIwOCSThYydoiS?=
 =?us-ascii?Q?gt23H7U99O7EwudVypugWxpI1Kwnt9969A1dP4NJ4RvpQuS0FIZki+no1LVb?=
 =?us-ascii?Q?HUBcCX1veMXi+UfLGkl9TvsRFcJ+HU6El9RxWTHOqS9XierqLXhTTvIoQMOW?=
 =?us-ascii?Q?knHTDKcLyqRhhzImI8otwsoYeryOUPGpPd89a2JkHHd0zDJWDgeVwtRHMIrZ?=
 =?us-ascii?Q?Hl4QXdf0ZlE0GkvLfF7Refb975Zn6pYuQmG4FAsTIRCNckHarvV//vrI/t1R?=
 =?us-ascii?Q?AQZss6Tc2mhgG2XfqVqmDkXyUfMKHVoj7HD0OPCl4piyZe7dZA4hWpe57yTY?=
 =?us-ascii?Q?7MUJ7tQ6b11YYnZIBFd6yJ2SHOGyar8W7RtUN1sHW3lCHZQbIHxQ/u0/amgh?=
 =?us-ascii?Q?Z5GjUJlIFRYBiYA5LANvnWYfN62p0bv+XYjiU0VoJWOgbF3HspT0Cgin/4AX?=
 =?us-ascii?Q?sJq/hjE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ItOlULsukPb+Kt7WuLOibepMGjBdoiicIiVKq0brLQh3W8XpyC5WoMmyZe7r?=
 =?us-ascii?Q?GEdtxVAXIvDzJnETJumv/Dtzw6bmoxyfcLNp1KiGpmHlHX5juBed3VXcRz//?=
 =?us-ascii?Q?IiFREd1ebkw1hUdj2WKnhQn2iMZEqHCLyiU3HYkP/2riltIKIAzD9SfuKyJZ?=
 =?us-ascii?Q?HdOiKjRRPAYbpvbIOVQ57az8xaNKazTaEoR2bFB6IrJmvor+qFECHBwjQzdw?=
 =?us-ascii?Q?KkjS8D25RmnijhOpgWvzhwKIyRDoPGNVT85k5hyTWz6KVRe5i7G8J/RDZcs5?=
 =?us-ascii?Q?EoRtvSAV4QSMM7wvtTFsLtq0BH35P8D6hF4fMuXZR4l1E0SXg7obIBCtcNfi?=
 =?us-ascii?Q?wrFsq11Rk2ZbuZFFiLPUaXZ6MZRRq4Vl7rU5s/Mz2AowmfTakLDvxkzpRQg6?=
 =?us-ascii?Q?r3hOAnWVGII198QLlegY3sUiBAO29e4ikBXBbvObrPoG6mguTR8lRfuPPXdX?=
 =?us-ascii?Q?XQN0HEQFQLPcpvkeGrckJoocKPHMqThukLkTkXxIDWDzxqj31Zm8BzSPQpt0?=
 =?us-ascii?Q?BYr7A5Ue8Tt6D8oyuA0tL3L491IZ/VKB9S44zKKd4IksE8AzGi38bhG3kDb3?=
 =?us-ascii?Q?P8kZk4u87GPwDoDfLye3CJ42lvUnVyS87sQIEhrGVsvpcuuP+IIH2q7I6a6v?=
 =?us-ascii?Q?doQQMOEHN4T+p0jOOOWeDEFfoxAJDDGVJaiFfMfdxaFX0DTxXYWqC6DcADbA?=
 =?us-ascii?Q?YzVkyCq3Ny2wBLg+Zfe/ZRjBFFgxOv3KPAKJkyWZoQ4b0PyYbtwQM3VqaRtr?=
 =?us-ascii?Q?l8/B/SbKIhOVwiq5GE6m4+SnkofOARyfwuBP387HO6a9Faum2mhPvbjOsnsi?=
 =?us-ascii?Q?EUsMBPl7R45Ad3n7TJLKmTYXlPu/Rc/2GAF543NH0lBQJPO/LwNeB+Mch445?=
 =?us-ascii?Q?MEjDzrx7vP0EX8tQ0BFZD18ssNYqugwi0tmXxhoUJzAyYWY493NlW8rr5dfR?=
 =?us-ascii?Q?044n5elz0umtAS4iD+djUe4gnI2+LLZio2ysAPh/XQVRDVIcAYfDupgH17Vc?=
 =?us-ascii?Q?LbxaeuBiXs/6w/eZgcrt8z11PD/AA+dAnwvVon7WAFhRhiMx6YMn1SMbk6c8?=
 =?us-ascii?Q?EWadYeDMKdR4Nb+AOWl7dUVa6ozKkWM2ZCqEdsVpMiBd2o+byQ8Oesnyeh6+?=
 =?us-ascii?Q?Tw0/9zsSyGBlkRNvSPkPBvlyfswhVntG6JKuXuvkGbD7MMf4e6S7PRMTstN2?=
 =?us-ascii?Q?5jwJxTrpVWJCvecvst6X4DDcouMhopXqXQaU46ESA87T3R4NYgomwI5sDUP4?=
 =?us-ascii?Q?GeYvrLETHtE5v+8BFT3EZ1Sc3O/M9RGiJx7bewewMG8024NFA7Mqn8BHpv5R?=
 =?us-ascii?Q?sMXL4KgLNersBzhPSJLNLczyG9qCMYyN7mRof/Exm6OZL7cpoj6wZWk5T9iM?=
 =?us-ascii?Q?XfPyEhn0t5huCwBy9GGs1KJP7iBk8HRXBHqfUk4HXhpZtjQm6OEIvGpkbzBN?=
 =?us-ascii?Q?acPiCA96zARqiA4u58IDs/7oYVVYyYN4ctsSMaiQWqBR+wOpcbBqqbYcBoxY?=
 =?us-ascii?Q?l4eQO0JnLMcOhLLoMIyJF4y65dWGgNvwrsrE0vUrtz0xz7dnRmQEV+c9Ea5N?=
 =?us-ascii?Q?ItKLSOWBGKaQwKpG23JA/XHRyBNCsYyU6hT0tY7f5xG0BZHzaoPyDQVOWv/Q?=
 =?us-ascii?Q?wA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e7c4917f-8260-45c7-6598-08ddbf87582c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 07:56:57.8730 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xIlOt6Il9FVoq+xUJPqbMhMjT01zis7+LdpwkjZb+xNAWRHvlqxPxvyJVzyR+TXT9yzS5CkVoaxXUOt8z5r7zA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF6D09CA9CB
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

On Thu, Jul 10, 2025 at 01:24:35PM +0530, Nitin Gote wrote:
> Add the DRM_XE_QUERY_CONFIG_FLAG_HAS_DISABLE_NULL_QUERY device query flag
> which indicates whether a device supports DIS_NULL_QUERY (Disable null
> anyhit shader query mechanism). The intent is for UMDs
> to use this query and opt-in DRM_XE_EXEC_QUEUE_DISABLE_NULL_QUERY flag
> to disable null query mechanism for anyhit shader by setting
> DIS_NULL_QUERY bit of RT_CTRL register for Xe2.
> 
> v2:
>    - Use xe_rtp_match_first_render_or_compute() api to check
>      render_or_compute. (Tejas)
>    - Validate args->flags (Tejas/Matthew)
>    - Add proper kernel-doc for both DRM_XE_EXEC_QUEUE_DIS_NULL_QUERY
>      and DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT. (Matthew)
> 
> v3:
>    - Rename DRM_XE_EXEC_QUEUE_DIS_NULL_QUERY to
>      DRM_XE_EXEC_QUEUE_DISABLE_NULL_QUERY. (Matthew)
>    - Move implementaion from exec queue creation time to
>      WA BB program. (Matthew)
> 
> Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>

We will need a PR from Mesa for the new uAPI.

> ---
> Hi,
> 
> Please note the review comments from previous rev2, addressed in this patch.
> https://patchwork.freedesktop.org/patch/660580/?series=150601&rev=2
> 
> 
>  .../gpu/drm/xe/instructions/xe_mi_commands.h  |  4 ++
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h          |  2 +
>  drivers/gpu/drm/xe/xe_exec_queue.c            |  9 ++-
>  drivers/gpu/drm/xe/xe_exec_queue_types.h      |  2 +
>  drivers/gpu/drm/xe/xe_gt_mcr.c                |  1 -
>  drivers/gpu/drm/xe/xe_lrc.c                   | 65 +++++++++++++++++++
>  drivers/gpu/drm/xe/xe_query.c                 |  3 +-
>  include/uapi/drm/xe_drm.h                     | 12 ++++
>  8 files changed, 95 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> index e3f5e8bb3ebc..84e889528464 100644
> --- a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> +++ b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> @@ -80,4 +80,8 @@
>  #define MI_SET_APPID_SESSION_ID_MASK	REG_GENMASK(6, 0)
>  #define MI_SET_APPID_SESSION_ID(x)	REG_FIELD_PREP(MI_SET_APPID_SESSION_ID_MASK, x)
>  
> +#define MI_SEMAPHORE_WAIT		__MI_INSTR(0x1c)
> +#define  MI_SEMAPHORE_POLL		(1 << 15)
> +#define  MI_SEMAPHORE_SAD_EQ_SDD	(4 << 12)
> +#define  MI_SEMAPHORE_REGISTER_POLL	(1 << 16)
>  #endif
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 5cd5ab8529c5..8234789f05b7 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -55,6 +55,8 @@
>  #define   MTL_MCR_GROUPID			REG_GENMASK(11, 8)
>  #define   MTL_MCR_INSTANCEID			REG_GENMASK(3, 0)
>  
> +#define STEER_SEMAPHORE				XE_REG(0xFD0)
> +
>  #define PS_INVOCATION_COUNT			XE_REG(0x2348)
>  
>  #define XELP_GLOBAL_MOCS(i)			XE_REG(0x4000 + (i) * 4)
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 8991b4aed440..18a0bee38eed 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -131,6 +131,9 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q)
>  			flags |= XE_LRC_CREATE_RUNALONE;
>  	}
>  
> +	if (q->flags & EXEC_QUEUE_DISABLE_NULL_QUERY)
> +		flags |= EXEC_QUEUE_DISABLE_NULL_QUERY;
> +
>  	for (i = 0; i < q->width; ++i) {
>  		q->lrc[i] = xe_lrc_create(q->hwe, q->vm, SZ_16K, q->msix_vec, flags);
>  		if (IS_ERR(q->lrc[i])) {
> @@ -597,7 +600,8 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>  	u32 len;
>  	int err;
>  
> -	if (XE_IOCTL_DBG(xe, args->flags & ~DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT) ||
> +	if (XE_IOCTL_DBG(xe, args->flags &
> +	    ~(DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT | DRM_XE_EXEC_QUEUE_DISABLE_NULL_QUERY)) ||
>  	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
>  		return -EINVAL;
>  
> @@ -616,6 +620,9 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>  	if (args->flags & DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT)
>  		flags |= EXEC_QUEUE_FLAG_LOW_LATENCY;
>  
> +	if (args->flags & DRM_XE_EXEC_QUEUE_DISABLE_NULL_QUERY)
> +		flags |= EXEC_QUEUE_DISABLE_NULL_QUERY;
> +
>  	if (eci[0].engine_class == DRM_XE_ENGINE_CLASS_VM_BIND) {
>  		if (XE_IOCTL_DBG(xe, args->width != 1) ||
>  		    XE_IOCTL_DBG(xe, args->num_placements != 1) ||
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index cc1cffb5c87f..b62502a18c1b 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -87,6 +87,8 @@ struct xe_exec_queue {
>  #define EXEC_QUEUE_FLAG_HIGH_PRIORITY		BIT(4)
>  /* flag to indicate low latency hint to guc */
>  #define EXEC_QUEUE_FLAG_LOW_LATENCY		BIT(5)
> +/* flag to indicate disable null query hint */
> +#define EXEC_QUEUE_DISABLE_NULL_QUERY		BIT(6)
>  
>  	/**
>  	 * @flags: flags for this exec queue, should statically setup aside from ban
> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
> index 64a2f0d6aaf9..a7624b30d0c9 100644
> --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
> @@ -46,7 +46,6 @@
>   * MCR registers are not available on Virtual Function (VF).
>   */
>  
> -#define STEER_SEMAPHORE		XE_REG(0xFD0)
>  
>  static inline struct xe_reg to_xe_reg(struct xe_reg_mcr reg_mcr)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index d2ad8fe737eb..6fc09df67442 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -13,6 +13,7 @@
>  #include "instructions/xe_gfxpipe_commands.h"
>  #include "instructions/xe_gfx_state_commands.h"
>  #include "regs/xe_engine_regs.h"
> +#include "regs/xe_gt_regs.h"
>  #include "regs/xe_lrc_layout.h"
>  #include "xe_bb.h"
>  #include "xe_bo.h"
> @@ -25,6 +26,7 @@
>  #include "xe_map.h"
>  #include "xe_memirq.h"
>  #include "xe_mmio.h"
> +#include "xe_rtp.h"
>  #include "xe_sriov.h"
>  #include "xe_trace_lrc.h"
>  #include "xe_vm.h"
> @@ -972,9 +974,56 @@ static ssize_t wa_bb_setup_utilization(struct xe_lrc *lrc, struct xe_hw_engine *
>  	return cmd - batch;
>  }
>  
> +/*
> + * wa_bb_disable_null_query() - Emit commands in the WA BB
> + * to disable or enable NULL Anyhit Shader Query Mechanism.
> + *
> + * Some platforms require a workaround to disable (or enable) the
> + * Anyhit Shader NULL QUERY for specific engines (typically the
> + * first render or compute engine). This function emits a sequence
> + * of MI commands into the workaround batch buffer (WA BB) to perform
> + * a multicast write to the RT_CTRL register, setting or clearing the
> + * DIS_NULL_QUERY bit.
> + *
> + * The sequence includes a semaphore wait to ensure proper ordering,
> + * followed by MI_LOAD_REGISTER_IMM commands to write the desired value
> + * to the RT_CTRL register, and finally restores the semaphore state.
> + *
> + */
> +static ssize_t wa_bb_disable_null_query(struct xe_gt *gt, struct xe_hw_engine *hwe,
> +					u32 *batch, size_t max_size, u32 value)
> +{
> +	u32 *cmd = batch;
> +	struct xe_reg_mcr reg_mcr = RT_CTRL;
> +	struct xe_reg reg = reg_mcr.__reg;
> +	struct xe_reg reg_sema = STEER_SEMAPHORE;
> +
> +	/* Add WARN_ON check for minimum required space (10 DWORDs) */

#define EXPECTED_WA_SIZE 10

> +	if (xe_gt_WARN_ON(gt, max_size < 10))

s/10/EXPECTED_WA_SIZE

> +		return -ENOSPC;
> +
> +	if (xe_rtp_match_first_render_or_compute(gt, hwe)) {
> +		*cmd++ = (MI_SEMAPHORE_WAIT | MI_SEMAPHORE_POLL |
> +			  MI_SEMAPHORE_SAD_EQ_SDD | MI_SEMAPHORE_REGISTER_POLL);
> +		*cmd++ = 1;
> +		*cmd++ = reg_sema.addr;
> +		*cmd++ = 0;
> +		*cmd++ = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(1) | MI_LRI_MMIO_REMAP_EN;
> +		*cmd++ = reg.addr;
> +		*cmd++ = value;
> +		*cmd++ = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(1) | MI_LRI_MMIO_REMAP_EN;
> +		*cmd++ = reg_sema.addr;
> +		*cmd++ = 1;
> +	}
> +

xe_gt_assert(gt, (cmd - batch) <= EXPECTED_WA_SIZE));

#undef EXPECTED_WA_SIZE

> +	return cmd - batch;
> +}
> +
>  struct wa_bb_setup {
>  	ssize_t (*setup)(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>  			 u32 *batch, size_t max_size);
> +	ssize_t (*disable_null_query)(struct xe_gt *gt, struct xe_hw_engine *hwe,
> +				      u32 *batch, size_t max_size, u32 value);
>  };
>  
>  static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
> @@ -982,6 +1031,7 @@ static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
>  	const size_t max_size = LRC_WA_BB_SIZE;
>  	static const struct wa_bb_setup funcs[] = {
>  		{ .setup = wa_bb_setup_utilization },
> +		{ .disable_null_query = wa_bb_disable_null_query },
>  	};
>  	ssize_t remain;
>  	u32 *cmd, *buf = NULL;
> @@ -1000,6 +1050,18 @@ static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
>  	for (size_t i = 0; i < ARRAY_SIZE(funcs); i++) {
>  		ssize_t len = funcs[i].setup(lrc, hwe, cmd, remain);
>  
> +		if (((GRAPHICS_VER(gt_to_xe(lrc->gt)) >= 20) &&
> +		     (GRAPHICS_VER(gt_to_xe(lrc->gt)) < 30))) {

I'd write this like;

u32 value = lrc->flags & EXEC_QUEUE_DISABLE_NULL_QUERY ? DIS_NULL_QUERY :
	~DIS_NULL_QUERY;

funcs[i].disable_null_query(...);

Nits aside, looks functionally correct. I think we need another reviewer
(Lucas) for RTP / WA part, but LGTM.

Matt

> +			if (lrc->flags & EXEC_QUEUE_DISABLE_NULL_QUERY)
> +				len += funcs[i].disable_null_query(lrc->gt, hwe,
> +								   cmd, remain,
> +								   DIS_NULL_QUERY);
> +			else
> +				len += funcs[i].disable_null_query(lrc->gt, hwe,
> +								   cmd, remain,
> +								   ~DIS_NULL_QUERY);
> +		}
> +
>  		remain -= len;
>  
>  		/*
> @@ -1175,6 +1237,9 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>  	map = __xe_lrc_start_seqno_map(lrc);
>  	xe_map_write32(lrc_to_xe(lrc), &map, lrc->fence_ctx.next_seqno - 1);
>  
> +	if (init_flags & EXEC_QUEUE_DISABLE_NULL_QUERY)
> +		lrc->flags |= EXEC_QUEUE_DISABLE_NULL_QUERY;
> +
>  	err = setup_wa_bb(lrc, hwe);
>  	if (err)
>  		goto err_lrc_finish;
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index d517ec9ddcbf..5b48befd32cd 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -344,7 +344,8 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
>  		config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
>  			DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR;
>  	config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
> -			DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY;
> +			(DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY |
> +			DRM_XE_QUERY_CONFIG_FLAG_HAS_DISABLE_NULL_QUERY);
>  	config->info[DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT] =
>  		xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K;
>  	config->info[DRM_XE_QUERY_CONFIG_VA_BITS] = xe->info.va_bits;
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index e2426413488f..adab49e63757 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -397,6 +397,8 @@ struct drm_xe_query_mem_regions {
>   *      has low latency hint support
>   *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR - Flag is set if the
>   *      device has CPU address mirroring support
> + *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_DISABLE_NULL_QUERY - Flag is set if the
> + *      device has null query support for anyhit shader.
>   *  - %DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT - Minimal memory alignment
>   *    required by this device, typically SZ_4K or SZ_64K
>   *  - %DRM_XE_QUERY_CONFIG_VA_BITS - Maximum bits of a virtual address
> @@ -415,6 +417,7 @@ struct drm_xe_query_config {
>  	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM	(1 << 0)
>  	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY	(1 << 1)
>  	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR	(1 << 2)
> +	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_DISABLE_NULL_QUERY	(1 << 3)
>  #define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
>  #define DRM_XE_QUERY_CONFIG_VA_BITS			3
>  #define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4
> @@ -1270,7 +1273,16 @@ struct drm_xe_exec_queue_create {
>  	/** @vm_id: VM to use for this exec queue */
>  	__u32 vm_id;
>  
> +	/** DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY - \
> +	 *	Flag is set if the device has low latency hint support
> +	 */
>  #define DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT	(1 << 0)
> +
> +	/** DRM_XE_EXEC_QUEUE_DISABLE_NULL_QUERY - \
> +	 *	flag is use to disable null query check for Anyhit shader
> +	 */
> +#define DRM_XE_EXEC_QUEUE_DISABLE_NULL_QUERY	(1 << 1)
> +
>  	/** @flags: flags to use for this exec queue */
>  	__u32 flags;
>  
> -- 
> 2.25.1
> 
