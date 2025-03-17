Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F306C35FF3
	for <intel-xe@archiver.kernel.org>; Mon, 17 Mar 2025 16:16:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 430FE10E189;
	Mon, 17 Mar 2025 16:16:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mpd3JamW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 438FE10E189
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Mar 2025 16:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742228193; x=1773764193;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=J86iIWvgMOd4pBvP9IS535KTuQ0xOj4UBBGzbyXvvH4=;
 b=mpd3JamWpuT8rkqMLpBjthW8OQkmhmxBhIZvlzIVyFwl6oE4rTxiqyeK
 KPPY38Yoi/OclOCx03x0Nx9j8bxsZG13fEhcH6w0g1O4OJojAn/u92mjh
 X+nUYNKH0nLyEird0ccMf70gLMCM7EE0RCZ9KkR+n4KuD9m/5Y45lbgHb
 uCQa91V0rPPlW9r/6Zdl6graLAq5a07lpNA28BuCYxyQOUNY/QlF7SA2v
 11oPtnUlscMIW4FpTtuo15/QBkFUmxCFJodCX01/bIOQbIvJZ6uWQDcFV
 NaGwmYqdOIDx6Rx6AecytySe/SdMflOn12ucTs0eMuutjctO//0HbFm4C A==;
X-CSE-ConnectionGUID: i7A3xIkXT7yTwCM4Ww3Nzw==
X-CSE-MsgGUID: 7VJEmHCDS8edgZDZ9U2U+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="68689648"
X-IronPort-AV: E=Sophos;i="6.14,254,1736841600"; d="scan'208";a="68689648"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2025 09:16:33 -0700
X-CSE-ConnectionGUID: bJoiP5AKRNu8ddGRnaFuCA==
X-CSE-MsgGUID: GrdueWCgQhS4pFHetIZeLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,254,1736841600"; d="scan'208";a="122715554"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO [10.245.246.97])
 ([10.245.246.97])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2025 09:16:31 -0700
Message-ID: <1d313655ac3c7e0444ccd354166fa83d2dc6244a.camel@linux.intel.com>
Subject: Re: [PATCH 3/5] drm/xe/bo: Add a bo remove callback
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, Matthew Brost <matthew.brost@intel.com>
Date: Mon, 17 Mar 2025 17:16:29 +0100
In-Reply-To: <46faf433-a7d7-480e-be87-4989c5162ea1@intel.com>
References: <20250317104132.8200-1-thomas.hellstrom@linux.intel.com>
 <20250317104132.8200-4-thomas.hellstrom@linux.intel.com>
 <46faf433-a7d7-480e-be87-4989c5162ea1@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
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

On Mon, 2025-03-17 at 15:58 +0000, Matthew Auld wrote:
> On 17/03/2025 10:41, Thomas Hellstr=C3=B6m wrote:
> > On device unbind, migrate exported bos, including pagemap bos to
> > system. This allows importers to take proper action without
> > disruption. In particular, SVM clients on remote devices may
> > continue as if nothing happened, and can chose a different
> > placement.
> >=20
> > The evict_flags() placement is chosen in such a way that bos that
> > aren't exported are purged.
> >=20
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
>=20
> > ---
> > =C2=A0 drivers/gpu/drm/xe/xe_bo.c=C2=A0=C2=A0=C2=A0=C2=A0 | 96
> > +++++++++++++++++++++++++++++++++-
> > =C2=A0 drivers/gpu/drm/xe/xe_bo.h=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +
> > =C2=A0 drivers/gpu/drm/xe/xe_device.c |=C2=A0 2 +
> > =C2=A0 3 files changed, 99 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c
> > b/drivers/gpu/drm/xe/xe_bo.c
> > index 64f9c936eea0..c7c206041632 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -55,6 +55,8 @@ static struct ttm_placement sys_placement =3D {
> > =C2=A0=C2=A0	.placement =3D &sys_placement_flags,
> > =C2=A0 };
> > =C2=A0=20
> > +static struct ttm_placement purge_placement;
> > +
> > =C2=A0 static const struct ttm_place tt_placement_flags[] =3D {
> > =C2=A0=C2=A0	{
> > =C2=A0=C2=A0		.fpfn =3D 0,
> > @@ -281,6 +283,8 @@ int xe_bo_placement_for_flags(struct xe_device
> > *xe, struct xe_bo *bo,
> > =C2=A0 static void xe_evict_flags(struct ttm_buffer_object *tbo,
> > =C2=A0=C2=A0			=C2=A0=C2=A0 struct ttm_placement *placement)
> > =C2=A0 {
> > +	struct xe_device *xe =3D container_of(tbo->bdev,
> > typeof(*xe), ttm);
> > +	bool device_unplugged =3D drm_dev_is_unplugged(&xe->drm);
> > =C2=A0=C2=A0	struct xe_bo *bo;
> > =C2=A0=20
> > =C2=A0=C2=A0	if (!xe_bo_is_xe_bo(tbo)) {
> > @@ -290,7 +294,7 @@ static void xe_evict_flags(struct
> > ttm_buffer_object *tbo,
> > =C2=A0=C2=A0			return;
> > =C2=A0=C2=A0		}
> > =C2=A0=20
> > -		*placement =3D sys_placement;
> > +		*placement =3D device_unplugged ? purge_placement :
> > sys_placement;
> > =C2=A0=C2=A0		return;
> > =C2=A0=C2=A0	}
> > =C2=A0=20
> > @@ -300,6 +304,11 @@ static void xe_evict_flags(struct
> > ttm_buffer_object *tbo,
> > =C2=A0=C2=A0		return;
> > =C2=A0=C2=A0	}
> > =C2=A0=20
> > +	if (device_unplugged && !tbo->base.dma_buf) {
> > +		*placement =3D purge_placement;
> > +		return;
> > +	}
>=20
> > +
> > =C2=A0=C2=A0	/*
> > =C2=A0=C2=A0	 * For xe, sg bos that are evicted to system just triggers
> > a
> > =C2=A0=C2=A0	 * rebind of the sg list upon subsequent validation to
> > XE_PL_TT.
> > @@ -657,11 +666,20 @@ static int xe_bo_move_dmabuf(struct
> > ttm_buffer_object *ttm_bo,
> > =C2=A0=C2=A0	struct xe_ttm_tt *xe_tt =3D container_of(ttm_bo->ttm, stru=
ct
> > xe_ttm_tt,
> > =C2=A0=C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ttm);
> > =C2=A0=C2=A0	struct xe_device *xe =3D ttm_to_xe_device(ttm_bo->bdev);
> > +	bool device_unplugged =3D drm_dev_is_unplugged(&xe->drm);
> > =C2=A0=C2=A0	struct sg_table *sg;
> > =C2=A0=20
> > =C2=A0=C2=A0	xe_assert(xe, attach);
> > =C2=A0=C2=A0	xe_assert(xe, ttm_bo->ttm);
> > =C2=A0=20
> > +	if (device_unplugged && new_res->mem_type =3D=3D XE_PL_SYSTEM
> > &&
> > +	=C2=A0=C2=A0=C2=A0 ttm_bo->sg) {
> > +		dma_resv_wait_timeout(ttm_bo->base.resv,
> > DMA_RESV_USAGE_BOOKKEEP,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 false,
> > MAX_SCHEDULE_TIMEOUT);
> > +		dma_buf_unmap_attachment(attach, ttm_bo->sg,
> > DMA_BIDIRECTIONAL);
> > +		ttm_bo->sg =3D NULL;
> > +	}
>=20
> > +
> > =C2=A0=C2=A0	if (new_res->mem_type =3D=3D XE_PL_SYSTEM)
> > =C2=A0=C2=A0		goto out;
> > =C2=A0=20
> > @@ -2945,6 +2963,82 @@ void
> > xe_bo_runtime_pm_release_mmap_offset(struct xe_bo *bo)
> > =C2=A0=C2=A0	list_del_init(&bo->vram_userfault_link);
> > =C2=A0 }
> > =C2=A0=20
> > +static void xe_bo_dma_unmap_pinned(struct xe_device *xe)
>=20
> Should we prefix this with xe_device_ or something?
> xe_device_unmap_pinned_bo() ?

Hmm, yes, while it doesn't take a bo as argument, I think it should
reside in the bo subsystem. Let me check whether we should split this
up and have the loops elsewhere.

>=20
> > +{
> > +	struct list_head still_in_list;
> > +
> > +	INIT_LIST_HEAD(&still_in_list);
>=20
> LIST_HEAD(still_in_list);

Right. Will fix.
>=20
>=20
> > +	spin_lock(&xe->pinned.lock);
> > +	for (;;) {
> > +		struct xe_bo *bo =3D list_first_entry_or_null(&xe-
> > >pinned.kernel_bo_present,
> > +							=C2=A0=C2=A0=C2=A0
> > typeof(*bo), pinned_link);
> > +		struct ttm_buffer_object *ttm_bo;
> > +		struct ttm_tt *tt;
> > +		struct xe_ttm_tt *xe_tt;
> > +
> > +		if (!bo)
> > +			break;
> > +
> > +		list_move_tail(&bo->pinned_link, &still_in_list);
> > +		xe_bo_get(bo);
> > +		spin_unlock(&xe->pinned.lock);
> > +
> > +		xe_bo_lock(bo, false);
> > +		ttm_bo =3D &bo->ttm;
> > +		tt =3D ttm_bo->ttm;
> > +		if (tt) {
> > +			xe_ttm_bo_delete_mem_notify(ttm_bo);
>=20
> Do we actually need this?

It's for imported pinned dma-bufs, I don't think we have any of these
ATM, but might in the future I guess. OFC I can structure that a bit
nicer.

>=20
> > +			xe_tt =3D container_of(tt, typeof(*xe_tt),
> > ttm);
> > +			if (xe_tt->sg) {
> > +				dma_unmap_sgtable(xe_tt->xe-
> > >drm.dev, xe_tt->sg,
> > +						=C2=A0
> > DMA_BIDIRECTIONAL, 0);
> > +				sg_free_table(xe_tt->sg);
> > +				xe_tt->sg =3D NULL;
> > +			}
>=20
> Would it make sense to also call ttm_tt_unpopulate() here, so we nuke
> the pages?

I think we arrived at not nuking the pages for exported dma-bufs. For
the other use-cases I guess it's hard to tell: Is there a chance that
whatever needed the buffer pinned can issue a stray write?

I still think the best approach would to ensure that those subsystems
used devm_ managed resources rather than drmm_-managed resources.
Meanwhile, I can perhaps add a comment about that?

>=20
> > +		}
> > +
> > +		xe_bo_unlock(bo);
> > +		xe_bo_put(bo);
> > +		spin_lock(&xe->pinned.lock);
> > +	}
> > +	list_splice_tail(&still_in_list, &xe-
> > >pinned.kernel_bo_present);
> > +	spin_unlock(&xe->pinned.lock);
> > +}
>=20
> We could potentially move this type of thing into xe_bo_evict.c?

Could perhaps be the best choice, actually.

>=20
> > +
> > +/**
> > + * xe_bo_remove() - Handle bos when the pci_device is about to be
> > removed
> > + * @xe: The xe device.
> > + *
> > + * On pci_device removal we need to drop all dma mappings and move
> > + * the data of exported bos out to system. This includes SVM bos
> > and
> > + * exported dma-buf bos. This is done by evicting all bos, but
> > + * the evict placement in xe_evict_flags() is chosen such that all
> > + * bos except those mentioned are purged, and thus their memory
> > + * is released.
> > + *
> > + * For pinned bos, we're unmapping dma.
> > + */
> > +void xe_bo_remove(struct xe_device *xe)
>=20
> xe_device_remove_bo() ?

Will look into it.

>=20
> > +{
> > +	unsigned int mem_type;
> > +
> > +	/*
> > +	 * Move pagemap bos and exported dma-buf to system.
>=20
> ..and purge everything else."

Will add.

Thanks for reviewing!
/Thomas

