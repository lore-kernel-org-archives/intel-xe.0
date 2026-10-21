Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2CA2606A319
	for <intel-xe@archiver.kernel.org>; Wed, 21 Oct 2026 05:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gZJlleOD
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1A7F10E2C4;
	Wed, 21 Oct 2026 05:39:44 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACF8110E2C4
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Oct 2026 05:39:38 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 66C2E40231;
 Wed, 21 Oct 2026 05:39:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35C641F000C9;
 Wed, 21 Oct 2026 05:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1792561178;
 bh=e1E4yOsFfNSdFzDURjUvihyrQW6pr32bIjL7C4CBMr4=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=gZJlleODxQtr6nzFUtXKbA4+uciJgZe1eCvGunftQiDKRCVYat0WcuakPDe60Tv8P
 VglEgVNa2sC3WpKFEenVxiRJ9Vh6Tf9f7fR6IdnEKLepj99cz4uzmpLYRMD5xTvZRH
 vt9tp6AizhvRRhVrjRQq2otwEBh3ed7gq23GEI2hzdgAaxAN5tgmmhOIR8xLnX4dOU
 McLQ6aZCjk6Ss7uyFSr+41Bm39F+xg4S3g1no6A3+Y3KYXp7Uzx7CqYJnk2LmGFr8c
 2mXIotnKHREL60echNiex6jRPYXHsMQ/+lKyhUnxlxlmcUwRVqf3PXiTgIkJgN2xdi
 9D6NyK5OxZXXw==
Message-ID: <sashiko-outbox-179811@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] drm/xe/xe3: Fix OAM stream broken on Xe3+
To: "Shekhar Chauhan" <shekhar.chauhan@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261021052333.1341575-2-shekhar.chauhan@intel.com>
References: <20261021052333.1341575-2-shekhar.chauhan@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 05:39:37 +0000
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
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] drm/xe/oa: tail address wrap helpers defined as macros despite v2 c=
hangelog
--

commit 5ceb7361283be3f44630db810b6ab0762b3744ab
Author: Shekhar Chauhan <shekhar.chauhan@intel.com>

drm/xe/xe3: Fix OAM stream broken on Xe3+

This commit prevents partial reports at the end of the oa buffer on Xe3+ oam
streams when overrun mode is enabled by rounding circ_size down to a multip=
le
of the report size.

> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index c9320feeafba8..f536fbccabb98 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -1751,6 +1751,15 @@ static const struct file_operations xe_oa_fops =3D=
 {
>  	.mmap		=3D xe_oa_mmap,
>  };
> =20
> +#define oag_has_tail_address_wrap(stream) \
> +	(GRAPHICS_VER((stream)->oa->xe) >=3D 20 && \
> +	 (stream)->oa_unit->type =3D=3D DRM_XE_OA_UNIT_TYPE_OAG)
> +
> +#define oam_has_tail_address_wrap(stream) \
> +	(MEDIA_VER((stream)->oa->xe) >=3D 30 && \
> +	 ((stream)->oa_unit->type =3D=3D DRM_XE_OA_UNIT_TYPE_OAM || \
> +	  (stream)->oa_unit->type =3D=3D DRM_XE_OA_UNIT_TYPE_OAM_SAG))

[Severity: Low]
This isn't a runtime bug, but the v2 note in the commit message states:

  v2: Fix checkpatch issues by using a static func instead of #define.

However, in drivers/gpu/drm/xe/xe_oa.c, oag_has_tail_address_wrap() and
oam_has_tail_address_wrap() (used by xe_oa_stream_init() when initializing =
an
oa stream) are still defined as preprocessor macros that evaluate their
stream argument multiple times.

Were the v2 changes converting oag_has_tail_address_wrap() and
oam_has_tail_address_wrap() into static functions accidentally left out of
the commit?

> +
>  static int xe_oa_stream_init(struct xe_oa_stream *stream,
>  			     struct xe_oa_open_param *param)
>  {

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021052333.1341=
575-2-shekhar.chauhan@intel.com?part=3D1
