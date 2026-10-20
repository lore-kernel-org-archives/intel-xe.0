Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5BC6606A31A
	for <intel-xe@archiver.kernel.org>; Tue, 20 Oct 2026 09:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dak53NnV
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C4C910E5AC;
	Tue, 20 Oct 2026 09:28:06 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB9AA10EBA1
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Oct 2026 09:28:00 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 9D9064356A;
 Tue, 20 Oct 2026 09:28:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B5951F000C5;
 Tue, 20 Oct 2026 09:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1792488480;
 bh=qZgVc0YDbVnHcfJgjxOhdm265+Ok8yxKHQhFn0RMmeM=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=dak53NnV0e11XG4DMKPA4mIbXg3IDr7Ory1i720eKiRb5M2CpFbINmBcaxxXcqnya
 eX/NG8A057Qf28w2LwSjlfIAoKVl0E0e7vy1xfNG/C0HB4G8JG4ysjSNs+2z3u62Td
 4S29wS/TsFvcSHLfVvQWPe5x1S94HrqpkdwpHEp2YtzeQu//G/Z0jdSByD+V83l63y
 60GEiqaWWLdNr1sbg2E4iuj4g3llvURdD68KKw0sG7ORrcz+bY/Y5v1NyVy6kIvQ5D
 s0c00/HWruMdBoBO87LEXk/h6ZcSUgHf4Ks5u2VO7S74IBCF62VhkPJ/usdAv//GLW
 ibUnKNNYbkP0g==
Message-ID: <sashiko-outbox-178736@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 9/9] drm/xe/ras: Move xe_ras_process_errors() to xe_ras
To: "Raag Jadav" <raag.jadav@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261020023641.200658-10-raag.jadav@intel.com>
References: <20261020023641.200658-1-raag.jadav@intel.com>
 <20261020023641.200658-10-raag.jadav@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 09:27:59 +0000
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	T_PDS_OTHER_BAD_TLD autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] drm/xe/ras: early wedging in xe_ras_init() breaks GT init and DRM =
registration
--

commit 9ceb08e30ef3aa269ebad9c4f296fb67c41a76af
Author: Raag Jadav <raag.jadav@intel.com>

drm/xe/ras: Move xe_ras_process_errors() to xe_ras

This commit moves the boot-time call to xe_ras_process_errors() from the end
of xe_device_probe() back into xe_ras_init(), reverting commit 20bc4883c7c0
("drm/xe/ras: Fix boot-time ras error processing") now that xe_wedge_fini()
is registered during xe_device_probe_early().

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
Can moving xe_ras_process_errors() into xe_ras_init() break probe when a
boot-time RAS error or cold-reset wedge fault injection declares the device
wedged?

While registering xe_wedge_fini() in xe_device_probe_early() resolves the PM
reference cleanup issue, xe_ras_init() still runs in xe_device_probe() befo=
re
both xe_gt_init() and drm_dev_register():

drivers/gpu/drm/xe/xe_device.c:xe_device_probe() {
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
}

Inside xe_ras_process_errors(), xe_wedge_declare() can be called via three
paths:
  - handle_soc_internal_errors() -> xe_survivability_mode_runtime_enable() =
on
    a CSC firmware error (csc_error->hec_fw_error)
  - handle_soc_internal_errors() -> punit_error_handler() on an IEH Punit
    error (XE_RAS_SOC_IEH_PUNIT)
  - xe_fault_wedge_cold_reset() -> punit_error_handler()

When xe_wedge_declare() runs during xe_ras_init(), it sets xe->wedged.flag =
=3D 1
and schedules xe->wedged.work (wedge_work):

drivers/gpu/drm/xe/xe_wedge.c:xe_wedge_declare() {
	if (atomic_xchg(&xe->wedged.flag, 1))
		return;
	...
	for_each_initialized_gt(gt, xe, id)
		xe_gt_wedge_declare(gt);
	...
	schedule_work(&xe->wedged.work);
}

Because xe_ras_init() returns 0, xe_device_probe() continues into
xe_gt_init() -> gt_init_with_all_forcewake() -> xe_uc_load_hw(). With
xe_wedged(xe) already set, guc_exec_queue_run_job() drops submissions (caus=
ing
xe_gt_record_default_lrcs() / emit_wa_job() to time out with -ETIME), and
__guc_ct_send_locked() fails immediately:

drivers/gpu/drm/xe/xe_guc_ct.c:__guc_ct_send_locked() {
	if (xe_wedged(ct_to_xe(ct))) {
		ret =3D -ENOTRECOVERABLE;
		goto out;
	}
}

That causes xe_guc_post_load_init(), xe_guc_pc_start(), and xe_guc_rc_enabl=
e()
to fail, aborting xe_gt_init() and xe_device_probe() and unwinding devres
actions (including xe_survivability_mode_fini(), which removes the runtime
survivability sysfs attributes just created by
xe_survivability_mode_runtime_enable()).

Concurrently, wedge_work() invokes drm_dev_wedged_event(), which sends a
KOBJ_CHANGE uevent on dev->primary->kdev->kobj before drm_dev_register() ->
drm_minor_register() -> device_add() has registered the primary minor devic=
e:

drivers/gpu/drm/xe/xe_wedge.c:wedge_work()
  -> drm_dev_wedged_event(&xe->drm, xe->wedged.method, NULL)
       -> kobject_uevent_env(&dev->primary->kdev->kobj, KOBJ_CHANGE, envp)

In addition,xe_ras_init() returns early when !xe->info.has_sysctrl before
reaching xe_ras_process_errors(), whereas xe_ras_process_errors() checks
xe_fault_wedge_cold_reset() before checking !xe->info.has_sysctrl:

drivers/gpu/drm/xe/xe_ras.c:xe_ras_process_errors() {
	if (xe_fault_wedge_cold_reset()) {
		xe_err(xe, "[RAS]: cold-reset wedge injected\n");
		punit_error_handler(xe);
		return XE_RAS_RECOVERY_ACTION_DISCONNECT;
	}

	if (!xe->info.has_sysctrl)
		return XE_RAS_RECOVERY_ACTION_RESET;
}

Does moving this call into xe_ras_init() also bypass cold-reset wedge fault
injection on platforms without sysctrl?

> +
>  	ret =3D devm_device_add_group(xe->drm.dev, &gpu_health_group);
>  	if (ret)
>  		xe_err(xe, "Failed to create GPU health sysfs, err=3D%d\n", ret);

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020023641.2006=
58-1-raag.jadav@intel.com?part=3D9
