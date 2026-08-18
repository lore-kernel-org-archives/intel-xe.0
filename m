Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2185C5DF81
	for <intel-xe@archiver.kernel.org>; Tue, 18 Aug 2026 18:51:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2B3510E027;
	Tue, 18 Aug 2026 18:51:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NO88REgM";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A6B110E027
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Aug 2026 18:51:44 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 329ED601DE;
 Tue, 18 Aug 2026 18:51:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEFE31F000E9;
 Tue, 18 Aug 2026 18:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787079102;
 bh=Ro57wLENtbOyThf685csNbxdI8jhlUj4DKpewD0/aJk=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=NO88REgMNiQwBM1ED1pBS0NasrY4LNPTqw/3GKgFfZ0PoSvCT1/nRvGANLVg/5KBN
 VB+BO1txRLg91mybH6GqfHyBw447VKq37Ff3rth8p8cBVvXoicB1xTQGxot4jmeRo9
 KHN85xCBjdz8z206MKDBEC7U+8BCc9G2KLcd+hh4Pbgmilwx3NXhTZLbWOMEnMFYIR
 YknBSHm+0radHijlQFiS6Scq82t3sEqkySCW/qX1qfpbU1vyxDSnOZmGbbTyvA8CFn
 3QmWOBebCpPozxAOfUnXMr45oYADMYViu8VFYU//MfiDjRWWb2tlgMU8u/LnEKxKfj
 XVm0JPuhVP1FQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] drm/xe/guc: Fix race around q->guc->suspend_pending
 access
To: "Jagmeet Randhawa" <jagmeet.randhawa@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260818183838.273486-2-jagmeet.randhawa@intel.com>
References: <20260818183838.273486-2-jagmeet.randhawa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Aug 2026 18:51:42 +0000
Message-Id: <20260818185142.BEFE31F000E9@smtp.kernel.org>
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

Pre-existing issues:
- [High] TDR (Timeout Delay Recovery) races with asynchronous queue suspend=
, leading to misattributed SCHED_DONE messages, an assertion failure, and a=
 TDR hang.
--

--- Patch [1]: [PATCH v2] drm/xe/guc: Fix race around q->guc->suspend_pendi=
ng access ---
commit 256a06cec5d42e79b9711d9f1861b3717e23b08f
Author: Jagmeet Randhawa <jagmeet.randhawa@intel.com>

drm/xe/guc: Fix race around q->guc->suspend_pending access

This commit wraps accesses to q->guc->suspend_pending with xe_sched_msg_lock
in the suspend, resume, kill, and ban paths. This ensures that checking the
flag and calling suspend_fence_signal() is atomic with respect to the
asynchronous clears in the kill and ban paths.

> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_g=
uc_submit.c
> index 9036f89dff7d9..c565c1d32d3a4 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
[ ... ]
> @@ -3222,13 +3234,20 @@ static void handle_sched_done(struct xe_guc *guc,=
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
> -		} else {
> +		}
> +		xe_sched_msg_unlock(&q->guc->sched);

[Severity: High]
This is a pre-existing issue, but does this logic misattribute a SCHED_DONE
message if TDR races with an asynchronous queue suspend?

If a queue is being suspended (setting q->guc->suspend_pending =3D true) and
concurrently a job times out, the TDR handler stops the DRM scheduler,
trapping the SUSPEND message before it can execute. TDR then calls
disable_scheduling(), which directly sends a DISABLE command to the GuC.

When the GuC responds to the DISABLE command with a SCHED_DONE message,
won't handle_sched_done() incorrectly attribute it to the trapped SUSPEND
message because was_pending is still true?

It looks like this would call suspend_fence_signal(q) and trigger an
assertion failure, because the queue was never actually suspended (the
message was trapped) or killed (TDR only bans it). Additionally, skipping
the wake_up_all() call in the other branch might cause the TDR thread to
wait and hang for 5 seconds until it times out.

> +
> +		if (!was_pending) {
>  			if (exec_queue_banned(q)) {
>  				smp_wmb();
>  				wake_up_all(&guc->ct.wq);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260818183838.2734=
86-2-jagmeet.randhawa@intel.com?part=3D1
