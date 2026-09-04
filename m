Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79272C61DD3
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 00:27:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F49E10E0FD;
	Fri,  4 Sep 2026 00:27:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="D5D7WW3T";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D549410E0FD
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 00:27:21 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 0665460546;
 Fri,  4 Sep 2026 00:27:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 958281F00A3D;
 Fri,  4 Sep 2026 00:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788481640;
 bh=GZSzl5LCvhuRjVarNjB3sPfj37/YS6PAVMbUuvg8ndM=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=D5D7WW3TqxbBvG/8flHZXIFAjmQ3VMhEBuZjrnF4nmPSNU3DM8NCQMgLM6nKS4a5t
 sGd/v3WAR1NDm0BK2AIX6KxG/E5qtVJ58UVLliY/tIun52VbaZ8624rqL1+86Ib6fP
 7FOkRpkKME8OVmWEnFcWnd9x//HT5cwxA8YudC9bpwuLgpyZVFMkYennmzz6N7SG9j
 tg57xY+Y2rVK/2lK9XnsJ9i3yBl6+1AUw8Fw8XchjTGXKBRT9vFJ2p8EcfajWJrFMv
 S6xzvWXfyzlyBHaRlZ0HyprToFXwyTH7fXwQXLMNkVSjW/xWkHpk9/NECbD8hijWT8
 PHxQeeXuGaHWA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 20/25] drm/xe: Add ULLS migration job support to
 migration layer
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260903235842.3401722-21-matthew.brost@intel.com>
References: <20260903235842.3401722-1-matthew.brost@intel.com>
 <20260903235842.3401722-21-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 00:27:20 +0000
Message-Id: <20260904002720.958281F00A3D@smtp.kernel.org>
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
- [High] Waiting on a dma_fence while holding a reclaim-tainted mutex cause=
s deadlocks and lockdep splats.
- [Medium] ULLS mode exit delay is implemented as 20ms instead of the inten=
ded 5us.
--

commit 68ec8c46273b3023414fee593faab1cdb6c24eca
Author: Matthew Brost <matthew.brost@intel.com>

drm/xe: Add ULLS migration job support to migration layer

This commit adds a function to enter ULLS mode for migration jobs and a
delayed worker to exit it for power savings. The ULLS mode exit delay is
intended to be 5us. It also updates migration job flags so the submission
backend properly submits in ULLS mode.

Link: https://patch.msgid.link/20260228013501.106680-21-matthew.brost@intel=
.com

> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migr=
ate.c
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -77,6 +80,14 @@ struct xe_migrate {
>  	struct dma_fence *fence;
>  	/** @min_chunk_size: For dgfx, Minimum chunk size */
>  	u64 min_chunk_size;
> +	/** @ulls: ULLS support */
> +	struct {
> +		/** @ulls.enabled: ULLS is enabled */
> +		bool enabled;
> +#define ULLS_EXIT_JIFFIES	(HZ / 50)

[Severity: Medium]
The commit message states "ULLS mode exit delay is currently set to 5us", b=
ut
does this macro actually result in 5us?=20

Using (HZ / 50) yields 20 milliseconds on a 1000Hz kernel, and 20 milliseco=
nds
on a 100Hz kernel (since 100/50 is 2 jiffies). Both evaluate to 20,000us
instead of 5us.

Additionally, delayed_work uses jiffy-resolution timers which cannot achieve
microsecond precision. Will this cause the engine to remain awake and consu=
me
power for 4000x longer than intended?

> +		/** @ulls.exit_work: ULLS exit worker */
> +		struct delayed_work exit_work;
> +	} ulls;
>  };

[ ... ]

> +static void xe_migrate_ulls_exit(struct work_struct *work)
> +{

[ ... ]

> +	mutex_lock(&m->job_mutex);
> +
> +	if (!xe_exec_queue_is_idle(m->q, 1))
> +		goto unlock_exit;
> +
> +	xe_sched_job_get(job);
> +	xe_sched_job_arm(job);
> +	job->is_ulls =3D true;
> +	job->is_ulls_last =3D true;
> +	fence =3D dma_fence_get(&job->drm.s_fence->finished);
> +	xe_sched_job_push(job);
> +
> +	/* Serialize force wake put */
> +	dma_fence_wait(fence, false);

[Severity: High]
Can calling dma_fence_wait() here while holding m->job_mutex cause a deadlo=
ck?

The job_mutex is initialized with fs_reclaim_acquire(), which marks it as
participating in memory reclaim paths. Waiting on a dma_fence while holding
a reclaim-tainted lock is generally unsafe because fence signaling paths
cannot safely allocate memory without risking a forward-progress dependency
inversion.

If a page fault blocks on job_mutex (e.g. via xe_migrate_ulls_enter) while
a GPU reset that requires memory reclaim is pending, could this deadlock the
system and trigger a lockdep splat?

> +	dma_fence_put(fence);
> +
> +	m->ulls.enabled =3D false;
> +unlock_exit:
> +	if (job)
> +		xe_sched_job_put(job);

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903235842.3401=
722-1-matthew.brost@intel.com?part=3D20
