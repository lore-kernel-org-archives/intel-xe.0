Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE61606A33A
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 12:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SbGYYXzD
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91F1610EDAD;
	Mon, 23 Nov 2026 12:38:51 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5F1910EDAD
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Nov 2026 12:38:45 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 46D8540818;
 Mon, 23 Nov 2026 12:38:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAD0E1F000CA;
 Mon, 23 Nov 2026 12:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795437524;
 bh=kqvo4QhrhtonHQ7zBzJBZkuPeAZEsEh0F2ovGAUy9ys=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=SbGYYXzDl93ZiakLRNWLiBngomNIbMOeZ5U2h+EePfyBUncDdz9qSBsqxvPP0LN1P
 4GIFlVsi/BOitW986TvKEL1DHse/zBoGqXeQDzAAYKfkoJpnNE2kZuTPI3BxTDbuLa
 nNnd+SgBuHqDVKv10C8vbr240Ooe7oKL2byR2kxi+5aKoLEsWpVKedOVjNEz+xB5/F
 9siyenWgnGSgrtfS0DsEpq8IabOGmJx/9zs67Ik8f01y6cg2R0rLszqkWSbE4pJ104
 fM/oE4wMl6L3bJFUxLPDYQbmOby+7VPsUXF6nVAvrdgSn5XQWGsuLfYr8P3meg3r4v
 CIYHk0e387WBQ==
Message-ID: <sashiko-outbox-229237@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] drm/xe/guc: Scale suspend wait timeout with preempt
 timeout
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261123123436.2114961-3-himal.prasad.ghimiray@intel.com>
References: <20261123123436.2114961-3-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 12:38:44 +0000
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

Thank you for your contribution! Sashiko AI review found no new issues
in this patch, but noticed 1 related pre-existing issue it does not
introduce:
- [High] drm/xe/guc: infinite retry loop on signal in
  guc_exec_queue_wait_suspend_done() [1]
--

commit fc6166f7ac4a1298d1151f0d015f326ad4272c09
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

drm/xe/guc: Scale suspend wait timeout with preempt timeout

This commit extends the suspend wait timeout in
guc_exec_queue_wait_suspend_done() by adding preempt_timeout_us and
min_run_period_ms on top of the 5-second base timeout.

> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_g=
uc_submit.c
> index b5c916a764dbe..8b645fb17a2b0 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -2542,7 +2542,20 @@ static int guc_exec_queue_wait_suspend_done(struct=
 xe_exec_queue *q, bool blocki
[ ... ]
> @@ -2556,16 +2569,16 @@ static int guc_exec_queue_wait_suspend_done(struc=
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
> =20
>  	if (!blocking && vf_recovery(guc) && !xe_wedged(xe))

[Severity: High]
This problem wasn't introduced by this patch, but can
guc_exec_queue_wait_suspend_done() enter a tight retry loop on an SR-IOV
VF when interrupted by a signal [1]?

drivers/gpu/drm/xe/xe_guc_submit.c:guc_exec_queue_wait_suspend_done() {
    ...
	if (!ret)
		return -ETIME;
	else if (!blocking && IS_SRIOV_VF(xe) && !WAIT_COND)
		/* Corner case on RESFIX DONE where vf_recovery() changes */
		goto retry;

#undef WAIT_COND

	return ret < 0 ? ret : 0;
}

When a signal arrives during the interruptible wait while suspend_pending
is set and vf_recovery(guc) is false, wait_event_interruptible_timeout()
returns -ERESTARTSYS.  Because the retry condition does not check ret > 0,
it jumps back to retry instead of returning -ERESTARTSYS, and subsequent
calls return -ERESTARTSYS immediately while the signal remains pending,
spinning with group->mode_sem write-locked until the GuC suspend finishes
or a soft lockup occurs.

[1] https://sashiko.dev/#/bug/linux-0dd652ca-b4ef-464d-b05e-1a1b1bb61630

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123123436.2114=
961-3-himal.prasad.ghimiray@intel.com?part=3D1
