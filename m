Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F8B6C88E6F
	for <intel-xe@archiver.kernel.org>; Mon, 14 Sep 2026 20:06:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6750210F1F5;
	Mon, 14 Sep 2026 20:06:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Cz2OVR9y";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 238FA10F1F6;
 Mon, 14 Sep 2026 20:06:27 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 1531860142;
 Mon, 14 Sep 2026 20:06:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 955251F000FF;
 Mon, 14 Sep 2026 20:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1789416385;
 bh=zSh0PaJ1O7WZKUeuKQIEpFJQv/esLKyZwEx4ycDkZDo=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=Cz2OVR9y7l+PsEjT7Q6p4dqO7/e+yveieDDjLiYuhSf1XR3IXTSRIKIsoqOi3lZMA
 d7q1YRV/UbZXb9vcIWDEt2XYjPcL72Nicg7U6aQXe8h4iCjuOHGNh2FZjX2SMX8um0
 GPSf7ajS+qLm63ifBoV+TCBTVR7SBGI5TcfQ6Nrxsh3Ln3AsDbo4qdNO462vycw33F
 9qqYk32mByPsAfu1YgM/DlUp1e1IdfVun0FWAvXAsP3anWgnZqzgRj/6tR8/aKHb3t
 G34dgrW85WlVjj3o8FVjNWvMcxFSwQRosmBizTcFaiJlPWAPEGhyAuCZjASNFZYKD8
 sXr92p3emi3HA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 6/7] drm/i915/irq: conditional HPD IRQ resets based
 on PME capability
To: "Vinod Govindapillai" <vinod.govindapillai@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
In-Reply-To: <20260914194737.272679-7-vinod.govindapillai@intel.com>
References: <20260914194737.272679-1-vinod.govindapillai@intel.com>
 <20260914194737.272679-7-vinod.govindapillai@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 20:06:25 +0000
Message-Id: <20260914200625.955251F000FF@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The patch uses a runtime PM flag (`xe->pme.enabled` via `intel_dis=
play_rpm_pme_enabled`) to conditionally skip HPD IRQ resets in a path share=
d by both system PM and runtime PM, violating subsystem guidelines and brea=
king system PM behavior.
- [High] Pending HPD interrupts that woke the system from runtime suspend a=
re cleared and lost during the resume path because the IIR register is rese=
t before they can be handled.
- [Medium] Skipping the reset of `SDE_IRQ_REGS` entirely leaves all non-HPD=
 South Display Engine (SDE) interrupts active during suspend, which can cau=
se spurious wakeups.
--

commit 52d852459481153001bd323a577aaf67b9baae9c
Author: Vinod Govindapillai <vinod.govindapillai@intel.com>
Subject: drm/i915/irq: conditional HPD IRQ resets based on PME capability

This patch conditionally skips HPD IRQ resets during suspend routines
based on the PME capability of the device. If the device supports
generating PME from HPDs, the HPD-related IRQs are left active to
prevent losing the HPD events.

> diff --git a/drivers/gpu/drm/i915/display/intel_display_irq.c b/drivers/g=
pu/drm/i915/display/intel_display_irq.c
> index a59b75830bd13..7e71c96c663fa 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_irq.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_irq.c

[ ... ]

> @@ -2217,8 +2218,10 @@ static void gen11_display_irq_reset(struct intel_d=
isplay *display)
>  	enum pipe pipe;
>  	u32 trans_mask =3D BIT(TRANSCODER_A) | BIT(TRANSCODER_B) |
>  		BIT(TRANSCODER_C) | BIT(TRANSCODER_D);
> +	bool reset_hpd =3D !intel_display_rpm_pme_enabled(display);

[Severity: High]
Does this violate context separation guidelines by using a runtime PM flag
to control a path shared with system PM?

During system suspend, the device is typically runtime-resumed first or
already active, meaning the runtime flag accessed via
intel_display_rpm_pme_enabled() evaluates to false. This results in
reset_hpd being true, which unconditionally wipes HPD IRQs during S3
suspend and defeats the intended PME wakeup behavior.

Additionally, in the i915 driver, the .pme_enabled callback appears to be
unimplemented in i915_display_rpm_interface, which would mean it always
returns false, rendering this logic non-functional for i915.

> =20
> -	intel_de_write(display, GEN11_DISPLAY_INT_CTL, 0);
> +	if (reset_hpd)
> +		intel_de_write(display, GEN11_DISPLAY_INT_CTL, 0);
> =20
>  	if (DISPLAY_VER(display) >=3D 12) {

[ ... ]

> @@ -2250,13 +2253,15 @@ static void gen11_display_irq_reset(struct intel_=
display *display)
>  	irq_reset(display, GEN8_DE_PORT_IRQ_REGS);
>  	irq_reset(display, GEN8_DE_MISC_IRQ_REGS);
> =20
> -	if (DISPLAY_VER(display) >=3D 14)
> -		irq_reset(display, PICAINTERRUPT_IRQ_REGS);
> -	else
> -		irq_reset(display, GEN11_DE_HPD_IRQ_REGS);

[Severity: High]
Does this clear and lose pending HPD interrupts that woke the system from
runtime suspend?

When an HPD event triggers a PME wakeup from runtime suspend, the hardware
sets the corresponding bit in the IIR register. During runtime resume, the
PCI driver first clears the PME capability flag, and then eventually calls
gen11_display_irq_reset().

Because the PME enabled flag was just cleared,
intel_display_rpm_pme_enabled() evaluates to false, making reset_hpd
evaluate to true. This causes the driver to write 0xffffffff to the IIR
register here in irq_reset(), destroying the pending HPD event before the
interrupt handler is re-enabled to process it.

> +	if (reset_hpd) {
> +		if (DISPLAY_VER(display) >=3D 14)
> +			irq_reset(display, PICAINTERRUPT_IRQ_REGS);
> +		else
> +			irq_reset(display, GEN11_DE_HPD_IRQ_REGS);
> =20
> -	if (INTEL_PCH_TYPE(display) >=3D PCH_ICP)
> -		irq_reset(display, SDE_IRQ_REGS);
> +		if (INTEL_PCH_TYPE(display) >=3D PCH_ICP)
> +			irq_reset(display, SDE_IRQ_REGS);

[Severity: Medium]
By skipping the reset of SDE_IRQ_REGS when reset_hpd is false, does this
leave all non-HPD South Display Engine (SDE) interrupts active during
suspend?

SDE_IRQ_REGS controls many interrupts beyond HPD, such as GMBUS (I2C) and
Audio. Because the master interrupt control (GEN11_DISPLAY_INT_CTL) is
also intentionally left active to support PME, any activity on these
non-HPD sources during suspend could trigger the master interrupt and
spuriously wake the system.

Should this selectively mask out non-HPD sources via read-modify-write to
the IMR registers rather than bypassing the reset completely?

> +	}
>  }
> =20
>  void gen8_irq_power_well_post_enable(struct intel_display *display,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914194737.2726=
79-1-vinod.govindapillai@intel.com?part=3D6
