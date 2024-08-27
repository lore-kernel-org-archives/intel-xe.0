Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99168C52D6F
	for <intel-xe@archiver.kernel.org>; Tue, 27 Aug 2024 09:35:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F36A10E2E0;
	Tue, 27 Aug 2024 09:35:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OYZudB9B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 427E410E2D5
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Aug 2024 09:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724751338; x=1756287338;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=2ycNHvG2K6TzJ/AXl3lmdOOtDfBDhEz4FIAqASEOo54=;
 b=OYZudB9B4psZf8FP1HLzgH+VS1Dsu55kkWc7WjTU2Owmr73rpplWvt24
 awFT/PNhX8afZzGt3dJGRI+DuNJhMUcoe0DL5pDUOhVcdZgrXLHs/HsbA
 JbL0nMLW9oxWdiSdcKkX6YQG5xpM4tg8Z+24PBruK3qoYP1j0RGKOCvEr
 Cg17X4RSNb8LrrdZpB/n9A516+hMRyu7/dQhWTTCNPM2pDkzZYJApQMt0
 B1aKkq3oTpn/3TyGWvj+rQLV3FD+C0Ys9p0C18aRB/yMBd3WRPDVb4T6c
 yjiRmi6qnGw2WfvtAc9aKKxfx4HzylIobXcG9KGr96K3A95sEWIL/jCCd w==;
X-CSE-ConnectionGUID: WJb2OUg/SFm0LcrwaKHNlQ==
X-CSE-MsgGUID: f+IU+dppTsKMmhg8MM2c7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="27012704"
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="27012704"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 02:35:38 -0700
X-CSE-ConnectionGUID: UJfGZCT4Q66sTcrPxLd6Lw==
X-CSE-MsgGUID: 5TUsNsaNQRqF8pvPRgtahQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="62967437"
Received: from dhhellew-desk2.ger.corp.intel.com.ger.corp.intel.com (HELO
 [10.245.244.61]) ([10.245.244.61])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 02:35:36 -0700
Message-ID: <5977a4c4584f1ea755364253f3ec872f384808b9.camel@linux.intel.com>
Subject: Re: [RFC PATCH] drm/xe/lnl: Implement clear-on-free for pooled BOs
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Nirmoy Das <nirmoy.das@linux.intel.com>, Nirmoy Das
 <nirmoy.das@intel.com>,  intel-xe@lists.freedesktop.org, Matthew Auld
 <matthew.auld@intel.com>
Date: Tue, 27 Aug 2024 11:35:33 +0200
In-Reply-To: <Zsy5p5w8nqMmIwwU@DUT025-TGLU.fm.intel.com>
References: <20240822124244.10554-1-nirmoy.das@intel.com>
 <7645111403a453311b16ff2b11d49cb63a74518f.camel@linux.intel.com>
 <a20245c6-7628-470d-bd6e-4e719dbd198f@linux.intel.com>
 <e76049b03dca87599346ec1db3ac6bfec97efee3.camel@linux.intel.com>
 <Zsy5p5w8nqMmIwwU@DUT025-TGLU.fm.intel.com>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
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

On Mon, 2024-08-26 at 17:21 +0000, Matthew Brost wrote:
> On Mon, Aug 26, 2024 at 10:36:24AM +0200, Thomas Hellstr=C3=B6m wrote:
> > On Mon, 2024-08-26 at 10:26 +0200, Nirmoy Das wrote:
> > > Hi Thomas,
> > >=20
> > > On 8/23/2024 11:38 AM, Thomas Hellstr=C3=B6m wrote:
> > > > Hi, Nirmoy,
> > > >=20
> > > > On Thu, 2024-08-22 at 14:42 +0200, Nirmoy Das wrote:
> > > > > Implement GPU clear-on-free for pooled system pages in Xe.
> > > > >=20
> > > > > Ensure proper use of TTM_TT_FLAG_CLEARED_ON_FREE by
> > > > > leveraging
> > > > > ttm_device_funcs.release_notify() for GPU clear-on-free. If
> > > > > GPU
> > > > > clear
> > > > > fails, xe_ttm_tt_unpopulate() will fallback to CPU clear.
> > > > >=20
> > > > > Clear-on-free is only relevant for pooled pages as driver
> > > > > needs
> > > > > to
> > > > > give
> > > > > back those pages. So do clear-on-free only for such BOs and
> > > > > keep
> > > > > doing
> > > > > clear-on-alloc for ttm_cached type BOs
> > > > >=20
> > > > > Cc: Matthew Auld <matthew.auld@intel.com>
> > > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > > > Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > > > > Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> > > > While this would probably work, I don't immediately see the
> > > > benefit
> > > > over CPU clearing, since we have no way of combining this with
> > > > the
> > > > CCS
> > > > clear, right?
> > >=20
> > >=20
> > > If XE/ttm could do clear-on-free(data+CCS) with GPU all the time
> > > then
> > > I=20
> > > think we could
> > >=20
> > > skip ccs clearing on alloc, assuming only GPU access modifies a
> > > CCS=20
> > > state and on boot CCS region
> > >=20
> > > is zeroed. I think that can't be guaranteed so we have to clear
> > > ccs
> > > on=20
> > > alloc. I agree, there won't be much
> > >=20
> > > latency benefit of doing clear-on-free for ccs devices. I will
> > > still
> > > try=20
> > > to run some tests to validate it, I have done that for this RFC.
> >=20
> > OK, yes this would probably work. Do we need to clear all CCS on
> > module
> > load or can we safely assume that no useful info is left in the CCS
> > memory at that time?
> >=20
> > >=20
> > >=20
> > > I've discussed this with Ron and it seems there is on going
> > > conversation=20
> > > if there is a way to avoid ccs clearing if data is zeroed.
> > >=20
> > > Let's see how that goes.
> > >=20
> > >=20
> > > > =C2=A0 So the clearing latency will most probably be increased,
> > > > but the bo releasing thread won't see that because the waiting
> > > > for
> > > > clear is offloaded to the TTM delayed destroy mechanism.
> > > >=20
> > > > Also, once we've dropped the gem refcount to zero, the gem
> > > > members
> > > > of
> > > > the object, including bo_move, are strictly not valid anymore
> > > > and
> > > > shouldn't be used.
> > >=20
> > >=20
> > > Could you please=C2=A0 expand this? I am not seeing the connection
> > > between
> > > bo_move and refcount.
> > >=20
> > > Are you saying release_notify is not the right place to do this ?
> >=20
> > Yes. At release_notify, the gem refcount has dropped to zero, and
> > we
> > don't allow calling bo_move at that point, as the driver might want
> > to
>=20
> But this patch isn't calling bo_move - it directly calls
> xe_migrate_clear. As far I can tell this function only touches TTM
> owned
> fields (e.g. ttm_resource and ttm_tt). I would think that should be
> safe
> as there shouldn't be fully released until release_notify returns.

Yes, hmm, I incorrectly got the impression that release_notify called
bo_move to do the clearing.

Anyway as long as we can clear using only the struct ttm_buffer_object
base class we should be safe.

/Thomas


>=20
> Matt
>=20
> > do some cleanup in the gem_release before putting the last ttm_bo
> > reference.
> >=20
> > Thanks,
> > Thomas
> >=20
> >=20
> > >=20
> > > > If we want to try to improve freeing latency by offloading the
> > > > clearing
> > > > on free to a separate CPU thread, though, maybe we could
> > > > discuss
> > > > with
> > > > Christian to always (or if a flag in the ttm device requests
> > > > it)
> > > > take
> > > > the TTM delayed destruction path for bos with pooled pages,
> > > > rather
> > > > than
> > > > to free them sync, something along the lines of:
> > > >=20
> > > > diff --git a/drivers/gpu/drm/ttm/ttm_bo.c
> > > > b/drivers/gpu/drm/ttm/ttm_bo.c
> > > > index 320592435252..fca69ec1740d 100644
> > > > --- a/drivers/gpu/drm/ttm/ttm_bo.c
> > > > +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> > > > @@ -271,7 +271,7 @@ static void ttm_bo_release(struct kref
> > > > *kref)
> > > > =C2=A0=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!dma_resv_test_signaled(bo->base.resv,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > > > DMA_RESV_USAGE_BOOKKEEP) ||
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (want_init_on_free() && (bo->ttm=
 !=3D NULL))
> > > > ||
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (bo->ttm && (want_init_on_free()=
 || bo-
> > > > >ttm-
> > > > > caching !=3D ttm_cached)) ||
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bo->type =3D=3D ttm_=
bo_type_sg ||
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 !dma_resv_trylock(bo=
->base.resv)) {
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 /* The BO is not idle, resurrect it
> > > > for
> > > > delayed
> > > > destroy */
> > > >=20
> > > > Would ofc require some substantial proven latency gain, though.
> > > > Overall
> > > > system cpu usage would probably not improve.
> > >=20
> > >=20
> > > I will run some tests with the above change and get back.
> > >=20
> > >=20
> > > Thanks,
> > >=20
> > > Nirmoy
> > >=20
> > > >=20
> > > > /Thomas
> > > >=20
> > > >=20
> > > > > ---
> > > > > =C2=A0=C2=A0drivers/gpu/drm/xe/xe_bo.c | 101
> > > > > +++++++++++++++++++++++++++++++++--
> > > > > --
> > > > > =C2=A0=C2=A01 file changed, 91 insertions(+), 10 deletions(-)
> > > > >=20
> > > > > diff --git a/drivers/gpu/drm/xe/xe_bo.c
> > > > > b/drivers/gpu/drm/xe/xe_bo.c
> > > > > index 6ed0e1955215..e7bc74f8ae82 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > > > @@ -283,6 +283,8 @@ struct xe_ttm_tt {
> > > > > =C2=A0=C2=A0	struct device *dev;
> > > > > =C2=A0=C2=A0	struct sg_table sgt;
> > > > > =C2=A0=C2=A0	struct sg_table *sg;
> > > > > +	bool sys_clear_on_free;
> > > > > +	bool sys_clear_on_alloc;
> > > > > =C2=A0=C2=A0};
> > > > > =C2=A0=20
> > > > > =C2=A0=C2=A0static int xe_tt_map_sg(struct ttm_tt *tt)
> > > > > @@ -401,8 +403,23 @@ static struct ttm_tt
> > > > > *xe_ttm_tt_create(struct
> > > > > ttm_buffer_object *ttm_bo,
> > > > > =C2=A0=C2=A0	 * flag. Zeroed pages are only required for
> > > > > ttm_bo_type_device so
> > > > > =C2=A0=C2=A0	 * unwanted data is not leaked to userspace.
> > > > > =C2=A0=C2=A0	 */
> > > > > -	if (ttm_bo->type =3D=3D ttm_bo_type_device && xe-
> > > > > > mem.gpu_page_clear_sys)
> > > > > -		page_flags |=3D TTM_TT_FLAG_CLEARED_ON_FREE;
> > > > > +	if (ttm_bo->type =3D=3D ttm_bo_type_device && xe-
> > > > > > mem.gpu_page_clear_sys) {
> > > > > +		/*
> > > > > +		 * Non-pooled BOs are always clear on alloc
> > > > > when
> > > > > possible.
> > > > > +		 * clear-on-free is not needed as there is
> > > > > no
> > > > > pool
> > > > > to give pages back.
> > > > > +		 */
> > > > > +		if (caching =3D=3D ttm_cached) {
> > > > > +			tt->sys_clear_on_alloc =3D true;
> > > > > +			tt->sys_clear_on_free =3D false;
> > > > > +		} else {
> > > > > +		/*
> > > > > +		 * For pooled BO, clear-on-alloc is done by
> > > > > the
> > > > > CPU
> > > > > for now and
> > > > > +		 * GPU will do clear on free when releasing
> > > > > the
> > > > > BO.
> > > > > +		 */
> > > > > +			tt->sys_clear_on_alloc =3D false;
> > > > > +			tt->sys_clear_on_free =3D true;
> > > > > +		}
> > > > > +	}
> > > > > =C2=A0=20
> > > > > =C2=A0=C2=A0	err =3D ttm_tt_init(&tt->ttm, &bo->ttm, page_flags,
> > > > > caching,
> > > > > extra_pages);
> > > > > =C2=A0=C2=A0	if (err) {
> > > > > @@ -416,8 +433,10 @@ static struct ttm_tt
> > > > > *xe_ttm_tt_create(struct
> > > > > ttm_buffer_object *ttm_bo,
> > > > > =C2=A0=C2=A0static int xe_ttm_tt_populate(struct ttm_device *ttm_=
dev,
> > > > > struct
> > > > > ttm_tt *tt,
> > > > > =C2=A0=C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct ttm_operatio=
n_ctx *ctx)
> > > > > =C2=A0=C2=A0{
> > > > > +	struct xe_ttm_tt *xe_tt;
> > > > > =C2=A0=C2=A0	int err;
> > > > > =C2=A0=20
> > > > > +	xe_tt =3D container_of(tt, struct xe_ttm_tt, ttm);
> > > > > =C2=A0=C2=A0	/*
> > > > > =C2=A0=C2=A0	 * dma-bufs are not populated with pages, and the
> > > > > dma-
> > > > > =C2=A0=C2=A0	 * addresses are set up when moved to XE_PL_TT.
> > > > > @@ -426,7 +445,7 @@ static int xe_ttm_tt_populate(struct
> > > > > ttm_device
> > > > > *ttm_dev, struct ttm_tt *tt,
> > > > > =C2=A0=C2=A0		return 0;
> > > > > =C2=A0=20
> > > > > =C2=A0=C2=A0	/* Clear TTM_TT_FLAG_ZERO_ALLOC when GPU is set to
> > > > > clear
> > > > > system pages */
> > > > > -	if (tt->page_flags & TTM_TT_FLAG_CLEARED_ON_FREE)
> > > > > +	if (xe_tt->sys_clear_on_alloc)
> > > > > =C2=A0=C2=A0		tt->page_flags &=3D ~TTM_TT_FLAG_ZERO_ALLOC;
> > > > > =C2=A0=20
> > > > > =C2=A0=C2=A0	err =3D ttm_pool_alloc(&ttm_dev->pool, tt, ctx);
> > > > > @@ -438,11 +457,19 @@ static int xe_ttm_tt_populate(struct
> > > > > ttm_device
> > > > > *ttm_dev, struct ttm_tt *tt,
> > > > > =C2=A0=20
> > > > > =C2=A0=C2=A0static void xe_ttm_tt_unpopulate(struct ttm_device
> > > > > *ttm_dev,
> > > > > struct
> > > > > ttm_tt *tt)
> > > > > =C2=A0=C2=A0{
> > > > > +	struct xe_ttm_tt *xe_tt;
> > > > > +
> > > > > +	xe_tt =3D container_of(tt, struct xe_ttm_tt, ttm);
> > > > > +
> > > > > =C2=A0=C2=A0	if (tt->page_flags & TTM_TT_FLAG_EXTERNAL)
> > > > > =C2=A0=C2=A0		return;
> > > > > =C2=A0=20
> > > > > =C2=A0=C2=A0	xe_tt_unmap_sg(tt);
> > > > > =C2=A0=20
> > > > > +	/* Hint TTM pool that pages are already cleared */
> > > > > +	if (xe_tt->sys_clear_on_free)
> > > > > +		tt->page_flags |=3D
> > > > > TTM_TT_FLAG_CLEARED_ON_FREE;
> > > > > +
> > > > > =C2=A0=C2=A0	return ttm_pool_free(&ttm_dev->pool, tt);
> > > > > =C2=A0=C2=A0}
> > > > > =C2=A0=20
> > > > > @@ -664,6 +691,7 @@ static int xe_bo_move(struct
> > > > > ttm_buffer_object
> > > > > *ttm_bo, bool evict,
> > > > > =C2=A0=C2=A0	struct ttm_resource *old_mem =3D ttm_bo->resource;
> > > > > =C2=A0=C2=A0	u32 old_mem_type =3D old_mem ? old_mem->mem_type :
> > > > > XE_PL_SYSTEM;
> > > > > =C2=A0=C2=A0	struct ttm_tt *ttm =3D ttm_bo->ttm;
> > > > > +	struct xe_ttm_tt *xe_tt;
> > > > > =C2=A0=C2=A0	struct xe_migrate *migrate =3D NULL;
> > > > > =C2=A0=C2=A0	struct dma_fence *fence;
> > > > > =C2=A0=C2=A0	bool move_lacks_source;
> > > > > @@ -674,12 +702,13 @@ static int xe_bo_move(struct
> > > > > ttm_buffer_object
> > > > > *ttm_bo, bool evict,
> > > > > =C2=A0=C2=A0	bool clear_system_pages;
> > > > > =C2=A0=C2=A0	int ret =3D 0;
> > > > > =C2=A0=20
> > > > > +	xe_tt =3D container_of(ttm_bo->ttm, struct xe_ttm_tt,
> > > > > ttm);
> > > > > =C2=A0=C2=A0	/*
> > > > > =C2=A0=C2=A0	 * Clear TTM_TT_FLAG_CLEARED_ON_FREE on bo creation
> > > > > path
> > > > > when
> > > > > =C2=A0=C2=A0	 * moving to system as the bo doesn't have
> > > > > dma_mapping.
> > > > > =C2=A0=C2=A0	 */
> > > > > =C2=A0=C2=A0	if (!old_mem && ttm && !ttm_tt_is_populated(ttm))
> > > > > -		ttm->page_flags &=3D
> > > > > ~TTM_TT_FLAG_CLEARED_ON_FREE;
> > > > > +		xe_tt->sys_clear_on_alloc =3D false;
> > > > > =C2=A0=20
> > > > > =C2=A0=C2=A0	/* Bo creation path, moving to system or TT. */
> > > > > =C2=A0=C2=A0	if ((!old_mem && ttm) && !handle_system_ccs) {
> > > > > @@ -703,10 +732,9 @@ static int xe_bo_move(struct
> > > > > ttm_buffer_object
> > > > > *ttm_bo, bool evict,
> > > > > =C2=A0=C2=A0	move_lacks_source =3D handle_system_ccs ? (!bo-
> > > > > > ccs_cleared)
> > > > > :
> > > > > =C2=A0=C2=A0						(!mem_type_i
> > > > > s_vr
> > > > > am(o
> > > > > ld_mem_type) && !tt_has_data);
> > > > > =C2=A0=20
> > > > > -	clear_system_pages =3D ttm && (ttm->page_flags &
> > > > > TTM_TT_FLAG_CLEARED_ON_FREE);
> > > > > +	clear_system_pages =3D ttm && xe_tt-
> > > > > >sys_clear_on_alloc;
> > > > > =C2=A0=C2=A0	needs_clear =3D (ttm && ttm->page_flags &
> > > > > TTM_TT_FLAG_ZERO_ALLOC) ||
> > > > > -		(!ttm && ttm_bo->type =3D=3D ttm_bo_type_device)
> > > > > ||
> > > > > -		clear_system_pages;
> > > > > +		(!ttm && ttm_bo->type =3D=3D ttm_bo_type_device)
> > > > > ||
> > > > > clear_system_pages;
> > > > > =C2=A0=20
> > > > > =C2=A0=C2=A0	if (new_mem->mem_type =3D=3D XE_PL_TT) {
> > > > > =C2=A0=C2=A0		ret =3D xe_tt_map_sg(ttm);
> > > > > @@ -1028,10 +1056,47 @@ static bool
> > > > > xe_ttm_bo_lock_in_destructor(struct ttm_buffer_object
> > > > > *ttm_bo)
> > > > > =C2=A0=C2=A0	return locked;
> > > > > =C2=A0=C2=A0}
> > > > > =C2=A0=20
> > > > > +static struct dma_fence *xe_ttm_bo_clear_on_free(struct
> > > > > ttm_buffer_object *ttm_bo)
> > > > > +{
> > > > > +	struct xe_bo *bo=C2=A0 =3D ttm_to_xe_bo(ttm_bo);
> > > > > +	struct xe_device *xe =3D xe_bo_device(bo);
> > > > > +	struct xe_migrate *migrate;
> > > > > +	struct xe_ttm_tt *xe_tt;
> > > > > +	struct dma_fence *clear_fence;
> > > > > +
> > > > > +	/* return early if nothing to clear */
> > > > > +	if (!ttm_bo->ttm)
> > > > > +		return NULL;
> > > > > +
> > > > > +	xe_tt =3D container_of(ttm_bo->ttm, struct xe_ttm_tt,
> > > > > ttm);
> > > > > +	/* return early if nothing to clear */
> > > > > +	if (!xe_tt->sys_clear_on_free || !bo->ttm.resource)
> > > > > +		return NULL;
> > > > > +
> > > > > +	if (XE_WARN_ON(!xe_tt->sg))
> > > > > +		return NULL;
> > > > > +
> > > > > +	if (bo->tile)
> > > > > +		migrate =3D bo->tile->migrate;
> > > > > +	else
> > > > > +		migrate =3D xe->tiles[0].migrate;
> > > > > +
> > > > > +	xe_assert(xe, migrate);
> > > > > +
> > > > > +	clear_fence =3D xe_migrate_clear(migrate, bo, bo-
> > > > > > ttm.resource,
> > > > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > > > > XE_MIGRATE_CLEAR_FLAG_FULL);
> > > > > +	if (IS_ERR(clear_fence))
> > > > > +		return NULL;
> > > > > +
> > > > > +	xe_tt->sys_clear_on_free =3D false;
> > > > > +
> > > > > +	return clear_fence;
> > > > > +}
> > > > > +
> > > > > =C2=A0=C2=A0static void xe_ttm_bo_release_notify(struct
> > > > > ttm_buffer_object
> > > > > *ttm_bo)
> > > > > =C2=A0=C2=A0{
> > > > > =C2=A0=C2=A0	struct dma_resv_iter cursor;
> > > > > -	struct dma_fence *fence;
> > > > > +	struct dma_fence *clear_fence, *fence;
> > > > > =C2=A0=C2=A0	struct dma_fence *replacement =3D NULL;
> > > > > =C2=A0=C2=A0	struct xe_bo *bo;
> > > > > =C2=A0=20
> > > > > @@ -1041,15 +1106,31 @@ static void
> > > > > xe_ttm_bo_release_notify(struct
> > > > > ttm_buffer_object *ttm_bo)
> > > > > =C2=A0=C2=A0	bo =3D ttm_to_xe_bo(ttm_bo);
> > > > > =C2=A0=C2=A0	xe_assert(xe_bo_device(bo), !(bo->created &&
> > > > > kref_read(&ttm_bo->base.refcount)));
> > > > > =C2=A0=20
> > > > > +	clear_fence =3D xe_ttm_bo_clear_on_free(ttm_bo);
> > > > > +
> > > > > =C2=A0=C2=A0	/*
> > > > > =C2=A0=C2=A0	 * Corner case where TTM fails to allocate memory
> > > > > and
> > > > > this
> > > > > BOs resv
> > > > > =C2=A0=C2=A0	 * still points the VMs resv
> > > > > =C2=A0=C2=A0	 */
> > > > > -	if (ttm_bo->base.resv !=3D &ttm_bo->base._resv)
> > > > > +	if (ttm_bo->base.resv !=3D &ttm_bo->base._resv) {
> > > > > +		if (clear_fence)
> > > > > +			dma_fence_wait(clear_fence, false);
> > > > > =C2=A0=C2=A0		return;
> > > > > +	}
> > > > > =C2=A0=20
> > > > > -	if (!xe_ttm_bo_lock_in_destructor(ttm_bo))
> > > > > +	if (!xe_ttm_bo_lock_in_destructor(ttm_bo)) {
> > > > > +		if (clear_fence)
> > > > > +			dma_fence_wait(clear_fence, false);
> > > > > =C2=A0=C2=A0		return;
> > > > > +	}
> > > > > +
> > > > > +	if (clear_fence) {
> > > > > +		if (dma_resv_reserve_fences(ttm_bo-
> > > > > >base.resv,
> > > > > 1))
> > > > > +			dma_fence_wait(clear_fence, false);
> > > > > +		else
> > > > > +			dma_resv_add_fence(ttm_bo-
> > > > > >base.resv,
> > > > > clear_fence,
> > > > > +					=C2=A0=C2=A0
> > > > > DMA_RESV_USAGE_KERNEL);
> > > > > +	}
> > > > > =C2=A0=20
> > > > > =C2=A0=C2=A0	/*
> > > > > =C2=A0=C2=A0	 * Scrub the preempt fences if any. The unbind fence
> > > > > is
> > > > > already
> >=20

