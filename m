Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75764606A329
	for <intel-xe@archiver.kernel.org>; Fri,  6 Nov 2026 03:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V5Ohci//
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DAD010E0BC;
	Fri,  6 Nov 2026 03:29:58 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56E6E10E0BC
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Nov 2026 03:29:51 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 06692414C2;
 Fri,  6 Nov 2026 03:29:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE8051F0089F;
 Fri,  6 Nov 2026 03:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793935790;
 bh=zK3s/YJvWcvzi0pXg6ZwUe3aFTiABZBxGR/C9p17Go0=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=V5Ohci//fIHDzWFiFmil995k9Jjpyn9PNMru26FOgXAssYBiip9/o0TpWMhp99hX+
 5moIr7mQglwl/2mBRCGei/f55r32XH60S+zvARd1vIP5Y08/nuCk+rQzoSNzhv1QyO
 Z/ulHZ6nK6l1id1i1HIlL8mzIoxBAWhJKRod7J5qBQF4RVtTcw/muJrYABpuOZYesg
 gRfCnv6Ny+Svc6oOhbmarB5VRTLkbuXTQ2+Z7Wbxv2bWchavtOaqq/wwHWBQin25A/
 QCXfFCrKzOBwDkUE1V8wD7k90LdrCEQCTFJpcPndrwe/YdQAASh53ogLBpvhBYFgJ1
 YReWEXlbGD34A==
Message-ID: <sashiko-outbox-200646@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/1] drm/xe: Preserve healthy preempted LR queues across
 system suspend
To: "Huajun Li" <huajun.li@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261106042332.412621-1-huajun.li@intel.com>
References: <20261106042332.412621-1-huajun.li@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 03:29:50 +0000
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

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] drm/xe: missing primary checks in guc_exec_queue_should_preserve_l=
r()
- [High] drm/xe: late-restore LRC/CGP BO use-before-restore in guc_exec_que=
ue_start()
- [High] drm/xe: unpreempted LR queues banned in guc_exec_queue_should_pres=
erve_lr()
--

commit 7d7f69499735f49cbdb7c12c448c779bd3342556
Author: Huajun Li <huajun.li@intel.com>

drm/xe: Preserve healthy preempted LR queues across system suspend

This commit introduces a suspend-specific GuC submission-stop path that
preserves healthy long-running (LR) exec queues whose preemption has
completed, rather than banning them during system suspend. It also stops CT
and synchronizes with the G2H worker before sampling queue state and issuing
a GuC soft reset.

> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_g=
uc_submit.c
> index 9e7c2778029ca..bccd7cba03ee0 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -2733,14 +2733,51 @@ static const struct xe_exec_queue_ops guc_exec_qu=
eue_ops =3D {
>  	.reset_status =3D guc_exec_queue_reset_status,
>  };
> =20
> -static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue=
 *q)
> +static bool guc_exec_queue_should_preserve_lr(struct xe_guc *guc,
> +				struct xe_exec_queue *q, bool suspend)
> +{
> +	if (!suspend || !xe_exec_queue_is_lr(q))
> +		return false;
> +
> +	/*
> +	 * Do not preserve unhealthy LR queues that have already encountered
> +	 * a reset, ban, or fatal error prior to system suspend.
> +	 */
> +	if (exec_queue_killed_or_banned_or_wedged(q) || exec_queue_reset(q))
> +		return false;
> +
> +	/*
> +	 * SUSPENDED is set before requesting scheduling disable. The suspend
> +	 * fence and pending-disable state must also show completion before we
> +	 * can rely on the saved context surviving system sleep.
> +	 */
> +	if (!exec_queue_suspended(q) || READ_ONCE(q->guc->suspend_pending) ||
> +	    exec_queue_pending_disable(q)) {

[Severity: High]
Does guc_exec_queue_should_preserve_lr() improperly preserve multi-queue
secondary LR queues when the group's primary queue failed to complete
preemption or was reset?

In a multi-queue group, only the primary queue
(xe_exec_queue_multi_queue_primary(q)) owns a GuC scheduling context and
sends XE_GUC_ACTION_SCHED_CONTEXT_MODE_SET to GuC. On a secondary queue,
__guc_exec_queue_process_msg_suspend() either takes the
!exec_queue_enabled(q) branch immediately or calls disable_scheduling(),
which short-circuits on the CPU without waiting for GuC to preempt the
primary context:

drivers/gpu/drm/xe/xe_guc_submit.c:disable_scheduling() {
	...
	if (xe_exec_queue_is_multi_queue_secondary(q))
		handle_multi_queue_secondary_sched_done(guc, q, 0);
	else
		xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
			       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
}

As a result, EXEC_QUEUE_STATE_SUSPENDED is set and q->guc->suspend_pending
and EXEC_QUEUE_STATE_PENDING_DISABLE are cleared on the secondary queue
before GuC has preempted the hardware context on the primary queue. Likewis=
e,
GuC reset notifications and CGP context errors target primary->guc->id and
set EXEC_QUEUE_STATE_RESET or ban state on the primary queue. However,
guc_exec_queue_should_preserve_lr() only inspects q and never checks
xe_exec_queue_multi_queue_primary(q).

Furthermore, guc_submit_stop() iterates guc->submission_state.exec_queue_lo=
okup
in a single pass and guc_exec_queue_stop() mutates each queue in place:

drivers/gpu/drm/xe/xe_guc_submit.c:guc_exec_queue_stop() {
	...
	xe_sched_msg_lock(sched);
	if (q->guc->suspend_pending) {
		set_exec_queue_suspended(q);
		suspend_fence_signal(q);
	}
	xe_sched_msg_unlock(sched);
	atomic_and(EXEC_QUEUE_STATE_WEDGED | EXEC_QUEUE_STATE_BANNED |
		   EXEC_QUEUE_STATE_KILLED | EXEC_QUEUE_STATE_DESTROYED |
		   EXEC_QUEUE_STATE_SUSPENDED,
		   &q->guc->state);
}

Because the primary queue is created before its secondaries and normally ha=
s a
lower guc_id, guc_exec_queue_stop() runs on the primary queue first, cleari=
ng
primary->guc->suspend_pending, EXEC_QUEUE_STATE_PENDING_DISABLE, and
EXEC_QUEUE_STATE_RESET (and only calling set_exec_queue_banned(primary)
rather than set_exec_queue_group_banned(primary)) before the secondary queu=
es
are visited.

Additionally, if a multi-queue LR queue with a pending job is preserved, wo=
n't
restarting it on resume via xe_guc_submit_start() -> guc_exec_queue_start()=
 ->
xe_sched_resubmit_jobs() -> guc_exec_queue_run_job() -> register_exec_queue=
()
call xe_guc_exec_queue_group_cgp_sync() and sleep waiting for GuC's
CGP_SYNC_DONE G2H while holding the reclaim-primed
guc->submission_state.lock?

> +		xe_gt_dbg(guc_to_gt(guc),
> +			  "LR exec queue %d failed to suspend prior to stop; will be banned\n=
",
> +			  q->guc->id);
> +		return false;
> +	}

[Severity: High]
Will guc_exec_queue_should_preserve_lr() still fail on healthy LR queues th=
at
are not preempt-suspended during xe_bo_evict_all_user()?

Nothing in the system suspend path explicitly invokes q->ops->suspend(q) on=
 LR
exec queues; instead, preempt-fence LR queues are only suspended as a side
effect when xe_bo_evict_all_user() evicts a TTM BO whose dma_resv holds
q->lr.pfence:

drivers/gpu/drm/xe/xe_bo_evict.c:xe_bo_evict_all_user() {
	...
		if (mem_type =3D=3D XE_PL_TT && (IS_DGFX(xe) || !xe_device_has_flat_ccs(x=
e)))
			continue;

		if (man) {
			ret =3D ttm_resource_manager_evict_all(bdev, man);
			if (ret)
				return ret;
		}
}

Because of this, q->ops->suspend(q) is never called before xe_guc_suspend()
(leaving exec_queue_suspended(q) false) for:
- fault-mode LR VMs (xe_vm_in_fault_mode(q->vm)), which do not use preempt
  fences;
- iGPU platforms without FlatCCS (!IS_DGFX(xe) && !xe_device_has_flat_ccs(x=
e)),
  where xe_bo_evict_all_user() skips XE_PL_TT; and
- preempt-fence LR VMs whose bound buffers only use userptr VMAs or dGPU
  XE_PL_TT system memory BOs.

When xe_guc_submit_suspend() runs, won't guc_exec_queue_should_preserve_lr()
see !exec_queue_suspended(q) and return false, causing guc_exec_queue_stop()
to ban active LR queues in all of those configurations (and log that idle LR
queues "will be banned" even when they have no pending jobs)?

> +
> +	return true;
> +}
> +
> +static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue=
 *q,
> +				bool suspend)
>  {
>  	struct xe_gpu_scheduler *sched =3D &q->guc->sched;
>  	bool do_destroy =3D false;
> +	bool preserve_lr;
> =20
>  	/* Stop scheduling + flush any DRM scheduler operations */
>  	xe_sched_submission_stop(sched);
> =20
> +	/*
> +	 * Sample acknowledged preemption before synthesizing lost G2H state.
> +	 * Only healthy, cleanly preempted LR queues are preserved across sleep.
> +	 */
> +	preserve_lr =3D guc_exec_queue_should_preserve_lr(guc, q, suspend);
> +
>  	/* Clean up lost G2H + reset engine state */
>  	if (exec_queue_registered(q)) {
>  		if (exec_queue_destroyed(q))
> @@ -2764,7 +2801,11 @@ static void guc_exec_queue_stop(struct xe_guc *guc=
, struct xe_exec_queue *q)
>  	 * started but not complete job or if a job has gone through a GT reset
>  	 * more than twice.
>  	 */
> -	if (!(q->flags & (EXEC_QUEUE_FLAG_KERNEL | EXEC_QUEUE_FLAG_VM))) {
> +	/*
> +	 * Preempted LR jobs normally remain unfinished. System sleep must keep
> +	 * their saved contexts, while reset recovery retains its ban policy.
> +	 */
> +	if (!(q->flags & (EXEC_QUEUE_FLAG_KERNEL | EXEC_QUEUE_FLAG_VM)) && !pre=
serve_lr) {

[Severity: High]
When a userspace LR queue with a pending job is preserved here, does
guc_exec_queue_start() on resume access and register its LRC and CGP BOs
before xe_bo_restore_late() has restored them?

In xe_lrc_init() and xe_exec_queue_group_init(), userspace LRC BOs
(q->lrc[i]->bo) and multi-queue CGP BOs (group->cgp_bo) are created with
XE_BO_FLAG_PINNED_LATE_RESTORE:

drivers/gpu/drm/xe/xe_lrc.c:xe_lrc_init() {
	...
	bo_flags =3D XE_BO_FLAG_VRAM_IF_DGFX(tile) | XE_BO_FLAG_GGTT |
		   XE_BO_FLAG_GGTT_INVALIDATE;

	if ((vm && vm->xef) || init_flags & XE_LRC_CREATE_USER_CTX) /* userspace */
		bo_flags |=3D XE_BO_FLAG_PINNED_LATE_RESTORE | XE_BO_FLAG_FORCE_USER_VRAM;
}

During xe_pm_resume() (and D3cold xe_pm_runtime_resume()), xe_gt_resume() r=
uns
before xe_bo_restore_late():

drivers/gpu/drm/xe/xe_pm.c:xe_pm_resume() {
	...
	err =3D xe_bo_restore_early(xe);
	if (err)
		goto err;
	...
	for_each_gt(gt, xe, id) {
		err =3D xe_gt_resume(gt);
		if (err)
			break;
	}
	...
	err =3D xe_bo_restore_late(xe);
}

Inside xe_gt_resume() -> do_gt_restart() -> xe_uc_start() ->
xe_guc_submit_start() -> guc_exec_queue_start(), any unbanned queue with a
pending job reads and writes q->lrc[i]->bo and resubmits jobs via
xe_sched_resubmit_jobs():

drivers/gpu/drm/xe/xe_guc_submit.c:guc_exec_queue_start() {
	...
	if (!exec_queue_killed_or_banned_or_wedged(q)) {
		struct xe_sched_job *job =3D xe_sched_first_pending_job(sched);
		int i;

		trace_xe_exec_queue_resubmit(q);
		if (job) {
			for (i =3D 0; i < q->width; ++i) {
				q->lrc[i]->ring.tail =3D job->ptrs[i].head;
				if (xe_sched_job_is_ulls(job))
					xe_lrc_set_ring_head(q->lrc[i],
							     job->ptrs[i].head);
				xe_lrc_set_ring_tail(q->lrc[i],
						     xe_lrc_ring_head(q->lrc[i]));
			}
		}
		xe_sched_resubmit_jobs(sched);
	}
}

Because xe_bo_restore_late() has not run yet when guc_exec_queue_start()
executes:
1. xe_lrc_ring_head() reads CTX_RING_HEAD / INDIRECT_CTX_RING_HEAD from
   un-restored VRAM, and xe_lrc_set_ring_tail(), emit_job(), and
   submit_exec_queue() write ring commands, CTX_RING_TAIL, and parallel
   workqueue items into un-restored VRAM.
2. register_exec_queue() registers q->lrc[i]->bo (and group->cgp_bo for
   multi-queue) with GuC before xe_bo_restore_late() has restored their GGTT
   PTEs via xe_bo_restore_and_map_ggtt().
3. When xe_bo_restore_late() subsequently runs, it copies bo->backup_obj ba=
ck
   over q->lrc[i]->bo and group->cgp_bo in VRAM, overwriting the ring, tail,
   parallel WQ, and CGP updates made by guc_exec_queue_start().

Can a preserved userspace LR queue safely be restarted and have its jobs
resubmitted in xe_gt_resume() before xe_bo_restore_late() restores its LRC =
and
CGP BOs?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106042332.4126=
21-1-huajun.li@intel.com?part=3D1
