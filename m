Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF425C61DD3
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 08:32:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6187A10F482;
	Thu,  3 Sep 2026 08:32:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CQLqZRDp";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EBF410F482;
 Thu,  3 Sep 2026 08:32:13 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id ABB4D60218;
 Thu,  3 Sep 2026 08:32:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C2611F000E9;
 Thu,  3 Sep 2026 08:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788424332;
 bh=fpL6Rl1XhhvaebT0bIp2qnKA5tR+eN95MXoZVCcvhgY=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=CQLqZRDp5aIhAJtUlYuhLKYhuKhIvo7r5NbcGMD1DKkV6n/PBKfFbtOoTqqdANkGe
 zK58A2j9cOeJR7Vde7TKb+qoL7w2c7MPilN6+L/E9DpH8lj2o7jQpJUi+em8LDbtme
 VKe9jxf6h3UOlpp/g6tMcuTXuZzUS3qY0uQmL/x+HM1hJc4LjY+tSy/ngBVwK4Mny8
 AEdwakathuaHGwfP9n3J2OU8Aco9S8zwGt815vKVJmRbQSAcPQ/WKzxrFeMH2pHsQ+
 B3Tllqc3zM8plHJjsHrMdZ85AlQyB4buEx0khy25qYWoMl7ANqwl42qUnyiWSxEUMz
 1QgEE34VkqHFA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/5] drm/i915/irq: conditional HPD IRQ resets based
 on PME capability
To: "Vinod Govindapillai" <vinod.govindapillai@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
In-Reply-To: <20260903080410.489411-4-vinod.govindapillai@intel.com>
References: <20260903080410.489411-1-vinod.govindapillai@intel.com>
 <20260903080410.489411-4-vinod.govindapillai@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 08:32:11 +0000
Message-Id: <20260903083212.2C2611F000E9@smtp.kernel.org>
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
- [High] Lost HPD interrupt on system resume causing broken hotplug detecti=
on
- [Medium] Unintentionally leaving non-HPD interrupts unmasked during suspe=
nd
--

commit 3a88160970f909255e3f0d82a7735b68d8c9df0d
Author: Vinod Govindapillai <vinod.govindapillai@intel.com>

drm/i915/irq: conditional HPD IRQ resets based on PME capability

This commit conditionally skips resetting HPD-related IRQs during suspend
if the device supports generating PME from HPDs. This aims to keep the
device capable of waking from hotplug events.

> diff --git a/drivers/gpu/drm/i915/display/intel_display_irq.c b/drivers/g=
pu/drm/i915/display/intel_display_irq.c
> index a59b75830bd13..fc50b19d5ddfe 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_irq.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_irq.c
[ ... ]
> @@ -2250,13 +2254,15 @@ static void gen11_display_irq_reset(struct intel_=
display *display)
>  	irq_reset(display, GEN8_DE_PORT_IRQ_REGS);
>  	irq_reset(display, GEN8_DE_MISC_IRQ_REGS);
> =20
> -	if (DISPLAY_VER(display) >=3D 14)
> -		irq_reset(display, PICAINTERRUPT_IRQ_REGS);
> -	else
> -		irq_reset(display, GEN11_DE_HPD_IRQ_REGS);
> +	if (!keep_hpd) {
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
Since PICAINTERRUPT_IRQ_REGS and SDE_IRQ_REGS contain both HPD and non-HPD
interrupts (like GMBUS, I2C, AUX, and Poison errors), does skipping their
reset here leave those non-HPD interrupts unmasked during suspend? Could
this lead to spurious wakeups or unintended interrupt handling while the
system is suspended?

[Severity: High]
During system resume, if keep_hpd evaluates to false (for example, if PME
capability is cleared before runtime resume), this block will execute
irq_reset() for these registers.

Looking at irq_reset(), it unconditionally clears the IIR:

static void irq_reset(struct intel_display *display, struct intel_irq_regs =
regs)
{
	intel_de_write(display, regs.imr, 0xffffffff);
	intel_de_posting_read(display, regs.imr);
	...
	/* IIR can theoretically queue up two events. Be paranoid. */
	intel_de_write(display, regs.iir, 0xffffffff);
	intel_de_posting_read(display, regs.iir);
	intel_de_write(display, regs.iir, 0xffffffff);
	intel_de_posting_read(display, regs.iir);
}

Does this permanently destroy the pending HPD event that just woke the syst=
em
before the IRQ handlers can process it?

Additionally, even if keep_hpd remained true during resume, wouldn't the
subsequent call to irq_init() during postinstall explicitly clear the IIR
anyway?

static void irq_init(struct intel_display *display, ...)
{
	...
	assert_iir_is_zero(display, regs.iir);
	...
}

Will this cause the hotplug event to be completely ignored, preventing the
display from being brought up after a PME wake?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903080410.4894=
11-1-vinod.govindapillai@intel.com?part=3D3
