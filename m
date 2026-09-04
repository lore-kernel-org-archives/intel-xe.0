Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CD9DC624DE
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 07:39:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC26810F8D6;
	Fri,  4 Sep 2026 07:39:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fAcJ8uQF";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5FC810F8D6
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 07:39:55 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 8067E43D24;
 Fri,  4 Sep 2026 07:39:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A48A1F00A3D;
 Fri,  4 Sep 2026 07:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788507595;
 bh=t9XPpkbB+vsycCRHGqFtzaWijoQHIw1DOVa/kAAxhow=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=fAcJ8uQFRIBz9RQYuluv1rFmRcbUdUB9Y08QXi20Hk2y7iUzX5IukAdg4loeFad/D
 unQoy/i9mPnTYwhXj/IZGk0/8PhjaF9exvD+6NyG6lN99B7fOBvuBfX7rzQgjvxJ3c
 BVeDDgBN24zLmSDihD6LEZQ4AZd6BJ53rIArNpYbgM28CodP07Q+mSaj5ZA1Xcl+vf
 4xJH60r3DCUYlPv+K8HjBGXWTTS+1NPDv+/K2N+Wo8zNW+qHIaX0GJlGJmOf3XOScW
 ZGxUG6/sIjD+YEYGN0oFFJo86QkxvN+JeoD0oeSa+ho2dIa0SJ95PCsKWzzy62/QlQ
 qPOdDAyjPsQdg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] drm/xe/vm: Handle purged BOs in VM snapshots
To: "Arvind Yadav" <arvind.yadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260904072252.4009491-1-arvind.yadav@intel.com>
References: <20260904072252.4009491-1-arvind.yadav@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 07:39:54 +0000
Message-Id: <20260904073955.3A48A1F00A3D@smtp.kernel.org>
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

New issues:
- [Medium] Delayed BO reference drop due to `IS_ERR` skip in deferred worke=
r.

Pre-existing issues:
- [High] Time-of-Check to Time-of-Use (TOCTOU) race condition in `xe_vm_sna=
pshot_capture()` leading to a Use-After-Free of `ttm_resource`.
--

commit a4a76e70071a5c5421a95bba41a63f025685beaf
Author: Arvind Yadav <arvind.yadav@intel.com>
drm/xe/vm: Handle purged BOs in VM snapshots

A purged BO can remain in a VM after its TTM resource has been freed.
xe_vm_snapshot_capture() can then dereference a NULL resource while
capturing a devcoredump. Record -ENODATA for the affected VMA instead
of dereferencing the resource.

Closes: https://sashiko.dev/#/patchset/20260831064942.315720-17-tejas.upadh=
yay%40intel.com?part=3D4

> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 19b3d0be79282..fcdd34c4f0fa2 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -4663,20 +4663,29 @@ struct xe_vm_snapshot *xe_vm_snapshot_capture(str=
uct xe_vm *vm)
>  			XE_VM_SNAP_FLAG_READ_ONLY : 0;
>  		snap->snap[i].pat_index =3D vma->attr.pat_index;
>  		if (bo) {
> +			struct ttm_resource *res;
> +
>  			snap->snap[i].cpu_caching =3D bo->cpu_caching;
>  			snap->snap[i].bo =3D xe_bo_get(bo);
>  			snap->snap[i].bo_ofs =3D xe_vma_bo_offset(vma);
> -			switch (bo->ttm.resource->mem_type) {
> -			case XE_PL_SYSTEM:
> -			case XE_PL_TT:
> -				snap->snap[i].uapi_mem_region =3D 0;
> -				break;
> -			case XE_PL_VRAM0:
> -				snap->snap[i].uapi_mem_region =3D 1;
> -				break;
> -			case XE_PL_VRAM1:
> -				snap->snap[i].uapi_mem_region =3D 2;
> -				break;
> +			snap->snap[i].uapi_mem_region =3D -1;
> +
> +			res =3D READ_ONCE(bo->ttm.resource);
> +			if (!res) {
> +				snap->snap[i].data =3D ERR_PTR(-ENODATA);

[Severity: Medium]
Does setting this to ERR_PTR(-ENODATA) cause a delayed BO reference drop?

In xe_vm_snapshot_capture_delayed(), there is an early check that skips
the cleanup label:

	if (IS_ERR(snap->snap[i].data) ||
	    snap->snap[i].flags & XE_VM_SNAP_FLAG_IS_NULL)
		continue;

If this continue statement is hit, will it bypass cleanup_bo: and
xe_bo_put(bo), leaving the xe_bo metadata pinned for the lifetime of the
devcoredump?

> +			} else {
> +				switch (res->mem_type) {

[Severity: High]
This isn't a bug introduced by this patch, but is it possible for a
Time-of-Check to Time-of-Use (TOCTOU) race condition to occur here in
xe_vm_snapshot_capture()?

Since the res pointer is cached locklessly via READ_ONCE(), could a concurr=
ent
execution of the shrinker (xe_bo_shrink()) lock the BO and purge it, calling
ttm_resource_free() to free the resource memory before it is dereferenced?

Would this result in a Use-After-Free when evaluating switch (res->mem_type=
)?

> +				case XE_PL_SYSTEM:
> +				case XE_PL_TT:
> +					snap->snap[i].uapi_mem_region =3D 0;
> +					break;
> +				case XE_PL_VRAM0:
> +					snap->snap[i].uapi_mem_region =3D 1;
> +					break;
> +				case XE_PL_VRAM1:
> +					snap->snap[i].uapi_mem_region =3D 2;
> +					break;
> +				}
>  			}
>  		} else if (xe_vma_is_userptr(vma)) {
>  			struct mm_struct *mm =3D

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904072252.4009=
491-1-arvind.yadav@intel.com?part=3D1
