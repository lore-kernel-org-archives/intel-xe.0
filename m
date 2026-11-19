Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27AB0606A325
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 18:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B763EUuC
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D640E10F0AE;
	Thu, 19 Nov 2026 18:18:58 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34638112122
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Nov 2026 18:18:52 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 8480F620B2;
 Thu, 19 Nov 2026 18:18:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D75F1F000C4;
 Thu, 19 Nov 2026 18:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795112331;
 bh=Hpj06aKX0Re14XYeC6ViqT9g5CoSWTR0JdeEUrZ8MIY=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=B763EUuCkWRdmESe/460XpD2CvRRjJf85uAQwlarmdBD0676AAgghFvh0qmZYvlwd
 a4i8C+AJbtfzG35ZOxlMh7Ei0dh4GEyEK8WAPFoWug2rU8B8ENpty2gw5p8buWhdLD
 qz3IR4XUgyuNAGoS8Bo/j9e4mFhzb0Wl3GMuatdgjyH7fmjxxZ/y2tulK421XdSJbJ
 UbqBI8+pjUKOG9hV2jorYLFdC5DbcNC3jFGzPzYmuSEtmJfSLjjwlPrTwLjHaCGuD0
 lBdNKieCCnJpfOpzf0kNCm5Da8f7i0oGG7gyw7RhreqZ9W7XloVzO/OHNiNDoMekAk
 yya/amj6oSsMQ==
Message-ID: <sashiko-outbox-223764@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 3/4] drm/xe: Disable scheduling early on FD close to
 avoid CAT error cascade
To: "Daniel Charles" <daniel.charles@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261119174621.1311154-4-daniel.charles@intel.com>
References: <20261119174621.1311154-1-daniel.charles@intel.com>
 <20261119174621.1311154-4-daniel.charles@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 18:18:50 +0000
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
- [High] drm/xe: guc_exec_queue_kill() on zero-ref queue in pause_abort
- [High] drm/xe: async kill disable_scheduling() races with
  suspend_pending
- [High] drm/xe: primary kill disables multi-queue group without group
  cleanup
--

commit 99b38ad21631b92773b295aba24f48100578bda0
Author: Matthew Brost <matthew.brost@intel.com>

drm/xe: Disable scheduling early on FD close to avoid CAT error cascade

This commit adds a static KILL scheduler message queued from
guc_exec_queue_kill() to disable GuC context scheduling immediately
outside of the serialized TDR path.

> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_g=
uc_submit.c
> index 4087a38ad3d66..671852b562105 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c

[ ... ]

> @@ -2087,12 +2093,44 @@ static void __guc_exec_queue_process_msg_cgp_sync=
(struct xe_sched_msg *msg,
>  		guc_exec_queue_send_cgp_sync(q, 0);
>  }
> =20
> +static void __guc_exec_queue_process_msg_kill(struct xe_sched_msg *msg,
> +					      bool bound)
> +{
> +	struct xe_exec_queue *q =3D msg->private_data;
> +	struct xe_guc *guc =3D exec_queue_to_guc(q);
> +	int ret;
> +
> +	/* At zero references, the queued CLEANUP message handles disabling. */
> +	if (!kref_read(&q->refcount) || !bound || exec_queue_wedged(q))
> +		return;
> +
> +	ret =3D wait_event_timeout(q->guc->state_wq,
> +				 (!exec_queue_pending_enable(q) &&
> +				  !exec_queue_pending_disable(q)) ||
> +				 xe_guc_read_stopped(guc) ||
> +				 vf_recovery(guc), HZ * 5);
> +	if (!ret && !vf_recovery(guc)) {
> +		xe_gt_warn(q->gt, "Pending enable/disable failed to respond on kill, g=
uc_id=3D%d\n",
> +			   q->guc->id);
> +		xe_gt_reset_async(q->gt);
> +		xe_sched_tdr_queue_imm(&q->guc->sched);
> +		return;
> +	}
> +
> +	if (xe_guc_read_stopped(guc) || vf_recovery(guc))
> +		return;
> +
> +	if (exec_queue_enabled(q))
> +		disable_scheduling(q, true);
> +}

[Severity: High]
Can returning immediately after disable_scheduling() here race with a
queued SUSPEND message and the incoming SCHED_DONE G2H?

guc_exec_queue_suspend() checks exec_queue_killed_or_banned_or_wedged()
before __guc_exec_queue_suspend() takes sched->msg_lock, and
guc_exec_queue_kill() sets EXEC_QUEUE_STATE_KILLED before taking
sched->msg_lock, so STATIC_MSG_SUSPEND can be queued right behind
STATIC_MSG_KILL:

CPU0                              work_process_msg                  ct->g2h=
_wq
guc_exec_queue_suspend()
  !killed_or_banned_or_wedged()
  (passes)
CPU1: guc_exec_queue_kill()
  set_exec_queue_killed()
  try_add_msg(KILL)
__guc_exec_queue_suspend()
  suspend_pending =3D true
  try_add_msg(SUSPEND)
                                  __guc_exec_queue_process_msg_kill()
                                    disable_scheduling(q, true)
                                      clear_exec_queue_enabled()
                                      set_exec_queue_pending_disable()
                                  __guc_exec_queue_process_msg_suspend()
                                    else if (q->guc->suspend_pending)
                                      set_exec_queue_suspended(q)
                                                                    handle_=
sched_done()
                                                                      suspe=
nd_pending &&
                                                                      exec_=
queue_suspended()
                                      suspend_fence_signal(q)         suspe=
nd_fence_signal(q)
                                                                        <--=
 trips assert

Because __guc_exec_queue_process_msg_kill() does not wait for its
PENDING_DISABLE to finish, __guc_exec_queue_process_msg_suspend() runs
while KILL's disable is still in flight, enters the unlocked
"else if (q->guc->suspend_pending)" branch, signals the suspend fence
before GuC has actually preempted the context, and races with
handle_sched_done() on q->guc->suspend_pending (tripping
xe_gt_assert(guc_to_gt(guc), q->guc->suspend_pending) in
suspend_fence_signal()).  Also, setting EXEC_QUEUE_STATE_SUSPENDED while
KILL's PENDING_DISABLE is in flight causes
guc_exec_queue_revert_pending_state_change() during VF migration recovery
to misattribute the pending disable to SUSPEND and set
q->guc->needs_suspend =3D true after suspend_pending was already cleared.

[ ... ]

> @@ -2262,8 +2303,21 @@ static void guc_exec_queue_reinit_kernel(struct xe=
_exec_queue *q)
>  	xe_sched_reinit(&q->guc->sched);
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
Can xe_guc_submit_pause_abort() hit this assertion and leak a runtime PM
reference when a queue in exec_queue_lookup already has a zero refcount?

When the last reference to an exec queue is dropped,
guc_exec_queue_destroy() only queues STATIC_MSG_CLEANUP; the queue remains
in guc->submission_state.exec_queue_lookup until the async destroy worker
runs guc_exec_queue_fini() -> release_guc_id().  Unlike
xe_guc_submit_wedge(), xe_guc_submit_pause_abort() iterates
exec_queue_lookup and calls guc_exec_queue_kill(q) without checking
kref_read(&q->refcount) (for example in guc_submit_fini() right after
dropping the wedge reference, or during vf_post_migration_abort() and
xe_guc_flr_prepare()):

drivers/gpu/drm/xe/xe_guc_submit.c:xe_guc_submit_pause_abort() {
	...
	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q) {
		...
		xe_sched_submission_start(sched);
		guc_exec_queue_kill(q);
	}
}

Besides tripping the new assertion, queuing STATIC_MSG_KILL on a non-wedged
zero-refcount queue takes a runtime PM reference via MSG_PM_REF in
guc_exec_queue_add_msg().  If the already-in-flight CLEANUP / destroy_async
path reaches guc_exec_queue_fini() -> xe_sched_fini() and cancels
work_process_msg before STATIC_MSG_KILL is processed, that runtime PM
reference is never released.

>  	trace_xe_exec_queue_kill(q);
>  	set_exec_queue_killed(q);
>  	/*
> @@ -2273,6 +2327,27 @@ static void guc_exec_queue_kill(struct xe_exec_que=
ue *q)
>  	 * stays set until the queue is torn down.
>  	 */
>  	suspend_wait_wake(q);
> +
> +	/*
> +	 * We eagerly send a message to ourselves to disable scheduling, as the
> +	 * TDR is serialized (i.e., only one exec queue is processed at a time).
> +	 * If an FD is closed with many exec queues, the TDR can be slower than
> +	 * the GuC scheduling contexts with invalid page tables, creating a
> +	 * cascade of CAT errors and engine resets, which is quite slow. Avoid
> +	 * this by immediately disabling scheduling outside of the TDR.
> +	 *
> +	 * Only the primary's own KILL may do this for a multi-queue group.
> +	 * Group jobs share its ordered submit workqueue and the killed primary
> +	 * prevents later member jobs from submitting to GuC.
> +	 */
> +	if (!xe_exec_queue_is_multi_queue_secondary(q) && !exec_queue_wedged(q)=
) {
> +		struct xe_gpu_scheduler *sched =3D &q->guc->sched;
> +
> +		xe_sched_msg_lock(sched);
> +		guc_exec_queue_try_add_msg(q, msg, KILL);
> +		xe_sched_msg_unlock(sched);
> +	}
> +
>  	xe_guc_exec_queue_trigger_cleanup(q);
>  }

[Severity: High]
If a multi-queue primary queue is killed while secondary queues still have
in-flight jobs, does disabling scheduling on the primary without triggering
group cleanup leave the secondary jobs stranded?

Every secondary queue holds a kref on the primary queue until the
secondary is finalized, so when the primary is killed (e.g. userspace
destroys the primary queue first, or VRAM page-offline kills bo->q),
kref_read(&primary->refcount) is non-zero and
__guc_exec_queue_process_msg_kill() disables the shared GuC context for the
whole group.  However, guc_exec_queue_kill() only calls
xe_guc_exec_queue_trigger_cleanup(primary) rather than
xe_guc_exec_queue_group_trigger_cleanup(primary).  When the primary has no
pending jobs of its own, primary's TDR never runs to set group->banned or
schedule TDR on the secondaries: LR secondary jobs stall forever, and
non-LR secondary jobs eventually hit guc_exec_queue_timedout_job() with
skip_timeout_check =3D=3D false, logging a false GPU hang, capturing a
devcoredump, and triggering a full GT reset via xe_gt_reset_async() for
any secondary job that had not started yet.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119174621.1311=
154-1-daniel.charles@intel.com?part=3D3
