Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75402C98306
	for <intel-xe@archiver.kernel.org>; Fri, 25 Sep 2026 06:49:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF30810E586;
	Fri, 25 Sep 2026 06:48:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="B/IqIn1c";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EDCB10E586
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Sep 2026 06:48:58 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id F30EB60230;
 Fri, 25 Sep 2026 06:48:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FE391F000FF;
 Fri, 25 Sep 2026 06:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1790318937;
 bh=64HJBS41Dlo0RADxNbqkGT/hUd7kLgg27JGOK+ldVj4=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=B/IqIn1cZ1sJCsQa1yfkrFFBX6JmIOstjmfF8YK1ycbfZwDDHsRSYUlxAvgs2IV9J
 tfedAZXpC5QupVGZhCUGfJ8pchD2GJSypSK338lS1FKSodrO2CRDkThnV/Z2aziaiC
 y+Kydz2YMv+SQK9PB7paT1P7tr5VUSuYxwsn53lNyg7ljebnKXZkGG3GiqSJYzgEzQ
 A5B2C/Hj4kGdNkUEn9GBTuQtG2VXnN7OA3kXH4xsI0oztUsr2iR2L/b9l2mfdJOCx4
 mA8luBwX1khRrSb7qUOYnu8UXigO0T0vV1UHKqxzngdCui5ezJ+lJ/2xD6rs4YiR8/
 A3u0bWVS3VI/w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 21/24] drm/xe: Add ULLS migration job support to GuC
 submission
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260925045320.1325860-22-matthew.brost@intel.com>
References: <20260925045320.1325860-1-matthew.brost@intel.com>
 <20260925045320.1325860-22-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 25 Sep 2026 06:48:57 +0000
Message-Id: <20260925064857.7FE391F000FF@smtp.kernel.org>
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
- [High] drm/xe: TOCTOU race in ULLS migration job prefetching leads to sta=
le command execution
--

commit 231db353d11582f236795322ee38df1ad9cad0d1
Author: Matthew Brost <matthew.brost@intel.com>
drm/xe: Add ULLS migration job support to GuC submission

This commit adds Ultra Low Latency Submission (ULLS) migration job support =
to
the GuC submission backend. It introduces optimizations for chained ULLS jo=
bs
by having the GPU publish its own ring tail and suppressing the CPU's RING_=
TAIL
MMIO updates.

> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_g=
uc_submit.c
> index a2784763e72ba..cd9bb9f9e28c8 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1190,9 +1190,10 @@ static void submit_exec_queue(struct xe_exec_queue=
 *q, struct xe_sched_job *job)
>  	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
> =20
>  	if (!job->restore_replay || job->last_replay) {
> +		/* A ULLS job past the first publishes its own ring tail */
>  		if (xe_exec_queue_is_parallel(q))
>  			wq_item_append(q);
> -		else
> +		else if (!xe_sched_job_ulls_is_chained(job))
>  			xe_lrc_set_ring_tail(lrc, lrc->ring.tail);

[Severity: High]
Does skipping the RING_TAIL MMIO write here expose a race condition where t=
he
GPU could execute stale ring buffer memory?

For ULLS chained jobs, the GPU advances the tail via MI_LRI prior to execut=
ing
MI_SEMAPHORE_WAIT, which happens in emit_ulls_postamble():

drivers/gpu/drm/xe/xe_ring_ops.c:emit_ulls_postamble()
	i =3D emit_ulls_ring_tail(gt, lrc, dw, i, head);
	dw[i++] =3D MI_SEMAPHORE_WAIT | ...

Because the CPU intentionally skips the xe_lrc_set_ring_tail() MMIO write f=
or
these chained jobs, the hardware mechanism that normally invalidates the GP=
U's
instruction cache is bypassed.=20

Could the Command Streamer fetch unit see the advanced RING_TAIL and prefet=
ch
memory for the next job before the CPU has actually written it to the ring
buffer? If the CPU hasn't populated the commands yet, when the CPU finally
writes the next job and signals the semaphore, it appears the GPU might wak=
e up
and execute the stale prefetched instructions from its internal cache rather
than the newly written migration commands.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260925045320.1325=
860-1-matthew.brost@intel.com?part=3D21
