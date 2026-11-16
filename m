Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA5E606A329
	for <intel-xe@archiver.kernel.org>; Mon, 16 Nov 2026 12:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oroRlga+
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FA4810EE94;
	Mon, 16 Nov 2026 12:49:45 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 251CD10EE94
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Nov 2026 12:49:39 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 0A1CE629D8;
 Mon, 16 Nov 2026 12:49:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C1811F000C5;
 Mon, 16 Nov 2026 12:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794833377;
 bh=sKshv7WiIMr/IuCcXWBiqFRmsyAt3kgIwAq8XUc9Qbk=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=oroRlga+93/Iu/XgHozvBxcDBpkfiLDidYhJjWo4Kb9LeFRvgg5qcSOda0EODiUSz
 9DOWRSJVpdxoVGmhX4JAShHc60+T8niODZ+cHffGoAZoCg7WX9KEICPKCT2voUsDwL
 niaqa5PUzrmQoBZcuSoSOkhPPi1gxmQ6WCorkOMm1JL4grKVkrjCQK/QIJCHNqHZ1r
 /lfml7mObY375EmZ2xAnrVTZHXrW5mAC8/KuD6vgEEjLWP/9aH1a8z76QxbBd8Erv9
 U8aoZCIW5rwwn2K4nUZDDo0Y0OheTxAcSt9J2Ji6AZwL+AMRuCfRmYSOlyJgqhkoBU
 +jOKF7K7WbcBA==
Message-ID: <sashiko-outbox-217024@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/6] drm/xe/display: Use the correct calculation for
 phys_base on integrated
To: "Maarten Lankhorst" <dev@lankhorst.se>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261116122828.266113-12-dev@lankhorst.se>
References: <20261116122828.266113-8-dev@lankhorst.se>
 <20261116122828.266113-12-dev@lankhorst.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 12:49:37 +0000
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
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [Medium] drm/xe/display: phys_base underflow in initial_plane_bo()
  without bounds check
- [Medium] drm/xe/display: unmasked upper GGTT PTE bits in
  initial_plane_bo() phys_base
- [Low] drm/xe/display: missing Fixes trailer for integrated phys_base
  fix
--

commit eed4039b7f540e8781cba90ce638a76b3efbdd53
Author: Maarten Lankhorst <dev@lankhorst.se>

> drm/xe/display: Use the correct calculation for phys_base on integrated
>
> The code originally assumed there was a 1:1 mapping between
> stolen and GGTT offset. This is no longer true as of MTL, so
> perform the correct calculations, similar to how they're
> performed for the DGFX case.
>
> Reported-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>

[Severity: Low]
This fixes the integrated phys_base calculation introduced in the initial
display support.  Should this include:

  Fixes: 44e694958b95 ("drm/xe/display: Implement display support")

> diff --git a/drivers/gpu/drm/xe/display/xe_initial_plane.c b/drivers/gpu/=
drm/xe/display/xe_initial_plane.c
> index a100ad23be2a0..451c24a4ed8d5 100644
> --- a/drivers/gpu/drm/xe/display/xe_initial_plane.c
> +++ b/drivers/gpu/drm/xe/display/xe_initial_plane.c
> @@ -101,7 +101,7 @@ initial_plane_bo(struct xe_device *xe,
>  			return NULL;
>  		}
> =20
> -		phys_base =3D base;
> +		phys_base =3D (pte & ~(page_size - 1)) - xe_ttm_stolen_gpu_offset(xe);

[Severity: Medium]
Can phys_base underflow when the PTE address is below
xe_ttm_stolen_gpu_offset(xe)?

Unlike the IS_DGFX(xe) path, this branch does not check XE_PAGE_PRESENT or
verify that the PTE address lies within the stolen range before
subtracting xe_ttm_stolen_gpu_offset(xe).  If the initial plane PTE is
unmapped or points to system memory below stolen_base (for example across
module reload, PCI rebind, or kexec when the active framebuffer was
allocated in system memory), phys_base underflows near U64_MAX.  When
size >=3D xe_ttm_stolen_gpu_offset(xe) - pte_addr,
xe_bo_create_pin_map_at_novm() -> xe_bo_create_pin_map_at_aligned() wraps
end =3D start + size so that end <=3D start:

drivers/gpu/drm/xe/xe_bo.c:xe_bo_create_pin_map_at_aligned() {
	...
	u64 start =3D offset =3D=3D ~0ull ? 0 : offset;
	u64 end =3D offset =3D=3D ~0ull ? ~0ull : start + size;
	...
}

ttm_range_man_alloc() then passes place->fpfn > lpfn into
drm_mm_insert_node_in_range(), triggering DRM_MM_BUG_ON(range_start >
range_end) when CONFIG_DRM_DEBUG_MM is enabled.

[Severity: Medium]
Does masking pte with ~(page_size - 1) leave upper GGTT PTE flag bits set
in phys_base?

On Xe_LPG and newer platforms (GRAPHICS_VERx100(xe) >=3D 1270), GGTT PTEs
encode the PAT index in bits 52 and 53 (XELPG_GGTT_PTE_PAT0 and
XELPG_GGTT_PTE_PAT1 in xelpg_ggtt_pte_flags()), while the physical page
address occupies bits [51:shift] as defined by XE_PAGE_ADDR_MASK().
Masking with ~(page_size - 1) only clears the low page-offset bits, so any
non-zero PAT index in the PTE (both here and in the IS_DGFX(xe) path
above) leaves bits 52:53 set in phys_base and causes
xe_bo_create_pin_map_at_novm() to fail with -ENOSPC, discarding the
initial framebuffer.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116122828.2661=
13-8-dev@lankhorst.se?part=3D4
