Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1800EC61DD6
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 10:49:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EDCA10E170;
	Wed,  2 Sep 2026 10:49:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XWhhC9BB";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77FFF10E170
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Sep 2026 10:49:37 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id C9992600D1;
 Wed,  2 Sep 2026 10:49:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63BA71F000E9;
 Wed,  2 Sep 2026 10:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788346176;
 bh=7nNCrEvJIntxff5DZzFtQZZjFg4edHsN9ic/MdR8w8w=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=XWhhC9BBbf8BKtobM2nG4Cz1jspAcs3aprjOPX62wNIsTzkQdcwijuB61M0w/hJtX
 Om6gPqYZMdUaq3VPeDtD98bnpYmXSOVFapttq77b9mnkEQ5iVrFSbC/uvUhlM/OnoK
 n9j6bA6pSxMsxdC9H817J6jwGa2JR/WjvgYlDHbUVNTAEXSi0gDwOm2HzRtEule7J0
 /HIe/oJO0ngAfV8woyfgWz6GkHN7FWQVqHj/TxIOcECp06PJ4ibLtexC+Js+ILqhVd
 qPTLjOqO1XcZOmx4Y/a/EEhB8UxnulpRorevsBZwPdVNEFE+JDMFmDblpdwSMPT9I8
 3oPBN0kguDueQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/5] drm/xe/vram: revamp CPU VRAM mapping
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260902103931.826063-10-matthew.auld@intel.com>
References: <20260902103931.826063-7-matthew.auld@intel.com>
 <20260902103931.826063-10-matthew.auld@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 10:49:35 +0000
Message-Id: <20260902104936.63BA71F000E9@smtp.kernel.org>
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
- [High] The commit intentionally leaves the global VRAM mapping (`xe->mem.=
vram->mapping`) uninitialized (NULL), but the display panic handler (`xe_pa=
nic_page_set_pixel()`) still attempts to use it. This will cause an invalid=
 memory access during a kernel panic, resulting in a nested fault and preve=
nting the panic screen from being drawn.
--

commit c5769f31bf8cec4dae25246aba506ccb4445b29b
Author: Matthew Auld <matthew.auld@intel.com>

    drm/xe/vram: revamp CPU VRAM mapping
   =20
    Previously, we called devm_ioremap_wc() for the entire PCI LMEM BAR (wh=
ich
    can be significantly larger than usable memory, e.g., mapping 16G for a
    10G card), and then simply assigned subsets of this global mapping to e=
ach
    tile. By moving the devm_ioremap_wc() call into vram_region_init() and
    mapping on a per-tile basis, we restrict the virtual address space to e=
xactly
    the usable_size of each tile. As a consequence the global vram->mapping=
 is
    now NULL.

> diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
> index 56cff1e44530b..04d831b101bd1 100644
> --- a/drivers/gpu/drm/xe/xe_vram.c
> +++ b/drivers/gpu/drm/xe/xe_vram.c
[ ... ]
> @@ -257,8 +254,15 @@ static int vram_region_init(struct xe_device *xe, st=
ruct xe_vram_region *vram,
>  		return -ENODEV;
>  	}
> =20
> +	if (vram !=3D xe->mem.vram) {
> +		struct pci_dev *pdev =3D to_pci_dev(xe->drm.dev);
> +
> +		vram->mapping =3D devm_ioremap_wc(&pdev->dev, vram->io_start, vram->io=
_size);
> +		if (!vram->mapping)
> +			return -ENOMEM;
> +	}
> +
>  	vram->dpa_base =3D lmem_bar->dpa_base + offset;
> -	vram->mapping =3D lmem_bar->mapping + offset;
>  	vram->usable_size =3D usable_size;

[Severity: High]
Does this change break the drm_panic display handler by leaving the global
xe->mem.vram->mapping as NULL?

Looking at drivers/gpu/drm/xe/display/xe_panic.c, xe_panic_page_set_pixel()
appears to explicitly use the global vram->mapping to compute the IOMEM
address for drawing pixels when the framebuffer is in VRAM:

		if (xe_bo_is_vram(bo)) {
			/* Display is always mapped on root tile */
			struct xe_vram_region *vram =3D xe_bo_device(bo)->mem.vram;

			if (panic->page < 0 || new_page < panic->page) {
				xe_res_first(bo->ttm.resource, new_page * PAGE_SIZE,
					     bo->ttm.base.size - new_page * PAGE_SIZE, &panic->res);
			} else {
				xe_res_next(&panic->res, PAGE_SIZE * (new_page - panic->page));
			}
			iosys_map_set_vaddr_iomem(&panic->vmap,
						  vram->mapping + panic->res.start);

If vram->mapping is NULL, this could cause an invalid memory access when
dereferenced by iosys_map_wr() during a kernel panic, resulting in a nested
fault and preventing the panic screen from being displayed.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902103931.8260=
63-7-matthew.auld@intel.com?part=3D3
