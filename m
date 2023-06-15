Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F640EB64D9
	for <intel-xe@archiver.kernel.org>; Thu, 15 Jun 2023 03:23:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40DE710E178;
	Thu, 15 Jun 2023 03:23:55 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C782810E178
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Jun 2023 03:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686799433; x=1718335433;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=MS+Fw2/jpXnKqg91UyJDTGQqyhdDExsRebzY6Jb8FuE=;
 b=i24pXV6ht1iCe4yiXCJnbyGNn1GcSizD8hRUqthG3ZxJk3NkhjbzUfi+
 VqrB67O2Ou2ZFb3c6HbBOT4puhrKFKOfLSQET2US3wv3nfNDY+XPNsmKD
 j5VtwU6zjLiKYPuDl7BGuEb+yezS2xKBnSmsdDEyALimL5ZgAgCq92tza
 Eh9tB3JvirBvUSjLocA3p6voOcXRIyZ6VTGh2JY5K268+4maXvI6iOw8s
 KfanAqXns4MhpnFV/dCYiFdVrAKomapBKpALVR8RK/fErtszEsessy5U5
 EwwJ9hxOpkzYQJsMWQYYKyEihlsqYYkSTETv67oytcS2kGH0uTjOitFW6 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="422406840"
X-IronPort-AV: E=Sophos;i="6.00,243,1681196400"; d="scan'208";a="422406840"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2023 20:23:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="836471745"
X-IronPort-AV: E=Sophos;i="6.00,243,1681196400"; d="scan'208";a="836471745"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga004.jf.intel.com with ESMTP; 14 Jun 2023 20:23:52 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 14 Jun 2023 20:23:51 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 14 Jun 2023 20:23:51 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 14 Jun 2023 20:23:51 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.43) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 14 Jun 2023 20:23:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WT9PMt/7gqlIEzBc1Va21C1bjSsTMEvkDPjM0JpAwzppnm8EZ4FFhoWTRKYc5tO/egF0meKGO0QjKN8d/grRwZ3j2CQE+xyxvahJZMrOA+XcUTKx55KAOWYxd/WvxrEnaO3+H0FXXtuwDjpH0Cn8mQZUV2MB8LPkb1Hd+Ytq1KC/xOMzvofT73hFwh9/8oXHKmDz9mR0THL9LvnAWE+xUiXs+hNYkUzb4zFpSESx6NSC40XxZ3d95dzitBEJ3MZIrQw9f09Bt38jLQ0CrZnMd0qiqxgwh9gMVEfoeE/GlMi4D/gY4RQl+HmcYcqMJm90LzEoJPniTyUq74eRswuJIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IyQ+BLZnBYSviuJfLPYHVMJZ9ZQFuuu5OmGbjeKSkg4=;
 b=KrtuLIYYMNPKWzcLMEl74LXvZGMkNRbbfg4GfjtUTqBpln/NCaitoYeFqqt9aw1KFWojCrfaW19ZiNouPg6GsSwxPsuGim5dij/rBK5kqaK1I5bnDUReXrYpDgq80ICM1QjPW/iczDuaxsMXOt18mRUhXVpZ5Pa8v5dn3btMe762Z1U+Oy4cU4mQzWU8+cMF5rddqtcOOSvra5SXrv6uNjTwvachyamjOVM5pgdeNvt3v6rrmWKi19Xwtkc28BjVG+LK2/wjuAZFElHy02dfdwjD9qQvO6Kc4qCcHJSnKiRgaEHp0IkRXOhLqTysUhTSTAC4YOW4WpXDbR2/4nSQEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB5309.namprd11.prod.outlook.com (2603:10b6:5:390::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.37; Thu, 15 Jun
 2023 03:23:42 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%5]) with mapi id 15.20.6477.037; Thu, 15 Jun 2023
 03:23:42 +0000
Date: Thu, 15 Jun 2023 03:22:48 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <ZIqECJNEhQImmzf3@DUT025-TGLU.fm.intel.com>
References: <20230607160334.4111289-1-matthew.brost@intel.com>
 <20230607160334.4111289-6-matthew.brost@intel.com>
 <af97d044-c21e-3a04-8ef7-ef2a79dfef15@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <af97d044-c21e-3a04-8ef7-ef2a79dfef15@linux.intel.com>
X-ClientProxiedBy: BYAPR01CA0002.prod.exchangelabs.com (2603:10b6:a02:80::15)
 To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB5309:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ce841d0-3eab-430d-dea6-08db6d4feb12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /qyusYvFtYUcjHWUhiKucLHsBREkqoeR9o239hoLhOVUupf12oo8ut4kxoSPzF3e+TtwXuc9gUM11oDn6J7E7yP8jKWKZTINsEq+8IOwETZCiNhhz7TpN4nAtbDNcO6iyuPiW0q3aVgCckwxXvqcn0SVnQ8fe8LaHz3G9Re4K5XI/Yzx980FuyUd92L/9eSGWGRkAd9umQKCVDaymvflzW76ZNzdF/mZ5Ao3DwdcEcRA2mhoT4NMb71NbLfbevqKinZgbLwlhpS5wzn0T6dIVedn43S/SjjiWel/LmQ0Ba0HmMv271xtkgF7JP5E6urgPf0ZgaVyJ4T2Q+kMUu3fC4F+ia+3zYm+ZWYLYFBJbVSBw8Bo8l+d/02IjSofXsGGDxj8NSuMJZ11p/veiUxLIPyRrCc6/cPVU3jQnD/ZUE8lyVgYt4jF59PkkENBRr7ZilJRYIF/KlT8yWim4IY/cVf0e5I4q/I1mhprX4eZQv1xMKV/r4pM+IMk5s+AJlPd92LOU7eQtk91CkRBbSZAHTW8MPJK8z9TxiCy7Rhq5RD5+HzYBJOCXAlHsMsx1zOm
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(136003)(366004)(39860400002)(376002)(346002)(451199021)(2906002)(30864003)(86362001)(15650500001)(44832011)(66574015)(6486002)(83380400001)(186003)(26005)(53546011)(6506007)(5660300002)(6512007)(82960400001)(478600001)(66946007)(66476007)(6916009)(4326008)(316002)(38100700002)(66556008)(8676002)(41300700001)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?z7cO2KEizi9kDBfyGE/ztZbm114C8/7I2QE8xEgiFmoIxqP+a8w8AAkIzS?=
 =?iso-8859-1?Q?93He//xMK+ecnCMbKuAPWB/IZt99m+08dQq4iOj2C9lAGQvE/FxAhfz+nk?=
 =?iso-8859-1?Q?Jt6uWNJSV24rcmc69m5T1n8ekC5TJiSg9XSTuh1YCyI+0haf+XlVZCa537?=
 =?iso-8859-1?Q?JT//K6Y2zkXIaCmNlYMffQji2Ga0PBY+gBym5FT8p4Kt28aYvzCICEA2AY?=
 =?iso-8859-1?Q?v/B6JuK2x/xcWExpN2CZsTLfH9dsIDyMz0qSuMK6x5/H2wRAilVieY8HT7?=
 =?iso-8859-1?Q?RVzi626cjjJdKdJy77dLZccQxSVDg/BuCQtHm8eWJq/FRk9HfZQKXYwZjn?=
 =?iso-8859-1?Q?zBh2yWA9am69aTwUrG7vfr75igou9vx3TSUg6MMzmF53GyhlXKpT8HM3FZ?=
 =?iso-8859-1?Q?mh0kaZswyLb05nl2Y5sN7EXyxlTF5xParpESycp8qQRJTRIQuxrysum+G9?=
 =?iso-8859-1?Q?cPr2URnG+uLMMhmnYrUsbCzZoLaEWcHby7v/TRLnjRvKm2VzOntymPtV74?=
 =?iso-8859-1?Q?e6x1wY6mhQWkEtXrsuXjl9EOZ+/kFm1Wm9aqD7zSOlb2M5onRZyeqeBKMz?=
 =?iso-8859-1?Q?l+f0mT9CL45t+Ef+QHfEAiSbQ0edCQG6ppICSJNuLCb2luEMpiLuM+A/m6?=
 =?iso-8859-1?Q?5Si9BAoNotKEeEDIeoKIAwsFbojz9Pub6ZPJjLDB2u1L5lt3wbOXPa0gkf?=
 =?iso-8859-1?Q?vHCE5zo5gl1c2Z+nDuU7Q0gUimosdCe7Wmw7Y1ijmXm1Oo98fycGBT1V7i?=
 =?iso-8859-1?Q?wNW907y8HVkJYDE/uGZe2rS6Mp2s/j0otdXPo7CNPzoKbToJAHYgM87qyF?=
 =?iso-8859-1?Q?/5dw4i/aZwHcC7TkCNjANkRcVsHR7AMGezn2IO3lXjDP/xM6xoQGzlxN1c?=
 =?iso-8859-1?Q?RdPheCKY/veghviktXbYx8RS9mmgrmQdPzj+mjrN4ksyH+KjcbWFfO7S+u?=
 =?iso-8859-1?Q?h4xiB7KnM+hv85C+fAz9ptPAqySl6fT6puttx+uSOU17Dt6NYG2mDsa10k?=
 =?iso-8859-1?Q?G+Sxbz4ITghp0t2GEEWA2aTMK1C6kyIJKJsNMr9aWziIUNcWFNFkEev+tb?=
 =?iso-8859-1?Q?AbTslab6tVCbHx1K25MK4y/l+cEP74Iu5N/DIs9f8G2qRkJFwG7T3vJpLR?=
 =?iso-8859-1?Q?sEhcNAeadkjg6zVC1XcIusjEAO/CONUZMn6e2yPGsAcrd3+224F96/CNUm?=
 =?iso-8859-1?Q?Jxee3TTUVB1QWQaaU262jts9nfyFLNCtvgyUbTbQJTOr9RVEfY4U9/OqUz?=
 =?iso-8859-1?Q?MLlUdMJx/LqzU+s4Es/xBTn4ohiIgSQVr/Hi8cT1dHZlPGM4YNsNnNgZU2?=
 =?iso-8859-1?Q?FXSd/fwiTSHX0LAhTrlzZNaEnZEXDEG1v3jV5hALCPQ40iN3/S5GJUh7Ec?=
 =?iso-8859-1?Q?5F9ZT90pZplH5+dY0/chQwO7rN+IQN1L4V8p4aYVQ6J9CqIJavLNYADQhp?=
 =?iso-8859-1?Q?DhvW6eBjhn4d0xJ+fVt1BwR7hlWi0SpQXCAsYGB1yxLu5E3yRrKX38f54E?=
 =?iso-8859-1?Q?wK9XxxCSdEiHl1k9ItsCseNcQ2rpm/QnyIqiFaNS4ISZvVYfJiPOEumTAQ?=
 =?iso-8859-1?Q?Xi9Vk8mOQvAgjIv/eb2W/ipBKl40hhCtaIElOl2XFv+EYPEQHYDC6Dv2uV?=
 =?iso-8859-1?Q?HsODVxgUe7KJCWLiYJnrLyuZQ9pqpwzq7d1uoCdltmQaHuVJZ+SI0vNA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ce841d0-3eab-430d-dea6-08db6d4feb12
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2023 03:23:42.0151 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TM6dgI5/Wqmwg3iigdR2OpMj2zfAtqZSxs7C5VyRx2yzqDKjktWpA3v8biVSXny+o+6WzTuuUudBuB6XF7N7vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5309
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 5/8] drm/xe: Long running job update
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

On Wed, Jun 14, 2023 at 01:40:31PM +0200, Thomas Hellström wrote:
> 
> On 6/7/23 18:03, Matthew Brost wrote:
> Some commit message nits:
> > For long running (LR) jobs with the DRM scheduler we must return NULL in
> > run_job which results in signaling the job's finished fence immediately.
> > This prevents LR jobs from creating infinite dma-fences.
> > 
> > Signaling job's finished fence immediately breaks flow controling ring
> s/controling/controlling/
> > with the DRM scheduler, to work around this the ring is flow controlled
> > and written in the exec IOCTL.
> Imperative: To work around this, flow control...
> >   Signaling job's finished fence
> > immediately also breaks the TDR which is used in reset / cleanup entity
> > paths so we write a new path for LR entities.
> so write

Will fix all of this.

> > 
> > v2: Better commit, white space, remove rmb(), better comment next to
> > emit_job()
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_engine.c           | 32 ++++++++
> >   drivers/gpu/drm/xe/xe_engine.h           |  4 +
> >   drivers/gpu/drm/xe/xe_exec.c             |  8 ++
> >   drivers/gpu/drm/xe/xe_guc_engine_types.h |  2 +
> >   drivers/gpu/drm/xe/xe_guc_submit.c       | 93 +++++++++++++++++++++---
> >   drivers/gpu/drm/xe/xe_trace.h            |  5 ++
> >   6 files changed, 135 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
> > index b3036c4a8ec3..eb5f66f07da8 100644
> > --- a/drivers/gpu/drm/xe/xe_engine.c
> > +++ b/drivers/gpu/drm/xe/xe_engine.c
> > @@ -18,6 +18,7 @@
> >   #include "xe_macros.h"
> >   #include "xe_migrate.h"
> >   #include "xe_pm.h"
> > +#include "xe_ring_ops_types.h"
> >   #include "xe_trace.h"
> >   #include "xe_vm.h"
> > @@ -679,6 +680,37 @@ static void engine_kill_compute(struct xe_engine *e)
> >   	up_write(&e->vm->lock);
> >   }
> > +/**
> > + * xe_engine_is_lr() - Whether an engine is long-running
> > + * @e: The engine
> > + *
> > + * Return: True if the engine is long-running, false otherwise.
> > + */
> > +bool xe_engine_is_lr(struct xe_engine *e)
> > +{
> > +	return e->vm && xe_vm_no_dma_fences(e->vm) &&
> > +		!(e->flags & ENGINE_FLAG_VM);
> > +}
> > +
> > +static s32 xe_engine_num_job_inflight(struct xe_engine *e)
> > +{
> > +	return e->lrc->fence_ctx.next_seqno - xe_lrc_seqno(e->lrc) - 1;
> > +}
> > +
> > +/**
> > + * xe_engine_ring_full() - Whether an engine's ring is full
> > + * @e: The engine
> > + *
> > + * Return: True if the engine's ring is full, false otherwise.
> > + */
> > +bool xe_engine_ring_full(struct xe_engine *e)
> > +{
> > +	struct xe_lrc *lrc = e->lrc;
> > +	s32 max_job = lrc->ring.size / MAX_JOB_SIZE_BYTES;
> > +
> > +	return xe_engine_num_job_inflight(e) >= max_job;
> > +}
> > +
> >   /**
> >    * xe_engine_is_idle() - Whether an engine is idle.
> >    * @engine: The engine
> > diff --git a/drivers/gpu/drm/xe/xe_engine.h b/drivers/gpu/drm/xe/xe_engine.h
> > index a49cf2ab405e..2e60f6d90226 100644
> > --- a/drivers/gpu/drm/xe/xe_engine.h
> > +++ b/drivers/gpu/drm/xe/xe_engine.h
> > @@ -42,6 +42,10 @@ static inline bool xe_engine_is_parallel(struct xe_engine *engine)
> >   	return engine->width > 1;
> >   }
> > +bool xe_engine_is_lr(struct xe_engine *e);
> > +
> > +bool xe_engine_ring_full(struct xe_engine *e);
> > +
> >   bool xe_engine_is_idle(struct xe_engine *engine);
> >   void xe_engine_kill(struct xe_engine *e);
> > diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> > index e44076ee2e11..9e9523939de8 100644
> > --- a/drivers/gpu/drm/xe/xe_exec.c
> > +++ b/drivers/gpu/drm/xe/xe_exec.c
> > @@ -14,6 +14,7 @@
> >   #include "xe_device.h"
> >   #include "xe_engine.h"
> >   #include "xe_macros.h"
> > +#include "xe_ring_ops_types.h"
> >   #include "xe_sched_job.h"
> >   #include "xe_sync.h"
> >   #include "xe_vm.h"
> > @@ -300,6 +301,11 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> >   		goto err_engine_end;
> >   	}
> > +	if (xe_engine_is_lr(engine) && xe_engine_ring_full(engine)) {
> > +		err = -EWOULDBLOCK;
> > +		goto err_engine_end;
> > +	}
> > +
> >   	job = xe_sched_job_create(engine, xe_engine_is_parallel(engine) ?
> >   				  addresses : &args->address);
> >   	if (IS_ERR(job)) {
> > @@ -386,6 +392,8 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> >   		xe_sync_entry_signal(&syncs[i], job,
> >   				     &job->drm.s_fence->finished);
> > +	if (xe_engine_is_lr(engine))
> > +		engine->ring_ops->emit_job(job);
> >   	xe_sched_job_push(job);
> >   	xe_vm_reactivate_rebind(vm);
> > diff --git a/drivers/gpu/drm/xe/xe_guc_engine_types.h b/drivers/gpu/drm/xe/xe_guc_engine_types.h
> > index cbfb13026ec1..5d83132034a6 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_engine_types.h
> > +++ b/drivers/gpu/drm/xe/xe_guc_engine_types.h
> > @@ -31,6 +31,8 @@ struct xe_guc_engine {
> >   	 */
> >   #define MAX_STATIC_MSG_TYPE	3
> >   	struct drm_sched_msg static_msgs[MAX_STATIC_MSG_TYPE];
> > +	/** @lr_tdr: long running TDR worker */
> > +	struct work_struct lr_tdr;
> >   	/** @fini_async: do final fini async from this worker */
> >   	struct work_struct fini_async;
> >   	/** @resume_time: time of last resume */
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index a7a0d9f806bd..7bde687fd188 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -482,6 +482,14 @@ static void register_engine(struct xe_engine *e)
> >   		parallel_write(xe, map, wq_desc.wq_status, WQ_STATUS_ACTIVE);
> >   	}
> > +	/*
> > +	 * We must keep a reference for LR engines if engine is registered with
> > +	 * the GuC as jobs signal immediately and can't destroy an engine if the
> > +	 * GuC has a reference to it.
> > +	 */
> > +	if (xe_engine_is_lr(e))
> > +		xe_engine_get(e);
> > +
> >   	set_engine_registered(e);
> >   	trace_xe_engine_register(e);
> >   	if (xe_engine_is_parallel(e))
> > @@ -644,6 +652,7 @@ guc_engine_run_job(struct drm_sched_job *drm_job)
> >   {
> >   	struct xe_sched_job *job = to_xe_sched_job(drm_job);
> >   	struct xe_engine *e = job->engine;
> > +	bool lr = xe_engine_is_lr(e);
> >   	XE_BUG_ON((engine_destroyed(e) || engine_pending_disable(e)) &&
> >   		  !engine_banned(e) && !engine_suspended(e));
> > @@ -653,14 +662,19 @@ guc_engine_run_job(struct drm_sched_job *drm_job)
> >   	if (!engine_killed_or_banned(e) && !xe_sched_job_is_error(job)) {
> >   		if (!engine_registered(e))
> >   			register_engine(e);
> > -		e->ring_ops->emit_job(job);
> > +		if (!lr)	/* LR jobs are emitted in the exec IOCTL */
> > +			e->ring_ops->emit_job(job);
> >   		submit_engine(e);
> >   	}
> > -	if (test_and_set_bit(JOB_FLAG_SUBMIT, &job->fence->flags))
> > +	if (lr) {
> > +		xe_sched_job_set_error(job, -EOPNOTSUPP);
> > +		return NULL;
> > +	} else if (test_and_set_bit(JOB_FLAG_SUBMIT, &job->fence->flags)) {
> >   		return job->fence;
> > -	else
> > +	} else {
> >   		return dma_fence_get(job->fence);
> > +	}
> >   }
> >   static void guc_engine_free_job(struct drm_sched_job *drm_job)
> > @@ -764,6 +778,56 @@ static void simple_error_capture(struct xe_engine *e)
> >   }
> >   #endif
> > +static void xe_guc_engine_trigger_cleanup(struct xe_engine *e)
> > +{
> > +	struct xe_guc *guc = engine_to_guc(e);
> > +
> > +	if (xe_engine_is_lr(e))
> > +		queue_work(guc_to_gt(guc)->ordered_wq, &e->guc->lr_tdr);
> > +	else
> > +		drm_sched_set_timeout(&e->guc->sched, MIN_SCHED_TIMEOUT);
> > +}
> > +
> > +static void xe_guc_engine_lr_cleanup(struct work_struct *w)
> > +{
> > +	struct xe_guc_engine *ge =
> > +		container_of(w, struct xe_guc_engine, lr_tdr);
> > +	struct xe_engine *e = ge->engine;
> > +	struct drm_gpu_scheduler *sched = &ge->sched;
> > +
> > +	XE_WARN_ON(!xe_engine_is_lr(e));
> > +	trace_xe_engine_lr_cleanup(e);
> > +
> > +	/* Kill the run_job / process_msg entry points */
> > +	drm_sched_run_wq_stop(sched);
> > +
> > +	/* Engine state now stable, disable scheduling / deregister if needed */
> > +	if (engine_registered(e)) {
> > +		struct xe_guc *guc = engine_to_guc(e);
> > +		int ret;
> > +
> > +		set_engine_banned(e);
> > +		xe_engine_get(e);
> > +		disable_scheduling_deregister(guc, e);
> > +
> > +		/*
> > +		 * Must wait for scheduling to be disabled before signalling
> > +		 * any fences, if GT broken the GT reset code should signal us.
> > +		 */
> > +		ret = wait_event_timeout(guc->ct.wq,
> > +					 !engine_pending_disable(e) ||
> > +					 guc_read_stopped(guc), HZ * 5);
> > +		if (!ret) {
> > +			XE_WARN_ON("Schedule disable failed to respond");
> > +			drm_sched_run_wq_start(sched);
> > +			xe_gt_reset_async(e->gt);
> > +			return;
> > +		}
> > +	}
> > +
> > +	drm_sched_run_wq_start(sched);
> > +}
> > +
> >   static enum drm_gpu_sched_stat
> >   guc_engine_timedout_job(struct drm_sched_job *drm_job)
> >   {
> > @@ -815,7 +879,7 @@ guc_engine_timedout_job(struct drm_sched_job *drm_job)
> >   			err = -EIO;
> >   		set_engine_banned(e);
> >   		xe_engine_get(e);
> > -		disable_scheduling_deregister(engine_to_guc(e), e);
> > +		disable_scheduling_deregister(guc, e);
> >   		/*
> >   		 * Must wait for scheduling to be disabled before signalling
> > @@ -848,7 +912,7 @@ guc_engine_timedout_job(struct drm_sched_job *drm_job)
> >   	 */
> >   	list_add(&drm_job->list, &sched->pending_list);
> >   	drm_sched_run_wq_start(sched);
> > -	drm_sched_set_timeout(&e->guc->sched, MIN_SCHED_TIMEOUT);
> > +	xe_guc_engine_trigger_cleanup(e);
> >   	/* Mark all outstanding jobs as bad, thus completing them */
> >   	spin_lock(&sched->job_list_lock);
> > @@ -872,6 +936,8 @@ static void __guc_engine_fini_async(struct work_struct *w)
> >   	trace_xe_engine_destroy(e);
> > +	if (xe_engine_is_lr(e))
> > +		cancel_work_sync(&ge->lr_tdr);
> >   	if (e->flags & ENGINE_FLAG_PERSISTENT)
> >   		xe_device_remove_persistent_engines(gt_to_xe(e->gt), e);
> >   	release_guc_id(guc, e);
> > @@ -889,7 +955,7 @@ static void guc_engine_fini_async(struct xe_engine *e)
> >   	bool kernel = e->flags & ENGINE_FLAG_KERNEL;
> >   	INIT_WORK(&e->guc->fini_async, __guc_engine_fini_async);
> > -	queue_work(system_unbound_wq, &e->guc->fini_async);
> > +	queue_work(system_wq, &e->guc->fini_async);
> >   	/* We must block on kernel engines so slabs are empty on driver unload */
> >   	if (kernel) {
> > @@ -1078,6 +1144,9 @@ static int guc_engine_init(struct xe_engine *e)
> >   	if (err)
> >   		goto err_sched;
> > +	if (xe_engine_is_lr(e))
> > +		INIT_WORK(&e->guc->lr_tdr, xe_guc_engine_lr_cleanup);
> > +
> >   	mutex_lock(&guc->submission_state.lock);
> >   	err = alloc_guc_id(guc, e);
> > @@ -1129,7 +1198,7 @@ static void guc_engine_kill(struct xe_engine *e)
> >   {
> >   	trace_xe_engine_kill(e);
> >   	set_engine_killed(e);
> > -	drm_sched_set_timeout(&e->guc->sched, MIN_SCHED_TIMEOUT);
> > +	xe_guc_engine_trigger_cleanup(e);
> >   }
> >   static void guc_engine_add_msg(struct xe_engine *e, struct drm_sched_msg *msg,
> > @@ -1279,6 +1348,9 @@ static void guc_engine_stop(struct xe_guc *guc, struct xe_engine *e)
> >   	/* Stop scheduling + flush any DRM scheduler operations */
> >   	drm_sched_run_wq_stop(sched);
> > +	if (engine_registered(e) && xe_engine_is_lr(e))
> > +		xe_engine_put(e);
> > +
> >   	/* Clean up lost G2H + reset engine state */
> >   	if (engine_destroyed(e) && engine_registered(e)) {
> >   		if (engine_banned(e))
> > @@ -1503,6 +1575,9 @@ int xe_guc_deregister_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
> >   	trace_xe_engine_deregister_done(e);
> >   	clear_engine_registered(e);
> > +	if (xe_engine_is_lr(e))
> > +		xe_engine_put(e);
> > +
> 
> This looks suspicious. We're putting the reference of "e", but continue to
> dereference "e" afterwards. If this is intentional, could you add a comment
> as to which pointer's reference we put? Typically wen you put the reference
> of a pointer you don't use it afterwards unless it is obvious that you're
> only caching the value from the pointer that carries the reference?
> 

This is goofy and does indeed work as if a engine is LR here is will
also always be banned. Let me change the reference counting here so the
code can change to:

if (xe_engine_is_lr(e) || engine_banned(e))
	xe_engine_put(e);
else
	...

This will affect a few other code paths too.

Matt

> 
> >   	if (engine_banned(e))
> >   		xe_engine_put(e);
> >   	else
> > @@ -1540,7 +1615,7 @@ int xe_guc_engine_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
> >   	 */
> >   	set_engine_reset(e);
> >   	if (!engine_banned(e))
> > -		drm_sched_set_timeout(&e->guc->sched, MIN_SCHED_TIMEOUT);
> > +		xe_guc_engine_trigger_cleanup(e);
> >   	return 0;
> >   }
> > @@ -1567,7 +1642,7 @@ int xe_guc_engine_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
> >   	/* Treat the same as engine reset */
> >   	set_engine_reset(e);
> >   	if (!engine_banned(e))
> > -		drm_sched_set_timeout(&e->guc->sched, MIN_SCHED_TIMEOUT);
> > +		xe_guc_engine_trigger_cleanup(e);
> >   	return 0;
> >   }
> > diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
> > index 2f8eb7ebe9a7..02861c26e145 100644
> > --- a/drivers/gpu/drm/xe/xe_trace.h
> > +++ b/drivers/gpu/drm/xe/xe_trace.h
> > @@ -219,6 +219,11 @@ DEFINE_EVENT(xe_engine, xe_engine_resubmit,
> >   	     TP_ARGS(e)
> >   );
> > +DEFINE_EVENT(xe_engine, xe_engine_lr_cleanup,
> > +	     TP_PROTO(struct xe_engine *e),
> > +	     TP_ARGS(e)
> > +);
> > +
> >   DECLARE_EVENT_CLASS(xe_sched_job,
> >   		    TP_PROTO(struct xe_sched_job *job),
> >   		    TP_ARGS(job),
