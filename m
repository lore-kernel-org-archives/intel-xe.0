Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2D04C88E53
	for <intel-xe@archiver.kernel.org>; Tue, 15 Sep 2026 09:43:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 837B710FB44;
	Tue, 15 Sep 2026 09:43:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oVwJK93D";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77F6C10F37D;
 Tue, 15 Sep 2026 09:43:51 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 96D57602CB;
 Tue, 15 Sep 2026 09:43:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 220A51F000FF;
 Tue, 15 Sep 2026 09:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1789465430;
 bh=oCGwmFPAnqNC4umJgOUCIGnxqRMNULc2+3FUnjpl+0g=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=oVwJK93D0hRYTA77IAZc0Ke2OTbXp7jrMDl1GRvmMRrRX211gcQtZZgcszuNi50F5
 xyhajdSOUvA1wdhs2s+2eDBkN95dopvLcUJXhT4n30qbKBeLc6jc/EfN1qzsi2XRSz
 PAnP5Mbly/0J81rrfZIoo7+RJk87AVq+UT/Ak/OxHLMICA2bawGj1fRpox6fJLECZT
 5JtgNuUejO2mEO+dpjYE3LmILLXA/s/TVqht5YIJVll1jCyNT4CrqGoKRjJhvvYg6B
 0Na4vo8myS4Hv0hVzxWHUG8CLj8KHaMnHNXK0bXqazet/9kJzacUhzHX/8F5/5yFsg
 Iv3tppaREGVfA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 4/5] drm/i915/irq: conditional HPD IRQ resets based
 on PME capability
To: "Vinod Govindapillai" <vinod.govindapillai@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
In-Reply-To: <20260915092518.639448-5-vinod.govindapillai@intel.com>
References: <20260915092518.639448-1-vinod.govindapillai@intel.com>
 <20260915092518.639448-5-vinod.govindapillai@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 09:43:49 +0000
Message-Id: <20260915094350.220A51F000FF@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] irq: HPD events lost during runtime resume due to cleared IIR
- [High] pm: violating context separation by using runtime PM flag in syste=
m PM
- [Medium] irq: spurious wakeups due to unmasked GMBUS and AUX interrupts
- [Medium] pm: missing pme_enabled callback renders feature inactive on i915
--

commit 726361eac47c46981fd133dfd6565522bf0f1000
Author: Vinod Govindapillai <vinod.govindapillai@intel.com>

drm/i915/irq: conditional HPD IRQ resets based on PME capability

This commit skips resetting HPD-related IRQs during suspend if the device
is capable of generating PME from HPDs. This prevents dropping hotplug
events that should wake the system, as a full reset would clear them.

> diff --git a/drivers/gpu/drm/i915/display/intel_display_irq.c b/drivers/g=
pu/drm/i915/display/intel_display_irq.c
> index a59b75830bd13..8ce30112de974 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_irq.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_irq.c
> @@ -2217,8 +2217,10 @@ static void gen11_display_irq_reset(struct intel_d=
isplay *display)
>  	enum pipe pipe;
>  	u32 trans_mask =3D BIT(TRANSCODER_A) | BIT(TRANSCODER_B) |
>  		BIT(TRANSCODER_C) | BIT(TRANSCODER_D);
> +	bool reset_hpd =3D !intel_display_rpm_pme_enabled(display);

[Severity: Medium]
Will this feature ever be active on i915?

intel_display_rpm_pme_enabled() checks rpm->pme_enabled. While xe implements
this callback, i915_display_rpm_interface (in intel_runtime_pm.c) does not:

const struct intel_display_rpm_interface i915_display_rpm_interface =3D {
	.get =3D i915_display_rpm_get,
        ...

This means intel_display_rpm_pme_enabled() will unconditionally return fals=
e on
all i915 platforms, causing reset_hpd to always be true.

[Severity: High]
Does this violate PM context separation by using a runtime PM flag in a
system PM path?

gen11_display_irq_reset() is a shared IRQ reset function called by both run=
time
PM and system PM. The xe->pme.enabled flag queried by
intel_display_rpm_pme_enabled() is a runtime PM flag.

If this evaluates to true during a system PM resume, gen11_display_irq_rese=
t()
will skip zeroing GEN11_DISPLAY_INT_CTL and resetting HPD IRQs, leaving the
hardware in an undefined power-on state since system suspend always loses
power and requires full reinitialization.

[Severity: High]
Does this logic inadvertently clear the HPD event that woke up the system?

When a PME wakes the system, xe_pci_runtime_resume() immediately disables P=
ME
before resuming:

xe_pci_runtime_resume()
    xe_pm_update_pme_enabled(xe, false);
    xe_pm_runtime_resume(xe);
        ... -> gen11_display_irq_reset()

Since PME is now false, reset_hpd evaluates to true during the resume phase.
This causes irq_reset() to write 0xffffffff to the IIR for the HPD registers
later in this function, completely clearing the pending hardware HPD event
before the interrupt handler can be installed and process it.

> =20
> -	intel_de_write(display, GEN11_DISPLAY_INT_CTL, 0);
> +	if (reset_hpd)
> +		intel_de_write(display, GEN11_DISPLAY_INT_CTL, 0);
> =20
>  	if (DISPLAY_VER(display) >=3D 12) {
>  		enum transcoder trans;

[ ... ]

> @@ -2250,13 +2252,15 @@ static void gen11_display_irq_reset(struct intel_=
display *display)
>  	irq_reset(display, GEN8_DE_PORT_IRQ_REGS);
>  	irq_reset(display, GEN8_DE_MISC_IRQ_REGS);
> =20
> -	if (DISPLAY_VER(display) >=3D 14)
> -		irq_reset(display, PICAINTERRUPT_IRQ_REGS);
> -	else
> -		irq_reset(display, GEN11_DE_HPD_IRQ_REGS);
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
> +	}

[Severity: Medium]
Will bypassing irq_reset() for these registers cause spurious wakeups?

The PICAINTERRUPT_IRQ_REGS and SDE_IRQ_REGS control multiple interrupts, not
just HPD. For instance, SDE_IRQ_REGS enables SDE_GMBUS_ICP (GMBUS/I2C), and
PICAINTERRUPT_IRQ_REGS enables TC AUX interrupts.

By completely skipping the register reset instead of explicitly preserving =
just
the HPD bits, GMBUS and AUX interrupts remain unmasked while the device is =
in
D3hot. Any activity or electrical noise on these buses could trigger an
interrupt, generating a PME and waking the system spuriously, causing unwan=
ted
power consumption.

>  }
> =20
>  void gen8_irq_power_well_post_enable(struct intel_display *display,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915092518.6394=
48-1-vinod.govindapillai@intel.com?part=3D4
