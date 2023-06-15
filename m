Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ABCAEB64D9
	for <intel-xe@archiver.kernel.org>; Thu, 15 Jun 2023 03:28:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D75DD10E178;
	Thu, 15 Jun 2023 03:28:09 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D272510E178
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Jun 2023 03:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686799688; x=1718335688;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=GTj1b/XKoaOn4k2/J3FoR755OkvwuBbgAh0xytiRv0Q=;
 b=TKiovzSl6YA0RyNlyPgdkLwYJWOb3Hocvt5jGfhEGMF5ar/eWyhvcL8L
 MBbCGecFSimVrWoCmV9RkbpwVbETy5O23z8X7mK59l03tJ5xGw1ouj9Vs
 41u/R1YoS0yRmuA1hYz2PylZ8z6qTOiVs0UWgauy3FxVJaG1BJcZncnZM
 T8vIZUntN+kAUxj30ihKzwJJmzCOSqYVgWOeYZEsGHTwf9aDpNefRyIdB
 JXqMNVE0oX2HXEhWTV/+PfiSJnZAPiD4V15pNGWQfU07YCOI6/APgWIwE
 Ioq9eH8XqMsIhV9XWKHNVMt7nhPjJkSj2RcEkdF4jr9Y6HsHeU0zSbz0+ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="348468794"
X-IronPort-AV: E=Sophos;i="6.00,243,1681196400"; d="scan'208";a="348468794"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2023 20:28:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="856768322"
X-IronPort-AV: E=Sophos;i="6.00,243,1681196400"; d="scan'208";a="856768322"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga001.fm.intel.com with ESMTP; 14 Jun 2023 20:28:07 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 14 Jun 2023 20:28:07 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 14 Jun 2023 20:28:06 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 14 Jun 2023 20:28:06 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 14 Jun 2023 20:28:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MnabgppZsFpZR7NEwLimSUWP4mjUsFiS//qtfxc8iPQ2tTBJrtS7swGg9PTTkUdJiGEvruqHrSow85vgFFDtPj2PeyjimG4fvtspuGCOQZvHi8Bi/HPCI4KfJ8tvcsrxWUa+A0LDyUmEPUdacewM4VRF6UGNNUgjz6Vm3cAdlc82SrgKdgvfCZzb+jKENMROM+ESvoeSIxPk3p1eHDA190FsKsWbb0jqZ+f+RkazAZZLowf4BZX/8RzOxeT9S+XfUbX/nFLWNBcVkkaeym6z8QomRPTxVrp28NTGrX7IZbA7O6WEdIbXpiFKpzrJV3aNvpbuhHm8muLMIdFSjYLX8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pVJXQSV0utzgxFDBwydEjYTy8vc6XfgkXfPrLyZsA2s=;
 b=GwdmclbLskb2cJpQkKmHNolbCSpNC0zKTBTUPd9LqBPE+E5wrUm6laJWHs9YLIq5HQ267R55F6JCI36lxB3rJWAyvys3JQckMLW9zS31kFkl8tp9ZkzsXv52xZlBMy/htCwvzVaGlzK4DC4ACgeWXmnmETGX3/BggBiKxpuENIkIyFN9SiyGRSH0qIZAZNUz0TCL8CO6njyedJz1vFCgY83+TigFLrMWyyWx56c4d1c/O2+t5yLWOba6i01tizL4SLUWTaqSaTWHkPFyvQ4/UXvgw1z5pZq6SrUZqozAPAYsniER2GDaGaFzbSQ3zHxepVP9nIoQJfOo0l1GhIdaKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB4792.namprd11.prod.outlook.com (2603:10b6:510:32::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.37; Thu, 15 Jun
 2023 03:28:04 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%5]) with mapi id 15.20.6477.037; Thu, 15 Jun 2023
 03:28:04 +0000
Date: Thu, 15 Jun 2023 03:27:10 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <ZIqFDmhtaCsHjqvb@DUT025-TGLU.fm.intel.com>
References: <20230607160334.4111289-1-matthew.brost@intel.com>
 <20230607160334.4111289-3-matthew.brost@intel.com>
 <3836086b-5741-ec7f-b51a-e3ee7330cb9d@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3836086b-5741-ec7f-b51a-e3ee7330cb9d@linux.intel.com>
X-ClientProxiedBy: SJ0PR05CA0090.namprd05.prod.outlook.com
 (2603:10b6:a03:332::35) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB4792:EE_
X-MS-Office365-Filtering-Correlation-Id: c7943e75-d7e4-4675-3f8e-08db6d508735
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Uf6OmdFc8UxkZjMMmuUByhmRveo62P9IMzZFo3m6VgGwx7gA0M8jWpivFH4hnOXiV54x2b+D2DCkQ0znthJ6pAenyaKf3N0+s7iPHWhIb8ZGFzhC06Yy0sLQ9/SBBEhx5Q8p3VdojufZZa9QJHU3dudcfCeIycs4Zd6t1uEzcHi9AotGfevUfaLR86QH4xsqpNxNcfyd1nKYCuoEpjZntpCcdKVQaSeJXJzgRZU+1C7ITq99YvCAupFFebyX4aS54AqkU3sXExxTkxtBw0hz01ZSPDdwYAzOj53cpbWICQ2peJPDLgFTF5xSbe1q7J57FvOaCNQwGVTve6TT4DbvvdciQXUgz0FNrv/NA6YChBVAC3hGpTxtXyB186C02nBWDy9ovDraNwCAE4Sx+LQ03+QmO2cxtwzg4Llu1QUsyKsauMz7vT//FCyQhZDECy1shOsTt3YFiviDKgknPBIiW7lmBSHE27YPGRMlcg4rC1rbz1h3ziOsiHliO3NtPbW7adRYr/t1bdoIHTnOtimmGSpn78/Ntm87EhhyKNXYSeCQpfcz8Iz/Qb15wPpuVYEV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(376002)(136003)(396003)(366004)(39860400002)(451199021)(44832011)(8936002)(8676002)(5660300002)(316002)(4326008)(6916009)(66946007)(66556008)(66476007)(41300700001)(38100700002)(82960400001)(30864003)(2906002)(53546011)(6506007)(26005)(6512007)(6666004)(186003)(86362001)(6486002)(83380400001)(478600001)(66574015);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?DpJsUuhidFVHS+8vMQ9/Co6K3TuyblIyWAVrcylewSVYMEODrenhuzD2rm?=
 =?iso-8859-1?Q?0VlXjPu/N9FgHdPrS6RIywEMZ2bEe+urXPcyW90rDE0CRsb3pT0KWFHKZm?=
 =?iso-8859-1?Q?ImAY8/kBUb5dKaBveVmPtA8CL3rJP/DRyRvy6u1+MMyG84BMsq3gzCrIdn?=
 =?iso-8859-1?Q?QQO6R56AeS+kvAXEMxIG77HpYMaZDEPfBABLqZye6agBXSdey7o/x8Lh5q?=
 =?iso-8859-1?Q?dRMTEIuCZHPLuWxQuZL6OyRGxMrzFVfyOYH7gEtQ9EltjbwOTrEMFmMMNN?=
 =?iso-8859-1?Q?K4CkukzTE5Me1HqG3AU5CJY5SR2MqjyAeCmyQ4Ph2a21y02RgXafpzqQdM?=
 =?iso-8859-1?Q?I+bjO/BOUmbGggk0jaOitX4vhGVnjvfSnx3lgHbcg0Cn6I6a0AwuTB0DSu?=
 =?iso-8859-1?Q?Ty4gZVqzzfVjUOxeeiTqVmep2IS7G08weR62DHVPgTSdAFDLSQ1aki1eO7?=
 =?iso-8859-1?Q?dKns6UwgcB1hnGcXXuMMXaAmvz1jK6vwuzKZPB5l7lGFsw6wls6LINaly0?=
 =?iso-8859-1?Q?Venf/PfroxQX4sq4k72bMqlLSAlv5MQHU9zOgns7OaMuRaM8r22CQd2q8I?=
 =?iso-8859-1?Q?HKn0SIc5MgLZO4bU3a0biPB9JZj21657nptvPNxnRcfoezw7r6ZXXJDbv8?=
 =?iso-8859-1?Q?WxGR1rlitSlWa9DzhcN9F63mhzHPgoF96+Lyq8hDXaUQfbp1Fszq0gvgI0?=
 =?iso-8859-1?Q?slNyjvWq8RhUE2Vq+XDR30nr3vTQtAy/yqdcCAFjsFiGUJ1jkONWNEO7VR?=
 =?iso-8859-1?Q?XclnpuWqU75J5KOurQHwQ8FHSkcNLQ/WL0XlHjrYEwBqXq/kG4yZP8jUZH?=
 =?iso-8859-1?Q?Rx61llU/prvmW2A97TxUtomCj/wBNTWh7dBHG3R+EWFlIHyV3NotJ/Alcx?=
 =?iso-8859-1?Q?T4lPT+/aUXbQs4qW7419Mym76dW1CESh3J4Qi0U3xfVwn2q43YBiROoXez?=
 =?iso-8859-1?Q?zpCyzeMcM0AYs6SU5emBBlZjfYcMeAZUXWj0yn2wtLjTtTeJ2E/FKWLGln?=
 =?iso-8859-1?Q?mVk6xi8JfClONlRIRGdC8FMGiNle6fh8e/GmEZ/ET4x0vURaBmU0T0ElhL?=
 =?iso-8859-1?Q?TBacrARIcTC2t0vayaxCzPD9P2xlsbhS/4gLqeRzFxS/X8N/M2BA2WZ8Nq?=
 =?iso-8859-1?Q?PewqsFK2zV4SM7o7GZhBtj/qIWUj3J5xWUupeimg9g3m/2HYzMcadvwphO?=
 =?iso-8859-1?Q?Yn/TBtnZdYT/z3vpgv4O2qXqYZrkCofXnMalOrX5YZT2/aZY8nvJS62AxB?=
 =?iso-8859-1?Q?CD2vmU90/waS9yCZwmEUt7Ys80exipKlC+qzuCv6GRDrufIRezc6TW2o7E?=
 =?iso-8859-1?Q?LYdzxB43ojRa8LQYQaccCltcxVH81PkukYP8cmqAS5tiMQ/fzU1b0dMvG6?=
 =?iso-8859-1?Q?WmqqfxxdNn7x41BiF0MxdwEL7Yy82w3wWuYb4AyI67n3rhIHcm/DndU/oV?=
 =?iso-8859-1?Q?sh27ObgDTQUg9AgbpnJjVh+5YTLsQ/w1485qtoHSBxJLIl+LEDnGx7A0tM?=
 =?iso-8859-1?Q?XOdXRxegejkYKQjY9yzWM/3/QWwfhrIFj1KVDsnvbUf7Lz9Gun/5riyL4w?=
 =?iso-8859-1?Q?5l91+M1hYWaAZSInsN6u6AWMujosW7sXef8b2spkWatpfqUjHB4sXIXE4P?=
 =?iso-8859-1?Q?WWIyWFy4Pi85lQOcLwm2sqhQIslVHGl1A0e9SohxlNHSNMXFnx98p+pg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c7943e75-d7e4-4675-3f8e-08db6d508735
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2023 03:28:03.8709 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8xn0KchcGKQdqWSMUNfRS/g1kpYSP+ReUhFqxu2tTs2PR6i4eYQpVdrlOEOV2uYYtv3hdnO3anvJmscvRx85rQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4792
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 2/8] drm/sched: Move schedule policy to
 scheduler
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

On Wed, Jun 14, 2023 at 10:34:35AM +0200, Thomas Hellström wrote:
> 
> On 6/7/23 18:03, Matthew Brost wrote:
> > Rather than a global modparam for scheduling policy, move the scheduling
> > policy to scheduler so driver can control each scheduler policy. This is
> > required as it is possible in certain drivers certain scheduling polices
> > are not allow, thus the driver must set the policy rather than the
> s/allow/allowed/

Will fix.

> > modparam.
> > 
> > v2 (Thomas): Better commit message, s/scdedule/schedule/, remove extra
> > brackets
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  1 +
> >   drivers/gpu/drm/etnaviv/etnaviv_sched.c    |  3 ++-
> >   drivers/gpu/drm/lima/lima_sched.c          |  3 ++-
> >   drivers/gpu/drm/msm/msm_ringbuffer.c       |  2 +-
> >   drivers/gpu/drm/panfrost/panfrost_job.c    |  3 ++-
> >   drivers/gpu/drm/scheduler/sched_entity.c   | 24 ++++++++++++++++++----
> >   drivers/gpu/drm/scheduler/sched_main.c     | 21 ++++++++++++++-----
> >   drivers/gpu/drm/v3d/v3d_sched.c            | 15 +++++++++-----
> >   drivers/gpu/drm/xe/xe_execlist.c           |  2 +-
> >   drivers/gpu/drm/xe/xe_guc_submit.c         |  3 ++-
> >   include/drm/gpu_scheduler.h                | 20 ++++++++++++------
> >   11 files changed, 71 insertions(+), 26 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > index 2e776ece4251..75ab8b9c7b25 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > @@ -2368,6 +2368,7 @@ static int amdgpu_device_init_schedulers(struct amdgpu_device *adev)
> >   				   ring->num_hw_submission, 0,
> >   				   timeout, adev->reset_domain->wq,
> >   				   ring->sched_score, ring->name,
> > +				   DRM_SCHED_POLICY_DEFAULT,
> >   				   adev->dev);
> >   		if (r) {
> >   			DRM_ERROR("Failed to create scheduler on ring %s.\n",
> > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> > index 8486a2923f1b..61204a3f8b0b 100644
> > --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> > +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> > @@ -136,7 +136,8 @@ int etnaviv_sched_init(struct etnaviv_gpu *gpu)
> >   	ret = drm_sched_init(&gpu->sched, &etnaviv_sched_ops, NULL,
> >   			     etnaviv_hw_jobs_limit, etnaviv_job_hang_limit,
> >   			     msecs_to_jiffies(500), NULL, NULL,
> > -			     dev_name(gpu->dev), gpu->dev);
> > +			     dev_name(gpu->dev), DRM_SCHED_POLICY_DEFAULT,
> > +			     gpu->dev);
> >   	if (ret)
> >   		return ret;
> > diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
> > index 54f53bece27c..33042ba6ae93 100644
> > --- a/drivers/gpu/drm/lima/lima_sched.c
> > +++ b/drivers/gpu/drm/lima/lima_sched.c
> > @@ -491,7 +491,8 @@ int lima_sched_pipe_init(struct lima_sched_pipe *pipe, const char *name)
> >   	return drm_sched_init(&pipe->base, &lima_sched_ops, NULL, 1,
> >   			      lima_job_hang_limit,
> >   			      msecs_to_jiffies(timeout), NULL,
> > -			      NULL, name, pipe->ldev->dev);
> > +			      NULL, name, DRM_SCHED_POLICY_DEFAULT,
> > +			      pipe->ldev->dev);
> >   }
> >   void lima_sched_pipe_fini(struct lima_sched_pipe *pipe)
> > diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
> > index e1cff31f147a..0d1e7a4414e8 100644
> > --- a/drivers/gpu/drm/msm/msm_ringbuffer.c
> > +++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
> > @@ -96,7 +96,7 @@ struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu, int id,
> >   	ret = drm_sched_init(&ring->sched, &msm_sched_ops, NULL,
> >   			     num_hw_submissions, 0, sched_timeout,
> >   			     NULL, NULL, to_msm_bo(ring->bo)->name,
> > -			     gpu->dev->dev);
> > +			     DRM_SCHED_POLICY_DEFAULT, gpu->dev->dev);
> >   	if (ret) {
> >   		goto fail;
> >   	}
> > diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> > index f48b07056a16..effa48b33dce 100644
> > --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> > +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> > @@ -819,7 +819,8 @@ int panfrost_job_init(struct panfrost_device *pfdev)
> >   				     nentries, 0,
> >   				     msecs_to_jiffies(JOB_TIMEOUT_MS),
> >   				     pfdev->reset.wq,
> > -				     NULL, "pan_js", pfdev->dev);
> > +				     NULL, "pan_js", DRM_SCHED_POLICY_DEFAULT,
> > +				     pfdev->dev);
> >   		if (ret) {
> >   			dev_err(pfdev->dev, "Failed to create scheduler: %d.", ret);
> >   			goto err_sched;
> > diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> > index cfb433e92005..e1838e328de8 100644
> > --- a/drivers/gpu/drm/scheduler/sched_entity.c
> > +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> > @@ -33,6 +33,20 @@
> >   #define to_drm_sched_job(sched_job)		\
> >   		container_of((sched_job), struct drm_sched_job, queue_node)
> > +static bool bad_policies(struct drm_gpu_scheduler **sched_list,
> > +			 unsigned int num_sched_list)
> > +{
> > +	enum drm_sched_policy sched_policy = sched_list[0]->sched_policy;
> > +	unsigned int i;
> > +
> > +	/* All schedule policies must match */
> > +	for (i = 1; i < num_sched_list; ++i)
> > +		if (sched_policy != sched_list[i]->sched_policy)
> > +			return true;
> > +
> > +	return false;
> > +}
> > +
> >   /**
> >    * drm_sched_entity_init - Init a context entity used by scheduler when
> >    * submit to HW ring.
> > @@ -62,7 +76,8 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
> >   			  unsigned int num_sched_list,
> >   			  atomic_t *guilty)
> >   {
> > -	if (!(entity && sched_list && (num_sched_list == 0 || sched_list[0])))
> > +	if (!(entity && sched_list && (num_sched_list == 0 || sched_list[0])) ||
> > +	    bad_policies(sched_list, num_sched_list))
> >   		return -EINVAL;
> >   	memset(entity, 0, sizeof(struct drm_sched_entity));
> > @@ -461,7 +476,7 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
> >   	 * Update the entity's location in the min heap according to
> >   	 * the timestamp of the next job, if any.
> >   	 */
> > -	if (drm_sched_policy == DRM_SCHED_POLICY_FIFO) {
> > +	if (entity->rq->sched->sched_policy == DRM_SCHED_POLICY_FIFO) {
> >   		struct drm_sched_job *next;
> >   		next = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
> > @@ -533,7 +548,8 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
> >   void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
> >   {
> >   	struct drm_sched_entity *entity = sched_job->entity;
> > -	bool first;
> > +	bool first, fifo = entity->rq->sched->sched_policy ==
> > +		DRM_SCHED_POLICY_FIFO;
> >   	ktime_t submit_ts;
> >   	trace_drm_sched_job(sched_job, entity);
> > @@ -562,7 +578,7 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
> >   		drm_sched_rq_add_entity(entity->rq, entity);
> >   		spin_unlock(&entity->rq_lock);
> > -		if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
> > +		if (fifo)
> >   			drm_sched_rq_update_fifo(entity, submit_ts);
> >   		drm_sched_wakeup(entity->rq->sched);
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> > index 6bc29d509161..ead122e99d00 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -66,14 +66,14 @@
> >   #define to_drm_sched_job(sched_job)		\
> >   		container_of((sched_job), struct drm_sched_job, queue_node)
> > -int drm_sched_policy = DRM_SCHED_POLICY_FIFO;
> > +int default_drm_sched_policy = DRM_SCHED_POLICY_FIFO;
> >   /**
> >    * DOC: sched_policy (int)
> >    * Used to override default entities scheduling policy in a run queue.
> >    */
> >   MODULE_PARM_DESC(sched_policy, "Specify the scheduling policy for entities on a run-queue, " __stringify(DRM_SCHED_POLICY_RR) " = Round Robin, " __stringify(DRM_SCHED_POLICY_FIFO) " = FIFO (default).");
> Does the description above need updating to "Specify the default
> scheduling..."?

Yep, will update.

Matt

> > -module_param_named(sched_policy, drm_sched_policy, int, 0444);
> > +module_param_named(sched_policy, default_drm_sched_policy, int, 0444);
> >   static __always_inline bool drm_sched_entity_compare_before(struct rb_node *a,
> >   							    const struct rb_node *b)
> > @@ -177,7 +177,7 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
> >   	if (rq->current_entity == entity)
> >   		rq->current_entity = NULL;
> > -	if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
> > +	if (rq->sched->sched_policy == DRM_SCHED_POLICY_FIFO)
> >   		drm_sched_rq_remove_fifo_locked(entity);
> >   	spin_unlock(&rq->lock);
> > @@ -961,7 +961,7 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
> >   	/* Kernel run queue has higher priority than normal run queue*/
> >   	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
> > -		entity = drm_sched_policy == DRM_SCHED_POLICY_FIFO ?
> > +		entity = sched->sched_policy == DRM_SCHED_POLICY_FIFO ?
> >   			drm_sched_rq_select_entity_fifo(&sched->sched_rq[i]) :
> >   			drm_sched_rq_select_entity_rr(&sched->sched_rq[i]);
> >   		if (entity)
> > @@ -1186,6 +1186,7 @@ static void drm_sched_main(struct work_struct *w)
> >    *		used
> >    * @score: optional score atomic shared with other schedulers
> >    * @name: name used for debugging
> > + * @sched_policy: schedule policy
> >    * @dev: target &struct device
> >    *
> >    * Return 0 on success, otherwise error code.
> > @@ -1195,9 +1196,15 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
> >   		   struct workqueue_struct *run_wq,
> >   		   unsigned hw_submission, unsigned hang_limit,
> >   		   long timeout, struct workqueue_struct *timeout_wq,
> > -		   atomic_t *score, const char *name, struct device *dev)
> > +		   atomic_t *score, const char *name,
> > +		   enum drm_sched_policy sched_policy,
> > +		   struct device *dev)
> >   {
> >   	int i;
> > +
> > +	if (sched_policy >= DRM_SCHED_POLICY_COUNT)
> > +		return -EINVAL;
> > +
> >   	sched->ops = ops;
> >   	sched->hw_submission_limit = hw_submission;
> >   	sched->name = name;
> > @@ -1207,6 +1214,10 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
> >   	sched->hang_limit = hang_limit;
> >   	sched->score = score ? score : &sched->_score;
> >   	sched->dev = dev;
> > +	if (sched_policy == DRM_SCHED_POLICY_DEFAULT)
> > +		sched->sched_policy = default_drm_sched_policy;
> > +	else
> > +		sched->sched_policy = sched_policy;
> >   	for (i = DRM_SCHED_PRIORITY_MIN; i < DRM_SCHED_PRIORITY_COUNT; i++)
> >   		drm_sched_rq_init(sched, &sched->sched_rq[i]);
> > diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
> > index 38e092ea41e6..5e3fe77fa991 100644
> > --- a/drivers/gpu/drm/v3d/v3d_sched.c
> > +++ b/drivers/gpu/drm/v3d/v3d_sched.c
> > @@ -391,7 +391,8 @@ v3d_sched_init(struct v3d_dev *v3d)
> >   			     &v3d_bin_sched_ops, NULL,
> >   			     hw_jobs_limit, job_hang_limit,
> >   			     msecs_to_jiffies(hang_limit_ms), NULL,
> > -			     NULL, "v3d_bin", v3d->drm.dev);
> > +			     NULL, "v3d_bin", DRM_SCHED_POLICY_DEFAULT,
> > +			     v3d->drm.dev);
> >   	if (ret)
> >   		return ret;
> > @@ -399,7 +400,8 @@ v3d_sched_init(struct v3d_dev *v3d)
> >   			     &v3d_render_sched_ops, NULL,
> >   			     hw_jobs_limit, job_hang_limit,
> >   			     msecs_to_jiffies(hang_limit_ms), NULL,
> > -			     NULL, "v3d_render", v3d->drm.dev);
> > +			     ULL, "v3d_render", DRM_SCHED_POLICY_DEFAULT,
> > +			     v3d->drm.dev);
> >   	if (ret)
> >   		goto fail;
> > @@ -407,7 +409,8 @@ v3d_sched_init(struct v3d_dev *v3d)
> >   			     &v3d_tfu_sched_ops, NULL,
> >   			     hw_jobs_limit, job_hang_limit,
> >   			     msecs_to_jiffies(hang_limit_ms), NULL,
> > -			     NULL, "v3d_tfu", v3d->drm.dev);
> > +			     NULL, "v3d_tfu", DRM_SCHED_POLICY_DEFAULT,
> > +			     v3d->drm.dev);
> >   	if (ret)
> >   		goto fail;
> > @@ -416,7 +419,8 @@ v3d_sched_init(struct v3d_dev *v3d)
> >   				     &v3d_csd_sched_ops, NULL,
> >   				     hw_jobs_limit, job_hang_limit,
> >   				     msecs_to_jiffies(hang_limit_ms), NULL,
> > -				     NULL, "v3d_csd", v3d->drm.dev);
> > +				     NULL, "v3d_csd", DRM_SCHED_POLICY_DEFAULT,
> > +				     v3d->drm.dev);
> >   		if (ret)
> >   			goto fail;
> > @@ -424,7 +428,8 @@ v3d_sched_init(struct v3d_dev *v3d)
> >   				     &v3d_cache_clean_sched_ops, NULL,
> >   				     hw_jobs_limit, job_hang_limit,
> >   				     msecs_to_jiffies(hang_limit_ms), NULL,
> > -				     NULL, "v3d_cache_clean", v3d->drm.dev);
> > +				     NULL, "v3d_cache_clean",
> > +				     DRM_SCHED_POLICY_DEFAULT, v3d->drm.dev);
> >   		if (ret)
> >   			goto fail;
> >   	}
> > diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
> > index f0eb8bb277ce..944dad79a037 100644
> > --- a/drivers/gpu/drm/xe/xe_execlist.c
> > +++ b/drivers/gpu/drm/xe/xe_execlist.c
> > @@ -339,7 +339,7 @@ static int execlist_engine_init(struct xe_engine *e)
> >   	err = drm_sched_init(&exl->sched, &drm_sched_ops, NULL,
> >   			     e->lrc[0].ring.size / MAX_JOB_SIZE_BYTES,
> >   			     XE_SCHED_HANG_LIMIT, XE_SCHED_JOB_TIMEOUT,
> > -			     NULL, NULL, e->hwe->name,
> > +			     NULL, NULL, e->hwe->name, DRM_SCHED_POLICY_DEFAULT,
> >   			     gt_to_xe(e->gt)->drm.dev);
> >   	if (err)
> >   		goto err_free;
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 5c9a6866bd3d..c147b17690dd 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -1067,7 +1067,8 @@ static int guc_engine_init(struct xe_engine *e)
> >   	err = drm_sched_init(&ge->sched, &drm_sched_ops, NULL,
> >   			     e->lrc[0].ring.size / MAX_JOB_SIZE_BYTES,
> >   			     64, timeout, guc_to_gt(guc)->ordered_wq, NULL,
> > -			     e->name, gt_to_xe(e->gt)->drm.dev);
> > +			     e->name, DRM_SCHED_POLICY_DEFAULT,
> > +			     gt_to_xe(e->gt)->drm.dev);
> >   	if (err)
> >   		goto err_free;
> > diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> > index 419c0446edd7..929d0d567a0b 100644
> > --- a/include/drm/gpu_scheduler.h
> > +++ b/include/drm/gpu_scheduler.h
> > @@ -72,11 +72,15 @@ enum drm_sched_priority {
> >   	DRM_SCHED_PRIORITY_UNSET = -2
> >   };
> > -/* Used to chose between FIFO and RR jobs scheduling */
> > -extern int drm_sched_policy;
> > -
> > -#define DRM_SCHED_POLICY_RR    0
> > -#define DRM_SCHED_POLICY_FIFO  1
> > +/* Used to chose default scheduling policy*/
> > +extern int default_drm_sched_policy;
> > +
> > +enum drm_sched_policy {
> > +	DRM_SCHED_POLICY_DEFAULT,
> > +	DRM_SCHED_POLICY_RR,
> > +	DRM_SCHED_POLICY_FIFO,
> > +	DRM_SCHED_POLICY_COUNT,
> > +};
> >   /**
> >    * struct drm_sched_entity - A wrapper around a job queue (typically
> > @@ -513,6 +517,7 @@ struct drm_sched_backend_ops {
> >    *              guilty and it will no longer be considered for scheduling.
> >    * @score: score to help loadbalancer pick a idle sched
> >    * @_score: score used when the driver doesn't provide one
> > + * @sched_policy: Schedule policy for scheduler
> >    * @ready: marks if the underlying HW is ready to work
> >    * @free_guilty: A hit to time out handler to free the guilty job.
> >    * @pause_run_wq: pause queuing of @work_run on @run_wq
> > @@ -539,6 +544,7 @@ struct drm_gpu_scheduler {
> >   	int				hang_limit;
> >   	atomic_t                        *score;
> >   	atomic_t                        _score;
> > +	enum drm_sched_policy		sched_policy;
> >   	bool				ready;
> >   	bool				free_guilty;
> >   	bool				pause_run_wq;
> > @@ -550,7 +556,9 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
> >   		   struct workqueue_struct *run_wq,
> >   		   uint32_t hw_submission, unsigned hang_limit,
> >   		   long timeout, struct workqueue_struct *timeout_wq,
> > -		   atomic_t *score, const char *name, struct device *dev);
> > +		   atomic_t *score, const char *name,
> > +		   enum drm_sched_policy sched_policy,
> > +		   struct device *dev);
> >   void drm_sched_fini(struct drm_gpu_scheduler *sched);
> >   int drm_sched_job_init(struct drm_sched_job *job,
