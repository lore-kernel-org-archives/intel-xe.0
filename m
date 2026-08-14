Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E4F8C5CFCF
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 01:01:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E81D810E0AA;
	Fri, 14 Aug 2026 01:01:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FMijj3TE";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D81B010E0AA
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Aug 2026 01:01:10 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id D278A600AD;
 Fri, 14 Aug 2026 01:01:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F1811F000E9;
 Fri, 14 Aug 2026 01:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1786669269;
 bh=xNcAqYaXFNP0HEX1Svri5vYl5yTm1ABlS6FhgdRBS6c=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=FMijj3TEM8nzXqta+X/VDw9UPPDBcz8zI5DjwwMD4RW+xztqpPC7YhVF5bf/4IJOf
 kWwOLtmvAfuEXyy99Hgz7JVIvh5o4BJcAKlPvcMNnPandXnoTM73sUKodQRuZExo5B
 IudSRlAKn2sGP1L/A24RVV0TFlp4+xLR+6SxcN3U5JjD/RkgTzK+aYlwUlfH0FqB1a
 Rg0z1Fmpbvi3CQS2CRi8ueyoxs5XHQFu+0yGd91qB6szOJfkwjZ2UR9d+GYAslsP5U
 Ax761Rn+fox6+IzYlXnDAlwzwQ3z8v/SzJjFxvwjUiJtpieJ9POEZbx9KYZ+ACVjBt
 rAdMSeMbOlSpA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] drm/xe/guc: Fix race around q->guc->suspend_pending access
To: "Jagmeet Randhawa" <jagmeet.randhawa@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260813201847.201867-2-jagmeet.randhawa@intel.com>
References: <20260813201847.201867-2-jagmeet.randhawa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Aug 2026 01:01:08 +0000
Message-Id: <20260814010109.5F1811F000E9@smtp.kernel.org>
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
- [High] TDR firing concurrently with a queue suspend request routes the Gu=
C DISABLE response incorrectly, leading to an assertion failure and an unne=
cessary GT reset.
--

--- Patch [1]: [PATCH] drm/xe/guc: Fix race around q->guc->suspend_pending =
access ---
commit 9e45449078caaa7428f1073720ba630cb43d9ca9
Author: Jagmeet Randhawa <jagmeet.randhawa@intel.com>

drm/xe/guc: Fix race around q->guc->suspend_pending access

This patch wraps accesses to q->guc->suspend_pending with the msg_lock to
prevent concurrent clear and check-then-act sequences from tripping asserti=
ons.
The lock is extended across suspend and resume paths, as well as kill and b=
an.

> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_g=
uc_submit.c
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c

[ ... ]

> @@ -3092,13 +3104,20 @@ static void handle_sched_done(struct xe_guc *guc,=
 struct xe_exec_queue *q,
>  		smp_wmb();
>  		wake_up_all(&guc->ct.wq);
>  	} else {
> +		bool was_pending;
> =20
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
> +
> +		if (!was_pending) {
>  			if (exec_queue_banned(q)) {
>  				smp_wmb();
>  				wake_up_all(&guc->ct.wq);

[Severity: High]
This is a pre-existing issue, but does routing the GuC DISABLE response bas=
ed
solely on was_pending fail to account for TDR-initiated DISABLEs?

If a Timeout Detection and Recovery (TDR) event fires concurrently with a q=
ueue
suspend request, it seems the following sequence could occur:

1. TDR stops the scheduler but hasn't yet marked the queue as BANNED.
2. A suspend request sets q->guc->suspend_pending =3D true. The SUSPEND mes=
sage
   is never processed because the scheduler is stopped.
3. TDR marks the queue as BANNED and sends a DISABLE action to GuC.
4. When GuC replies to the TDR's DISABLE, handle_sched_done() sees
   was_pending =3D=3D true and calls suspend_fence_signal(q).

Will this trip the assertion in suspend_fence_signal(q) because the queue is
BANNED, not SUSPENDED, and also skip the !was_pending block, causing a miss=
ed
wakeup for TDR and an unnecessary full GT reset?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813201847.2018=
67-2-jagmeet.randhawa@intel.com?part=3D1
