Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEBC4C79FB6
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 13:01:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B6B110E14E;
	Wed,  9 Sep 2026 13:01:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CBY7KRrC";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D2D510E14E
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Sep 2026 13:01:30 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 281F6433FC;
 Wed,  9 Sep 2026 13:01:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D58871F00A3A;
 Wed,  9 Sep 2026 13:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788958890;
 bh=x6f6ay4nfY4oj2GSRe8LqRPFZrfM0VaZ5e5hep5Sn3g=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=CBY7KRrCmzv+acGRB/FLnmIpuZ/lmD2CBz3WT88LNCgpBr7oFqbXUfaBIyioyCJpX
 6QYL3TVUM3/Pi53Yp3aLS8HSeMJxTkKDb1RbxZYYQL8cUM6aLzNOLTCTf9DcaDu0S9
 Wdet1GROpZla1V2yuSBU3MSKElDL+f61UIHAOFdql5o/aqLtA5TxHLcmw5geSyRy8Y
 9CUpFSRk6la5QxtCwmz1KJMAru5JnASi2GOj+jpgfxLcqfVUKf3bshfdK5WBVv7tqm
 hfGk166Jr1SnPAcJZpEyNHgrJ3zqFHdu11GD/TyzhU7txNAS99sCDDiyeY/TDUZ+2N
 ZP5x2TwAf+GVA==
From: sashiko-bot@kernel.org
Subject: Re: [RFC v2 18/21] drm/xe/svm: Define access counter migration policy
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260909124457.1610890-41-himal.prasad.ghimiray@intel.com>
References: <20260909124457.1610890-23-himal.prasad.ghimiray@intel.com>
 <20260909124457.1610890-41-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 13:01:29 +0000
Message-Id: <20260909130129.D58871F00A3A@smtp.kernel.org>
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

Pre-existing issues:
- [Medium] Access counter triggered setup for un-migratable ranges incorrec=
tly returns -EACCES, dropping valid events and rendering the graceful skip =
path unreachable.
- [Medium] Stale access counter events bypass the explicitly configured mad=
vise preferred location policy.
--

commit 7722d68606c2a2a1e92cb30c951c55b50aca4779
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

drm/xe/svm: Define access counter migration policy

This commit defines the policy for which GPU should own access
counter-triggered migration in a multi-GPU system, keying off the VMA's mad=
vise
preferred location. It configures the PTE NC (no-count) bit based on this
preference.

> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 7aa09e30fa467..fd42969d9e620 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
[ ... ]
> @@ -1339,9 +1371,15 @@ static int __xe_svm_range_setup(struct xe_vm *vm, =
struct xe_vma *vma,
> =20
>  	range_debug(range, "PAGE FAULT");
> =20
> -	if (acc_ctr_trigger && !range_flags.migrate_devmem) {
> +	/*
> +	 * AC-triggered setup: if the range is already in device memory a
> +	 * rebind is all that's needed.  Otherwise proceed to the
> +	 * migration path =E2=80=94 with no explicit madvise preferred location=
, the
> +	 * default first-touch-then-migrate-on-hot policy applies and we
> +	 * should attempt VRAM placement for this hot range.
> +	 */
> +	if (acc_ctr_trigger && !range_flags.migrate_devmem)
>  		goto out;

[Severity: Medium]
This is a pre-existing issue, but does this explicit graceful skip path ever
get reached?

Earlier in __xe_svm_range_setup(), the code checks:

	if (ctx.devmem_only && !range_flags.migrate_devmem) {
		err =3D -EACCES;
		goto err_out;
	}

Since setting acc_ctr_trigger to true forces ctx.devmem_only to true, the
earlier check appears to force a hard failure (-EACCES) for access counter
events on un-migratable ranges, masking this intended graceful skip.

This could cause the access counter worker in
xe_access_counter_queue_work_func() to abort the loop for the current
granularity window, dropping legitimate migration hints for other VMAs in t=
he
same window.

Is this the intended behavior, or should the access counter triggers be tre=
ated
as advisory and gracefully skipped?

[Severity: Medium]
This is also a pre-existing issue, but can stale access counter events bypa=
ss
the explicitly configured madvise preferred location policy?

Earlier in __xe_svm_range_setup(), dpagemap is resolved as follows:

	dpagemap =3D ctx.devmem_only ? xe_tile_local_pagemap(tile) :
		xe_vma_resolve_pagemap(vma, tile);

Because acc_ctr_trigger sets ctx.devmem_only to true, this unconditional
ternary assignment always sets the target to the local tile for access coun=
ter
events, completely bypassing the xe_vma_resolve_pagemap() policy check.

If a userspace application makes asynchronous madvise calls concurrently wi=
th
GPU memory accesses to set the preferred location to
DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM, could the memory be incorrectly migrat=
ed
to the local GPU's VRAM?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909124457.1610=
890-23-himal.prasad.ghimiray@intel.com?part=3D18
