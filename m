Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D69CC4707B
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jan 2024 20:02:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C688010E659;
	Wed, 10 Jan 2024 20:02:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC76F10E659
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jan 2024 20:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704916928; x=1736452928;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=X4Vayk2nAuukTcitEUaYy1QLGDy+Nx0AChotxnFNdqw=;
 b=DsWVKpsKsa+31VLxJumWENGiDAEIoykgDqJj2dXnWlYQIBh85d8ud+IC
 j2g2/KADE7Xoxw2eY/waUxDDrR2M1mXexVUNk/yJv3ICmsUnOnLESIeSa
 8ThVoKDcdzUwE5OPCsjY/l2MGD3SGQdXyxPLJLTx5/4uihv5zsBTTipiS
 1avKOMDE7Njq+5N9whwsCjDmE6WHwR62KibRAZ3hFcTOpYl21B+WcwfUt
 lV6lErBSOBndosV/Q1SRI85rRUWuwOSR/KA76TPAP2v8/4OyotXjFq9bf
 Nw+YVggTMGMVPETYX34MlgMlLjwv5zqVnlkLDq7YdZae8W6JWYomLPIqW Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="12120661"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="12120661"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2024 12:02:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="16774186"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Jan 2024 12:02:01 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 10 Jan 2024 12:02:00 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 10 Jan 2024 12:02:00 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 10 Jan 2024 12:01:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LGvl9I/BNuU8XrHe0wHxOhkzTtzHKywyPZBSniAo/gPyX0KVkepai22MxxPhNCol9VE34n4UNn7bBynwc+/5KBIhZ7nFGNEuiUp76pDXFLwZQJQeKF1YWgQ/cD/34LqvhT6WhZ6AEYtcOuFSOeFSBo57Imn/vmhGRvjdNXrBjbJt+6gq9FR3ue6WDD34e+RmcEPrAE+32cYsNYU2XP3Y4GFtuKnBwrVKSSf4xIsuSksoTsFNDBqQh2BD6FPVNeGQdw1lMjmdMzwQTvYqoNx91pOgt5nbCnow4Kk6kV5s11n5CUZFrIt/jI3hxpMpji4R10ITYLbWrDqLsBXrl+IDbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gnjjb8DwgDqVEMXRE9SCGW9NLQWQ5jQnh7e5KCnyaNs=;
 b=N7xpfcQkvrrTN/ulSZukLmWZB1lkD5KFnsn7ItSRSHFdUFx6B+VpXB6H1atGe6bCBY4ypPtYJfZRbJ7KaJZb0/wbtQQ31nlZoui5PzfZgB8h3x1CndCf0WhZpzJ1GlKFKE1sr/kuBNS4YoabAE8x5SjflwD3lTuFDSUBihZdyy0nVRxoDG4HUT0bwDRjrzIQuB3O1o8czhI/UuW85NdWB0cj984ZaCYF7yQ8RcfHg2/mMTqL2CA0OSIIBmStIBJBgDydtmPZC0bS4s9lmmP5BlHnz3R1aO2FF25NhyH05/jy9QZRTCNMuCq3cOkyVGJ0/FOn0tXu1W1mjUzXmsFFuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.25; Wed, 10 Jan
 2024 20:01:50 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7159.020; Wed, 10 Jan 2024
 20:01:49 +0000
Date: Wed, 10 Jan 2024 15:01:44 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH] drm/xe: Fix xe_assert usage when jobs timeout
Message-ID: <ZZ73qA-mskdW90fn@intel.com>
References: <20240110014306.1406523-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240110014306.1406523-1-matthew.brost@intel.com>
X-ClientProxiedBy: BY3PR04CA0019.namprd04.prod.outlook.com
 (2603:10b6:a03:217::24) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CO1PR11MB5009:EE_
X-MS-Office365-Filtering-Correlation-Id: 985d1158-17de-4ba6-900d-08dc1216fb13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gnyACHyMY9VaKT35C+OHpLoehmY4jDhyvL4lu2Pv0klbLGIcHjGaVn0nR3rgHp22uGw0Qe2SIWyfXhu1wWYg1zpaFo5Ny+Eypswsp1fcbm3aDCA4rv6tDxRKlYD5ilaK3aJ5LjaoCzdhri4V1wplICNApkaSfcTv7xLM6X+cVUKr2JoOvqMcphALMnhgyi1zdZjWmdUmJJMOsZMS9ikjb23+mUHIs1yyEzcsKtcbKTzjo22N4Wg3C4m71GWpb2Dbc4C2Sd/iZhHNjXiekQmMqSx5l79MIBAW2ajbkDYzW/1ddRQvTvgbcY+V02cxt3Vbv0B2nfeeZA/8kH9tvfP6eepOEcTMgeDKX2wShHn65nS9Sw/p5eZOR0qesUlVtHbbOYCSetVpqeqiPKpeHCouWqpYE96jX660TTtoR838o5h0oWNYWWWyhHgNHKB9QvTJ45PcfkVN4faAovN7IL3LL6Q91IEj4MWXITjggMZFnFV1+UCr9wE2DUm+qok7F0sQamTjen5tMhNoTFAlPS0eKRw3j/99/PlOuUXAtMtGGVZew4w7AwTm/28lqohljIPG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(136003)(39860400002)(396003)(376002)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(478600001)(5660300002)(6666004)(6486002)(6512007)(82960400001)(86362001)(6506007)(8676002)(2616005)(66556008)(66946007)(316002)(66476007)(8936002)(41300700001)(37006003)(6636002)(36756003)(38100700002)(26005)(83380400001)(6862004)(4326008)(44832011)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LGef8QrIIOMeHo0RG5zpeJvt9/NDm7HoWNpVb/vZ/ct7XuW4v7vpa7wKspaU?=
 =?us-ascii?Q?UvReihXw6Pjlpijwe4TIPXWGXGu8MketIXbjpt2UT5JAy9py3INbA0dkK+nT?=
 =?us-ascii?Q?DfklF/9x6/BI1pAWc0ePEYiELrOpcsWz6x1U5+KHqoupsdfS23kp0vZRl7kQ?=
 =?us-ascii?Q?HWDLKHrYm0v75Yx9TIeMjEubZlix/VJOoJMW5RV/FwWeuJ2K9OjI/XCLggs/?=
 =?us-ascii?Q?sJYwOyhf0PMZrJN74ezr0AV8S29LOiReLcu2+b5v+hbJCApsLkWvlyHLdU3V?=
 =?us-ascii?Q?22lBB6cGa3dxLRCKMK4Hr/BUWuPexWiDeKLKcVJfg4qsZwiyEdEGXajDupH/?=
 =?us-ascii?Q?d9TF8af2NZ6O/Dc2dhPUwPMOLBEebL9bLnA9Efq3Op46apsmXGOe3pGMdiJf?=
 =?us-ascii?Q?MZRuSzB+dEOuTepaA6gZiSrdG+84gRqsvBMNn+b2uxsaTCuZ5VUAwrV5CKLB?=
 =?us-ascii?Q?uZq9Mwe3ojgRDppywtZfqyaPcEZqp8pkGrN0cu6PF3T6VqW5yUiO8FTTuH1I?=
 =?us-ascii?Q?H4qvW70oSGHkMvRV0HgT/WnVfz2q2HvYNIaV94B8wKyZUZdsXyZgRMV/PD3R?=
 =?us-ascii?Q?BMk+C3o+9/CO4d7qseViUTObV/IuexP4rEdCDJLK8ZDkY+jyujMHkIJ49UMq?=
 =?us-ascii?Q?i691zBxW+ttuFHNs3R3ajhIO2DpR8451xnPpB0JDVjgxWFymatd7A569Ag8z?=
 =?us-ascii?Q?sP10Xzcv5JqKq4p07qHOwFrl/HFBn192cM3ZjtIrg8Dwa60mBLQ0v+i9e4Ir?=
 =?us-ascii?Q?wZ702qwj3vlYFcXUNOGDHE80BdfI4d2FJ8UQ5te8O+ss9gVBsWz9x3ljLKr+?=
 =?us-ascii?Q?kUh56f3X/fQclUztR3TXl0nfiodqrnr1MEliY5zGOOr+0AzRTgX05jJYn7S+?=
 =?us-ascii?Q?Vaa0ta7yt30x4gvK3Pbrl2jsJ3sfp4k40dEhkqBbNThviz1UIW+Mm+7VcpWq?=
 =?us-ascii?Q?wUnQiGdoc8PTYWXgxJITfK8aKFnMMCxc0ZJh5AaTV+A65mVOghd4W4OMUe6d?=
 =?us-ascii?Q?xkyfwq9o+kNoK/EtApkWExe8jiwwIhEd6vw68mttsgfVP6QS2AdN05Qu+bHk?=
 =?us-ascii?Q?O/kP1m5FkINBQHgsTpNwOBuibjkh/oKXbNGIAv2P450V+qPMU+vGML44h0i6?=
 =?us-ascii?Q?6ELcIsi0ykppxOuks3x54MNU1WtNrwQP1kTn3LwnDZtkSSQP4fZMJfZax4NV?=
 =?us-ascii?Q?0PxcEr+zS1uaXL39w41jIuGlqnrpMhWt7W1TIOl1rb4WQpu4Vm10UXlyy8Ki?=
 =?us-ascii?Q?VPw6IVu5tBsViE4eJ6EWbTKoBmfu20dNafpeQdWbRxVyqz7Gdu7gso1mtnee?=
 =?us-ascii?Q?+4TFBvAXFAqZQetrwhvMiP5FgelzpcZQnYF1YXWW/6h+FTcDBB1ArDc9qbUW?=
 =?us-ascii?Q?CD1dhPXazt1qZMbDTJwd0nAgj2HX9m5aHVbkZG7eQ+4Nno94P7n82EeVd1Tv?=
 =?us-ascii?Q?zKnpHgu4qKhaq0OW+JKzb8xdqhQU/XLMPkyT8IXIQkjA7EPcT8kGt3ALGSjO?=
 =?us-ascii?Q?N3Qu2UGbCg3/+lENVweKoaWY5L5P2u/2ujddVHjfeVtrzR3A5a0NSl0XRegD?=
 =?us-ascii?Q?5fFVcd7tcWeNQroDRauhEQGs3OSX6wV2wvEsaEKW/Wz6H5385qzfplrgcfvD?=
 =?us-ascii?Q?4g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 985d1158-17de-4ba6-900d-08dc1216fb13
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2024 20:01:49.9288 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ReLVgtOi98F4oWK1QMuKsvyCIFq2qAZAQ1Z2iCxJEF70HslAqXLLPN3gMevmCBaloou9b8HQA3ZTrOi6bX8MyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5009
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Jan 09, 2024 at 05:43:06PM -0800, Matthew Brost wrote:
> Both kernel and vm jobs should not timeout but it is possible if the
> hardware encounters an error. Do not use asserts in the case rather a
> warn as hardware issues should not result in an assert crashing the
> kernel.
> 
> Fixes: c73acc1eeba5 ("drm/xe: Use Xe assert macros instead of XE_WARN_ON macro")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 54ffcfcdd41f..751b822c23da 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -928,8 +928,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  	int i = 0;
>  
>  	if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &job->fence->flags)) {
> -		xe_assert(xe, !(q->flags & EXEC_QUEUE_FLAG_KERNEL));
> -		xe_assert(xe, !(q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q)));
> +		XE_WARN_ON(q->flags & EXEC_QUEUE_FLAG_KERNEL);
> +		XE_WARN_ON(q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q));
>  
>  		drm_notice(&xe->drm, "Timedout job: seqno=%u, guc_id=%d, flags=0x%lx",
>  			   xe_sched_job_seqno(job), q->guc->id, q->flags);
> -- 
> 2.34.1
> 
