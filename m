Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03A78CF9C72
	for <intel-xe@archiver.kernel.org>; Mon, 23 Sep 2024 15:54:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B1CE10E113;
	Mon, 23 Sep 2024 15:54:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KK5822WY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C25010E113
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Sep 2024 15:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727106860; x=1758642860;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=CdFMIhN+Mgp7QIbXgjN5vP31ktHfcb44RmHXiIzBhWk=;
 b=KK5822WYtBdGy4ptAKJCI2uytTqXyl8CgDa8uNBXfOqFpADrcNucqTll
 sdFvSWB7zajhshRuurtLzeaBBDH1KKuKtYsP0mp9RkFU87oCYC51m9gCU
 cD9dxZDEwiUOTY4Syq7UUa21C8tPdec50PPC0YRaqOW2Zszhpa8mXq5QJ
 pgxB+iXgwRoVDPlyRfmRdlvYaU/hTzKsI7Zv3aJO+jiO3UcBN5Rr3SQpw
 czOiOjm25ovrWVHQy843F+E0P2/qi/ECw1N8t0FjFU/Ij8hbood/m9P1L
 AfTY/HqHoR67YWR/BjfP9cakzoNrv1lzunV47i+3ed7DzJyuKeLUUjntm Q==;
X-CSE-ConnectionGUID: 9wyWaYxXRNCwCld6H7yjGg==
X-CSE-MsgGUID: Omyi+ZWVQ9q4pSez7A0Mgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="36632156"
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; d="scan'208";a="36632156"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 08:54:04 -0700
X-CSE-ConnectionGUID: m0eV2UjfQ6a62n4RxyGXGA==
X-CSE-MsgGUID: w0LEWbdqTQyolUq9H96a1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; d="scan'208";a="108544903"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Sep 2024 08:54:04 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 23 Sep 2024 08:54:03 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 23 Sep 2024 08:54:03 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.44) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 23 Sep 2024 08:54:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YIaK2aI0cnOtpqWbdhseogbCo1i2a8yakNiCwhHvOY7rKVzcszGhKTnRbBfbIR9/Yh8ZFg8f0KI9kQsNUZxYqFh+3bq3fV1znckxMu2C8lr944tUMuwutg+Xh6lwKPUk4c0uKO+ARL6GkLYu5XtGOPMgCqKdz00s9N/Q4/ndmPsQ65kGnEdngspRYRDXlXsK5GUNadHSV1QQ7KiTjs0FGZ5uL3GzFIEKmNJ6euNMTWcJQhllmyfF1ULzDlkyyhvRVOAufuTFO0yUq+m9mQG+1rNq1qtsTbq/WKb/Z0JDOSf/Xm3f56ZICswhCivD7WiCa2ZQjVrFzv7KFEzcVPHg1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UEFmKKhrTwz2+UoZ6xeBTchWBy4FumXaEZ8EdD4t5D0=;
 b=d6YHaQ2/SpYF+eP/hhxVdKfFuMRBTBXpLmSAXapFiChQHcJ8bRYv4+n/+J6TTdD1yYILlPOJ745yro8IKt/LufmyEULoTS81qIBeq9N7Uwju0heD+m1L3ipq0T3t5Mv5saigUgy9frQFef7ZkIyi6CkqwI8pZGj6WlOC8gvloj7hnHag203PrsuhZu6tZLpScgc79DJ1vLxg6olPvLAnnIJe44mIqtp0WvwXLo+FQjUljLKW176bOWlHZ0WA2YKPCOp3RG2ETzUSbTraPBdlDiaGZHQOjfV1X4sW5RYhxfhZZ9/v05olrlRT9omRMZVGAQac8jvvOkfVk+CWPxXTgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA3PR11MB7626.namprd11.prod.outlook.com (2603:10b6:806:307::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Mon, 23 Sep
 2024 15:53:59 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7982.022; Mon, 23 Sep 2024
 15:53:59 +0000
Date: Mon, 23 Sep 2024 15:52:02 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Take ref to job and job's fence in
 xe_sched_job_arm
Message-ID: <ZvGOoqCXGaaL8buw@DUT025-TGLU.fm.intel.com>
References: <20240921015605.2692906-1-matthew.brost@intel.com>
 <1ca1556c-3862-412b-b7b7-ed544004e58e@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1ca1556c-3862-412b-b7b7-ed544004e58e@intel.com>
X-ClientProxiedBy: SJ0PR03CA0265.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA3PR11MB7626:EE_
X-MS-Office365-Filtering-Correlation-Id: c70ad193-b20c-4312-da33-08dcdbe7efff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BaJvwCdTUn1MzxEye3zfEwIwGNLWGbcELptPDx1yXOVp+7VxiDf2liBtIF7W?=
 =?us-ascii?Q?q1jwlb7+6dVVGz4vPQmTZdK0sog8ZS1Fw9J68DzAYZUMGP1rgF7xxNpJlviA?=
 =?us-ascii?Q?pHfj/d9t8m+bQ9hSv3y7TMh2pwS1kerT4zglPJrw5oXO3WzSMMBifs2z6ZZX?=
 =?us-ascii?Q?zH+cazOlLHmEUL0eVL1+Oqw5Nglil5VDPaOMFMpYTgYWeXg1/a6EmSnMN6KP?=
 =?us-ascii?Q?tqyxPw3oXQ1PvWd/4Jd172qtG6aM/uG8ildOvLrfmMAh4NBDucBOrGsPUUTM?=
 =?us-ascii?Q?A7pHCYzonDA6xTyvgmBSdKqF3SsQ4nJ1eMr2fsXHZQydl3kKUpniIQfQ63CL?=
 =?us-ascii?Q?7k6g2jjzqbSIHogcX3gR552Z2882VxPaITJ+asmFf2k45YnS+lVe1NW4ebah?=
 =?us-ascii?Q?0J4IuUuFLqAWeCYOZ0a3enuCwIW6u0e/Hqq2r7rfPoxuLR8QqQGvt4sH0xEF?=
 =?us-ascii?Q?XI8H9121FiNG1Kf8cpy45m5TZ+3BFSruV3DXd9u7QLKgk+OAk5EjhUVq3dsf?=
 =?us-ascii?Q?pWz6Hn3IF1hTL5XyKSe6ztgJc7HbBDdsjoo5o3iQYINGsvqz3CNW5o1r7VgT?=
 =?us-ascii?Q?GJj/9aqdnRzUuGVbuauoqtaU9VyHeGZ+gB4Iku2OrwHo0MFCN3YQcMCZvY0X?=
 =?us-ascii?Q?/XD2lvyeL1ldW4o9Pqk3W0FYO6b3Ki/MReVcRpQr07NsRIl85TpqkIx1pzvM?=
 =?us-ascii?Q?kM6szFBdyFKd5YpciSBsaaz4b27a3o8vnl3nSykuUeacGiCUY1Yl9PpN3Cbo?=
 =?us-ascii?Q?1/r00IbaNCWCmRXPSLOjSRIYpWhFyigFN7GRJgMZvuAufeZtu7DijhsOI/ca?=
 =?us-ascii?Q?6CUU7LB4DRntfOcmi7sXEsfz5c6UYfK5N+xFHf5UYFQ2bo5htzZhXFnuaOjT?=
 =?us-ascii?Q?yAwuT9Y6s8IW8EHhb1vgziQ8zUXU6rVq2LiNuvOREITQQlDPFKQ2R+/rFBpw?=
 =?us-ascii?Q?PT0o6gLwgsZ/d8Jyt+ZDZrH6QhJldlj5t40EcZPUsc+KZB1qmh62vk0lzWP6?=
 =?us-ascii?Q?R/e8z5mGuTLIi6vupMyN6rzJUI8U82gZyLd9Biaxggl5MdxjkGNiBHzyO0Sz?=
 =?us-ascii?Q?ycL/wwbVwdd4vy7PS9vU1GPAMFc/sxEM7ej5JrVf2S8lq5RhvWA76ar/c8om?=
 =?us-ascii?Q?LcBPMAi2NOfklQUkdHCOQ1x7uy6/r2QQCejxkkIHx0w+cmcYKKcsEvX8TZ6j?=
 =?us-ascii?Q?PypkLQG6wuHso4HNEWQQu4stgq/Hovu9YCSCShUD/gIw2vQX38P46HClU6ST?=
 =?us-ascii?Q?do0WJBhE5bHtYaOOtWS52QLgoph4iwx4kXLBWGogWR4yyMNIlgmPpjQh8g0K?=
 =?us-ascii?Q?ERs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nOHQDG548whwAS8Jw0DT9GLVeV9rEvQhUFas/cW4gcTx3XnjFHVRJlRAQtFm?=
 =?us-ascii?Q?q/gIkAwjV99g8qF4bBDxAMH+kkunawXhA/shPRwRQKkejzP7/HcqSqObVU8b?=
 =?us-ascii?Q?SqnAoBKLB2flaEUcVMAR1jtEwYp35Vn9b549LdHZpGBM6TwBLdU/I3CeSx1O?=
 =?us-ascii?Q?Wrkw3AYYLwNEO9EbjAuODqfVfYk9TeYjOuIzmp+8/IBX/Hr6dGEEzi6D2nYU?=
 =?us-ascii?Q?t3ps9vmWW7A/lBE0JAurdTMuYzmznXsBsqQNdqII+kCQ9m88X/jTjx1LNg/7?=
 =?us-ascii?Q?NJbT/DFqK7WpQM7Z19Azan8urmjGzCUMFAstuoLZWuZoPKAesJRwmBKsAFJl?=
 =?us-ascii?Q?7LbhXdq1LVD3GP5JJBwv7doeYLOvKHotZOKjw57bcIZUZj2QQzGT4+ks5lxi?=
 =?us-ascii?Q?n0rUgyPLQ4mrvAZgy3d9+AgCbWieAHB6ldfL/QWpLj+Fai+VWQ6V0CT1m2Vm?=
 =?us-ascii?Q?EwBLnAO9nxjSVNMVOFl6Dt7ldBraeTcIskLVMEkvKcndWePdJ2ruvq7ZsDPu?=
 =?us-ascii?Q?wLx0bRAeCSiJIjh4wyJveabne04QEDz0CkBG5Ma7DJwGrg3Ob6bjNArU1480?=
 =?us-ascii?Q?OlGFm/adDNR81ybI8WUqIzkzZJYqsxarwWXzm1OxhpVPkvCP4nyEeEyvTElz?=
 =?us-ascii?Q?Yg63D8Xb5AxLJJBhKy2Bzz5nQSvoTCpZgA7MwCbIORJw6sV07c6a1kvJaXDl?=
 =?us-ascii?Q?UTLpGuARTI9tONJS+OtPPPt6uIirWxz0bXwrCpqxcM+5j6EuDOax7brbBAxZ?=
 =?us-ascii?Q?OzqTzW0M+X/BGrrtkDwcg6q6aa2omgB9UBDid/8bkhzA8ww3d7KPmki2TPwN?=
 =?us-ascii?Q?kcr7KAPt/9554Cum8N4OoKsjSALCMM5ofSeDm8GknJsoG93ASkBSBNBBoQwl?=
 =?us-ascii?Q?WI1hVmCSAyN2qyHVbt1oiBYJQvUzQvs4mewIwfyLoVplFqBQgAEC2oYXUsIm?=
 =?us-ascii?Q?HyG9SEW3S59Fld3hlm20NVpvzWfA1WZMx6A+Wy25tBmvUTf8YP4BqO7JuH0b?=
 =?us-ascii?Q?OUzoyMiUJY1MbWR8K5T3uje5xq8dCdB2en5JBMtbqEGZuJY4G+a+Q3XiHyQ2?=
 =?us-ascii?Q?aU1to++b/Sr1F/7Pk+neGjlTAP8+ny2chc1dszl7nnuokN1dUXXeXYSC8X5P?=
 =?us-ascii?Q?F0kBIh2TOjfDG3eUJXEB09TmNWln0eAw6KCpWkriMALi22zy5kOpmicVlZrv?=
 =?us-ascii?Q?2Yv9914Msgbxx3V45gLcSen1yGcVMCVNkPEqKA7xW+FUjldLC7BL/udBYt+d?=
 =?us-ascii?Q?NEw9wWb6WbqSQ9Z48JurZeOuS+VjoioJy5bcBhQPv+ZIwKxFLAAhvE+ZyR8U?=
 =?us-ascii?Q?CWi5NJiUBsq20xm5xH2sIbW1Jl6TWACTfP2aTtGKAkJnMqLQcEvro3BLMP/R?=
 =?us-ascii?Q?zkJrZlo89OTNs6kDXQ3OR3dtjU93QY4d3oF99oGfR7PTOcc69qoUqL7biY6S?=
 =?us-ascii?Q?SiTur3wQunXBBE8CJeQUx2c4FFtwcu53bZ8F/8+qeUUb2RgnrI2JngULSgfo?=
 =?us-ascii?Q?08NNZ2ZNZdDwxxKNqhxFBzJQbk64kcNnrcaNOEN4yNWZLSscGSSfJN5Sfu+a?=
 =?us-ascii?Q?giyJ0byA9QlDf6vn1NVNy7jMlRdTg0PVSHyjsLk7FF3uNxWu6DiRS2IMPtu+?=
 =?us-ascii?Q?nA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c70ad193-b20c-4312-da33-08dcdbe7efff
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2024 15:53:59.1768 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MRpTJaPDN92xNJ/7Jp67pLbpJ7DMqdkk1kiGHbJcfNs7O/NU1Nes9UsRPnfMT5NDAM3ZMFnaUHQtKDttQe8itQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7626
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

On Mon, Sep 23, 2024 at 11:39:38AM +0100, Matthew Auld wrote:
> On 21/09/2024 02:56, Matthew Brost wrote:
> > Fixes two possible races:
> > 
> > - Submission to hardware signals job's fence before dma_fence_get at end
> >    of run_job
> > - TDR fires and signals fence + free job before run_job completes
> > 
> > Taking refs in xe_sched_job_arm to job and job's fence solves these by
> > ensure all refs collected before entering the DRM scheduler. The refs
> > are dropped in run_job and DRM scheduler respectfully. Safe as once
> > xe_sched_job_arm is called execution of job through DRM sched is
> > guaranteed.
> > 
> > Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2811
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > Cc: <stable@vger.kernel.org> # v6.8+
> > ---
> >   drivers/gpu/drm/xe/xe_execlist.c        |  4 +++-
> >   drivers/gpu/drm/xe/xe_guc_submit.c      | 11 +++++++----
> >   drivers/gpu/drm/xe/xe_sched_job.c       |  5 ++---
> >   drivers/gpu/drm/xe/xe_sched_job_types.h |  1 -
> >   4 files changed, 12 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
> > index f3b71fe7a96d..b70706c9caf2 100644
> > --- a/drivers/gpu/drm/xe/xe_execlist.c
> > +++ b/drivers/gpu/drm/xe/xe_execlist.c
> > @@ -309,11 +309,13 @@ execlist_run_job(struct drm_sched_job *drm_job)
> >   	struct xe_sched_job *job = to_xe_sched_job(drm_job);
> >   	struct xe_exec_queue *q = job->q;
> >   	struct xe_execlist_exec_queue *exl = job->q->execlist;
> > +	struct dma_fence *fence = job->fence;
> >   	q->ring_ops->emit_job(job);
> >   	xe_execlist_make_active(exl);
> > +	xe_sched_job_put(job);
> > -	return dma_fence_get(job->fence);
> > +	return fence;
> >   }
> >   static void execlist_job_free(struct drm_sched_job *drm_job)
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index fbbe6a487bbb..689279fdef80 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -766,6 +766,7 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
> >   	struct xe_guc *guc = exec_queue_to_guc(q);
> >   	struct xe_device *xe = guc_to_xe(guc);
> >   	bool lr = xe_exec_queue_is_lr(q);
> > +	struct dma_fence *fence = NULL;
> >   	xe_assert(xe, !(exec_queue_destroyed(q) || exec_queue_pending_disable(q)) ||
> >   		  exec_queue_banned(q) || exec_queue_suspended(q));
> > @@ -782,12 +783,14 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
> >   	if (lr) {
> >   		xe_sched_job_set_error(job, -EOPNOTSUPP);
> > -		return NULL;
> > -	} else if (test_and_set_bit(JOB_FLAG_SUBMIT, &job->fence->flags)) {
> > -		return job->fence;
> > +		dma_fence_put(job->fence);	/* Drop ref from xe_sched_job_arm */
> 
> Not too sure about this, is it really safe to drop the JOB_FLAG_SUBMIT
> dance? Seems like queue_run_job can be called more than once for a given
> job, according to the comment for run_job in drm sched, in which case this
> will maybe hit UAF.
> 

Ugh, your right. run_job() can be called twice... I need to rethink
this a bit.

> >   	} else {
> > -		return dma_fence_get(job->fence);
> > +		fence = job->fence;
> >   	}
> > +
> > +	xe_sched_job_put(job);	/* Pairs with get from xe_sched_job_arm */
> 
> Why do we need a ref on the job itself? free_job() looks to drop its own
> ref, are we saying that free_job() can really be run before run_job()? I
> assume really bad stuff will happen if the refcount reaches zero inside
> run_job() here? Is that impossible?
> 

This snippet here in guc_exec_queue_timedout_job can run before run_job
completes.

1089         /*
1090          * TDR has fired before free job worker. Common if exec queue
1091          * immediately closed after last fence signaled.
1092          */
1093         if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &job->fence->flags)) {
1094                 guc_exec_queue_free_job(drm_job);
1095
1096                 return DRM_GPU_SCHED_STAT_NOMINAL;
1097         }

That is the source of the gitlab issue. Also if we ever decide to use
unordered work queue in the scheduler we'd have race there too. Take a
ref like this seems to be the safest possible way to do this.

> > +
> > +	return fence;
> >   }
> >   static void guc_exec_queue_free_job(struct drm_sched_job *drm_job)
> > diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
> > index eeccc1c318ae..d0f4b908411f 100644
> > --- a/drivers/gpu/drm/xe/xe_sched_job.c
> > +++ b/drivers/gpu/drm/xe/xe_sched_job.c
> > @@ -280,16 +280,15 @@ void xe_sched_job_arm(struct xe_sched_job *job)
> >   		fence = &chain->base;
> >   	}
> > -	job->fence = fence;
> > +	xe_sched_job_get(job);			/* Pairs with put in run_job */
> > +	job->fence = dma_fence_get(fence);	/* Pairs with put in scheduler */
> 
> So roughly the run_job() is always run at least once, if we get as far as
> the arm, even in the case where there is some kind of error? We no longer
> grab a ref in run_job() so this should balance out, assuming its run exactly
> once.
> 

It is always called at least once. Calling twice seems to be a problem.
I think this can only happen in GT reset flows so might need to take
another ref to fence / job there. I need to think this through.

Matt

> >   	drm_sched_job_arm(&job->drm);
> >   }
> >   void xe_sched_job_push(struct xe_sched_job *job)
> >   {
> > -	xe_sched_job_get(job);
> >   	trace_xe_sched_job_exec(job);
> >   	drm_sched_entity_push_job(&job->drm);
> > -	xe_sched_job_put(job);
> >   }
> >   /**
> > diff --git a/drivers/gpu/drm/xe/xe_sched_job_types.h b/drivers/gpu/drm/xe/xe_sched_job_types.h
> > index 0d3f76fb05ce..8ed95e1a378f 100644
> > --- a/drivers/gpu/drm/xe/xe_sched_job_types.h
> > +++ b/drivers/gpu/drm/xe/xe_sched_job_types.h
> > @@ -40,7 +40,6 @@ struct xe_sched_job {
> >   	 * @fence: dma fence to indicate completion. 1 way relationship - job
> >   	 * can safely reference fence, fence cannot safely reference job.
> >   	 */
> > -#define JOB_FLAG_SUBMIT		DMA_FENCE_FLAG_USER_BITS
> >   	struct dma_fence *fence;
> >   	/** @user_fence: write back value when BB is complete */
> >   	struct {
