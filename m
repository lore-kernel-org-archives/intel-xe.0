Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CB32D74ED3
	for <intel-xe@archiver.kernel.org>; Fri, 23 Jan 2026 13:42:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBA0B10EAE6;
	Fri, 23 Jan 2026 13:42:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A8qrwYf7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF35910EAE6
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Jan 2026 13:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769175774; x=1800711774;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=suRK11EMKvqGEnxk90IKLl/7LyVaParitNPcCYmcCWw=;
 b=A8qrwYf7GRFlPJqqxGGgv7ZzewTfj4XKvYlVT1JIrU8NAw/1jI7FF1vF
 Ojjx70z3zPTLtTL7khdv4Sadkzl/FPbl66vRptrNccz9sUXwCZF4dKLqp
 DZmNXjskSwYcEbMroscYZ0i/lcQL1xVgUmcnJP/g0uZHA5l+4+srqzO2P
 9ufxmV4YW3ppototd6TbOVaEYODWUEimL63jROjuw6un6Gy4OMFShVDEV
 wQamPnieoevRELWG4oYYj/roh2dVj+N5FobMeiIn6yK0XxiGpidMRgk39
 jnAVKC9lxpf3jAQHMsm63OzbbvnJPCg9eGUxsykdHOclfK5mZW9hazU+8 g==;
X-CSE-ConnectionGUID: HYvFZHSKRwGdCohnTaoRiQ==
X-CSE-MsgGUID: 5h1piRpFTXGGOMLs6pj2/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="74060170"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="74060170"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 05:42:54 -0800
X-CSE-ConnectionGUID: u9QqsghJQTSnrlQSqUTF1g==
X-CSE-MsgGUID: m3IGCIVITy6csrHeA1d53w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="211530298"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO [10.245.244.177])
 ([10.245.244.177])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 05:42:52 -0800
Message-ID: <dce5519b701a56d0e2ebf8e7c3370badda894dfc.camel@linux.intel.com>
Subject: Re: [PATCH v4 8/8] drm/xe/bo: Add purgeable shrinker state helpers
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, Arvind Yadav
 <arvind.yadav@intel.com>
Cc: intel-xe@lists.freedesktop.org, himal.prasad.ghimiray@intel.com, 
 pallavi.mishra@intel.com
Date: Fri, 23 Jan 2026 14:42:49 +0100
In-Reply-To: <aW/CNu35NYz/2758@lstrano-desk.jf.intel.com>
References: <20260120060900.3137984-1-arvind.yadav@intel.com>
 <20260120060900.3137984-9-arvind.yadav@intel.com>
 <aW/CNu35NYz/2758@lstrano-desk.jf.intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
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

On Tue, 2026-01-20 at 09:58 -0800, Matthew Brost wrote:
> On Tue, Jan 20, 2026 at 11:38:54AM +0530, Arvind Yadav wrote:
> > Encapsulate TTM purgeable flag updates and shrinker page accounting
> > into helper functions. This prevents desynchronization between the
> > TTM tt->purgeable flag and the shrinker's page bucket counters.
> >=20
> > Without these helpers, direct manipulation of xe_ttm_tt->purgeable
> > risks forgetting to update the corresponding shrinker counters,
> > leading to incorrect memory pressure calculations.
> >=20
> > Add xe_bo_set_purgeable_shrinker() and
> > xe_bo_clear_purgeable_shrinker()
> > which atomically update both the TTM flag and transfer pages
> > between
> > the shrinkable and purgeable buckets.
> >=20
> > v4:
> > =C2=A0 - @madv_purgeable atomic_t =E2=86=92 u32 change across all relev=
ant
> > patches. (Matt)
> >=20
> > Cc: Matthew Brost <matthew.brost@intel.com>
>=20
> I think this patch is right but best to double check with Thomas as
> he
> wrote the shrinker logic and is the expert here.
>=20
> Matt


Looks correct to me.

@Arvind: Did you look at removing the xe_tt purgeable field (which I
always thought of as an intermediate until we had purgeable bos) and
replace it with the bo->madv_purgeable field in the shrinker code. I'm
not sure how complicated it would be, TBH but feel free to leave that
as a follow-up patch.

Also make sure the xe_bo_shrink xe_live_ktest subtest still works since
it relies heavily on shrinkable bos. I don't think CI runs it because
of the execution time and insufficient memory allocation amount
heuristics. We should also file a jira to rewrite that test to a user-
space IGT test now that we support shrinkable bos. I'll take a look at
that.

Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

>=20
> > Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> > ---
> > =C2=A0drivers/gpu/drm/xe/xe_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 60
> > ++++++++++++++++++++++++++++++
> > =C2=A0drivers/gpu/drm/xe/xe_bo.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 3 ++
> > =C2=A0drivers/gpu/drm/xe/xe_vm_madvise.c | 13 +++++--
> > =C2=A03 files changed, 73 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c
> > b/drivers/gpu/drm/xe/xe_bo.c
> > index cc547915161d..2b1448ea3aed 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -836,6 +836,66 @@ static int xe_bo_move_notify(struct xe_bo *bo,
> > =C2=A0	return 0;
> > =C2=A0}
> > =C2=A0
> > +/**
> > + * xe_bo_set_purgeable_shrinker() - Mark BO purgeable and update
> > shrinker
> > + * @bo: Buffer object
> > + *
> > + * Transfers pages from shrinkable to purgeable bucket. Shrinker
> > can now
> > + * discard pages immediately without swapping. Caller holds BO
> > lock.
> > + */
> > +void xe_bo_set_purgeable_shrinker(struct xe_bo *bo)
> > +{
> > +	struct ttm_buffer_object *ttm_bo =3D &bo->ttm;
> > +	struct ttm_tt *tt =3D ttm_bo->ttm;
> > +	struct xe_device *xe =3D ttm_to_xe_device(ttm_bo->bdev);
> > +	struct xe_ttm_tt *xe_tt;
> > +
> > +	xe_bo_assert_held(bo);
> > +
> > +	if (!tt || !ttm_tt_is_populated(tt))
> > +		return;
> > +
> > +	xe_tt =3D container_of(tt, struct xe_ttm_tt, ttm);
> > +
> > +	if (!xe_tt->purgeable) {
> > +		xe_tt->purgeable =3D true;
> > +		/* Transfer pages from shrinkable to purgeable
> > count */
> > +		xe_shrinker_mod_pages(xe->mem.shrinker,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -(long)tt->num_pages,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tt->num_pages);
> > +	}
> > +}
> > +
> > +/**
> > + * xe_bo_clear_purgeable_shrinker() - Mark BO non-purgeable and
> > update shrinker
> > + * @bo: Buffer object
> > + *
> > + * Transfers pages from purgeable to shrinkable bucket. Shrinker
> > must now
> > + * swap pages instead of discarding. Caller holds BO lock.
> > + */
> > +void xe_bo_clear_purgeable_shrinker(struct xe_bo *bo)
> > +{
> > +	struct ttm_buffer_object *ttm_bo =3D &bo->ttm;
> > +	struct ttm_tt *tt =3D ttm_bo->ttm;
> > +	struct xe_device *xe =3D ttm_to_xe_device(ttm_bo->bdev);
> > +	struct xe_ttm_tt *xe_tt;
> > +
> > +	xe_bo_assert_held(bo);
> > +
> > +	if (!tt || !ttm_tt_is_populated(tt))
> > +		return;
> > +
> > +	xe_tt =3D container_of(tt, struct xe_ttm_tt, ttm);
> > +
> > +	if (xe_tt->purgeable) {
> > +		xe_tt->purgeable =3D false;
> > +		/* Transfer pages from purgeable to shrinkable
> > count */
> > +		xe_shrinker_mod_pages(xe->mem.shrinker,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tt->num_pages,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -(long)tt->num_pages);
> > +	}
> > +}
> > +
> > =C2=A0/**
> > =C2=A0 * xe_ttm_bo_purge() - Purge buffer object backing store
> > =C2=A0 * @ttm_bo: The TTM buffer object to purge
> > diff --git a/drivers/gpu/drm/xe/xe_bo.h
> > b/drivers/gpu/drm/xe/xe_bo.h
> > index 00e93b3065c9..681495e905af 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.h
> > +++ b/drivers/gpu/drm/xe/xe_bo.h
> > @@ -270,6 +270,9 @@ static inline bool
> > xe_bo_madv_is_dontneed(struct xe_bo *bo)
> > =C2=A0	return bo->madv_purgeable =3D=3D XE_MADV_PURGEABLE_DONTNEED;
> > =C2=A0}
> > =C2=A0
> > +void xe_bo_set_purgeable_shrinker(struct xe_bo *bo);
> > +void xe_bo_clear_purgeable_shrinker(struct xe_bo *bo);
> > +
> > =C2=A0static inline void xe_bo_unpin_map_no_vm(struct xe_bo *bo)
> > =C2=A0{
> > =C2=A0	if (likely(bo)) {
> > diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c
> > b/drivers/gpu/drm/xe/xe_vm_madvise.c
> > index 5808fef89777..0fb07a1ed3ae 100644
> > --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> > +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> > @@ -274,12 +274,16 @@ void
> > xe_bo_recheck_purgeable_on_vma_unbind(struct xe_bo *bo)
> > =C2=A0
> > =C2=A0	if (xe_bo_all_vmas_dontneed(bo)) {
> > =C2=A0		/* All VMAs are DONTNEED - mark BO purgeable */
> > -		if (bo->madv_purgeable !=3D
> > XE_MADV_PURGEABLE_DONTNEED)
> > +		if (bo->madv_purgeable !=3D
> > XE_MADV_PURGEABLE_DONTNEED) {
> > =C2=A0			bo->madv_purgeable =3D
> > XE_MADV_PURGEABLE_DONTNEED;
> > +			xe_bo_set_purgeable_shrinker(bo);
> > +		}
> > =C2=A0	} else {
> > =C2=A0		/* At least one VMA is WILLNEED - BO must not be
> > purgeable */
> > -		if (bo->madv_purgeable !=3D
> > XE_MADV_PURGEABLE_WILLNEED)
> > +		if (bo->madv_purgeable !=3D
> > XE_MADV_PURGEABLE_WILLNEED) {
> > =C2=A0			bo->madv_purgeable =3D
> > XE_MADV_PURGEABLE_WILLNEED;
> > +			xe_bo_clear_purgeable_shrinker(bo);
> > +		}
> > =C2=A0	}
> > =C2=A0}
> > =C2=A0
> > @@ -325,13 +329,16 @@ static bool xe_vm_madvise_purgeable_bo(struct
> > xe_device *xe, struct xe_vm *vm,
> > =C2=A0
> > =C2=A0			/* Mark VMA WILLNEED - BO becomes non-
> > purgeable immediately */
> > =C2=A0			bo->madv_purgeable =3D
> > XE_MADV_PURGEABLE_WILLNEED;
> > +			xe_bo_clear_purgeable_shrinker(bo);
> > =C2=A0			break;
> > =C2=A0		case DRM_XE_VMA_PURGEABLE_STATE_DONTNEED:
> > =C2=A0			vmas[i]->purgeable_state =3D
> > XE_MADV_PURGEABLE_DONTNEED;
> > =C2=A0
> > =C2=A0			/* Mark BO purgeable only if all VMAs are
> > DONTNEED */
> > -			if (xe_bo_all_vmas_dontneed(bo))
> > +			if (xe_bo_all_vmas_dontneed(bo)) {
> > =C2=A0				bo->madv_purgeable =3D
> > XE_MADV_PURGEABLE_DONTNEED;
> > +				xe_bo_set_purgeable_shrinker(bo);
> > +			}
> > =C2=A0			break;
> > =C2=A0		default:
> > =C2=A0			drm_warn(&vm->xe->drm, "Invalid madvice
> > value =3D %d\n",
> > --=20
> > 2.43.0
> >=20
