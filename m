Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEDD1C5CFDB
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 10:38:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CFB610E028;
	Thu, 13 Aug 2026 10:38:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eqvWI2Vr";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD76810E4B2
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Aug 2026 10:38:46 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id DDED7600AF;
 Thu, 13 Aug 2026 10:38:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80D781F000E9;
 Thu, 13 Aug 2026 10:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1786617525;
 bh=/id5rtRMi/4eombRwNqQ9nGIEcB6z4gacARXr1zB38A=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=eqvWI2VrOS/Wvwr51i9Hvtc0CrIWRfMYfrywGA2NY0uV80OgaPKgSmC9nE8d0dHiC
 sddwX9hE983u3Tf0ez3SQC68cJjGFdKE5bSoYgjZJbXVBmgF3dCxsN7fJejXYv1bA5
 +8mDJh3o7NO/TY6zMQ6SzlycezIVDQHP9PnyA1o1Cj0HMUOSiNa5CTSol4kkqb9YCm
 vLHyZFFSjm/vfTU+T0eU6YTZiClWoCWSTr+/ndJBhOrobgxXKDcWPR2IRR/riPce2U
 kSvnWs/EpsTflv5AGNdwEadW2SfRnzYjJaEckCC9oQTPUsfoKGxTpNm5chAiv/pvZf
 nS6eA1ofj43YQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 3/4] drm/xe/vram: Add initial support for PF-mem regions
To: =?utf-8?b?UGnDs3Jrb3dza2ksIFBpb3Ry?= <piotr.piorkowski@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260813102511.200690-4-piotr.piorkowski@intel.com>
References: <20260813102511.200690-1-piotr.piorkowski@intel.com>
 <20260813102511.200690-4-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 10:38:45 +0000
Message-Id: <20260813103845.80D781F000E9@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [Medium] `xe_vram_region_init_pfmem` does not enforce page alignment for =
the caller-provided `offset` and `size`.
- [Medium] Incorrect physical address calculation for PFMEM resources in `x=
e_ttm_vram_mgr_alloc_sgt` due to hardcoded parent VRAM region.
- [Low] Duplicate function declarations for `xe_map_resource_to_region` and=
 `xe_vram_probe`.

Pre-existing issues:
- [High] If the LMEM BAR mapping fails, `vram_region_init` creates a bogus,=
 non-NULL pointer for `vram->mapping`, leading to a kernel panic.
--

--- Patch [3]: [PATCH v1 3/4] drm/xe/vram: Add initial support for PF-mem r=
egions ---
commit 6301fdec9ffb8a28243957040dadf342236bc7f7
Author: Piotr Pi=C3=B3rkowski <piotr.piorkowski@intel.com>

drm/xe/vram: Add initial support for PF-mem regions

This commit adds helpers to allocate and initialize PF-mem VRAM regions from
a caller-provided parent, offset, and size. It also assigns the matching TTM
placement. A separate TTM VRAM manager is initialized when a caller installs
the region as the tile kernel_vram.

> diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
> index e5f83df988263..29c93e9aa5a72 100644
> --- a/drivers/gpu/drm/xe/xe_vram.c
> +++ b/drivers/gpu/drm/xe/xe_vram.c
[ ... ]
> @@ -276,6 +278,45 @@ static int vram_region_init(struct xe_device *xe, st=
ruct xe_vram_region *vram,
[ ... ]
> +int xe_vram_region_init_pfmem(struct xe_vram_region *vram,
> +			      struct xe_vram_region *parent,
> +			      u64 offset, u64 size)
> +{
> +	struct xe_device *xe =3D parent->xe;
> +	resource_size_t remain_io_size;
> +
> +	if (!size || offset > parent->usable_size ||
> +	    size > parent->usable_size - offset)
> +		return -EINVAL;

[Severity: Medium]
Does this validation block need to enforce page alignment for the caller-pr=
ovided
offset and size? Unaligned physical base addresses could propagate to the T=
TM
buddy allocator and SGL mappings, which might lead to unaligned PTE program=
ming
in the GPU.

Also, when a buffer object allocated in kernel_vram is exported, will
xe_ttm_vram_mgr_alloc_sgt() calculate the correct physical address?

Currently, it calculates the address using the parent tile's VRAM:

drivers/gpu/drm/xe/xe_ttm_vram_mgr.c:xe_ttm_vram_mgr_alloc_sgt() {
    ...
    phys_addr_t phys =3D cursor.start + xe_vram_region_io_start(tile->mem.v=
ram);
    ...
}

Should it dynamically resolve the region using xe_map_resource_to_region(re=
s)
to ensure the PFMEM offset is included?

> +
> +	remain_io_size =3D offset < parent->io_size ? parent->io_size - offset =
: 0;
> +	if (!remain_io_size)
> +		return -EINVAL;
> +
> +	return vram_region_init(xe, vram, parent, offset, size, size, remain_io=
_size);

[Severity: High]
This is a pre-existing issue, but if the parent LMEM BAR mapping fails, cou=
ld
this propagate a bogus, non-NULL pointer to the PFMEM region?

In vram_region_init(), if lmem_bar->mapping is NULL, calculating:

    vram->mapping =3D lmem_bar->mapping + offset;

with a non-zero offset yields a poisoned pointer that bypasses safety check=
s like
if (vram->mapping).

> +}
[ ... ]
> diff --git a/drivers/gpu/drm/xe/xe_vram.h b/drivers/gpu/drm/xe/xe_vram.h
> index 87088ffbfd5e5..4c77d128e3293 100644
> --- a/drivers/gpu/drm/xe/xe_vram.h
> +++ b/drivers/gpu/drm/xe/xe_vram.h
> @@ -16,7 +16,14 @@ struct ttm_resource;
>  struct xe_vram_region *xe_map_resource_to_region(struct ttm_resource *re=
s);
>  int xe_vram_probe(struct xe_device *xe);
> =20
> +struct xe_vram_region *xe_map_resource_to_region(struct ttm_resource *re=
s);
> +int xe_vram_probe(struct xe_device *xe);

[Severity: Low]
This isn't a bug, but these function declarations were already present right
above. Were they duplicated by accident?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813102511.2006=
90-1-piotr.piorkowski@intel.com?part=3D3
