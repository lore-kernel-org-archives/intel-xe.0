Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FFB0C61DC2
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 10:44:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2485310E63D;
	Thu, 27 Aug 2026 10:44:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KZKpS4er";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB27110E63D
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Aug 2026 10:44:11 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 9066D4018A;
 Thu, 27 Aug 2026 10:44:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A5151F000E9;
 Thu, 27 Aug 2026 10:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787827451;
 bh=agPzSagWBgotKYrwpEMVVaKXM2Qpb/lsikvmxR0Q4Sk=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=KZKpS4erOb40rW1SuvgOEGK4qfXtQD0aeHPJyFmXh6Q5SkbOKwCbxTWbsXqyfiRBz
 4rgdbstvEG8XEMGtmGTaRiAh1uvcEG4hMJn3Hxj7X6bF3bikOYDuGNoSTJ9jkIIyQZ
 ySFKGiOhR7GvEmLunf28v9lPm3M6nFCgq2DG1WXhRJuFX7wtHBhLHiRxmEA8LUvg0j
 Sl8gDGdI/oDWzRc4ZJm+vg0LJkVwMG+5DdfhLu+e+V7Wla1jABwgCg7QiL3p/0fKx8
 XFH0G3lK9nE76DoF1551FUbX+0x3jrwVdTcNENFtTWk3pVQQjAvdrztglFzUNRC3AU
 OJaXDzLTJWFqQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/4] drm/xe/kunit: Extend GuC ID manager split-pool
 coverage
To: =?utf-8?b?UGnDs3Jrb3dza2ksIFBpb3Ry?= <piotr.piorkowski@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260827102902.1236918-3-piotr.piorkowski@intel.com>
References: <20260827102902.1236918-1-piotr.piorkowski@intel.com>
 <20260827102902.1236918-3-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 27 Aug 2026 10:44:10 +0000
Message-Id: <20260827104411.4A5151F000E9@smtp.kernel.org>
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
- [Medium] Missing failure guards in multiple KUnit tests (e.g., check_spli=
t_boundaries, check_overlap_partial_init, check_all, check_used) trigger ke=
rnel assertions when ID reservations fail.
--

commit 7c9d7d30bf5be71855d8dd170fb19ba5954562d9
Author: Piotr Pi=C3=B3rkowski <piotr.piorkowski@intel.com>

drm/xe/kunit: Extend GuC ID manager split-pool coverage

Expand the GuC ID manager KUnit coverage to exercise the new
usable/shareable pool model.

> diff --git a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c b/drivers/gpu/=
drm/xe/tests/xe_guc_id_mgr_test.c
> index 78d3de46b7572..bf5d2beaaeadd 100644
> --- a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
> +++ b/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c

[ ... ]

> @@ -94,14 +156,485 @@ static void check_all(struct kunit *test)
>  	mutex_lock(idm_mutex(idm));
> =20
>  	for (n =3D 0; n < idm_total(idm); n++)
> -		KUNIT_EXPECT_LE(test, 0, xe_guc_id_mgr_reserve_usable_locked(idm, 1));
> -	KUNIT_EXPECT_EQ(test, bitmap_weight(idm->bitmap, idm_total(idm)), idm_t=
otal(idm));
> +		KUNIT_EXPECT_GE(test, xe_guc_id_mgr_reserve_usable_locked(idm, 1), 0);
> +	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), idm_total(idm));
>  	for (n =3D 0; n < idm_total(idm); n++)
>  		idm_release_chunk_locked(idm, n, 1);

[Severity: Medium]
If any single bit reservation fails during the loop, will the subsequent
release loop unconditionally attempt to release every bit index up to
idm_total(idm)? This appears to bypass bounds checks and trigger a kernel W=
ARN
when attempting to release an unreserved bit. Should we add a guard before
releasing these allocations?

[ ... ]

> +static void check_overlap_partial_init(struct kunit *test)
> +{
> +	struct xe_guc_id_mgr *idm =3D test->priv;
> +	unsigned int pools_size =3D (GUC_ID_MAX / 3) * 2;
> +	unsigned int shareable_start;
> +	unsigned int rest;
> +	int id;
> +
> +	if (!require_iov_config_or_skip(test))
> +		return;
> +
> +	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, pools_size, pools_size));
> +
> +	mutex_lock(idm_mutex(idm));
> +
> +	shareable_start =3D idm_shareable_start(idm);
> +	rest =3D idm_total(idm) - pools_size;
> +
> +	KUNIT_EXPECT_EQ(test, idm_total(idm), GUC_ID_MAX);
> +	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_max_usable(idm), pools_size);
> +	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_max_shareable(idm), pools_size);
> +	KUNIT_EXPECT_EQ(test, shareable_start, GUC_ID_MAX - pools_size);
> +
> +	id =3D xe_guc_id_mgr_reserve_usable_locked(idm, pools_size);
> +	KUNIT_EXPECT_EQ(test, id, 0);
> +
> +	id =3D xe_guc_id_mgr_reserve_shareable_locked(idm, rest, 0);
> +	KUNIT_EXPECT_EQ(test, id, pools_size);
> +
> +	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), GUC_ID_MAX);
> +	KUNIT_EXPECT_EQ(test, idm_used_usable(idm), pools_size);
> +	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), pools_size);
> +
> +	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_usable_locked(idm, 0, pools=
_size), 0);

[Severity: Medium]
If the reservation for id fails here, will passing the constant 0 to
xe_guc_id_mgr_release_usable_locked() bypass the initial -ERANGE bounds che=
ck?
It looks like this would reach the internal bit-clearing logic and trip the
test_bit() assertion. Would it be better to verify the reservation succeeded
before releasing?

> +	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_shareable_locked(idm, pools=
_size, rest), 0);
> +	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), 0);
> +
> +	mutex_unlock(idm_mutex(idm));
> +}

[ ... ]

> +static void check_split_boundaries(struct kunit *test)
> +{
> +	struct xe_guc_id_mgr *idm =3D test->priv;
> +	unsigned int shareable_start;
> +	int id;
> +
> +	if (!require_iov_config_or_skip(test))
> +		return;
> +
> +	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, 4, 4));
> +
> +	mutex_lock(idm_mutex(idm));
> +
> +	shareable_start =3D idm_shareable_start(idm);
> +
> +	id =3D xe_guc_id_mgr_reserve_usable_locked(idm, 4);
> +	KUNIT_EXPECT_EQ(test, id, 0);
> +	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_usable_locked(idm, 1), -ENO=
SPC);
> +
> +	id =3D xe_guc_id_mgr_reserve_shareable_locked(idm, 4, 0);
> +	KUNIT_EXPECT_EQ(test, id, shareable_start);
> +	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_shareable_locked(idm, 1, 0)=
, -ENOSPC);
> +
> +	KUNIT_EXPECT_EQ(test, idm_used_usable(idm), 4);
> +	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), 4);
> +
> +	idm_release_chunk_locked(idm, 0, 4);
> +	idm_release_chunk_locked(idm, shareable_start, 4);

[Severity: Medium]
If the initial reservations fail, will this unconditional release of consta=
nt
ranges 0 and shareable_start trigger idm_assert()? Unlike other tests, there
are no failure guards here before releasing the allocations.

> +	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), 0);
> +
> +	mutex_unlock(idm_mutex(idm));
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260827102902.1236=
918-1-piotr.piorkowski@intel.com?part=3D2
