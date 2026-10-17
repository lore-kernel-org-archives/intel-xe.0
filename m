Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D09B5CCA463
	for <intel-xe@archiver.kernel.org>; Sat, 17 Oct 2026 04:01:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5345810E1E5;
	Sat, 17 Oct 2026 04:01:00 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9619110E1F9
 for <intel-xe@lists.freedesktop.org>; Sat, 17 Oct 2026 04:00:54 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 4D5BE408E9;
 Sat, 17 Oct 2026 04:00:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D230E1F000C4;
 Sat, 17 Oct 2026 04:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1792209654;
 bh=b+7++6ajfvxyLdn2/TZde+yZqHVZIUInY1aMG4iCs7U=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=jXaBatyDzzKeOhDvoAx07hfmWOZ6x/zxtsOIpd7D2DWbMfNVwLBKDG/+ZqFMq3tZr
 F17c0D02SWsIxNm4yy4rmlmGkb+dVyEzS9wzd8cFsG4nSNb0WddctBKntqhwrtQ2sh
 +LSVDMuARfm26fSacu2IhbFjfOy/ZLNIHm7+yzQn1gOUxXEYuOaQcZ4UejYYr8bA+n
 vCy7NYREybTqXm0B8jYpKBIFppsDGZp4KRsi9p863Ag5eyFgfZVCmxtIUjEdJKDA4G
 cSJF1yipXAlHyxX1DqXCZV99BStsDaMhu3E7xWNcpGSqRKjgmTwnDW2PhpZkbuxx3s
 QeV7nXa/Eo4oQ==
Message-ID: <sashiko-outbox-175280@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 9/9] drm/xe/ras: Move xe_ras_process_errors() to xe_ras
To: "Raag Jadav" <raag.jadav@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261017034842.67054-10-raag.jadav@intel.com>
References: <20261017034842.67054-1-raag.jadav@intel.com>
 <20261017034842.67054-10-raag.jadav@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 17 Oct 2026 04:00:53 +0000
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
- [High] drm/xe/ras: early wedging in xe_ras_init() breaks xe_gt_init() and=
 uevent
- [Medium] drm/xe/ras: xe_ras_init() skips xe_ras_process_errors() when !ha=
s_sysctrl
--

commit 28828164c7b9a221bd760c7ef57cdad077ccda45
Author: Raag Jadav <raag.jadav@intel.com>

drm/xe/ras: Move xe_ras_process_errors() to xe_ras

This commit moves the boot-time call to xe_ras_process_errors() from the end
of xe_device_probe() back into xe_ras_init().

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
and DRM uevent generation when an error wedges the device?

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
	...
}

When xe_ras_process_errors() detects a boot-time SoC CSC firmware error
(hec_fw_error) or Punit IEH error (XE_RAS_SOC_IEH_PUNIT) in
handle_soc_internal_errors(), or when xe_fault_wedge_cold_reset() triggers,
it calls xe_survivability_mode_runtime_enable() or punit_error_handler(),
both of which invoke xe_wedge_declare().

In xe_wedge_declare(), it sets xe->wedged.flag =3D 1, iterates initialized =
GTs,
and schedules wedge_work():

drivers/gpu/drm/xe/xe_wedge.c:xe_wedge_declare() {
	if (atomic_xchg(&xe->wedged.flag, 1))
		return;
	...
	for_each_initialized_gt(gt, xe, id)
		xe_gt_wedge_declare(gt);
	...
	schedule_work(&xe->wedged.work);
}

Because xe_gt_init() has not run yet, gt->initialized is still false for all
GTs, so xe_gt_wedge_declare() is skipped. Then, when xe_device_probe() calls
xe_gt_init() -> gt_init_with_all_forcewake() -> xe_uc_load_hw(), subsequent
GuC CT messages in xe_gt_record_default_lrcs(), xe_guc_post_load_init(),
xe_guc_pc_start(), and xe_guc_rc_enable() fail in __guc_ct_send_locked():

drivers/gpu/drm/xe/xe_guc_ct.c:__guc_ct_send_locked() {
	if (xe_wedged(ct_to_xe(ct))) {
		ret =3D -ENOTRECOVERABLE;
		goto out;
	}
	...
}

This causes xe_gt_init() and xe_device_probe() to abort with -ETIME or
-ENOTRECOVERABLE, tearing down the device and removing the runtime
survivability sysfs attributes instead of keeping the device bound in a
wedged state.

In addition, wedge_work() calls drm_dev_wedged_event(&xe->drm, ...) before
drm_dev_register() has called device_add() on xe->drm.primary->kdev, emitti=
ng
KOBJ_CHANGE on an unregistered kobject prior to KOBJ_ADD. Commit 20bc4883c7=
c0
("drm/xe/ras: Fix boot-time ras error processing") noted that both wedged
cleanup hooks and DRM device registration are required before
xe_ras_process_errors() can declare the device wedged.

[Severity: Medium]
Also in xe_ras_init(), does placing xe_ras_process_errors() after the
!xe->info.has_sysctrl check prevent cold-reset wedge fault injection on
platforms without a system controller?

In xe_ras_process_errors(), xe_fault_wedge_cold_reset() is checked before
!xe->info.has_sysctrl:

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

However, xe_ras_init() returns early when !xe->info.has_sysctrl:

drivers/gpu/drm/xe/xe_ras.c:xe_ras_init() {
	xe_drm_ras_init(xe);

	if (!xe->info.has_sysctrl)
		return 0;
	...
	xe_ras_process_errors(xe);
}

With xe_ras_process_errors() moved here from xe_device_probe(),
xe_fault_wedge_cold_reset() is never reached during probe when
xe->info.has_sysctrl is false.

> +
>  	ret =3D devm_device_add_group(xe->drm.dev, &gpu_health_group);
>  	if (ret)
>  		xe_err(xe, "Failed to create GPU health sysfs, err=3D%d\n", ret);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261017034842.6705=
4-1-raag.jadav@intel.com?part=3D9
