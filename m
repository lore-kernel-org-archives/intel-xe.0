Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4075DC61DE2
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 10:55:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3B5210E277;
	Mon, 31 Aug 2026 10:55:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lurCMVKg";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E09310E277
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Aug 2026 10:55:10 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 8C23B60213;
 Mon, 31 Aug 2026 10:55:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 174791F000E9;
 Mon, 31 Aug 2026 10:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788173709;
 bh=vOPfM2vo+Zxn2fniFPR1UQ+fqNBq89KOnkOhUwtgC28=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=lurCMVKg3sJaUcHdzJBgjbRzzHoW1pnwhcSQ0RvdyKyOeecdhvC4k/sX3TtWKrLac
 BKfcT5BcKhxJnF5CVY0NNy+ZF1tksCw+vb31Iy5cMp3djVcy7XqvdAqE9f+I20l0cH
 nPGgrWYcEcg3GpMqrnpW12OE2hH0L00V605isY6s2tuJB17QNWLwo81Ygaz+Rg9hKX
 vRf/ahe0uvmZ+NToSGZeyV21BvBC1fE0u6e4B2slkIrt5W2CYGWrfpmgw1YJfhv7nJ
 pJuo6lvacOi50YzxdwsREDKW1Uv7rpfQ09Soqmrh9uGxSUw/HNCgEKtDMzeD+9/V65
 QXZObqgcrtA1g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/9] drm/xe/sysctrl: Return error codes from
 sysctrl_wait_bit_clear()
To: "Mallesh Koujalagi" <mallesh.koujalagi@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260831104456.1770605-12-mallesh.koujalagi@intel.com>
References: <20260831104456.1770605-11-mallesh.koujalagi@intel.com>
 <20260831104456.1770605-12-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 10:55:08 +0000
Message-Id: <20260831105509.174791F000E9@smtp.kernel.org>
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
- [Low] The patch introduces a call to `xe_log_err()` and includes `xe_log.=
h`, but neither the header nor the macro exist in the source tree, causing =
an immediate build failure.
--

commit 2a9731ca81fbb37bb5eeef908043568e8555c104
Author: Mallesh Koujalagi <mallesh.koujalagi@intel.com>

drm/xe/sysctrl: Return error codes from sysctrl_wait_bit_clear()

This commit updates sysctrl_wait_bit_clear() to return an error code instead
of a boolean. It also modifies the callers to log failures using xe_log_err=
().

> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe=
/xe_sysctrl_mailbox.c
> index 72baf1aa4b3ad..c36cac8c62887 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> @@ -11,6 +11,7 @@
> =20
>  #include "regs/xe_sysctrl_regs.h"
>  #include "xe_device.h"
> +#include "xe_log.h"

[Severity: Low]
Does this header exist in the repository? It appears to be missing, which
causes a build failure.

[ ... ]

> @@ -146,12 +143,14 @@ static int sysctrl_send_frames(struct xe_sysctrl *s=
c,
>  	u32 ctrl_reg, total_frames, frame;
>  	size_t bytes_sent, frame_size;
>  	bool phase;
> +	int ret;
> =20
>  	total_frames =3D DIV_ROUND_UP(cmd_size, XE_SYSCTRL_MB_FRAME_SIZE);
> =20
> -	if (!sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms)) {
> -		xe_err(xe, "sysctrl: Mailbox busy\n");
> -		return -EBUSY;
> +	ret =3D sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms=
);
> +	if (ret) {
> +		xe_log_err(xe, SYSCTRL, ret, "Mailbox busy\n");

[Severity: Low]
Is xe_log_err() defined anywhere in the tree? This introduces a call to an
undefined macro, resulting in an implicit declaration error during compilat=
ion
in sysctrl_send_frames().

[ ... ]

> @@ -174,9 +173,10 @@ static int sysctrl_send_frames(struct xe_sysctrl *sc,
> =20
>  		xe_mmio_write32(sc->mmio, SYSCTRL_MB_CTRL, ctrl_reg);
> =20
> -		if (!sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms))=
 {
> -			xe_err(xe, "sysctrl: Frame %u acknowledgment timeout\n", frame);
> -			return -ETIMEDOUT;
> +		ret =3D sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_m=
s);
> +		if (ret) {
> +			xe_log_err(xe, SYSCTRL, ret, "Frame %u acknowledgment timeout\n", fra=
me);

[Severity: Low]
This is another instance of using the undefined xe_log_err() macro, leading
to a compilation failure.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831104456.1770=
605-11-mallesh.koujalagi@intel.com?part=3D1
