Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFFFCD2CE12
	for <intel-xe@archiver.kernel.org>; Tue, 22 Oct 2024 17:59:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B611A10E6F6;
	Tue, 22 Oct 2024 17:59:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A5W3MdL2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C0E010E6F6
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Oct 2024 17:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729619974; x=1761155974;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=JONl+5n15/g9R6ZTReTPizsiQSdUdCXQ4xkD16Rqdfk=;
 b=A5W3MdL26UjdMZaj285TJtdoVLuhwSg+3DTKdBHnln8ulK63IY866k3W
 g1fWZsz6rO3iaA1yusKzgPM/VBqJLv+DoCbfmUj8x4lATR4AZ105kY4VX
 ble25vpN+GFMvRGbCLVAGyB2lopK7hGyWOneUhiWEmEH2H3xH/mj/n0OD
 asNB9G1S5lQRxSFEpQjewVXdPm9J3TCAQJIGN6zl5imQomNiHjLzKg/53
 jod5rBxJ89US87cbAFoqW/jXnPpyO63+1OSH3VoRoxYKkX+uWdh7zA8y3
 U0NNHkso8Zu5tL7RzlBZiE/pfYCS/UFtCorL4eqgTOLAoWlaKMISVvE07 g==;
X-CSE-ConnectionGUID: nsP3uso8TaqvGPlEl765zA==
X-CSE-MsgGUID: deCzZh+WS3et/LiaURVScw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40299541"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="40299541"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 10:59:34 -0700
X-CSE-ConnectionGUID: ZSbMdOvjQyq1Kcu627Aykg==
X-CSE-MsgGUID: gg6g5DxFR3yUU/0CtUHLdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; d="scan'208";a="103237297"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Oct 2024 10:59:33 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 22 Oct 2024 10:59:33 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 22 Oct 2024 10:59:33 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 22 Oct 2024 10:59:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PHHb3gDH1D+QENkIp39Rf6lG86HfStaX7WgIAnO5UtuJs9rzWtDsw9ilKt1T9vL+Yx4jQEGM4I8vHKgRJAebvX0dfbA9RTjylNKlYXtD3l232gzOZS0WiiRxQINhIhPGL7soM18u/Os8rJxsw3uuWh7GbiH1C3Y00fZSUdT0DNzuyomtbRBoITI/Ich5ytHUvOltbh+vIDaJfm03R9VpWOqpuk3+IPKBO6uoyHM9Dew1tNH9JgYl+VeoFi1n0PIrsUcllknAgHYw9/uOZWJtEa59rd9Q04DQATmus60hbyfSNcKEnruoEiRvOlY3mmz/SbW0welgjS7w/orstznfvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CuvtJ4pmCCuRb5QjtPfgvGq7IDHa6Ia8TuDcxDO9qPk=;
 b=nUmZ3gJw2+3HkX2yxcmEA/N+Z9s21tDJZefBnBJ/S+7tZBYMIUZ5FvGDZsAWylu+cVmvi1zkDKnO2fLB2l0rZGwWTt1IBJwelXX+vF/1q5A38pkufXEyVkpNx3s1XYv6wEO2cNodc3VwbP1Dsdb2vdDHH1Scvi+BQJgt9IdVnkTRz12iXjVdnCjthmRTIGfH1LfQ3uX2B8ELNET2pqUnQmyl3CSAdlnBJImGzVcql9jFw/T8aaWTAsfN8oABDCwPWPREEpfH35Yco21/FjbXqotm//OXl6FkpQq/rYi0/kZWFi9lWUX9yh/TyRz+tm9ugGZfmryv+W0s/A2B8Yz2pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB7537.namprd11.prod.outlook.com (2603:10b6:806:348::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Tue, 22 Oct
 2024 17:59:31 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8069.027; Tue, 22 Oct 2024
 17:59:30 +0000
Date: Tue, 22 Oct 2024 17:58:23 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Take ref to job's fence in arm
Message-ID: <Zxfnv0kWsFVjFkuw@DUT025-TGLU.fm.intel.com>
References: <20241021173512.1584248-1-matthew.brost@intel.com>
 <dfb85077-3822-4b08-a2ba-3c20b58a8384@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <dfb85077-3822-4b08-a2ba-3c20b58a8384@intel.com>
X-ClientProxiedBy: BYAPR06CA0057.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB7537:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ec8eff0-382e-4288-6c21-08dcf2c34736
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?AE8ta6IzW977orYax4yGZHduVIR5h46mWK4wxKrdcVkd+/fd8GqMcrrbd2nT?=
 =?us-ascii?Q?DJc/rJ1mTUpT5j4cI9fr71GZYmIVs7yyTePAH9xMjaci4BVNEQdaA6Pd7SyL?=
 =?us-ascii?Q?DYWqUubOqQucDjQ8bgekYYsX/o5C0DI46PEM+J4+VQ0r3+S8Hegz0bVC8Xo7?=
 =?us-ascii?Q?sFW/CU7q5uMKrVNreS+9hp6N/KRRcCQKKeJW4R/IgAoNpXiytUB2SaImY3tJ?=
 =?us-ascii?Q?8CbXSTXINvvLUNEwzMAjMqGkmrfCRqLgxsuqmUFR7dWIiveFTEFGIcEozxz4?=
 =?us-ascii?Q?ilDON27jK1mVs3hF06xCtJYbAyqI1wVI4rZnONTbD8qg7aBfKx1X1uoj8+QU?=
 =?us-ascii?Q?MtVZ5tjECqZbkt/8DXkdjSiyodChNHQVfCr7yWIawrMaYrJhPwOShWWqvz3I?=
 =?us-ascii?Q?I+VDOvPJQorxodTMNSYP91Xxq4jdNc2F7xIXF53Z7NMs7tXyeb0Lb/qPn3lZ?=
 =?us-ascii?Q?NDwx9Wz76JkwU1zPaZXatpVDDi/NxraIdQWQAG4644P7pDfw7JZm2LR8IdVD?=
 =?us-ascii?Q?0E6jTP84X8TQ2DSvJMC7ix4k/ZHmEKwJ1/LMbTEASkwba0B1z3GT0xmjBz5y?=
 =?us-ascii?Q?9ZMVRA0cjYlhnmNR6lg5aqne/svhZzg2Aqnt6UqoGqVLC2UanHsIsmmxRxLk?=
 =?us-ascii?Q?bjeI6Dj2wtEZ4URYBlSbJ1gZEjY6fQHwBY7lKOf4HDBC1sY/X2+TZ48nFJdj?=
 =?us-ascii?Q?iRDCpxo8zad4vipC2pPQJYVXUFLxwRVfmNmcxfPm1Cx/OYeTwekbtWJ6/Vhy?=
 =?us-ascii?Q?lYGTlWiqcHAn8BKdQVu5YEgY5y1b2KqvNZg9gmiqIR72ZdcXWjUYxR5IP72q?=
 =?us-ascii?Q?ncvYdS3bnMbhj/LjBCXiDIAqqWlLy+qzSsKVXGjRuyZsDHFBDs8oLkERAWnq?=
 =?us-ascii?Q?InxZGC3B52GoGLJAz0JesSEfkcJoGn3RDqj0BqvyUKJQJoBEO+8pTlVg7D4U?=
 =?us-ascii?Q?75LKYfEL1CMjSXQfSDhwcOnsBSqaDczdtv4vs2lymlXkag0pYjUV2QYFvLAY?=
 =?us-ascii?Q?4zU27I6LPKlw+Co8nlcMTIr17Wl4NEnXl/saX21ZvOumDhSE6AiPvkHYIGwr?=
 =?us-ascii?Q?fhCydBXu4wT/clS8pmsBoA4frfnL4PfVUyX2yuyzFoca7Ea0FLArSXp0rauU?=
 =?us-ascii?Q?+mqEyTwUEu5bPSTO8h2kqenQAphEvgwYq78fhPz+H8jrMgwF8bClaVG+doiR?=
 =?us-ascii?Q?0uOaRin+e256RDX3oh81MI7GBH7CCrlFMTVYoGNYRezJvVQ7Ys9G2jDjtusM?=
 =?us-ascii?Q?4onkp+Zgkw9tbuNDYEtY3g1wfG9Qc2tRCzdXufICW+HJqF73+8LRnXgikwG2?=
 =?us-ascii?Q?sJxGiDh56DFI9J8LD9iIpe+7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dzo4I/Jll8oSbv74yo3bhSzdCWvFYZ1N5yhuIdelv0YrWAaxei39GQspIdPz?=
 =?us-ascii?Q?Vw9Ta4rVE3S9Af0IGycHVhJz1+ZICDhcLPaeWGdIMIiHU6BEYtJDJOug7z46?=
 =?us-ascii?Q?GBrzpubZwEaSQit72fm6Pt/S7Eplmv41smtW+U+wyrichRilVjBcApVYtkZ1?=
 =?us-ascii?Q?dXC8FCt666X4wGYCtQ1azf6ssOH+x0HU0QayC0Gu8uhKkdht2islMYDhFr+T?=
 =?us-ascii?Q?KvFaCk3ha/pEPO7srrH9tMsDkiZtj28EiQwxO3GHNEjxnu05T9nAFPF+Ev7E?=
 =?us-ascii?Q?YOqu2HsPgP98eoO3s0bOT67pLqWTiTal0AlF9tSRmR2K2SDwJbL1j1PdGLRy?=
 =?us-ascii?Q?uB3SJMLA4b574jMq69IkzjQISKiMAFYEUy2oxw7pACraDqut105l+b9DbFHo?=
 =?us-ascii?Q?UlGivo0JtjYay+P8XxBNcZxijpjasMqL3x1qxaR7WFQwtV1rktOHPl8jWjd2?=
 =?us-ascii?Q?UeUZldWFIa7QGKjMoPXytDnhemIt19HZkcighWcC2CUyMWiz6aduemAaMhlZ?=
 =?us-ascii?Q?Fust2B6HwW/lEqYtkKe8akNllAa2Q/yNyqoL3TruSf0b82N1t7V6q2AMwpdF?=
 =?us-ascii?Q?gKqsa6xPt2D3DXf237+jDhSBFpv/VECCNyPG8/YcA3Jmny9lFlMr0vGt1iX4?=
 =?us-ascii?Q?6GKCVzDtVbpw9lfvUkGQ5amEFlql94OMGGJpoDrlTYIzFUruL29rkVpykjAM?=
 =?us-ascii?Q?c7NilokOCiox6lOaK+EJAK3cUjYIQPdkjtHEWTnoj7BNVnQaH5M+IzAzrf5e?=
 =?us-ascii?Q?rGCKmC94+H8BboTSXt2sMGAIUkMg20zrTKJXvkzz+mFqNpuw3cVJA8uGT7Tn?=
 =?us-ascii?Q?sxvQOTa3jIKQoHf25EMYivpKS/p/uWWxOb6d2aDZqYK5h9WlWqXYDlip27DY?=
 =?us-ascii?Q?BBj2/j4ZqTi979K+eLYkheWFc6FYcQVKZEPj+8D+cWBVzRSgkmt29a9XrRtQ?=
 =?us-ascii?Q?N3/zyDS2oOo4JPUNTHUgwKlDVqM8Ia4JZOi9FDJaQtWvWLQdImKLcclTUNlF?=
 =?us-ascii?Q?53iJBvV4TBnIeljlZON80/GgEXpFsnpnExMzXQe/i52HiqHZONx1TlG9fYHJ?=
 =?us-ascii?Q?n5Pz7osrjDtr7L/C/UQM+awO2dsi96oAzwCLni3RdIt+372DQSLw+PvdUdNm?=
 =?us-ascii?Q?Ibv/62wlX41yZNf8R3e9giUNEkVqKI3y2g51b8uwCSYcUtYE44iYVbt4llq7?=
 =?us-ascii?Q?SnkB1lC/mLAqtxXoOuRK9ipI8PgTzxgDIGb6WzOFtZGMzGwzoV3cOX76KUQd?=
 =?us-ascii?Q?X4itOjqCZieFkaiva/k/iU03htk+bziuD3KqCJj3eEFiVnXs+XYP//wJhWXG?=
 =?us-ascii?Q?Bgm2IuxT+Fxjc+bwgpsrdSesIlXBDd9ysNvTgnTXnQUnObjboHTs77SNqSf3?=
 =?us-ascii?Q?0SLPfvlj0wi1hL/a3SgX6EPVaZDs0DzGAJ+LzD+8xLRoZxgkZBQNXhq8N3uc?=
 =?us-ascii?Q?YNfxUnMtrjm2WQBoK3NmrkQ2L2iuxyK/v3uYU9JnXvNCxUHExiK8SX45sX9V?=
 =?us-ascii?Q?uCSs/5LDeHfx47sYEp0CaTV0JDy0FL2O6YQNZCkDscP3GGDyulsBOdxxHyMq?=
 =?us-ascii?Q?AQ99Bu52RJH0YBQSb7K1MKSq+jNZApxDttWBgVNgNM4mdNZ7b+boI/LZTIIj?=
 =?us-ascii?Q?TQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ec8eff0-382e-4288-6c21-08dcf2c34736
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2024 17:59:30.8417 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gBq3LDoEXgPG2J2pCG05BlqEn/W1izijIqqUNtNkc0rLuQHAu6GZJidbLigZ2xwuD34WXjzHkBrqV62YCc37GQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7537
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

On Tue, Oct 22, 2024 at 09:39:54AM +0100, Matthew Auld wrote:
> On 21/10/2024 18:35, Matthew Brost wrote:
> > Take ref to job's fence in arm rather than run job. This ref is owned by
> > the drm scheduler so it makes sense to take the ref before handing over
> > the job to the scheduler. Also removes an atomic from the run job path.
> > 
> > Suggested-by: Matthew Auld <matthew.auld@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_execlist.c        | 2 +-
> >   drivers/gpu/drm/xe/xe_guc_submit.c      | 9 +++++----
> >   drivers/gpu/drm/xe/xe_sched_job.c       | 2 +-
> >   drivers/gpu/drm/xe/xe_sched_job_types.h | 1 -
> >   4 files changed, 7 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
> > index f3b71fe7a96d..a8c416a48812 100644
> > --- a/drivers/gpu/drm/xe/xe_execlist.c
> > +++ b/drivers/gpu/drm/xe/xe_execlist.c
> > @@ -313,7 +313,7 @@ execlist_run_job(struct drm_sched_job *drm_job)
> >   	q->ring_ops->emit_job(job);
> >   	xe_execlist_make_active(exl);
> > -	return dma_fence_get(job->fence);
> > +	return job->fence;
> >   }
> >   static void execlist_job_free(struct drm_sched_job *drm_job)
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 0b81972ff651..25f51a947c3a 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -717,6 +717,7 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
> >   	struct xe_exec_queue *q = job->q;
> >   	struct xe_guc *guc = exec_queue_to_guc(q);
> >   	struct xe_device *xe = guc_to_xe(guc);
> > +	struct dma_fence *fence = NULL;
> >   	bool lr = xe_exec_queue_is_lr(q);
> >   	xe_assert(xe, !(exec_queue_destroyed(q) || exec_queue_pending_disable(q)) ||
> > @@ -734,12 +735,12 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
> >   	if (lr) {
> >   		xe_sched_job_set_error(job, -EOPNOTSUPP);
> > -		return NULL;
> > -	} else if (test_and_set_bit(JOB_FLAG_SUBMIT, &job->fence->flags)) {
> > -		return job->fence;
> > +		dma_fence_put(job->fence);	/* Drop ref from xe_sched_job_arm */
> 
> Just to confirm, with lr the run_job here is not going to be run more than
> once?
> 

LR mode - at most once as we return NULL run_job so job is immediately
signaled / removed from pending job list.

Non-LR mode - after a GT reset it is possible for a job to have run_job
called a second time. In this case, there is no 'dma_fence_put' in the
resubmit path which pairs with the 'dma_fence_get' in arm.

So I think this patch is correct.

Matt

> >   	} else {
> > -		return dma_fence_get(job->fence);
> > +		fence = job->fence;
> >   	}
> > +
> > +	return fence;
> >   }
> >   static void guc_exec_queue_free_job(struct drm_sched_job *drm_job)
> > diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
> > index eeccc1c318ae..1905ca590965 100644
> > --- a/drivers/gpu/drm/xe/xe_sched_job.c
> > +++ b/drivers/gpu/drm/xe/xe_sched_job.c
> > @@ -280,7 +280,7 @@ void xe_sched_job_arm(struct xe_sched_job *job)
> >   		fence = &chain->base;
> >   	}
> > -	job->fence = fence;
> > +	job->fence = dma_fence_get(fence);	/* Pairs with put in scheduler */
> >   	drm_sched_job_arm(&job->drm);
> >   }
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
