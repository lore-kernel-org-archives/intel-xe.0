Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7271C5B572
	for <intel-xe@archiver.kernel.org>; Sun, 16 Aug 2026 22:52:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 778DF10E023;
	Sun, 16 Aug 2026 22:52:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="la6KCfmZ";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C01910E023;
 Sun, 16 Aug 2026 22:52:06 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id E343F4069E;
 Sun, 16 Aug 2026 22:52:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B47B1F000E9;
 Sun, 16 Aug 2026 22:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1786920725;
 bh=+8U1g2RW5gac/JBCrpYMZa2rPTzsW5GA57mtvmaKrDo=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=la6KCfmZNsbtAdzQccDRKMVT3VNkd+TfRE1RTfszV8gCm2vFpPK8NhRe1JWPvb9Yp
 k60kkwu+qnG6gNOoEzCyRMZh7FdTM+rcJyk2D8Ru/MhATptqsgYG3yFPIfgnOY2WfJ
 cCR4VJA5z+T8+6V4uwJW2Lrql4Q42Nk3+BsaQmCYEtRTodXQlYAHsILl+4M590H0gU
 1BaLhSLY6gxcsXz8qhwuFH0Ptvn5emmmzXW8uAJYC3dGHsJ7ep96UBzT16PZbOhm8Z
 tJKwHpuQObkbEwSWwZ8NN6MNl+1utjSt8vsTW4g1L3pRtW/AcdQtzXFgfWVlKIJkJN
 bPPwJaYdHTZLA==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 5/5] drm/i915/display: skip HPD polling if PME is
 supported
To: "Vinod Govindapillai" <vinod.govindapillai@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
In-Reply-To: <20260816224005.886035-6-vinod.govindapillai@intel.com>
References: <20260816224005.886035-1-vinod.govindapillai@intel.com>
 <20260816224005.886035-6-vinod.govindapillai@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 16 Aug 2026 22:52:05 +0000
Message-Id: <20260816225205.8B47B1F000E9@smtp.kernel.org>
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
- [High] Skipping `intel_hpd_init()` on runtime resume for PME-capable devi=
ces leaves hardware HPD interrupts permanently disabled, breaking hotplug d=
etection while the device is awake.
--

--- Patch [5]: [RFC PATCH 5/5] drm/i915/display: skip HPD polling if PME is=
 supported ---
commit f6a80f590c41d181052f2d40a190e9c030e50eb2
Author: Vinod Govindapillai <vinod.govindapillai@intel.com>
drm/i915/display: skip HPD polling if PME is supported

This commit prevents the display driver from enabling HPD polling during
runtime suspend if the device supports PM_PME. It also updates the resume
path to selectively initialize HPD only if polling was actually enabled.

> diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.c b/driver=
s/gpu/drm/i915/display/intel_display_driver.c
> index 70d112fd4287a..b7e25b7ea32ed 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_driver.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_driver.c

[ ... ]

> @@ -951,10 +956,20 @@ void intel_display_driver_pm_runtime_resume(struct =
intel_display *display)
>  	 * power well, so hpd is reinitialized from there. For
>  	 * everyone else do it here.
>  	 */
> -	if (!display->platform.valleyview && !display->platform.cherryview) {
> +	if (display->platform.valleyview || display->platform.cherryview)
> +		goto out;
> +
> +	/* For PME capable devices we would not have resorted into HPD polling =
*/
> +	if (intel_hpd_polling_enabled(display))
>  		intel_hpd_init(display);

[Severity: High]
Does skipping intel_hpd_init() here permanently break hardware hotplug
detection for PME-capable devices?

When a PME-capable device enters runtime suspend, it skips
intel_hpd_poll_enable(), so intel_hpd_polling_enabled() will return false.=
=20
On resume, this condition causes intel_hpd_init() to be skipped.

However, looking at intel_hpd_init() in intel_hotplug.c, it does more than
just polling setup. It also programs the hardware registers to re-enable
hardware interrupts:

void intel_hpd_init(struct intel_display *display)
{
    ...
	spin_lock_irq(&display->irq.lock);
	intel_hpd_irq_setup(display);
	spin_unlock_irq(&display->irq.lock);
}

Without calling intel_hpd_irq_setup(), the hardware HPD interrupts will
remain masked. Will any subsequent monitor hotplugs or unplugs that happen
while the device is awake be silently ignored?

> -		intel_hpd_poll_disable(display);
> -	}
> =20
> +	/*
> +	 * Regardless of PME capable path, call the HPD polling disable, the
> +	 * poll_init_work, i915_hpd_poll_detect_connectors reprobe catches the
> +	 * hotplug that occurred while suspended
> +	 */
> +	intel_hpd_poll_disable(display);
> +
> +out:
>  	skl_watermark_ipc_update(display);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260816224005.8860=
35-1-vinod.govindapillai@intel.com?part=3D5
