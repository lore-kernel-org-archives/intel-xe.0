Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E48606A330
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 10:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ljZUH9pJ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7D5110FAEB;
	Wed, 18 Nov 2026 10:46:29 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBF9410FAEB
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Nov 2026 10:46:23 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 516E7620FA;
 Wed, 18 Nov 2026 10:46:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1B041F000C7;
 Wed, 18 Nov 2026 10:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794998783;
 bh=YyL8s7Hr7vZIpE3xpYQ9jtebGY4To3dRVm5dbQaiAss=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=ljZUH9pJuTE0Y610a3eq7/O+2c8hSL3HAsoOGmvKOZIC/iUhMtHruy3z9f4Hue3dG
 ie+/DLWWxYOs6h8F542E8xb9h+FsWulpdAGOCkRkz3XmmXWVwXObIgdH5Q12Ab9NME
 8U7Lx/ecnpkHEyDsU9Hd7s4qJ/ageO0/E8sYn3WzLgi8xiALvkEoU0vkoSyjTFlfYr
 TVm4FA2VUCnEJbedn1NDrJg5vYnfykpeswnPdb0kN7I1iAtmQB47pnQDl76rrjlGb7
 xmhz3uuFPcaJQifOrBpDlD/u8NagBnyKZEtkXJvKmK5Q8i16A8g6hV7lUnREZcj4Zi
 kj2yNfE6733CQ==
Message-ID: <sashiko-outbox-220743@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] CI_ONLY: Defer TDR execution while submission is suspended
To: "Arvind Yadav" <arvind.yadav@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261118101543.2210570-1-arvind.yadav@intel.com>
References: <20261118101543.2210570-1-arvind.yadav@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 10:46:22 +0000
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential
issues to consider:
- [Medium] drm/xe: broken TDR and submission recovery on xe_uc_suspend()
  failure
- [Medium] drm/xe: work_tdr left disabled on resume and wedge failure
  paths
- [Medium] drm/xe: infinite busy loop in uc_reset_wait() when suspending
  wedged device
- [Low] drm/xe: CI_ONLY commit markers and undocumented
  xe_device_resume() change
It also noticed 1 related pre-existing issue this patch does not
introduce:
- [High] drm/xe: infinite loop in uc_reset_wait() [1]
--

commit dc721c0cb578b8e8efd82320e9f07c85073891f4
Author: Arvind Yadav <arvind.yadav@intel.com>

> CI_ONLY: Defer TDR execution while submission is suspended
>=20
> CI ONLY...
> guc_exec_queue_stop() can ban a queue with an incomplete job and request
> immediate TDR cleanup. During suspend this runs from the PM thread,
> while the timeout worker runs on gt->ordered_wq. The timeout worker can
> therefore capture engine registers and restart scheduler submission
> while GuC submission is being stopped and the device is powering down.
>=20
> Disable each queue's timeout work before stopping submission. Do this
> from gt->ordered_wq so any running drm_sched_job_timedout() has finished,
> including the pending-list updates outside the Xe timeout callback.
> Keep the GuC stop and suspend operations on the PM caller's thread.
>=20
> Keep timeout work disabled until all queues have been restarted. Also
> disable timeout work on queues created while submission is suspended.
> Re-enable it on suspend failure and teardown abort paths so the new
> disable count cannot prevent cleanup indefinitely.
>=20
> Leave the scheduler timeout value unchanged. An immediate cleanup
> request made while timeout work is disabled still sets it to zero,
> so restarting submission re-arms that cleanup without an extra delay.
>=20
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> Link: https://sashiko.dev/#/bug/linux-449968a5-0b4a-4c5d-acd3-7ced29f0129b
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>

[Severity: Low]
This isn't a bug, but the commit subject and body still contain temporary
"CI_ONLY" markers, and the changelog does not mention or explain the
xe_wedge_declare() change in xe_device_resume().

> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> index 6911c2ac39f82..2de67e4119539 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -1509,8 +1509,13 @@ int xe_device_resume(struct xe_device *xe, bool fl=
r)
> =20
>  	for_each_gt(gt, xe, id) {
>  		err =3D xe_gt_resume(gt);
> -		if (err)
> +		if (err) {
> +			/* GuC boot failed before submission could restart. */
> +			if (!flr && err =3D=3D -ENOEXEC)
> +				xe_wedge_declare(xe, DRM_WEDGE_RECOVERY_REBIND |
> +						 DRM_WEDGE_RECOVERY_BUS_RESET);

[Severity: Medium]
Can declaring the device wedged here while guc->submission_state.stopped
remains 1 cause a later xe_uc_suspend() call to spin forever in
uc_reset_wait()?

When xe_device_resume() fails after xe_uc_suspend() has set
guc->submission_state.stopped to 1, xe_wedge_declare() marks the device
wedged without clearing stopped.  On a subsequent system suspend,
xe_uc_suspend() calls uc_reset_wait(), where xe_guc_submit_reset_wait()
returns immediately because xe_wedged() is true while xe_uc_reset_prepare()
keeps returning 1 because stopped is still set, looping indefinitely
without sleeping.

>  			break;
> +		}
>  	}

[Severity: Medium]
Does work_tdr remain permanently disabled if resume fails along any other
path before xe_guc_submit_start()?

Only !flr && err =3D=3D -ENOEXEC in xe_device_resume() calls xe_wedge_decla=
re().
If xe_pcode_ready() or xe_bo_restore_early() fails earlier, if
xe_gt_resume() fails with another error such as -ETIMEDOUT or -EIO (or skips
remaining GTs after break), if D3Cold runtime resume fails in
xe_pm_runtime_resume(), or if xe->wedged.mode is
XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET or XE_WEDGED_MODE_NEVER,
guc_submit_resume_tdr() is never reached.  Pending jobs on banned or killed
queues then never time out or signal their fences, hanging xe_vm_close() and
show_run_ticks().

[ ... ]

> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index b32ba504041c5..aa154800a8815 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -362,17 +362,41 @@ void xe_uc_suspend_prepare(struct xe_uc *uc)
>  	xe_guc_stop_prepare(&uc->guc);
>  }
> =20
> +struct xe_uc_suspend_work {
> +	struct work_struct work;
> +	struct xe_uc *uc;
> +};
> +
> +static void uc_suspend_work(struct work_struct *w)
> +{
> +	struct xe_uc_suspend_work *suspend =3D
> +		container_of(w, struct xe_uc_suspend_work, work);
> +	xe_guc_submit_suspend_tdr(&suspend->uc->guc);
> +}
> +
>  int xe_uc_suspend(struct xe_uc *uc)
>  {
> +	struct xe_uc_suspend_work suspend =3D { .uc =3D uc };
> +	int err;
> +
>  	/* GuC submission not enabled, nothing to do */
>  	if (!xe_device_uc_enabled(uc_to_xe(uc)))
>  		return 0;
> =20
>  	uc_reset_wait(uc);

[Severity: High]
This problem wasn't introduced by this patch, but can uc_reset_wait() spin
in an infinite loop [1] when suspending a wedged device?

drivers/gpu/drm/xe/xe_uc.c:uc_reset_wait() {
	int ret;

again:
	xe_guc_reset_wait(&uc->guc);

	ret =3D xe_uc_reset_prepare(uc);
	if (ret)
		goto again;
}

If the device is already wedged with guc->submission_state.stopped set to 1,
xe_guc_submit_reset_wait() returns immediately because xe_wedged() is true,
while xe_uc_reset_prepare() atomically sets stopped and returns its previous
value of 1, jumping back to again in a tight non-sleeping loop.

> +
> +	/* Drain the complete timeout worker before examining queue state. */
> +	INIT_WORK_ONSTACK(&suspend.work, uc_suspend_work);
> +	queue_work(uc_to_gt(uc)->ordered_wq, &suspend.work);
> +	flush_work(&suspend.work);
> +	destroy_work_on_stack(&suspend.work);
> =20
>  	xe_uc_stop(uc);
> +	err =3D xe_guc_suspend(&uc->guc);
> +	if (err)
> +		xe_guc_submit_resume_tdr(&uc->guc);
> =20
> -	return xe_guc_suspend(&uc->guc);
> +	return err;
>  }

[Severity: Medium]
If xe_guc_suspend() fails here, is calling xe_guc_submit_resume_tdr() safe
after uc_reset_wait() and xe_uc_stop() have already stopped submission?

By the time xe_guc_suspend() runs, guc->submission_state.stopped is 1, CT is
stopped, and guc_exec_queue_stop() has stopped each queue's scheduler,
cleared EXEC_QUEUE_STATE_REGISTERED and EXEC_QUEUE_STATE_ENABLED, and banned
user queues with started jobs (setting base.timeout to 0).  If
xe_guc_softreset() fails, GuC firmware is still running, so resuming TDR
immediately runs guc_exec_queue_timedout_job() on banned queues: because
REGISTERED and ENABLED were cleared, it skips disabling scheduling in GuC,
signals fences early, restarts the scheduler against a stopped CT, and
frees the queue's guc_id and LRC locally while GuC is still active.

In addition, idle queues remain stopped so later guc_exec_queue_destroy()
calls never process STATIC_MSG_CLEANUP, guc->submission_state.stopped stays
1 so subsequent suspends or GT resets stall, and on multi-GT systems a
suspend failure on a later GT in xe_device_suspend() or
xe_pm_runtime_suspend() leaves work_tdr disabled on earlier GTs that already
completed xe_gt_suspend().

[1] https://sashiko.dev/#/bug/linux-62eea921-894e-4f73-bbf0-ac02cad95b25

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118101543.2210=
570-1-arvind.yadav@intel.com?part=3D1
