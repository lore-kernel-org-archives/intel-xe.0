Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36446C5DF66
	for <intel-xe@archiver.kernel.org>; Mon, 17 Aug 2026 14:18:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E21F610E800;
	Mon, 17 Aug 2026 14:18:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TEkhm6Ze";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94B7C10E800
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Aug 2026 14:18:24 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 7D4F043954;
 Mon, 17 Aug 2026 14:18:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 351C51F00A3A;
 Mon, 17 Aug 2026 14:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1786976304;
 bh=/SxkOPxBmic7nwjP+L5hWhDE1kBZxBM5v4H1VkLcsk8=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=TEkhm6ZeWKAzVegGQqb/KQI/DBkgD/8OkdWYeTC11FQf0syE8Gk3iu700Snm4Ehvq
 7NsFxvTlxNdLNZfSH+pofCqyqzJIpTOb6Et66mLh9Ie0z+kZqpxK4pKlUqO22SAjD/
 u1lB8ZRF/Hfa0EV4gAQKW/FYLshUk+P9k24dfTaRjE0v2Y1etoKj5hY0G1Xq668ygl
 p2Xnk9abkXufOuQoOPBTvXq0+eBKSM0fhyflZG6r6Q9u10k4lsm7aKfpu7gwM4A7jM
 dZASaLizU9Kqbx3OpbVH/HAlhv0xQLoa/RCPrLpx4qWmnmSImtWhEZLcR0iIQCcVkc
 VdsWt+T5dR1Ag==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/3] drm/xe/ggtt: Split GGTT into usable and
 shareable pools
To: =?utf-8?b?UGnDs3Jrb3dza2ksIFBpb3Ry?= <piotr.piorkowski@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260817140342.415803-2-piotr.piorkowski@intel.com>
References: <20260817140342.415803-1-piotr.piorkowski@intel.com>
 <20260817140342.415803-2-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 Aug 2026 14:18:23 +0000
Message-Id: <20260817141824.351C51F00A3A@smtp.kernel.org>
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
- [High] Unconditional initialization of the shareable pool size causes gua=
ranteed assertion failures on VFs and incorrectly alters the native allocat=
ion strategy.
- [Medium] Clamping `end` to `ggtt->size` turns a graceful `-ENOSPC` failur=
e into a kernel WARNING for oversized BOs.
--

--- Patch [1]: [PATCH v3 1/3] drm/xe/ggtt: Split GGTT into usable and share=
able pools ---
commit 1bffe9ae3d9e5639133437250d4cd685f998d972
Author: Piotr Pi=C3=B3rkowski <piotr.piorkowski@intel.com>
Subject: drm/xe/ggtt: Split GGTT into usable and shareable pools

This commit splits the driver-owned GGTT allocations and VF provisioning in=
to
a usable pool for driver-owned allocations and a shareable pool for VF
provisioning. Separate insertion APIs are added for both pools.

> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 8ec23862477fc..c7e1cb1b1ccbf 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
[ ... ]
> @@ -438,7 +466,7 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
>  	if (!ggtt->wq)
>  		return -ENOMEM;
> =20
> -	__xe_ggtt_init_early(ggtt, ggtt_start, ggtt_size);
> +	__xe_ggtt_init_early(ggtt, ggtt_start, ggtt_size, ggtt_size);

[Severity: High]
Does this unconditionally initialize the shareable pool size on all
configurations?

By passing ggtt_size as the shareable_size here, ggtt->shareable.size will
always be greater than 0. This seems to alter the default allocation behavi=
or
on bare-metal setups, as ggtt_usable_insert_flags() will incorrectly return
DRM_MM_INSERT_LOW.

This also seems to cause an assertion failure later on VFs:

[ ... ]
> @@ -610,16 +638,55 @@ void xe_ggtt_shift_nodes(struct xe_ggtt *ggtt, u64 =
new_start)
> =20
>  	xe_tile_assert(ggtt->tile, new_start >=3D xe_wopcm_size(tile_to_xe(ggtt=
->tile)));
>  	xe_tile_assert(ggtt->tile, new_start + ggtt->size <=3D GUC_GGTT_TOP);
> +#ifdef CONFIG_PCI_IOV
> +	xe_tile_assert(ggtt->tile, ggtt->shareable.size =3D=3D 0);
> +#endif

Will this assertion unconditionally trip on VFs during driver initialization
or recovery?

Since xe_ggtt_init_early() initializes shareable.size to ggtt_size, it is
never 0.

> =20
>  	/* pairs with READ_ONCE in xe_ggtt_node_addr() */
>  	WRITE_ONCE(ggtt->start, new_start);
[ ... ]
> @@ -832,10 +939,13 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *g=
gtt, struct xe_bo *bo,
>  	else
>  		end =3D 0;
> =20
> +	end =3D min(end, ggtt->size);
> +
>  	xe_tile_assert(ggtt->tile, end >=3D start + xe_bo_size(bo));

[Severity: Medium]
Does clamping end to ggtt->size here convert a graceful allocation failure
into a kernel warning?

If an oversized buffer object is submitted for mapping, clamping end will
force this assertion to fail. Could this be triggered by userspace submitti=
ng
a large framebuffer, resulting in a kernel warning instead of gracefully
returning -ENOSPC from the subsequent drm_mm_insert_node_in_range() call?

>  	err =3D drm_mm_insert_node_in_range(&ggtt->mm, &bo->ggtt_node[tile_id]-=
>base,
> -					  xe_bo_size(bo), alignment, 0, start, end, 0);
> +					  xe_bo_size(bo), alignment, 0, start, end,
> +					  ggtt_usable_insert_flags(ggtt));

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260817140342.4158=
03-1-piotr.piorkowski@intel.com?part=3D1
