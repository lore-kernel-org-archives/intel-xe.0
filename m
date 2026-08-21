Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 220D3C5DF97
	for <intel-xe@archiver.kernel.org>; Fri, 21 Aug 2026 21:52:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDA2A10F3C8;
	Fri, 21 Aug 2026 21:52:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aWtuSlJz";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 544DA10F3C8
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Aug 2026 21:52:35 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id C1A966136F;
 Fri, 21 Aug 2026 21:52:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E8481F000E9;
 Fri, 21 Aug 2026 21:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787349147;
 bh=pJ8Ez5J7hUv12BccD4Y6hplzD1CZ70tGXJWOLD9mzTk=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=aWtuSlJz3MPSDpztrRei9RP8mcx/n754csusbTGYmVPpT/L+FFbNa0PhpvXI3xuGJ
 RakI1Z2mVmAs0XVSVCqfBwbJFbAPnpSqXf4NWiLDj4s9b0X9xnNLfPOGW/W+1lLJYJ
 hGVyVWoS/2i21j/D9l0k/GCw8TqcKn3M9jfggMFU86c4YhdB4BpnRukVQxQvW9A6f6
 W/rI3vI1Pahoo62f5aE44eH7O/j+G3eMoHLQdwd2TmXsLBgAIQYezTzV/Y7FhHyacT
 L6ONwdSJPM99FXh6da2hxjgyTMf08EpjQ1pdH1PMT5i5teclY1Raf8HeWwq+HBEnnq
 vWfR4N5ugr6gw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] drm/xe: Add up-to-date implementation for
 Wa_14026539277
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260821-wa_14026539277-v3-3-1f98c2af12f6@intel.com>
References: <20260821-wa_14026539277-v3-0-1f98c2af12f6@intel.com>
 <20260821-wa_14026539277-v3-3-1f98c2af12f6@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 21:52:26 +0000
Message-Id: <20260821215227.4E8481F000E9@smtp.kernel.org>
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

Pre-existing issues:
- [High] Spectre v1 vulnerability due to missing use of mitigated array ind=
ex in `xe_vm_madvise_ioctl`.
--

--- Patch [3]: [PATCH v3 3/3] drm/xe: Add up-to-date implementation for Wa_=
14026539277 ---
commit a64f477e6e9a2ceb517c012bf3dbfd5ac3afdd27
Author: Gustavo Sousa <gustavo.sousa@intel.com>
Subject: drm/xe: Add up-to-date implementation for Wa_14026539277

This commit updates the implementation for Wa_14026539277. It converts
device-cacheable accesses to device-uncached and 1-way-coherent for
driver-internal usage, and rejects 2-way-coherent VM_BIND/MADVISE calls
on the UAPI side.

[ ... ]

> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_v=
m_madvise.c
> index 0474768a38aaa..265273294756c 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -500,6 +500,9 @@ static bool check_pat_args_are_sane(struct xe_device =
*xe,
>  	u16 coh_mode =3D xe_pat_index_get_coh_mode(xe, pat_index);
>  	int i;
> =20
> +	if (XE_IOCTL_DBG(xe, xe_pat_wa_14026539277_reserved(xe, pat_index)))
> +		return false;
> +

[Severity: High]
This is a pre-existing issue, but does this addition exacerbate a Spectre v1
vulnerability by adding another speculative out-of-bounds access?

In xe_vm_madvise_ioctl(), array_index_nospec() is used to mitigate the inde=
x,
but its result is discarded and the raw unmitigated args->pat_index.val is
passed to check_pat_args_are_sane():

drivers/gpu/drm/xe/xe_vm_madvise.c:xe_vm_madvise_ioctl() {
    ...
		pat_index =3D array_index_nospec(args->pat_index.val, xe->pat.n_entries);
		coh_mode =3D xe_pat_index_get_coh_mode(xe, pat_index);
    ...
	if (args->type =3D=3D DRM_XE_MEM_RANGE_ATTR_PAT) {
		if (!check_pat_args_are_sane(xe, &madvise_range,
					     args->pat_index.val)) {
    ...
}

This means check_pat_args_are_sane() receives the unmitigated index. It then
passes it to xe_pat_index_get_coh_mode() and now to
xe_pat_wa_14026539277_reserved(), both of which will access the
xe->pat.table array.

Since the ioctl is accessible to userspace, an attacker could provide a
maliciously crafted args->pat_index.val exceeding xe->pat.n_entries and
trigger speculative out-of-bounds array reads. Should the caller be updated
to pass the mitigated pat_index?

>  	/*
>  	 * Using coh_none with CPU cached buffers is not allowed on iGPU.
>  	 * On iGPU the GPU shares the LLC with the CPU, so with coh_none

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821-wa_1402653=
9277-v3-0-1f98c2af12f6@intel.com?part=3D3
