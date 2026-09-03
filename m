Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A50F8C61DD3
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 17:08:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4325810E155;
	Thu,  3 Sep 2026 17:08:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ddoIAQ4U";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A8A310E155
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 17:08:57 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 6F2A460120;
 Thu,  3 Sep 2026 17:08:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 060271F000E9;
 Thu,  3 Sep 2026 17:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788455336;
 bh=I51VA24i/XaIt8Uog/qdK3VPBznxBRoC5aZ75bLTThc=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=ddoIAQ4UICs/kFUvwoOLdLsBsZhlacUJEaIIABwn7cXJevwY3ADMu7ybtVvA0opA7
 bmCGeZ8NfeLMUwsToOADuRgeJ3sI3OI5iyqdUGDIyhr/7yFEtufYlLEaod18uHgaBE
 zB6V8VM/hzRRYNyZRvimsMFIJ/oLIZTbdAZGIWiXoR4TXvwII3yOv/T6Pe2WndLZfv
 H7bq4kKoouW2cD8EF9z8xJCRCIyRwrCdT9Jpx4GSs4PHsPViJFLm2nNXJJ82zTlEWh
 Jp2B23jEKX30wOL04SlxQkmxCAjqurEHeak1HChsxNm+6cGUBrz3BcGNifJKoiVxVr
 MEpRdMJdjWiww==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V21 04/15] drm/xe: Handle NULL resource and allow
 purging of VRAM pages
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260903161553.528932-21-tejas.upadhyay@intel.com>
References: <20260903161553.528932-17-tejas.upadhyay@intel.com>
 <20260903161553.528932-21-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 17:08:55 +0000
Message-Id: <20260903170856.060271F000E9@smtp.kernel.org>
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
- [High] Missing NULL check for bo->ttm.resource in xe_vm_snapshot_capture(=
), which will cause a kernel panic when devcoredump attempts to snapshot a =
purged BO.
- [High] xe_bo_migrate() and xe_bo_is_mem_type() unconditionally dereferenc=
e bo->ttm.resource without checking for NULL, leading to a crash when calle=
d on purged BOs.
--

commit 1ae4c5706e8f483f5e1f01922281841438651876
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>

drm/xe: Handle NULL resource and allow purging of VRAM pages

Add NULL checks for the buffer object's resource pointer in
xe_bo_is_vram() and xe_bo_is_stolen() to prevent potential NULL
pointer dereferences when checking memory location during page
offlining.

Additionally, remove the `!ttm_bo->ttm` check from
xe_ttm_bo_purge(). This restriction is stripped away to
explicitly allow the driver to purge VRAM pages during the
memory page offline sequence.

> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 8f93e09e51bb8..d30a8411d2a33 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c

[ ... ]

> @@ -929,9 +932,6 @@ int xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo,=
 struct ttm_operation_ctx *
> =20
>  	xe_bo_assert_held(bo);
> =20
> -	if (!ttm_bo->ttm)
> -		return 0;
> -

[Severity: High]
This isn't a bug introduced by this patch, but removing this restriction al=
lows
VRAM BOs to be purged, which exposes a missing NULL check in
xe_vm_snapshot_capture().

If a userspace application maps a BO in a VM, marks its VMA as DONTNEED, and
memory pressure purges the BO, bo->ttm.resource becomes NULL.

If a GPU hang then occurs, devcoredump is triggered and xe_vm_snapshot_capt=
ure()
iterates over the VM's vma_list, unconditionally accessing
bo->ttm.resource->mem_type:

drivers/gpu/drm/xe/xe_vm.c:xe_vm_snapshot_capture() {
	...
	drm_gpuvm_for_each_va(gpuva, &vm->gpuvm) {
		...
		if (bo) {
			snap->snap[i].cpu_caching =3D bo->cpu_caching;
			snap->snap[i].bo =3D xe_bo_get(bo);
			snap->snap[i].bo_ofs =3D xe_vma_bo_offset(vma);
			switch (bo->ttm.resource->mem_type) {
			case XE_PL_SYSTEM:
			...
}

Will this cause a kernel panic when devcoredump attempts to snapshot a purg=
ed
BO?


[Severity: High]
This is another pre-existing issue, but expanding purgeability to VRAM BOs
makes it reachable for them as well.

If a BO is marked DONTNEED and purged via memory pressure
(bo->ttm.resource =3D NULL), and then utilized in a path that triggers migr=
ation
(such as pinning it to a KMS plane or exporting/pinning it via dma-buf), bo=
th
xe_bo_migrate() and xe_bo_is_mem_type() unconditionally dereference
bo->ttm.resource.

drivers/gpu/drm/xe/xe_bo.c:xe_bo_migrate() {
	...
	xe_bo_assert_held(bo);
	tctx =3D tctx ? tctx : &ctx;

	if (bo->ttm.resource->mem_type =3D=3D mem_type)
		return 0;
	...
}

drivers/gpu/drm/xe/xe_bo.h:xe_bo_is_mem_type() {
	...
	xe_bo_assert_held(bo);
	return bo->ttm.resource->mem_type =3D=3D mem_type;
}

Can this lead to a kernel panic when these functions are called on purged B=
Os?

>  	if (!xe_bo_madv_is_dontneed(bo))
>  		return 0;
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903161553.5289=
32-17-tejas.upadhyay@intel.com?part=3D4
