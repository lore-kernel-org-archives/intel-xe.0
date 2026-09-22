Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE7A1C982FA
	for <intel-xe@archiver.kernel.org>; Tue, 22 Sep 2026 15:16:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA80710E696;
	Tue, 22 Sep 2026 15:16:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="g2Gq2D7p";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A234810E4D0;
 Tue, 22 Sep 2026 15:16:36 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id C6D2B60204;
 Tue, 22 Sep 2026 15:16:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5013C1F000FF;
 Tue, 22 Sep 2026 15:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1790090195;
 bh=G//VzGJ2nQRmfUKZCQ1JtVPVbNs9yJ5lWvSn8+Sjqh0=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=g2Gq2D7p/m1Y5oDjjjO3FnB2tGxeFNbDJoJr5P/9Jy0+tsIOzbul14X3aYzSvt6Bv
 SsUMcGb1k/KtQiN2on+fws6/fOfWBF8X1qJK7sG8Mb/kH6TOwPUijELH7TlgzGPSoj
 ZcSmWilbDTOsK9iPr4e1GpicXffXJlxwG6ecBYxMdjT7FvwpJZNOsuN+uRg7Rst31N
 qfHeXLkgC0W8x/kd1K9P40DAPL4CNjHtMEAZRZX3x2wVLa8rYK9+9vvVzf442HnKyN
 gi2NTKorZU5XaL+oB0yOhWmUE7Ub3qh1INAFuleexJI47/vx3V88NYNzVxUk0bdX44
 Y4CKX6l3/FGnQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/4] drm/{i915, xe}: move intel_opregion_suspend() to
 intel_display_driver_pm_suspend_late()
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
In-Reply-To: <050b935fa3fd85101ea0241b60a2e7893d3ad546.1790089118.git.jani.nikula@intel.com>
References: <cover.1790089118.git.jani.nikula@intel.com>
 <050b935fa3fd85101ea0241b60a2e7893d3ad546.1790089118.git.jani.nikula@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 15:16:34 +0000
Message-Id: <20260922151635.5013C1F000FF@smtp.kernel.org>
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
- [High] drm/i915: Use-after-suspend of asle_work due to late intel_opregio=
n_suspend()
- [High] drm/i915: Hard system hang risk from late ACPI SMI notification
- [High] drm/xe: ACPI state corruption via double intel_opregion_suspend()
--

commit fc3c0277d6ab46a7da2ef12128f2682dd8013140
Author: Jani Nikula <jani.nikula@intel.com>

drm/{i915, xe}: move intel_opregion_suspend() to intel_display_driver_pm_su=
spend_late()

Try to unify the suspend paths and behaviour by moving the
intel_opregion_suspend() calls to
intel_display_driver_pm_suspend_late().

> diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.c b/driver=
s/gpu/drm/i915/display/intel_display_driver.c
> index 77009dca7d0d9..abab457bce3a3 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_driver.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_driver.c
> @@ -783,6 +783,8 @@ void intel_display_driver_pm_suspend_late(struct inte=
l_display *display, bool s2
>  	if (!HAS_DISPLAY(display))
>  		return;
> =20
> +	intel_opregion_suspend(display, s2idle ? PCI_D1 : PCI_D3cold);
> +
>  	intel_display_power_suspend_late(display, s2idle);
>  }

[Severity: High]
Does moving intel_opregion_suspend() here cause it to execute too late in t=
he
suspend sequence?

In i915_drm_suspend_late(), the GTs and uncore are suspended before calling
intel_display_driver_pm_suspend_late():

drivers/gpu/drm/i915/i915_driver.c:i915_drm_suspend_late() {
	...
	for_each_gt(gt, dev_priv, i)
		intel_uncore_suspend(gt->uncore);

	intel_display_driver_pm_suspend_late(display, s2idle);
	...
}

Because intel_opregion_suspend() calls cancel_work_sync(&opregion->asle_wor=
k),
delaying this sync until after intel_uncore_suspend() could allow asle_work
to execute concurrently with or after uncore suspension, risking MMIO acces=
ses
on suspended hardware.

Additionally, could triggering a System Management Interrupt (SMI) via
intel_opregion_notify_adapter() while the GT/uncore is already suspended ca=
use
the BIOS to access powered-down GPU registers and result in a hard system h=
ang?

[ ... ]

> diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe=
/display/xe_display.c
> index 184a5a2378805..b013ec00b75da 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.c
> +++ b/drivers/gpu/drm/xe/display/xe_display.c
> @@ -246,14 +246,11 @@ static bool suspend_to_idle(void)
>  void xe_display_pm_suspend(struct xe_device *xe)
>  {
>  	struct intel_display *display =3D xe->display;
> -	bool s2idle =3D suspend_to_idle();
> =20
>  	if (!xe->info.probe_display)
>  		return;
> =20
>  	intel_display_driver_pm_suspend(display);
> -
> -	intel_opregion_suspend(display, s2idle ? PCI_D1 : PCI_D3cold);
>  }

[Severity: High]
Will this lead to a double intel_opregion_suspend() and ACPI state corrupti=
on
during runtime suspend?

When xe->d3cold.allowed is true, xe_display_pm_runtime_suspend() calls
xe_display_enable_d3cold() which explicitly suspends the OpRegion to PCI_D3=
cold:

drivers/gpu/drm/xe/display/xe_display.c:xe_display_enable_d3cold() {
	...
	intel_opregion_suspend(display, PCI_D3cold);
	...
}

Then xe_display_pm_runtime_suspend_late() calls xe_display_pm_suspend_late(=
):

drivers/gpu/drm/xe/display/xe_display.c:xe_display_pm_runtime_suspend_late(=
) {
	...
	if (xe->d3cold.allowed) {
		xe_display_pm_suspend_late(xe);
	...
}

Since xe_display_pm_suspend_late() calls intel_display_driver_pm_suspend_la=
te(),
which now includes the new intel_opregion_suspend() call, it will be execut=
ed a
second time. Because suspend_to_idle() evaluates to true during runtime sus=
pend
(S0), it will be called with PCI_D1 instead of PCI_D3cold.

Will this overwrite the ACPI power state from PCI_D3cold to PCI_D1 and corr=
upt
the BIOS state?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1790089118.gi=
t.jani.nikula@intel.com?part=3D2
