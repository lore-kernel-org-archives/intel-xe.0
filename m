Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ADE7C5DF7D
	for <intel-xe@archiver.kernel.org>; Fri, 21 Aug 2026 09:54:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E227B10F2BB;
	Fri, 21 Aug 2026 09:54:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RnWQInQD";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5773610F2CE
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Aug 2026 09:54:28 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 355D4600AA;
 Fri, 21 Aug 2026 09:54:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6F161F000E9;
 Fri, 21 Aug 2026 09:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787306066;
 bh=IAXknRH1nPzgcEGwRkVLFRuJM3lPguFLnVl3lF+jZt4=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=RnWQInQDdYQ058VmIl3ke0vSIowtTxP3wrmpiSfC2TwLEEwNWVc8z+ipSpEJYKDN9
 6bmRhfaWIy4nG3Drl+q/wXeTQl9hLYCb6U60hx0SZEuAfnHOaAgqOx5oXgITP683h8
 VwFOMgfZKNTI/yPsp/y5I4OGjkVuFj9Txs9cFd6SBgT0BCfmyW47pzIMPN2IjvguH5
 3EJXU50upy/ccEzaMjGITcpCfYhPFntzwOTYSczcJKV9KV5JXISAGFwz86WnHD131+
 BiLqiR2ifn3G6TDaeO7wtdwuIs15lurBC8oIwykqM03k/ExKiFdOd7+7r8lS/3Jkm7
 xzc49CuJ3l3Iw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/4] drm/xe/vram: Add binding information to VRAM
 regions
To: =?utf-8?b?UGnDs3Jrb3dza2ksIFBpb3Ry?= <piotr.piorkowski@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260821094601.607060-2-piotr.piorkowski@intel.com>
References: <20260821094601.607060-1-piotr.piorkowski@intel.com>
 <20260821094601.607060-2-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 09:54:26 +0000
Message-Id: <20260821095426.B6F161F000E9@smtp.kernel.org>
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
- [Medium] The device-level aggregate VRAM region (`xe->mem.vram`) is left =
with an implicitly zeroed `binding` field, causing it to incorrectly identi=
fy as a tile-bound region for tile 0 and violating uniqueness constraints.
--

--- Patch [1]: [PATCH v2 1/4] drm/xe/vram: Add binding information to VRAM =
regions ---
commit c73dc6ee289feb3d1e22f53db84480b8a5bc094f
Author: Piotr Pi=C3=B3rkowski <piotr.piorkowski@intel.com>
Subject: drm/xe/vram: Add binding information to VRAM regions

Add a binding field to VRAM regions and pass it at allocation time.
This allows distinguishing VRAM regions serving different purposes. It is
needed for future patches where different VRAM regions serve different
purposes, such as dedicated VRAM for kernel allocations.

> diff --git a/drivers/gpu/drm/xe/xe_vram_types.h b/drivers/gpu/drm/xe/xe_v=
ram_types.h
> index 646e3c12ae9f7..51884e7a679d1 100644
> --- a/drivers/gpu/drm/xe/xe_vram_types.h
> +++ b/drivers/gpu/drm/xe/xe_vram_types.h
[ ... ]
> @@ -26,9 +34,11 @@ struct xe_vram_region {
>  	/**
>  	 * @id: VRAM region instance id
>  	 *
> -	 * The value should be unique for VRAM region.
> +	 * The value should be unique within a given binding.
>  	 */
>  	u8 id;
> +	/** @binding: VRAM region instance binding */
> +	enum xe_vram_binding binding;

[Severity: Medium]
Will this default initialization cause duplicate IDs for the aggregate devi=
ce
VRAM region?

The aggregate VRAM region is allocated in
drivers/gpu/drm/xe/xe_device.c:xe_device_vram_alloc() using drmm_kzalloc(),
which zeroes the memory but doesn't explicitly initialize the binding or id
fields. Because XE_VRAM_BINDING_TILE is 0, xe->mem.vram implicitly defaults
to XE_VRAM_BINDING_TILE with an id of 0.

This appears to violate the new struct documentation stating that id should=
 be
unique within a given binding, since both the aggregate region and the actu=
al
tile 0 region will have id 0 and XE_VRAM_BINDING_TILE.

> diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
> index 23eb7edbdd572..e5f83df988263 100644
> --- a/drivers/gpu/drm/xe/xe_vram.c
> +++ b/drivers/gpu/drm/xe/xe_vram.c
[ ... ]
> @@ -217,11 +241,13 @@ static void print_vram_region_info(struct xe_device=
 *xe, struct xe_vram_region *
>  		drm_info(drm, "Small BAR device\n");
> =20
>  	drm_info(drm,
> -		 "VRAM[%u]: Actual physical size %pa, usable size exclude stolen %pa, =
CPU accessible size %pa\n",
> -		 vram->id, &vram->actual_physical_size, &vram->usable_size, &vram->io_=
size);
> -	drm_info(drm, "VRAM[%u]: DPA range: [%pa-%llx], io range: [%pa-%llx]\n",
> -		 vram->id, &vram->dpa_base, vram->dpa_base + (u64)vram->actual_physica=
l_size,
> -		 &vram->io_start, vram->io_start + (u64)vram->io_size);
> +		 "%s[%u] VRAM region: Actual physical size %pa, usable size exclude st=
olen %pa, CPU accessible size %pa\n",
> +		 stringify_vram_binding(vram->binding), vram->id, &vram->actual_physic=
al_size,
> +		 &vram->usable_size, &vram->io_size);

[Severity: Medium]
Will this cause print_vram_region_info() to print two identical
"Tile[0] VRAM region:" messages?

Since xe->mem.vram defaults to XE_VRAM_BINDING_TILE and id 0, it seems like=
 we
would get one log for the actual tile and one for the device-level aggregat=
ed
sizes, both labeled as "Tile[0]".

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821094601.6070=
60-1-piotr.piorkowski@intel.com?part=3D1
