Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED674606A33A
	for <intel-xe@archiver.kernel.org>; Thu,  5 Nov 2026 15:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NSScQXxV
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B95C511254F;
	Thu,  5 Nov 2026 15:06:54 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61C1811254F
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Nov 2026 15:06:48 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id E91C543BAF;
 Thu,  5 Nov 2026 15:06:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A60371F00919;
 Thu,  5 Nov 2026 15:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793891207;
 bh=0/5NLrf3xHqSH09Ot2gK8lTR6/a/5pi31jNjfYR8A/s=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=NSScQXxVag1RlbM+9co2BogMFPoIgjNWmG5mfBSVLT1xz+2juhyhCb80/+aQugQ2U
 oE07IqZIUiIto0pBWXCBL81IU30j7U611XsrxJXCZRH9A2/63UMrhuqd3p4m1Dp+pp
 FAEJMUJpPv+3PFwxTd07tVmNbucCCg9cmqYg7gMkDdbOSjc/ZUBsnRUqGrusJF1yz2
 8QdyOiirQ7Ck/Gmw05I6xEiHgx1pLgUjeRKkBoXkFl+AL9Qgs9MXtV00tFOU+Z/fmd
 k5oz1Bd9Fxgb2cXVUflPd1OuJDjG1Aoi8RhqiAKLLCuVEug9tIxofRxmPu1Rmea3Y2
 C/TWvGFi1p2HA==
Message-ID: <sashiko-outbox-199288@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [CI 2/2] drm/xe/pm: skip BO eviction on iGPU for
 non-hibernation sleep
To: "Matthew Auld" <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261105143547.1089207-4-matthew.auld@intel.com>
References: <20261105143547.1089207-3-matthew.auld@intel.com>
 <20261105143547.1089207-4-matthew.auld@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 15:06:47 +0000
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

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] drm/xe/pm: unblocked LR VM rebind worker during S2idle/S3 in xe_pm=
_notifier_callback()
--

commit 02558a47cf40f27ef297c0a97e9f30441e04b641
Author: Matthew Auld <matthew.auld@intel.com>

drm/xe/pm: skip BO eviction on iGPU for non-hibernation sleep

This commit distinguishes S4 hibernation from S2idle and S3 suspend and
skips BO eviction and pinned BO preparation on iGPU platforms when not
creating a hibernation image.

> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index f483b565d323f..a24424b0d1dd2 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
[ ... ]
> @@ -452,8 +460,13 @@ static int xe_pm_notifier_callback(struct notifier_b=
lock *nb,
>  				   unsigned long action, void *data)
>  {
>  	struct xe_device *xe =3D container_of(nb, struct xe_device, pm_notifier=
);
> +	bool hibernate =3D (action =3D=3D PM_HIBERNATION_PREPARE ||
> +			  action =3D=3D PM_POST_HIBERNATION);
>  	int err =3D 0;
> =20
> +	if (!xe_pm_needs_bo_evict(xe, hibernate))
> +		return NOTIFY_DONE;

[Severity: High]
Does returning early from xe_pm_notifier_callback() on iGPU during
PM_SUSPEND_PREPARE and PM_POST_SUSPEND leave long-running VM rebind workers
unblocked across S2idle and S3 suspend?

By returning before the switch statement when xe_pm_needs_bo_evict() is
false, xe_pm_notifier_callback() skips reinit_completion(&xe->pm_block) on
PM_SUSPEND_PREPARE as well as complete_all(&xe->pm_block) and
xe_pm_wake_rebind_workers(xe) on PM_POST_SUSPEND.

Long-running VMs in preempt-fence mode run preempt_fence_work_func() on
xe->preempt_fence_wq and preempt_rebind_work_func() on xe->ordered_wq,
neither of which is allocated with WQ_FREEZABLE. Instead,
preempt_rebind_work_func() relies on xe->pm_block to park itself onto
xe->rebind_resume_list during system sleep:

drivers/gpu/drm/xe/xe_vm.c:preempt_rebind_work_func() {
	...
	if (!try_wait_for_completion(&vm->xe->pm_block) && vm_suspend_rebind_worke=
r(vm)) {
		up_write(&vm->lock);
		/* We don't actually block but don't make progress. */
		xe_pm_might_block_on_suspend();
		return;
	}
	...
}

When a preempt fence signals during suspend preparation or while
xe_gt_suspend() -> xe_uc_suspend() stops GuC submission:

preempt_fence_work_func()
  -> q->ops->suspend_wait(q)
  -> xe_vm_queue_rebind_worker(q->vm)

guc_exec_queue_wait_suspend_done() can also return early once
xe_guc_read_stopped(guc) becomes true while ge->suspend_pending is still se=
t.

Because xe->pm_block remains completed, try_wait_for_completion() in
preempt_rebind_work_func() and xe_gpuvm_validate() returns true instead of
parking the worker. Can preempt_rebind_work_func() then run concurrently wi=
th
or after xe_gt_suspend(), pushing TLB invalidations while the GT is
suspended and calling resume_and_reinstall_preempt_fences() ->
q->ops->resume(q) -> __guc_exec_queue_resume(), hitting:

	xe_gt_assert(guc_to_gt(guc), !ge->suspend_pending ||
		     exec_queue_killed_or_banned_or_wedged(q));

Would it make sense to still manage xe->pm_block and
xe_pm_wake_rebind_workers(xe) in xe_pm_notifier_callback() even when BO
eviction is skipped?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105143547.1089=
207-4-matthew.auld@intel.com?part=3D1
