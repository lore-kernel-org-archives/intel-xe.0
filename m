Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 318EDC5DF66
	for <intel-xe@archiver.kernel.org>; Mon, 17 Aug 2026 09:24:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E557D10E3F3;
	Mon, 17 Aug 2026 09:24:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Sx958O7u";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7C3810E3F3
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Aug 2026 09:24:56 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id B0178416DC;
 Mon, 17 Aug 2026 09:24:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69F3C1F000E9;
 Mon, 17 Aug 2026 09:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1786958696;
 bh=jyNG8O5+ePnPMff8vdebXhNpi5n4IgNmTwY14pZy6Rk=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=Sx958O7uRcKlyGX+L0xigw66QfQSy0MZ7Ku4QVKSefjBpEtWYWWHI0zYtPBaMsbLK
 bzVlZPttmjgRTd/X6GLc92Xg59HMKAMNQhfP05VEHXFnXJvyWcEh/hMGS7304dPz6y
 6Hd3vmzx6eXroY3ZqU/CCrXHfwwlAYDvUtbRVAf5VsO7DBugWezJw/8XMBz2BiIKCg
 3fJxJr/1kO4OlKj2HLY18Tcf5T8vWNGxidEvaQTD/OoirChsXZHffnRLXVvaPJ2mHO
 jQqG8cohJ8VU5RO2KfsPmVTfFdIVY82DhHnOnYZsr3Do55QiCTQFxEfPan2Nr/BZ1z
 x7Wy3RvmLEhTQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/4] drm/xe/guc: Split GuC ID manager into usable and
 shareable pools
To: =?utf-8?b?UGnDs3Jrb3dza2ksIFBpb3Ry?= <piotr.piorkowski@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260817091013.280173-2-piotr.piorkowski@intel.com>
References: <20260817091013.280173-1-piotr.piorkowski@intel.com>
 <20260817091013.280173-2-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 Aug 2026 09:24:56 +0000
Message-Id: <20260817092456.69F3C1F000E9@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Flawed quota check in `idm_reserve_chunk_shareable_locked()` all=
ows VFs to bypass the PF's spare ID limits due to free-space fragmentation.
--

--- Patch [1]: [PATCH v2 1/4] drm/xe/guc: Split GuC ID manager into usable =
and shareable pools ---
commit 8c49ff8930e2fc8ce16d38b0a4e9813aa986a134
Author: Piotr Pi=C3=B3rkowski <piotr.piorkowski@intel.com>

drm/xe/guc: Split GuC ID manager into usable and shareable pools

This commit modifies the GuC identifier manager to separate usable GuC IDs
(for submissions) from shareable ones (for VFs). Both pools are mapped to
the same underlying bitmap and can overlap, with new helpers added to
manage the separate capacities and quotas.

> diff --git a/drivers/gpu/drm/xe/xe_guc_id_mgr.c b/drivers/gpu/drm/xe/xe_g=
uc_id_mgr.c
> index e845425d670be..08e72af2735ff 100644
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
> +		if (spare) {
> +			unsigned int used_overlap =3D bitmap_weight(idm->bitmap, idm->usable)=
 -
> +						    bitmap_weight(idm->bitmap, shareable_start);
> +			unsigned int shared_tail =3D total - idm->usable;
> +			unsigned int used_tail =3D bitmap_weight(idm->bitmap, total) -
> +						 bitmap_weight(idm->bitmap, idm->usable);
> +			unsigned int free_tail =3D shared_tail - used_tail;
> +			unsigned int need_overlap =3D count > free_tail ? count - free_tail :=
 0;
> +			unsigned int overlap =3D idm->usable - shareable_start;
> +
> +			if (used_overlap + need_overlap + spare > overlap)
> +				return -EDQUOT;
> +		}
> +
> +		/* For overlapping pools, prefer allocating from the end. */
> +		id =3D idm_find_last_zero_area_in_range(idm->bitmap, shareable_start, =
total, count);

[Severity: Medium]
Does this quota check correctly account for fragmentation in the tail?

It looks like free_tail is a raw count of unset bits. Since the allocator
idm_find_last_zero_area_in_range() searches for contiguous bits, couldn't it
skip a fragmented tail and allocate directly from the shared overlap region?

If this happens, it seems the allocation would bypass the need_overlap quota
assumption and potentially allow VFs to consume GuC IDs beyond the PF's spa=
re
limits, starving the PF of usable contexts.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260817091013.2801=
73-1-piotr.piorkowski@intel.com?part=3D1
