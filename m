Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61C47C5DF61
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 17:41:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCB1A10F0BB;
	Wed, 12 Aug 2026 17:41:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CipU3ISr";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07C8210E413
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Aug 2026 12:55:38 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 3829360A92;
 Wed, 12 Aug 2026 12:55:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C34251F000E9;
 Wed, 12 Aug 2026 12:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1786539336;
 bh=FwmDdicFEquIStWxn6nx4cGU9v06d0THUA4y5IIj5Mk=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=CipU3ISr3AmfwPu4lLXXL2UMB6je2XHyFD2o6ieOhEMYFfMVh0rjg42G85hNeM9DE
 LgvIhIBJjf5lIgyDD++0fdb2ahgfxknOfV/BDkuhnazEBSUeMXGjH8anYpKPVq+oqR
 cgPWrjEIBv8sXi5J92LsRoaXVuH4/HrOyNCzxPYEsAMD48UE1JrmL3QvRE7WX50sAT
 0zywdlHdQUbtWYqE21lO+vdzaVBNonT0B/iSlpfVS2ax2vOUSJGSxirOYNMy47M+wd
 jU/uN9HSpGI1M72XqHjPmZ+hJ/C//g7+aZIe+NUK1kV5XKqLhGO1hHKMhEtMbXICcb
 OCeZ5HrLj0ZEg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 5/7] drm/xe/vf: Add bounds checking for queried GGTT
 base and size
To: "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260812124313.1377582-14-satyanarayana.k.v.p@intel.com>
References: <20260812124313.1377582-9-satyanarayana.k.v.p@intel.com>
 <20260812124313.1377582-14-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 12:55:36 +0000
Message-Id: <20260812125536.C34251F000E9@smtp.kernel.org>
X-Mailman-Approved-At: Wed, 12 Aug 2026 17:41:21 +0000
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

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Validation bypass and state corruption in `vf_get_ggtt_info()`.
- [Medium] Missing implementation of bounds checking.

Pre-existing issues:
- [High] Integer wrap-around vulnerability in GGTT bounds check.
--

--- Patch [5]: [PATCH v6 5/7] drm/xe/vf: Add bounds checking for queried GG=
TT base and size ---
commit 79b0ebbde860ecafbd9642c6e961750508666c39
Author: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>

drm/xe/vf: Add bounds checking for queried GGTT base and size

This commit adds explicit alignment checks for the queried GGTT base
and size in the VF to protect against invalid configuration data from
the PF.

> drm/xe/vf: Add bounds checking for queried GGTT base and size
>=20
> Add explicit bounds checks for GGTT base and size which can detect
> and reject invalid configuration data from a misconfigured or
> malfunctioning PF, preventing protocol violations and protecting VF
> initialization.

[Severity: Medium]
Does this patch implement bounds checking?=20

The commit message states bounds checking is being added, but the code=20
only appears to implement alignment checks using IS_ALIGNED(). It seems=20
actual bounds verification (to ensure start and size do not exceed physical=
=20
limits) is missing from this change.

> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_=
gt_sriov_vf.c
> index 81d68fe5ad7cd..d805c064377c3 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
[ ... ]
> @@ -526,6 +527,18 @@ static int vf_get_ggtt_info(struct xe_gt *gt)
>  		return -EREMCHG;
>  	}
> =20
> +	if (!IS_ALIGNED(start, alignment)) {
> +		xe_gt_sriov_err(gt, "Unaligned GGTT base: %llu, expected %llu\n",
> +				start, ALIGN(start, alignment));
> +		return -EINVAL;
> +	}
> +
> +	if (!IS_ALIGNED(size, alignment)) {
> +		xe_gt_sriov_err(gt, "Unaligned GGTT size %llu, expected %llu\n",
> +				size, ALIGN(size, alignment));
> +		return -EINVAL;
> +	}

[Severity: High]
Can untrusted input from the PF bypass these new alignment checks during
VF initialization?

Looking at vf_get_ggtt_info() earlier in this function:

	xe_tile_sriov_vf_ggtt_base_store(tile, start);
	ggtt_size =3D xe_tile_sriov_vf_ggtt(tile);
	if (!ggtt_size) {
		/*
		 * This function is called once during xe_guc_init_noalloc(),
		 * at which point ggtt_size =3D 0 and we have to initialize everything,
		 * and GGTT is not yet initialized.
		 *
		 * Return early as there's nothing to fixup.
		 */
		xe_tile_sriov_vf_ggtt_store(tile, size);
		return 0;
	}

Because ggtt_size is initially 0 during xe_guc_init_noalloc(), the function
will take this early return path and completely skip the newly added=20
IS_ALIGNED() checks.

Additionally, if invalid parameters are sent during a post-migration update,
will the unaligned start address be cached in the tile state by the call to
xe_tile_sriov_vf_ggtt_base_store(tile, start) before these checks can reject
it?

[Severity: High]
This isn't a bug introduced by this patch, but does the bounds check in
xe_ggtt_init_early() have an integer wrap-around vulnerability?

If a misconfigured or malicious PF returns an extremely large ggtt_size
via the GuC KLV query (for example, 0xFFFFFFFFFFF00000), it looks like it
could bypass the checks:

drivers/gpu/drm/xe/xe_ggtt.c:xe_ggtt_init_early() {
    ...
	if (ggtt_start < wopcm ||
	    ggtt_start + ggtt_size > GUC_GGTT_TOP) {
    ...
}

Could the unprotected addition ggtt_start + ggtt_size wrap around the 64-bit
limit and evaluate to a small value?=20

This would bypass the GUC_GGTT_TOP check and pass the massive size to=20
drm_mm_init(), potentially allowing future allocations to generate offsets=
=20
far beyond the valid MMIO region.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812124313.1377=
582-9-satyanarayana.k.v.p@intel.com?part=3D5
