Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16B83D66BA6
	for <intel-xe@archiver.kernel.org>; Wed, 17 Dec 2025 20:51:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A9ED10E7F7;
	Wed, 17 Dec 2025 20:51:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DMr6HWxN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0975510E7F7
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Dec 2025 20:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766004703; x=1797540703;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=KsSJtNqhp86TbjiMyX6CjnA31SHilPV3y3UglLrbvWo=;
 b=DMr6HWxNHPC6MDpMgRnpXO6hSzcg676kEeTUkJvHeaKrvcThSscgU2pY
 dV+lbg5UB/0DtR7UtJPRUWppDEtkoRBlFgY6p6dKc3Jezqd4L/HReH8iL
 MF+fFMZiqBvWvOp3xH1NjzAkp3prK5EpF2DIWF7QaQDq5DCaN0PM6YRXA
 aHc6ndMMhBTlsPQqbVIhI21il/9j97CwFz5sAjWNIdv3g+TWr1fXPapFW
 W5IPjqjwgkUcdaOrfVb/NBQ8Vmp4/rovcKj+OgU0xULr34pe1ZokoyPNV
 OI89In5eEkggYag65SvjG7b9++UWrCi5dBlSNWEblFKP3Juf4rop9Xrin g==;
X-CSE-ConnectionGUID: x24JdsBFS16QudUowEo0Fg==
X-CSE-MsgGUID: iA+xpOxFRRuy/2do5GaGlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="67845524"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; d="scan'208";a="67845524"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 12:51:43 -0800
X-CSE-ConnectionGUID: XGgm/SzLRHCEL69t1G6Jtw==
X-CSE-MsgGUID: 7xFOtYToTCy/uimnAC2N3w==
X-ExtLoop1: 1
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO [10.245.245.244])
 ([10.245.245.244])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 12:51:41 -0800
Message-ID: <eaf85643f5296ea93c68201d748d64e8463887ed.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Drop preempt-fences when destroying imported
 dma-bufs.
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, stable@vger.kernel.org
Date: Wed, 17 Dec 2025 21:51:38 +0100
In-Reply-To: <aUMQE1wZd4k7j2Kw@lstrano-desk.jf.intel.com>
References: <20251217093441.5073-1-thomas.hellstrom@linux.intel.com>
 <aUMQE1wZd4k7j2Kw@lstrano-desk.jf.intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-2.fc41) 
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

On Wed, 2025-12-17 at 12:18 -0800, Matthew Brost wrote:
> On Wed, Dec 17, 2025 at 10:34:41AM +0100, Thomas Hellstr=C3=B6m wrote:
> > When imported dma-bufs are destroyed, TTM is not fully
> > individualizing the dma-resv, but it *is* copying the fences that
> > need to be waited for before declaring idle. So in the case where
> > the bo->resv !=3D bo->_resv we can still drop the preempt-fences, but
> > make sure we do that on bo->_resv which contains the fence-pointer
> > copy.
> >=20
> > In the case where the copying fails, bo->_resv will typically not
> > contain any fences pointers at all, so there will be nothing to
> > drop. In that case, TTM would have ensured all fences that would
> > have been copied are signaled, including any remaining preempt
> > fences.
> >=20
>=20
> Is this enough, though? There seems to be some incongruence in TTM
> regarding resv vs. _resv handling, which still looks problematic.
>=20
> For example:
>=20
> - ttm_bo_flush_all_fences operates on '_resv', which seems correct.

Yes, correct.

>=20
> - ttm_bo_delayed_delete waits on 'resv', which doesn=E2=80=99t seem right=
 or
> at=20
> =C2=A0 least I=E2=80=99m reasoning that preempt fences will get triggered=
 there
> too.

No it waits for _resv, but then locks resv (the shared lock) to be able
to correctly release the attachments. So this appears correct to me.

>=20
> - the test in ttm_bo_release for dma-resv being idle uses 'resv',
> which
> =C2=A0 also doesn't look right.

		if (!dma_resv_test_signaled(&bo->base._resv,
					    DMA_RESV_USAGE_BOOKKEEP)
||
		    (want_init_on_free() && (bo->ttm !=3D NULL)) ||
		    bo->type =3D=3D ttm_bo_type_sg ||
		    !dma_resv_trylock(bo->base.resv)) {

Again, waiting for _resv but trylocking resv, which is the correct
approach for sg bo's afaict.

>=20
> I suppose I can test this out since I have a solid test case and
> report
> back.

Please do.
Thanks,
Thomas


>=20
> Matt
>=20
> > Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel
> > GPUs")
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: <stable@vger.kernel.org> # v6.8+
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > ---
> > =C2=A0drivers/gpu/drm/xe/xe_bo.c | 15 ++++-----------
> > =C2=A01 file changed, 4 insertions(+), 11 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c
> > b/drivers/gpu/drm/xe/xe_bo.c
> > index 6280e6a013ff..8b6474cd3eaf 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -1526,7 +1526,7 @@ static bool
> > xe_ttm_bo_lock_in_destructor(struct ttm_buffer_object *ttm_bo)
> > =C2=A0	 * always succeed here, as long as we hold the lru lock.
> > =C2=A0	 */
> > =C2=A0	spin_lock(&ttm_bo->bdev->lru_lock);
> > -	locked =3D dma_resv_trylock(ttm_bo->base.resv);
> > +	locked =3D dma_resv_trylock(&ttm_bo->base._resv);
> > =C2=A0	spin_unlock(&ttm_bo->bdev->lru_lock);
> > =C2=A0	xe_assert(xe, locked);
> > =C2=A0
> > @@ -1546,13 +1546,6 @@ static void xe_ttm_bo_release_notify(struct
> > ttm_buffer_object *ttm_bo)
> > =C2=A0	bo =3D ttm_to_xe_bo(ttm_bo);
> > =C2=A0	xe_assert(xe_bo_device(bo), !(bo->created &&
> > kref_read(&ttm_bo->base.refcount)));
> > =C2=A0
> > -	/*
> > -	 * Corner case where TTM fails to allocate memory and this
> > BOs resv
> > -	 * still points the VMs resv
> > -	 */
> > -	if (ttm_bo->base.resv !=3D &ttm_bo->base._resv)
> > -		return;
> > -
> > =C2=A0	if (!xe_ttm_bo_lock_in_destructor(ttm_bo))
> > =C2=A0		return;
> > =C2=A0
> > @@ -1562,14 +1555,14 @@ static void xe_ttm_bo_release_notify(struct
> > ttm_buffer_object *ttm_bo)
> > =C2=A0	 * TODO: Don't do this for external bos once we scrub them
> > after
> > =C2=A0	 * unbind.
> > =C2=A0	 */
> > -	dma_resv_for_each_fence(&cursor, ttm_bo->base.resv,
> > +	dma_resv_for_each_fence(&cursor, &ttm_bo->base._resv,
> > =C2=A0				DMA_RESV_USAGE_BOOKKEEP, fence) {
> > =C2=A0		if (xe_fence_is_xe_preempt(fence) &&
> > =C2=A0		=C2=A0=C2=A0=C2=A0 !dma_fence_is_signaled(fence)) {
> > =C2=A0			if (!replacement)
> > =C2=A0				replacement =3D
> > dma_fence_get_stub();
> > =C2=A0
> > -			dma_resv_replace_fences(ttm_bo->base.resv,
> > +			dma_resv_replace_fences(&ttm_bo-
> > >base._resv,
> > =C2=A0						fence->context,
> > =C2=A0						replacement,
> > =C2=A0						DMA_RESV_USAGE_BOO
> > KKEEP);
> > @@ -1577,7 +1570,7 @@ static void xe_ttm_bo_release_notify(struct
> > ttm_buffer_object *ttm_bo)
> > =C2=A0	}
> > =C2=A0	dma_fence_put(replacement);
> > =C2=A0
> > -	dma_resv_unlock(ttm_bo->base.resv);
> > +	dma_resv_unlock(&ttm_bo->base._resv);
> > =C2=A0}
> > =C2=A0
> > =C2=A0static void xe_ttm_bo_delete_mem_notify(struct ttm_buffer_object
> > *ttm_bo)
> > --=20
> > 2.51.1
> >=20

