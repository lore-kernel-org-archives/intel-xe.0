Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F4EEC4345F
	for <intel-xe@archiver.kernel.org>; Thu,  2 May 2024 11:31:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B63F10F41F;
	Thu,  2 May 2024 11:31:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hm1w7a4z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83BF010F41F
 for <intel-xe@lists.freedesktop.org>; Thu,  2 May 2024 11:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714649502; x=1746185502;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=v/hhT0QQY843U4zdVSGkYFp636f69/Vl6zPrv9Dst3o=;
 b=Hm1w7a4zQ3rvqcKIFFy11xSmIvxllhI3/L+u8oLAM7cgg/VgOiHSTv2W
 wjsF59f8g8lOgPbCbfPOigDILYL5BTSwpY1KgWE44ndGeuk94G50sANUL
 8jkBjauBQXBeKFJ39gzO+I3yJrgGlQhvu6Fg4mtJ7A7pA6NO0Zq9qMPA+
 qp6Sec+ntTG7Rqky6y+5+uVUw/VYXMnf2ZI8MlvGgustjFk628i5kDwVW
 nF5L5Z20YGTAMEa2t/yibM13XxvZKsE6SAkYzHjQPGAXXnRlqZKpePHFK
 CLMs3islIjTCNiICxLBuQeXeBbB15HmJLkMx1WukETEh/2X9o9AuKFrzn A==;
X-CSE-ConnectionGUID: +j9zGpR4Qg+3TGqjBDd8Qw==
X-CSE-MsgGUID: mbDu5+GXRlaFa9tgP1xJwg==
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="21558505"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="21558505"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2024 04:31:41 -0700
X-CSE-ConnectionGUID: CohRterfQ6OUX/GQ079nKQ==
X-CSE-MsgGUID: u7tiehitRiGeSULUwMSLOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="64531795"
Received: from vpus-mobl1.ger.corp.intel.com (HELO [10.252.34.3])
 ([10.252.34.3])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2024 04:31:40 -0700
Message-ID: <203d2774f5f901041bb9d20efd759001f968ffdf.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Perform dma_map when moving system buffer
 objects to TT
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 02 May 2024 13:31:37 +0200
In-Reply-To: <ZjEgowaMK2IUexXO@DUT025-TGLU.fm.intel.com>
References: <20240430120214.5372-1-thomas.hellstrom@linux.intel.com>
 <ZjEgowaMK2IUexXO@DUT025-TGLU.fm.intel.com>
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

On Tue, 2024-04-30 at 16:47 +0000, Matthew Brost wrote:
> On Tue, Apr 30, 2024 at 02:02:14PM +0200, Thomas Hellstr=C3=B6m wrote:
> > Currently we dma_map on ttm_tt population and dma_unmap when
> > the pages are released in ttm_tt unpopulate.
> >=20
> > Strictly, the dma_map is not needed until the bo is moved to the
> > XE_PL_TT placement, so perform the dma_mapping on such moves
> > instead, and remove the dma_mappig when moving to XE_PL_SYSTEM.
> >=20
> > This is desired for the upcoming shrinker series where shrinking
> > of a ttm_tt might fail. That would lead to an odd construct where
> > we first dma_unmap, then shrink and if shrinking fails dma_map
> > again. If dma_mapping instead is performed on move like this,
> > shrinking does not need to care at all about dma mapping.
> >=20
> > Finally, where a ttm_tt is destroyed while bound to a different
> > memory type than XE_PL_SYSTEM, we keep the dma_unmap in
> > unpopulate().
> >=20
>=20
> Makes sense.
> =C2=A0
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > ---
> > =C2=A0drivers/gpu/drm/xe/xe_bo.c | 45 ++++++++++++++++++++++++---------=
-
> > ----
> > =C2=A01 file changed, 29 insertions(+), 16 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c
> > b/drivers/gpu/drm/xe/xe_bo.c
> > index bc1f794e3e61..4c1dd67a4588 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -302,6 +302,18 @@ static int xe_tt_map_sg(struct ttm_tt *tt)
> > =C2=A0	return 0;
> > =C2=A0}
> > =C2=A0
> > +static void xe_tt_unmap_sg(struct ttm_tt *tt)
> > +{
> > +	struct xe_ttm_tt *xe_tt =3D container_of(tt, struct
> > xe_ttm_tt, ttm);
> > +
> > +	if (xe_tt->sg) {
> > +		dma_unmap_sgtable(xe_tt->dev, xe_tt->sg,
> > +				=C2=A0 DMA_BIDIRECTIONAL, 0);
> > +		sg_free_table(xe_tt->sg);
> > +		xe_tt->sg =3D NULL;
> > +	}
> > +}
> > +
> > =C2=A0struct sg_table *xe_bo_sg(struct xe_bo *bo)
> > =C2=A0{
> > =C2=A0	struct ttm_tt *tt =3D bo->ttm.ttm;
> > @@ -377,27 +389,15 @@ static int xe_ttm_tt_populate(struct
> > ttm_device *ttm_dev, struct ttm_tt *tt,
> > =C2=A0	if (err)
> > =C2=A0		return err;
> > =C2=A0
> > -	/* A follow up may move this xe_bo_move when BO is moved
> > to XE_PL_TT */
> > -	err =3D xe_tt_map_sg(tt);
> > -	if (err)
> > -		ttm_pool_free(&ttm_dev->pool, tt);
> > -
> > =C2=A0	return err;
> > =C2=A0}
> > =C2=A0
> > =C2=A0static void xe_ttm_tt_unpopulate(struct ttm_device *ttm_dev,
> > struct ttm_tt *tt)
> > =C2=A0{
> > -	struct xe_ttm_tt *xe_tt =3D container_of(tt, struct
> > xe_ttm_tt, ttm);
> > -
> > =C2=A0	if (tt->page_flags & TTM_TT_FLAG_EXTERNAL)
> > =C2=A0		return;
> > =C2=A0
> > -	if (xe_tt->sg) {
> > -		dma_unmap_sgtable(xe_tt->dev, xe_tt->sg,
> > -				=C2=A0 DMA_BIDIRECTIONAL, 0);
> > -		sg_free_table(xe_tt->sg);
> > -		xe_tt->sg =3D NULL;
> > -	}
> > +	xe_tt_unmap_sg(tt);
> > =C2=A0
> > =C2=A0	return ttm_pool_free(&ttm_dev->pool, tt);
> > =C2=A0}
> > @@ -628,10 +628,14 @@ static int xe_bo_move(struct
> > ttm_buffer_object *ttm_bo, bool evict,
> > =C2=A0	bool handle_system_ccs =3D (!IS_DGFX(xe) &&
> > xe_bo_needs_ccs_pages(bo) &&
> > =C2=A0				=C2=A0 ttm && ttm_tt_is_populated(ttm))
> > ? true : false;
> > =C2=A0	int ret =3D 0;
> > +
> > =C2=A0	/* Bo creation path, moving to system or TT. */
> > =C2=A0	if ((!old_mem && ttm) && !handle_system_ccs) {
> > -		ttm_bo_move_null(ttm_bo, new_mem);
> > -		return 0;
> > +		if (new_mem->mem_type =3D=3D XE_PL_TT)
> > +			ret =3D xe_tt_map_sg(ttm);
> > +		if (!ret)
> > +			ttm_bo_move_null(ttm_bo, new_mem);
>=20
> Random ranting, ttm_bo_move_null is a terrible name. It is freeing
> the
> old memory and assigning a new one.

I guess it stems from the move operation itself being a no-op, and at
that time the resource assignment was only a metadata update...


>=20
> > +		goto out;
> > =C2=A0	}
> > =C2=A0
> > =C2=A0	if (ttm_bo->type =3D=3D ttm_bo_type_sg) {
> > @@ -650,6 +654,12 @@ static int xe_bo_move(struct ttm_buffer_object
> > *ttm_bo, bool evict,
> > =C2=A0	needs_clear =3D (ttm && ttm->page_flags &
> > TTM_TT_FLAG_ZERO_ALLOC) ||
> > =C2=A0		(!ttm && ttm_bo->type =3D=3D ttm_bo_type_device);
> > =C2=A0
> > +	if (new_mem->mem_type =3D=3D XE_PL_TT) {
> > +		ret =3D xe_tt_map_sg(ttm);
> > +		if (ret)
> > +			goto out;
> > +	}
> > +
> > =C2=A0	if ((move_lacks_source && !needs_clear)) {
> > =C2=A0		ttm_bo_move_null(ttm_bo, new_mem);
> > =C2=A0		goto out;
> > @@ -786,8 +796,11 @@ static int xe_bo_move(struct ttm_buffer_object
> > *ttm_bo, bool evict,
> > =C2=A0	xe_pm_runtime_put(xe);
> > =C2=A0
> > =C2=A0out:
> > -	return ret;
> > +	if ((!ttm_bo->resource || ttm_bo->resource->mem_type =3D=3D
> > XE_PL_SYSTEM) &&
> > +	=C2=A0=C2=A0=C2=A0 ttm_bo->ttm)
>=20
> So this is covering the case where we have moved to system and had
> pages.
>=20
> What about the case where evict fails after the 2nd instance of
> 'xe_tt_map_sg' in this function. I'm guessing xe_ttm_tt_unpopulate
> covers that case?

Yes, in that case we have a struct ttm_tt in the PL_TT placement. It
can either get moved to system, or more likely get unpopulated and
destroyed. In the latter case, the dma-umap happens in unpopulate.

/Thomas



>=20
> Matt
>=20
> > +		xe_tt_unmap_sg(ttm_bo->ttm);
> > =C2=A0
> > +	return ret;
> > =C2=A0}
> > =C2=A0
> > =C2=A0/**
> > --=20
> > 2.44.0
> >=20

