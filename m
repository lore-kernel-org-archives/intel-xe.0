Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB069C624D4
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 20:33:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9811E10F34C;
	Wed,  2 Sep 2026 20:33:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XRsTwcQk";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90F8810F34C
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Sep 2026 20:33:34 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 1649A600D4;
 Wed,  2 Sep 2026 20:33:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98A2F1F000E9;
 Wed,  2 Sep 2026 20:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788381213;
 bh=Z7J0mEgDGQ7612ixy1Kg1ciZ6TT9YO6+LCwtKqWwM3M=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=XRsTwcQkh00To/OdQyBTGSuCASSdjnrLR3eaVuPnyh67T8b3gGvSwxZxxHN8AVKw8
 /1O8hpx1fvkKp+2JCRM+IsjuHchr5EzycSTcU059UGTWWcH4CEJ/DhmjUV7FMDEfxe
 tHcLTaVBnyWXy5Nt1498C64fiowHqZa+hondqy4pY6hxNY8ssP5b+dUJkpaIXltRG3
 5iArb6S6N/oP4GuYSVJkptEoVjZsToryYe8bJpr/qO15oqkB1Srp26Ssg9VHPPhO5b
 fPFMgj2q5N6B7yA/uekHOGUc9Y2aznbljtVR1J61glrk6onVYOSR3SPY/xS/mfsVVI
 hRd1lEH89/Zig==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH, v3] drm/xe/guc: Fix race around q->guc->suspend_pending
 access
To: "Jagmeet Randhawa" <jagmeet.randhawa@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260902201222.30022-1-jagmeet.randhawa@intel.com>
References: <20260902201222.30022-1-jagmeet.randhawa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 20:33:33 +0000
Message-Id: <20260902203333.98A2F1F000E9@smtp.kernel.org>
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
- [High] TDR banning a queue with a pending suspend causes an assertion fai=
lure and kernel panic in suspend_fence_signal().
- [High] Missing wake_up_all(&guc->ct.wq) for banned queues causes TDR wait=
 to timeout and stall GPU recovery.
--

commit 2275bb1dedd8420c1af8d0c090d8c754de1760da
Author: Jagmeet Randhawa <jagmeet.randhawa@intel.com>

drm/xe/guc: Fix race around q->guc->suspend_pending access

This commit addresses a race condition involving the suspend_pending flag,
which was previously accessed without a common lock. It prevents asynchrono=
us
clearing of the flag in the suspend-timeout ban and kill paths, keeping the
flag set until teardown to avoid tripping assertions when the scheduler
message worker races with the flag clear. It also serializes accesses in
handle_sched_done() and guc_exec_queue_stop() using the msg_lock.

> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_g=
uc_submit.c
> index 99d8c807ff056..1420f5ebd72fd 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
[ ... ]
> @@ -3232,13 +3249,20 @@ static void handle_sched_done(struct xe_guc *guc,=
 struct xe_exec_queue *q,
>  		smp_wmb();
>  		wake_up_all(&guc->ct.wq);
>  	} else {
> +		bool was_pending;
> +
>  		xe_gt_assert(guc_to_gt(guc), runnable_state =3D=3D 0);
>  		xe_gt_assert(guc_to_gt(guc), exec_queue_pending_disable(q));
> =20
> -		if (q->guc->suspend_pending) {
> +		xe_sched_msg_lock(&q->guc->sched);
> +		was_pending =3D q->guc->suspend_pending;
> +		if (was_pending) {
>  			clear_exec_queue_pending_disable(q);
>  			suspend_fence_signal(q);

[Severity: High]
If a job times out while a suspend is pending, the TDR mechanism will ban
the queue and send a disable_scheduling command. When the GuC replies to the
disable command, this code will see was_pending as true and call
suspend_fence_signal().=20

Can this regression trigger the following assertion in
suspend_fence_signal()?

    xe_gt_assert(guc_to_gt(guc), exec_queue_suspended(q) ||
                 exec_queue_killed(q) || xe_guc_read_stopped(guc));

Since the queue is only banned, not suspended or killed, the condition
evaluates to false and causes a kernel panic.

> -		} else {
> +		}
> +		xe_sched_msg_unlock(&q->guc->sched);
> +
> +		if (!was_pending) {
>  			if (exec_queue_banned(q)) {
>  				smp_wmb();
>  				wake_up_all(&guc->ct.wq);

[Severity: High]
If TDR bans a queue that has an active suspend request, was_pending will be
true. Because of the if (!was_pending) condition, this block is skipped and
wake_up_all(&guc->ct.wq) is not called.

Can this regression cause the TDR worker to stall for its full 5-second
timeout while waiting on guc->ct.wq, effectively stalling GPU recovery?

>  			}
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902201222.3002=
2-1-jagmeet.randhawa@intel.com?part=3D1
