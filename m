Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73ADFC88E4C
	for <intel-xe@archiver.kernel.org>; Fri, 11 Sep 2026 08:27:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 242F110E023;
	Fri, 11 Sep 2026 08:27:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fqUGlyHU";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 345F110E023;
 Fri, 11 Sep 2026 08:27:51 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id D0E3640202;
 Fri, 11 Sep 2026 08:27:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BCD11F000FF;
 Fri, 11 Sep 2026 08:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1789115270;
 bh=GqanexwpjY8qEGL3qFB4rHXmXrXv1ImRYzZon2zyWpo=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=fqUGlyHU598H/xmmIqAG61Q7/L4cpUWIKuoEeGBDJX8DmMht3MtfcWYDV7MgAJCnC
 f3Bci9Oh5ifvo4dDuxJmNBjzJGhbjKZEXHEwgUmEYhV3MkOC15TEz3JzhGsQ+swyk6
 kxw44HImULPKqK2f0cu3yJhECGr4h9CgeDaMhngr7H+B1CoSHrrd0r3jsdWUSMvc6M
 62PIHqbDvvKQT3m0iGhoDRwSUoo8J7reeCSr3zgLMifquaC+UX84f0OQHucAfzCkgg
 i8lrA6ktg+2de0KBUCqbX6yjBmwzexCZtzVt/H1b6/HMWmHDxEdqaagHLbNutIATRQ
 ydgFaQwp3tjFA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 09/10] drm/i915/irq: conditional HPD IRQ resets based
 on PME capability
To: "Vinod Govindapillai" <vinod.govindapillai@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
In-Reply-To: <20260911080448.778316-10-vinod.govindapillai@intel.com>
References: <20260911080448.778316-1-vinod.govindapillai@intel.com>
 <20260911080448.778316-10-vinod.govindapillai@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 08:27:50 +0000
Message-Id: <20260911082750.8BCD11F000FF@smtp.kernel.org>
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
- [Medium] Unmasked GMBUS and AUX interrupts during suspend risk spurious w=
akeups
--

commit ecc8bb9fede209da1bb1f570c685a52b7cee1c75
Author: Vinod Govindapillai <vinod.govindapillai@intel.com>

drm/i915/irq: conditional HPD IRQ resets based on PME capability

This commit skips resetting HPD IRQs during suspend if the device supports
generating PMEs from HPDs. This prevents the loss of HPD events by tying
the reset logic conditionally to the device's PME capability.

> diff --git a/drivers/gpu/drm/i915/display/intel_display_irq.c b/drivers/g=
pu/drm/i915/display/intel_display_irq.c
> --- a/drivers/gpu/drm/i915/display/intel_display_irq.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_irq.c

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

[Severity: Medium]
Does skipping the entire register reset here leave non-HPD interrupts
unmasked during suspend?

When a display device is capable of generating PME from HPD, reset_hpd
is set to false in gen11_display_irq_reset(). While this successfully
preserves HPD interrupts by skipping the reset of SDE_IRQ_REGS and
PICAINTERRUPT_IRQ_REGS, these registers also contain non-HPD interrupt
bits such as SDE_GMBUS_ICP and XELPDP_AUX_TC_MASK.

Because these bits are typically unmasked by default during postinstall
(e.g., in icp_irq_postinstall), skipping the full register reset leaves
these non-HPD interrupts active. If an I2C/GMBUS or DP AUX interrupt fires
due to noise or a delayed transaction during suspend, can this propagate
and cause spurious wakeups that prevent deep sleep states like S3 or S0ix?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911080448.7783=
16-1-vinod.govindapillai@intel.com?part=3D9
