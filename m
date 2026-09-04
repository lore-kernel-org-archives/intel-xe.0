Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20500C61DD3
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 02:44:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBA6010F827;
	Fri,  4 Sep 2026 02:44:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nFjM/Njb";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F5F010F827
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 02:44:41 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 8ACE260234;
 Fri,  4 Sep 2026 02:44:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 206631F000E9;
 Fri,  4 Sep 2026 02:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788489880;
 bh=LY2HqsSxfmkns8wJRvsYWOA5MG6ISbrxSBWEh/8mMd8=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=nFjM/NjbS7SsTP+Rfosxzie1s0SSLbGDw/xaS85Ekex9gmTzyHclsevtxwIYLt7Pp
 hT614rLewSyowfuOnugTjlSMsjh3GPQLFz5eXA/2PSYdMD7Vi591yqFv33OjPCH7HZ
 JC26UcY92cmnYigtmmeXzZhC0MSEAzS/rDMpyJ8KvbwzNqy0kErU+l98uSkX/OiQc1
 21+gtZaVh6XkdOTerjRZngy+30P6sBAmk4YWsNYlAMMUhZnWrve6W12syEi8sG5nKW
 l8/wjeZiIzoOh5buhc4WM+L8QTc7yOZTsTJD0Z9Cx3GT6E8y6C+X7vfDKNjcoaUlhB
 4qUKPBGGv85bw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 20/25] drm/xe: Add ULLS migration job support to
 migration layer
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260904022207.3490018-21-matthew.brost@intel.com>
References: <20260904022207.3490018-1-matthew.brost@intel.com>
 <20260904022207.3490018-21-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 02:44:39 +0000
Message-Id: <20260904024440.206631F000E9@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] ULLS_EXIT_JIFFIES evaluates to 0 on HZ=3D100 configurations, causi=
ng a tight spin loop.
- [High] Deadlock caused by synchronous dma_fence_wait while holding reclai=
m-tainted job_mutex.
- [Medium] Asynchronous runtime PM put used during device teardown path.
--

commit 1b246ef0dc00023e2aba23868ed86c7ff7c9257a
Author: Matthew Brost <matthew.brost@intel.com>

drm/xe: Add ULLS migration job support to migration layer

Add function to enter ULLS mode for migration job and delayed worker to
exit (power saving). ULLS mode expected to entered upon page fault or
SVM prefetch. ULLS mode exit delay is currently set to 5ms.

Link: https://patch.msgid.link/20260228013501.106680-21-matthew.brost@intel=
.com

> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migr=
ate.c
> index 471ae5741836e..588e1c9085f31 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c

[ ... ]

> @@ -77,6 +80,14 @@ struct xe_migrate {
>  	struct dma_fence *fence;
>  	/** @min_chunk_size: For dgfx, Minimum chunk size */
>  	u64 min_chunk_size;
> +	/** @ulls: ULLS support */
> +	struct {
> +		/** @ulls.enabled: ULLS is enabled */
> +		bool enabled;
> +#define ULLS_EXIT_JIFFIES	(HZ / 200)	/* 5ms */

[Severity: High]
Does this calculation truncate to 0 when HZ=3D100?

If HZ < 200, ULLS_EXIT_JIFFIES evaluates to 0. When xe_migrate_ulls_exit
executes while the queue is not idle, it reschedules itself with a delay
of 0. This results in an immediate re-execution of the worker, creating a
tight spin loop and causing a soft lockup with 100% CPU utilization until
the queue becomes idle.

> +		/** @ulls.exit_work: ULLS exit worker */
> +		struct delayed_work exit_work;
> +	} ulls;
>  };
> =20
>  #define MAX_PREEMPTDISABLE_TRANSFER SZ_8M /* Around 1ms. */
> @@ -98,6 +109,16 @@ struct xe_migrate {
>  static void xe_migrate_fini(void *arg)
>  {
>  	struct xe_migrate *m =3D arg;
> +	struct xe_device *xe =3D tile_to_xe(m->tile);
> +
> +	disable_delayed_work_sync(&m->ulls.exit_work);
> +	mutex_lock(&m->job_mutex);
> +	if (m->ulls.enabled) {
> +		xe_force_wake_put(gt_to_fw(m->q->hwe->gt), m->q->hwe->domain);
> +		xe_pm_runtime_put(xe);

[Severity: Medium]
Will this asynchronous put call in the teardown path be canceled by the
subsequent PM disable?

xe_migrate_fini acts as the devm cleanup action. It calls xe_pm_runtime_put
which queues an asynchronous suspend. However, during driver teardown,
pm_runtime_disable will cancel this pending async work before it executes,
leaving the hardware incorrectly in an active power state.

Should this be a synchronous pm_runtime_put_sync instead?

> +		m->ulls.enabled =3D false;
> +	}
> +	mutex_unlock(&m->job_mutex);
> =20
>  	xe_vm_lock(m->q->vm, false);
>  	xe_bo_unpin(m->pt_bo);

[ ... ]

> +static void xe_migrate_ulls_exit(struct work_struct *work)
> +{
> +	struct xe_migrate *m =3D container_of(work, struct xe_migrate,
> +					    ulls.exit_work.work);

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
Does waiting on this dma-fence while holding the reclaim-tainted job_mutex
create a deadlock?

m->job_mutex is explicitly annotated as being part of the memory reclaim pa=
th
via fs_reclaim_acquire/release in xe_migrate_init. By synchronously
waiting on a dma-fence with dma_fence_wait while holding this mutex, a
circular dependency is created with the memory allocator.

If the system is under memory pressure and triggers reclaim while signaling
the fence, or if a GPU reset (which must allocate memory) is needed to sign=
al
the fence, the reclaim path will attempt to acquire job_mutex and block
forever.

> +	dma_fence_put(fence);
> +
> +	m->ulls.enabled =3D false;
> +unlock_exit:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904022207.3490=
018-1-matthew.brost@intel.com?part=3D20
