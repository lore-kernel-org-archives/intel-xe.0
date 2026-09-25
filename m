Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14F7CC98321
	for <intel-xe@archiver.kernel.org>; Fri, 25 Sep 2026 20:45:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4EDB10FC7A;
	Fri, 25 Sep 2026 20:45:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MvGBaCTL";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78E0910FC7A
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Sep 2026 20:45:15 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id B952A60136;
 Fri, 25 Sep 2026 20:45:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F50B1F000FF;
 Fri, 25 Sep 2026 20:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1790369114;
 bh=KHnc1R9XMcGw4e29jWXaa0DZ6EpEy0wiKJatHc7jQb8=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=MvGBaCTL5rLi1qvl5nLEWImDApAALCnN9ntcO92LpAYrv3oShKvInaD5CbUImLi47
 fV9F1AIWRZJJQC4BzBn+xVpaLveXhCBzoxZixaXaIp2lcrS5Vo9nhi3/lRxx92Mfp5
 8tvMbVPiV3FeA/xMkb9fW3Ui2rzwwXqgcnrRnJfQsus0YcW0bi3/krh4TA7ec8pRDz
 uqALfCgpHVV7bysaYH0IJZK+CE4JolhqBEZSEE0xhQFDZjd3KHupb5J+9Q/1O9qk6Y
 cuGFJLHZNh1XTC0ZQkji8XtKz8VEPWytlNQLMJKAhuAx1RcXpSWl2hMu0KFhAO7VAJ
 u+yEEzFZvkOKA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 21/24] drm/xe: Add ULLS migration job support to GuC
 submission
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260925201526.1355279-22-matthew.brost@intel.com>
References: <20260925201526.1355279-1-matthew.brost@intel.com>
 <20260925201526.1355279-22-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 25 Sep 2026 20:45:13 +0000
Message-Id: <20260925204514.4F50B1F000FF@smtp.kernel.org>
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
- [High] drm/xe/guc: lost chained ULLS jobs when execution queue is suspend=
ed
--

commit 66f017eb1b046b1a95648616e5327a01247f461c
Author: Matthew Brost <matthew.brost@intel.com>
drm/xe: Add ULLS migration job support to GuC submission

This commit adds ULLS migration job support to the GuC submission backend.=
=20
It reduces the max jobs on migration queues to match ULLS semaphores, skips=
=20
writing the saved ring tail for non-first ULLS jobs, sets the ULLS semaphor=
e=20
for chained jobs, and suppresses H2G submits for non-first ULLS jobs.

> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_g=
uc_submit.c
> index a2784763e72ba..cd9bb9f9e28c8 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c

[ ... ]

> @@ -1209,6 +1210,9 @@ static void submit_exec_queue(struct xe_exec_queue =
*q, struct xe_sched_job *job)
>  	if (exec_queue_suspended(q))
>  		return;
> =20
> +	if (xe_sched_job_ulls_is_chained(job))
> +		xe_lrc_set_ulls_semaphore(lrc, xe_sched_job_lrc_seqno(job));
> +

[Severity: High]
Will this result in lost chained ULLS jobs if the execution queue is suspen=
ded
concurrently?

If a chained ULLS job is submitted and the queue is suspended (for instance,
due to preemption), submit_exec_queue() returns early at the
exec_queue_suspended() check immediately preceding this addition.

Because the early return completely skips the xe_lrc_set_ulls_semaphore()=20
call, when the queue resumes, the hardware will expect the memory semaphore=
 to=20
be signaled. Since the signaling was skipped, could this cause the hardware=
 to=20
wait indefinitely, triggering a job timeout and queue reset?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260925201526.1355=
279-1-matthew.brost@intel.com?part=3D21
