Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AEB9CA5FA5
	for <intel-xe@archiver.kernel.org>; Tue, 29 Sep 2026 20:20:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AA2710F0AB;
	Tue, 29 Sep 2026 20:20:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gIRpABkW";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA7AF10F0AB
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Sep 2026 20:20:04 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 81A0040DDF;
 Tue, 29 Sep 2026 20:20:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43DF51F000FF;
 Tue, 29 Sep 2026 20:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1790713204;
 bh=/Uo6Gh8i2wlXIErUANgf6BrNPyO97DrpfrTQi6V2F+I=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=gIRpABkWO38QUU+cm7eA6Ilkz/iI8s9m1m6EOMZzR2EDqreCOkEpYlV3P0PkhoRu1
 h/I4Fpq2F8RgaLnDJMA0FxFCWZdt4h8xeP3INiYFWSuPBepLgHZAcq0MS7AW9JYROY
 P5Uy2KGwTqB8NbdcxraDL2NgYoFIXBIkg+DuclIOZWsRmZ2cJ8hVWcxkiyppIf3zPW
 7lKDliP6vQEiYsRO2FnghScYt/hm9JhTE/XHJmAqsOnQUYl2tq6Pe2DKxN9rFNev2m
 SAKaG2p/x+UciDFwU603ZrkHT9y4Ch5zn/ZdaAF9TlJ/y736mwmzwc52p8k25b56Rj
 vRpDIpIuSPRVw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] drm/xe/xe3p: Force non-compressible memory reads to
 256B overfetches
To: "Daniel Charles" <daniel.charles@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260929200839.843116-1-daniel.charles@intel.com>
References: <20260929200839.843116-1-daniel.charles@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 20:20:03 +0000
Message-Id: <20260929202004.43DF51F000FF@smtp.kernel.org>
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
- [Medium] drm/xe: missing media GT tuning for NONCOMPMEMRD256BOVRFETCHEN
--

commit 0d0918701116e6b353267a1af32ce09421b27bbd
Author: Daniel Charles <daniel.charles@intel.com>

drm/xe/xe3p: Force non-compressible memory reads to 256B overfetches

This commit adds a tuning entry to set bit 14 (NONCOMPMEMRD256BOVRFETCHEN)
of L3SQCREG2 for Xe3p and later platforms to force non-compressible memory
reads to 256B overfetches.

> diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tunin=
g.c
> index bcec40ca2d35f..a9bd3f8969a54 100644
> --- a/drivers/gpu/drm/xe/xe_tuning.c
> +++ b/drivers/gpu/drm/xe/xe_tuning.c

[ ... ]

> @@ -100,6 +100,10 @@ VISIBLE_IF_KUNIT const struct xe_rtp_table_sr gt_tun=
ings =3D XE_RTP_TABLE_SR(
>  	  XE_RTP_ACTIONS(FIELD_SET(GAMSTLB_CTRL, BANK_HASH_MODE,
>  				   BANK_HASH_4KB_MODE))
>  	},
> +	{ XE_RTP_NAME("Tuning: Force All Non-Compressible Memory Reads to be 25=
6B Overfetches"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3510, XE_RTP_END_VERSION_UNDEFINE=
D)),
> +	  XE_RTP_ACTIONS(SET(L3SQCREG2, NONCOMPMEMRD256BOVRFETCHEN))
> +	},

[Severity: Medium]
Should this tuning also be applied to the standalone Media GT?

Since this rule uses GRAPHICS_VERSION_RANGE(), it evaluates to false for
standalone Media GTs when checked in xe_rtp_match_graphics_version_range().
Xe3p platforms feature a standalone Media GT with its own L3 cache controll=
ed
by XE2LPM_L3SQCREG2.

Previous overfetch tunings for the same cache (such as
COMPMEMRD256BOVRFETCHEN) provided a companion rule using MEDIA_VERSION_RANG=
E.

Is there a similar configuration needed here to optimize non-compressible
memory reads for the Media GT L3 cache?

>  );
>  EXPORT_SYMBOL_IF_KUNIT(gt_tunings);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260929200839.8431=
16-1-daniel.charles@intel.com?part=3D1
