Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87F26C61DD9
	for <intel-xe@archiver.kernel.org>; Sun, 30 Aug 2026 07:09:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20A8710E12E;
	Sun, 30 Aug 2026 07:09:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Y8UgfNZK";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0E8410E12E
 for <intel-xe@lists.freedesktop.org>; Sun, 30 Aug 2026 07:09:16 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 0EFF5600AE;
 Sun, 30 Aug 2026 07:09:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F2CA1F000E9;
 Sun, 30 Aug 2026 07:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788073755;
 bh=cyYd1shoGzuRoWojfv0ONAj5WzVpjXuBqmOkQIxQWkE=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=Y8UgfNZKK82Qo3WvzdwKUAIgXbwI7+4ZzPPrXqlTunnpo1oadGOCjXMtLzTNEVH1S
 xqcofoyyS0nucKV8rYalduRgj8gzVKTrvcy917sHc9BpOZkRH2Z0Pz8HPwuH2FGiV4
 d21usZF8jWh5mXHe8vOYWfh+RIb7sw8h3aT6t2MlL1qJLLLA9DEGcyp7u4atLvxcDZ
 5JpVcEOpoY9b5cSOTfAc3mlC0/49yI+Uzh62Ac0z24wMVsvJ4sHGkHlBgQwRQs5oSd
 cYIcrF5hwhsoSmuTsKFHuPiqGsG8ejHPRjyHIEACrkYAv3sbZL4DH62a5VDlgnR90r
 +/orWJ8Bl5gDQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] drm/xe/xe_hw_error: Handle non-fatal errors routed
 via direct IRQ
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260830065603.419055-8-riana.tauro@intel.com>
References: <20260830065603.419055-5-riana.tauro@intel.com>
 <20260830065603.419055-8-riana.tauro@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 30 Aug 2026 07:09:15 +0000
Message-Id: <20260830070915.8F2CA1F000E9@smtp.kernel.org>
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
- [High] `hw_error_work` accesses system controller MMIO registers without =
holding an active runtime PM reference, risking MMIO faults if the device i=
s suspended.
- [Medium] `hw_error_work` unconditionally overwrites the device wedge meth=
od with `DRM_WEDGE_RECOVERY_BUS_RESET`, clobbering previously set recovery =
methods and sending duplicate wedge events.
--

commit 7bcb91bb7afbf8e7efbb4e0783cf8098239c131e
Author: Riana Tauro <riana.tauro@intel.com>

drm/xe/xe_hw_error: Handle non-fatal errors routed via direct IRQ
   =20
This commit modifies xe_hw_error to process, log, and recover non-fatal err=
ors
routed via direct IRQ. For errors that cannot be recovered locally, the dev=
ice
is wedged using a bus-reset as the recovery action.

> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_=
error.c
> index 5a57b7eaebc3b..a895436f2ce7e 100644
> --- a/drivers/gpu/drm/xe/xe_hw_error.c
> +++ b/drivers/gpu/drm/xe/xe_hw_error.c

[ ... ]

>  static void hw_error_work(struct work_struct *work)
>  {
>  	struct xe_tile *tile =3D container_of(work, typeof(*tile), hw_error_wor=
k);
>  	struct xe_device *xe =3D tile_to_xe(tile);
> =20
> +	if (xe->info.has_sysctrl) {
> +		int ret;
> +
> +		ret =3D xe_ras_process_errors(xe);

[Severity: High]
Does this code access system controller MMIO registers without holding an
active runtime PM reference?

When hw_error_source_handler() schedules hw_error_work() asynchronously, it
doesn't take a runtime PM reference. Once this work executes, it calls
xe_ras_process_errors() which eventually calls xe_sysctrl_send_command().

While xe_sysctrl_send_command() uses guard(xe_pm_runtime_noresume)(xe), this
only increments the usage count and asserts a reference is held; it does not
actually wake a suspended device. If the device transitions to runtime susp=
end
between the hardware error IRQ firing and the workqueue executing, the
subsequent MMIO reads in sysctrl_read_frame() will access powered-down
hardware, potentially causing PCI target aborts, 0xFFFFFFFF reads, or system
hangs.

> +		/* For any non-fatal errors that do not return recovered, declare wedg=
ed */
> +		if (ret) {
> +			xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_BUS_RESET);
> +			xe_device_declare_wedged(xe);

[Severity: Medium]
Can this unconditionally overwrite the device wedge method, clobbering
previously set recovery methods and sending duplicate wedge events?

During xe_ras_process_errors(), functions like handle_soc_internal_errors()
may call xe_survivability_mode_runtime_enable(xe). That function sets the
wedge method to DRM_WEDGE_RECOVERY_VENDOR and declares the device wedged,
before returning XE_RAS_RECOVERY_ACTION_DISCONNECT:

drivers/gpu/drm/xe/xe_ras.c:handle_soc_internal_errors() {
	...
	xe_survivability_mode_runtime_enable(xe);
	return XE_RAS_RECOVERY_ACTION_DISCONNECT;
}

Here, ret (the returned action) is treated as a boolean. By unconditionally
calling xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_BUS_RESET) and
xe_device_declare_wedged(xe) again, the device is presented to userspace wi=
th
an incorrect recovery method (BUS_RESET) instead of the true requirement
(VENDOR), and duplicate uevents are emitted.

> +		}
> +
> +		return;
> +	}
> +
>  	xe_survivability_mode_runtime_enable(xe);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260830065603.4190=
55-5-riana.tauro@intel.com?part=3D3
