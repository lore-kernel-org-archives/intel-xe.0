Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD538606A319
	for <intel-xe@archiver.kernel.org>; Thu, 22 Oct 2026 05:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iSOh3hpC
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8586410E385;
	Thu, 22 Oct 2026 05:27:39 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0028E10E385
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Oct 2026 05:27:33 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 9E43343432;
 Thu, 22 Oct 2026 05:27:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5571F1F000C2;
 Thu, 22 Oct 2026 05:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1792646853;
 bh=BRCNmpr9D8ZPhvfDXBDCXGE0bI5enAXjqs8IWlZ7lhs=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=iSOh3hpCVoxokF8ku0FBjCfFg/mT41Q8T8LY+DLP4QDLI22iFJnMed53wHMcaiKst
 tCEybpvDranltxf5CAipx7grcysKDppNYY2aNnHSaMJs9tYloJO1Iba0qkkuN74ymw
 Fyid1BdukXV51xoF0+kg/VMxo5UWLthLiPGRj0o9vXJiwycdNlt22LjJ7p7wtrVZCk
 nsw8Ea/VZge5lFU4ylq4uFn6w0ob1bR7spSHwnMSKmoWjMha/Nustd1hyfq0q8kPTS
 aqpHniLCQH87uHpX7oRwQ9XrGPkK3Q3Job+7oG+vt6jc2xq0m/eJ0/AvEPS2bwIHqG
 TZCHa1wf1y26w==
Message-ID: <sashiko-outbox-181024@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 9/9] drm/xe/ras: Move xe_ras_process_errors() to xe_ras
To: "Raag Jadav" <raag.jadav@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261022051303.282805-10-raag.jadav@intel.com>
References: <20261022051303.282805-1-raag.jadav@intel.com>
 <20261022051303.282805-10-raag.jadav@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Oct 2026 05:27:32 +0000
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] drm/xe/ras: premature wedging in xe_ras_init() breaks probe and ue=
vent
- [Medium] drm/xe/ras: has_sysctrl guard in xe_ras_init() skips wedge fault=
 injection
--

commit 771b523024397fb017a9ccb51d1f03bc7c878a6b
Author: Raag Jadav <raag.jadav@intel.com>

drm/xe/ras: Move xe_ras_process_errors() to xe_ras

This commit moves the boot-time xe_ras_process_errors() call from the end of
xe_device_probe() in drivers/gpu/drm/xe/xe_device.c into xe_ras_init() in
drivers/gpu/drm/xe/xe_ras.c.

[ ... ]

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
What happens if xe_ras_process_errors() declares the device wedged here in
xe_ras_init(), before xe_gt_init() and drm_dev_register() have run in
xe_device_probe()?

During xe_ras_process_errors(), handle_soc_internal_errors() in
drivers/gpu/drm/xe/xe_ras.c can synchronously wedge the device via
xe_survivability_mode_runtime_enable() or punit_error_handler() (and
xe_fault_wedge_cold_reset() also calls punit_error_handler()):

drivers/gpu/drm/xe/xe_ras.c:handle_soc_internal_errors() {
	...
		if (csc_error->hec_fw_error) {
			...
			xe_survivability_mode_runtime_enable(xe);
			return XE_RAS_RECOVERY_ACTION_DISCONNECT;
		}
	} else if (source->ieh) {
		struct xe_ras_ieh_error *ieh_error =3D (void *)info->details;

		if (ieh_error->global_error_status & XE_RAS_SOC_IEH_PUNIT) {
			...
			punit_error_handler(xe);
			return XE_RAS_RECOVERY_ACTION_DISCONNECT;
		}
}

Both paths call xe_wedge_declare() in drivers/gpu/drm/xe/xe_wedge.c:

drivers/gpu/drm/xe/xe_wedge.c:xe_wedge_declare() {
	if (atomic_xchg(&xe->wedged.flag, 1))
		return;
	...
	schedule_work(&xe->wedged.work);
}

Because xe_ras_init() runs in xe_device_probe() before xe_gt_init() and
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
}

When xe->wedged.flag is set in xe_ras_init(), subsequent firmware load steps
in xe_gt_init() -> gt_init_with_all_forcewake() -> xe_uc_load_hw() fail
because __guc_ct_send_locked() in drivers/gpu/drm/xe/xe_guc_ct.c rejects
transmissions on a wedged device:

drivers/gpu/drm/xe/xe_guc_ct.c:__guc_ct_send_locked() {
	if (xe_wedged(ct_to_xe(ct))) {
		ret =3D -ENOTRECOVERABLE;
		goto out;
	}
}

As a result, xe_gt_record_default_lrcs(), xe_guc_pc_start(), and
xe_guc_rc_enable() fail, aborting xe_gt_init() and xe_device_probe(). That
unwinds devres (including xe_survivability_mode_fini(), removing the runtime
survivability sysfs files created by xe_survivability_mode_runtime_enable())
and leaves the device unbound.

At the same time, wedge_work() in drivers/gpu/drm/xe/xe_wedge.c runs:

drivers/gpu/drm/xe/xe_wedge.c:wedge_work() {
	struct xe_device *xe =3D container_of(work, struct xe_device, wedged.work);

	/* Notify userspace of wedged device */
	drm_dev_wedged_event(&xe->drm, xe->wedged.method, NULL);
}

This invokes kobject_uevent_env() on dev->primary->kdev->kobj before
drm_dev_register() has registered dev->primary->kdev via device_add().

Does this cause boot-time wedging and runtime survivability mode to fail
probe and emit uevents on an unregistered kobject?

[Severity: Medium]
Also, does moving xe_ras_process_errors() into xe_ras_init() break
xe_fault_wedge_cold_reset() fault injection on platforms where
xe->info.has_sysctrl is false?

In drivers/gpu/drm/xe/xe_ras.c, xe_ras_process_errors() checks
xe_fault_wedge_cold_reset() before checking xe->info.has_sysctrl:

drivers/gpu/drm/xe/xe_ras.c:xe_ras_process_errors() {
	if (xe_fault_wedge_cold_reset()) {
		xe_err(xe, "[RAS]: cold-reset wedge injected\n");
		punit_error_handler(xe);
		return XE_RAS_RECOVERY_ACTION_DISCONNECT;
	}

	if (!xe->info.has_sysctrl)
		return XE_RAS_RECOVERY_ACTION_RESET;
}

However, xe_ras_init() returns early when !xe->info.has_sysctrl before
reaching the new xe_ras_process_errors(xe) call:

drivers/gpu/drm/xe/xe_ras.c:xe_ras_init() {
	xe_drm_ras_init(xe);

	if (!xe->info.has_sysctrl)
		return 0;
	...
	xe_ras_process_errors(xe);
}

In addition, is the restored comment above xe_ras_process_errors() stale,
given that handle_soc_internal_errors() in xe_ras_process_errors() itself
handles csc and punit errors to enable runtime survivability mode or wedge
the device?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261022051303.2828=
05-1-raag.jadav@intel.com?part=3D9
