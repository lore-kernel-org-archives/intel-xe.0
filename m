Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F37CC61DFD
	for <intel-xe@archiver.kernel.org>; Tue,  1 Sep 2026 01:39:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AD3C10E01F;
	Tue,  1 Sep 2026 01:39:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gCVtIOfN";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0037310E01F
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Sep 2026 01:39:23 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 588C24095C;
 Tue,  1 Sep 2026 01:39:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 105D01F000E9;
 Tue,  1 Sep 2026 01:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788226763;
 bh=c0Ahoe7bR5tvg9AdBFqyxZMtw3LxDZ7PGQLwBHYObnE=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=gCVtIOfN/UZdGxDlhDoYdZ6wydVYngfZWgjfCWFr1dzac59Eu0iLZBAts9sEroTHX
 1xpW27BZqubFzVD59m7aBgu4RfS/JzoSO+Ml9pGtPil/AUTWNQlbYleNjL4GeGeOHt
 3Eg+eE+4XWTrQQ9rw/Fxcf5DJYncR18NMb2veUeSI+MsXvRj38Q/Fs/yIIBz3k01Qw
 0jTGAkFCPqhDk9+CtsufytfDIuwANZxt/XDRTmcwwSQtXPmsd0woGDsTrsc2LLk1n3
 otNG6lYnpOXqfIZ88vL7aLAej7DqTyi9UZdlvkkQvMrBUbsyF8K8vECiDu3k5H3vF9
 5vwEiF7atQnRg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] drm/xe: Disable scheduling early on FD close to
 avoid CAT error cascade
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260901011712.2617466-2-matthew.brost@intel.com>
References: <20260901011712.2617466-1-matthew.brost@intel.com>
 <20260901011712.2617466-2-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 01:39:22 +0000
Message-Id: <20260901013923.105D01F000E9@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Concurrent execution of the eager KILL message and TDR paths cause=
s a race condition in `disable_scheduling`, leading to a kernel crash via a=
ssertion failure.
--

commit d3677dc009f33b1e4d7baf0b32baa9087773e1dd
Author: Matthew Brost <matthew.brost@intel.com>

drm/xe: Disable scheduling early on FD close to avoid CAT error cascade

This commit mitigates CAT error cascades when an FD is closed with many
exec queues. It achieves this by eagerly sending a self-message to disable
scheduling outside of the slower, serialized TDR path.

> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_g=
uc_submit.c
> index 5223f27825033..9b9279ab7930c 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
[ ... ]
> +static void __guc_exec_queue_process_msg_kill(struct xe_sched_msg *msg,
> +					      bool bound)
> +{
> +	struct xe_exec_queue *q =3D msg->private_data;
> +	struct xe_exec_queue *primary =3D xe_exec_queue_multi_queue_primary(q);
> +
> +	if (exec_queue_enabled(primary) && bound)
> +		disable_scheduling(primary, true);

[Severity: High]
Is it possible for this call to disable_scheduling() to race with the TDR p=
ath?

Calling disable_scheduling() from __guc_exec_queue_process_msg_kill() witho=
ut
additional synchronization can race with the TDR's own call to
disable_scheduling().=20

If both paths execute concurrently, it will trigger the exclusive state
transition assertion in disable_scheduling() and crash the kernel:

	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_disable(q));

> +}
> +
[ ... ]
>  static void guc_exec_queue_kill(struct xe_exec_queue *q)
>  {
> +	struct xe_sched_msg *msg =3D q->guc->static_msgs + STATIC_MSG_KILL;
> +
>  	trace_xe_exec_queue_kill(q);
>  	set_exec_queue_killed(q);
>  	__suspend_fence_signal(q);
> +
> +	/*
> +	 * We eagerly send a message to ourselves to disable scheduling, as the
> +	 * TDR is serialized (i.e., only one exec queue is processed at a time).
> +	 * If an FD is closed with many exec queues, the TDR can be slower than
> +	 * the GuC scheduling contexts with invalid page tables, creating a
> +	 * cascade of CAT errors and engine resets, which is quite slow. Avoid
> +	 * this by immediately disabling scheduling outside of the TDR.
> +	 */
> +	if (kref_read(&q->refcount) && !exec_queue_wedged(q)) {
> +		struct xe_gpu_scheduler *sched =3D &q->guc->sched;
> +
> +		xe_sched_msg_lock(sched);
> +		guc_exec_queue_try_add_msg(q, msg, KILL);
> +		xe_sched_msg_unlock(sched);
> +	}
> +
>  	xe_guc_exec_queue_trigger_cleanup(q);

[Severity: High]
Could scheduling the KILL message alongside the TDR cleanup lead to concurr=
ent
execution?

This sequence schedules the KILL message on the submit workqueue and then c=
alls
xe_guc_exec_queue_trigger_cleanup() to schedule the TDR on the ordered
workqueue.=20

Because of a potential data race, the KILL message's worker could be queued
after the TDR has called cancel_work_sync(), leading directly to the concur=
rent
calls to disable_scheduling() discussed above.

>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901011712.2617=
466-1-matthew.brost@intel.com?part=3D2
