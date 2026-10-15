Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0874CC6B2E
	for <intel-xe@archiver.kernel.org>; Thu, 15 Oct 2026 05:28:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FCF110E9D0;
	Thu, 15 Oct 2026 05:28:42 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CEDE10E9E3
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Oct 2026 05:28:36 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 2819143F04;
 Thu, 15 Oct 2026 05:28:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF2FF1F000C4;
 Thu, 15 Oct 2026 05:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1792042116;
 bh=CXbtvKU2u8F5aSY85YBoC5XuoYVPK0fA4z1yTZ99PPU=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=SwqOg8driMReg16zcKL+GowX3UfU0m+KL+1rEMKoZhnfkzlnsdVP1idBmy+KaSKtC
 X09pMse58O+YQWJBKbq1LYPifpmVRrrIhJ3CjVapJIWFkLoxq1zOJazTzsT2reYtjM
 uGF4tybde04hVYyc+3rC4WMbBbB05cfqyGC9yVfpNfHk9pm1GUIeZc8BL1D52aVyOj
 Hri3T4uO8cTNo1hqYyhxU9NnWx/HA74qmP/y6++Cim+U2vYCXtS/ykgU/LSJTNUtu+
 +vonUsfunVbwJnZ1PS3GHtIb7Lab9AV89VxQCkNvYFu2D/ZQ7cMZsZL+GA7lrAmOcc
 C6mW0gDE7eqdg==
Message-ID: <sashiko-outbox-172307@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] drm/xe: Synchronously wait for queue kill on FD
 close
To: "Daniel Charles" <daniel.charles@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261015050136.1069815-4-daniel.charles@intel.com>
References: <20261015050136.1069815-1-daniel.charles@intel.com>
 <20261015050136.1069815-4-daniel.charles@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 05:28:35 +0000
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
- [High] drm/xe/guc: async reset on kill timeout causes page table UAF
- [High] drm/xe: missing queue kill_sync in xe_exec_queue_destroy_ioctl
--

commit 50edeb4bbee349d41ce073d20f8d55dc6152900b
Author: Daniel Charles <daniel.charles@intel.com>

    drm/xe: Synchronously wait for queue kill on FD close
   =20
    The early KILL message disables GuC scheduling outside the serialized
    TDR path, but xe_file_close() does not wait for it to complete before
    dropping queue references. GuC may still schedule contexts whose page
    tables are being torn down, producing CAT errors and engine resets.

> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_e=
xec_queue.c
> index 7ade915c59a85..af5d9e8f0b16e 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -1623,6 +1623,19 @@ void xe_exec_queue_kill(struct xe_exec_queue *q)
>  	xe_vm_remove_compute_exec_queue(q->vm, q);
>  }
> =20
> +/**
> + * xe_exec_queue_kill_sync() - Wait for queue scheduling to stop
> + * @q: The exec queue
> + *
> + * This function waits for the backend to finish stopping the queue after
> + * xe_exec_queue_kill(). It is safe to call multiple times.
> + */
> +void xe_exec_queue_kill_sync(struct xe_exec_queue *q)
> +{
> +	if (q->ops->kill_sync)
> +		q->ops->kill_sync(q);
> +}

[Severity: High]
Does this same fix need to be applied to xe_exec_queue_destroy_ioctl()?

If userspace calls the queue destruction ioctl to destroy an exec queue,
followed immediately by the VM destruction ioctl to destroy the associated
VM, xe_exec_queue_destroy_ioctl() calls xe_exec_queue_kill() which
decrements vm->preempt.num_exec_queues to 0, but it returns without waiting.

The subsequent VM destruction ioctl then succeeds and synchronously frees t=
he
VM's page tables while GuC may still be actively scheduling the queue on
those tables. Will this lead to the same CAT errors and engine resets this
patch is trying to fix?

[ ... ]

> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_g=
uc_submit.c
> index 609af66b343d5..559937e584aa3 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
[ ... ]
> @@ -2267,6 +2289,28 @@ static void guc_exec_queue_kill(struct xe_exec_que=
ue *q)
>  	xe_guc_exec_queue_trigger_cleanup(q);
>  }
> =20
> +static void guc_exec_queue_kill_sync(struct xe_exec_queue *q)
> +{
> +	struct xe_exec_queue *primary =3D xe_exec_queue_multi_queue_primary(q);
> +	struct xe_guc *guc =3D exec_queue_to_guc(primary);
> +	long ret;
> +
> +	xe_assert(guc_to_xe(guc), exec_queue_killed(q));
> +
> +	ret =3D wait_event_timeout(guc->submission_state.kill_wq,
> +				 (!exec_queue_enabled(primary) &&
> +				  !exec_queue_pending_disable(primary) &&
> +				  !exec_queue_pending_enable(primary)) ||
> +				 xe_guc_read_stopped(guc) ||
> +				 vf_recovery(guc) ||
> +				 exec_queue_wedged(primary), HZ * 5);
> +	if (!ret) {
> +		xe_gt_warn(q->gt, "Queue kill failed to respond, guc_id=3D%d\n",
> +			   primary->guc->id);
> +		xe_gt_reset_async(q->gt);
> +	}

[Severity: High]
Can this timeout handling cause a use-after-free of page tables?

If wait_event_timeout() expires because GuC fails to respond, we queue an
asynchronous GT reset via xe_gt_reset_async() and return immediately.

Because the reset is processed asynchronously by a worker, the GuC hardware
remains active. By returning immediately, the caller (xe_file_close()) will
proceed to drop queue references and synchronously destroy the VM's page
tables via xe_vm_close_and_put().

Since the GuC hardware is not halted before the page tables are freed, could
the hardware page walker access the freed page table memory? Should this
path either halt the hardware synchronously or wait for the reset to comple=
te
before returning?

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015050136.1069=
815-1-daniel.charles@intel.com?part=3D3
