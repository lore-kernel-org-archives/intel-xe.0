Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E70C9C624A4
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 15:43:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AC4010E433;
	Thu,  3 Sep 2026 15:43:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="apFKsE8o";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 572D810E433
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 15:43:21 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 8584D60A52;
 Thu,  3 Sep 2026 15:43:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 266C71F00A3A;
 Thu,  3 Sep 2026 15:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788450200;
 bh=QGEEN84Bk6IoFvhEPpgYcvRsC8rue4PUXNxOKFfkD5Q=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=apFKsE8oChGPFcuif7TBrD1oSJjY+TJ+6kuWYD5yPys01rW2ukjaOxBP3+R+vuHkI
 nzyzeYhl+WYN1lYyhp2QheKoySESbeVq+/R5amXG8M06iNUgQLh2nWid0WIYGO4C4k
 TZ3OMvr7HJla6X0MiN1BAtuvw9KXQ/yX6BvihPoeWQFNRiSK4+8s4FJk6kOxc1LCDH
 TX2EFcESv6x65eCAv5tuy6ei0KevZfsSXeqM9pfuGn5aozX3u+pr4t1qlzoX27ptAS
 ztHcUBEPrpIPumBRoTyWWK+dkWjTQY6bIOqXVSAgtCF/CV1fJwAKfHbqOxAs3vzmz3
 cKYJclbkva++g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 26/27] drm/xe/eudebug: Introduce EU pagefault
 handling interface
To: "Mika Kuoppala" <mika.kuoppala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260903145952.848051-27-mika.kuoppala@linux.intel.com>
References: <20260903145952.848051-1-mika.kuoppala@linux.intel.com>
 <20260903145952.848051-27-mika.kuoppala@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 15:43:19 +0000
Message-Id: <20260903154320.266C71F00A3A@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [Critical] Race condition in `queue_pagefault` when accessing `epf->d` af=
ter unlocking causes Use-After-Free and double-put.
- [High] Unverified ASID in `xe_eudebug_pagefault_start` groups unrelated p=
agefaults, causing VMA destruction under the wrong VM lock and triggering l=
ockdep failures.
- [High] Missing NULL check for `vm->xef` in `xe_eudebug_pagefault_start` a=
nd `xe_eudebug_pagefault_creatable` causes a kernel panic for kernel/migrat=
e VMs.
- [High] Non-recoverable error in `send_queued_pagefaults` triggers a full =
GPU reset, enabling a Denial of Service via queue destruction.
- [High] Deferring finalization in `xe_eudebug_pagefault_end` hangs the sta=
te machine if subsequent pagefaults fail to initialize.
- [Medium] Failure to clear `TD_CTL_FORCE_EXCEPTION` in `eudebug_pagefault_=
finalize` ignores a hardware timeout without triggering a recovery reset.
--

commit b7afc29c50bd1c63ce9ec88327c0929d8ad87515
Author: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Subject: drm/xe/eudebug: Introduce EU pagefault handling interface

The XE2 (and PVC) HW has a limitation that the pagefault due to invalid
access will halt the corresponding EUs. To solve this problem, introduce
EU pagefault handling functionality, which allows to unhalt pagefaulted
eu threads and to EU debugger to get inform about the eu attentions state
of EU threads during execution.

> diff --git a/drivers/gpu/drm/xe/xe_eudebug_pagefault.c b/drivers/gpu/drm/=
xe/xe_eudebug_pagefault.c
> new file mode 100644
> index 0000000000000..5ad37e757f692
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_eudebug_pagefault.c

[ ... ]

> +int
> +xe_eudebug_pagefault_start(struct xe_vm *vm, struct xe_pagefault *pf)
> +{
> +	struct pagefault_fence *pf_fence;
> +	struct xe_eudebug_pagefault *epf;
> +	struct xe_gt *gt =3D pf->gt;
> +	struct xe_exec_queue *q;
> +	struct dma_fence *fence;
> +	struct xe_eudebug *d;
> +	unsigned long tdctl_timeout;
> +	unsigned int fw_ref;
> +	int lrc_idx;
> +	u32 td_ctl;
> +
> +	if (!xe_eudebug_is_enabled(vm->xe))
> +		return -EOPNOTSUPP;
> +
> +	d =3D xe_eudebug_get_nolock_with_discovery(vm->xef);
> +	if (!d)
> +		return -ENOENT;

[Severity: High]
Does this code handle kernel VMs safely?  Kernel VMs like the migration VM
created via xe_vm_create_bare() will have a NULL xef.  If a page fault occu=
rs
in a kernel VM and is passed to xe_eudebug_pagefault_start(), could this
trigger a NULL pointer dereference when xe_eudebug_get_nolock_with_discover=
y()
dereferences xef->xe?

> +
> +	q =3D xe_gt_runalone_active_queue_get(gt, &lrc_idx);
> +	if (IS_ERR(q))
> +		goto err_put_eudebug;
> +
> +	if (XE_WARN_ON(q->vm !=3D vm))
> +		goto err_put_exec_queue;
> +
> +	if (!xe_exec_queue_is_debuggable(q))
> +		goto err_put_exec_queue;
> +
> +	/**
> +	 * Check if there is an active pagefault.
> +	 * If so, attach original epf to current pagefault and leave.
> +	 */
> +	mutex_lock(&d->xe->eudebug.lock);
> +	if (d->pf.active || d->pf.first) {
> +		epf =3D kzalloc_obj(*epf, GFP_KERNEL);
> +		if (!epf) {
> +			mutex_unlock(&d->xe->eudebug.lock);
> +			goto err_put_exec_queue;
> +		}
> +		d->pf.active++;
> +		goto out_set_epf;
> +	}

[Severity: High]
Is it safe to group page faults without verifying they belong to the same A=
SID?
If multiple VMs belonging to the same xe_file trigger page faults concurren=
tly,
the page fault workqueue will process them in parallel.

Could this logic erroneously group them just by incrementing pf.active with=
out
checking if pf->consumer.asid matches d->pf.asid?

If an unrelated page fault drops pf.active to 0 and calls destroy_pagefault=
()
on the first page fault, could this attempt to destroy the first VM's VMA w=
hile
holding the second VM's write lock, resulting in data corruption and a lock=
dep
failure?

[ ... ]

> +static void queue_pagefault(struct xe_eudebug *d,
> +			    struct xe_eudebug_pagefault *epf)
> +{
> +	lockdep_assert_held(&epf->q->vm->lock);
> +
> +	mutex_lock(&d->pf.lock);
> +
> +	if (epf->null_vma) {
> +		eudebug_destroy_vma(epf->q->vm, epf->null_vma);
> +		epf->null_vma =3D NULL;
> +	}
> +
> +	list_add_tail(&epf->link, &d->pf.pagefaults);
> +	mutex_unlock(&d->pf.lock);
> +
> +	/* Queued is equivalent of sent. Drop references */
> +	xe_eudebug_put(epf->d);
> +	epf->d =3D NULL;
> +}

[Severity: Critical]
Is there a use-after-free race condition here?

Once epf is added to the pagefaults list and the lock is dropped, a concurr=
ent
thread like attention_poll_work() could acquire the lock, process the entry,
and free epf via destroy_pagefault().

If the concurrent thread frees epf before xe_eudebug_put() is called, could
this result in putting a reference on freed memory and writing NULL to a fr=
eed
pointer?

[ ... ]

> +static int send_queued_pagefaults(struct xe_eudebug *d)
> +{
> +	struct xe_eudebug_pagefault *epf, *epf_temp;
> +	int ret =3D 0;
> +
> +	mutex_lock(&d->pf.lock);
> +	list_for_each_entry_safe(epf, epf_temp, &d->pf.pagefaults, link) {
> +		ret =3D xe_eudebug_send_pagefault_event(d, epf);
> +
> +		if (ret =3D=3D -ENOSPC) {
> +			ret =3D 0;
> +			break;
> +		}
> +
> +		list_del(&epf->link);
> +
> +		destroy_pagefault(epf);
> +
> +		if (ret)
> +			break;
> +	}
> +	mutex_unlock(&d->pf.lock);
> +	return ret;
> +}

[Severity: High]
Does returning early on failure here introduce a denial of service vector?

If an execution queue is destroyed while its page fault is queued,
xe_eudebug_send_pagefault_event() will return -ENOENT.  Breaking the loop h=
ere
will propagate that error back up to attention_poll_work().

Because attention_poll_work() treats any non-zero return (other than -EBUSY)
as a fatal error and triggers a full GPU reset via handle_attention_fail(),
could a malicious application intentionally fault and immediately destroy t=
he
queue to force a reset of the entire GPU?

[ ... ]

> +static int
> +eudebug_pagefault_finalize(struct xe_eudebug_pagefault *epf, int err)
> +{
> +	struct xe_gt *gt =3D epf_to_gt(epf);
> +	struct xe_eudebug *d;
> +	unsigned long tdctl_timeout;
> +	unsigned int fw_ref;
> +	bool queued =3D false;
> +	u32 td_ctl, ret =3D 0;
> +
> +	fw_ref =3D xe_force_wake_get(gt_to_fw(gt), epf->q->hwe->domain);
> +	if (!fw_ref) {
> +		struct xe_device *xe =3D gt_to_xe(gt);
> +
> +		drm_warn(&xe->drm, "Forcewake fail: Can not recover TD_CTL");
> +	} else {
> +		td_ctl =3D xe_gt_mcr_unicast_read_any(gt, TD_CTL);
> +		tdctl_timeout =3D jiffies + msecs_to_jiffies(XE_GT_ATTENTION_TIMEOUT_M=
S);
> +		do {
> +			xe_gt_mcr_multicast_write(gt, TD_CTL, td_ctl &
> +						  ~(TD_CTL_FORCE_EXCEPTION));
> +			usleep_range(200, 220);
> +			td_ctl =3D xe_gt_mcr_unicast_read_any(gt, TD_CTL);
> +
> +			if ((td_ctl & TD_CTL_FORCE_EXCEPTION) &&
> +			    time_after(jiffies, tdctl_timeout)) {
> +				eu_err(epf->d, "Failed to clear Force Exception!!!");
> +				break;
> +			}
> +		} while (td_ctl & TD_CTL_FORCE_EXCEPTION);

[Severity: Medium]
Should a failure to clear the TD_CTL_FORCE_EXCEPTION bit trigger a recovery
reset?

If the hardware fails to clear the exception bit within the timeout window,
this loop breaks and logs an error, but it does not propagate a hard failure
or initiate a reset.

Could this silent swallow of the hardware timeout leave the Execution Units
permanently halted and the workload stuck in an unrecoverable state?

[ ... ]

> +void xe_eudebug_pagefault_end(void *private, int err)
> +{
> +	struct xe_eudebug_pagefault *epf =3D _get_epf(private);
> +	struct xe_eudebug_pagefault *first_epf =3D NULL;
> +	struct xe_pagefault_queue *pf_queue;
> +	struct xe_device *xe;
> +	struct xe_eudebug *d;
> +	struct xe_vm *vm;
> +	int resume_attn =3D 0, destroy_pf =3D 0;
> +
> +	if (!epf)
> +		return;
> +
> +	xe =3D epf->q->xef->xe;
> +	pf_queue =3D &xe->usm.pf_queue;
> +
> +	d =3D epf->d;
> +	vm =3D xe_vm_get(epf->q->vm);
> +	/* Need to have outher vm lock for eudebug lock as for pf start */
> +	down_write(&vm->lock);
> +	mutex_lock(&d->xe->eudebug.lock);
> +	if (!--d->pf.active) {
> +		/*
> +		 * This will also catch entries that are popped from pagefault
> +		 * queue and moved to worker but not yet processed.
> +		 * xe_eudebug_pagefault_start() will catch later it and increase
> +		 * the pf.active counter.
> +		 */
> +		if (!xe_eudebug_pagefault_queue_has_asid(pf_queue, d->pf.asid)) {
> +			if (!err)
> +				xe_eudebug_pagefault_process(d->pf.first);
> +
> +			destroy_pf =3D eudebug_pagefault_finalize(d->pf.first, err);
> +			/* If d->pf.first was queued the epf shall be removed. */
> +			if (epf !=3D d->pf.first) {
> +				if (destroy_pf)
> +					first_epf =3D d->pf.first;
> +				else
> +					destroy_pf =3D 1;
> +			}
> +			d->pf.first =3D NULL;
> +			d->pf.asid =3D 0;
> +			resume_attn =3D 1;
> +		} else {
> +			/* page faults still queued */
> +			if (epf !=3D d->pf.first)
> +				destroy_pf =3D 1;
> +		}

[Severity: High]
Does deferring finalization when page faults are still queued risk deadlock=
ing
the state machine?

If xe_eudebug_pagefault_queue_has_asid() is true, eudebug_pagefault_finaliz=
e()
is deferred on the assumption that the next queued page fault will successf=
ully
attach to the eudebug state machine.

If the next page fault fails in xe_eudebug_pagefault_start() (for example, =
if
the exec queue is no longer debuggable), eudebug setup is skipped.  When th=
at
fault completes, xe_eudebug_pagefault_end() will receive a NULL private poi=
nter
and return early.

Could this leave pf.active at 0 while eudebug_pagefault_finalize() is never
called, permanently hanging the GPU with TD_CTL_FORCE_EXCEPTION still active
and deadlocking EU_CONTROL ioctls waiting on the unsignaled pf.fence?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903145952.8480=
51-1-mika.kuoppala@linux.intel.com?part=3D26
