Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DADAC61DD3
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 10:59:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55C0D10E277;
	Mon, 31 Aug 2026 10:59:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gprYTTo7";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8107D10E277
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Aug 2026 10:59:23 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 0B15641A9A;
 Mon, 31 Aug 2026 10:59:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFE2F1F000E9;
 Mon, 31 Aug 2026 10:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788173962;
 bh=CUUBXhXy8AwbPFY6KMEVBqQRXvKut9SRYjpgIScsmcw=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=gprYTTo7P1eaPB3/selP8X/9jvCktxngXJW6SY78EdpumuG+nmuVPzsNO6MLM7MZv
 2wZMGD+bWIlCp4IIIc+xmvnEFhTgmcr1yZ8Pb85y0AMDNQHS1VspOSAPi/plEENw1c
 GWcKYyRDPPajC1Nr9k4r8Wbc0bQu6Q5X43SGElEDjZrAdFwnXx2q6OuTTeqB5Q3wBZ
 2eQ0zv18l3qRBeyI3l2EEiCjSWS/u1fR54Li7JUim7Ymmmi2GKirafPBT/nOIDmqrT
 4gF0kUflmssWQ9HaoubrP1Gm0RBPncJqkCcUUS0GFuNU80KejZOOlK9vp0LLpnMA/4
 zQKQVfXfKn/Zg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/9] drm/xe/sysctrl: Return error codes from
 sysctrl_wait_bit_set()
To: "Mallesh Koujalagi" <mallesh.koujalagi@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260831104456.1770605-13-mallesh.koujalagi@intel.com>
References: <20260831104456.1770605-11-mallesh.koujalagi@intel.com>
 <20260831104456.1770605-13-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 10:59:22 +0000
Message-Id: <20260831105922.BFE2F1F000E9@smtp.kernel.org>
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
- [Low] Build failure due to missing `xe_log.h` dependency and undefined `x=
e_log_err` macro/function.
--

commit 857fe80daf658c4ae70ca1e5f7664ff0bfb076d5
Author: Mallesh Koujalagi <mallesh.koujalagi@intel.com>

drm/xe/sysctrl: Return error codes from sysctrl_wait_bit_set()

This patch changes sysctrl_wait_bit_set() to return an error code rather
than a boolean and updates callers to propagate and log the error code.

> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe=
/xe_sysctrl_mailbox.c
> index c36cac8c62887..b3d1538c89900 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
[ ... ]
> @@ -193,9 +189,10 @@ static int sysctrl_process_frame(struct xe_sysctrl *=
sc, void *out,
>  	struct xe_device *xe =3D sc_to_xe(sc);
>  	int ret;
> =20
> -	if (!sysctrl_wait_bit_set(sc, SYSCTRL_MB_CTRL_RUN_BUSY_OUT, timeout_ms)=
) {
> -		xe_err(xe, "sysctrl: Response frame timeout\n");
> -		return -ETIMEDOUT;
> +	ret =3D sysctrl_wait_bit_set(sc, SYSCTRL_MB_CTRL_RUN_BUSY_OUT, timeout_=
ms);
> +	if (ret) {
> +		xe_log_err(xe, SYSCTRL, ret, "Response frame timeout\n");

[Severity: Low]
Will this result in a build failure?=20

It appears that the xe_log_err macro and the SYSCTRL domain identifier are
not defined in this file, nor is there an include for the corresponding log
header.=20

Are we missing a header inclusion, or does this patch depend on another
unmerged change that introduces this logging infrastructure?

> +		return ret;
>  	}
> =20
>  	ctrl_reg =3D xe_mmio_read32(sc->mmio, SYSCTRL_MB_CTRL);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831104456.1770=
605-11-mallesh.koujalagi@intel.com?part=3D2
