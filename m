Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07FE9CCF2C3
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 20:28:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B05FA10E3B4;
	Fri, 16 Oct 2026 20:28:09 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79C1110E3B4
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Oct 2026 20:28:03 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 701D96022E;
 Fri, 16 Oct 2026 20:28:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07C4B1F000C4;
 Fri, 16 Oct 2026 20:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1792182482;
 bh=unzoB8fWX6AL8ASI0fX2kd+ArMaMBXpIgQt8oTqLuPc=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=h2LYgNkjjor/TtOx6OLfp5HRyWtK6R9ftkh7QGFQuFFUHH9MqMTUJy8Y00Nd2QD2N
 B16aCpfs631oF2deADWboUKgtCMhfjuQMD/A2g1Ij45vdxXNyUeP6EhCld7N5/Hx32
 W6mLmkaL1WVpWrzYtuI9lA5vli1gxjNBPjeXGeaZNxrVi8fMXCPYs23ULj/1+Ptde6
 CanbySJ6UBHGwv9RvZye4+GDNl9+UqwPOYVh7Ftjjzs7OuKp2L4oor5YrUgqO2LMmk
 eUQMD0Pkw3J+aItm35SG5tQurY1bUFcMbtHdOjEVApz/hvIn1eZiHGeEWOqB5g19PU
 dIz6RqT5KDi9A==
Message-ID: <sashiko-outbox-174913@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/3] drm/xe: Disable scheduling early on FD close to
 avoid CAT error cascade
To: "Daniel Charles" <daniel.charles@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261016195904.1377149-3-daniel.charles@intel.com>
References: <20261016195904.1377149-1-daniel.charles@intel.com>
 <20261016195904.1377149-3-daniel.charles@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 20:28:01 +0000
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
- [High] drm/xe: missing killed check in guc_exec_queue_run_job() after ear=
ly disable
- [High] drm/xe: __guc_exec_queue_process_msg_kill() disables live multi-qu=
eue primary
- [High] drm/xe: missing ct.wq wakeup in handle_sched_done() for killed que=
ues
- [High] drm/xe: guc_exec_queue_kill() called on zero-refcount queue in pau=
se_abort
--

commit f3abc41f0625f68bc7ba67b2b80c949770c16076
Author: Matthew Brost <matthew.brost@intel.com>

drm/xe: Disable scheduling early on FD close to avoid CAT error cascade

This commit adds a STATIC_MSG_KILL scheduler message sent from
guc_exec_queue_kill() to disable GuC context scheduling ahead of the
serialized TDR cleanup path when an exec queue is killed.

> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_g=
uc_submit.c
> index 924024f6d0b24..1fbc8cd767675 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -2058,12 +2058,45 @@ static void __guc_exec_queue_process_msg_cgp_sync=
(struct xe_sched_msg *msg,
>  		guc_exec_queue_send_cgp_sync(q, 0);
>  }
> =20
> +static void __guc_exec_queue_process_msg_kill(struct xe_sched_msg *msg,
> +					      bool bound)
> +{
> +	struct xe_exec_queue *q =3D msg->private_data;
> +	struct xe_exec_queue *primary =3D xe_exec_queue_multi_queue_primary(q);

[Severity: High]
What happens in __guc_exec_queue_process_msg_kill() when a single secondary
queue in an active multi-queue group is killed via
xe_exec_queue_destroy_ioctl() or the error path of
xe_exec_queue_create_ioctl() while the primary queue remains active?

In xe_exec_queue_destroy_ioctl():

drivers/gpu/drm/xe/xe_exec_queue.c:xe_exec_queue_destroy_ioctl() {
	...
	xe_exec_queue_kill(q);

	trace_xe_exec_queue_close(q);
	xe_exec_queue_put(q);
	...
}

guc_exec_queue_kill() queues the KILL message before xe_exec_queue_put(q) is
called (and in preempt-fence mode, q->lr.pfence also holds a reference on q
until preempt_fence_work_func() runs). When __guc_exec_queue_process_msg_ki=
ll()
processes that secondary queue's message while kref_read(&q->refcount) is
non-zero, it resolves primary =3D xe_exec_queue_multi_queue_primary(q) and =
calls
disable_scheduling(primary, true) on the live, non-killed primary queue:

drivers/gpu/drm/xe/xe_guc_submit.c:disable_scheduling() {
	...
	if (immediate && !xe_exec_queue_is_multi_queue_secondary(q))
		set_min_preemption_timeout(guc, q);
	clear_exec_queue_enabled(q);
	set_exec_queue_pending_disable(q);
	...
}

Doesn't this overwrite the live primary context's preemption timeout to 1us,
disable GuC scheduling for the entire active multi-queue group, and leave
EXEC_QUEUE_STATE_PENDING_DISABLE set on the non-killed primary queue? If
subsequent jobs run or the primary queue is resumed while that disable is in
flight, guc_exec_queue_run_job() and enable_scheduling() will hit
xe_gt_assert() on exec_queue_pending_disable(primary), or submit_exec_queue=
()
will see !exec_queue_enabled(primary) and send a concurrent
GUC_CONTEXT_ENABLE while GUC_CONTEXT_DISABLE is still pending.

> +	struct xe_guc *guc =3D exec_queue_to_guc(primary);
> +	int ret;
> +
> +	/* At zero references, the queued CLEANUP message handles disabling. */
> +	if (!kref_read(&q->refcount) || !bound || exec_queue_wedged(q))
> +		return;
> +
> +	ret =3D wait_event_timeout(guc->ct.wq,
> +				 (!exec_queue_pending_enable(primary) &&
> +				  !exec_queue_pending_disable(primary)) ||
> +				 xe_guc_read_stopped(guc) ||
> +				 vf_recovery(guc), HZ * 5);
> +	if (!ret && !vf_recovery(guc)) {
> +		xe_gt_warn(primary->gt, "Pending enable/disable failed to respond on k=
ill, guc_id=3D%d\n",
> +			   primary->guc->id);
> +		xe_gt_reset_async(primary->gt);
> +		xe_sched_tdr_queue_imm(&q->guc->sched);
> +		return;
> +	}
> +
> +	if (xe_guc_read_stopped(guc) || vf_recovery(guc))
> +		return;
> +
> +	if (exec_queue_enabled(primary))
> +		disable_scheduling(primary, true);
> +}

[Severity: High]
Can calling disable_scheduling(primary, true) here before TDR stops the
scheduler trip the state assertion in guc_exec_queue_run_job()?

Prior to this change, EXEC_QUEUE_STATE_PENDING_DISABLE was only set when a
queue was either suspended, banned (with scheduler submission stopped), or
destroyed at zero refcount, and guc_exec_queue_run_job() asserts this
invariant:

drivers/gpu/drm/xe/xe_guc_submit.c:guc_exec_queue_run_job() {
	...
	xe_gt_assert(guc_to_gt(guc), !(exec_queue_destroyed(q) || exec_queue_pendi=
ng_disable(q)) ||
		     exec_queue_banned(q) || exec_queue_suspended(q));
	...
}

Because guc_exec_queue_kill() only sets EXEC_QUEUE_STATE_KILLED (not BANNED=
 or
SUSPENDED) and does not stop drm_sched_run_job_work (which is only stopped
later when guc_exec_queue_timedout_job() runs on gt->ordered_wq), if another
job is queued on q->entity and guc_exec_queue_run_job() executes on submit_=
wq
after __guc_exec_queue_process_msg_kill() sets
EXEC_QUEUE_STATE_PENDING_DISABLE and before the GuC SCHED_DONE G2H clears it
or TDR bans the queue, won't guc_exec_queue_run_job() trigger this
xe_gt_assert()?

[Severity: High]
Also, when disable_scheduling(primary, true) is called from
__guc_exec_queue_process_msg_kill(), what wakes guc->ct.wq when the GuC
replies with XE_GUC_ACTION_SCHED_CONTEXT_MODE_DONE?

In handle_sched_done(), when runnable_state =3D=3D 0 and !was_pending, the =
wakeup
of guc->ct.wq is gated on exec_queue_banned(q) (and placed before
clear_exec_queue_pending_disable(q)):

drivers/gpu/drm/xe/xe_guc_submit.c:handle_sched_done() {
	...
		if (!was_pending) {
			if (exec_queue_banned(q)) {
				smp_wmb();
				wake_up_all(&guc->ct.wq);
			}
			if (exec_queue_destroyed(q)) {
				clear_exec_queue_pending_disable(q);
				deregister_exec_queue(guc, q);
			} else {
				clear_exec_queue_pending_disable(q);
			}
		}
	...
}

Because a killed queue only has EXEC_QUEUE_STATE_KILLED set and
exec_queue_banned(primary) is false, handle_sched_done() clears
EXEC_QUEUE_STATE_PENDING_DISABLE without waking guc->ct.wq (and the follow-=
up
commit "drm/xe: Synchronously wait for queue kill on FD close" only wakes
kill_wq via guc_wake_kill_waiters(), not guc->ct.wq).

Won't any waiter sleeping on guc->ct.wq for !exec_queue_pending_disable()
stall for the 5-second timeout and trigger a spurious xe_gt_reset_async()? =
In
particular:

1. __guc_exec_queue_process_msg_kill() or guc_exec_queue_timedout_job() on a
   secondary queue in the same multi-queue group waiting on guc->ct.wq for
   !exec_queue_pending_disable(primary).
2. disable_scheduling_deregister() during CLEANUP when a queue is killed and
   put (e.g. via xe_exec_queue_destroy_ioctl(), xe_vm_close_and_put(), or
   xe_file_close() in this commit) while KILL's disable_scheduling() is in
   flight. If disable_scheduling_deregister() times out waiting on guc->ct.=
wq,
   it calls xe_gt_reset_async() and returns early before calling
   set_exec_queue_destroyed(q), which causes guc_exec_queue_stop() during r=
eset
   to skip guc_exec_queue_destroy_async(q) and leak the exec queue and guc_=
id.
3. Similarly, if primary had an in-flight suspend on non-VF when KILL ran,
   __guc_exec_queue_process_msg_kill() waits on guc->ct.wq while
   suspend_fence_signal() -> suspend_wait_wake() only wakes
   q->guc->suspend_wait.

In addition, in guc_exec_queue_timedout_job():

drivers/gpu/drm/xe/xe_guc_submit.c:guc_exec_queue_timedout_job() {
	...
	if (!xe_device_is_in_reset(xe) && !wedged &&
	    (exec_queue_enabled(primary) || exec_queue_pending_disable(primary))) {
		...
		if (xe_uc_fw_is_running(&guc->fw)) {
			ret =3D wait_event_timeout(guc->ct.wq,
						 (!exec_queue_pending_enable(primary) &&
						  !exec_queue_pending_disable(primary)) ||
						 xe_guc_read_stopped(guc) ||
						 vf_recovery(guc), HZ * 5);
			...
			disable_scheduling(primary, skip_timeout_check);
		}
	...
}

If TDR enters this block because KILL set exec_queue_pending_disable(primar=
y)
(while exec_queue_enabled(primary) is already cleared), won't TDR wait for
pending_disable(primary) to clear and then unconditionally call
disable_scheduling(primary, skip_timeout_check) a second time on the
already-disabled context?

[ ... ]

> @@ -2224,8 +2260,21 @@ static int guc_exec_queue_init(struct xe_exec_queu=
e *q)
>  	return err;
>  }
> =20
> +static bool guc_exec_queue_try_add_msg(struct xe_exec_queue *q,
> +				       struct xe_sched_msg *msg,
> +				       u32 opcode);
> +
> +#define STATIC_MSG_CLEANUP	0
> +#define STATIC_MSG_SUSPEND	1
> +#define STATIC_MSG_RESUME	2
> +#define STATIC_MSG_CGP_SYNC	3
> +#define STATIC_MSG_KILL		4
>  static void guc_exec_queue_kill(struct xe_exec_queue *q)
>  {
> +	struct xe_sched_msg *msg =3D q->guc->static_msgs + STATIC_MSG_KILL;
> +
> +	xe_gt_assert(q->gt, kref_read(&q->refcount));

[Severity: High]
Can this xe_gt_assert(q->gt, kref_read(&q->refcount)) fire when
guc_exec_queue_kill() is called from xe_guc_submit_pause_abort()?

When the final reference to an exec queue is dropped via xe_exec_queue_put(=
),
q->refcount becomes 0 and guc_exec_queue_destroy() queues STATIC_MSG_CLEANU=
P,
but q remains in guc->submission_state.exec_queue_lookup until the async
destroy_async worker runs guc_exec_queue_fini() -> release_guc_id(guc, q).

In xe_guc_submit_pause_abort() (called from xe_guc_submit_wedge(),
vf_post_migration_abort(), and guc_submit_fini()):

drivers/gpu/drm/xe/xe_guc_submit.c:xe_guc_submit_pause_abort() {
	...
	mutex_lock(&guc->submission_state.lock);
	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q) {
		struct xe_gpu_scheduler *sched =3D &q->guc->sched;

		/* Prevent redundant attempts to stop parallel queues */
		if (q->guc->id !=3D index)
			continue;

		xe_sched_submission_start(sched);
		guc_exec_queue_kill(q);
	}
	mutex_unlock(&guc->submission_state.lock);
}

And in guc_submit_fini(), the final reference on wedged queues in
exec_queue_lookup is explicitly dropped right before calling
xe_guc_submit_pause_abort():

drivers/gpu/drm/xe/xe_guc_submit.c:guc_submit_fini() {
	...
	mutex_lock(&guc->submission_state.lock);
	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q) {
		if (exec_queue_wedged(q)) {
			mutex_unlock(&guc->submission_state.lock);
			xe_exec_queue_put(q);
			mutex_lock(&guc->submission_state.lock);
		}
	}
	mutex_unlock(&guc->submission_state.lock);
	...
	xe_guc_submit_pause_abort(guc);
}

If xe_guc_submit_pause_abort() encounters a queue in exec_queue_lookup whose
refcount has already reached 0, won't it trigger the new xe_gt_assert() in
guc_exec_queue_kill()? Furthermore, if EXEC_QUEUE_STATE_WEDGED is not set o=
n q
(such as in the reset/abort branch of xe_guc_submit_wedge() or
vf_post_migration_abort()) and guc_exec_queue_destroy_async() is already
scheduled, queuing STATIC_MSG_KILL acquires a runtime PM reference via
MSG_PM_REF that can be leaked when guc_exec_queue_fini() -> xe_sched_fini()
cancels work_process_msg without draining sched->msgs.

> +
>  	trace_xe_exec_queue_kill(q);
>  	set_exec_queue_killed(q);

[ ... ]

>  	if (!exec_queue_wedged(q)) {
>  		struct xe_gpu_scheduler *sched =3D &q->guc->sched;
> =20
>  		xe_sched_msg_lock(sched);
>  		guc_exec_queue_try_add_msg(q, msg, KILL);
>  		xe_sched_msg_unlock(sched);
>  	}
> =20
>  	xe_guc_exec_queue_trigger_cleanup(q);
>  }

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016195904.1377=
149-1-daniel.charles@intel.com?part=3D2
