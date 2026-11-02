Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C51606A329
	for <intel-xe@archiver.kernel.org>; Mon,  2 Nov 2026 21:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PIgcI/0H
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0961410F21B;
	Mon,  2 Nov 2026 21:35:04 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00A3C10E4EB
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Nov 2026 21:34:57 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id EFC9F60120;
 Mon,  2 Nov 2026 21:34:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87C1F1F00A18;
 Mon,  2 Nov 2026 21:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793655296;
 bh=d4eIrZ3A0VS/QD3N8KDesnMoAcXUxXVzyKztCeYdgrE=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=PIgcI/0HSy5HY0kwmGlbWQ26QaEBGOJLdCN9+tq8LpyYIPRavbsB+5RQZbLwajxz+
 BrYX2k6J891ai3NZDA5VhwfYgnjM/PDsUcyVNFiiuBEK5BEq7KtDBGXa2wYbInNdIC
 q3H3HdwGVCif8eW18xxZ8eRkeK3guKjZf7+t+1FiK4u4e6Q6oX0iq71p8lVYfJVTiy
 BE2HKffOqiIlwueX6j6DmuVYFMjHNizf3He+DL8NkmTwZEtLFCXFydHsG665XmEiQw
 6xaz8RNP0CUG54H0FowM9hU/IZng5NxX+AQG0j+Fefl0dWe3fjrF5+06VlAJaKovqJ
 i/FBo1hiKNluw==
Message-ID: <sashiko-outbox-194208@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] drm/xe/wedge: preserve pending TLB invalidations
 during inspection
To: "Daniel Charles" <daniel.charles@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261102210242.635207-3-daniel.charles@intel.com>
References: <20261102210242.635207-1-daniel.charles@intel.com>
 <20261102210242.635207-3-daniel.charles@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 21:34:56 +0000
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
- [High] drm/xe: out-of-order fence signaling and MMIO invalidation when de=
bug_paused
- [High] drm/xe/wedge: broken TLB reset and queue ref leak in wedge_pause_w=
ork()
--

commit c122991e71ecbb496ea6c81f3c4f283b79307727
Author: Daniel Charles <daniel.charles@intel.com>

drm/xe/wedge: preserve pending TLB invalidations during inspection

This patch pauses TLB invalidation timeout and completion processing when t=
he
mode-3 inspection worker stops a GT, preserving pending invalidation fences
unsignaled during inspection. Replying continue resets the preserved
invalidations before permanent wedging, while skip leaves them paused.

> diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.c b/drivers/gpu/drm/xe/xe_tl=
b_inval.c
> index c9cc5842d65b6..293929f92eb0f 100644
> --- a/drivers/gpu/drm/xe/xe_tlb_inval.c
> +++ b/drivers/gpu/drm/xe/xe_tlb_inval.c
[ ... ]
> @@ -209,6 +219,24 @@ int xe_gt_tlb_inval_init_early(struct xe_gt *gt)
>  	return drmm_add_action_or_reset(&xe->drm, tlb_inval_fini, tlb_inval);
>  }
> =20
> +/**
> + * xe_tlb_inval_debug_pause() - Preserve pending invalidations for inspe=
ction
> + * @tlb_inval: TLB invalidation client
> + *
> + * A reset ends this pause even while inspection waits for a reply.
> + * Holding a runtime PM reference does not prevent system suspend.
> + */
> +void xe_tlb_inval_debug_pause(struct xe_tlb_inval *tlb_inval)
> +{
> +	if (!tlb_inval->ops->initialized(tlb_inval))
> +		return;
> +
> +	spin_lock_irq(&tlb_inval->pending_lock);
> +	tlb_inval->debug_paused =3D true;
> +	cancel_delayed_work(&tlb_inval->fence_tdr);
> +	spin_unlock_irq(&tlb_inval->pending_lock);
> +}

[Severity: High]
Can new TLB invalidations issued while tlb_inval->debug_paused is true cause
out-of-order dma_fence signaling and unintended MMIO invalidations during
inspection?

When wedge_pause_work() -> xe_gt_wedge_pause() runs, it calls
xe_tlb_inval_debug_pause() to leave in-flight fences on
tlb_inval->pending_fences unsignaled, and then calls xe_uc_wedge_declare() =
->
xe_guc_ct_stop(), which sets ct->state =3D XE_GUC_CT_STATE_STOPPED without
setting xe->wedged.flag.

However, per-queue TLB invalidation dependency schedulers
(q->tlb_inval[i].dep_scheduler running on gt->tlb_inval.job_wq), in-flight
ioctls, MMU notifiers, VM teardown, and new operations after
XE_WEDGE_REPLY_SKIP are not prevented from calling xe_tlb_inval_range(),
xe_tlb_inval_ggtt(), xe_tlb_inval_all(), or xe_tlb_inval_vm().

Because neither xe_tlb_inval_fence_prep() nor xe_tlb_inval_issue() checks
tlb_inval->debug_paused:

drivers/gpu/drm/xe/xe_tlb_inval.c:xe_tlb_inval_issue() {
	mutex_lock(&(__tlb_inval)->seqno_lock);
	xe_tlb_inval_fence_prep((__fence));
	__ret =3D op((__tlb_inval), (__fence)->seqno, ##args);
	if (__ret < 0)
		xe_tlb_inval_fence_signal_unlocked((__fence));
	mutex_unlock(&(__tlb_inval)->seqno_lock);

	/* Undelivered: fence already signalled, report done */
	(__ret =3D=3D -ECANCELED || __ret =3D=3D -ENOTRECOVERABLE) ? 0 : __ret;
}

When a subsequent invalidation runs while ct->state is
XE_GUC_CT_STATE_STOPPED, xe_guc_ct_send() returns -ECANCELED.
xe_tlb_inval_issue() then immediately signals the newly issued fence via
xe_tlb_inval_fence_signal_unlocked() and returns 0 while earlier preserved
fences remain unsignaled in tlb_inval->pending_fences.

In xe_tlb_inval_job_push(), jobs on the same (q, gt) xe_dep_scheduler export
&job->dep.drm.s_fence->finished on a shared drm_sched_entity fence context =
so
that later jobs squash earlier jobs in dma_resv and
q->tlb_inval[idx].last_fence:

drivers/gpu/drm/xe/xe_tlb_inval_job.c:xe_tlb_inval_job_push() {
	...
	xe_exec_queue_tlb_inval_last_fence_set(job->q, job->vm,
					       &job->dep.drm.s_fence->finished,
					       job->idx);
	...
	return &job->dep.drm.s_fence->finished;
}

If an earlier job's fence is preserved unsignaled in pending_fences and a
later job gets -ECANCELED, the later job's finished fence signals out of or=
der
on that timeline while the earlier fence is still unsignaled, allowing
dma_resv, last_fence waiters, and attached prl_sa suballocations to observe
completion even though neither invalidation completed and the GT was not
reset.

In addition, in send_tlb_inval_ggtt() (called directly or as a dummy
invalidation from send_tlb_inval_ctx_ppgtt() when !last_q &&
!xe_tlb_inval_idle(tlb_inval)):

drivers/gpu/drm/xe/xe_guc_tlb_inval.c:send_tlb_inval_ggtt() {
	if (xe_guc_ct_enabled(&guc->ct) && guc->submission_state.initialized) {
		return send_tlb_inval(&guc->ct, action, ARRAY_SIZE(action));
	} else if (xe_device_uc_enabled(xe) && !xe_wedged(xe)) {
		...
		CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
		if (xe->info.platform =3D=3D XE_PVC || GRAPHICS_VER(xe) >=3D 20) {
			xe_mmio_write32(mmio, PVC_GUC_TLB_INV_DESC1,
					PVC_GUC_TLB_INV_DESC1_INVALIDATE);
			xe_mmio_write32(mmio, PVC_GUC_TLB_INV_DESC0,
					PVC_GUC_TLB_INV_DESC0_VALID);
		} else {
			xe_mmio_write32(mmio, GUC_TLB_INV_CR,
					GUC_TLB_INV_CR_INVALIDATE);
		}
	}

	return -ECANCELED;
}

Because xe_guc_ct_enabled(&guc->ct) is false while !xe_wedged(xe) remains t=
rue
during mode-3 inspection and after skip, wouldn't this wake the GT and write
GuC TLB invalidation MMIO registers during hardware inspection?

[ ... ]

> diff --git a/drivers/gpu/drm/xe/xe_wedge.c b/drivers/gpu/drm/xe/xe_wedge.c
> index c22c3544adcaa..f7b2ec9d68863 100644
> --- a/drivers/gpu/drm/xe/xe_wedge.c
> +++ b/drivers/gpu/drm/xe/xe_wedge.c
> @@ -17,6 +17,7 @@
>  #include "xe_pm.h"
>  #include "xe_printk.h"
>  #include "xe_sriov.h"
> +#include "xe_tlb_inval.h"
>  #include "xe_wedge.h"
> =20
>  /**
> @@ -115,6 +116,9 @@ static void wedge_declare_now(struct xe_device *xe, u=
nsigned long method,
>  	if (!gts_already_wedged) {
>  		for_each_initialized_gt(gt, xe, id)
>  			xe_gt_wedge_declare(gt);
> +	} else {
> +		for_each_initialized_gt(gt, xe, id)
> +			xe_tlb_inval_reset(&gt->tlb_inval);
>  	}

[Severity: High]
What happens in wedge_declare_now() if a GT was reset or resumed while
wedge_pause_work() was waiting, or if wedge_pause_work() is re-entered after
xe->wedged.declare_pending is cleared?

First, as noted in the comment on xe_tlb_inval_debug_pause(), a GT reset or
system suspend/resume cycle can run while wedge_pause_work() waits in
wait_event_idle(), restarting the GT and re-enabling GuC CT and submission
while xe_wedged(xe) is still false. When the user then replies
XE_WEDGE_REPLY_CONTINUE, wedge_pause_work() calls
wedge_declare_now(xe, DRM_WEDGE_RECOVERY_NONE, true), which skips
xe_gt_wedge_declare(gt) and calls xe_tlb_inval_reset(&gt->tlb_inval) direct=
ly
while the GT's TLB invalidation backend is active and running.

Second, when wedge_pause_work() finishes, it clears
atomic_set(&xe->wedged.declare_pending, 0):

drivers/gpu/drm/xe/xe_wedge.c:wedge_pause_work() {
	...
	if (!READ_ONCE(xe->wedged.shutting_down) && reply =3D=3D XE_WEDGE_REPLY_CO=
NTINUE)
		wedge_declare_now(xe, DRM_WEDGE_RECOVERY_NONE, true);
	else
		xe_info(xe, "Inspection released without permanent wedge; GTs remain stop=
ped\n");
put_runtime_ref:
	xe_pm_runtime_put(xe);
clear_pending:
	atomic_set(&xe->wedged.declare_pending, 0);
}

Because wedge_request() does not check xe_wedged(xe) in mode 3 before queui=
ng
pause_work again, a subsequent wedge request after XE_WEDGE_REPLY_CONTINUE =
(or
after another path sets xe->wedged.flag) can re-enter wedge_pause_work() and
call xe_gt_wedge_pause() -> xe_tlb_inval_debug_pause(), setting
tlb_inval->debug_paused =3D true again. When the user replies
XE_WEDGE_REPLY_CONTINUE to that second pause, wedge_declare_now() returns
early at:

	if (atomic_xchg(&xe->wedged.flag, 1))
		return;

before reaching xe_tlb_inval_reset(&gt->tlb_inval), leaving
tlb_inval->debug_paused permanently true.

Furthermore, each time xe_gt_wedge_pause() runs on repeated pauses (or when
xe_gt_wedge_declare() later runs), it calls xe_uc_wedge_declare() ->
xe_guc_submit_wedge():

drivers/gpu/drm/xe/xe_guc_submit.c:xe_guc_submit_wedge() {
	...
	if (xe_wedge_is_hanging_on_any(READ_ONCE(xe->wedged.mode))) {
		mutex_lock(&guc->submission_state.lock);
		xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
			if (xe_exec_queue_get_unless_zero(q))
				set_exec_queue_wedged(q);
		mutex_unlock(&guc->submission_state.lock);
	}
}

Since xe_guc_submit_wedge() grabs a new reference via
xe_exec_queue_get_unless_zero(q) without checking !exec_queue_wedged(q), wh=
ile
guc_submit_fini() only drops one reference per wedged queue, wouldn't repea=
ted
calls leak xe_exec_queue references?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102210242.6352=
07-1-daniel.charles@intel.com?part=3D2
