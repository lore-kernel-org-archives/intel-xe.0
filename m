Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3C18C79F8C
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 07:30:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C0B510EF75;
	Wed,  9 Sep 2026 07:30:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="k0DZ6nY1";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7613910EF75
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Sep 2026 07:30:07 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 9A234601FD;
 Wed,  9 Sep 2026 07:30:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F4281F00AC4;
 Wed,  9 Sep 2026 07:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788939006;
 bh=g2yxbrdQHdlrqjG8UgS0umrr4c7m1biNLgnXpjZApHA=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=k0DZ6nY1bPhS5Gl8u9t9wxbjVTwSA6oxTHXwXCFld7HDm8RTvEA90W444joY5Khdk
 qAd+3uSB+jEPAO/KlqfKi02iHXGKu8u+DHeTd9M61azH1xeFIV7UiN4SNCK6n3XkLH
 WxtjIurtCe39Gu0GWVOn2t6iT4A8BufFuRwssBcsW544lebizaO/RJ2UR3P5zI0Jbt
 03TkyFbBDrBofzvhgYx0iXGASx2qs0ro3xUlM1f3JMYyekESg00T8pSvP2sJWIuUsj
 uKmMAnlbUiI2a4dcRIw1ywg01Nx4DWtLFxVIXoy8nv8loyJzjcINAhbsaYNwXm/yvx
 sBsURnRkAQsjQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/1] drm/xe/guc: Fix wake_up race in handle_sched_done
To: "Jakub Legowski" <jakub.legowski@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260909070825.228551-1-jakub.legowski@intel.com>
References: <20260909070825.228551-1-jakub.legowski@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 07:30:05 +0000
Message-Id: <20260909073006.2F4281F00AC4@smtp.kernel.org>
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

Pre-existing issues:
- [High] Waiters on `guc->ct.wq` will time out if a suspend-related schedul=
e disable completes on bare metal, as the patch fails to add `wake_up_all()=
` in the `suspend_pending` branch.
- [High] Waiters on `guc->ct.wq` can time out because the wakeup is strictl=
y conditional on `exec_queue_banned(q)`, skipping multi-queue primaries.
--

commit f80ea1dec48e9b0b18afdae4e0b791bbac894219
Author: Jakub Legowski <jakub.legowski@intel.com>

drm/xe/guc: Fix wake_up race in handle_sched_done

When a SCHED_DONE G2H arrives for a banned exec queue,
handle_sched_done() calls wake_up_all() before
clear_exec_queue_pending_disable(). This creates a race with the
wait_event_timeout() in guc_exec_queue_timedout_job() that waits
for pending_disable to be cleared. This moves the wake_up_all()
after all paths that clear pending_disable.

> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_g=
uc_submit.c
> index 99d8c807ff056..a181b50422934 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -3239,25 +3239,27 @@ static void handle_sched_done(struct xe_guc *guc,=
 struct xe_exec_queue *q,
>  			clear_exec_queue_pending_disable(q);
>  			suspend_fence_signal(q);
>  		} else {

[Severity: High]
This is a pre-existing issue, but won't waiters on guc->ct.wq time out if a
suspend-related schedule disable completes on bare metal?

When a queue is being suspended, it issues a disable and sets suspend_pendi=
ng.
Concurrently, guc_exec_queue_timedout_job() or disable_scheduling_deregiste=
r()
waits on guc->ct.wq for pending_disable to clear:

drivers/gpu/drm/xe/xe_guc_submit.c:guc_exec_queue_timedout_job()
	ret =3D wait_event_timeout(guc->ct.wq,
				 (!exec_queue_pending_enable(primary) &&
				  !exec_queue_pending_disable(primary)) ||
				 xe_guc_read_stopped(guc) ||
				 vf_recovery(guc), HZ * 5);

When the disable completes, handle_sched_done() clears pending_disable and
calls suspend_fence_signal(). However, on bare metal, suspend_fence_signal()
only wakes suspend_wait:

drivers/gpu/drm/xe/xe_guc_submit.c:__suspend_fence_signal()
	if (IS_SRIOV_VF(xe))
		wake_up_all(&guc->ct.wq);
	else
		wake_up(&q->guc->suspend_wait);

Could this leave guc->ct.wq waiters stranded, causing spurious 5-second
timeouts and unnecessary GT resets?

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

[Severity: High]
This isn't a bug introduced by this patch, but can waiters on guc->ct.wq ti=
me
out because the wakeup is strictly conditional on exec_queue_banned(q), ski=
pping
multi-queue primaries?

If a job on a multi-queue secondary queue times out,
guc_exec_queue_timedout_job() bans the secondary queue (q) but issues
disable_scheduling on the primary queue, waiting on guc->ct.wq for the prim=
ary's
pending_disable to clear:

drivers/gpu/drm/xe/xe_guc_submit.c:guc_exec_queue_timedout_job()
	set_exec_queue_banned(q);

	/* Kick job / queue off hardware */
	if (!xe_device_is_in_reset(xe) && !wedged &&
	    (exec_queue_enabled(primary) || exec_queue_pending_disable(primary))) {
		...
		ret =3D wait_event_timeout(guc->ct.wq,
					 !xe_uc_fw_is_running(&guc->fw) ||
					 !exec_queue_pending_disable(primary) ||
					 xe_guc_read_stopped(guc) ||
					 vf_recovery(guc), HZ * 5);

When SCHED_DONE arrives for the primary, handle_sched_done() skips the wake=
up
because exec_queue_banned(primary) is false. Could this lead to guaranteed
5-second timeouts and GT resets when a multi-queue secondary job hangs?

> +				/* Pairs with smp_rmb in guc_exec_queue_timedout_job */
>  				smp_wmb();
>  				wake_up_all(&guc->ct.wq);
>  			}
> -			if (exec_queue_destroyed(q)) {
> -				/*
> -				 * Make sure to clear the pending_disable only
> -				 * after sampling the destroyed state. We want
> -				 * to ensure we don't trigger the unregister too
> -				 * early with something intending to only
> -				 * disable scheduling. The caller doing the
> -				 * destroy must wait for an ongoing
> -				 * pending_disable before marking as destroyed.
> -				 */
> -				clear_exec_queue_pending_disable(q);
> +
> +			if (destroyed)
>  				deregister_exec_queue(guc, q);
> -			} else {
> -				clear_exec_queue_pending_disable(q);
> -			}
>  		}
>  	}
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909070825.2285=
51-1-jakub.legowski@intel.com?part=3D1
