Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D18606A320
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 18:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f06hKHZZ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5512F10E7C3;
	Thu, 19 Nov 2026 18:21:51 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9945010F07E
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Nov 2026 18:21:44 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id CAACB6215B;
 Thu, 19 Nov 2026 18:21:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65DCD1F000C5;
 Thu, 19 Nov 2026 18:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795112503;
 bh=u02QHlu61YKd+nsVYllP7rfyPtHBJoqIXZABX96M6hk=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=f06hKHZZzpjzjgIDlOJtWuAymB2Gq56MczviTlIo+Cpx9rvK22z1rtMbJFc8t8tJm
 70flowh/6+tsr+tcSb4f7BguL3pRfMl++EFyHQ56eMpc2a+q4k7nUX9tU6o0V2SaPl
 wcCLM3wbgVGIIuNm1pgzxOQ0/ShwVM6REL/m6Q1BJlGhQH1LQyIksx/2AJBZ87Rqvo
 I1YYM99fJaxcQs4H6WeWhkr2SbfwigANNLOqc5Ja4/bZtgXSKyVaBvtrZSc+D/PH+n
 0ReOUQLsl9L+sHsHJR/FD/yvyQaDi/eiZO61N3FitOOcHxxLYE97Uty2p3FxsnjOv7
 nuySMNuCNBgNA==
Message-ID: <sashiko-outbox-223765@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 4/4] drm/xe: Synchronously wait for queue kill on FD
 close
To: "Daniel Charles" <daniel.charles@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261119174621.1311154-5-daniel.charles@intel.com>
References: <20261119174621.1311154-1-daniel.charles@intel.com>
 <20261119174621.1311154-5-daniel.charles@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 18:21:42 +0000
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

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [High] drm/xe: timeout in guc_exec_queue_kill_sync() after reset or VF
  recovery
- [Medium] drm/xe: missing kill_processed reset in
  guc_exec_queue_reinit_kernel()
- [Medium] drm/xe: guc_exec_queue_kill_sync() stalls and resets on
  unplugged device
--

commit 4827880406140970103161afc0f5446cedf1ee73
Author: Daniel Charles <daniel.charles@intel.com>

drm/xe: Synchronously wait for queue kill on FD close

This commit splits FD close into two passes that first kill all queues on
the file and then wait for each queue's scheduling to stop before dropping
its reference and tearing down VMs.

> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_g=
uc_submit.c
> index 671852b562105..ec308b06c1bee 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -2104,6 +2104,9 @@ static void __guc_exec_queue_process_msg_kill(struc=
t xe_sched_msg *msg,
>  	if (!kref_read(&q->refcount) || !bound || exec_queue_wedged(q))
>  		return;
> =20
> +	if (READ_ONCE(q->guc->kill_processed))
> +		return;

[Severity: Medium]
Does guc_exec_queue_reinit_kernel() need to reset q->guc->kill_processed to
false?

During PCI FLR preparation, xe_guc_flr_prepare() ->
xe_guc_submit_pause_abort() kills all queues, including kernel queues.
When FLR completes, guc_exec_queue_reinit_kernel() clears q->guc->state and
reinitializes the scheduler, but leaves q->guc->kill_processed set:

drivers/gpu/drm/xe/xe_guc_submit.c:guc_exec_queue_reinit_kernel() {
	xe_gt_assert(q->gt, q->flags & EXEC_QUEUE_FLAG_KERNEL);

	atomic_set(&q->guc->state, 0);
	xe_sched_reinit(&q->guc->sched);
}

If STATIC_MSG_KILL remained queued in sched->msgs when submission stopped,
xe_guc_submit_start() will also run __guc_exec_queue_process_msg_kill() on
the reinitialized kernel queue because it does not check
exec_queue_killed(q), disabling its scheduling and setting kill_processed.
Once kill_processed is true, any subsequent kill on that kernel queue
returns early without disabling scheduling.

> +
>  	ret =3D wait_event_timeout(q->guc->state_wq,
>  				 (!exec_queue_pending_enable(q) &&
>  				  !exec_queue_pending_disable(q)) ||
> @@ -2122,6 +2125,10 @@ static void __guc_exec_queue_process_msg_kill(stru=
ct xe_sched_msg *msg,
> =20
>  	if (exec_queue_enabled(q))
>  		disable_scheduling(q, true);
> +
> +	/* Publish only after disable_scheduling() has established pending stat=
e. */
> +	smp_store_release(&q->guc->kill_processed, true);
> +	wake_up_all(&q->guc->state_wq);
>  }
> =20
>  #define CLEANUP				1	/* Non-zero values to catch uninitialized msg */
> @@ -2351,6 +2358,45 @@ static void guc_exec_queue_kill(struct xe_exec_que=
ue *q)
>  	xe_guc_exec_queue_trigger_cleanup(q);
>  }
> =20
> +static bool guc_exec_queue_kill_complete(struct xe_exec_queue *primary)
> +{
> +	unsigned int state;
> +
> +	/*
> +	 * Pair with the primary KILL handler's release so earlier submission
> +	 * work has finished and any required DISABLE has been issued.
> +	 */
> +	if (!smp_load_acquire(&primary->guc->kill_processed))
> +		return false;
> +
> +	state =3D atomic_read(&primary->guc->state);
> +
> +	return !(state & (EXEC_QUEUE_STATE_ENABLED |
> +			  EXEC_QUEUE_STATE_PENDING_DISABLE |
> +			  EXEC_QUEUE_STATE_PENDING_ENABLE));
> +}

[Severity: High]
Can guc_exec_queue_kill_complete() remain permanently false after a GT
reset or SR-IOV VF migration recovery, causing guc_exec_queue_kill_sync()
to time out and trigger a spurious GT reset?

When xe_sched_process_msg_work() dequeues STATIC_MSG_KILL and runs
__guc_exec_queue_process_msg_kill() while a GT reset or VF recovery is in
progress (or when its wait_event_timeout() times out or is woken by
xe_guc_read_stopped(guc) or vf_recovery(guc)), it returns early without
setting q->guc->kill_processed.  Once the GT reset or VF recovery finishes,
xe_guc_read_stopped(guc) and vf_recovery(guc) return to false, but
STATIC_MSG_KILL has already been consumed and kill_processed is still
false.

In addition, if __guc_exec_queue_process_msg_kill() already called
disable_scheduling() and set kill_processed before a VF migration pause,
guc_exec_queue_revert_pending_state_change() reverts the pending disable
back to EXEC_QUEUE_STATE_ENABLED without queuing a kill disable replay:

drivers/gpu/drm/xe/xe_guc_submit.c:guc_exec_queue_revert_pending_state_chan=
ge() {
...
	if (pending_disable) {
		if (!pending_enable)
			set_exec_queue_enabled(q);
		clear_exec_queue_pending_disable(q);
		xe_gt_dbg(guc_to_gt(guc), "Replay DISABLE - guc_id=3D%d",
			  q->guc->id);
	}
...
}

In both cases, guc_exec_queue_kill_complete(primary) stays false after
reset or recovery completes, so guc_exec_queue_kill_sync() stalls for 5
seconds per affected queue on FD close and calls xe_gt_reset_async(q->gt).

> +
> +static void guc_exec_queue_kill_sync(struct xe_exec_queue *q)
> +{
> +	struct xe_exec_queue *primary =3D xe_exec_queue_multi_queue_primary(q);
> +	struct xe_guc *guc =3D exec_queue_to_guc(primary);
> +	long ret;
> +
> +	xe_assert(guc_to_xe(guc), exec_queue_killed(q));
> +
> +	/* FD close has already killed every primary before waiting on any memb=
er. */
> +	ret =3D wait_event_timeout(primary->guc->state_wq,
> +				 guc_exec_queue_kill_complete(primary) ||
> +				 xe_guc_read_stopped(guc) ||
> +				 vf_recovery(guc) ||
> +				 exec_queue_wedged(primary), HZ * 5);
> +	if (!ret) {
> +		xe_gt_warn(q->gt, "Queue kill failed to respond, guc_id=3D%d\n",
> +			   primary->guc->id);
> +		xe_gt_reset_async(q->gt);
> +	}
> +}

[Severity: Medium]
Can guc_exec_queue_kill_sync() stall and queue a GT reset when an FD is
closed after drm_dev_unplug()?

In xe_device_remove(), drm_dev_unplug(&xe->drm) runs before
xe_bo_pci_dev_remove_all(xe), while guc->submission_state.stopped is only
set later when devres_release_all() invokes guc_submit_fini().  If
xe_file_close() runs in that window, drm_dev_enter() in
guc_exec_queue_process_msg() sets bound =3D false, so
__guc_exec_queue_process_msg_kill() returns immediately without setting
kill_processed or waking state_wq.  Because guc_exec_queue_kill_sync() does
not check drm_dev_enter() or drm_dev_is_unplugged(), it waits on state_wq
until guc_submit_fini() runs, or times out after 5 seconds per queue and
calls xe_gt_reset_async() on the unplugged device.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119174621.1311=
154-1-daniel.charles@intel.com?part=3D4
