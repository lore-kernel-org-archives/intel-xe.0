Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D07EA10ED674
	for <intel-xe@archiver.kernel.org>; Fri, 27 Mar 2026 14:24:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B34710E21B;
	Fri, 27 Mar 2026 14:24:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SAjQb6BM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7E0710E21B
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Mar 2026 14:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774621472; x=1806157472;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=THDCLcocfnAmVg4//UoVmDrSiwRfbOgarN26W5icMiY=;
 b=SAjQb6BMvL2xBi2VIsnpl+PjJOypPgcb9yUESkaSpqW22ymvdyOap7Eq
 /CkKMM3sAAe4ZTfqyDdQc5uwSyvFRy5oR9/uTzZl09cGQugG0MVcx5hVs
 5yAUJNCAmeQPmE9ytAUqhR6xO9QVPNbFemimqRIJ93cLgzNna+CDffBZW
 8PImr26aUn+5nunVaLX39InHCOCkYbV2W/Gak6VqjHasvXebgaO8R8RC7
 x00P1FWSroQZvFNBJI/ZsO781SweA4NcSJkPzpBGrZ4BvQB6uh7qACf6m
 anJ4FbBDEdrgpvyt6C7OPZjJU/oI/GdYOGE/vhsu+0kFaAGRrqrCT/gwQ g==;
X-CSE-ConnectionGUID: 0FKUG1igSwWx+WVLiZLhrw==
X-CSE-MsgGUID: Kp9KQ/6oSWezwhJ6m+mfpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="75661520"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; d="scan'208";a="75661520"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 07:24:32 -0700
X-CSE-ConnectionGUID: fPaJGl/rSjiOzxQ9+dY9ag==
X-CSE-MsgGUID: iqnGizT5S5WLbIlfCav3eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; d="scan'208";a="248366625"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 07:24:29 -0700
Date: Fri, 27 Mar 2026 15:24:27 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 intel-xe@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 matthew.d.roper@intel.com
Subject: Re: [PATCH v2] drm/xe: Drop all mappings for wedged device
Message-ID: <acaTGxscd9J0cBrw@black.igk.intel.com>
References: <20260326132816.739363-1-raag.jadav@intel.com>
 <acWi1gL2SI+KLWgP@gsse-cloud1.jf.intel.com>
 <9099f0ef-87a9-42f6-888f-57bb73f6d6ae@intel.com>
 <2759679af38d84c75e43b19ef5a93681f789ff28.camel@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2759679af38d84c75e43b19ef5a93681f789ff28.camel@linux.intel.com>
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

On Fri, Mar 27, 2026 at 11:41:11AM +0100, Thomas Hellström wrote:
> On Fri, 2026-03-27 at 10:18 +0000, Matthew Auld wrote:
> > On 26/03/2026 21:19, Matthew Brost wrote:
> > > On Thu, Mar 26, 2026 at 06:58:16PM +0530, Raag Jadav wrote:
> > > > As per uapi documentation[1], the prerequisite for wedged device
> > > > is to
> > > > drop all memory mappings. Follow it.
> > > > 
> > > > [1] Documentation/gpu/drm-uapi.rst
> > > > 
> > > > v2: Also drop CPU mappings (Matthew Auld)
> > > > 
> > > > Fixes: 7bc00751f877 ("drm/xe: Use device wedged event")
> > > > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > > > ---
> > > >   drivers/gpu/drm/xe/xe_bo_evict.c | 8 +++++++-
> > > >   drivers/gpu/drm/xe/xe_bo_evict.h | 1 +
> > > >   drivers/gpu/drm/xe/xe_device.c   | 5 +++++
> > > >   3 files changed, 13 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_bo_evict.c
> > > > b/drivers/gpu/drm/xe/xe_bo_evict.c
> > > > index 7661fca7f278..f741cda50b2d 100644
> > > > --- a/drivers/gpu/drm/xe/xe_bo_evict.c
> > > > +++ b/drivers/gpu/drm/xe/xe_bo_evict.c
> > > > @@ -270,7 +270,13 @@ int xe_bo_restore_late(struct xe_device *xe)
> > > >   	return ret;
> > > >   }
> > > >   
> > > > -static void xe_bo_pci_dev_remove_pinned(struct xe_device *xe)
> > > > +/**
> > > > + * xe_bo_pci_dev_remove_pinned() - Unmap external bos
> > > > + * @xe: xe device
> > > > + *
> > > > + * Drop dma mappings of all external pinned bos.
> > > > + */
> > > > +void xe_bo_pci_dev_remove_pinned(struct xe_device *xe)
> > > >   {
> > > >   	struct xe_tile *tile;
> > > >   	unsigned int id;
> > > > diff --git a/drivers/gpu/drm/xe/xe_bo_evict.h
> > > > b/drivers/gpu/drm/xe/xe_bo_evict.h
> > > > index e8385cb7f5e9..6ce27e272780 100644
> > > > --- a/drivers/gpu/drm/xe/xe_bo_evict.h
> > > > +++ b/drivers/gpu/drm/xe/xe_bo_evict.h
> > > > @@ -15,6 +15,7 @@ void xe_bo_notifier_unprepare_all_pinned(struct
> > > > xe_device *xe);
> > > >   int xe_bo_restore_early(struct xe_device *xe);
> > > >   int xe_bo_restore_late(struct xe_device *xe);
> > > >   
> > > > +void xe_bo_pci_dev_remove_pinned(struct xe_device *xe);
> > > >   void xe_bo_pci_dev_remove_all(struct xe_device *xe);
> > > >   
> > > >   int xe_bo_pinned_init(struct xe_device *xe);
> > > > diff --git a/drivers/gpu/drm/xe/xe_device.c
> > > > b/drivers/gpu/drm/xe/xe_device.c
> > > > index b17d4a878686..4c0097f3aefb 100644
> > > > --- a/drivers/gpu/drm/xe/xe_device.c
> > > > +++ b/drivers/gpu/drm/xe/xe_device.c
> > > > @@ -1347,6 +1347,11 @@ void xe_device_declare_wedged(struct
> > > > xe_device *xe)
> > > >   	for_each_gt(gt, xe, id)
> > > >   		xe_gt_declare_wedged(gt);
> > > >   
> > > > +	/* Drop dma mappings of external bos */
> > > > +	xe_bo_pci_dev_remove_pinned(xe);
> > > 
> > > Do we even need the part above? unmap_mapping_range() should drop
> > > all
> > > DMA mappings for the device being wedged, right? In other words,
> > > the device
> > > should no longer be able to access system memory or other devices’
> > > memory
> > > via PCIe P2P. I'm not 100% sure about this, though.
> > 
> > AFAIK unmap_mapping_range() is just for the CPU mmap side. It should 
> > ensure ~everything is refaulted on the next CPU access, so we can
> > point 
> > to dummy page.
> > 
> > For dma mapping side, I'm still not completely sure what the best 
> > approach is. On the one hand, device is wedged so we should not
> > really 
> > be doing new GPU access? Ioctls are all blocked, and with below, CPU 
> > access will be re-directed to dummy page. So perhaps doing nothing
> > for 
> > dma mapping side is OK? If we want to actually remove all dma
> > mappings 
> > for extra safety, I think closest thing is maybe purge all BOs?
> > Similar 
> > to what we do for an unplug.

In cases where we have huge enough memory in utilization, I'm wondering
if it'll be worth the overhead to purge them all? With wedged device we're
already preventing new allocations, so would it be reasonable to just make
existing bos inaccessible by dropping their mappings and defer the purging
(which I assume already happens on unbind)?

> It sounds like, when the device is wedged beyond recovery, not even the
> unplug / pcie device unbind path should be doing any hwardware
> accesses. So if that path is fixed up to avoid that, then perhaps we
> can just unbind the pcie device just after wedging? That is, of course
> if it's acceptable that the drm_device <-> pcie device association is
> broken.

Unbind already takes care of the cleanup, so the expectation with wedging
is to do the bare minimum to error things out and make them inaccessible.

Raag

> > So perhaps xe_bo_pci_dev_remove_all() is better here? Also I guess
> > would 
> > need:
> > 
> > @@ -349,7 +349,8 @@ static void xe_evict_flags(struct
> > ttm_buffer_object 
> > *tbo,
> >                  return;
> >          }
> > 
> > -       if (device_unplugged && !tbo->base.dma_buf) {
> > +       if ((device_unplugged || xe_device_wedged(xe)) &&
> > +           !tbo->base.dma_buf) {
> >                  *placement = purge_placement;
> >                  return;
> >          }
> > 
> > > 
> > > Matt
> > > 
> > > > +	/* Drop all CPU mappings pointing to this device */
> > > > +	unmap_mapping_range(xe->drm.anon_inode->i_mapping, 0, 0,
> > > > 1);
> > > > +
> > > >   	if (xe_device_wedged(xe)) {
> > > >   		/*
> > > >   		 * XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET is
> > > > intended for debugging
> > > > -- 
> > > > 2.43.0
> > > > 
