Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6648DC46CA3
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 19:43:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 308DB10EB04;
	Fri,  8 Dec 2023 19:43:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF82310EB04
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 19:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702064592; x=1733600592;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=cNXp+93Ro6FmGxPLawz4L86/8w3FmUJPkDbWAgkCUrE=;
 b=YmKTSRnYYmsYgW+kzvnwOGnA/zeYxJLqRjjcmI4152LfFuGJywBYcrBh
 mZJ6FZ7q52OCDQ76/hw/YNcY6sqlR8l4O+LjUlvRdkJhloOGbBz5+npYW
 ItJ5Ixb/fjvfu4Cu5bCG2z3loWVGqDwnNFh5/lPkThRBIKkcF94+1CuAp
 lHK/Ttc1fTE6nXtoifuWYSX9FdgK8Em+tuZ6Dm7sVwmYS7o41MHH3hz4O
 50Ua66TEI5x2YkHCn+oCnx4eZaFSIepM64GSHHnXkSPlQGZrNaWYxem8G
 JQ2RTmR8wrXQ7nsFGKxLzu2cnlhG1BrAHQ6Qm5FkkcSN7/o/PcgEXmBju w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="391623564"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; d="scan'208";a="391623564"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2023 11:43:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="862981059"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; d="scan'208";a="862981059"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Dec 2023 11:43:12 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Dec 2023 11:43:11 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 8 Dec 2023 11:43:11 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 8 Dec 2023 11:43:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rxxqclq7oboWUQH08qFuUAzPQxVFKAmD04RFAsQgy1Migk3KipZHo5j5RRhSc1MHcvGRVUECSF/cwzRh3DHAPUAR1B8hctqNLYXQPWHrnxsHDiDCtmYlBaf+n9eoMdicCpA0Rly+cEu6qc22/cF50K/pWKbYOr4LKRUIW/yxF9HPSMLlrR2s6du3rhznQf0UYEJDQccZTbamHvtRMORh+hkZbXTWXgVtIk0lIudZ0juB/CrHXgVNJyGDgE3Ksp7lBkpGp+/9PoQLiwSeHrdeyJ47KB2/6M96cSM6uHG7gtF8+qBV3lxrrFMUz3CqoyjeikNE/zI/iBSncn+0h6APww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rEdH7mKVsDwg20f+tlp69IzKvFDUqWpYVdCDarLHu/o=;
 b=LNKFuXZI09kw7LZij/CHuxdzS/0etdL6ZZynwgkvnl9uXPh2yOpiZq9kULpAn4dWklbRVq510so/i4qqbXml2dhvpawAW/Nnfaw2s+LbYenNu/YdIRQbVskq/77VhaAG1Zn2iq+MdEyDDejYU9f1A9TY7HlSc3RIluKyPBEf8PA55X73xep9tjbBPaiH+m2n3OYmrgVrG/zpV9cDdGK6WqagLGOLuO0or8i9+N2hm68Xp8qGG3Uk+B7smPBeL947/nnwWMKolFkJjlzEZ6bY/WFgoHmqKH64C9Hs+gD7LnoX5yk0jMolusJZpqx1v7qsVR91JYbx6YDgBpGr6z4gww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB7668.namprd11.prod.outlook.com (2603:10b6:806:341::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.28; Fri, 8 Dec
 2023 19:43:09 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7068.028; Fri, 8 Dec 2023
 19:43:09 +0000
Date: Fri, 8 Dec 2023 12:42:10 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v4 6/6] drm/xe: Add last fence as dependency for jobs on
 user exec queues
Message-ID: <ZXMPIuR4EEbaIJMD@DUT025-TGLU.fm.intel.com>
References: <20231206222141.398040-1-matthew.brost@intel.com>
 <20231206222141.398040-7-matthew.brost@intel.com>
 <761241f7-cf01-309d-5929-cce041196245@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <761241f7-cf01-309d-5929-cce041196245@linux.intel.com>
X-ClientProxiedBy: BYAPR07CA0053.namprd07.prod.outlook.com
 (2603:10b6:a03:60::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB7668:EE_
X-MS-Office365-Filtering-Correlation-Id: 082094b8-ee0a-485d-72f0-08dbf825e808
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GssudJipgem2Situ3UlEMXYKPCwByz/qmfGFAK+zpJcZXMEBXtV+dyTQL6pSCkR71pmKR4q/NSjLKh9ukUm2Iof2XtKMczS+nmm6Lxz+XCocGzAGACE60DuFakD63SRMZeRmsz4mZMseSYeOIOHYvqK9s5cw6q1UEMX1ChsbeaBS16qLqbmlVYyhUWAd6sprHGOR+EnFlPRShmDk0RtLT57c1qTZEVub1kltrHk2L9g/46am/xdwsOIDwWW5xSxVfxYhnN6M3LS+rfXLFeupC05Ma5aubahJqyhZMVGZalYqJj1Y7+FTW1STPqSgDjYBoxaqp6UeqDd3iRKFwRp3h8gzRICpZzPlk5kldhgQRH1LDQ8obEo+z5B8/9Jbhp8cfz2EOcsSagl7fQBMiG24rUqCWEB5AjfafdQ2kSvHLCns1EpZS649s+8DFZOIEFyWvGI/V/brs6x+uhet6tGlvUiJjIRowi9wJ9ihotQruezsx+Kcl8i5xAl2DsO1CU1j8qoixmRyVP5TaV6OohJtPtjAcIZwORl6wH106Ds4Tz59SNAzu6w4FjCqR660Cswl
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(346002)(136003)(39860400002)(376002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(5660300002)(2906002)(8676002)(4326008)(86362001)(44832011)(41300700001)(82960400001)(8936002)(66574015)(6512007)(83380400001)(26005)(66946007)(66476007)(6916009)(66556008)(316002)(38100700002)(6666004)(53546011)(6506007)(6486002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?mIZ572vsHr3OqX9MxdMsy6iavaCV4PlvnswH/tUjZKz/5Mdz285VUM5Cm8?=
 =?iso-8859-1?Q?dvvvKCKUaGPLVdLI31ggBnZdi+cMsi7X/nNcj2a1KC6cdXAq8u2BOymGLs?=
 =?iso-8859-1?Q?od/d6SPwrT+G0fLB7HU3v+6k6tfeOOZYG6iWvgLkaKGkpprW8pnshh4UT3?=
 =?iso-8859-1?Q?tV/sg8b7yQihqOPhK50DnTdWlcARQHOb3dwo1Yujf2rmrhiYxJFWbTdxwb?=
 =?iso-8859-1?Q?8evMXpZW7sIEn7ac5KJSW3FVDDGSaw5ND9MaoDw5dazS5CahSqXRKSeItA?=
 =?iso-8859-1?Q?L4BDNsgS7Vgqe76n9yeZKH1fklAM6TlwlWfBrdN0zuvh/2RcVQgaaFeqSJ?=
 =?iso-8859-1?Q?QSthZSS90y6XQ/Os5oZirN63GpLMOHAVvZ98I+tF1SyuIajRVzLrnLimxC?=
 =?iso-8859-1?Q?XMO6c4gNbCU9wzOqrxweTtEUyQn0m8HTaKVhgFSALaeoCrCSESU/mmhali?=
 =?iso-8859-1?Q?/XgUTCOhTFtLs7Lh/fxeka2lfV/7VNR8uf4VPFyfo4D8mRmofN84ho1pQK?=
 =?iso-8859-1?Q?JZWcZZEOIFvZS7e0bKWMPt9siw8tirSRSCHiMniKOYlhKUPQfL3bjT2LAX?=
 =?iso-8859-1?Q?La4/E/qkpdDfdmPows+8OEgnGP5syq/yWeTqX8m1qog4+arFU3rpC9mbZO?=
 =?iso-8859-1?Q?uLJf/GXxvk98VPhaCxqQX3ijDT+HkWCoSIefoINpTEkOuLuWqHlN59PlXt?=
 =?iso-8859-1?Q?kSsWd0IFQ+bC4GsLbFpfmsSr8JRwbt4Rx9ldV2YkN5YVRiL/I6hMGZNm7y?=
 =?iso-8859-1?Q?/OJUjbzuxgtP3z32/e04usMwqhEpSjnKed4RFudtiaMeBvaOyI707h5C2T?=
 =?iso-8859-1?Q?XW6xXBQtoxoAHJZTgid83P8Em9Eb32CDOBTYCkATvywZhzHDDv2avBqV4L?=
 =?iso-8859-1?Q?Q1X05DqF/VdvfxHUWG5/6HUTHfyXEZTCxUtYv8GMIyvn4yVC9+10JePS/d?=
 =?iso-8859-1?Q?9mGlaIRqRtbZisd3AsAkvTAC8JOn7Z9MIRTdbjHU0Fm/H1fMGHemAQ3r/f?=
 =?iso-8859-1?Q?f0H+6WNczQsnmKqWBj/I/Gn1B1DeGp9jrJpVrw5VkE8Ae9tud5dH/IV2gR?=
 =?iso-8859-1?Q?X3Y7HDvPnE0imjbEFWhupnWvXtKgA0hAEKaILO+BA/+fOV+shLGKqkB1Yp?=
 =?iso-8859-1?Q?h6TTTw0bqCjz8jvSx8QNWiJJS0m7mCj7JH9MtqkieH9/BwyJ0AvZs31C70?=
 =?iso-8859-1?Q?X0pFgY2Zbgyx4OMsH7mZEQk9D8AQlpTMNlQocmvfS2xBkDrAHDmBxUzlPY?=
 =?iso-8859-1?Q?RWFzfN0nUURAxDH/RovqP8Sv1mPPwBRIEsdM4UO+PtWJ/Y0JCOwd2f4opd?=
 =?iso-8859-1?Q?7hv1RBcJzkE/lzAWSc4lXSdj4qWgYAzSvd7IyvhVsKM0sM8tqEOlVlbOGE?=
 =?iso-8859-1?Q?nzvp7SxXGaoMNF4vQqG9zSMRv+4ClqUIpng9e47btXTRg8wF0EePgb3Uxm?=
 =?iso-8859-1?Q?XDK5549IPdUkUuVLu02YWpvR+1Jzz/qgiFgaW2IwOyRWDIlvX0ACUA+Yd8?=
 =?iso-8859-1?Q?56louyo+3FZyO4IF40b/Mif+Sj0bjNsoghLe948kRDRr7Wiarv/cInU8sK?=
 =?iso-8859-1?Q?1Beq7tT6H4YnckFSuz9TeQnvpD033Eg6urSJ7uA5PcLlQhlA08zj9pti+4?=
 =?iso-8859-1?Q?9jix602O74L0XboH+ChkWMvD4Z4eqatTXre+TjCfugGaoNsTPePgw7nQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 082094b8-ee0a-485d-72f0-08dbf825e808
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 19:43:09.4758 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rL8uC1v8OlOj9K5jDqd5LxXtKSypd350DnIG6O0c5NyWQrw0YeP6qObWxSiMy8AFkTw8Qo05lhyXP6QvrklGhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7668
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

On Fri, Dec 08, 2023 at 01:31:02PM +0100, Thomas Hellström wrote:
> 
> On 12/6/23 23:21, Matthew Brost wrote:
> > The last fence must be added as a dependency for jobs on user exec
> > queues as it is possible for the last fence to be a composite software
> > fence (unordered, ioctl with zero bb or binds) rather than hardware
> > fence (ordered, previous job on queue).
> > 
> > Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_exec.c       |  4 ++++
> >   drivers/gpu/drm/xe/xe_exec_queue.c |  2 +-
> >   drivers/gpu/drm/xe/xe_migrate.c    | 14 +++++++++++---
> >   drivers/gpu/drm/xe/xe_sched_job.c  | 17 +++++++++++++++++
> >   drivers/gpu/drm/xe/xe_sched_job.h  |  4 ++++
> >   5 files changed, 37 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> > index 438e34585e1e..92b0da6580e8 100644
> > --- a/drivers/gpu/drm/xe/xe_exec.c
> > +++ b/drivers/gpu/drm/xe/xe_exec.c
> > @@ -313,6 +313,10 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> >   		goto err_put_job;
> >   	if (!xe_vm_in_lr_mode(vm)) {
> > +		err = xe_sched_job_last_fence_add_dep(job, vm);
> > +		if (err)
> > +			goto err_put_job;
> > +
> >   		err = down_read_interruptible(&vm->userptr.notifier_lock);
> >   		if (err)
> >   			goto err_put_job;
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> > index 67e3fd9dfc5f..3911d14522ee 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > @@ -887,7 +887,7 @@ static void xe_exec_queue_last_fence_lockdep_assert(struct xe_exec_queue *q,
> >   						    struct xe_vm *vm)
> >   {
> >   	if (q->flags & EXEC_QUEUE_FLAG_VM)
> > -		lockdep_assert_held_write(&vm->lock);
> > +		lockdep_assert_held(&vm->lock);
> >   	else
> >   		xe_vm_assert_held(vm);
> >   }
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> > index e8b567708ac0..ce14498b416a 100644
> > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > @@ -1163,17 +1163,24 @@ xe_migrate_update_pgtables_cpu(struct xe_migrate *m,
> >   	return fence;
> >   }
> > -static bool no_in_syncs(struct xe_sync_entry *syncs, u32 num_syncs)
> > +static bool no_in_syncs(struct xe_vm *vm, struct xe_exec_queue *q,
> > +			struct xe_sync_entry *syncs, u32 num_syncs)
> >   {
> > +	struct dma_fence *fence;
> >   	int i;
> >   	for (i = 0; i < num_syncs; i++) {
> > -		struct dma_fence *fence = syncs[i].fence;
> > +		fence = syncs[i].fence;
> >   		if (fence && !test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
> >   				       &fence->flags))
> >   			return false;
> >   	}
> > +	if (q) {
> > +		fence = xe_exec_queue_last_fence_get(q, vm);
> > +		if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
> > +			return false;
> > +	}
> >   	return true;
> >   }
> > @@ -1234,7 +1241,7 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
> >   	u16 pat_index = xe->pat.idx[XE_CACHE_WB];
> >   	/* Use the CPU if no in syncs and engine is idle */
> > -	if (no_in_syncs(syncs, num_syncs) && xe_exec_queue_is_idle(q_override)) {
> > +	if (no_in_syncs(vm, q, syncs, num_syncs) && xe_exec_queue_is_idle(q_override)) {
> >   		fence =  xe_migrate_update_pgtables_cpu(m, vm, bo, updates,
> >   							num_updates,
> >   							first_munmap_rebind,
> > @@ -1351,6 +1358,7 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
> >   			goto err_job;
> >   	}
> > +	err = xe_sched_job_last_fence_add_dep(job, vm);
> >   	for (i = 0; !err && i < num_syncs; i++)
> >   		err = xe_sync_entry_add_deps(&syncs[i], job);
> > diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
> > index b467d5bfa4ac..b7d714522ae1 100644
> > --- a/drivers/gpu/drm/xe/xe_sched_job.c
> > +++ b/drivers/gpu/drm/xe/xe_sched_job.c
> > @@ -260,3 +260,20 @@ void xe_sched_job_push(struct xe_sched_job *job)
> >   	drm_sched_entity_push_job(&job->drm);
> >   	xe_sched_job_put(job);
> >   }
> > +
> > +int xe_sched_job_last_fence_add_dep(struct xe_sched_job *job, struct xe_vm *vm)
> > +{
> > +	struct dma_fence *fence;
> > +
> > +	fence = xe_exec_queue_last_fence_get(job->q, vm);
> > +
> > +	/* Only wait on unsignaled software fences */
> > +	if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags) &&
> > +	    !(fence->context == job->drm.entity->fence_context ||
> > +	      fence->context == job->drm.entity->fence_context + 1)) {
> 
> Kerneldoc.
> 

Will add.

> Also What's the (fence_context + 1) doing? Otherwise I think the drm
> scheduler code already tests for signaled and same context so we shouldn't
> be needing to code that here as well?
>

I think the start fence + end fence are job->drm.entity +0, +1
respectfully. I lifted this code from drm_sched_job_add_dependency in a
previous DRM scheduler but the version we are doesn't appear to have
this code anymore. Let me see if I can figure out why that was removed.

> Also we should remember to look at bringing in Rob Clark's work where
> composite fences are unwrapped and added. Not merged yet though AFAICT.
> 

I have not seen that series... Let me look at that before spinning this again.

Matt

> Thanks,
> 
> Thomas
> 
> 
> > +		dma_fence_get(fence);
> > +		return drm_sched_job_add_dependency(&job->drm, fence);
> > +	}
> > +
> > +	return 0;
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_sched_job.h b/drivers/gpu/drm/xe/xe_sched_job.h
> > index 6ca1d426c036..34f475ba7f50 100644
> > --- a/drivers/gpu/drm/xe/xe_sched_job.h
> > +++ b/drivers/gpu/drm/xe/xe_sched_job.h
> > @@ -8,6 +8,8 @@
> >   #include "xe_sched_job_types.h"
> > +struct xe_vm;
> > +
> >   #define XE_SCHED_HANG_LIMIT 1
> >   #define XE_SCHED_JOB_TIMEOUT LONG_MAX
> > @@ -54,6 +56,8 @@ bool xe_sched_job_completed(struct xe_sched_job *job);
> >   void xe_sched_job_arm(struct xe_sched_job *job);
> >   void xe_sched_job_push(struct xe_sched_job *job);
> > +int xe_sched_job_last_fence_add_dep(struct xe_sched_job *job, struct xe_vm *vm);
> > +
> >   static inline struct xe_sched_job *
> >   to_xe_sched_job(struct drm_sched_job *drm)
> >   {
