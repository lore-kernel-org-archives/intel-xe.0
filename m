Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4E7606A31C
	for <intel-xe@archiver.kernel.org>; Mon, 16 Nov 2026 12:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oaZGtYpg
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52C8B10E9E6;
	Mon, 16 Nov 2026 12:38:52 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AA8B10EFE9
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Nov 2026 12:38:46 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 3E78B6281F;
 Mon, 16 Nov 2026 12:38:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF8561F000C7;
 Mon, 16 Nov 2026 12:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794832725;
 bh=VGDmVR5U12MXysrZ2fHtOegMdbg1dOdHHTKs94W95tI=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=oaZGtYpgqkdsLhMyYqmu877hys/XhgkThtJG96X5qh7Y5NLl6ycfVY9rsYnx+B+6J
 Kd4Y2c6Dq/Ez+zzznQDb5I1MRd4EFx3eOOpv2iO3Ld6YhuiHPca4l9m27ScEmlwj/X
 /+VEDRz/BaDOEAqXUxfEyXPyJ/ufsz6G2G1VxoyJ4q6GHfzq/EMftSm7ZJo7lkPyAt
 rW+2PcM04q4v7D7qwhRfEjP7ZMoYjPNKLpPaKGWqzVzM00J/seuWrSTgKrTRsihjf8
 Czd7fIxFHye5VdiCP84kaO/5xc+u9gOWU5nQqdjcibBorAB5xGUm8qLkhO0Ig1JgoG
 u/XUOtxibqs5g==
Message-ID: <sashiko-outbox-217015@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/6] drm/xe/ggtt: Add xe_ggtt_reserve_area
To: "Maarten Lankhorst" <dev@lankhorst.se>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261116122828.266113-9-dev@lankhorst.se>
References: <20261116122828.266113-8-dev@lankhorst.se>
 <20261116122828.266113-9-dev@lankhorst.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 12:38:44 +0000
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

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] drm/xe/ggtt: 32-bit overflow on base + size in
  xe_ggtt_reserve_area()
- [Low] drm/xe/ggtt: kernel-doc parameter mismatch in
  xe_ggtt_reserve_area()
--

commit 1478ac0c6b7aadab2f5f53794d373565e2e70a03
Author: Maarten Lankhorst <dev@lankhorst.se>

drm/xe/ggtt: Add xe_ggtt_reserve_area

This commit adds xe_ggtt_reserve_area() and a helper xe_ggtt_insert_node_at=
()
to reserve a specific GGTT range clipped to addressable GGTT boundaries.

> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 9ef2ce743770f..ca38d51f41441 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c

[ ... ]

> @@ -708,6 +722,53 @@ struct xe_ggtt_node *xe_ggtt_insert_node(struct xe_g=
gtt *ggtt, u32 size, u32 ali
>  	return node;
>  }
> =20
> +/**
> + * xe_ggtt_reserve_area - Ensure an area of the GGTT is reserved.
> + * @ggtt: the &xe_ggtt where the area should be reserved.
> + * @start: Starting offset of range to reserve
> + * @size: size of the reservation
> + *
> + * This function ensures the area of [start...start+size)
> + * is reserved, while taking care of any clipping due to start or start+=
size
> + * falling outside of the adressable GGTT. The size of the returned node=
 may
> + * be smaller if part of the region falls outside the accessible GGTT, o=
r a
> + * NULL node may be returned.
> + *
> + * Return: &xe_ggtt_node or NULL on success or a ERR_PTR on failure.
> + */
> +struct xe_ggtt_node *xe_ggtt_reserve_area(struct xe_ggtt *ggtt, u32 base=
, u32 size)

[Severity: Low]
The kernel-doc comment documents @start, while the parameter in the function
signature is named base, which triggers a kernel-doc warning under W=3D1 or
htmldocs builds.

> +{
> +	u64 ggtt_start =3D xe_ggtt_start(ggtt), ggtt_end =3D ggtt_start + xe_gg=
tt_size(ggtt);
> +
> +	/* Completely truncated? */
> +	if (base + size <=3D ggtt_start || base >=3D ggtt_end)
> +		return NULL;
> +
> +	/* Partially truncated? */
> +	if (base <=3D ggtt_start) {
> +		size -=3D ggtt_start - base;
> +		base =3D ggtt_start;
> +	}
> +
> +	if (base + size >=3D ggtt_end)
> +		size =3D ggtt_end - base;
> +
> +	return xe_ggtt_insert_node_at(ggtt, size, XE_PAGE_SIZE, base, base + si=
ze);
> +}

[Severity: Medium]
Can base + size overflow 32 bits before being compared against ggtt_start a=
nd
ggtt_end or passed to xe_ggtt_insert_node_at()?

Both base and size are u32, while the hardware GGTT is 4 GiB and the usable
GGTT ends at GUC_GGTT_TOP (0xfee00000).  If a reservation near the top of t=
he
GGTT reaches or crosses the 4 GiB boundary, base + size wraps around in 32-=
bit
arithmetic: wrapping to <=3D ggtt_start (such as 0 at 4 GiB) makes
xe_ggtt_reserve_area() return NULL without reserving [base, ggtt_end), while
wrapping into (ggtt_start, ggtt_end) skips the ggtt_end clip and passes end=
 <
start to drm_mm_insert_node_in_range(), hitting DRM_MM_BUG_ON(range_start >
range_end).  Taking base and size as u64 (or casting before addition) avoids
the wraparound.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116122828.2661=
13-8-dev@lankhorst.se?part=3D1
