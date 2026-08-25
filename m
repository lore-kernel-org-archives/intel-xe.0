Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1626C61DBD
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 11:24:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49C2710E033;
	Tue, 25 Aug 2026 11:24:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Jq2KPvzP";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C460910E033
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Aug 2026 11:24:23 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id E663C6011F;
 Tue, 25 Aug 2026 11:24:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CFA51F000E9;
 Tue, 25 Aug 2026 11:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787657062;
 bh=Qf1i68cQnaarKvwIdT5pkvbKk9iadRbNzLeO1M73Vp8=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=Jq2KPvzPUXC79nK0uMK0BI4EfZypBIPyIrMP6HDeUcYvLDBj/Ur3HkpFZtOEM0A9G
 4nBUi3Xh0o1UwN90DtYq9+sR0BxnlrIPQ3gGXufjKnFtGSHnnLJ/Dz0tmTIq4kGw23
 IuIklpPEZiezh2XMOEw+4uUNJC50ucsBh4hbg34YBS8XjPMcF0y6haLMtR0LpxLvEI
 1vV/3BvcDiB+sGm+etmO0KHIfWSkwMEFMHaatnOm8gUUKEBz6+zU/9N/qtAUaRyKUC
 aWWLP8WC/Zjt31jphquC+43dOmTBU0Eaj5kp7uLC6JIOsD+q6UArnestcKYZbEWseN
 J5E8vnCL+nklQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/7] drm/xe/sysctrl: Return error codes from
 sysctrl_wait_bit_set()
To: "Mallesh Koujalagi" <mallesh.koujalagi@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260825110542.1359776-11-mallesh.koujalagi@intel.com>
References: <20260825110542.1359776-9-mallesh.koujalagi@intel.com>
 <20260825110542.1359776-11-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 11:24:22 +0000
Message-Id: <20260825112422.7CFA51F000E9@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Low] The patch introduces usage of an undefined macro `xe_log_err`, a mi=
ssing header `xe_log.h`, and an undeclared identifier `SYSCTRL`, resulting =
in immediate compilation failure.

Pre-existing issues:
- [High] Failure to drain the firmware mailbox on truncated reads hangs the=
 hardware sysctrl mailbox, leading to state machine desynchronization and a=
 permanent Denial of Service (DoS) for the sysctrl subsystem.
--

--- Patch [2]: [PATCH v5 2/7] drm/xe/sysctrl: Return error codes from sysct=
rl_wait_bit_set() ---
commit a0d9dbca39d7d03a2a03ce09604444ffe68818bd
Author: Mallesh Koujalagi <mallesh.koujalagi@intel.com>

drm/xe/sysctrl: Return error codes from sysctrl_wait_bit_set()

This patch modifies sysctrl_wait_bit_set() to return an error code instead
of a bool, and updates the caller in sysctrl_process_frame() to propagate
the error using xe_log_err().

> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe=
/xe_sysctrl_mailbox.c
> index f97dec375efe8..b5412ca42bb81 100644
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
Is xe_log_err defined here? It appears this patch introduces usage of an
undefined macro xe_log_err and an undeclared identifier SYSCTRL, resulting
in an immediate compilation failure. Could there be a missing prerequisite
patch in this series that adds the xe_log infrastructure?

> +		return ret;
>  	}
> =20
>  	ctrl_reg =3D xe_mmio_read32(sc->mmio, SYSCTRL_MB_CTRL);

[Severity: High]
This isn't a bug introduced by this patch, but looking at the caller of
sysctrl_process_frame():

sysctrl_receive_frames() {
    ...
    while (!done && remain) {
        frame_size =3D min_t(size_t, remain, XE_SYSCTRL_MB_FRAME_SIZE);
        ret =3D sysctrl_process_frame(sc, out, frame_size, timeout_ms,
                                    &done);
        if (ret)
            return ret;
        remain -=3D frame_size;
        out +=3D frame_size;
    }
    ...
}

If the firmware sends a response payload larger than the data provided by
the caller, remain will reach 0 before done is true.

Doesn't this cause the while loop to exit early without draining the
remaining frames from the hardware mailbox?

If the SYSCTRL_MB_CTRL_RUN_BUSY_OUT bit isn't cleared, won't this leave the
hardware state machine stuck and cause a permanent DoS of the system
controller interface for subsequent commands?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825110542.1359=
776-9-mallesh.koujalagi@intel.com?part=3D2
