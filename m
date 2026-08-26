Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3341BC61DC2
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 09:50:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAC9210EC8C;
	Wed, 26 Aug 2026 09:50:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FaPACfRc";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A6AE10EC7E
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Aug 2026 09:50:27 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id D976C434D2;
 Wed, 26 Aug 2026 09:50:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 927461F000E9;
 Wed, 26 Aug 2026 09:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787737826;
 bh=Icq/qELDPpXH8i/22Uxk23oFjyZ39tcNCH4Li2hC4OE=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=FaPACfRcXq8tVUL7ajEsFXSrW0cgW0C6z7khqMu/WrcIWaHxWDaCauvui7C+D3ip2
 YkU+wP6v2f+A5kQiFzj2oXj1EW59q0AUhiUh2Ifj05SYGDX1UNTmR0SBMNOX7l7kfI
 r0tsIkyc7ctEFuTkhESzCarr02ptenCPkGEXAOfoEYj+UazQyJ+VJOuBEgv5ctWBpC
 rbigQYevvZ0q5xzAq8yUXCWFhBxIRl0z7PLt+ZMJh+GiYHmXfh2Z97rU83KWnqgNMD
 2ZjtPT3oeSGqtPbeQIGdJr/A6p0hF86sOke+a6n5mdygKRQhXJhkA1dKxF3SVFffhh
 kcjWFpBceM7vA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 1/1] drm/xe/guc: Fix wake_up race in handle_sched_done
To: "Jakub Legowski" <jakub.legowski@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260826093325.3233742-1-jakub.legowski@intel.com>
References: <20260826093325.3233742-1-jakub.legowski@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 26 Aug 2026 09:50:26 +0000
Message-Id: <20260826095026.927461F000E9@smtp.kernel.org>
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

New issues:
- [High] Use-After-Free in handle_sched_done due to dereferencing q after d=
estruction

Pre-existing issues:
- [High] Missing Wakeup / Wait Timeout causing spurious GT resets
--

commit ab601decc69aeaee9b9cfcd355026b894c210277
Author: Jakub Legowski <jakub.legowski@intel.com>

drm/xe/guc: Fix wake_up race in handle_sched_done

When a SCHED_DONE G2H arrives for a banned exec queue, handle_sched_done()
calls wake_up_all() before clear_exec_queue_pending_disable(). This commit
moves the wake_up_all() after clear_exec_queue_pending_disable() to prevent
a race with guc_exec_queue_timedout_job().

> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_g=
uc_submit.c
> index 864859bd0ccc9..dca3ad7b4c149 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -3105,10 +3105,6 @@ static void handle_sched_done(struct xe_guc *guc, =
struct xe_exec_queue *q,
>  			clear_exec_queue_pending_disable(q);
>  			suspend_fence_signal(q);
>  		} else {

[Severity: High]
This isn't a bug introduced by this patch, but does this skip waking up
waiters on guc->ct.wq if a suspend is pending?

If a suspend operation completes here in handle_sched_done(), the code
clears pending_disable but calls suspend_fence_signal(q). On non-VF
platforms, this wakes up q->guc->suspend_wait rather than guc->ct.wq.

Because wake_up_all(&guc->ct.wq) is skipped in this suspend_pending block,
any thread waiting on guc->ct.wq for !pending_disable will time out. Waiters
in guc_exec_queue_timedout_job() or disable_scheduling_deregister() will
hang for 5 seconds and then trigger an unnecessary GT reset.

This can occur under normal operation if a TDR or deregister races with a
queue suspend operation.

While this commit moves the wake_up_all() to ensure waiters observe the
updated state, is it also necessary to wake up guc->ct.wq here?

> -			if (exec_queue_banned(q)) {
> -				smp_wmb();
> -				wake_up_all(&guc->ct.wq);
> -			}
>  			if (exec_queue_destroyed(q)) {
>  				/*
>  				 * Make sure to clear the pending_disable only
[ ... ]
>  				clear_exec_queue_pending_disable(q);
>  				deregister_exec_queue(guc, q);
>  			} else {
>  				clear_exec_queue_pending_disable(q);
>  			}
> +			if (exec_queue_banned(q)) {

[Severity: High]
Can deregister_exec_queue() free the xe_exec_queue q before it is accessed
by exec_queue_banned(q) here in handle_sched_done()?

If q is a multi-queue secondary, deregister_exec_queue() invokes
handle_deregister_done(), which calls __guc_exec_queue_destroy() to queue
the destruction of the queue.

If the queue is wedged, destruction happens synchronously, immediately call=
ing
xe_exec_queue_fini() and freeing q. If not wedged, the destruction occurs
asynchronously on a workqueue, which can execute concurrently and free q.

Either way, q can be freed before handle_sched_done() completes. The
subsequent evaluation of exec_queue_banned(q) accesses
atomic_read(&q->guc->state), resulting in a use-after-free.

Can q be pinned, or could the banned check be moved before deregistering?

> +				/* Pairs with the smp_rmb() in guc_exec_queue_timedout_job() */
> +				smp_wmb();
> +				wake_up_all(&guc->ct.wq);
> +			}
>  		}
>  	}
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260826093325.3233=
742-1-jakub.legowski@intel.com?part=3D1
