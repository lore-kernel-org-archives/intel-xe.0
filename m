Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA67BCCA46C
	for <intel-xe@archiver.kernel.org>; Mon, 19 Oct 2026 03:18:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14A4110E2F6;
	Mon, 19 Oct 2026 03:18:20 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A45610E2F6
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Oct 2026 03:18:14 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id F23AE40F22;
 Mon, 19 Oct 2026 03:18:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A96811F000C4;
 Mon, 19 Oct 2026 03:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1792379893;
 bh=6biWUswt34RIRDUYnutL/p7Q8Z0ZZ1zg2JQL+Hp26jI=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=X/EpXAbalh+5JKmdyIjWt2cbYs7VLqREBnpBcWoydRbvyMzLj47M2PIzXfwZvhWLX
 ynoKMI+nN/KJBUm24hntK6mus1P1OQQtZTJCqtvTLwrk4qQljj3EHd5SFWADU7Lw7E
 g9gXy4UwD588yYBf0KGK9zP6YcIuHuAgtrG/FNtJm//F4oSqKbg56Nh3iSMEQL0eDZ
 XUz4b7tyLTBnNJK+RI4GlOh21ER6UfpdTJN49b1+gqGUpLjx0lCJlkVIG99yXIgdyc
 OVjqlHW0uyMSKA3WPRZamz1zjn4ACCDMid7z48GKYO5XbLqs/9vLk5hVW3ampyDdXz
 lOj4O0A9iLNmg==
Message-ID: <sashiko-outbox-176560@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 1/9] drm/xe/gt: Use GT ordered workqueue for wedging
To: "Raag Jadav" <raag.jadav@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261019023708.128835-2-raag.jadav@intel.com>
References: <20261019023708.128835-1-raag.jadav@intel.com>
 <20261019023708.128835-2-raag.jadav@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 03:18:13 +0000
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
- [High] drm/xe/gt: deadlock on gt->ordered_wq by deferring xe_guc_reset_pr=
epare()
- [High] drm/xe/gt: race in xe_gt_init() leaves GT unwedged on early device=
 wedge
--

commit 2f995deb3d90153d398aa4de2fcfe846b423203b
Author: Raag Jadav <raag.jadav@intel.com>

drm/xe/gt: Use GT ordered workqueue for wedging

This commit defers GT wedge teardown to a worker queued on the GT ordered
workqueue and introduces for_each_initialized_gt() to skip uninitialized
GTs when wedging the device.

> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index bc9bf6f0b5a79..2ed67fe929e34 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c

[ ... ]

> @@ -768,7 +774,7 @@ int xe_gt_init(struct xe_gt *gt)
> =20
>  	err =3D gt_init_with_all_forcewake(gt);
>  	if (err) {
> -		gt_reset_worker_disable(gt);
> +		gt_worker_disable(gt);
>  		return err;
>  	}
> =20
> @@ -784,6 +790,8 @@ int xe_gt_init(struct xe_gt *gt)
>  			return err;
>  	}
> =20
> +	/* Must be last */
> +	WRITE_ONCE(gt->initialized, true);
>  	return 0;
>  }

[Severity: High]
Can setting gt->initialized only at the end of xe_gt_init() cause a GT to
be left unwedged if xe_device_declare_wedged() runs while xe_gt_init() is
still in progress?

In xe_device_probe(), xe_irq_install() runs before the xe_gt_init() loop,
enabling top-level interrupts (such as xe_mert_irq_handler(),
xe_hw_error_irq_handler(), and xe_sysctrl_irq_handler()) and error workers
like csc_hw_error_work. Inside xe_gt_init(), gt_init_with_gt_forcewake()
and gt_init_with_all_forcewake() initialize GuC CT, GuC submission,
gt->tlb_inval, and the migration exec queue, enable GuC communication, and
submit GPU jobs via emit_job_sync() in xe_gt_record_default_lrcs(), all
while gt->initialized is still false.

If xe_device_declare_wedged() is called during this window (from an IRQ or
error worker, from another GT on a multi-GT device, or from a job timeout
or reset failure during xe_gt_record_default_lrcs()):

    xe_device_declare_wedged()
        atomic_xchg(&xe->wedged.flag, 1);
        for_each_initialized_gt(gt, xe, id)
            xe_gt_declare_wedged(gt);

for_each_initialized_gt() skips the GT currently inside xe_gt_init()
because gt->initialized is still false. Once xe->wedged.flag is set,
g2h_read() and __guc_ct_send_locked() reject all GuC CT traffic with
-ENOTRECOVERABLE, but xe_gt_declare_wedged() is never queued for this GT to
abort pending GuC CT requests, TLB invalidation fences, or kernel exec
queues. Furthermore, if xe_gt_init() finishes concurrently with an
asynchronous wedge event, it sets gt->initialized =3D true without checking
xe_device_wedged(xe), leaving the GT active and unwedged on a wedged
device.

> @@ -1204,6 +1212,15 @@ struct xe_hw_engine *xe_gt_any_hw_engine(struct xe=
_gt *gt)
>  	return NULL;
>  }
> =20
> +static void gt_wedge_worker(struct work_struct *w)
> +{
> +	struct xe_gt *gt =3D container_of(w, typeof(*gt), wedge.worker);
> +
> +	xe_uc_declare_wedged(&gt->uc);
> +	xe_tlb_inval_reset(&gt->tlb_inval);
> +	xe_pm_runtime_put(gt_to_xe(gt));
> +}
> +
>  /**
>   * xe_gt_declare_wedged() - Declare GT wedged
>   * @gt: the GT object
> @@ -1213,8 +1230,11 @@ struct xe_hw_engine *xe_gt_any_hw_engine(struct xe=
_gt *gt)
>   */
>  void xe_gt_declare_wedged(struct xe_gt *gt)
>  {
> -	xe_gt_assert(gt, gt_to_xe(gt)->wedged.mode);
> +	struct xe_device *xe =3D gt_to_xe(gt);
> =20
> -	xe_uc_declare_wedged(&gt->uc);
> -	xe_tlb_inval_reset(&gt->tlb_inval);
> +	xe_gt_assert(gt, xe->wedged.mode);
> +
> +	xe_pm_runtime_get_noresume(xe);
> +	if (!queue_work(gt->ordered_wq, &gt->wedge.worker))
> +		xe_pm_runtime_put(xe);
>  }

[Severity: High]
Does deferring xe_uc_reset_prepare() to gt_wedge_worker() risk a deadlock
and 5-second TDR timeouts on gt->ordered_wq?

When xe_device_declare_wedged() sets xe->wedged.flag, g2h_read() and
__guc_ct_send_locked() immediately begin returning -ENOTRECOVERABLE:

drivers/gpu/drm/xe/xe_guc_ct.c:g2h_read() {
    ...
    if (xe_device_wedged(xe))
        return -ENOTRECOVERABLE;
    ...
}

Unlike xe_gt_reset_async(), which calls xe_uc_reset_prepare(&gt->uc) ->
xe_guc_reset_prepare(guc) synchronously before queueing gt->reset.worker on
gt->ordered_wq, xe_gt_declare_wedged() now defers
xe_uc_declare_wedged(&gt->uc) -> xe_guc_declare_wedged(&uc->guc) ->
xe_guc_reset_prepare(guc) (which sets guc->submission_state.stopped and
wakes guc->ct.wq) to gt_wedge_worker() on gt->ordered_wq.

If an exec queue is processing a SUSPEND message on sched->work_process_msg
while q->guc->resume_time =3D=3D RESUME_PENDING or exec_queue_pending_disab=
le(q)
is true, __guc_exec_queue_process_msg_suspend() blocks in an unbounded
wait:

drivers/gpu/drm/xe/xe_guc_submit.c:__guc_exec_queue_process_msg_suspend() {
    ...
    wait_event(guc->ct.wq, vf_recovery(guc) ||
               ((q->guc->resume_time !=3D RESUME_PENDING ||
               xe_guc_read_stopped(guc)) && !exec_queue_pending_disable(q))=
);
    ...
}

Because g2h_read() is blocked by xe_device_wedged(xe), handle_sched_done()
cannot run to clear RESUME_PENDING or PENDING_DISABLE, so work_process_msg
can only wake when xe_guc_read_stopped(guc) becomes true. If
guc_exec_queue_timedout_job() is running on gt->ordered_wq ahead of
gt->wedge.worker, it calls:

    guc_exec_queue_timedout_job()
        xe_sched_submission_stop(sched)
            cancel_work_sync(&sched->work_process_msg);

This blocks gt->ordered_wq waiting for work_process_msg, while
work_process_msg waits on guc->ct.wq for gt_wedge_worker() to set
xe_guc_read_stopped(guc), and gt_wedge_worker() cannot run because it is
queued behind guc_exec_queue_timedout_job() on the single-threaded
gt->ordered_wq.

Even without a concurrent SUSPEND message, when
guc_exec_queue_timedout_job() runs on gt->ordered_wq while xe->wedged.flag
is set, its wait_event_timeout(guc->ct.wq, ..., HZ * 5) calls for pending
enable/disable or G2H receive neither G2H nor xe_guc_read_stopped(guc),
stalling gt->ordered_wq for 5 seconds before taking a spurious devcoredump
and scheduling a GT reset.

Should xe_gt_declare_wedged() call xe_uc_reset_prepare(&gt->uc)
synchronously before queueing gt->wedge.worker, matching
xe_gt_reset_async()?

([ ... ])

 base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
--=20
2.51.2

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019023708.1288=
35-1-raag.jadav@intel.com?part=3D1
