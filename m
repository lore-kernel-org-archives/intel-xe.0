Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 215C8C79F9E
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 08:55:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8CED10E49B;
	Mon,  7 Sep 2026 08:55:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Cp4N8Q9d";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEEFB10E49B
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Sep 2026 08:55:57 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 433FC43FC5;
 Mon,  7 Sep 2026 08:55:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE0D81F00A3A;
 Mon,  7 Sep 2026 08:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788771357;
 bh=OSI48JfL4HjcH3JfHtclyjxIPKvSDUMfC0rhJo3pro0=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=Cp4N8Q9dTYJJMwlJzDFB+/ffKyjQG4Y4nCUb7D8Ik8+FIk1vKA38QQ2EMvQctYI4w
 hHMs3/uFQlmrBmgANl6vMN0WRoXKpe7OKcSvz3GT9LGXB9ORu0+Ko1LUkPzfN1cTry
 zPQHVXJq5kT80sFKzxziAo3paCxSXwP/nDPZKO/8C6YiADlsBllBXfazlNH0sc0D3p
 b4I24TPvxPbtWH0A/1Vxq08j4A5KvG5LUu8z7kOITz7NQYjfyhI2xbjTocWNF4Hey/
 rw36BzT1zunoo8q0zjuRLQn8KGDDnl/1LSq83ZusuTvuHsm8iQbi6oYgZnEZcvmmKb
 c7W+AoFmnDoUw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 5/5] drm/xe/ras: Move xe_ras_process_errors() to xe_ras
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260907083541.2194747-6-raag.jadav@intel.com>
References: <20260907083541.2194747-1-raag.jadav@intel.com>
 <20260907083541.2194747-6-raag.jadav@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 08:55:56 +0000
Message-Id: <20260907085556.EE0D81F00A3A@smtp.kernel.org>
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
- [High] Moving xe_ras_process_errors() earlier in the probe sequence cause=
s WEDGED uevents to be silently dropped and GT-level wedging to be skipped.
- [Medium] Moving xe_ras_process_errors() to xe_ras_init() behind the xe->i=
nfo.has_sysctrl check breaks fault injection for non-sysctrl platforms.
--

commit 09bf5945b56af88ea485174674cf6523adc4c2a4
Author: Raag Jadav <raag.jadav@intel.com>

drm/xe/ras: Move xe_ras_process_errors() to xe_ras

This commit moves the execution of xe_ras_process_errors() from the end
of xe_device_probe() into xe_ras_init().

> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> index 12279ed276297..8b0ea8a48d57b 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c

[ ... ]

> @@ -1148,13 +1148,6 @@ int xe_device_probe(struct xe_device *xe)
> =20
>  	detect_preproduction_hw(xe);
> =20
> -	/*
> -	 * Process and log any errors detected by hardware. Possible results can
> -	 * include declaring the device as wedged, which must be done only after
> -	 * xe_wedge_fini() is registered.
> -	 */
> -	xe_ras_process_errors(xe);
> -
>  	err =3D devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, xe);

> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 2e8eb8856f97b..abf4800ff1e36 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c

[ ... ]

> @@ -933,6 +933,13 @@ void xe_ras_init(struct xe_device *xe)
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

[Severity: High]
Does moving this call into xe_ras_init() cause WEDGED uevents to be silently
dropped and GT-level wedging to be skipped?

Because xe_ras_init() runs early in the probe sequence, before xe_gt_init()
and drm_dev_register() have executed, a boot-time hardware error detected
here (or fault injection) triggers xe_wedge_declare() prematurely.

This synchronously calls xe_gt_wedge_declare() while gt->wedge.worker.func
is still NULL, causing GT wedging to be skipped entirely. Additionally, the
async wedge_work races with drm_dev_register(), leading kobject_uevent_env()
to silently drop the uevent because the DRM device is not yet exposed in
sysfs.

This leaves the device in a partially wedged state where GT components like
GuC continue running, and userspace is not notified of the wedged state.

[Severity: Medium]
Does placing this call behind the xe->info.has_sysctrl check break fault
injection for non-sysctrl platforms?

Earlier in xe_ras_init(), there is an early return:

	if (!xe->info.has_sysctrl)
		return;

Prior to this patch, xe_ras_process_errors() was called unconditionally in
xe_device_probe(), meaning the cold-reset wedge fault injection
(xe_fault_wedge_cold_reset) could be triggered on any platform. Now, the
sysctrl early return bypasses xe_ras_process_errors() entirely on platforms
without sysctrl, which causes a regression in the testing infrastructure.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907083541.2194=
747-1-raag.jadav@intel.com?part=3D5
