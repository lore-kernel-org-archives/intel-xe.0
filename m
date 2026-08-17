Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04B2CC5DF66
	for <intel-xe@archiver.kernel.org>; Mon, 17 Aug 2026 09:24:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3C9E10E3F3;
	Mon, 17 Aug 2026 09:24:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OUWFDSlL";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EC9F10E3F3
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Aug 2026 09:24:36 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 06EBF41AE2;
 Mon, 17 Aug 2026 09:24:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF06D1F000E9;
 Mon, 17 Aug 2026 09:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1786958675;
 bh=tlFy8LQ3AOtJhxjFVZms0sLBdtAVVereypFnFryPMV4=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=OUWFDSlL84HG/6OPh14OXnqxf6/YUkEAeL/Zq+uaA9MQaH7k5F0ouL9nPUXwfSy5i
 FLDE0rchuHL5wbXSy57Y7coswHVTyfL3moZaBNELcBauwv2Wq5kS1cc2P5r3uE56PQ
 lLNvZDVzNOq+dTR+tMa+js1mzEUFAyHZJNh7rDyionbfso21v7H4BnM+ctf0nmdogQ
 mzWHcdsQ1mN/c8vRUmxSCk8FKjyfdkx2pO4k7fHAYdd7QOL1dwlEY92RV9WxTsaUbj
 wmZ8wuefZg1uUdk1gD/+XHKwiqSPB69FRqu8IFTj2qbJ1N2TEnS9dXDi2PnWsay7IL
 HtgZOUWCcdyPA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/4] drm/xe/pf: Explicitly use shareable GuC IDs for
 VFs provisioning
To: =?utf-8?b?UGnDs3Jrb3dza2ksIFBpb3Ry?= <piotr.piorkowski@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260817091013.280173-5-piotr.piorkowski@intel.com>
References: <20260817091013.280173-1-piotr.piorkowski@intel.com>
 <20260817091013.280173-5-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 Aug 2026 09:24:35 +0000
Message-Id: <20260817092435.BF06D1F000E9@smtp.kernel.org>
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
- [Medium] The `spare` quota enforcement in `idm_reserve_chunk_shareable_lo=
cked` mathematically miscalculates quota and incorrectly rejects allocation=
s.
- [Medium] The `check_quota` kunit test was modified to use non-overlapping=
 pools, completely bypassing the quota enforcement logic it is supposed to =
test.
--

--- Patch [4]: [PATCH v2 4/4] drm/xe/pf: Explicitly use shareable GuC IDs f=
or VFs provisioning ---
commit 249a1c056e1b8b61fd7f66cd23baf1408b302ed8
Author: Piotr Pi=C3=B3rkowski <piotr.piorkowski@intel.com>

drm/xe/pf: Explicitly use shareable GuC IDs for VFs provisioning

Switch PF VF-context provisioning to explicitly allocate IDs from
the dedicated shareable ID pool. Also, lets remove the legacy GuC ID
reservation API now that all VFs provisioning paths use the shareable
allocation helpers.

> diff --git a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c b/drivers/gpu/=
drm/xe/tests/xe_guc_id_mgr_test.c
> index f21d3341b5033..3e6d289f7d7a0 100644
> --- a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
> +++ b/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
[ ... ]
> @@ -153,26 +160,31 @@ static void check_quota(struct kunit *test)
>  {
>  	struct xe_guc_id_mgr *idm =3D test->priv;
>  	unsigned int n;
> +	unsigned int max;
> =20
> -	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, 2, 0));
> +	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, 2, 2));
> +	max =3D xe_guc_id_mgr_max_shareable(idm);
> =20
>  	mutex_lock(idm_mutex(idm));
> =20
> -	for (n =3D 0; n < idm_total(idm) - 1; n++) {
> +	for (n =3D 0; n < max - 1; n++) {
>  		kunit_info(test, "n=3D%u", n);
> -		KUNIT_EXPECT_EQ(test, idm_reserve_chunk_locked(idm, 1, idm_total(idm))=
, -EDQUOT);
> +		KUNIT_EXPECT_GE(test,
> +				xe_guc_id_mgr_reserve_shareable_locked(idm, 1, max), 0);

[Severity: Medium]
Does changing the initialization to idm_init(idm, 2, 2) bypass the quota
enforcement logic this function is supposed to test?

Because usable (2) + shareable (2) is less than GUC_ID_MAX, these pools are
configured as non-overlapping. Non-overlapping pools intentionally bypass t=
he
spare quota check.

With the test now receiving successful allocations instead of -EDQUOT, it
appears the assertions were inverted (expecting >=3D 0 instead of -EDQUOT),
which removes the test's coverage for the quota enforcement feature entirel=
y.

> +		KUNIT_EXPECT_GE(test,
> +				xe_guc_id_mgr_reserve_shareable_locked(idm, 1, max - n), 0);
>  		KUNIT_EXPECT_EQ(test,
> -				idm_reserve_chunk_locked(idm, 1, idm_total(idm) - n),
> -				-EDQUOT);
> +				xe_guc_id_mgr_reserve_shareable_locked(idm, max - n, 1),
> +				-ENOSPC);
[ ... ]
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm=
/xe/xe_gt_sriov_pf_config.c
> index b4f4a7aa21c78..79535f7478e96 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
[ ... ]
> @@ -889,7 +889,7 @@ static int pf_reserve_ctxs(struct xe_gt *gt, u32 num)
>  	struct xe_guc_id_mgr *idm =3D &gt->uc.guc.submission_state.idm;
>  	unsigned int spare =3D pf_get_spare_ctxs(gt);
> =20
> -	return xe_guc_id_mgr_reserve(idm, num, spare);
> +	return xe_guc_id_mgr_reserve_shareable(idm, num, spare);

[Severity: Medium]
Will this switch to xe_guc_id_mgr_reserve_shareable() expose a mathematical
error in the spare quota calculation?

Looking at idm_reserve_chunk_shareable_locked() in xe_guc_id_mgr.c:

	if (spare) {
		unsigned int used_overlap =3D bitmap_weight(idm->bitmap, idm->usable) -
					    bitmap_weight(idm->bitmap, shareable_start);
		...
		unsigned int need_overlap =3D count > free_tail ? count - free_tail : 0;
		unsigned int overlap =3D idm->usable - shareable_start;

		if (used_overlap + need_overlap + spare > overlap)
			return -EDQUOT;
	}

This logic calculates quota based entirely on the overlap region, effective=
ly
ignoring free IDs in the PF-exclusive region.

While this may be masked in production because the PF currently initializes
the manager with full overlap (GUC_ID_MAX, GUC_ID_MAX), any partial overlap
configuration (e.g., usable =3D 65536, shareable =3D 2) will incorrectly fa=
il
allocations with -EDQUOT whenever spare > overlap, regardless of the actual
number of free usable IDs available.

>  }
> =20
>  static void pf_release_ctxs(struct xe_gt *gt, u32 start, u32 num)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260817091013.2801=
73-1-piotr.piorkowski@intel.com?part=3D4
