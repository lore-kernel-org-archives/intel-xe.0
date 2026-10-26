Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308EA606A31A
	for <intel-xe@archiver.kernel.org>; Mon, 26 Oct 2026 22:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ewUIEXYK
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF43110E2B5;
	Mon, 26 Oct 2026 22:19:57 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C45F310E2B5
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Oct 2026 22:19:51 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id A2C28600CB;
 Mon, 26 Oct 2026 22:19:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 325E11F01825;
 Mon, 26 Oct 2026 22:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793053190;
 bh=RhGia8Of8x4gtjVLK+dm8HmRv1joAegrDHXn97BP3Yo=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=ewUIEXYKuc8Mocd50yLj+Qg06SXmLljhhBH+Z2JOvJzs8gTORjDvFiSH7rMjqgPjr
 pAzL5UESlkoicmj/y8LEC2d05wQtF0k+LKn+yzBHsZfrMUhiD3Z/y1gVyz55BYhMDI
 tu6u0vQtHTMct8S/Ixhgfhz8epL6t3/LGQVy4rUoxqg2wN4F8G66igC0vmOzaP2w9W
 6W691sAlo7WwTAvan6CtLrKNOmnaqZKZUI/Eisl1NAr8bnH7LTq94DK/IE4Ywl/CNs
 0LeuVJ0HE+rlS95BSvy/+faIxlIDlMCgZcFIuLX4hFxRQRGA+bbzD+e2O/264fmzKO
 7saQPVuZjubFA==
Message-ID: <sashiko-outbox-185794@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/3] drm/xe: Add up-to-date implementation for
 Wa_14026539277
To: "Gustavo Sousa" <gustavo.sousa@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261026-wa_14026539277-v4-3-54e40d3e92aa@intel.com>
References: <20261026-wa_14026539277-v4-0-54e40d3e92aa@intel.com>
 <20261026-wa_14026539277-v4-3-54e40d3e92aa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 26 Oct 2026 22:19:49 +0000
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] drm/xe: misplaced Wa_14026539277 PAT check in xe_vm_madvise_ioctl()
--

commit f0309ee40a85276908319b3fa40c88f56ae1d6c4
Author: Gustavo Sousa <gustavo.sousa@intel.com>

drm/xe: Add up-to-date implementation for Wa_14026539277

This commit implements Wa_14026539277 for A* steppings of graphics version
35.10 by converting internal 2-way-coherent PAT entries to 1-way-coherent a=
nd
device-uncached, disabling cached page tables, and rejecting 2-way-coherent
PAT indices in the VM_BIND and VM_MADVISE ioctls.

[ ... ]

> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_v=
m_madvise.c
> index 875c00563f910..5e3699d133d44 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -496,6 +496,9 @@ static bool check_pat_args_are_sane(struct xe_device =
*xe,
>  	u16 coh_mode =3D xe_pat_index_get_coh_mode(xe, pat_index);
>  	int i;
> =20
> +	if (XE_IOCTL_DBG(xe, xe_pat_wa_14026539277_reserved(xe, pat_index)))
> +		return false;

[Severity: Low]
Should this xe_pat_wa_14026539277_reserved() check be placed in
madvise_args_are_sane() alongside the existing xe_pat_index_is_valid() check
instead of in check_pat_args_are_sane()?

In xe_vm_madvise_ioctl(), madvise_args_are_sane() validates VMA-independent
arguments upfront:

	case DRM_XE_MEM_RANGE_ATTR_PAT:
	{
		u16 pat_index;

		if (XE_IOCTL_DBG(xe, args->pat_index.val >=3D xe->pat.n_entries))
			return false;

		pat_index =3D array_index_nospec(args->pat_index.val, xe->pat.n_entries);
		if (XE_IOCTL_DBG(xe, !xe_pat_index_is_valid(xe, pat_index)))
			return false;

whereas check_pat_args_are_sane() is only called after xe_svm_flush(),
xe_vm_alloc_madvise_vma(), and get_vmas():

	err =3D xe_vm_alloc_madvise_vma(vm, madvise_range.addr, args->range);
	if (err)
		goto madv_fini;

	err =3D get_vmas(vm, &madvise_range);
	if (err || !madvise_range.num_vmas)
		goto madv_fini;

	if (args->type =3D=3D DRM_XE_MEM_RANGE_ATTR_PAT) {
		...
		if (!check_pat_args_are_sane(xe, &madvise_range, pat_index)) {
			err =3D -EINVAL;
			goto free_vmas;
		}
	}

When userspace passes a PAT index reserved by Wa_14026539277, will
xe_vm_madvise_ioctl() return 0 instead of -EINVAL if the target range has no
VMAs, or split CPU_ADDR_MIRROR VMAs in xe_vm_alloc_madvise_vma() before
rejecting the PAT index?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261026-wa_1402653=
9277-v4-0-54e40d3e92aa@intel.com?part=3D3
