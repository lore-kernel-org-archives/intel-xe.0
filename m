Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 194D1CA5FFC
	for <intel-xe@archiver.kernel.org>; Mon,  5 Oct 2026 09:04:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C693D10EC32;
	Mon,  5 Oct 2026 09:04:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="N8fSkCdi";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D73210EC2E
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Oct 2026 09:04:36 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 30F7C43D82;
 Mon,  5 Oct 2026 09:04:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E847A1F000FF;
 Mon,  5 Oct 2026 09:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1791191076;
 bh=S1U18mMgILgORuHNgql5xbcMDGecEDNQm03jH3Ndifs=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=N8fSkCdisJWj6M4wo4Skz/D1YwwaUeEuSNl0wL1Z0b5aQlFzgFcJiji/tnGXjDfct
 qrVfBfrsuzBDQ9B0hqUhFuRER/LTAkNbd9oj40SPzg2JUoeZbq4gPZtCXCKnUqThOq
 stE4T2zt7XE9ImrLrTYdtNiC7BvbtNm28KfXyHozFvzdm+d1UDhvV+Cqcza7J6zMmJ
 tyg5SIEvCDHFtkTMnKvqEhbOcICIQ3uNrLmwUm2XP3mZNKw/gU7AsORjRXAY34Pap1
 +6n5OSs5QMM5U560+SxDsYyEQ1g8XO/K11Eo6tfh1diocnEI8wBzd9KX3XgvMBYcYQ
 iElHeIBS1B8zQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/4] drm/xe/kunit: Extend GuC ID manager split-pool
 coverage
To: =?utf-8?b?UGnDs3Jrb3dza2ksIFBpb3Ry?= <piotr.piorkowski@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20261005085132.3720685-3-piotr.piorkowski@intel.com>
References: <20261005085132.3720685-1-piotr.piorkowski@intel.com>
 <20261005085132.3720685-3-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 05 Oct 2026 09:04:35 +0000
Message-Id: <20261005090435.E847A1F000FF@smtp.kernel.org>
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
- [Medium] test: xe_guc_id_mgr: check_used triggers idm_assert on allocatio=
n failure
- [Medium] test: xe_guc_id_mgr: missing early returns on failed ID reservat=
ions
--

commit e5671ad31dee2fc19148c70082f71c4bcc2e8f21
Author: Piotr Pi=C3=B3rkowski <piotr.piorkowski@intel.com>
Subject: drm/xe/kunit: Extend GuC ID manager split-pool coverage

This commit expands the GuC ID manager KUnit tests to cover the new
usable/shareable pool model. It introduces tests for boundary conditions,
overlap, and partial initialization.

>     v3: Guard failed ID reservations before releasing test allocations.
>     v4: Avoid releasing unreserved ID ranges after failed test reservatio=
ns.

[ ... ]

> diff --git a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c b/drivers/gpu/=
drm/xe/tests/xe_guc_id_mgr_test.c
> index 78d3de46b7572..5fe71eac2e380 100644
> --- a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
> +++ b/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c

[ ... ]

> @@ -62,13 +93,13 @@ static void check_used(struct kunit *test)
> =20
>  	for (n =3D 0; n < idm_total(idm); n++) {
>  		kunit_info(test, "n=3D%u", n);
> -		KUNIT_EXPECT_EQ(test, bitmap_weight(idm->bitmap, idm_total(idm)), n);
> +		KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), n);
>  		KUNIT_EXPECT_GE(test, xe_guc_id_mgr_reserve_usable_locked(idm, 1), 0);
> -		KUNIT_EXPECT_EQ(test, bitmap_weight(idm->bitmap, idm_total(idm)), n + =
1);
> +		KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), n + 1);
>  	}
> -	KUNIT_EXPECT_EQ(test, bitmap_weight(idm->bitmap, idm_total(idm)), idm_t=
otal(idm));
> -	idm_release_chunk_locked(idm, 0, idm_total(idm));
> -	KUNIT_EXPECT_EQ(test, bitmap_weight(idm->bitmap, idm_total(idm)), 0);
> +	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), idm_total(idm));
> +	idm_release_chunk_locked(idm, 0, test_idm_used_total(idm));

[Severity: Medium]
If xe_guc_id_mgr_reserve_usable_locked() fails inside the loop above, the
KUNIT_EXPECT_GE() will record a failure, but execution continues. When the
loop finishes, test_idm_used_total(idm) will evaluate to 0.

Does this cause idm_release_chunk_locked() to be called with a count of 0?

Looking at xe_guc_id_mgr.c, idm_release_chunk_locked() starts with:
    idm_assert(idm, count);

Would calling this cleanup path with a count of 0 trigger this internal
assertion and result in a drm_WARN during a failed test?

> +	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), 0);
> =20
>  	mutex_unlock(idm_mutex(idm));
>  }

[ ... ]

> +static void check_overlap_alloc(struct kunit *test)
> +{
> +	struct xe_guc_id_mgr *idm =3D test->priv;
> +	unsigned int total;
> +	int usable_id, shareable_id;
> +
> +	if (!require_iov_config_or_skip(test))
> +		return;
> +
> +	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, GUC_ID_MAX, GUC_ID_MAX));
> +
> +	mutex_lock(idm_mutex(idm));
> +	total =3D idm_total(idm);
> +
> +	usable_id =3D xe_guc_id_mgr_reserve_usable_locked(idm, 2);
> +	KUNIT_EXPECT_EQ(test, usable_id, 0);

[Severity: Medium]
The commit message notes "v3: Guard failed ID reservations before releasing
test allocations" and "v4: Avoid releasing unreserved ID ranges after failed
test reservations."=20

However, tests like check_overlap_alloc() and=20
check_overlap_partial_shared_range_blocking() appear to be missing the early
return guards that were added to check_quota().

If xe_guc_id_mgr_reserve_usable_locked() fails, could negative IDs cascade
into subsequent test logic and release functions? Should there be an early
return guard like "if (usable_id < 0)" added here as well?

> +
> +	shareable_id =3D xe_guc_id_mgr_reserve_shareable_locked(idm, 3, 0);
> +	KUNIT_EXPECT_EQ(test, shareable_id, total - 3);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261005085132.3720=
685-1-piotr.piorkowski@intel.com?part=3D2
