Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4367EFCD9F
	for <intel-xe@archiver.kernel.org>; Tue, 10 Mar 2026 10:01:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70C4710E6AE;
	Tue, 10 Mar 2026 10:01:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cWAd91iD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53DA510E6AF
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Mar 2026 10:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773136873; x=1804672873;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=S62VDTXrNaqlueU7WAH3GUYEhuu4NgMhKy5FfS4eUmY=;
 b=cWAd91iDotUkTfppTw6k2VYAMjtwxZVz8xU2/E2J6eAFofIvs2in53Sw
 cLl30urakkEjsnwDQUgJIsK7+FO2oP/U9qZ5wYp2ztGj7BRKEfYOJ1JJj
 22U3u/fgsFqLdHqOomMUGD5mbQhxhfzDDk3ui9xJx4VY6IEVD5H2LymKO
 P4k3CQ/cz1Ruf+eoXkbrSI7Nk7axC7OMK1tOKYAtsVD+amqUqFkuf8Hms
 Wj2aJRhjwOzn7NfRltR0Z/Ct/DyeCtypVb91yQyLUf0AF48IAjiheTmjA
 UjXRW1QZIJpPoDJt8gwA/JInfBIHIXUlth5GrG/2sKoaJtTkTuwbYrH84 Q==;
X-CSE-ConnectionGUID: ajzhuV23Q7OuVsPTYyTZvg==
X-CSE-MsgGUID: pz7KE1Z9RC63efuhRBuBXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="84890470"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="84890470"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 03:01:13 -0700
X-CSE-ConnectionGUID: UqeXBx3BSIuPBfZus81pGg==
X-CSE-MsgGUID: NtSGQx0YRBWe17Y3i/IdYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="220236127"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO [10.245.244.39])
 ([10.245.244.39])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 03:01:11 -0700
Message-ID: <fd01cee5878be605002e2a4f349be9f5b76010a6.camel@linux.intel.com>
Subject: Re: [PATCH v6 10/12] drm/xe/bo: Add purgeable shrinker state helpers
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Arvind Yadav <arvind.yadav@intel.com>, intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com, 
 pallavi.mishra@intel.com
Date: Tue, 10 Mar 2026 11:01:09 +0100
In-Reply-To: <20260303152015.3499248-11-arvind.yadav@intel.com>
References: <20260303152015.3499248-1-arvind.yadav@intel.com>
 <20260303152015.3499248-11-arvind.yadav@intel.com>
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

On Tue, 2026-03-03 at 20:50 +0530, Arvind Yadav wrote:
> Encapsulate TTM purgeable flag updates and shrinker page accounting
> into helper functions. This prevents desynchronization between the
> TTM tt->purgeable flag and the shrinker's page bucket counters.
>=20
> Without these helpers, direct manipulation of xe_ttm_tt->purgeable
> risks forgetting to update the corresponding shrinker counters,
> leading to incorrect memory pressure calculations.
>=20
> Add xe_bo_set_purgeable_shrinker() and
> xe_bo_clear_purgeable_shrinker()
> which atomically update both the TTM flag and transfer pages between
> the shrinkable and purgeable buckets.
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
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 63
> ++++++++++++++++++++++++++++++
> =C2=A0drivers/gpu/drm/xe/xe_bo.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 2 +
> =C2=A0drivers/gpu/drm/xe/xe_vm_madvise.c |=C2=A0 8 +++-
> =C2=A03 files changed, 71 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 3a4965bdadf2..598d4463baf3 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -863,6 +863,66 @@ void xe_bo_set_purgeable_state(struct xe_bo *bo,
> =C2=A0	bo->madv_purgeable =3D new_state;
> =C2=A0}
> =C2=A0
> +/**
> + * xe_bo_set_purgeable_shrinker() - Mark BO purgeable and update
> shrinker
> + * @bo: Buffer object
> + *
> + * Transfers pages from shrinkable to purgeable bucket. Shrinker can
> now
> + * discard pages immediately without swapping. Caller holds BO lock.
> + */
> +void xe_bo_set_purgeable_shrinker(struct xe_bo *bo)
> +{
> +	struct ttm_buffer_object *ttm_bo =3D &bo->ttm;
> +	struct ttm_tt *tt =3D ttm_bo->ttm;
> +	struct xe_device *xe =3D ttm_to_xe_device(ttm_bo->bdev);
> +	struct xe_ttm_tt *xe_tt;
> +
> +	xe_bo_assert_held(bo);
> +
> +	if (!tt || !ttm_tt_is_populated(tt))
> +		return;
> +
> +	xe_tt =3D container_of(tt, struct xe_ttm_tt, ttm);
> +
> +	if (!xe_tt->purgeable) {
> +		xe_tt->purgeable =3D true;
> +		/* Transfer pages from shrinkable to purgeable count
> */
> +		xe_shrinker_mod_pages(xe->mem.shrinker,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -(long)tt->num_pages,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tt->num_pages);
> +	}
> +}
> +
> +/**
> + * xe_bo_clear_purgeable_shrinker() - Mark BO non-purgeable and
> update shrinker
> + * @bo: Buffer object
> + *
> + * Transfers pages from purgeable to shrinkable bucket. Shrinker
> must now
> + * swap pages instead of discarding. Caller holds BO lock.
> + */
> +void xe_bo_clear_purgeable_shrinker(struct xe_bo *bo)
> +{
> +	struct ttm_buffer_object *ttm_bo =3D &bo->ttm;
> +	struct ttm_tt *tt =3D ttm_bo->ttm;
> +	struct xe_device *xe =3D ttm_to_xe_device(ttm_bo->bdev);
> +	struct xe_ttm_tt *xe_tt;
> +
> +	xe_bo_assert_held(bo);
> +
> +	if (!tt || !ttm_tt_is_populated(tt))
> +		return;
> +
> +	xe_tt =3D container_of(tt, struct xe_ttm_tt, ttm);
> +
> +	if (xe_tt->purgeable) {
> +		xe_tt->purgeable =3D false;
> +		/* Transfer pages from purgeable to shrinkable count
> */
> +		xe_shrinker_mod_pages(xe->mem.shrinker,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tt->num_pages,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -(long)tt->num_pages);
> +	}
> +}
> +
> =C2=A0/**
> =C2=A0 * xe_ttm_bo_purge() - Purge buffer object backing store
> =C2=A0 * @ttm_bo: The TTM buffer object to purge
> @@ -1243,6 +1303,9 @@ long xe_bo_shrink(struct ttm_operation_ctx
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
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 0d9f25b51eb2..46d1fff10e4f 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -272,6 +272,8 @@ static inline bool xe_bo_madv_is_dontneed(struct
> xe_bo *bo)
> =C2=A0}
> =C2=A0
> =C2=A0void xe_bo_set_purgeable_state(struct xe_bo *bo, enum
> xe_madv_purgeable_state new_state);
> +void xe_bo_set_purgeable_shrinker(struct xe_bo *bo);
> +void xe_bo_clear_purgeable_shrinker(struct xe_bo *bo);
> =C2=A0
> =C2=A0static inline void xe_bo_unpin_map_no_vm(struct xe_bo *bo)
> =C2=A0{
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c
> b/drivers/gpu/drm/xe/xe_vm_madvise.c
> index 8acc19e25aa5..ab83e94980e4 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -312,12 +312,16 @@ void xe_bo_recompute_purgeable_state(struct
> xe_bo *bo)
> =C2=A0
> =C2=A0	if (vma_state =3D=3D XE_BO_VMAS_STATE_DONTNEED) {
> =C2=A0		/* All VMAs are DONTNEED - mark BO purgeable */
> -		if (bo->madv_purgeable !=3D
> XE_MADV_PURGEABLE_DONTNEED)
> +		if (bo->madv_purgeable !=3D
> XE_MADV_PURGEABLE_DONTNEED) {
> =C2=A0			xe_bo_set_purgeable_state(bo,
> XE_MADV_PURGEABLE_DONTNEED);
> +			xe_bo_set_purgeable_shrinker(bo);
> +		}
> =C2=A0	} else if (vma_state =3D=3D XE_BO_VMAS_STATE_WILLNEED) {
> =C2=A0		/* At least one VMA is WILLNEED - BO must not be
> purgeable */
> -		if (bo->madv_purgeable !=3D
> XE_MADV_PURGEABLE_WILLNEED)
> +		if (bo->madv_purgeable !=3D
> XE_MADV_PURGEABLE_WILLNEED) {
> =C2=A0			xe_bo_set_purgeable_state(bo,
> XE_MADV_PURGEABLE_WILLNEED);
> +			xe_bo_clear_purgeable_shrinker(bo);
> +		}
> =C2=A0	}
> =C2=A0	/* XE_BO_VMAS_STATE_NO_VMAS: Preserve existing BO state */
> =C2=A0}

I think this can be simplified a bit using something like the below
applied after the above patch: (untested).

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 07acce383cb1..9f0885cd3cfd 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -835,47 +835,14 @@ static int xe_bo_move_notify(struct xe_bo *bo,
 	return 0;
 }
=20
-/**
- * xe_bo_set_purgeable_state() - Set BO purgeable state with
validation
- * @bo: Buffer object
- * @new_state: New purgeable state
- *
- * Sets the purgeable state with lockdep assertions and validates
state
- * transitions. Once a BO is PURGED, it cannot transition to any other
state.
- * Invalid transitions are caught with xe_assert().
- */
-void xe_bo_set_purgeable_state(struct xe_bo *bo,
-			       enum xe_madv_purgeable_state new_state)
-{
-	struct xe_device *xe =3D xe_bo_device(bo);
-
-	xe_bo_assert_held(bo);
-
-	/* Validate state is one of the known values */
-	xe_assert(xe, new_state =3D=3D XE_MADV_PURGEABLE_WILLNEED ||
-		      new_state =3D=3D XE_MADV_PURGEABLE_DONTNEED ||
-		      new_state =3D=3D XE_MADV_PURGEABLE_PURGED);
-
-	/* Once purged, always purged - cannot transition out */
-	xe_assert(xe, !(bo->madv_purgeable =3D=3D XE_MADV_PURGEABLE_PURGED
&&
-			new_state !=3D XE_MADV_PURGEABLE_PURGED));
-
-	bo->madv_purgeable =3D new_state;
-}
-
-/**
- * xe_bo_set_purgeable_shrinker() - Mark BO purgeable and update
shrinker
- * @bo: Buffer object
- *
- * Transfers pages from shrinkable to purgeable bucket. Shrinker can
now
- * discard pages immediately without swapping. Caller holds BO lock.
- */
-void xe_bo_set_purgeable_shrinker(struct xe_bo *bo)
+static void xe_bo_set_purgeable_shrinker(struct xe_bo *bo, enum
xe_madv_purgeable_state new_state)
+					=20
 {
 	struct ttm_buffer_object *ttm_bo =3D &bo->ttm;
 	struct ttm_tt *tt =3D ttm_bo->ttm;
 	struct xe_device *xe =3D ttm_to_xe_device(ttm_bo->bdev);
 	struct xe_ttm_tt *xe_tt;
+	long int tt_pages;
=20
 	xe_bo_assert_held(bo);
=20
@@ -883,44 +850,44 @@ void xe_bo_set_purgeable_shrinker(struct xe_bo
*bo)
 		return;
=20
 	xe_tt =3D container_of(tt, struct xe_ttm_tt, ttm);
-
-	if (!xe_tt->purgeable) {
+	tt_pages =3D tt->num_pages;
+=09
+	if (!xe_tt->purgeable && new_state =3D=3D
XE_MADV_PURGEABLE_DONTNEED) {
 		xe_tt->purgeable =3D true;
-		/* Transfer pages from shrinkable to purgeable count
*/
-		xe_shrinker_mod_pages(xe->mem.shrinker,
-				      -(long)tt->num_pages,
-				      tt->num_pages);
+		xe_shrinker_mod_pages(xe->mem.shrinker, -tt_pages,
tt_pages);
+	} else if (xe_tt->purgeable && new_state =3D=3D
XE_MADV_PURGEABLE_WILLNEED) {
+		xe_tt->purgeable =3D false;
+		xe_shrinker_mod_pages(xe->mem.shrinker, tt_pages, -
tt_pages);
 	}
 }
=20
 /**
- * xe_bo_clear_purgeable_shrinker() - Mark BO non-purgeable and update
shrinker
+ * xe_bo_set_purgeable_state() - Set BO purgeable state with
validation
  * @bo: Buffer object
+ * @new_state: New purgeable state
  *
- * Transfers pages from purgeable to shrinkable bucket. Shrinker must
now
- * swap pages instead of discarding. Caller holds BO lock.
+ * Sets the purgeable state with lockdep assertions and validates
state
+ * transitions. Once a BO is PURGED, it cannot transition to any other
state.
+ * Invalid transitions are caught with xe_assert().
  */
-void xe_bo_clear_purgeable_shrinker(struct xe_bo *bo)
+void xe_bo_set_purgeable_state(struct xe_bo *bo
+,			       enum xe_madv_purgeable_state new_state)
 {
-	struct ttm_buffer_object *ttm_bo =3D &bo->ttm;
-	struct ttm_tt *tt =3D ttm_bo->ttm;
-	struct xe_device *xe =3D ttm_to_xe_device(ttm_bo->bdev);
-	struct xe_ttm_tt *xe_tt;
+	struct xe_device *xe =3D xe_bo_device(bo);
=20
 	xe_bo_assert_held(bo);
=20
-	if (!tt || !ttm_tt_is_populated(tt))
-		return;
+	/* Validate state is one of the known values */
+	xe_assert(xe, new_state =3D=3D XE_MADV_PURGEABLE_WILLNEED ||
+		      new_state =3D=3D XE_MADV_PURGEABLE_DONTNEED ||
+		      new_state =3D=3D XE_MADV_PURGEABLE_PURGED);
=20
-	xe_tt =3D container_of(tt, struct xe_ttm_tt, ttm);
+	/* Once purged, always purged - cannot transition out */
+	xe_assert(xe, !(bo->madv_purgeable =3D=3D XE_MADV_PURGEABLE_PURGED
&&
+			new_state !=3D XE_MADV_PURGEABLE_PURGED));
=20
-	if (xe_tt->purgeable) {
-		xe_tt->purgeable =3D false;
-		/* Transfer pages from purgeable to shrinkable count
*/
-		xe_shrinker_mod_pages(xe->mem.shrinker,
-				      tt->num_pages,
-				      -(long)tt->num_pages);
-	}
+	bo->madv_purgeable =3D new_state;
+	xe_bo_set_purgeable_shrinker(bo, new_state);
 }
=20
 /**
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 46d1fff10e4f..0d9f25b51eb2 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -272,8 +272,6 @@ static inline bool xe_bo_madv_is_dontneed(struct
xe_bo *bo)
 }
=20
 void xe_bo_set_purgeable_state(struct xe_bo *bo, enum
xe_madv_purgeable_state new_state);
-void xe_bo_set_purgeable_shrinker(struct xe_bo *bo);
-void xe_bo_clear_purgeable_shrinker(struct xe_bo *bo);
=20
 static inline void xe_bo_unpin_map_no_vm(struct xe_bo *bo)
 {








