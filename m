Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E92BC79F9F
	for <intel-xe@archiver.kernel.org>; Thu, 10 Sep 2026 12:36:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FA6910E5E7;
	Thu, 10 Sep 2026 12:36:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hGkqWyFf";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 670B010E5E7
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Sep 2026 12:36:53 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id ABFB4600CB;
 Thu, 10 Sep 2026 12:36:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 436341F000FF;
 Thu, 10 Sep 2026 12:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1789043812;
 bh=CLXd+WjuTumP1fs5yg8ikUEZBfaY7BGEBBTQ2SgiMZo=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=hGkqWyFfYwCoi+mDCJzaiDTabnP7VquY0ycaz4nlJtczHoQLLYotjXGeRbwJ8sHgc
 TtnW2Rb3Pt7UphciaPgLX3bqQfjDnmDTEwoa0H2nkj+RDTxndw/sdrwmkbSURnCNdt
 5fSR3ftfd+NvEbG7ENjwjxmKuZuVgoF59mYG4M2+zYaoLCKg/PPJKdp0yGvTJPxiT4
 yPQWJk4E5jBvfpaDYYb+PdQqVFrdPpyx9+bSL3Go0BE+VRT5W27mXkoR+epiXq0GmS
 aJMW+26EGG47sTvgfW652KcwBStzpqKUNUUYad2866hN6ps9Nsdhjggwhy5xSigOzp
 LuucYDeG9t0bQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/1] drm/xe/guc: Fix wake_up race in handle_sched_done
To: "Jakub Legowski" <jakub.legowski@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260910121759.1835037-1-jakub.legowski@intel.com>
References: <20260910121759.1835037-1-jakub.legowski@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 12:36:51 +0000
Message-Id: <20260910123652.436341F000FF@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Low] Misleading documentation and invalid memory barrier pairing between=
 `handle_sched_done()` and `guc_exec_queue_timedout_job()`.

Pre-existing issues:
- [High] Waiters on `guc->ct.wq` will miss wakeups and timeout when a suspe=
nded queue completes its scheduling disable, because `handle_sched_done()` =
fails to wake up the wait queue.
- [High] Waiters on `guc->ct.wq` will miss wakeups and timeout because `han=
dle_sched_done()` restricts `wake_up_all(&guc->ct.wq)` to banned queues onl=
y.
--

commit 93d97b23543a66d34d37e760d853aee106ea33dd
Author: Jakub Legowski <jakub.legowski@intel.com>

drm/xe/guc: Fix wake_up race in handle_sched_done

This commit moves the wake_up_all() call in handle_sched_done() after
clearing the pending_disable state. This ensures waiters in
guc_exec_queue_timedout_job() observe the updated state when woken.

> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_g=
uc_submit.c
> index 99d8c807ff056..a181b50422934 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
[ ... ]
> @@ -3239,25 +3239,27 @@ static void handle_sched_done(struct xe_guc *guc,=
 struct xe_exec_queue *q,
>  		if (q->guc->suspend_pending) {
>  			clear_exec_queue_pending_disable(q);
>  			suspend_fence_signal(q);

[Severity: High]
This isn't a bug introduced by this patch, but it's a pre-existing issue.
Will waiters on guc->ct.wq miss wakeups here? When a suspended queue
completes its scheduling disable, this branch clears pending_disable but
completely bypasses calling wake_up_all(&guc->ct.wq).

For example, if disable_scheduling_deregister() is waiting on guc->ct.wq
for pending_disable to clear, and handle_sched_done() takes this
suspend_pending branch, it seems the waiter will hit the 5-second timeout
and trigger a spurious GT reset.

>  		} else {
> +			bool destroyed =3D exec_queue_destroyed(q);
> +
> +			/*
> +			 * Make sure to clear the pending_disable only
> +			 * after sampling the destroyed state. We want
> +			 * to ensure we don't trigger the unregister too
> +			 * early with something intending to only
> +			 * disable scheduling. The caller doing the
> +			 * destroy must wait for an ongoing
> +			 * pending_disable before marking as destroyed.
> +			 */
> +			clear_exec_queue_pending_disable(q);
> +
>  			if (exec_queue_banned(q)) {
> +				/* Pairs with smp_rmb in guc_exec_queue_timedout_job */
> +				smp_wmb();

[Severity: Low]
Is this memory barrier pairing valid? The smp_rmb() in
guc_exec_queue_timedout_job() is placed outside the wait_event_timeout()
loop:

guc_exec_queue_timedout_job() {
        ...
        smp_rmb();
        ret =3D wait_event_timeout(guc->ct.wq,
                                 !xe_uc_fw_is_running(&guc->fw) ||
                                 ...
}

Since wait_event_timeout() evaluates the condition in a loop, an external
smp_rmb() provides no ordering guarantees for subsequent evaluations of the
condition. The lock inside the waitqueue already provides the necessary full
memory barriers.

>  				wake_up_all(&guc->ct.wq);
>  			}

[Severity: High]
This isn't a bug introduced by this patch, but it's a pre-existing issue.
Does restricting the wakeup to only banned queues strand waiters on
non-banned queues?

In guc_exec_queue_timedout_job() for a multi-queue secondary, the secondary
queue is banned, but disable_scheduling() and the wait are performed on
the primary queue. Since the primary is not banned, when its SCHED_DONE
arrives, handle_sched_done() clears pending_disable but skips the wakeup
because exec_queue_banned(primary) is false.

This leaves threads waiting on guc->ct.wq to hit their timeout, leading to
spurious GT resets during multi-queue timeout recovery or normal teardown
races.

> -			if (exec_queue_destroyed(q)) {
[ ... ]
> -				clear_exec_queue_pending_disable(q);
> +
> +			if (destroyed)
>  				deregister_exec_queue(guc, q);
>  		}
>  	}
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910121759.1835=
037-1-jakub.legowski@intel.com?part=3D1
