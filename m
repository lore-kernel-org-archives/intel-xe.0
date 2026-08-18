Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0562C5DF74
	for <intel-xe@archiver.kernel.org>; Tue, 18 Aug 2026 04:26:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 358AD10E50C;
	Tue, 18 Aug 2026 04:26:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZswAPABn";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AA5F10E50C
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Aug 2026 04:26:21 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 40C9942155;
 Tue, 18 Aug 2026 04:26:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 024E11F000E9;
 Tue, 18 Aug 2026 04:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787027181;
 bh=82wbx97pKoe2sA4HXyzrFwwJfKgPIjZIHzY5pFb9yvo=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=ZswAPABnOtt0Zb5diq+8V91qLtlMK+Z8pPVq6vr4EbZb0FQ22HBcWHcv84Y1mm71A
 CYH2f7Gq8jsxs9hiq3BsYm43SElVvbrnATJXIqyskB4B7Mj2kPTgJOcT5aVm8lpbmF
 +1VvjTbC1uvy4HSlVFLfgzcHHKYtiJ+JI6N1ZLmJhJT8mjYgLvwodvnblwGxs06s1C
 zB5hTckSnJwW8IY/iBWzz8abzN5C/dFphD6N0J9HkmnV22Z7b2/ydyzLD2oy0AD603
 w9P8ysiWV0/xkgGI6y60O5QACxohbd4aM9DkKAz/xLTpYJ2UM2Jc1/bvehon0oKhKw
 a3grIGotoBCtQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] drm/xe/guc: Skip CLEANUP message when GuC is stopped
To: "Varun Gupta" <varun.gupta@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260818040733.135964-1-varun.gupta@intel.com>
References: <20260818040733.135964-1-varun.gupta@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Aug 2026 04:26:20 +0000
Message-Id: <20260818042621.024E11F000E9@smtp.kernel.org>
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
- [High] An unprotected Time-of-Check to Time-of-Use (TOCTOU) race conditio=
n exists between checking the GuC stopped state and adding the CLEANUP mess=
age, leading to suspended hardware access.

Pre-existing issues:
- [High] Bypassing the CLEANUP message abandons pending messages in the sch=
eduler queue, causing memory and runtime PM reference leaks.
--

--- Patch [1]: [PATCH] drm/xe/guc: Skip CLEANUP message when GuC is stopped=
 ---
commit 3774f2ff22deecb1f1aaf595a02f4bc19900b790
Author: Varun Gupta <varun.gupta@intel.com>

drm/xe/guc: Skip CLEANUP message when GuC is stopped

Attempting to enqueue a CLEANUP message while the GuC is stopped
(during a device reset or suspend) triggers a missing outer runtime
PM protection warning in xe_pm_runtime_get_noresume().

Since the GuC cannot service Command Transport (CT) requests while
stopped, skip the message and route directly to local teardown.

Cc: stable@vger.kernel.org

> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_g=
uc_submit.c
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -2180,12 +2180,14 @@ static bool guc_exec_queue_try_add_msg(struct xe_=
exec_queue *q,
>  #define STATIC_MSG_CGP_SYNC	3
>  static void guc_exec_queue_destroy(struct xe_exec_queue *q)
>  {
> +	struct xe_guc *guc =3D exec_queue_to_guc(q);
>  	struct xe_sched_msg *msg =3D q->guc->static_msgs + STATIC_MSG_CLEANUP;
> =20
> -	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) && !exec_queue_wedged(q))
> +	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) && !exec_queue_wedged(q) &&
> +	    !xe_guc_read_stopped(guc))

[Severity: High]
Could this regression introduce a race condition between checking the GuC
stopped state and adding the CLEANUP message?

The lockless check of xe_guc_read_stopped(guc) creates a window before
xe_pm_runtime_get_noresume() is called inside guc_exec_queue_add_msg().
If a thread evaluates the check as true, but concurrently the device perfor=
ms
a runtime PM suspend and reaches RPM_SUSPENDED, the thread will still proce=
ed
to add the CLEANUP message.

This would increment the PM reference without waking the device, leading
to the worker executing hardware instructions against powered-down registers
when it processes the message.

>  		guc_exec_queue_add_msg(q, msg, CLEANUP);
>  	else
> -		__guc_exec_queue_destroy(exec_queue_to_guc(q), q);
> +		__guc_exec_queue_destroy(guc, q);
>  }

[Severity: High]
This is a pre-existing issue, but does bypassing the CLEANUP message abandon
pending messages in the scheduler queue?

By moving straight to local teardown without draining pending messages,
the queue is destroyed immediately. Later, xe_sched_fini() unconditionally
cancels the work_process_msg worker:

drivers/gpu/drm/xe/xe_gpu_scheduler.c:xe_sched_submission_stop() {
    ...
    drm_sched_wqueue_stop(&sched->base);
    cancel_work_sync(&sched->work_process_msg);
}

Any prior messages (like SUSPEND or SET_SCHED_PROPS) still pending in
sched->msgs would be stranded and never processed. This permanently leaks
the dynamically allocated messages and their associated runtime PM
references.=20

A leaked PM reference permanently prevents the GPU from entering runtime
suspend (D3 states), resulting in continuous power drain until the system
is rebooted.

Will the CLEANUP message still be needed to act as a barrier to ensure
the queue is drained properly?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260818040733.1359=
64-1-varun.gupta@intel.com?part=3D1
