Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D5E8F54AC5
	for <intel-xe@archiver.kernel.org>; Tue, 24 Mar 2026 14:51:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42A1C10E176;
	Tue, 24 Mar 2026 14:51:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wd7G8TJc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0278910E176
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Mar 2026 14:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774363914; x=1805899914;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Cm7l3OSbMgeMP/sT7ykPVjUyNq2Z4OwW1lUI4giuFpw=;
 b=Wd7G8TJcBsnjUyFkCks5DpgJoDAMNbuuN2Sa3AaRAkt9NgIloagtwK1o
 gXYFQcwQdy4ka7fbOf0sNslH+5oFjFuMmCAqFtqsctobD/Aw4Qb91DNTc
 acZBKZJ2/ZQg+oSNClyebqf5VkX+RkAwF8N83CazgsFbcuIX4BmDwz8Sh
 +f/7o5B5HQtm+uZvv9/0zWIzR8191y9zHcvgWZ3OrOaXUmGWtT0fyfCTj
 fr70OmgSBhl6eCzBVurR1HYh+ve9sfvJ8NZzo/dkvqTFpZFn2NDcf+ELR
 omtMDDVcnJRT+fKwMPKFpRglBXkxxVNkBtE8cEUJFlVV1bcWspZesrJQl w==;
X-CSE-ConnectionGUID: aRwhKMHBTXGIpxA3PA+vOg==
X-CSE-MsgGUID: 6jj5CAfSRsmuq01iAmntLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="85691230"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="85691230"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 07:51:53 -0700
X-CSE-ConnectionGUID: vDfWsb34T1ysoxutOh0JSg==
X-CSE-MsgGUID: H/Ms82xYTmKe45GTx9zQRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="223435261"
Received: from abityuts-desk.ger.corp.intel.com (HELO [10.245.244.208])
 ([10.245.244.208])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 07:51:53 -0700
Message-ID: <c6225da020019add4f16712c8acd37406ba19caa.camel@linux.intel.com>
Subject: Re: [PATCH v7 10/12] drm/xe/bo: Add purgeable shrinker state helpers
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Arvind Yadav <arvind.yadav@intel.com>, intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com
Date: Tue, 24 Mar 2026 15:51:49 +0100
In-Reply-To: <20260323093106.2986900-11-arvind.yadav@intel.com>
References: <20260323093106.2986900-1-arvind.yadav@intel.com>
 <20260323093106.2986900-11-arvind.yadav@intel.com>
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

On Mon, 2026-03-23 at 15:00 +0530, Arvind Yadav wrote:
> Encapsulate TTM purgeable flag updates and shrinker page accounting
> into helper functions to prevent desynchronization between the TTM
> tt->purgeable flag and the shrinker's page bucket counters.
>=20
> Without these helpers, direct manipulation of xe_ttm_tt->purgeable
> risks forgetting to update the corresponding shrinker counters,
> leading to incorrect memory pressure calculations.
>=20
> Update purgeable BO state to PURGED after successful shrinker purge
> for DONTNEED BOs.
>=20
> v4:
> =C2=A0 - @madv_purgeable atomic_t =E2=86=92 u32 change across all relevan=
t
> =C2=A0=C2=A0=C2=A0 patches (Matt)
>=20
> v5:
> =C2=A0 - Update purgeable BO state to PURGED after a successful shrinker
> =C2=A0=C2=A0=C2=A0 purge for DONTNEED BOs.
> =C2=A0 - Split ghost BO and zero-refcount handling in xe_bo_shrink()
> (Thomas)
>=20
> v6:
> =C2=A0 - Create separate patch for 'Split ghost BO and zero-refcount
> =C2=A0=C2=A0=C2=A0 handling'. (Thomas)
>=20
> v7:
> =C2=A0 - Merge xe_bo_set_purgeable_shrinker() and
> xe_bo_clear_purgeable_shrinker()
> =C2=A0=C2=A0=C2=A0 into a single static helper xe_bo_set_purgeable_shrink=
er(bo,
> new_state)
> =C2=A0=C2=A0=C2=A0 called automatically from xe_bo_set_purgeable_state().=
 Callers no
> longer
> =C2=A0=C2=A0=C2=A0 need to manage shrinker accounting separately. (Thomas=
)
>=20
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>

Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

> ---
> =C2=A0drivers/gpu/drm/xe/xe_bo.c | 43
> +++++++++++++++++++++++++++++++++++++-
> =C2=A01 file changed, 42 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 83a1d1ca6cc6..85e42e785ebe 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -835,6 +835,42 @@ static int xe_bo_move_notify(struct xe_bo *bo,
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> +/**
> + * xe_bo_set_purgeable_shrinker() - Update shrinker accounting for
> purgeable state
> + * @bo: Buffer object
> + * @new_state: New purgeable state being set
> + *
> + * Transfers pages between shrinkable and purgeable buckets when the
> BO
> + * purgeable state changes. Called automatically from
> xe_bo_set_purgeable_state().
> + */
> +static void xe_bo_set_purgeable_shrinker(struct xe_bo *bo,
> +					 enum
> xe_madv_purgeable_state new_state)
> +{
> +	struct ttm_buffer_object *ttm_bo =3D &bo->ttm;
> +	struct ttm_tt *tt =3D ttm_bo->ttm;
> +	struct xe_device *xe =3D ttm_to_xe_device(ttm_bo->bdev);
> +	struct xe_ttm_tt *xe_tt;
> +	long tt_pages;
> +
> +	xe_bo_assert_held(bo);
> +
> +	if (!tt || !ttm_tt_is_populated(tt))
> +		return;
> +
> +	xe_tt =3D container_of(tt, struct xe_ttm_tt, ttm);
> +	tt_pages =3D tt->num_pages;
> +
> +	if (!xe_tt->purgeable && new_state =3D=3D
> XE_MADV_PURGEABLE_DONTNEED) {
> +		xe_tt->purgeable =3D true;
> +		/* Transfer pages from shrinkable to purgeable count
> */
> +		xe_shrinker_mod_pages(xe->mem.shrinker, -tt_pages,
> tt_pages);
> +	} else if (xe_tt->purgeable && new_state =3D=3D
> XE_MADV_PURGEABLE_WILLNEED) {
> +		xe_tt->purgeable =3D false;
> +		/* Transfer pages from purgeable to shrinkable count
> */
> +		xe_shrinker_mod_pages(xe->mem.shrinker, tt_pages, -
> tt_pages);
> +	}
> +}
> +
> =C2=A0/**
> =C2=A0 * xe_bo_set_purgeable_state() - Set BO purgeable state with
> validation
> =C2=A0 * @bo: Buffer object
> @@ -842,7 +878,8 @@ static int xe_bo_move_notify(struct xe_bo *bo,
> =C2=A0 *
> =C2=A0 * Sets the purgeable state with lockdep assertions and validates
> state
> =C2=A0 * transitions. Once a BO is PURGED, it cannot transition to any
> other state.
> - * Invalid transitions are caught with xe_assert().
> + * Invalid transitions are caught with xe_assert(). Shrinker page
> accounting
> + * is updated automatically.
> =C2=A0 */
> =C2=A0void xe_bo_set_purgeable_state(struct xe_bo *bo,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum xe_madv_purgeable_stat=
e
> new_state)
> @@ -861,6 +898,7 @@ void xe_bo_set_purgeable_state(struct xe_bo *bo,
> =C2=A0			new_state !=3D XE_MADV_PURGEABLE_PURGED));
> =C2=A0
> =C2=A0	bo->madv_purgeable =3D new_state;
> +	xe_bo_set_purgeable_shrinker(bo, new_state);
> =C2=A0}
> =C2=A0
> =C2=A0/**
> @@ -1243,6 +1281,9 @@ long xe_bo_shrink(struct ttm_operation_ctx
> *ctx, struct ttm_buffer_object *bo,
> =C2=A0			lret =3D xe_bo_move_notify(xe_bo, ctx);
> =C2=A0		if (!lret)
> =C2=A0			lret =3D xe_bo_shrink_purge(ctx, bo, scanned);
> +		if (lret > 0 && xe_bo_madv_is_dontneed(xe_bo))
> +			xe_bo_set_purgeable_state(xe_bo,
> +						=C2=A0
> XE_MADV_PURGEABLE_PURGED);
> =C2=A0		goto out_unref;
> =C2=A0	}
> =C2=A0
