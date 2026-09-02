Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3830C61DD6
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 13:12:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9357910F1C4;
	Wed,  2 Sep 2026 13:12:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JHnOwSak";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B42C610F1C4
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Sep 2026 13:12:08 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 84C1D40960;
 Wed,  2 Sep 2026 13:12:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 497C81F000E9;
 Wed,  2 Sep 2026 13:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788354728;
 bh=JkD/BaQG0j6pX62vViNxTaQSofz7QgFl+j6v5BJRM5Y=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=JHnOwSakZnMdVXps9fUxW/nG+3cpgwaCk9kE3JQiUwTvQ9F0msFNz45jzlWV2zRG8
 P/TqjWQjsgQHz2jIS786JUKAB9C3ljMfuEJmdDNoZ5bmMheQC27/japHqNWyAUb1Ic
 n8pkxITMBKkagGG5J63nXaqB+8o64RBTlleUG/9GRL5jvqkcWHn78vQyXxqzT3CXMW
 EPAs4JNIhCmylczHLip90AL/OXzWNmkK6rKhgoC4VjOYm2FJODUXDcxdnKW9VRfUGs
 o/14ObP/3DimnBVKgmOqaHJM+GHMa76u+whGTWvhF+7zH0xT5z2AztWORuNtlz+lTv
 PtuGPncG84yeA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/5] drm/xe/vram: revamp CPU VRAM mapping
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260902124117.918018-10-matthew.auld@intel.com>
References: <20260902124117.918018-7-matthew.auld@intel.com>
 <20260902124117.918018-10-matthew.auld@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 13:12:07 +0000
Message-Id: <20260902131208.497C81F000E9@smtp.kernel.org>
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
- [High] The panic handler incorrectly computes the virtual address for sto=
len memory framebuffers, silently corrupting normal VRAM instead of drawing=
 the panic screen.
--

commit 122b98d2306bc2a11fb8cd83e0ebcab780bfb24e
Author: Matthew Auld <matthew.auld@intel.com>

drm/xe/vram: revamp CPU VRAM mapping

This commit moves the devm_ioremap_wc() call to vram_region_init(), mapping
VRAM on a per-tile basis restricted to usable_size. It helps catch
out-of-bounds CPU writes by placing a guard page at the end of each per-tile
mapping.

> diff --git a/drivers/gpu/drm/xe/display/xe_panic.c b/drivers/gpu/drm/xe/d=
isplay/xe_panic.c
> index 12c6fb99015dd..1a6cee25e9d76 100644
> --- a/drivers/gpu/drm/xe/display/xe_panic.c
> +++ b/drivers/gpu/drm/xe/display/xe_panic.c
> @@ -52,7 +52,8 @@ static void xe_panic_page_set_pixel(struct drm_scanout_=
buffer *sb, unsigned int
>  	if (new_page !=3D panic->page) {
>  		if (xe_bo_is_vram(bo)) {
>  			/* Display is always mapped on root tile */
> -			struct xe_vram_region *vram =3D xe_bo_device(bo)->mem.vram;
> +			struct xe_vram_region *vram =3D
> +				xe_device_get_root_tile(xe_bo_device(bo))->mem.vram;
> =20
>  			if (panic->page < 0 || new_page < panic->page) {
>  				xe_res_first(bo->ttm.resource, new_page * PAGE_SIZE,

[Severity: High]
This isn't a bug introduced by this patch, but does the panic handler
incorrectly compute the virtual address for stolen memory framebuffers?

When a kernel panic occurs while the active framebuffer is in stolen memory
(XE_PL_STOLEN), xe_bo_is_vram() returns true. The code in
xe_panic_page_set_pixel() then adds panic->res.start (which is an offset
starting at 0 within the stolen region) to vram->mapping (which maps normal
VRAM) slightly below this hunk:

    iosys_map_set_vaddr_iomem(&panic->vmap,
                              vram->mapping + panic->res.start);

This could silently corrupt normal VRAM instead of drawing the panic screen.

While this is a pre-existing issue, restricting vram->mapping to
usable_size in this patch makes it structurally impossible to fix by merely
correcting the offset, as the stolen memory region is explicitly excluded
from the mapping.

Should the panic handler be updated to use xe->mem.stolen_mgr->mapping for
XE_PL_STOLEN buffers?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902124117.9180=
18-7-matthew.auld@intel.com?part=3D3
