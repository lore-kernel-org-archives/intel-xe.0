Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C42BC79FA9
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 11:04:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4262710E02F;
	Mon,  7 Sep 2026 11:04:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GNXHi1PY";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83E9010E02F
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Sep 2026 11:04:32 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 0917B601F9;
 Mon,  7 Sep 2026 11:04:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8980F1F00A3E;
 Mon,  7 Sep 2026 11:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788779071;
 bh=LHg+ac+SkiH0qQO6gXsqubvllDWjKsfFqu5XQI6sz/4=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=GNXHi1PYV5vkR5JnVeQNvkVLQ5aOkLasCZ1qDZHIrtaqLw44rdXEUGpMDwgBTiTvu
 e3x2lq54+2oMSfJ/wIMEoXg9SGPttfg7BGnfjvYIA9DcKLqV7jTVDqgChJ6qmeEUuR
 /E9KBc2Evdasy5VQmkRbwREJBmg5UmcBFi0mNZANEBD7YYUx0M+kYree1sAbXKCP5l
 zfj16+th1gj/9feZ7W5d0Xy9nW+pOoYO0c1kMr9R5hIEFGgj+i1xxT//SXZt1A6gqp
 kmCl7uaE3L4J8N9pj6O1k7Z/gPLfvUfzRvLzhZWunPWGnhJNHb2HWFxrGq9ygusbJn
 upbF8C717IV0A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 6/9] drm/xe/sysctrl: Replace FIELD_GET() with
 REG_FIELD_GET()
To: "Mallesh Koujalagi" <mallesh.koujalagi@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260907105313.2208003-17-mallesh.koujalagi@intel.com>
References: <20260907105313.2208003-11-mallesh.koujalagi@intel.com>
 <20260907105313.2208003-17-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 11:04:31 +0000
Message-Id: <20260907110431.8980F1F00A3E@smtp.kernel.org>
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

Pre-existing issues:
- [High] Type-punning byte streams to a u32 array using memcpy() causes byt=
e order reversal on big-endian systems during MMIO access.
--

commit 62065782d283be78ecb64ef05ff6080ad6f9d489
Author: Mallesh Koujalagi <mallesh.koujalagi@intel.com>

drm/xe/sysctrl: Replace FIELD_GET() with REG_FIELD_GET()

This commit replaces the FIELD_GET() and FIELD_PREP() macros with=20
REG_FIELD_GET() and REG_FIELD_PREP() when extracting or preparing fields
from SysCtrl and application headers. This better reflects that the masks
represent register-style bitfields and improves consistency.

> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe=
/xe_sysctrl_mailbox.c
> index 50bbdab072de6..cdd929ebed4a6 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c

[ ... ]

> @@ -186,8 +186,8 @@ static int sysctrl_process_frame(struct xe_sysctrl *s=
c, void *out,
>  	}
> =20
>  	ctrl_reg =3D xe_mmio_read32(sc->mmio, SYSCTRL_MB_CTRL);
> -	total_frames =3D FIELD_GET(SYSCTRL_FRAME_TOTAL_MASK, ctrl_reg);
> -	curr_frame =3D FIELD_GET(SYSCTRL_FRAME_CURRENT_MASK, ctrl_reg);
> +	total_frames =3D REG_FIELD_GET(SYSCTRL_FRAME_TOTAL_MASK, ctrl_reg);
> +	curr_frame =3D REG_FIELD_GET(SYSCTRL_FRAME_CURRENT_MASK, ctrl_reg);
> =20
>  	sysctrl_read_frame(sc, out, frame_size);

[Severity: High]
This isn't a bug introduced by this patch, but this is a pre-existing issue:
Does this code cause byte order reversal on big-endian systems during MMIO
access?

Looking at the implementation of sysctrl_read_frame() called here, the u32
value read via readl() (which already byte-swapped the little-endian PCI
register to CPU endianness) is incorrectly type-punned back into a byte
stream:

drivers/gpu/drm/xe/xe_sysctrl_mailbox.c:sysctrl_read_frame() {
	...
	for (i =3D 0; i < dw; i++)
		val[i] =3D xe_mmio_read32(sc->mmio, regs[i]);

	memcpy(frame, val, len);
}

This reverses the bytes on big-endian systems. A similar issue occurs in
sysctrl_write_frame() where the little-endian byte stream is type-punned
into a u32 array and undergoes an incorrect double byte-swap via writel().

Sending or receiving mailbox frames on a big-endian host through these
functions could lead to complete failure of the sysctrl mailbox
communication, resulting in driver initialization errors or missing
hardware control features.

>  	sysctrl_clear_response(sc);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907105313.2208=
003-11-mallesh.koujalagi@intel.com?part=3D6
