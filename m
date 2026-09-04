Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11854C79F82
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 21:40:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B677A10E59A;
	Fri,  4 Sep 2026 21:40:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bcXeT0tx";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB52E10E59A
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 21:40:40 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 1378360209;
 Fri,  4 Sep 2026 21:40:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 938631F00A3D;
 Fri,  4 Sep 2026 21:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788558039;
 bh=eYoGGNAQE52wElqPikKDSa2NHs5g4l4+GxTf/rxbzG8=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=bcXeT0txUhCS7QFkpRrTYhX5WaejtVfhy+T3Bz6kH2nGjcrQElJ9HfT3LYf70ncpp
 iyuROsuoFJGCU6ZnB4dvpwcOkde2GQ+La0x/x/lTf473ou0ox4LlKCK/7m2jA02CjD
 bLR6vtVNpe7CdCHvh5roH7vzUKwf1cflPkfkodV2owCOJT2mDITbe+O6lim6d76EFJ
 LGNnv1Buuji5WB7LAcKg4Ay5mzc8amyKFCcPQPml/iiLpoOlDV4Vbvb95E7BWjDsp7
 xmO9rJA5m7OmjyAB0mXtV6ACKEef5ubh5vlZt/gOw4QPO7STdJt8mOd3g0ojyfNHZs
 8yaLWCwwv6BIA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 17/24] drm/xe: Add device flag to enable PT mirroring
 across tiles
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260904211613.3934307-18-matthew.brost@intel.com>
References: <20260904211613.3934307-1-matthew.brost@intel.com>
 <20260904211613.3934307-18-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 21:40:39 +0000
Message-Id: <20260904214039.938631F00A3D@smtp.kernel.org>
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
- [Medium] Unnecessary allocation of page table roots and scratch structure=
s for secondary tiles when PT mirroring is disabled.
--

commit 34b539e899a7643dc15dedad6a3cd229e0c0f4d5
Author: Matthew Brost <matthew.brost@intel.com>

drm/xe: Add device flag to enable PT mirroring across tiles

This commit introduces a device flag to toggle page-table mirroring across
tiles for memory bandwidth considerations. It updates the VM creation,
rebind, and page table update paths to check this flag and fall back to the
primary tile's root page table when mirroring is disabled.

Link: https://patch.msgid.link/20260228013501.106680-18-matthew.brost@intel=
.com

> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c

[ ... ]

> @@ -1738,7 +1748,8 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u3=
2 flags, struct xe_file *xef)
> =20
>  		for_each_tile(tile, xe, id) {
>  			if (flags & XE_VM_FLAG_MIGRATION &&
> -			    tile->id !=3D XE_VM_FLAG_TILE_ID(flags))
> +			    tile->id !=3D XE_VM_FLAG_TILE_ID(flags) &&
> +			    (vm->xe->info.has_pt_mirror || id))
>  				continue;
> =20
>  			vm->pt_root[id] =3D xe_pt_create(vm, tile, xe->info.vm_max_level,

[Severity: Medium]
Does this code unnecessarily allocate page table roots and scratch structur=
es
for secondary tiles when PT mirroring is disabled?

For standard user VMs, XE_VM_FLAG_MIGRATION is unset, meaning this if
condition evaluates to false and we proceed to allocate pt_root[id] for all
tiles.=20

However, when vm->xe->info.has_pt_mirror is false, xe_vm_pt_root()
unconditionally returns pt_root[0]. This means the allocated pt_root[id]=20
(and associated scratch page tables up to vm_max_level) for id > 0 will nev=
er
be used, permanently wasting VRAM for the lifetime of every VM.

Should there be an explicit check to skip secondary tile allocations when
has_pt_mirror is false, regardless of whether it is a migration VM?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904211613.3934=
307-1-matthew.brost@intel.com?part=3D17
