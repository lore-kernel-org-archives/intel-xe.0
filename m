Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE1C606A321
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 18:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GMpq+WC7
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C596210E42D;
	Thu, 26 Nov 2026 18:01:54 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EF0C10E42D;
 Thu, 26 Nov 2026 18:01:48 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 9370E60CDF;
 Thu, 26 Nov 2026 18:01:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 267851F000C6;
 Thu, 26 Nov 2026 18:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795716107;
 bh=qh8zSATIOFzLZ6VQG8qC1AFHsulSiSH6LJvdccsK3FQ=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=GMpq+WC7o9gU9MhdGQNQwdDyUqt4aB5kc74rQiSJm6hjoahlQMoTrHMQnSvTD4Suc
 1D+IGJLSsTsZRCJ9NbKWvQQOHN96BiyJqi7v4B9bY3fPkaTi9SPvLWn1UUDFST43ia
 /BvWPDtrt1szWVTEsezzQB9OrBlx+F/kQEnYsFr40cw076Eu2TPLnoksQJHWyF4MJk
 Ca4IwtEtwG7S36oXnunOi30xoUE4uLzLWwxfTGp1KuBfYzfLqosy063IcTf1+Q/C3v
 FokNg+wk8BH++ckIm9oCRiUZQBMHL2RzfneEYhJQidW+HAIygNHued9/jneCzioIkK
 3e0OUwAkCm+Zw==
Message-ID: <sashiko-outbox-235986@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 1/2] drm/i915/bios: include whitespace into VBT
 signature
To: =?utf-8?b?TWljaGHFgiBHcnplbGFr?= <michal.grzelak@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
In-Reply-To: <20261126175033.181407-2-michal.grzelak@linux.intel.com>
References: <20261126175033.181407-1-michal.grzelak@linux.intel.com>
 <20261126175033.181407-2-michal.grzelak@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 18:01:46 +0000
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] drm/i915/bios: 5-byte vbt_signature breaks GVT-g VBT validation
- [Low] drm/i915/bios: broken u32 needle BUILD_BUG_ON in oprom_get_vbt()
--

commit 625db8b840b34894e85859eb7f1834474d12585a
Author: Micha=C5=82 Grzelak <michal.grzelak@intel.com>

drm/i915/bios: include whitespace into VBT signature

This commit extends vbt_signature from "$VBT" to "$VBT " and updates the
corresponding signature length and documentation comments.

> diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/=
i915/display/intel_bios.c
> index 7b6a6f8c3cf19..080a76a95136d 100644
> --- a/drivers/gpu/drm/i915/display/intel_bios.c
> +++ b/drivers/gpu/drm/i915/display/intel_bios.c

[ ... ]

> @@ -3126,8 +3126,8 @@ static const struct bdb_header *get_bdb_header(cons=
t struct vbt_header *vbt)
>  	return _vbt + vbt->bdb_offset;
>  }
> =20
> -static const char vbt_signature[] =3D "$VBT";
> -static const int vbt_signature_len =3D 4;
> +static const char vbt_signature[] =3D "$VBT ";
> +static const int vbt_signature_len =3D 5;

[Severity: High]
Does requiring a trailing space in vbt_signature break VBT validation for
Intel GVT-g guests?

In drivers/gpu/drm/i915/gvt/opregion.c, virt_vbt_generation() zero-fills
struct vbt and only populates the first four bytes of v->header.signature:

drivers/gpu/drm/i915/gvt/opregion.c:virt_vbt_generation() {
	memset(v, 0, sizeof(struct vbt));

	v->header.signature[0] =3D '$';
	v->header.signature[1] =3D 'V';
	v->header.signature[2] =3D 'B';
	v->header.signature[3] =3D 'T';
}

With vbt_signature_len increased to 5, intel_bios_is_valid_vbt() rejects
the emulated OpRegion VBT on both current and existing GVT-g hosts because
vbt->signature[4] is 0x00, forcing guests to fall back to default VBT port
definitions.

>  /**
>   * intel_bios_is_valid_vbt - does the given buffer contain a valid VBT
> @@ -3230,7 +3230,7 @@ static struct vbt_header *oprom_get_vbt(struct inte=
l_display *display,
>  		return NULL;
> =20
>  	BUILD_BUG_ON(vbt_signature_len !=3D sizeof(vbt_signature) - 1);
> -	BUILD_BUG_ON(vbt_signature_len !=3D sizeof(u32));
> +	BUILD_BUG_ON(vbt_signature_len !=3D sizeof(u32) + 1);
> =20
>  	offset =3D intel_rom_find(rom, *(const u32 *)vbt_signature);
>  	if (offset < 0)

[Severity: Low]
Does changing this BUILD_BUG_ON to sizeof(u32) + 1 defeat the check that
intel_rom_find() searches for the full vbt_signature?

intel_rom_find() only matches a 32-bit u32 needle and returns the first
4-byte "$VBT" match in the Option ROM without checking the fifth byte, so
any earlier 4-byte "$VBT" sequence without a trailing space will stop the
ROM scan and cause intel_bios_is_valid_vbt() to fail.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126175033.1814=
07-1-michal.grzelak@linux.intel.com?part=3D1
