Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E782F606A31C
	for <intel-xe@archiver.kernel.org>; Tue, 17 Nov 2026 01:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OB3D4hFV
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A57AE10EAD8;
	Tue, 17 Nov 2026 01:10:40 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73E0310EAD8
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Nov 2026 01:10:34 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 2642640A8A;
 Tue, 17 Nov 2026 01:10:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D51DF1F000C4;
 Tue, 17 Nov 2026 01:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794877834;
 bh=g7w/bSoON7il82em9+hHEG+g+6BN6gRtbfPFmBIwiM0=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=OB3D4hFV9qMoOl7vzZg2l57cvA3KaQOwb1YZkN0dqw2mq4wJ0l325ArsmiU6KDAsj
 TTHl1dKjeZGOzt/0rDcPsPnO4tYAzRsLfoGqQue861m7XAASEMtI8fHN5SUJtJMYQq
 BkWDTBUr5Rw1bzi7y7DcGnvoaC9aJBFiCLXTt1wmoYNpfb2G7itLgYpszzcoGkG/sH
 tAcnsozGjBQVXzGhQKiS+f++Ezq6lWX/zEtfD2qzMdzqTxePpZEojjRcAruhad7lNC
 Ly0psGStrztOdkp6AVR9IIkh+1lmhQK4RpxIMymk48p0niwhpEHLp6rd+7DAAmM79P
 oEbXtrN+b1f6g==
Message-ID: <sashiko-outbox-218035@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/2] drm/xe: Add has_sem64 bit to graphics/media IP
 descriptors
To: "Jesus Narvaez" <jesus.narvaez@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261117005534.2322094-5-jesus.narvaez@intel.com>
References: <20261117005534.2322094-4-jesus.narvaez@intel.com>
 <20261117005534.2322094-5-jesus.narvaez@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 01:10:33 +0000
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
- [Medium] drm/xe: missing has_sem64 flag in graphics_xe3p_xpc
  descriptor
- [Low] drm/xe: commit message mismatch on has_sem64 resolution in
  xe_info_init()
--

commit f84a9b352b46badc7204ec8d1017a8868a404b81
Author: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>

drm/xe: Add has_sem64 bit to graphics/media IP descriptors

This commit adds a has_sem64 capability bit to graphics and media IP
descriptors and resolves gt->info.has_sem64 across the primary and media
GTs on each tile.

>     The bit indicates whether the GT's command streamer supports the
>     MI_SEMAPHORE_WAIT_64 instruction. A platform's CS must not mix
>     MI_SEMAPHORE_WAIT and MI_SEMAPHORE_WAIT_64 within a context or across
>     context submissions, so both the primary and media GT must agree befo=
re
>     either one enables sem64; resolve has_sem64 once in xe_info_init() and
>     hand the single value to both GT allocators.

[Severity: Low]
Does the commit message match how has_sem64 is resolved?
alloc_primary_gt() and alloc_media_gt() each compute gt->info.has_sem64
independently from their IP descriptor and stepping, and xe_info_init()
clears both fields afterward if the two GTs disagree rather than passing
a pre-resolved value into the allocators.

> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 3bd68ed9daa81..dd56c9c7b92bb 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -127,6 +127,7 @@ static const struct xe_graphics_desc graphics_xe3p_lp=
g =3D {
>  	.multi_queue_engine_class_mask =3D BIT(XE_ENGINE_CLASS_COPY) | BIT(XE_E=
NGINE_CLASS_COMPUTE),
>  	.num_geometry_xecore_fuse_regs =3D 3,
>  	.num_compute_xecore_fuse_regs =3D 3,
> +	.has_sem64 =3D 1,
>  };
> =20
>  static const struct xe_graphics_desc graphics_xe3p_xpc =3D {
> @@ -153,11 +154,20 @@ static const struct xe_media_desc media_xelpmp =3D {
>  	.hw_engine_mask =3D
>  		GENMASK(XE_HW_ENGINE_VCS7, XE_HW_ENGINE_VCS0) |
>  		GENMASK(XE_HW_ENGINE_VECS3, XE_HW_ENGINE_VECS0) |
> -		BIT(XE_HW_ENGINE_GSCCS0)
> +		BIT(XE_HW_ENGINE_GSCCS0),
> +};
> +
> +static const struct xe_media_desc media_xe3p_lpm =3D {
> +	.hw_engine_mask =3D
> +		GENMASK(XE_HW_ENGINE_VCS7, XE_HW_ENGINE_VCS0) |
> +		GENMASK(XE_HW_ENGINE_VECS3, XE_HW_ENGINE_VECS0) |
> +		BIT(XE_HW_ENGINE_GSCCS0),
> +	.has_sem64 =3D 1,
>  };
> =20
>  static const struct xe_media_desc media_xe3p_hpm =3D {
>  	.has_uncorrectable_error_reporting =3D 1,
> +	.has_sem64 =3D 1,
>  	.hw_engine_mask =3D
>  		GENMASK(XE_HW_ENGINE_VCS7, XE_HW_ENGINE_VCS0) |
>  		GENMASK(XE_HW_ENGINE_VECS3, XE_HW_ENGINE_VECS0) |

[Severity: Medium]
Should graphics_xe3p_xpc also set .has_sem64 =3D 1?

alloc_primary_gt() specifically scopes the STEP_B0 check to graphics IP
35.10 (GRAPHICS_VERx100(xe) =3D=3D 3510), and media_xe3p_hpm (35.03) sets
.has_sem64 =3D 1.  Because graphics_xe3p_xpc (35.11) omits .has_sem64 =3D 1,
primary_gt->info.has_sem64 remains false on Xe3p_XPC and xe_info_init()
clears media_gt->info.has_sem64 back to false on its companion
Xe3p_HPM media GT as well.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117005534.2322=
094-4-jesus.narvaez@intel.com?part=3D1
