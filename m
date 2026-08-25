Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E583C61DBD
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 11:24:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1466510E192;
	Tue, 25 Aug 2026 11:24:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Vn/CUHpV";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6795610E192
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Aug 2026 11:24:29 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 1D4FA40761;
 Tue, 25 Aug 2026 11:24:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2BC51F000E9;
 Tue, 25 Aug 2026 11:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787657069;
 bh=wjH7Y7dwdBU71I8j1y8XVVRiYnoWiTA1jaUmF1dmyEY=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=Vn/CUHpVTU96MJET3QaGwpJ4pR+trMbj6Inc4+lrkvUcT9RhgqX/kYawdSiKF9NKq
 wX7lNL9KjVjOMIhJHZPB0tbMdGHvlh7MPvu7sss9DufoGntGffU4ld3N/FSJdcfr+S
 fY41bPRoo5fH+3wtUli8/a1YmVyPldAAxqVf2XM3KSA61pbyVL4BMmmwm1qpFTk4k1
 hkvshKl7QsTTaIUXJ1vWcPxvmpn/KktQZ9mHb5zefQ/cDNtMkY/f6232jlNuKpbWMk
 xj4glRb0Wh1DUfH/L3xaad5A5iXAAHQ4QwjkPvWZcj5HiEu2RRwXh2jNx0GqDs4/QG
 M74+IpUsnjALw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/7] drm/xe/sysctrl: Return error codes from
 sysctrl_wait_bit_clear()
To: "Mallesh Koujalagi" <mallesh.koujalagi@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260825110542.1359776-10-mallesh.koujalagi@intel.com>
References: <20260825110542.1359776-9-mallesh.koujalagi@intel.com>
 <20260825110542.1359776-10-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 11:24:28 +0000
Message-Id: <20260825112428.D2BC51F000E9@smtp.kernel.org>
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
- [Low] The patch introduces a build break by including a non-existent head=
er 'xe_log.h' and using undefined identifiers 'xe_log_err' and 'SYSCTRL'.
--

--- Patch [1]: [PATCH v5 1/7] drm/xe/sysctrl: Return error codes from sysct=
rl_wait_bit_clear() ---
commit b1569960680970895818e22670bdfa988f326c23
Author: Mallesh Koujalagi <mallesh.koujalagi@intel.com>

drm/xe/sysctrl: Return error codes from sysctrl_wait_bit_clear()

This commit modifies sysctrl_wait_bit_clear() to return an error code inste=
ad
of a boolean value. It also updates its callers to log the propagated error
code using xe_log_err().

> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe=
/xe_sysctrl_mailbox.c
> index e13eebaac1d00..f97dec375efe8 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> @@ -11,6 +11,7 @@
> =20
>  #include "regs/xe_sysctrl_regs.h"
>  #include "xe_device.h"
> +#include "xe_log.h"

[Severity: Low]
Does this header exist in the tree? Including a non-existent header will
cause a build failure.

[ ... ]

> @@ -145,12 +142,14 @@ static int sysctrl_send_frames(struct xe_sysctrl *s=
c,
>  	struct xe_device *xe =3D sc_to_xe(sc);
>  	u32 ctrl_reg, total_frames, frame;
>  	size_t bytes_sent, frame_size;
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
Are the identifier SYSCTRL and macro/function xe_log_err() defined anywhere?
Using undefined identifiers will result in a compilation error.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825110542.1359=
776-9-mallesh.koujalagi@intel.com?part=3D1
