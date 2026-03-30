Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA856FF495D
	for <intel-xe@archiver.kernel.org>; Mon, 30 Mar 2026 07:45:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C1E410E4C5;
	Mon, 30 Mar 2026 07:45:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nvfdk1YP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 953A110E4C5
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Mar 2026 07:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774856727; x=1806392727;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=0dspvXr+UY+/FarK6zJeOSKLx4zt0RarhdkGTUHqam8=;
 b=Nvfdk1YPk76Uo3LCTX59NMI6IX8c6c9f4Keb0smpG/BX5gScFZ7icoAs
 5ylNjBD/1uCgRfrdelWTZuYGBNYzhTA5guoI0OTrYplxS/bgLxHzLusJN
 Crv/HUwc9aWjAnTRw4y4ArgMBPHcXF+sLHI+1IJNZj7Ev4ZI9ZTqKx3hL
 CPEb1KJY8DZv9EyXE0L2qxUFd6CVq9FydodxpzOUZ1dbZChuVDL6HRvzA
 ntM9lW8B19xdYClveey6zirViWkO7d4Qc69lgOEiFf6p72NMyUosEi2JZ
 51/vP3pjJfQPkrUvSjXfQlnsF+JH81TizSTtQwn8QZhXScrfbdJ5e4z2S Q==;
X-CSE-ConnectionGUID: VDhO/nWdRN2UnY8Kg0mmiQ==
X-CSE-MsgGUID: biuzJMS1SeKLwnxsxV2kgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="86915315"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; d="scan'208";a="86915315"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 00:45:26 -0700
X-CSE-ConnectionGUID: VAAKTFjPS1+opsMdry/vUA==
X-CSE-MsgGUID: WaJqQGqNTIimnpkJvjtE/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; d="scan'208";a="224996765"
Received: from abityuts-desk.ger.corp.intel.com (HELO [10.245.245.95])
 ([10.245.245.95])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 00:45:25 -0700
Message-ID: <52e4f2e61ab7df9b46c1c16ac4dfde929732629a.camel@linux.intel.com>
Subject: Re: [PATCH v2] drm/xe: Drop all mappings for wedged device
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Raag Jadav <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org, himal.prasad.ghimiray@intel.com, 
 matthew.d.roper@intel.com
Date: Mon, 30 Mar 2026 09:45:22 +0200
In-Reply-To: <156d287e-117f-4575-a90c-3aaa233ed670@intel.com>
References: <20260326132816.739363-1-raag.jadav@intel.com>
 <acWi1gL2SI+KLWgP@gsse-cloud1.jf.intel.com>
 <9099f0ef-87a9-42f6-888f-57bb73f6d6ae@intel.com>
 <2759679af38d84c75e43b19ef5a93681f789ff28.camel@linux.intel.com>
 <156d287e-117f-4575-a90c-3aaa233ed670@intel.com>
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

On Fri, 2026-03-27 at 15:03 +0000, Matthew Auld wrote:
> On 27/03/2026 10:41, Thomas Hellstr=C3=B6m wrote:
> > On Fri, 2026-03-27 at 10:18 +0000, Matthew Auld wrote:
> > > On 26/03/2026 21:19, Matthew Brost wrote:
> > > > On Thu, Mar 26, 2026 at 06:58:16PM +0530, Raag Jadav wrote:
> > > > > As per uapi documentation[1], the prerequisite for wedged
> > > > > device
> > > > > is to
> > > > > drop all memory mappings. Follow it.
> > > > >=20
> > > > > [1] Documentation/gpu/drm-uapi.rst
> > > > >=20
> > > > > v2: Also drop CPU mappings (Matthew Auld)
> > > > >=20
> > > > > Fixes: 7bc00751f877 ("drm/xe: Use device wedged event")
> > > > > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > > > > ---
> > > > > =C2=A0=C2=A0 drivers/gpu/drm/xe/xe_bo_evict.c | 8 +++++++-
> > > > > =C2=A0=C2=A0 drivers/gpu/drm/xe/xe_bo_evict.h | 1 +
> > > > > =C2=A0=C2=A0 drivers/gpu/drm/xe/xe_device.c=C2=A0=C2=A0 | 5 +++++
> > > > > =C2=A0=C2=A0 3 files changed, 13 insertions(+), 1 deletion(-)
> > > > >=20
> > > > > diff --git a/drivers/gpu/drm/xe/xe_bo_evict.c
> > > > > b/drivers/gpu/drm/xe/xe_bo_evict.c
> > > > > index 7661fca7f278..f741cda50b2d 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_bo_evict.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_bo_evict.c
> > > > > @@ -270,7 +270,13 @@ int xe_bo_restore_late(struct xe_device
> > > > > *xe)
> > > > > =C2=A0=C2=A0=C2=A0	return ret;
> > > > > =C2=A0=C2=A0 }
> > > > > =C2=A0=C2=A0=20
> > > > > -static void xe_bo_pci_dev_remove_pinned(struct xe_device
> > > > > *xe)
> > > > > +/**
> > > > > + * xe_bo_pci_dev_remove_pinned() - Unmap external bos
> > > > > + * @xe: xe device
> > > > > + *
> > > > > + * Drop dma mappings of all external pinned bos.
> > > > > + */
> > > > > +void xe_bo_pci_dev_remove_pinned(struct xe_device *xe)
> > > > > =C2=A0=C2=A0 {
> > > > > =C2=A0=C2=A0=C2=A0	struct xe_tile *tile;
> > > > > =C2=A0=C2=A0=C2=A0	unsigned int id;
> > > > > diff --git a/drivers/gpu/drm/xe/xe_bo_evict.h
> > > > > b/drivers/gpu/drm/xe/xe_bo_evict.h
> > > > > index e8385cb7f5e9..6ce27e272780 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_bo_evict.h
> > > > > +++ b/drivers/gpu/drm/xe/xe_bo_evict.h
> > > > > @@ -15,6 +15,7 @@ void
> > > > > xe_bo_notifier_unprepare_all_pinned(struct
> > > > > xe_device *xe);
> > > > > =C2=A0=C2=A0 int xe_bo_restore_early(struct xe_device *xe);
> > > > > =C2=A0=C2=A0 int xe_bo_restore_late(struct xe_device *xe);
> > > > > =C2=A0=C2=A0=20
> > > > > +void xe_bo_pci_dev_remove_pinned(struct xe_device *xe);
> > > > > =C2=A0=C2=A0 void xe_bo_pci_dev_remove_all(struct xe_device *xe);
> > > > > =C2=A0=C2=A0=20
> > > > > =C2=A0=C2=A0 int xe_bo_pinned_init(struct xe_device *xe);
> > > > > diff --git a/drivers/gpu/drm/xe/xe_device.c
> > > > > b/drivers/gpu/drm/xe/xe_device.c
> > > > > index b17d4a878686..4c0097f3aefb 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_device.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_device.c
> > > > > @@ -1347,6 +1347,11 @@ void xe_device_declare_wedged(struct
> > > > > xe_device *xe)
> > > > > =C2=A0=C2=A0=C2=A0	for_each_gt(gt, xe, id)
> > > > > =C2=A0=C2=A0=C2=A0		xe_gt_declare_wedged(gt);
> > > > > =C2=A0=C2=A0=20
> > > > > +	/* Drop dma mappings of external bos */
> > > > > +	xe_bo_pci_dev_remove_pinned(xe);
> > > >=20
> > > > Do we even need the part above? unmap_mapping_range() should
> > > > drop
> > > > all
> > > > DMA mappings for the device being wedged, right? In other
> > > > words,
> > > > the device
> > > > should no longer be able to access system memory or other
> > > > devices=E2=80=99
> > > > memory
> > > > via PCIe P2P. I'm not 100% sure about this, though.
> > >=20
> > > AFAIK unmap_mapping_range() is just for the CPU mmap side. It
> > > should
> > > ensure ~everything is refaulted on the next CPU access, so we can
> > > point
> > > to dummy page.
> > >=20
> > > For dma mapping side, I'm still not completely sure what the best
> > > approach is. On the one hand, device is wedged so we should not
> > > really
> > > be doing new GPU access? Ioctls are all blocked, and with below,
> > > CPU
> > > access will be re-directed to dummy page. So perhaps doing
> > > nothing
> > > for
> > > dma mapping side is OK? If we want to actually remove all dma
> > > mappings
> > > for extra safety, I think closest thing is maybe purge all BOs?
> > > Similar
> > > to what we do for an unplug.
> >=20
> > It sounds like, when the device is wedged beyond recovery, not even
> > the
> > unplug / pcie device unbind path should be doing any hwardware
> > accesses. So if that path is fixed up to avoid that, then perhaps
> > we
> > can just unbind the pcie device just after wedging? That is, of
> > course
> > if it's acceptable that the drm_device <-> pcie device association
> > is
> > broken.
>=20
> Yeah, it does seem kind of similar to the unplug flow, just that
> device=20
> is potentially inaccessible through that. All of the devm cleanup,
> plus=20
> already nuking CPU mapppings and the purge stuff is relevant for
> wedge,=20
> I think.
>=20
> Do we know if coredump is maybe interesting after wedge? Maybe that
> is=20
> one potential issue, since it looks like that is attached to the=20
> physical device? AFAICT that would currently get nuked on
> unbind/unplug?=20
> Perhaps if we get into a wedge state, the user might want to collect
> any=20
> logs/coredump first, assuming there are some?
>=20
> Also thinking some more, there is also the dma-buf exported to
> another=20
> device edgecase, like with VRAM? With unplug, I think we move it to=20
> system memory and notify the importer. But here, if device is cooked,
> we=20
> maybe can't actually move it with hw? Do we know if this is handled
> in=20
> some way already?

For dma-buf, there is a new interface landing to "revoke" a dma-buf
completely. I think it's already in the code but not fully sure. We
should take a look at that. Otherwise it sounds like for dynamic
importers at least we need to reject mapping and run move_notify() on=20
all exported dma-buf.

Apart from that, following
https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html#device-wedging

and from discussions with Rodrigo IMO we need to
* Block user-space mappings of device memory - unmap_mapping_range().
* Figure out how to handle device-private SVM pages. At the very least
we need to invalidate the mm ranges, error on new migration attempts
and block dma-setup for peer devices.=20
* Kill all dma-mappings.
* Signal all fences.
* Block and drain user-space accesses (ioctl, read, write, fault).
Looks like much is blocked today but not drained. To drain we need to
be using drm_dev_enter() and drm_dev_exit() and add wedge
synchronization with those.
* Figure out what user-space accesses remaining needed for post-wedge
access of debug / telemetry data.
* Ensure this all doesn't make unplug / devres / dmres cleanup trip.

/Thomas


>=20
> >=20
> > /Thomas
> >=20
> >=20
> >=20
> > >=20
> > > So perhaps xe_bo_pci_dev_remove_all() is better here? Also I
> > > guess
> > > would
> > > need:
> > >=20
> > > @@ -349,7 +349,8 @@ static void xe_evict_flags(struct
> > > ttm_buffer_object
> > > *tbo,
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > >=20
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (device_unplugged && !tbo->b=
ase.dma_buf) {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ((device_unplugged || xe_dev=
ice_wedged(xe)) &&
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 !tbo->b=
ase.dma_buf) {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *placement =3D purge_placement;
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > >=20
> > > >=20
> > > > Matt
> > > >=20
> > > > > +	/* Drop all CPU mappings pointing to this device */
> > > > > +	unmap_mapping_range(xe->drm.anon_inode->i_mapping,
> > > > > 0, 0,
> > > > > 1);
> > > > > +
> > > > > =C2=A0=C2=A0=C2=A0	if (xe_device_wedged(xe)) {
> > > > > =C2=A0=C2=A0=C2=A0		/*
> > > > > =C2=A0=C2=A0=C2=A0		 * XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET is
> > > > > intended for debugging
> > > > > --=20
> > > > > 2.43.0
> > > > >=20
