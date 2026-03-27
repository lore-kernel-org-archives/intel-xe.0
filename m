Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AAD410ED659
	for <intel-xe@archiver.kernel.org>; Fri, 27 Mar 2026 10:41:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C97610ECA0;
	Fri, 27 Mar 2026 10:41:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j04Ut96b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C66010ECA0
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Mar 2026 10:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774608076; x=1806144076;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=oii/UBr5RU0s5WOd1U8F/ty2mMWTSQ7YGGBHwM5l+E0=;
 b=j04Ut96bUE1ANrcJ6QwqgzKCV23GE2G/MvjIk0SM26XOq/3BRYNxgNpQ
 m0YQ0GL4OrNcR0AM1rqWlfXoDGXm6qw3apCM0F/6/amlZGMyJvShnoMM+
 ugg06jMh00jSsb5XXzVmJpGU6EDKMdqWyLWEJryCqC95sv0KrB6Ib6cOH
 Iq8wnxbuaYoPmCTBEDyhFkSCdLYH+Fb2JMEiL2dp36oxWgriFSivFQ/Oa
 qljDHJHT+rjTcXKu5wjcwCgXQ29iRwP19dtm0ytn5x6roYL6gSfvmmwBY
 3PWiXf19KxQkW3dPksCCcIhZ614Td83mnl7kYIGYkNvwMo14nLtSONbXV Q==;
X-CSE-ConnectionGUID: EfNBEjlbTnu4d5SJCo7AQg==
X-CSE-MsgGUID: 4vB7Xu/VRi2obbWSVmj37w==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="63235436"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; d="scan'208";a="63235436"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 03:41:16 -0700
X-CSE-ConnectionGUID: Pn7jw9F9T+2z906lkFgmIA==
X-CSE-MsgGUID: 0VPFuIVCQsGCtOsil5lnRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; d="scan'208";a="226886233"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO [10.245.244.146])
 ([10.245.244.146])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 03:41:14 -0700
Message-ID: <2759679af38d84c75e43b19ef5a93681f789ff28.camel@linux.intel.com>
Subject: Re: [PATCH v2] drm/xe: Drop all mappings for wedged device
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Raag Jadav <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org, himal.prasad.ghimiray@intel.com, 
 matthew.d.roper@intel.com
Date: Fri, 27 Mar 2026 11:41:11 +0100
In-Reply-To: <9099f0ef-87a9-42f6-888f-57bb73f6d6ae@intel.com>
References: <20260326132816.739363-1-raag.jadav@intel.com>
 <acWi1gL2SI+KLWgP@gsse-cloud1.jf.intel.com>
 <9099f0ef-87a9-42f6-888f-57bb73f6d6ae@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
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

On Fri, 2026-03-27 at 10:18 +0000, Matthew Auld wrote:
> On 26/03/2026 21:19, Matthew Brost wrote:
> > On Thu, Mar 26, 2026 at 06:58:16PM +0530, Raag Jadav wrote:
> > > As per uapi documentation[1], the prerequisite for wedged device
> > > is to
> > > drop all memory mappings. Follow it.
> > >=20
> > > [1] Documentation/gpu/drm-uapi.rst
> > >=20
> > > v2: Also drop CPU mappings (Matthew Auld)
> > >=20
> > > Fixes: 7bc00751f877 ("drm/xe: Use device wedged event")
> > > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > > ---
> > > =C2=A0 drivers/gpu/drm/xe/xe_bo_evict.c | 8 +++++++-
> > > =C2=A0 drivers/gpu/drm/xe/xe_bo_evict.h | 1 +
> > > =C2=A0 drivers/gpu/drm/xe/xe_device.c=C2=A0=C2=A0 | 5 +++++
> > > =C2=A0 3 files changed, 13 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/xe/xe_bo_evict.c
> > > b/drivers/gpu/drm/xe/xe_bo_evict.c
> > > index 7661fca7f278..f741cda50b2d 100644
> > > --- a/drivers/gpu/drm/xe/xe_bo_evict.c
> > > +++ b/drivers/gpu/drm/xe/xe_bo_evict.c
> > > @@ -270,7 +270,13 @@ int xe_bo_restore_late(struct xe_device *xe)
> > > =C2=A0=C2=A0	return ret;
> > > =C2=A0 }
> > > =C2=A0=20
> > > -static void xe_bo_pci_dev_remove_pinned(struct xe_device *xe)
> > > +/**
> > > + * xe_bo_pci_dev_remove_pinned() - Unmap external bos
> > > + * @xe: xe device
> > > + *
> > > + * Drop dma mappings of all external pinned bos.
> > > + */
> > > +void xe_bo_pci_dev_remove_pinned(struct xe_device *xe)
> > > =C2=A0 {
> > > =C2=A0=C2=A0	struct xe_tile *tile;
> > > =C2=A0=C2=A0	unsigned int id;
> > > diff --git a/drivers/gpu/drm/xe/xe_bo_evict.h
> > > b/drivers/gpu/drm/xe/xe_bo_evict.h
> > > index e8385cb7f5e9..6ce27e272780 100644
> > > --- a/drivers/gpu/drm/xe/xe_bo_evict.h
> > > +++ b/drivers/gpu/drm/xe/xe_bo_evict.h
> > > @@ -15,6 +15,7 @@ void xe_bo_notifier_unprepare_all_pinned(struct
> > > xe_device *xe);
> > > =C2=A0 int xe_bo_restore_early(struct xe_device *xe);
> > > =C2=A0 int xe_bo_restore_late(struct xe_device *xe);
> > > =C2=A0=20
> > > +void xe_bo_pci_dev_remove_pinned(struct xe_device *xe);
> > > =C2=A0 void xe_bo_pci_dev_remove_all(struct xe_device *xe);
> > > =C2=A0=20
> > > =C2=A0 int xe_bo_pinned_init(struct xe_device *xe);
> > > diff --git a/drivers/gpu/drm/xe/xe_device.c
> > > b/drivers/gpu/drm/xe/xe_device.c
> > > index b17d4a878686..4c0097f3aefb 100644
> > > --- a/drivers/gpu/drm/xe/xe_device.c
> > > +++ b/drivers/gpu/drm/xe/xe_device.c
> > > @@ -1347,6 +1347,11 @@ void xe_device_declare_wedged(struct
> > > xe_device *xe)
> > > =C2=A0=C2=A0	for_each_gt(gt, xe, id)
> > > =C2=A0=C2=A0		xe_gt_declare_wedged(gt);
> > > =C2=A0=20
> > > +	/* Drop dma mappings of external bos */
> > > +	xe_bo_pci_dev_remove_pinned(xe);
> >=20
> > Do we even need the part above? unmap_mapping_range() should drop
> > all
> > DMA mappings for the device being wedged, right? In other words,
> > the device
> > should no longer be able to access system memory or other devices=E2=80=
=99
> > memory
> > via PCIe P2P. I'm not 100% sure about this, though.
>=20
> AFAIK unmap_mapping_range() is just for the CPU mmap side. It should=20
> ensure ~everything is refaulted on the next CPU access, so we can
> point=20
> to dummy page.
>=20
> For dma mapping side, I'm still not completely sure what the best=20
> approach is. On the one hand, device is wedged so we should not
> really=20
> be doing new GPU access? Ioctls are all blocked, and with below, CPU=20
> access will be re-directed to dummy page. So perhaps doing nothing
> for=20
> dma mapping side is OK? If we want to actually remove all dma
> mappings=20
> for extra safety, I think closest thing is maybe purge all BOs?
> Similar=20
> to what we do for an unplug.

It sounds like, when the device is wedged beyond recovery, not even the
unplug / pcie device unbind path should be doing any hwardware
accesses. So if that path is fixed up to avoid that, then perhaps we
can just unbind the pcie device just after wedging? That is, of course
if it's acceptable that the drm_device <-> pcie device association is
broken.

/Thomas



>=20
> So perhaps xe_bo_pci_dev_remove_all() is better here? Also I guess
> would=20
> need:
>=20
> @@ -349,7 +349,8 @@ static void xe_evict_flags(struct
> ttm_buffer_object=20
> *tbo,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 return;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>=20
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (device_unplugged && !tbo->base.=
dma_buf) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ((device_unplugged || xe_device_=
wedged(xe)) &&
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 !tbo->base.=
dma_buf) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 *placement =3D purge_placement;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 return;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>=20
> >=20
> > Matt
> >=20
> > > +	/* Drop all CPU mappings pointing to this device */
> > > +	unmap_mapping_range(xe->drm.anon_inode->i_mapping, 0, 0,
> > > 1);
> > > +
> > > =C2=A0=C2=A0	if (xe_device_wedged(xe)) {
> > > =C2=A0=C2=A0		/*
> > > =C2=A0=C2=A0		 * XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET is
> > > intended for debugging
> > > --=20
> > > 2.43.0
> > >=20
