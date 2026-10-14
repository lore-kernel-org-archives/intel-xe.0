Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0036CC6B1A
	for <intel-xe@archiver.kernel.org>; Wed, 14 Oct 2026 06:14:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F9A710E3F5;
	Wed, 14 Oct 2026 06:14:47 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1810310E3F5
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Oct 2026 06:14:41 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 3BC5460213;
 Wed, 14 Oct 2026 06:14:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEF901F000FF;
 Wed, 14 Oct 2026 06:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1791958479;
 bh=rX3waMCSCdxkxV21qXFgj52KwKJjEPwhxgqxqo8zt34=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=DEhMSHJ+ZXRKIn2jFHil4qX/LsNqWDk5zKXr8vPKAf5LHLh4ip4V6d5vCTIQz9nVT
 79Cii3QP3ZpKSsdv8xZzju7VPRkgWIRDWIwSthzGP4qU88mpZCUpUWqKDxI9rxxsNI
 q08glvXTFHJTkYFQrgvH+Aii6e97ee8hk0dNa7opjdMF3iooiLIJD8eHyzfhBdwkw7
 OHfveHZUwmU1eYr+N1AUcTPqDilg6/lSmrQ2mwSWjiu8C4hdSiFGCmcacQ+y8QWeov
 1UsnX8VuBnH3mDYDhiMeECwODnAvwcRvAZzXmCuAGPmfm8vdvUr7GQJtMqt4UUBYdE
 GrVRnOApMrmNA==
Message-ID: <sashiko-outbox-170855@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 7/7] drm/xe/ras: Move xe_ras_process_errors() to xe_ras
To: "Raag Jadav" <raag.jadav@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261014055215.330408-8-raag.jadav@intel.com>
References: <20261014055215.330408-1-raag.jadav@intel.com>
 <20261014055215.330408-8-raag.jadav@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 06:14:39 +0000
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
- [High] drm/xe: early wedging causes probe failure and breaks survivabilit=
y mode
- [Medium] drm/xe/ras: fault injection bypassed on devices without sysctrl
--

commit f19cf587dc3dbb4d3eeb0716be575b1dc0369223
Author: Raag Jadav <raag.jadav@intel.com>

drm/xe/ras: Move xe_ras_process_errors() to xe_ras
   =20
This patch moves xe_ras_process_errors() from xe_device_probe() to
xe_ras_init(), reverting a previous commit that delayed ras error processin=
g.

> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 922e5e793b135..8e399ffec9856 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -932,6 +932,13 @@ void xe_ras_init(struct xe_device *xe)
>  	if (IS_ENABLED(CONFIG_PCIEAER))
>  		ras_usp_aer_init(xe);
> =20
> +	/*
> +	 * During probe, process and log any errors detected by firmware while =
the driver was not
> +	 * loaded. Critical errors such as Punit and CSC are reported through P=
code init failure,
> +	 * causing the driver to enter survivability mode.
> +	 */
> +	xe_ras_process_errors(xe);
> +

[Severity: High]
Does moving xe_ras_process_errors() here cause probe failure on boot-time
errors?

xe_ras_init() is called before xe_gt_init() during probe. If
xe_ras_process_errors() detects a hardware error and wedges the device,
subsequent calls in xe_device_probe() such as xe_gt_init() will fail.

For example, when xe_gt_init() calls into GuC CT:

drivers/gpu/drm/xe/xe_guc_ct.c:__guc_ct_send_locked() {
	if (xe_wedged(ct_to_xe(ct))) {
		ret =3D -ENOTRECOVERABLE;
		goto out;
	}
	...
}

This failure propagates up, causing the driver probe sequence to abort
entirely instead of binding the device in a wedged state. This prevents
access to the sysfs files required for userspace firmware recovery (Runtime
Survivability Mode) and drops the WEDGED uevent.

[Severity: Medium]
Will this bypass the fault injection check on devices without a system
controller?

Earlier in xe_ras_init(), there is an early return:

drivers/gpu/drm/xe/xe_ras.c:xe_ras_init() {
	...
	if (!xe->info.has_sysctrl)
		return;
	...
}

Because of this early return, xe_ras_process_errors() will never be called
on platforms where has_sysctrl is false.

However, xe_ras_process_errors() checks for cold-reset fault injection
before checking for has_sysctrl:

drivers/gpu/drm/xe/xe_ras.c:xe_ras_process_errors() {
	if (xe_fault_wedge_cold_reset()) {
		xe_err(xe, "[RAS]: cold-reset wedge injected\n");
		punit_error_handler(xe);
		return XE_RAS_RECOVERY_ACTION_DISCONNECT;
	}

	if (!xe->info.has_sysctrl)
		return XE_RAS_RECOVERY_ACTION_RESET;
	...
}

Placing xe_ras_process_errors() after the has_sysctrl check in xe_ras_init()
appears to silently break cold-reset fault injection during probe on these
platforms.

>  	ret =3D devm_device_add_group(xe->drm.dev, &gpu_health_group);
>  	if (ret)
>  		xe_err(xe, "Failed to create GPU health sysfs, err=3D%d\n", ret);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014055215.3304=
08-1-raag.jadav@intel.com?part=3D7
