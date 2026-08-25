Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5971CC61DB9
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 20:54:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CAA610E23C;
	Tue, 25 Aug 2026 20:54:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ETMbPmeh";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 807D110E23C
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Aug 2026 20:54:40 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 3724640626;
 Tue, 25 Aug 2026 20:54:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 060CF1F000E9;
 Tue, 25 Aug 2026 20:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787691280;
 bh=0J/un+FYcuJYrxOjAR2uj4AZzhgUd/5C23duZyCkK7Y=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=ETMbPmehaV+qSuxwGWd28/XQePsGy90TwwbLR+E2BFwLkkvyEvp1Lmpdsw19hfbhb
 BI3JQ+bw3Hmwm2LPO5L5nX+/hODOUV8t2219zAkMR3JO+Ao1A5yr5OTID3iFrV0ewo
 ypOe3ah8PN6/5x0GOyCo4lI+T2cT8kkoLwJkOLm/3s1DCj2hl3Bx0J96mkwzoW2rxT
 Tkge41nTXc58Rz+nXgawSPFsyBGs2Jygst/SL+5yqxECN5NoPqhHy3I6yFeAfd2PUh
 Sb6mHsxKgu71nlz45JmxoSHQiMsrWphkGXvsMQtu6f0wCvfKBTbGdk4eCCwg4f3+WV
 vW+lCfR87cwlg==
From: sashiko-bot@kernel.org
Subject: Re: [CI] drm/xe: Disable scheduling early on FD close to avoid CAT
 error cascade
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260825203506.1791216-1-matthew.brost@intel.com>
References: <20260825203506.1791216-1-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 20:54:39 +0000
Message-Id: <20260825205440.060CF1F000E9@smtp.kernel.org>
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
- [High] A data race on the shared static message buffer causes a Power Man=
agement (PM) runtime reference leak when an exec queue is killed concurrent=
ly.
- [Medium] Double-disable of scheduling when KILL message races with TDR, p=
otentially causing an unnecessary GT reset.
--

commit cb0a16de6bfaa13bc0da2d9c7548fe3a5d58a847
Author: Matthew Brost <matthew.brost@intel.com>
Subject: drm/xe: Disable scheduling early on FD close to avoid CAT error ca=
scade

This commit introduces a mechanism to eagerly disable scheduling on FD close
by sending a self-message (KILL) outside of the TDR path. This prevents
contexts with invalid page tables from continuing to schedule, avoiding CAT
error cascades.

> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_g=
uc_submit.c
> index 99d8c807ff056..33ef884cd3162 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
[ ... ]
> @@ -2130,11 +2144,39 @@ static int guc_exec_queue_init(struct xe_exec_que=
ue *q)
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

[Severity: High]
Could this cause a Power Management (PM) runtime reference leak if multiple
threads call this concurrently?

When an exec queue is killed, this code enqueues the shared static KILL
message. Since guc_exec_queue_try_add_msg() checks list_empty(), what
happens if the background worker has already dequeued this message and is
currently processing it?

If a second concurrent kill re-enqueues the same static message,
guc_exec_queue_add_msg() will overwrite msg->opcode, temporarily clearing
the MSG_PM_REF flag:

xe_guc_submit.c:guc_exec_queue_add_msg() {
    ...
    msg->opcode =3D opcode & OPCODE_MASK;
    if (bound) {
        xe_pm_runtime_get_noresume(xe);
        msg->opcode |=3D MSG_PM_REF;
    }
    ...
}

Meanwhile, the worker might be concurrently reading msg->opcode without a
lock in guc_exec_queue_process_msg():

    bool pm_ref =3D !!(msg->opcode & MSG_PM_REF);

If the worker observes MSG_PM_REF as 0, could it skip xe_pm_runtime_put()
and permanently leak the PM runtime reference?


[Severity: Medium]
Could queuing this KILL message race with the TDR worker and cause an
unnecessary full GT reset?

The commit intentionally queues both the KILL message and the TDR worker
simultaneously when a queue is killed. If the KILL message executes first,
it calls disable_scheduling() which sets pending_disable.

When TDR executes guc_exec_queue_timedout_job(), it enters its disable block
because pending_disable is true, waits for it to clear, and then
unconditionally calls disable_scheduling() again:

xe_guc_submit.c:guc_exec_queue_timedout_job() {
    ...
    disable_scheduling(primary, skip_timeout_check);
    ...
}

If the GuC firmware rejects this redundant state change and does not return
a successful SCHED_DONE response, could TDR's subsequent wait time out and
trigger a stall followed by a full GT reset?

> +		xe_sched_msg_unlock(sched);
> +	}
> +
>  	xe_guc_exec_queue_trigger_cleanup(q);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825203506.1791=
216-1-matthew.brost@intel.com?part=3D1
