Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59E73C88E73
	for <intel-xe@archiver.kernel.org>; Mon, 14 Sep 2026 21:07:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE00410F26D;
	Mon, 14 Sep 2026 21:07:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AHf24PSZ";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8BA610F264;
 Mon, 14 Sep 2026 21:07:32 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 5123943740;
 Mon, 14 Sep 2026 21:07:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 089571F000FF;
 Mon, 14 Sep 2026 21:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1789420052;
 bh=Py+7njEoAaD2QIRWnA2VOQhGtPA1KiRl8PP3YTgu5+c=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=AHf24PSZtsuKY6hgGIiPxa0TVcxrAUr5Fxb3YH4XzOnwGBlRn11QyKeTB0fBhSJER
 g2jgYXfTwaV2rI2b0P9asqZlJofVIzikKgSvs7yQ6Cj0g+y5mr6QrSLYZe6C6NDzQT
 lNruYOHUU/K9uwmR1Nt3a0pJdjvS/gtkhBzhyg6dlf3A/NM/yh6AAZWltieMoLqMhk
 7GtOOE3ab0kJFTt0ksyV7AS9CtP8FamZT2drdW7sadLl0oTKqECLoM85lNtjZc5pGo
 3swG6SBhMKbfb4nAIL02k2iXPOtu2ikjXG45y/Zq9QNdGvOfqO+UrIZYwgkVMMFkjX
 AUq722RmjGGQA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 6/7] drm/i915/irq: conditional HPD IRQ resets based
 on PME capability
To: "Vinod Govindapillai" <vinod.govindapillai@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
In-Reply-To: <20260914204034.309566-7-vinod.govindapillai@intel.com>
References: <20260914204034.309566-1-vinod.govindapillai@intel.com>
 <20260914204034.309566-7-vinod.govindapillai@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 21:07:31 +0000
Message-Id: <20260914210732.089571F000FF@smtp.kernel.org>
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
- [High] Skipping complete reset of SDE_IRQ_REGS and PICAINTERRUPT_IRQ_REGS=
 leaves non-HPD interrupts unmasked during suspend
- [Medium] Use of a runtime PM flag in a system PM path violates context se=
paration rules
--

commit 016105ca4a906778ae2ae9e203cb133c974e24b8
Author: Vinod Govindapillai <vinod.govindapillai@intel.com>
Subject: drm/i915/irq: conditional HPD IRQ resets based on PME capability

This commit modifies the display IRQ reset sequence to conditionally keep
HPD IRQs active if the device is capable of generating PME from HPDs. This
prevents the loss of HPD wake events during suspend routines.

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
> =20
> -	intel_de_write(display, GEN11_DISPLAY_INT_CTL, 0);
> +	if (reset_hpd)
> +		intel_de_write(display, GEN11_DISPLAY_INT_CTL, 0);

[Severity: Medium]
Does using intel_display_rpm_pme_enabled() here violate context separation
rules between system PM and runtime PM?

gen11_display_irq_reset() is called during system suspend (for example, via
xe_irq_suspend()). Evaluating intel_display_rpm_pme_enabled() ultimately re=
ads
xe->pme.enabled, which is a runtime PM flag that is only updated during
runtime suspend and resume.

Because runtime resume typically clears this flag before a system suspend,
won't reset_hpd always evaluate to true during system suspend, thereby
defeating the purpose of preserving HPD wake capability?

>  	if (DISPLAY_VER(display) >=3D 12) {
>  		enum transcoder trans;

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
>  }

[Severity: High]
Does skipping the complete reset of SDE_IRQ_REGS and PICAINTERRUPT_IRQ_REGS
leave non-HPD interrupts unmasked during suspend?

If reset_hpd evaluates to false (such as when entering runtime suspend with
PME enabled), the code skips resetting these entire IRQ register banks. Sin=
ce
SDE_IRQ_REGS controls GMBUS and I2C interrupts, and PICAINTERRUPT_IRQ_REGS
controls AUX channel interrupts, won't entirely skipping their resets leave
them fully enabled in the IMR/IER registers?

Could this cause unexpected system wakeups or interrupt storms from unhandl=
ed
GMBUS or AUX interrupts while suspended, rather than selectively masking on=
ly
the non-HPD bits?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914204034.3095=
66-1-vinod.govindapillai@intel.com?part=3D6
