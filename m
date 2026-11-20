Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7340606A32A
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 16:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i8z2NgZX
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A35B0112B92;
	Fri, 20 Nov 2026 16:15:51 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8583D112B92
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Nov 2026 16:15:45 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 7DB1261F52;
 Fri, 20 Nov 2026 16:15:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 058811F000C4;
 Fri, 20 Nov 2026 16:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795191344;
 bh=aYZebsqHrOD+NGGyToLHkA9Nnqam2e7B7lxAto0o9kc=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=i8z2NgZXN2r46xoxjIzPPPuRDw1WWN+D1E0OOI6xiAZWe0sFPg3eJksgdzBCeLSIp
 RADJRuzEvhYSrFh6Blo0eAa7AVsBdfGxJcLilQx68Fnpt3v+mIoSBF3iCT7nOBTj/5
 o+V/J0ZTpO+bHUCwi3gmC06p61eJISLiiP8DPJ8kcmwEHY63XkQLZtlig5GPbR6bNc
 t4aM2LlP/xiNznDm/mbGlx68aWx34V3gGA/gyAb6x4d1VErsAdDBEXbIqGwiuYZedB
 wNEk3ZgpIjzAztlIvuHMMh/5ZEdL0wFgvCldpQXgmmyCzBy/dxA9qfVH19VHfg3fRD
 p8XHBBEQ+1mvA==
Message-ID: <sashiko-outbox-225549@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/1] drm/xe/guc: Scale suspend wait timeout with preempt
 timeout
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261120160826.2045426-2-himal.prasad.ghimiray@intel.com>
References: <20261120160826.2045426-2-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 16:15:43 +0000
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] drm/xe: int ret truncates long timeout in
  guc_exec_queue_wait_suspend_done()
--

commit 96d69e02f036b099a5f29052501393a26a706962
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

drm/xe/guc: Scale suspend wait timeout with preempt timeout

This commit extends the queue suspend wait timeout in
guc_exec_queue_wait_suspend_done() by adding preempt_timeout_us and
min_run_period_ms to the base 5s timeout.

> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_g=
uc_submit.c
> index b14b37b767f5e..66b72a2dacf21 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -2532,8 +2532,20 @@ static int guc_exec_queue_wait_suspend_done(struct=
 xe_exec_queue *q, bool blocki
>  {
>  	struct xe_guc *guc =3D exec_queue_to_guc(q);
>  	struct xe_device *xe =3D guc_to_xe(guc);
> +	long timeout;
>  	int ret;
> =20
> +	/*
> +	 * The SUSPEND worker may sleep up to min_run_period_ms before disablin=
g,
> +	 * and GuC may then take up to preempt_timeout_us (sysfs tunable up to
> +	 * XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX) to preempt the context. Keep the
> +	 * historical 5s as slack on top of both.
> +	 */
> +	timeout =3D HZ * 5 +
> +		usecs_to_jiffies(READ_ONCE(q->sched_props.preempt_timeout_us));
> +	if (q->vm)
> +		timeout +=3D msecs_to_jiffies(q->vm->preempt.min_run_period_ms);
> +
>  	/*
>  	 * A kill does not clear suspend_pending, the queue may still be running
>  	 * on the hardware, so exec_queue_killed() is what ends the wait in that
> @@ -2546,16 +2558,16 @@ static int guc_exec_queue_wait_suspend_done(struc=
t xe_exec_queue *q, bool blocki
>  retry:
>  	if (blocking) {
>  		if (IS_SRIOV_VF(xe))
> -			ret =3D wait_event_timeout(guc->ct.wq, WAIT_COND, HZ * 5);
> +			ret =3D wait_event_timeout(guc->ct.wq, WAIT_COND, timeout);
>  		else
>  			ret =3D wait_event_timeout(q->guc->suspend_wait, WAIT_COND,
> -						 HZ * 5);
> +						 timeout);
>  	} else if (IS_SRIOV_VF(xe)) {
>  		ret =3D wait_event_interruptible_timeout(guc->ct.wq, WAIT_COND ||
> -						       vf_recovery(guc), HZ * 5);
> +						       vf_recovery(guc), timeout);
>  	} else {
>  		ret =3D wait_event_interruptible_timeout(q->guc->suspend_wait,
> -						       WAIT_COND, HZ * 5);
> +						       WAIT_COND, timeout);
>  	}

[Severity: Low]
Should ret be a long to match timeout and the return type of
wait_event_timeout() / wait_event_interruptible_timeout()?

min_run_period_lr_ms_set() in drivers/gpu/drm/xe/xe_debugfs.c accepts any
u32 value without an upper bound.  If timeout exceeds INT_MAX jiffies on a
64-bit system, storing the remaining jiffies into int ret truncates the
result, which can make !ret or ret < 0 evaluate true and falsely return
-ETIME (banning a healthy queue) or a bogus negative error code.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120160826.2045=
426-2-himal.prasad.ghimiray@intel.com?part=3D1
