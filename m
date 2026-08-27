Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFC84C61DC7
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 11:16:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98BA310E3ED;
	Thu, 27 Aug 2026 11:16:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Zcyl7ez5";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A6D410E3ED
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Aug 2026 11:16:45 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 216E743DEA;
 Thu, 27 Aug 2026 11:16:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE73B1F000E9;
 Thu, 27 Aug 2026 11:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787829405;
 bh=SJUjaBBXC+DxSy1BBsyfEuE7h507cVK9XRYWFU5jGls=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=Zcyl7ez52iNE6SbNwu55aPj41oqGO3bI/cH/6dY2W9DVmkqIqNn8XtFRd04phpwGr
 UHHZbzKxTJv2GZx2WXYPm6R0GYsKs4yzt4A4oFMyGSqtdQRUPNfvR+w3B401AnuVZn
 i9qfgPQS0fHZevAFpFetFMRmqcRcok8Rhusprn0nUVlgW/DaNeZ8jk2My4C2Mj39Rl
 Jsnn39aEI1r9iBIHLbnYS4K6CvXX4mIYyUYV57ihsu6XrdKJrX2Vt/8h7EC5cuJlZT
 LDSZRBVvRrCsjxMNsNDwB/KSTeyFeFCocxpbno2Gl7yrGFaL1Dqx5pTmkr/oQt0G49
 ZZ7BfyzMhP6lA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/4] drm/xe/guc: Split GuC ID manager into usable and
 shareable pools
To: =?utf-8?b?UGnDs3Jrb3dza2ksIFBpb3Ry?= <piotr.piorkowski@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260827105750.1248792-2-piotr.piorkowski@intel.com>
References: <20260827105750.1248792-1-piotr.piorkowski@intel.com>
 <20260827105750.1248792-2-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 27 Aug 2026 11:16:44 +0000
Message-Id: <20260827111644.CE73B1F000E9@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] VF-exclusive ID allocations incorrectly fail with -EDQUOT when the=
 PF exceeds its usable spare quota.
- [Low] Redundant and unreachable bounds check in `idm_reserve_chunk_sharea=
ble_locked`.
--

commit 3e38a9d8d7cef76aa3a1600296b4b451c5ffa3ff
Author: Piotr Pi=C3=B3rkowski <piotr.piorkowski@intel.com>
Subject: drm/xe/guc: Split GuC ID manager into usable and shareable pools

Modify the GuC identifier manager so that it distinguishes between usable G=
uC
IDs allocated for GuC submissions, and shareable those that can be shared
with VFs. Both pools are represented as a single bitmap and may overlap. For
now, let's keep the current allocation behaviour by mapping both pools onto
the same GuC ID space.

> diff --git a/drivers/gpu/drm/xe/xe_guc_id_mgr.c b/drivers/gpu/drm/xe/xe_g=
uc_id_mgr.c
> index e845425d670be..2c181d2805525 100644
> --- a/drivers/gpu/drm/xe/xe_guc_id_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_guc_id_mgr.c
[ ... ]
> +static int idm_reserve_chunk_shareable_locked(struct xe_guc_id_mgr *idm,=
 unsigned int count,
> +					      unsigned int spare)
> +{
> +	unsigned int shareable_start =3D idm_shareable_start(idm);
> +	unsigned int total =3D idm_total(idm);
> +	int id;
> +
> +	idm_assert(idm, count);
> +	lockdep_assert_held(idm_mutex(idm));
> +
> +	if (!idm->shareable)
> +		return -ENODATA;
> +
> +	if (shareable_start < idm->usable) {
> +		/*
> +		 * Spare is meaningful only for IDs that are shared between usable and
> +		 * shareable pools. For non-overlapping pools, shareable reservations =
do
> +		 * not reduce PF usable capacity, so there is nothing to retain.
> +		 */
> +		id =3D idm_find_last_zero_area_in_range(idm->bitmap, shareable_start, =
total, count);
> +		if (id >=3D total)
> +			return -ENOSPC;
> +
> +		if (spare) {
> +			unsigned int used_usable =3D bitmap_weight(idm->bitmap, idm->usable);
> +			unsigned int overlap_start =3D max_t(int, id, shareable_start);
> +			unsigned int overlap_end =3D min(id + count, idm->usable);
> +			unsigned int need_overlap =3D overlap_end > overlap_start ?
> +						    overlap_end - overlap_start : 0;
> +
> +			if (used_usable + need_overlap + spare > idm->usable)
> +				return -EDQUOT;

[Severity: High]
Can this logic inadvertently deny VF provisioning when the PF exceeds its
usable spare quota, even if the requested IDs fall entirely in the
non-overlapping pool?

If need_overlap is 0, the allocation does not consume any usable IDs.
However, if used_usable + spare > idm->usable due to PF load, this check
will fail the VF allocation with -EDQUOT.

> +		}
> +	} else {
> +		id =3D bitmap_find_next_zero_area(idm->bitmap, total, shareable_start,=
 count, 0);
> +		if (id + count > total)
> +			return -ENOSPC;
> +		if (id < shareable_start)
> +			return -ENOSPC;

[Severity: Low]
Is this check for id < shareable_start necessary?

Since bitmap_find_next_zero_area() is called with shareable_start as the
start parameter, the returned id should be mathematically guaranteed to be
>=3D shareable_start, making this bounds check redundant.

> +	}
> +
> +	bitmap_set(idm->bitmap, id, count);
> +
> +	return id;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260827105750.1248=
792-1-piotr.piorkowski@intel.com?part=3D1
