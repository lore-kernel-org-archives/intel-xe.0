Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C45D9C98306
	for <intel-xe@archiver.kernel.org>; Fri, 25 Sep 2026 06:25:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76CE710E4E3;
	Fri, 25 Sep 2026 06:25:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="X5wXt8eU";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F086B10E4E3
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Sep 2026 06:25:11 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 91ED641B31;
 Fri, 25 Sep 2026 06:25:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B67A1F000FF;
 Fri, 25 Sep 2026 06:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1790317511;
 bh=isEy2WG4pe6qeVcGsuFGNCySYKuxdcWzma4apmswois=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=X5wXt8eUHd2eH7zdEC+vMB6tKJyyqV2rdskiBJkafwwarRo1ToisDZP7SbAfJpmmP
 hbi+rKSkbMck+nLy11R/fUidyeOL6QcvMVePLKyBO2yEb7H5ht4bXVkOgcySBhvynd
 5QRRu74wgUAq9shfkLfH5sZxvSOlwL27nCwk9/2yWDiYauWfYiBqiI3d0hUcH4DS+L
 6ji2SkCWw/zzraqkWztob5w8+esHPqBLq/B7RQL5kr8eCn4IWmfptuAffFOSnJbnea
 98Xo97vdzbh2ybpEKV1qxphLFSkTfIMnIb+ji5JZDNMoCDlex8eqFB7ygGBN9qp+Ci
 T7A2PgRRmb8bg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 17/24] drm/xe: Add device flag to enable PT mirroring
 across tiles
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260925045320.1325860-18-matthew.brost@intel.com>
References: <20260925045320.1325860-1-matthew.brost@intel.com>
 <20260925045320.1325860-18-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 25 Sep 2026 06:25:10 +0000
Message-Id: <20260925062511.4B67A1F000FF@smtp.kernel.org>
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
- [Medium] xe: wasted VRAM and forced cross-tile PT access for migration VM=
s when PT mirroring is disabled
--

commit ec37bcd236de3cdab70b39d0f31888be55640311
Author: Matthew Brost <matthew.brost@intel.com>

drm/xe: Add device flag to enable PT mirroring across tiles

This commit introduces a device flag to enable or disable page-table
mirroring across tiles. It defaults to enabled for PVC, aiming to allow
flexibility based on memory bandwidth needs.

> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 0f542f47b9a84..f450e1c6f7500 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
[ ... ]
> @@ -1739,7 +1749,8 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u3=
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
When has_pt_mirror is false, does this logic in xe_vm_create() allocate
page tables that will never be used?

For normal VMs (where flags & XE_VM_FLAG_MIGRATION is false), the condition
fails and we allocate pt_root[id] for all tiles. However, xe_vm_pt_root()
will unconditionally return pt_root[0] when has_pt_mirror is false, leaving
pt_root[1..N] unused and wasting VRAM.

Additionally, for a migration VM targeting a secondary tile (e.g., tile 1),
the condition tile->id !=3D 1 && (has_pt_mirror || 0) evaluates to false wh=
en
id =3D=3D 0, causing it to allocate both pt_root[0] and pt_root[1].

[ ... ]
> @@ -5074,3 +5085,21 @@ void xe_vm_remove_exec_queue(struct xe_vm *vm, str=
uct xe_exec_queue *q)
>  	}
>  	up_write(&vm->exec_queues.lock);
>  }
> +
> +/**
> + * xe_vm_pt_root() - Retrieve VM page-table root
> + * @vm: The VM.
> + * @tile_id: Tile ID
> + *
> + * Retrieve VM page-table root for a tile ID, used to abstract if PT mir=
roring is
> + * enabled across tiles.
> + *
> + * Return: VM page-table root for a tile ID
> + */
> +struct xe_pt *xe_vm_pt_root(struct xe_vm *vm, u8 tile_id)
> +{
> +	if (vm->xe->info.has_pt_mirror)
> +		return vm->pt_root[tile_id];
> +
> +	return vm->pt_root[0];
> +}

[Severity: Medium]
Does returning vm->pt_root[0] here in xe_vm_pt_root() when has_pt_mirror
is false force cross-tile VRAM access for migration VMs on secondary tiles?

As noted above, a migration VM targeting a secondary tile will have its page
tables allocated in pt_root[1]. But since xe_vm_pt_root(vm, 1) will return
pt_root[0], the migration engine on tile 1 will be forced to walk page
tables physically located in tile 0's VRAM.

Can this cause a performance regression for migration operations on seconda=
ry
tiles?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260925045320.1325=
860-1-matthew.brost@intel.com?part=3D17
