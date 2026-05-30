Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96A49CD4F54
	for <intel-xe@archiver.kernel.org>; Sat, 30 May 2026 07:40:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57275112724;
	Sat, 30 May 2026 07:40:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cj6x+07A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E39E6112724
 for <intel-xe@lists.freedesktop.org>; Sat, 30 May 2026 07:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780126829; x=1811662829;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Xkc/MLirNZac2iYwx/QsFLBVWhVunCU2OpbToBBaJJM=;
 b=cj6x+07AKL3Xj5GsNLuq/XiZQPKBwYTckw0UKFzJTuYSiZr9oMGf8Gv6
 STdvFU6yaWp4VYSRlFlctndKOnDEtL2Ia5vvBPAYHjKNXUjb8v11axlZT
 YzLi9cJsD+KjsHw2a/JnWfRKhRprffCjIJrcfoGmzligZ+AA+H7wAP+Xl
 lVLDkaZQ+cX1qsKe9T0i0+QFb5foCVbADtD73w5si0iD/iIlxT5b2ohVp
 IhH/ClltMMUNpGURgk2wMkLYUfS7hs9mmUynso0UWaAZhfFaru9SrCLuZ
 WWZRfxI86ETf/TsVdEPKKfQRrOLU+SrccEIrB0Q8MmJka/ARBUD3lJJ3f A==;
X-CSE-ConnectionGUID: nmGTDXgxS02OD3JEeRq8rw==
X-CSE-MsgGUID: bLbw9wx1STu+1WN1n71QnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="91543387"
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; d="scan'208";a="91543387"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2026 00:40:24 -0700
X-CSE-ConnectionGUID: dKk7ZCLfQmCMdjasny2E5w==
X-CSE-MsgGUID: tiZn3+4XT22ZqrwnUdBkNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; d="scan'208";a="248151560"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2026 00:40:21 -0700
Date: Sat, 30 May 2026 09:40:17 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com,
 riana.tauro@intel.com, michal.wajdeczko@intel.com,
 matthew.d.roper@intel.com, michal.winiarski@intel.com,
 matthew.auld@intel.com, dev@lankhorst.se, jani.nikula@intel.com,
 lukasz.laguna@intel.com, zhanjun.dong@intel.com, lukas@wunner.de,
 badal.nilawar@intel.com
Subject: Re: [PATCH v7 6/8] drm/xe/migrate: Introduce xe_migrate_reinit()
Message-ID: <ahqUYb6ZdaBh6EP_@black.igk.intel.com>
References: <20260516093131.27442-1-raag.jadav@intel.com>
 <20260516093131.27442-7-raag.jadav@intel.com>
 <434530c7-352b-4802-a3f8-50dc9d6486b1@intel.com>
 <ahlf9TGszMJUITJv@black.igk.intel.com>
 <a72fcd52-3590-430e-a963-ab9ae00d68b2@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a72fcd52-3590-430e-a963-ab9ae00d68b2@intel.com>
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

On Fri, May 29, 2026 at 11:20:06AM -0700, Daniele Ceraolo Spurio wrote:
> On 5/29/2026 2:44 AM, Raag Jadav wrote:
> > On Wed, May 27, 2026 at 04:27:56PM -0700, Daniele Ceraolo Spurio wrote:
> > > On 5/16/2026 2:31 AM, Raag Jadav wrote:
> > > > In preparation of usecases which require re-initializing migrate context
> > > > after PCIe FLR, introduce xe_migrate_reinit() helper. Migrate exec queue
> > > > and pt_bo already exist in migrate structure but since their contents live
> > > > on VRAM, they are lost on PCIe FLR and need re-initialization.
> > > > 
> > > > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > > > Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> > > > Tested-by: Lukasz Laguna <lukasz.laguna@intel.com>
> > > > ---
> > > > v2: Re-initialize migrate context (Matthew Brost)
> > > > ---
> > > >    drivers/gpu/drm/xe/xe_gt.c      | 10 ++++++++++
> > > >    drivers/gpu/drm/xe/xe_migrate.c | 12 ++++++++++++
> > > >    drivers/gpu/drm/xe/xe_migrate.h |  1 +
> > > >    3 files changed, 23 insertions(+)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > > > index acc28389b0d8..a60e04c4d885 100644
> > > > --- a/drivers/gpu/drm/xe/xe_gt.c
> > > > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > > > @@ -928,6 +928,16 @@ void xe_gt_flr_prepare(struct xe_gt *gt)
> > > >     */
> > > >    int xe_gt_reinit(struct xe_gt *gt)
> > > >    {
> > > > +	int err;
> > > > +
> > > > +	if (xe_gt_is_main_type(gt)) {
> > > > +		struct xe_tile *tile = gt_to_tile(gt);
> > > > +
> > > > +		err = xe_migrate_reinit(tile->migrate);
> > > > +		if (err)
> > > > +			return err;
> > > > +	}
> > > > +
> > > >    	return xe_uc_reinit(&gt->uc);
> > > >    }
> > > > diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> > > > index 9428dd5e7760..9e1754028e1f 100644
> > > > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > > > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > > > @@ -454,6 +454,18 @@ static int xe_migrate_lock_prepare_vm(struct xe_tile *tile, struct xe_migrate *m
> > > >    	return err;
> > > >    }
> > > > +/**
> > > > + * xe_migrate_reinit() - Re-initialize a migrate context
> > > > + * @m: The migration context
> > > > + *
> > > > + * Returns: 0 on success, negative error code otherwise.
> > > > + */
> > > > +int xe_migrate_reinit(struct xe_migrate *m)
> > > > +{
> > > > +	xe_migrate_prepare_vm(m->tile, m, m->q->vm, NULL);
> > > > +	return xe_exec_queue_reinit(m->q);
> > > I'm not sold on calling xe_exec_queue_reinit from here. Wouldn't it be
> > > easier to just destroy and re-create the migration queue, instead of adding
> > > support for a new re-init flow that's only used during FLR?
> > This flow is to be reused for multiple usecases where we need device
> > level reinit.
> > 
> > I remember trying destroy/re-create at some point but I saw TLB
> > invalidation errors. I didn't know how to investigate those and gave
> > up on that direction.
> > 
> > IMO it's more performative to just restore existing stuff without
> > dealing with memory (which'd also make it a bit prone to failures)
> > in this path.
> 
> Makes sense.
> 
> > > IMO the re-init would be more valuable if we went with a gt-level function
> > > where we loop through all queues and re-init all the kernel-owned ones. That
> > > way if we add another queue that needs to be re-initialized it will
> > > automatically be picked up by the loop, instead of having to hook up a new
> > > callback in the FLR flow.
> > I went through some of the data structures and found that the queues
> > are maintained by individual components that use them. One way I
> > could think of would be to have a centralized list of queues (like
> > we have for kernel bos) that we can restore without worrying about
> > which component owns it, but it looks like something that needs to be
> > done as a prerequisite and perhaps requires significant refactoring.
> > 
> > Thoughts?
> 
> The risk here is that a new queue is added for a new component and the
> developer doesn't know they need to go and reinit it after the FLR. This
> might also be difficult to catch in testing, unless we go and re-run the
> full CI after an FLR to make sure everything still works (which is straight
> up not possible with tests that re-load the driver).
> 
> Maintaining a list of kernel queues shouldn't be too bad (there are very few
> of them), but I understand it increases the scope of this series.
> 
> We have a list of queues that have an assigned guc_id in
> guc->submission_state.exec_queue_lookup, which you can navigate with
> xa_for_each(), so a potential solution here could be to have a
> "guc_submit_reinit" function to go and re-init all kernel queues in that
> list. I don't really like this option because it moves the logic from the
> generic exec_queue layer down into the guc submission back-end, but it could
> be a stop-gap to get something working and we could then go and move the
> loop to the generic layer as a follow-up.
> 
> To summarize, without creating a new list, I think we have 2 non-optimal
> options
> 1 - have each component handle their re-init (not future-proof)
> 2 - handle this in a guc-specific function (layering violation)
> 
> I honestly can't decide which option I (dis)like more, so I'm not going to
> block this one way or the other and leave the call to the scheduler experts.

Or we can move forward with option 1 for now since we only have migrate
queue to work with? We can refactor this as a follow up when we come up
with an optimal solution with more components to reinit.

Raag

> > > > +}
> > > > +
> > > >    /**
> > > >     * xe_migrate_init() - Initialize a migrate context
> > > >     * @m: The migration context
> > > > diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
> > > > index 965c45889c72..49d8c717b957 100644
> > > > --- a/drivers/gpu/drm/xe/xe_migrate.h
> > > > +++ b/drivers/gpu/drm/xe/xe_migrate.h
> > > > @@ -112,6 +112,7 @@ struct xe_migrate_pt_update {
> > > >    struct xe_migrate *xe_migrate_alloc(struct xe_tile *tile);
> > > >    int xe_migrate_init(struct xe_migrate *m);
> > > > +int xe_migrate_reinit(struct xe_migrate *m);
> > > >    struct dma_fence *xe_migrate_to_vram(struct xe_migrate *m,
> > > >    				     unsigned long npages,
> 
