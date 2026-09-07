Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AACDC79F89
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 08:54:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06CE010E6F9;
	Mon,  7 Sep 2026 08:54:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="M/HiToqB";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B1C110E6F9
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Sep 2026 08:54:41 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id B9F0F60052;
 Mon,  7 Sep 2026 08:54:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 506041F00A3A;
 Mon,  7 Sep 2026 08:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788771280;
 bh=xuHYMqQ1fxoAMaMYXkV6jHksm/5kJixQor0Yq4smeCM=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=M/HiToqBCnDNECF8crjNNyeULP294D/wWHrgarHS2GS2YJXNIhaccEZeoRTRI/fPm
 XV+c1cluQFCMNQz+JqaCGboE9kkF9qkFEKfj1gA1qg+ZxPzK7GSbtQP49B6wTgQfWh
 WaA1htWE/FB4tuubmJjOExPOIVaxJMv67TuPC4gOCSxJcbmB61ssG6CEhbcHjbKJUW
 5spwx3PjsCG/ddohqv6sJBBUD9K4aSx9EdXlepvKcpd5AZJaFLXvTKZ0oJBdrSnPp5
 2g6BInix65bkUPS8gqS5R8Uadta2crP2BLF5rT24ldXHL5Xr4Zq9Dy7v2nkr1Pp/WJ
 PWcliAODcUjSQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/5] drm/xe: Move xe_device_wedged_fini()
 registration to xe_device_probe_early()
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260907083541.2194747-3-raag.jadav@intel.com>
References: <20260907083541.2194747-1-raag.jadav@intel.com>
 <20260907083541.2194747-3-raag.jadav@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 08:54:39 +0000
Message-Id: <20260907085440.506041F00A3A@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Unbalanced PM runtime reference leak (underflow) during PCI error =
recovery.
- [High] Unbounded memory accumulation (Denial of Service) via `barrier_fau=
lt` dummy page allocation.
- [High] Uninitialized work_struct (`csc_hw_error_work`) on remote tiles le=
ads to kernel panic.
- [High] Uncanceled `csc_hw_error_work` leads to Use-After-Free during driv=
er unload.
--

commit 372b7f6c41961551c6da41044311be66293a0cdb
Author: Raag Jadav <raag.jadav@intel.com>

drm/xe: Move xe_device_wedged_fini() registration to xe_device_probe_early()

This commit moves the registration of the wedged cleanup action to the early
probe phase. This helps prevent a PM reference leak if the driver probe fai=
ls
after the device is declared wedged but before the cleanup was registered.

> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
[ ... ]
> @@ -838,6 +840,10 @@ int xe_device_probe_early(struct xe_device *xe)
>  	if (err)
>  		return err;
> =20
> +	err =3D drmm_add_action_or_reset(&xe->drm, xe_device_wedged_fini, xe);
> +	if (err)
> +		return err;
> +
>  	return 0;
>  }

[Severity: High]
This is a pre-existing issue, but I noticed a potential unbalanced PM runti=
me
reference leak related to the wedged cleanup action being registered here.

In xe_pci_error_slot_reset() within drivers/gpu/drm/xe/xe_pci_error.c, the
wedged flag is forcibly set:

    atomic_set(&xe->wedged.flag, 1);

If a PCI error triggers this, the flag is set to 1 without taking a PM runt=
ime
reference. If the device is hot-unplugged before xe_pci_error_resume() can
clear the flag, xe_device_wedged_fini() will see the flag set during teardo=
wn
and call xe_pm_runtime_put(xe).

Will this cause a PM usage counter underflow?

[Severity: High]
This is a pre-existing issue, but while looking at drmm_add_action_or_reset=
()
usage in this file, I noticed a potential memory accumulation in
barrier_fault() within drivers/gpu/drm/xe/xe_device.c.

When barrier_fault() allocates a dummy page, it registers a cleanup action:

    if (drmm_add_action_or_reset(dev, barrier_release_dummy_page, page))

These callbacks are tied to the drm_device lifecycle. If a device is unplug=
ged
(causing drm_dev_enter to fail) and a local user repeatedly maps, accesses =
to
fault, and unmaps the barrier offset, will this leak memory until the file
descriptor is fully closed?

[Severity: High]
This is a pre-existing issue, but reviewing the hardware error paths reveal=
ed
a potential kernel panic with uninitialized work structures.

In xe_hw_error_init() within drivers/gpu/drm/xe/xe_hw_error.c, the hardware
error work is only initialized for the root tile:

    INIT_WORK(&tile->csc_hw_error_work, csc_hw_error_work);

If a CSC hardware error occurs on a remote tile, xe_hw_error_irq_handler()
attempts to schedule it:

    schedule_work(&tile->csc_hw_error_work);

Could this crash the kernel when the workqueue core manipulates the
uninitialized list on the remote tile?

[Severity: High]
This is a pre-existing issue, but there also appears to be a use-after-free
risk with this same work structure during driver unload.

The work is initialized in xe_hw_error_init() within
drivers/gpu/drm/xe/xe_hw_error.c:

    INIT_WORK(&tile->csc_hw_error_work, csc_hw_error_work);

If a CSC error schedules this work on the global workqueue, and the driver =
is
subsequently unbound (e.g., via hot-unplug or probe failure) before the work
executes, the xe_tile memory structure is freed.

Since there is no corresponding cancel_work_sync() during teardown, can the
worker function access a freed tile pointer when it eventually runs?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907083541.2194=
747-1-raag.jadav@intel.com?part=3D2
