Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45198606A337
	for <intel-xe@archiver.kernel.org>; Mon, 16 Nov 2026 11:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OE2Ry/7F
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F143010EF82;
	Mon, 16 Nov 2026 11:29:03 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4211C10EF78;
 Mon, 16 Nov 2026 11:26:34 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 5B330626F6;
 Mon, 16 Nov 2026 11:26:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCB9A1F000C4;
 Mon, 16 Nov 2026 11:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794828393;
 bh=IrKWgyUU6SUTKFIUVFuxJ4+lBzdhQeP/p+tJKvDUyxE=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=OE2Ry/7F9dw8BMlAdaHPv8IppqAxq+ylW9vxnS0ZG/70hVUWf8nD29BE3r85RiqCx
 IoevouRHCzPdr9VhSJcs50lWLVA7o2lxrNMkKa0u5iDgZSoGTrhjzy3LY/1tG4DKpa
 BDiMHSvd57wUObDtP/ttxSFdApCacyV4D3a++5/bL1FeFg+z76D2zcnS+k863rcJNX
 jMISQv7ODS63AoT8aLsIvi7aKRQSNrfmDNCqgyNwpvugThTzibQ4+ZyvFPRwfLJLQE
 wWRitTqWE/DMWcuTsy9yc2ZaNjtaKTlvEuyDmWaIOXdGtXnS5+LxcvvuJ+ptOTUeL2
 N1iqAF93aICfg==
Message-ID: <sashiko-outbox-216920@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] drm/xe/display: Use the GGTT PTE to find the initial FB
 in stolen
To: "Eriksen Xie" <xiaolu.xie@intel.com>, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
In-Reply-To: <20261116105303.1374969-1-xiaolu.xie@intel.com>
References: <20261116105303.1374969-1-xiaolu.xie@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 11:26:32 +0000
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] drm/xe/display: invalid fallback to GGTT offset in
  initial_plane_bo()
- [Low] drm/xe/display: missing Fixes trailer for initial_plane_bo()
  stolen fix
--

commit ed0b0b266d1c0a44fa0b64d4c8d1de936bec8937
Author: Eriksen Xie <xiaolu.xie@intel.com>

> drm/xe/display: Use the GGTT PTE to find the initial FB in stolen
>
> On integrated platforms initial_plane_bo() passes the GGTT address of
> the initial plane as is to xe_bo_create_pin_map_at_novm() as the offset
> into stolen. That is only correct if the BIOS maps stolen 1:1 into the
> GGTT.
>
> On Nova Lake the BIOS puts the initial FB at GGTT address 0xff800000
> instead. Its PTE (0x800003) points to the start of stolen memory (the
> stolen base is 0x800000), but using the GGTT address as the stolen
> offset is far beyond the 120 MiB of stolen, so the BO creation fails and
> the driver can't take over the BIOS FB:
>
>  xe 0000:00:02.0: [drm:xe_alloc_initial_plane_obj [xe]] Failed to create =
bo phys_base=3D0x00000000ff800000 size 8294400 with flags 430: -12
>
> Get the physical address from the PTE and convert it to an offset into
> stolen, similarly to what is done for the dGPU case. Keep using the
> GGTT address if the PTE doesn't point into stolen.
>
> Tested on a Nova Lake platform: the BIOS FB is now taken over as the
> initial FB.
>
> Signed-off-by: Eriksen Xie <xiaolu.xie@intel.com>

[Severity: Low]
This fixes a bug in initial_plane_bo() when taking over the initial
framebuffer in stolen memory.  Should this include:

  Fixes: 44e694958b95 ("drm/xe/display: Implement display support")

> diff --git a/drivers/gpu/drm/xe/display/xe_initial_plane.c b/drivers/gpu/=
drm/xe/display/xe_initial_plane.c
> index 0f86b73036d03..f69532b3aa94c 100644
> --- a/drivers/gpu/drm/xe/display/xe_initial_plane.c
> +++ b/drivers/gpu/drm/xe/display/xe_initial_plane.c
> @@ -85,7 +85,7 @@ initial_plane_bo(struct xe_device *xe,
>  			    &phys_base);
>  	} else {
>  		struct ttm_resource_manager *stolen;
> -		u64 pte;
> +		u64 pte, pte_addr, stolen_base;
> =20
>  		stolen =3D ttm_manager_type(&xe->ttm, XE_PL_STOLEN);
>  		if (!stolen) {
> @@ -100,7 +100,23 @@ initial_plane_bo(struct xe_device *xe,
>  			return NULL;
>  		}
> =20
> +		/*
> +		 * The plane surface is a GGTT address, which equals the offset
> +		 * into stolen only if the BIOS maps stolen 1:1 into the GGTT.
> +		 * Get the offset from the PTE instead, and fall back to the
> +		 * GGTT address if the PTE doesn't point into stolen.
> +		 */
>  		phys_base =3D base;
> +		stolen_base =3D xe_ttm_stolen_gpu_offset(xe);
> +		pte_addr =3D pte & XE_PAGE_ADDR_MASK(XE_PTE_SHIFT);
> +		if (pte_addr >=3D stolen_base &&
> +		    pte_addr - stolen_base < (u64)stolen->size << PAGE_SHIFT)
> +			phys_base =3D pte_addr - stolen_base;

[Severity: Medium]
Should initial_plane_bo() return NULL instead of falling back to
phys_base =3D base when pte_addr is outside the usable stolen range?

GGTT PTEs pointing into stolen memory always encode stolen_base + offset,
even when the BIOS maps stolen 1:1 into the GGTT.  If pte_addr is outside
[stolen_base, stolen_base + (stolen->size << PAGE_SHIFT)) =E2=80=94 for ins=
tance,
when the BIOS places the initial framebuffer in system memory on pre-MTL
or in a reserved DSM carveout =E2=80=94 the initial framebuffer is not in u=
sable
stolen memory at all.  Falling back to phys_base =3D base while keeping
XE_BO_FLAG_STOLEN causes xe_bo_create_pin_map_at_novm() to allocate
unrelated stolen memory at stolen_base + base whenever base fits within
stolen->size, and the display will scan out from that uninitialized memory
instead of discarding the initial FB like the IS_DGFX(xe) branch and
i915's initial_plane_phys() do.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116105303.1374=
969-1-xiaolu.xie@intel.com?part=3D1
