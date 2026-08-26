Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82AFBC61DBE
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 23:08:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12ADF10EE26;
	Wed, 26 Aug 2026 23:08:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DtSsSuM1";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB8A810EE26;
 Wed, 26 Aug 2026 23:08:18 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 8B755408E0;
 Wed, 26 Aug 2026 23:08:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42C091F000E9;
 Wed, 26 Aug 2026 23:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787785698;
 bh=pr/g23NI+hWlYG9N03ETEUsW163Ug/Hpd1VqZ23Kf1A=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=DtSsSuM1LXKR+jh5ZDG/Kw697RKINkNVYgYAQxqUQC2vxeum2IcyMlGHP+K152Pce
 5xrY40yCt3m1BoR9RXBo2VBhJrNg2XX/5tJEujdxGVgEi2IPEO18eSuV2wC6dWlmoi
 /9SIvuYr6988oTq/o1mEjYbyq0JA8iAq6ryPs4Hfm1YAo4nfQ9duidhDUYhLRdWACc
 N8fklYkZNVBTr/u7hLBTWsnsp1KdbLwx1ZTs6qQMriU3UATO8MXPX9CNtzzbEEO8tl
 vNhBtZ6Gi68xltG9OSYW8VfcBi6IHBBOROcr/1zJ+v/61iiClzzC1/3FoEtF1CpC9T
 66RMDbr8UksJQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/4] drm/i915/hpd: plumb keep_hpd through irq reset
To: "Vinod Govindapillai" <vinod.govindapillai@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
In-Reply-To: <20260826225338.804902-2-vinod.govindapillai@intel.com>
References: <20260826225338.804902-1-vinod.govindapillai@intel.com>
 <20260826225338.804902-2-vinod.govindapillai@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 26 Aug 2026 23:08:17 +0000
Message-Id: <20260826230818.42C091F000E9@smtp.kernel.org>
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
- [High] Clearing all interrupts in `xe_irq_resume` unconditionally discard=
s pending HPD events (especially DP short pulses) that woke the system.
- [Medium] `gen11_display_irq_reset()` leaves non-HPD interrupts enabled wh=
en `keep_hpd` is true by bypassing entire register bank resets.
--

commit 4b2992909ca6b4f24f513b4a4b9fb59c8de79fa9
Author: Vinod Govindapillai <vinod.govindapillai@intel.com>
drm/i915/hpd: plumb keep_hpd through irq reset

This patch updates the display interrupt reset paths in i915 and xe to
conditionally preserve HPD-related interrupt registers. When the keep_hpd
flag is true, HPD interrupts remain active during suspend (D3hot) to allow
hotplug events to wake the device. In all other cases, they are reset as
usual.

> diff --git a/drivers/gpu/drm/i915/display/intel_display_irq.c b/drivers/g=
pu/drm/i915/display/intel_display_irq.c
> index a59b75830bd13..26fc90ff7299d 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_irq.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_irq.c
[ ... ]
> @@ -2250,13 +2259,20 @@ static void gen11_display_irq_reset(struct intel_=
display *display)
>  	irq_reset(display, GEN8_DE_PORT_IRQ_REGS);
>  	irq_reset(display, GEN8_DE_MISC_IRQ_REGS);
> =20
> -	if (DISPLAY_VER(display) >=3D 14)
> -		irq_reset(display, PICAINTERRUPT_IRQ_REGS);
> -	else
> -		irq_reset(display, GEN11_DE_HPD_IRQ_REGS);
> +	/*
> +	 * When runtime suspending to D3hot with PME armed, leave the HPD
> +	 * interrupt registers programmed so that a hotplug can still
> +	 * generate the wake event. Everything else is reset as usual.
> +	 */
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
Does bypassing these register banks entirely when keep_hpd is true leave
non-HPD interrupts enabled during suspend?

The SDE and PICA registers contain non-HPD interrupts such as GMBUS, Audio,
and AUX. If these are not reset, could they generate unexpected transitions
on the bus and trigger spurious PME wakeups while the device is in D3hot?

[ ... ]
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index 9e49e2241da41..eb240615455ce 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
[ ... ]
> @@ -866,7 +866,11 @@ void xe_irq_resume(struct xe_device *xe)
>  	 * 2. display is not yet resumed
>  	 */
>  	atomic_set(&xe->irq.enabled, 1);
> -	xe_irq_reset(xe);
> +	/*
> +	 * Always a full reset here: once awake, HPD is delivered as a normal
> +	 * interrupt again and the postinstall below re-arms that path.
> +	 */
> +	xe_irq_reset(xe, false);

[Severity: High]
Does unconditionally clearing all interrupts here discard pending
edge-triggered HPD events (like DisplayPort short pulses) that just woke
the system?

The comment mentions that HPD is delivered as a normal interrupt once awake.
However, since xe_irq_reset(xe, false) writes to the display IIR to clear
the latched status before the interrupt handler runs, wouldn't the event be
permanently lost since edge-triggered events are not re-asserted?

This might cause the driver to miss connection changes or link retraining
requests.

>  	xe_irq_postinstall(xe); /* turn irqs on */
> =20
>  	for_each_gt(gt, xe, id)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260826225338.8049=
02-1-vinod.govindapillai@intel.com?part=3D1
