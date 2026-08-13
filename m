Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 666C7C5CFEB
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 10:39:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25BBA10E028;
	Thu, 13 Aug 2026 10:39:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VMG/zilA";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A59F810E028
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Aug 2026 10:39:41 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 70CDD43DCF;
 Thu, 13 Aug 2026 10:39:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 364E01F000E9;
 Thu, 13 Aug 2026 10:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1786617581;
 bh=i7C/rDfD1QS0nfLGkZItf01m5zUKHoqedqiSsDDdir0=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=VMG/zilAfKJo6PQ30DqHwX/gnF4atUQO4DIyLSTKK/RfgZpNAqgX7yQi8mX7kdsp2
 AA0tiXPGurDk9AjcSOz4+t1rUrwzxfq84/3//niCnK/qZ6Dtl354N7qXw8jsjw/Oro
 GyHrgm+BU+8rAmAeFqiDYtmTlOGb3DrJX31lXue7qFWxZsgGxFGzK2kXRO0cucxU64
 rus28Qz1pMbG/HSMClbdDKgLGyup2RuSUcV6HEP+Y/pVcksOSY9ZAoMGGsd8tyQmty
 S7f62WkHmbodXI6pqr9dSz0HSuSV++ZExq7kf/+8728gzTNKZP0QBINDK1Pf41Jb0H
 K5ZGEO+hZLSTA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 2/4] drm/xe/ttm: Add PF-mem VRAM placement types for TTM
To: =?utf-8?b?UGnDs3Jrb3dza2ksIFBpb3Ry?= <piotr.piorkowski@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260813102511.200690-3-piotr.piorkowski@intel.com>
References: <20260813102511.200690-1-piotr.piorkowski@intel.com>
 <20260813102511.200690-3-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 10:39:40 +0000
Message-Id: <20260813103941.364E01F000E9@smtp.kernel.org>
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
- [Critical] Incorrect physical address calculation for PFMEM resources dur=
ing SG table allocation.
- [High] Unpinned BOs in PF-mem regions will not be evicted during system s=
uspend.
--

--- Patch [2]: [PATCH v1 2/4] drm/xe/ttm: Add PF-mem VRAM placement types f=
or TTM ---
commit f6760ba28a684206d85498b2ae22ad0e9bc13d79
Author: Piotr Pi=C3=B3rkowski <piotr.piorkowski@intel.com>

drm/xe/ttm: Add PF-mem VRAM placement types for TTM

This commit adds dedicated TTM placement types for kernel-only PF-mem VRAM=
=20
regions. It updates the BO memory iterators and eviction paths to recognize=
=20
and route these new VRAM placements.

> diff --git a/drivers/gpu/drm/xe/xe_bo_evict.c b/drivers/gpu/drm/xe/xe_bo_=
evict.c
> --- a/drivers/gpu/drm/xe/xe_bo_evict.c
> +++ b/drivers/gpu/drm/xe/xe_bo_evict.c
> @@ -303,7 +303,7 @@ void xe_bo_pci_dev_remove_all(struct xe_device *xe)
>  	 * Move pagemap bos and exported dma-buf to system, and
>  	 * purge everything else.
>  	 */
> -	for (mem_type =3D XE_PL_VRAM1; mem_type >=3D XE_PL_TT; --mem_type) {
> +	for (mem_type =3D XE_PL_VRAM1_PFMEM; mem_type >=3D XE_PL_TT; --mem_type=
) {
>  		struct ttm_resource_manager *man =3D

[Severity: High]
This updates the eviction loop in xe_bo_pci_dev_remove_all() to include the=
 new
PF-mem regions, but does xe_bo_evict_all_user() in this same file also need=
 to=20
be updated?

Looking at xe_bo_evict_all_user(), it still uses a hardcoded limit:

	for (mem_type =3D XE_PL_TT; mem_type <=3D XE_PL_VRAM1; ++mem_type) {
		struct ttm_resource_manager *man =3D ...

If this loop skips the newly added XE_PL_VRAM0_PFMEM and XE_PL_VRAM1_PFMEM=
=20
regions, will unpinned BOs in these regions fail to evict during system=20
suspend or D3cold transitions, potentially causing data loss?

[ ... ]

> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe=
_ttm_vram_mgr.c
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> @@ -405,7 +403,7 @@ int xe_ttm_vram_mgr_alloc_sgt(struct xe_device *xe,
>  			      enum dma_data_direction dir,
>  			      struct sg_table **sgt)
>  {
> -	struct xe_tile *tile =3D &xe->tiles[res->mem_type - XE_PL_VRAM0];
> +	struct xe_tile *tile =3D &xe->tiles[xe_vram_pl_to_tile_id(xe, res->mem_=
type)];
>  	struct xe_ttm_vram_mgr_resource *vres =3D to_xe_ttm_vram_mgr_resource(r=
es);

[Severity: Critical]
Can this lead to incorrect physical address mapping for PFMEM resources?

While the tile ID is correctly resolved here, later in this same function t=
he
physical address is calculated by unconditionally using the standard VRAM=20
region:

	phys_addr_t phys =3D cursor.start + xe_vram_region_io_start(tile->mem.vram=
);

Since PFMEM regions represent distinct memory allocations, will hardcoding
tile->mem.vram (instead of resolving the correct region for the resource) u=
se
the wrong IO start address for PFMEM resources?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813102511.2006=
90-1-piotr.piorkowski@intel.com?part=3D2
