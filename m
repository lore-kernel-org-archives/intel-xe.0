Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FA00C5DF66
	for <intel-xe@archiver.kernel.org>; Mon, 17 Aug 2026 09:24:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50F6110E3F3;
	Mon, 17 Aug 2026 09:24:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="a3M/DrOO";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A779C10E3F3
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Aug 2026 09:24:00 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 4ECAE406CA;
 Mon, 17 Aug 2026 09:24:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07EA41F000E9;
 Mon, 17 Aug 2026 09:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1786958640;
 bh=JyT1HZO2VcuN/PCDgOybSL6Gh74FWLzN3SzvTe56i1A=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=a3M/DrOOzALcA2OukFFrpKwn1U5CNIZhQB+Nq9YkhbaQXYg9xjBtgH9aUu5g1xZqO
 r8/QGbsVZKpv39K91AmZf6t9+XZx0Cub5Tqj0BR37TE+EnRmbjMqYe7uJZ67yzXW1d
 Rj8VbkHa4aiukfToJw5isW+SQMDXwDxTuWpPSGlYeNz6PYKWXspDkkeDpDRA/DoMXW
 mIQqeFFuXTmDlFJHXRWwtRBKfojyTowqjepCXBs4oemJKkmqJkaCi8ScQevrShkqBs
 1RHDj8hO5R7q490BjWZwL1ZWQcwx3vcNcqLLqbcinfxchVMok+QslAZUPrm+t85yqg
 VGrH1IR1hgB/Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/4] drm/xe/kunit: Extend GuC ID manager split-pool
 coverage
To: =?utf-8?b?UGnDs3Jrb3dza2ksIFBpb3Ry?= <piotr.piorkowski@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260817091013.280173-3-piotr.piorkowski@intel.com>
References: <20260817091013.280173-1-piotr.piorkowski@intel.com>
 <20260817091013.280173-3-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 Aug 2026 09:23:59 +0000
Message-Id: <20260817092400.07EA41F000E9@smtp.kernel.org>
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
- [High] Out-of-bounds memory write via `bitmap_clear()` if a resource allo=
cation fails during KUnit tests.
--

--- Patch [2]: [PATCH v2 2/4] drm/xe/kunit: Extend GuC ID manager split-poo=
l coverage ---
commit de07034d7b51f00db6617697a552f2ac15c74f32
Author: Piotr Pi=C3=B3rkowski <piotr.piorkowski@intel.com>

drm/xe/kunit: Extend GuC ID manager split-pool coverage

Expand the GuC ID manager KUnit coverage to exercise the new
usable/shareable pool model.

> diff --git a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c b/drivers/gpu/=
drm/xe/tests/xe_guc_id_mgr_test.c
> index 103ea82d278e3..295c17dbc21fb 100644
> --- a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
> +++ b/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c

[ ... ]

> +static void check_used_usable(struct kunit *test)
> +{
> +	struct xe_guc_id_mgr *idm =3D test->priv;
> +	int id;
> +
> +	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, 8, 8));
> +
> +	mutex_lock(idm_mutex(idm));
> +
> +	KUNIT_EXPECT_EQ(test, idm_used_usable(idm), 0);
> +	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), 0);
> +
> +	id =3D xe_guc_id_mgr_reserve_usable_locked(idm, 2);
> +	KUNIT_EXPECT_GE(test, id, 0);

[Severity: High]
The commit message notes that KUNIT_EXPECT is used instead of KUNIT_ASSERT =
to
avoid leaking the mutex on failure. However, if the reservation fails and
returns a negative error code, KUNIT_EXPECT_GE() will allow execution to
continue.

Since idm_release_chunk_locked() takes an unsigned int for the start positi=
on,
will passing a negative id result in an implicit cast to a huge unsigned
integer, causing an out-of-bounds write in bitmap_clear() when the chunk is
released below?

Would it be better to use a conditional check to handle the error and unlock
the mutex before returning, rather than letting the test continue with a
negative id?

> +
> +	KUNIT_EXPECT_EQ(test, idm_used_usable(idm), 2);
> +	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), 0);
> +	KUNIT_EXPECT_EQ(test, idm_used_total(idm), 2);
> +
> +	idm_release_chunk_locked(idm, id, 2);
> +	KUNIT_EXPECT_EQ(test, idm_used_total(idm), 0);
> +
> +	mutex_unlock(idm_mutex(idm));
> +}
> +
> +static void check_used_shareable(struct kunit *test)
> +{
> +	struct xe_guc_id_mgr *idm =3D test->priv;
> +	unsigned int shareable_start;
> +	int id;
> +
> +	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, 8, 8));
> +
> +	mutex_lock(idm_mutex(idm));
> +	shareable_start =3D idm_shareable_start(idm);
> +
> +	KUNIT_EXPECT_EQ(test, idm_used_usable(idm), 0);
> +	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), 0);
> +
> +	id =3D xe_guc_id_mgr_reserve_shareable_locked(idm, 3, 0);
> +	KUNIT_EXPECT_EQ(test, id, shareable_start);

[Severity: High]
Could the same out-of-bounds write happen here if id is a negative error
code? KUNIT_EXPECT_EQ() does not abort the test, so idm_release_chunk_locke=
d()
would process a negative id.

> +
> +	KUNIT_EXPECT_EQ(test, idm_used_usable(idm), 0);
> +	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), 3);
> +	KUNIT_EXPECT_EQ(test, idm_used_total(idm), 3);
> +
> +	idm_release_chunk_locked(idm, id, 3);
> +	KUNIT_EXPECT_EQ(test, idm_used_total(idm), 0);
> +
> +	mutex_unlock(idm_mutex(idm));
> +}

[ ... ]

> +static void check_shareable_spare(struct kunit *test)
> +{
> +	struct xe_guc_id_mgr *idm =3D test->priv;
> +	unsigned int pools_size =3D (GUC_ID_MAX / 3) * 2;
> +	unsigned int shareable_start;
> +	unsigned int overlap_size;
> +	unsigned int shared_tail;
> +	int id_tail, id_overlap;
> +
> +	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, pools_size, pools_size));
> +
> +	mutex_lock(idm_mutex(idm));
> +	shareable_start =3D idm_shareable_start(idm);
> +	overlap_size =3D idm->usable - shareable_start;
> +	shared_tail =3D idm_total(idm) - idm->usable;
> +
> +	KUNIT_EXPECT_GT(test, overlap_size, 0);
> +	KUNIT_EXPECT_GT(test, shared_tail, 0);
> +
> +	id_tail =3D xe_guc_id_mgr_reserve_shareable_locked(idm, shared_tail, 1);
> +	KUNIT_EXPECT_EQ(test, id_tail, idm->usable);

[Severity: High]
Similar to the above, if id_tail is assigned a negative error code upon fai=
lure,
it will eventually be passed to idm_release_chunk_locked() since KUNIT_EXPE=
CT_EQ()
does not halt execution.

> +	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), shared_tail);
> +
> +	id_overlap =3D xe_guc_id_mgr_reserve_shareable_locked(idm, overlap_size=
 - 1, 1);
> +	KUNIT_EXPECT_EQ(test, id_overlap, shareable_start + 1);

[Severity: High]
If id_overlap is negative, will this also result in an out-of-bounds write
when calling idm_release_chunk_locked() later in the function?

> +	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), idm->shareable - 1);
> +
> +	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_shareable_locked(idm, 1, 1)=
, -EDQUOT);
> +	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), idm->shareable - 1);
> +
> +	idm_release_chunk_locked(idm, id_tail, shared_tail);
> +	idm_release_chunk_locked(idm, id_overlap, overlap_size - 1);
> +	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), 0);
> +
> +	mutex_unlock(idm_mutex(idm));
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260817091013.2801=
73-1-piotr.piorkowski@intel.com?part=3D2
