Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89DB5C88E4C
	for <intel-xe@archiver.kernel.org>; Fri, 11 Sep 2026 08:34:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38B5410E012;
	Fri, 11 Sep 2026 08:34:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="W9L8s+zd";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEDFE10E023;
 Fri, 11 Sep 2026 08:34:16 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id DC4AE601EF;
 Fri, 11 Sep 2026 08:34:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A3BF1F000FF;
 Fri, 11 Sep 2026 08:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1789115655;
 bh=M1zrx3gALXxbYpDq7o+W+Op2uZubZ8TVp+8vM8sYWL0=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=W9L8s+zd1VTwK+JT/5kVW90J36WB3Ab9Uk5xAhohH+ySpC6CNCdzfrLgDkeflUwSW
 VxcrFWKSpU/g6/sRob5LlxM1fz5zYRUnJiQ/QFiB5jGf9GnfdNkgirgfMUgcYgLCsC
 aAX1o+OJ3Fhxp9lHwBbJ6xEj/eCFv2vyNsVZ79rzXJrZNIwAv8aA7kZScUK6ODTAMo
 72pPslQcMT2bvABuEQiSCMNY5ccpxpXi0AQkI/cSfuJS8dLeuEHS2wSlOeCYBbDLIf
 WWChuZ+vnkswOnJhDtlLNwdDd50X5AeEkU69VMb9MiwMSiN2CxIMRn8HEmv3cWCpK0
 38JL4RjCeUVJQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 10/10] drm/i915/hotplug: avoid HPD polling if the
 device is PME capable
To: "Vinod Govindapillai" <vinod.govindapillai@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
In-Reply-To: <20260911080448.778316-11-vinod.govindapillai@intel.com>
References: <20260911080448.778316-1-vinod.govindapillai@intel.com>
 <20260911080448.778316-11-vinod.govindapillai@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 08:34:14 +0000
Message-Id: <20260911083415.5A3BF1F000FF@smtp.kernel.org>
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
- [Medium] The patch fails to disable HPD polling for `xe` devices in D3col=
d because it relies on a stateful flag that is bypassed in the `xe` D3cold =
suspend path.
--

commit d64c6fbf549089ab8b3ecb3a04becd1d5a8da552
Author: Vinod Govindapillai <vinod.govindapillai@intel.com>

drm/i915/hotplug: avoid HPD polling if the device is PME capable

This commit attempts to optimize power usage by disabling HPD polling on
devices capable of generating PME wake events. It introduces a check in
intel_hpd_poll_enable() to skip polling if the device supports PME.

> diff --git a/drivers/gpu/drm/i915/display/intel_hotplug.c b/drivers/gpu/d=
rm/i915/display/intel_hotplug.c
> index b24c9f360e241..8b7b9f47f049a 100644
> --- a/drivers/gpu/drm/i915/display/intel_hotplug.c
> +++ b/drivers/gpu/drm/i915/display/intel_hotplug.c
> @@ -877,6 +877,11 @@ void intel_hpd_poll_enable(struct intel_display *dis=
play)
>  	if (!HAS_DISPLAY(display) || !intel_display_device_enabled(display))
>  		return;
> =20
> +	if (intel_hpd_can_generate_pme(display)) {
> +		drm_dbg_kms(display->drm, "PME wake capable device, skipping HPD polli=
ng.\n");
> +		return;
> +	}
> +

[Severity: Medium]
Will this check actually prevent HPD polling for xe devices entering D3cold?

When an xe device enters runtime suspend, xe_display_pm_runtime_suspend()
bypasses intel_display_driver_pm_runtime_suspend() if D3cold is allowed:

drivers/gpu/drm/xe/display/xe_display.c:xe_display_pm_runtime_suspend() {
	...
	if (xe->d3cold.allowed) {
		xe_display_enable_d3cold(xe);
		return;
	}

	intel_display_driver_pm_runtime_suspend(display);
	...
}

Because this bypasses intel_display_driver_pm_runtime_suspend(), the
display->hotplug.can_generate_pme flag is never populated for the D3cold pa=
th.

When xe_display_enable_d3cold() subsequently calls intel_hpd_poll_enable(),
intel_hpd_can_generate_pme() will return false, and HPD polling will remain
enabled, which appears to defeat the optimization this patch aims to achiev=
e.

Does this flag need to be populated in the D3cold path as well?

>  	WRITE_ONCE(display->hotplug.poll_enabled, true);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911080448.7783=
16-1-vinod.govindapillai@intel.com?part=3D10
