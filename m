Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E8CE606A32E
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 09:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XniXTbk6
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6B1C112211;
	Thu, 26 Nov 2026 09:17:03 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2274F10E636
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Nov 2026 09:16:57 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id F0F5D62C27;
 Thu, 26 Nov 2026 09:16:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E5F51F000C6;
 Thu, 26 Nov 2026 09:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795684615;
 bh=XjnZVUVy6SPI48OKHwS1ww7nyLeY+zZN4vOgXXAPPYw=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=XniXTbk6uEBxGzKLcl0jAOkz4UA+YmtbZqlekRbPaV5+876gGj/ig4m2urZZVkU+Y
 Uarv6T6wSshnPQ9lu18zQUWrpA/I0csDN3aY3Wg16S1O7+Rvw5VWb7swXI7SskS3Zm
 0ax/avmAyNFqr4ksvJZYnqAqvaIZaAR1POPLHziQ5zjY8c/y+UBQt3wzl+t4ECH5/a
 5sU7BsQOaVk3fkuvwhm5rOKiWpbEOkot3A6PRtcvGLcErnD18YVELQ9Kv8eUOKmZwr
 ua1CNX5h8cmZr4opkOwVANdGAAODZEWcWTvkEAvMsrAL30DAim/RC0ggCepzyuundM
 4LyRrXgDnU7yw==
Message-ID: <sashiko-outbox-235109@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] drm/xe: Use MI_SEMAPHORE_WAIT_64 for fake watchdog
 where supported
To: tilak.tirumalesh.tangudu@intel.com, intel-xe@lists.freedesktop.org
In-Reply-To: <20261126090445.1220148-3-tilak.tirumalesh.tangudu@intel.com>
References: <20261126090445.1220148-1-tilak.tirumalesh.tangudu@intel.com>
 <20261126090445.1220148-3-tilak.tirumalesh.tangudu@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 09:16:54 +0000
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
- [High] drm/xe: build failure in emit_fake_watchdog() from missing
  info.has_sem64
--

commit 6bf3a2954f9a653e8593ca412901293d526830cc
Author: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>

drm/xe: Use MI_SEMAPHORE_WAIT_64 for fake watchdog where supported

This commit updates emit_fake_watchdog() to emit MI_SEMAPHORE_WAIT_64
when lrc->gt->info.has_sem64 is set, falling back to MI_SEMAPHORE_WAIT
otherwise.

> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_rin=
g_ops.c
> index ad63181938e33..e64f61f1f9a7c 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> @@ -316,11 +316,24 @@ static int emit_fake_watchdog(struct xe_lrc *lrc, u=
32 *dw, int i)
>  	dw[i++] =3D PR_CTR_CTRL(0).addr;
>  	dw[i++] =3D CTR_LOGIC_OP(START);
> =20
> -	dw[i++] =3D MI_SEMAPHORE_WAIT | MI_SEMW_GGTT | MI_SEMW_POLL | MI_SEMW_C=
OMPARE(SAD_EQ_SDD);
> -	dw[i++] =3D 0xdead; /* this should never be seen */
> -	dw[i++] =3D lower_32_bits(xe_lrc_ggtt_addr(lrc));
> -	dw[i++] =3D upper_32_bits(xe_lrc_ggtt_addr(lrc));
> -	dw[i++] =3D 0; /* unused token */
> +	if (lrc->gt->info.has_sem64) {

[Severity: High]
Does this break the build when CONFIG_DRM_XE is enabled?  The info
struct in struct xe_gt (drivers/gpu/drm/xe/xe_gt_types.h) has no
has_sem64 member.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126090445.1220=
148-1-tilak.tirumalesh.tangudu@intel.com?part=3D2
