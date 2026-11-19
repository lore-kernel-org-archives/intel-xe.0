Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65FC6606A33E
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 18:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j3TlVHb6
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1768010F074;
	Thu, 19 Nov 2026 18:06:56 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1068910F074
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Nov 2026 18:06:49 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 09EB260A65;
 Thu, 19 Nov 2026 18:06:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E9811F000C5;
 Thu, 19 Nov 2026 18:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795111607;
 bh=R/ANfKmVc3bl6O7PAVm1NrSaSba1nd7lAtMIJOWtbGM=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=j3TlVHb6/S95/Stm/3Z1Pm9utQJ/Laoj+HcYebPqgXDYFwUlVSMkX7HVemPsmEDXe
 rly6Lmuuv20AvJ2d4dGhpU+UsV2M9gufllwzh+aN5wV4fTW3889B8NeFmKDeUFis/L
 yOUT5EjLkSMJD2+2K3eT9ZxbCYmtuXDR0Zs2xYa6+9WFJpe4FCyEw5HGwzOZPdh46h
 5uxcjv1X+SFbjdffMSlwQgbKvqwEfkoHa6ZdpSS4bdOT4jlz9KPCANAKIQV0808M1o
 DvFA0D35bthSPpsL5vuiQVckMf6yKFpcu9Ct5AU0QSege2KFq35Is7Ah9ngMpExgbt
 j40oVqsWPVKxA==
Message-ID: <sashiko-outbox-223756@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/4] drm/xe: Notify scheduling-state waiters per exec
 queue
To: "Daniel Charles" <daniel.charles@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261119174621.1311154-3-daniel.charles@intel.com>
References: <20261119174621.1311154-1-daniel.charles@intel.com>
 <20261119174621.1311154-3-daniel.charles@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 18:06:47 +0000
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
- [High] drm/xe: IRQ deadlock on exec_queue_lookup in
  xe_guc_submit_wake_state_waiters()
--

commit 82584d6c0991b25ef45bbf198d37096f89c4db89
Author: Daniel Charles <daniel.charles@intel.com>

drm/xe: Notify scheduling-state waiters per exec queue

This commit adds a per-exec-queue waitqueue for GuC scheduling state
changes and wakes waiters upon SCHED_DONE, submission stop, wedge, and VF
migration recovery.

> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_g=
uc_submit.c
> index 1f24e248acb97..4087a38ad3d66 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -559,6 +559,30 @@ static bool vf_recovery(struct xe_guc *guc)
>  	return xe_gt_recovery_pending(guc_to_gt(guc));
>  }
> =20
> +/**
> + * xe_guc_submit_wake_state_waiters() - Wake all scheduling-state waiters
> + * @guc: the &xe_guc
> + *
> + * Notify per-queue waiters when a GuC-wide stop or recovery changes the=
ir
> + * wait conditions. May be called from interrupt context.
> + */
> +void xe_guc_submit_wake_state_waiters(struct xe_guc *guc)
> +{
> +	struct xarray *lookup =3D &guc->submission_state.exec_queue_lookup;
> +	struct xe_exec_queue *q;
> +	unsigned long index, flags;
> +
> +	if (!guc->submission_state.initialized)
> +		return;
> +
> +	/* Prevent removal and freeing of queues while waking their waiters. */
> +	xa_lock_irqsave(lookup, flags);
> +	xa_for_each(lookup, index, q)
> +		if (q->guc->id =3D=3D index)
> +			wake_up_all(&q->guc->state_wq);
> +	xa_unlock_irqrestore(lookup, flags);
> +}

[Severity: High]
Can taking exec_queue_lookup's xa_lock from hardirq context self-deadlock
against process-context mutators?

vf_start_migration_recovery() calls xe_guc_submit_wake_state_waiters()
from hardirq context via xe_guc_irq_handler() ->
xe_guc_sw_0_irq_handler() -> xe_gt_sriov_vf_migrated_event_handler().
However, exec_queue_lookup is initialized with xa_init() without
XA_FLAGS_LOCK_IRQ, and alloc_guc_id(), publish_guc_id(), and
__release_guc_id() mutate it using xa_insert(), xa_store(), and
xa_erase(), which take xa_lock with interrupts enabled:

alloc_guc_id()
  xa_insert(&guc->submission_state.exec_queue_lookup, ...)
    xa_lock(...)
    <hardirq>
      xe_guc_irq_handler()
        ...
          vf_start_migration_recovery()
            xe_guc_submit_wake_state_waiters()
              xa_lock_irqsave(lookup, flags)  <-- spins forever

Initializing exec_queue_lookup with xa_init_flags(..., XA_FLAGS_LOCK_IRQ)
and using the _irq variants for xa_insert(), xa_store(), and xa_erase()
would avoid this lock inversion.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119174621.1311=
154-1-daniel.charles@intel.com?part=3D2
