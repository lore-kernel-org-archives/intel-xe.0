Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 249F8CA9ED0
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 02:59:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD26910E027;
	Tue, 13 Oct 2026 02:59:49 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6BF010E027
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Oct 2026 02:59:43 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 5C3B141864;
 Tue, 13 Oct 2026 02:59:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B1CF1F000FF;
 Tue, 13 Oct 2026 02:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1791860383;
 bh=otkrE4mq6VzMI8em5cSBEE5RNNxcHadmhajwFgI2mZ0=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=P4WXo9ZpHLgZGEU0NnFcxZj0nprInt9iouv6TgGC0H67gpG1ygzWNxtpbpVu6+1uR
 NwDcXFoNzT4R1J/GfO0DrgJA8jE6L2DwX6to1KlBxE7iuFwmrwGcD5CiHYEzLIKMX3
 9PagPeVtcbiLLbyp2xmSe0ozr8j/c+NzGpysCqQCBP84jdbftO3TyCeBvn3njTIBkQ
 ZIfPh0LGdEVJGcP8iiAcE1rHN8UZDKcbaONn0M6O9+Pj0K1bK9oUCcljIa5x7QqR9Y
 TAXPr2WdtyC0ZBAK6gcWvJrbP1yOCCCY5z5ndFpT4PAItb7/AGcXSWbHobMnYNqMUN
 8/yr02NXHTnhg==
Message-ID: <sashiko-outbox-168881@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] drm/xe: Synchronously wait for queue kill on FD close
To: "Daniel Charles" <daniel.charles@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261013023442.206915-4-daniel.charles@intel.com>
References: <20261013023442.206915-1-daniel.charles@intel.com>
 <20261013023442.206915-4-daniel.charles@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 02:59:42 +0000
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
- [High] drm/xe: Infinite wait in guc_exec_queue_kill_sync() if GuC hangs
- [High] xe: missing queue kill synchronization in teardown paths
--

commit 85f52ae759a601199a902ba124e22498f6e78a14
Author: Daniel Charles <daniel.charles@intel.com>

drm/xe: Synchronously wait for queue kill on FD close

The early KILL message disables GuC scheduling outside the serialized
TDR path, but xe_file_close() does not wait for it to complete before
dropping queue references. Split FD close teardown into two passes:
first kill every queue, then wait using xe_exec_queue_kill_sync().

> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_e=
xec_queue.c
> index 7ade915c59a85..af5d9e8f0b16e 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
[ ... ]
> @@ -1623,6 +1623,19 @@ void xe_exec_queue_kill(struct xe_exec_queue *q)
> +/**
> + * xe_exec_queue_kill_sync() - Wait for queue scheduling to stop
> + * @q: The exec queue
> + *
> + * This function waits for the backend to finish stopping the queue after
> + * xe_exec_queue_kill(). It is safe to call multiple times.
> + */
> +void xe_exec_queue_kill_sync(struct xe_exec_queue *q)
> +{
> +	if (q->ops->kill_sync)
> +		q->ops->kill_sync(q);
> +}

[Severity: High]
Does this code leave other teardown paths vulnerable to CAT errors?

While xe_file_close() was updated to use this new sync function, it appears
xe_exec_queue_destroy_ioctl() and xe_vm_close_and_put() both still call
xe_exec_queue_kill() followed immediately by xe_exec_queue_put() without
waiting.

If userspace destroys a user queue and then destroys its VM,
xe_vm_close_and_put() synchronously destroys the VM's page tables while GuC
is still actively scheduling the queue. Similarly, for the internal kernel
bind queue (vm->q), xe_vm_close_and_put() kills it and proceeds to destroy
the page tables. This results in GuC scheduling contexts with torn-down
page tables, causing IOMMU CAT errors and unrecoverable engine resets.

[ ... ]
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_g=
uc_submit.c
> index 609af66b343d5..36c8c3766f5fa 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
[ ... ]
> +static void guc_exec_queue_kill_sync(struct xe_exec_queue *q)
> +{
[ ... ]
> +	wait_event(guc->ct.wq,
> +		   (!exec_queue_enabled(primary) &&
> +		    !exec_queue_pending_disable(primary) &&
> +		    !exec_queue_pending_enable(primary)) ||
> +		   xe_guc_read_stopped(guc) ||
> +		   vf_recovery(guc) ||
> +		   exec_queue_wedged(primary));
> +}

[Severity: High]
Can this wait hang forever if the GuC firmware silently drops the H2G DISAB=
LE
message or hangs without triggering a global watchdog wedge?

If called on an idle queue (no pending jobs), the Time-out Driven Recovery
(TDR) will not fire. xe_sched_tdr_queue_imm() calls
drm_sched_tdr_queue_imm(), which only schedules the timeout worker if there
are pending jobs. Even if the worker runs, drm_sched_job_timedout() exits
early if the pending list is empty.

Since this uses an unbounded wait_event() without a timeout, it could cause
the close() syscall to hang forever in uninterruptible sleep (D state),
leading to an unkillable process. Other functions like enable_scheduling()
and disable_scheduling_deregister() use wait_event_timeout() and manually
trigger xe_gt_reset_async() on timeout to prevent this.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013023442.2069=
15-1-daniel.charles@intel.com?part=3D3
