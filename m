Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F19606A31C
	for <intel-xe@archiver.kernel.org>; Mon, 16 Nov 2026 12:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U+tZJjUL
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1391210E9FD;
	Mon, 16 Nov 2026 12:56:22 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 994A310E9FD
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Nov 2026 12:56:15 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 95EE360E14;
 Mon, 16 Nov 2026 12:56:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24EEA1F000C4;
 Mon, 16 Nov 2026 12:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794833774;
 bh=9pBt2bZ2xYwtK1Qm9QDo0WKpvw14d0zD7/+4uLL9uZw=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=U+tZJjULstZLw9ptSqye8+XxdZG6HdjVvPouWYHAcRkVZuGAhUkrPj2xTxVOzuVSG
 Ofw9ACm5St/uUqqvFS+LNI6Hu4vuF1XHDjr83FP//GbFdlGcZMsk72KYUyCRISFSDJ
 BlZBWU/3QUiQdHl7lzzZq8D4nZ8hIEp6QxA2LuSIICJvmR7hnGmx9FhOqv+M/KA6OO
 MAzVE0ShB14UEs+AC7nGPPD1fhGZ+kdSDAXgyYvsBxRP+mvNIXhpQMIfvn8jkQqu03
 iP3tcTxE37GCB8ug98NTJNymoyQVEMYpOd1P0+4K7M8JeHJd+w13IgM8j3GImk0Ud4
 OJHb2RNLPaizw==
Message-ID: <sashiko-outbox-217026@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 5/6] drm/xe/display: Remove duplicated code
To: "Maarten Lankhorst" <dev@lankhorst.se>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261116122828.266113-13-dev@lankhorst.se>
References: <20261116122828.266113-8-dev@lankhorst.se>
 <20261116122828.266113-13-dev@lankhorst.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 12:56:13 +0000
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] drm/xe/display: spurious drm_err in initial_plane_bo() without
  stolen memory
--

commit bab2c79797477724bcda99b81e670f98a25a3bee
Author: Maarten Lankhorst <dev@lankhorst.se>

drm/xe/display: Remove duplicated code

This commit moves the GGTT PTE read and local-memory bit check out of the
discrete and integrated branches in initial_plane_bo().

> diff --git a/drivers/gpu/drm/xe/display/xe_initial_plane.c b/drivers/gpu/=
drm/xe/display/xe_initial_plane.c
> index 451c24a4ed8d5..1366b68f43fc2 100644
> --- a/drivers/gpu/drm/xe/display/xe_initial_plane.c
> +++ b/drivers/gpu/drm/xe/display/xe_initial_plane.c
[ ... ]
> @@ -58,16 +58,14 @@ initial_plane_bo(struct xe_device *xe,
>  			page_size);
>  	size -=3D base;
> =20
> -	if (IS_DGFX(xe)) {
> -		u64 pte =3D xe_ggtt_read_pte(tile0->mem.ggtt, base);
> -
> -		if (is_pte_local(pte) !=3D need_pte_local(xe)) {
> -			drm_err(&xe->drm, "Initial plane PTE has bad local memory bit\n");
> -			return NULL;
> -		}
> -
> -		phys_base =3D pte & ~(page_size - 1);
> +	pte =3D xe_ggtt_read_pte(tile0->mem.ggtt, base);
> +	phys_base =3D pte & ~(page_size - 1);
> +	if (is_pte_local(pte) !=3D need_pte_local(xe)) {
> +		drm_err(&xe->drm, "Initial plane PTE has bad local memory bit\n");
> +		return NULL;
> +	}
> =20
> +	if (IS_DGFX(xe)) {
>  		flags |=3D XE_BO_FLAG_VRAM0;
> =20
>  		/*
> @@ -85,24 +83,13 @@ initial_plane_bo(struct xe_device *xe,
>  			    "Using phys_base=3D%pa, based on initial plane programming\n",
>  			    &phys_base);
>  	} else {
> -		struct ttm_resource_manager *stolen;
> -		u64 pte;
> -
> -		stolen =3D ttm_manager_type(&xe->ttm, XE_PL_STOLEN);
> -		if (!stolen) {
> +		if (!ttm_manager_type(&xe->ttm, XE_PL_STOLEN)) {
>  			drm_dbg_kms(&xe->drm, "No stolen for initial FB\n");
>  			return NULL;
>  		}
> =20
> -		pte =3D xe_ggtt_read_pte(tile0->mem.ggtt, base);
> -
> -		if (is_pte_local(pte) !=3D need_pte_local(xe)) {
> -			drm_err(&xe->drm, "Initial plane PTE has bad local memory bit\n");
> -			return NULL;
> -		}
> -
> -		phys_base =3D (pte & ~(page_size - 1)) - xe_ttm_stolen_gpu_offset(xe);
>  		flags |=3D XE_BO_FLAG_STOLEN;
> +		phys_base -=3D xe_ttm_stolen_gpu_offset(xe);

[Severity: Low]
Can moving the PTE local-memory bit check ahead of the stolen memory manager
check cause a spurious drm_err() on integrated platforms without stolen
memory?

On integrated platforms with has_lmembar(xe) where XE_PL_STOLEN is
unavailable, firmware can place the initial framebuffer in system memory
without XE_GGTT_PTE_DM set.  Previously, initial_plane_bo() checked
ttm_manager_type(&xe->ttm, XE_PL_STOLEN) first and returned NULL with a
drm_dbg_kms() message, as added in 1d2a6c96f6f7 ("drm/xe: Print a debug
message if we have no stolen for the initial FB").  With this change, it
logs "Initial plane PTE has bad local memory bit" via drm_err() before
reaching the stolen check.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116122828.2661=
13-8-dev@lankhorst.se?part=3D5
