Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BF6ECC6B38
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 03:36:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3033210E3F9;
	Fri, 16 Oct 2026 03:36:32 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1D4D10E3F9
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Oct 2026 03:36:25 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 22231600D4;
 Fri, 16 Oct 2026 03:36:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD94D1F000C4;
 Fri, 16 Oct 2026 03:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1792121784;
 bh=V+v9RjwCqHVJXH6lgOYbIN49OYpmSVTxb+5EWtv7nRI=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=CzigE+BwzBtiZVBb9shNE64PNM2veGa5QN1k4fMqXuA8oy88qdrfT1ZNbzQGy9yh2
 D2DwNBcxsuVcewmlJEfYkfvbPXuZzq5IntEJUpVK/EssFI/RLgZf0m/zegl250ZZAf
 169jhnyFgoZFWTHtkwmZvA24ZTAvk/2wWqLKlBG8YIlFeT9j2/H6IbKNL1vUpqKpaM
 E9NPiAKPDXX1agTgNWBJij622gOO1mWCo7CCWTIAv74GsZmHpydxt1h5YTCgPXjSxQ
 9Yv59IORycuzCEiWbD5qTb+55c+fn6zh9QIcFsQWnxN7jbI84PdNTentWjZqXoODaF
 koiiXIJGGlxFg==
Message-ID: <sashiko-outbox-173680@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 7/7] drm/xe/ras: Move xe_ras_process_errors() to xe_ras
To: "Raag Jadav" <raag.jadav@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261016031559.427941-8-raag.jadav@intel.com>
References: <20261016031559.427941-1-raag.jadav@intel.com>
 <20261016031559.427941-8-raag.jadav@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 03:36:24 +0000
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
- [High] drm/xe: early wedging from ras drops uevent and aborts probe
--

commit 4c0f3e5505fa3f5df25ea28082e7cca0e36630d7
Author: Raag Jadav <raag.jadav@intel.com>

drm/xe/ras: Move xe_ras_process_errors() to xe_ras

This commit moves xe_ras_process_errors() back to xe_ras_init(), reverting
a previous change now that xe_wedge_fini() is handled earlier in the probe.

> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 0072bb4cc5dfe..db3cbc186a514 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -1212,6 +1212,13 @@ int xe_ras_init(struct xe_device *xe)
>  	get_offline_list(xe);
>  	get_offline_queue(xe);
> =20
> +	/*
> +	 * During probe, process and log any errors detected by firmware while =
the driver was not
> +	 * loaded. Critical errors such as Punit and CSC are reported through P=
code init failure,
> +	 * causing the driver to enter survivability mode.
> +	 */
> +	xe_ras_process_errors(xe);

[Severity: High]
Does moving this call to xe_ras_init() early in the probe sequence cause
issues when encountering a critical error?

If xe_ras_process_errors() finds a critical error, it declares the device
wedged, which schedules wedged.work.

This work calls drm_dev_wedged_event() which sends a uevent. However, since
drm_dev_register() has not yet run at this point, the kobject is not
in sysfs and the uevent will be silently dropped.

Furthermore, will declaring the device wedged this early cause subsequent
probe steps to fail? For example:

xe_gt_init()
  xe_uc_load_hw()
    xe_guc_pc_start()
      pc_action_reset()
        xe_guc_ct_send()

xe_guc_ct_send() will return -ENOTRECOVERABLE instead of -ECANCELED
because the device is wedged. This error propagates up, completely aborting
xe_device_probe(), causing the driver to unbind rather than entering
survivability mode as intended.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016031559.4279=
41-1-raag.jadav@intel.com?part=3D7
