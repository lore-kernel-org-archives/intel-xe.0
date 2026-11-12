Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5406606A321
	for <intel-xe@archiver.kernel.org>; Thu, 12 Nov 2026 09:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F/JJsyp+
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BFCB10E3EB;
	Thu, 12 Nov 2026 09:34:44 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CB8710FF6B
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Nov 2026 09:34:38 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 77E8C63E29;
 Thu, 12 Nov 2026 09:34:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10B2B1F00A05;
 Thu, 12 Nov 2026 09:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794476077;
 bh=Z3g7+uEQ2AWj/I6sm3vIwS5tfx0bRx5OQjFJqqdrwqo=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=F/JJsyp+bx8g2RgGBez5ODDEdV6zGgTTbNSG4ogNHxpuX0eZUPDUKei9jVDeIcN04
 4+4HZfzEvhBT6M/LbMd4ACGyjke2XR1jSSgBSYzIuR8jHAVnLjMNoVGXLzKNE/7f3W
 JKJr3cHyr80NclywEn+YGkDCKZEhCPJQPH1dLn3ri52ykQkNT4FSST1PJUfcYStZnm
 dnAY4oTklWbpYY01QzprGeAZNnhvlU/eLl5jTsHCicERj/9+976TaBDUE6o2hac8ud
 Y0tGLpbdoPWPteoGnYnC0MD2jtxvuRWYxAlNgGl8cywBAycDWO/AP4x3viC4+KFHdz
 5xMllc/wGHqyA==
Message-ID: <sashiko-outbox-210889@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v15 07/10] drm/xe/pm: Introduce xe_device_suspend/resume()
To: "Raag Jadav" <raag.jadav@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261112091033.1813803-8-raag.jadav@intel.com>
References: <20261112091033.1813803-1-raag.jadav@intel.com>
 <20261112091033.1813803-8-raag.jadav@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 09:34:36 +0000
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] drm/xe: unsynchronized scheduler queues in xe_device_suspend()
  FLR path
--

commit c71f7f644880cbc637ea5422a742aa32f1fd9820
Author: Raag Jadav <raag.jadav@intel.com>

drm/xe/pm: Introduce xe_device_suspend/resume()

This commit factors out xe_device_suspend() and xe_device_resume() from
xe_pm_suspend() and xe_pm_resume(), adding an flr flag to handle PCIe FLR
preparation and re-initialization alongside system suspend and resume.

> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> index 273e2c45fea9b..6911c2ac39f82 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
[ ... ]
> @@ -1384,3 +1385,157 @@ void xe_device_exit(void)
>  		wait_var_event(&xe_device_count, !atomic_read(&xe_device_count));
>  	}
>  }
> +
> +/**
> + * xe_device_suspend() - Common helper for system suspend and FLR prepare
> + * @xe: xe device instance
> + * @hibernate: true if preparing for S4 hibernation, false for < S4 susp=
end
> + * @flr: indicate FLR prepare
> + *
> + * Return: 0 on success, negative error code otherwise.
> + */
> +int xe_device_suspend(struct xe_device *xe, bool hibernate, bool flr)
> +{
> +	struct xe_gt *gt;
> +	u8 id;
> +	int err;
> +
> +	err =3D xe_pxp_pm_suspend(xe->pxp);
> +	if (err)
> +		return err;
> +
> +	xe_late_bind_pm_suspend(&xe->late_bind);
> +
> +	for_each_gt(gt, xe, id)
> +		xe_gt_suspend_prepare(gt);
> +
> +	if (flr) {
> +		for_each_gt(gt, xe, id)
> +			xe_gt_flr_prepare(gt);

[Severity: High]
Can xe_gt_flr_prepare() -> xe_uc_flr_prepare() race with
sched->base.submit_wq when aborting in-flight GuC jobs during FLR, causing
either an infinite zero-delay work_tdr livelock on gt->ordered_wq or a
failed drm_sched_is_stopped() assertion in xe_sched_reinit() on resume?

xe_uc_flr_prepare() queues and flushes uc_flr_prepare() on gt->ordered_wq,
and immediately queues and flushes uc_flr_sanitize() on the same
gt->ordered_wq:

drivers/gpu/drm/xe/xe_uc.c:xe_uc_flr_prepare() {
    ...
	INIT_WORK_ONSTACK(&flr.work, uc_flr_prepare);
	queue_work(gt->ordered_wq, &flr.work);
	flush_work(&flr.work);
	destroy_work_on_stack(&flr.work);

	INIT_WORK_ONSTACK(&flr.work, uc_flr_sanitize);
	queue_work(gt->ordered_wq, &flr.work);
	flush_work(&flr.work);
	destroy_work_on_stack(&flr.work);
}

uc_flr_prepare() calls xe_guc_submit_pause_abort(), which starts scheduler
submission (queuing work_run_job and work_free_job on sched->base.submit_wq,
a separate workqueue from gt->ordered_wq) and kills each queue via
xe_sched_tdr_queue_imm(), setting sched->base.timeout =3D 0 and queuing
work_tdr with delay 0 on gt->ordered_wq:

gt->ordered_wq                    sched->base.submit_wq
--------------                    ---------------------
uc_flr_prepare()
  xe_guc_submit_pause_abort()
    xe_sched_submission_start()
    guc_exec_queue_kill()
      xe_sched_tdr_queue_imm()
        sched->base.timeout =3D 0
        queue work_tdr (delay 0)
drm_sched_job_timedout()
  guc_exec_queue_timedout_job()
    dma_fence_set_error(-ETIME)
    return DRM_GPU_SCHED_STAT_NO_HANG
  drm_sched_job_reinsert_on_false_timeout()
    list_add(&job->list, &pending_list)
    queue work_free_job --------->
  drm_sched_start_timeout_unlocked()
    queue work_tdr (delay 0)
uc_flr_sanitize()
  xe_guc_stop()
    drm_sched_wqueue_stop()
      sched->base.pause_submit =3D true
      cancel_work_sync(&work_free_job)
                                  (work_free_job cancelled before running)
drm_sched_job_timedout()
  guc_exec_queue_timedout_job()
    (fence already signaled, returns NO_HANG)
  drm_sched_job_reinsert_on_false_timeout()
    (drm_sched_is_stopped() is true, work_free_job not queued)
  drm_sched_start_timeout_unlocked()
    queue work_tdr (delay 0)      <-- infinite livelock on gt->ordered_wq

Conversely, if a job was still queued in entity->job_queue when
uc_flr_prepare() ran, work_run_job on sched->base.submit_wq can pop it into
pending_list and queue work_tdr on gt->ordered_wq behind uc_flr_sanitize().
After uc_flr_sanitize() stops the scheduler, work_tdr runs
guc_exec_queue_timedout_job(), which calls xe_sched_submission_start() and
leaves pause_submit false, tripping
xe_gt_assert(ge->q->gt, drm_sched_is_stopped(&sched->base)) in
xe_sched_reinit() during xe_device_resume(xe, true).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112091033.1813=
803-1-raag.jadav@intel.com?part=3D7
