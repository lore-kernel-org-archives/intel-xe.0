Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B223CCA490
	for <intel-xe@archiver.kernel.org>; Mon, 19 Oct 2026 02:48:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6BE410E74F;
	Mon, 19 Oct 2026 02:48:42 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA1F110E74F
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Oct 2026 02:48:36 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 810BC42D8E;
 Mon, 19 Oct 2026 02:48:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44CA71F000C4;
 Mon, 19 Oct 2026 02:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1792378116;
 bh=rwdZEABmvnMquqqbScya0d3PGNZOTqWJLLqBpF5zFuA=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=DAPq2d+47U+Tzkz//LpaR4lKSi9oOMtSsZ/89sJpiDXVLQbWdIv4jdsAQCERrYPNV
 G7+a/a+vpxRqmTFenH3NUv776GneZTQHVx/++kL+pVI2BDegVgTfLm8dyah0HEoqu4
 Ydj/OFw/+SRJQEr65WUVsBPwME3RY7FV4p9weOeHSyIpdFGDg7oFwY1lOg5ZLRE5P3
 oQCnnrNZ4gI3jRSENkR5BA4mv9MnOTGVWsjwlvZggRSprmVj5XBfWtCmGKUPXwa76L
 mqEONd4s+hrR5Iay7/dwFQrZYX5rfnXViWYaoGhGysPI19yoDYuXNLUKENFm301OAe
 OLMVEheGEia/A==
Message-ID: <sashiko-outbox-176550@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 9/9] drm/xe/ras: Move xe_ras_process_errors() to xe_ras
To: "Raag Jadav" <raag.jadav@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261019023708.128835-10-raag.jadav@intel.com>
References: <20261019023708.128835-1-raag.jadav@intel.com>
 <20261019023708.128835-10-raag.jadav@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 02:48:35 +0000
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
- [High] drm/xe/ras: early wedging in xe_ras_init() breaks probe and wedged=
 uevent
--

commit 8cceca0f947439603841861a5aee7e3dd4918b92
Author: Raag Jadav <raag.jadav@intel.com>

drm/xe/ras: Move xe_ras_process_errors() to xe_ras

This commit moves the boot-time xe_ras_process_errors() call from the end of
xe_device_probe() back into xe_ras_init(), reverting commit 20bc4883c7c0
("drm/xe/ras: Fix boot-time ras error processing") now that xe_wedge_fini()
is registered in xe_device_probe_early().

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
Can calling xe_ras_process_errors() inside xe_ras_init() break driver probe
and wedged uevent delivery when an error triggers device wedging?

In xe_ras_process_errors(), a boot-time CSC firmware error or Punit IEH err=
or
in handle_soc_internal_errors(), or cold-reset wedge fault injection via
xe_fault_wedge_cold_reset(), calls into xe_wedge_declare():

xe_ras_process_errors()
  -> handle_soc_internal_errors() / punit_error_handler()
     -> xe_survivability_mode_runtime_enable() / punit_error_handler()
        -> xe_wedge_declare()

In xe_device_probe(), xe_ras_init() runs before xe_gt_init() and
drm_dev_register():

drivers/gpu/drm/xe/xe_device.c:xe_device_probe() {
	...
	err =3D xe_ras_init(xe);
	if (err)
		return err;
	...
	for_each_gt(gt, xe, id) {
		err =3D xe_gt_init(gt);
		if (err)
			return err;
	}
	...
	err =3D drm_dev_register(&xe->drm, 0);
	if (err)
		return err;
}

When xe_wedge_declare() runs during xe_ras_init(), it sets xe->wedged.flag =
to
1 and schedules xe->wedged.work.

First, when xe_device_probe() subsequently calls xe_gt_init() ->
gt_init_with_all_forcewake() -> xe_uc_load_hw(), GuC CT communication checks
xe_wedged() in __guc_ct_send_locked() and g2h_read():

drivers/gpu/drm/xe/xe_guc_ct.c:__guc_ct_send_locked() {
	if (xe_wedged(ct_to_xe(ct))) {
		ret =3D -ENOTRECOVERABLE;
		goto out;
	}
}

Because xe_wedged() is already true, GuC initialization steps such as
xe_gt_record_default_lrcs() and xe_guc_post_load_init() fail with
-ENOTRECOVERABLE. Doesn't this abort xe_gt_init() and xe_device_probe(),
unbinding the driver and tearing down the runtime survivability sysfs files
created by xe_survivability_mode_runtime_enable() instead of keeping the
device bound in wedged mode?

Second, xe_wedge_declare() schedules wedge_work(), which calls
drm_dev_wedged_event(&xe->drm, xe->wedged.method, NULL) to emit a KOBJ_CHAN=
GE
uevent on xe->drm.primary->kdev->kobj. Since drm_dev_register() ->
drm_minor_register() -> device_add() has not run yet, won't this attempt to
send the uevent before the primary DRM minor device is registered in sysfs?

Also, since xe_ras_init() returns early when !xe->info.has_sysctrl, doesn't
moving xe_ras_process_errors() after that check bypass the
xe_fault_wedge_cold_reset() fault-injection path on platforms without
has_sysctrl?

> +
>  	ret =3D devm_device_add_group(xe->drm.dev, &gpu_health_group);
>  	if (ret)
>  		xe_err(xe, "Failed to create GPU health sysfs, err=3D%d\n", ret);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019023708.1288=
35-1-raag.jadav@intel.com?part=3D9
