Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79314C43458
	for <intel-xe@archiver.kernel.org>; Wed,  8 Jul 2026 12:52:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B3B110E5C7;
	Wed,  8 Jul 2026 12:52:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RvrpQC9K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB9FA10E5C7
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Jul 2026 12:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783515140; x=1815051140;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=U1jya2E0CsGrP1CreCGRjAMeq5vkHtS//I+nr73YXX0=;
 b=RvrpQC9KgQMeliEm0h2f4OpF1hswuW6MOMHsiKDTwJEBfB6A70oV8HJv
 l9H2JLa+WoBDfewmDIk2ehOYemf4s+9FpufCbTac35mFoWWtdzuHq9aUa
 wpnpddXsOD9AHDVVbEACNJbIpGSYcJ5gtM0dyVGSlhDW1p1E/ubUZqvIE
 BtMFnTOMSGtjmOQSD7P3b9DGmduE5kPNItmW14RiQ4YXv74Xfd0n96gOs
 ODdh416pNiHQnsfm9gWg9A6HXJREtXhKPHguOYNS6aMYaYSpblI0CI9q2
 tQL/io14F4afImD9DfZfbJDzys0ry+2NK9QcvjkB0zF0dpPfjXpZy1m7W g==;
X-CSE-ConnectionGUID: xD10PrEXS1+MlOAP/obgxw==
X-CSE-MsgGUID: 5hvXx0/jTqG0wdJyx/p3Ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="83954695"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="83954695"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2026 05:52:20 -0700
X-CSE-ConnectionGUID: Un/xf62tR/Gmvh/aJ6AfYA==
X-CSE-MsgGUID: k86ZXG3RTgiDgAKg7rhXdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="251623650"
Received: from vpanait-mobl.ger.corp.intel.com (HELO [10.245.245.113])
 ([10.245.245.113])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2026 05:52:18 -0700
Message-ID: <a7d6a1b1c6c3253703a511ef4a8e54c66b66e009.camel@linux.intel.com>
Subject: Re: [PATCH v5 2/2] drm/xe: Keep imported sg BOs off LRU until
 dma-buf attach succeeds
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Nitin Gote <nitin.r.gote@intel.com>, intel-xe@lists.freedesktop.org
Cc: Christian Koenig <christian.koenig@amd.com>, Matthew Auld
 <matthew.auld@intel.com>
Date: Wed, 08 Jul 2026 14:52:15 +0200
In-Reply-To: <20260708091512.205482-6-nitin.r.gote@intel.com>
References: <20260708091512.205482-4-nitin.r.gote@intel.com>
 <20260708091512.205482-6-nitin.r.gote@intel.com>
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

On Wed, 2026-07-08 at 14:45 +0530, Nitin Gote wrote:
> Imported dma-buf BOs are created as ttm_bo_type_sg with bo->base.resv
> pointing at the exporter's resv. They are initialized with system
> placement, which allocates a ttm_resource and makes the BO visible to
> TTM LRU walkers before dma_buf_dynamic_attach() has succeeded.
>=20
> If attach fails, xe holds no dma-buf reference, but an LRU walker may
> already have referenced the BO and locked bo->base.resv (the exporter
> resv). If the exporter is then freed, this is a use-after-free.
>=20
> Use an empty initial placement for imported sg BOs so bo->resource
> stays NULL and the BO is never added to an LRU before attach
> succeeds.
>=20
> As a result sg BOs now start without a resource, so their first move
> has old_mem =3D=3D NULL. Check ttm_bo_type_sg before the creation path in
> xe_bo_move() so imports always use the dma-buf move path,=C2=A0


> and handle
> resource-less sg BOs in xe_evict_flags() before dereferencing
> tbo->resource.

Better if evict is not called on them at all. Could we have the dma-buf
move_notify immediately return 0 if the bo has no resource?

>=20
> Cc: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Assisted-by: GitHub_Copilot:claude-sonnet-4.6
> Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_bo.c | 53 ++++++++++++++++++++++++++++-------=
-
> --
> =C2=A01 file changed, 39 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 85e6d9a0f575..050de0f13232 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -63,6 +63,12 @@ static struct ttm_placement sys_placement =3D {
> =C2=A0
> =C2=A0static struct ttm_placement purge_placement;
> =C2=A0
> +/* Initial placement: keeps imported sg BOs resource-less (off the
> LRU)
> + * until dma_buf_dynamic_attach() succeeds so they are not visible
> to LRU
> + * walkers while bo->base.resv still points at the exporter.
> + */
> +static struct ttm_placement sg_init_placement;
> +
> =C2=A0static const struct ttm_place tt_placement_flags[] =3D {
> =C2=A0	{
> =C2=A0		.fpfn =3D 0,
> @@ -342,9 +348,14 @@ static void xe_evict_flags(struct
> ttm_buffer_object *tbo,
> =C2=A0	}
> =C2=A0
> =C2=A0	/*
> -	 * For xe, sg bos that are evicted to system just triggers a
> -	 * rebind of the sg list upon subsequent validation to
> XE_PL_TT.
> +	 * sg BOs (dma-buf imports) evict to system and may have no
> +	 * resource yet, so handle them before dereferencing tbo-
> >resource.
> =C2=A0	 */
> +	if (tbo->type =3D=3D ttm_bo_type_sg) {
> +		*placement =3D sys_placement;
> +		return;
> +	}
> +

.. and then if possible skip the above changes?

Thanks,
Thomas



> =C2=A0	switch (tbo->resource->mem_type) {
> =C2=A0	case XE_PL_VRAM0:
> =C2=A0	case XE_PL_VRAM1:
> @@ -980,6 +991,22 @@ static int xe_bo_move(struct ttm_buffer_object
> *ttm_bo, bool evict,
> =C2=A0		return 0;
> =C2=A0	}
> =C2=A0
> +	/*
> +	 * sg BOs (dma-buf imports) must always be moved via the
> dmabuf path,
> +	 * regardless of whether they have an existing resource.
> This check must
> +	 * come before the creation-path check below: sg BOs start
> with no
> +	 * resource (sg_init_placement), so their first move to
> XE_PL_TT has
> +	 * old_mem =3D=3D NULL, which would otherwise incorrectly
> trigger the
> +	 * creation path and call xe_tt_map_sg() instead of
> xe_bo_move_dmabuf().
> +	 */
> +	if (ttm_bo->type =3D=3D ttm_bo_type_sg) {
> +		if (new_mem->mem_type =3D=3D XE_PL_SYSTEM)
> +			ret =3D xe_bo_move_notify(bo, ctx);
> +		if (!ret)
> +			ret =3D xe_bo_move_dmabuf(ttm_bo, new_mem);
> +		return ret;
> +	}
> +
> =C2=A0	/* Bo creation path, moving to system or TT. */
> =C2=A0	if ((!old_mem && ttm) && !handle_system_ccs) {
> =C2=A0		if (new_mem->mem_type =3D=3D XE_PL_TT)
> @@ -989,14 +1016,6 @@ static int xe_bo_move(struct ttm_buffer_object
> *ttm_bo, bool evict,
> =C2=A0		goto out;
> =C2=A0	}
> =C2=A0
> -	if (ttm_bo->type =3D=3D ttm_bo_type_sg) {
> -		if (new_mem->mem_type =3D=3D XE_PL_SYSTEM)
> -			ret =3D xe_bo_move_notify(bo, ctx);
> -		if (!ret)
> -			ret =3D xe_bo_move_dmabuf(ttm_bo, new_mem);
> -		return ret;
> -	}
> -
> =C2=A0	tt_has_data =3D ttm && (ttm_tt_is_populated(ttm) ||
> ttm_tt_is_swapped(ttm));
> =C2=A0
> =C2=A0	move_lacks_source =3D !old_mem || (handle_system_ccs ? (!bo-
> >ccs_cleared) :
> @@ -2379,10 +2398,16 @@ struct xe_bo *xe_bo_init_locked(struct
> xe_device *xe, struct xe_bo *bo,
> =C2=A0		}
> =C2=A0	}
> =C2=A0
> -	/* Defer populating type_sg bos */
> -	placement =3D (type =3D=3D ttm_bo_type_sg ||
> -		=C2=A0=C2=A0=C2=A0=C2=A0 bo->flags & XE_BO_FLAG_DEFER_BACKING) ?
> &sys_placement :
> -		&bo->placement;
> +	/*
> +	 * For sg BOs (dma-buf imports) use sg_init_placement
> (num_placement=3D0)
> +	 * so that ttm_bo_validate() leaves bo->resource =3D NULL. The
> BO is then
> +	 * not on any LRU list before dma_buf_dynamic_attach()
> succeeds, which
> +	 * prevents the LRU-walker UAF when attach fails.
> +	 * For other BOs that request deferred backing, use
> sys_placement.
> +	 */
> +	placement =3D (type =3D=3D ttm_bo_type_sg) ? &sg_init_placement :
> +		=C2=A0=C2=A0=C2=A0 (bo->flags & XE_BO_FLAG_DEFER_BACKING) ?
> &sys_placement :
> +		=C2=A0=C2=A0=C2=A0 &bo->placement;
> =C2=A0	err =3D ttm_bo_init_reserved(&xe->ttm, &bo->ttm, type,
> =C2=A0				=C2=A0=C2=A0 placement, alignment,
> =C2=A0				=C2=A0=C2=A0 &ctx, NULL, resv,
> xe_ttm_bo_destroy);
