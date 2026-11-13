Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A06606A32E
	for <intel-xe@archiver.kernel.org>; Fri, 13 Nov 2026 13:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IB3C06H/
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA066112599;
	Fri, 13 Nov 2026 13:46:33 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1B30112599
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Nov 2026 13:46:26 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 4244C62724;
 Fri, 13 Nov 2026 13:46:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6EFD1F000C4;
 Fri, 13 Nov 2026 13:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794577586;
 bh=dfOcbvMXa7ZwaxRuN6y4ZLi6G8vE2EHIsiQfLOp96k4=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=IB3C06H/LfLChnFYwCvkRQBvkgeR6jA7Hc+6xqTAZMSBNbxnizsGs7hbZjF4qVG5d
 o0mLCUM7sNXQo+kcgO10tX77Hg1HOP2+ZPLWDdg3rdoh3fsrHNeK7L4yPpprt6WBxk
 kTkcWxTdh7eQtROtXMpMgJ52n5OMLQXCmdiTi7Kp/s5NzYJ+2r3Qx+bAmM6a+LrBRG
 ddYuH7TWelPhFWKyJs6x09sy2dTH92258GqWsqBiNbRF0y8isrtWI/xmZLPGWWLpdr
 H7apA/oakifIxjVVmkqQbrEdUygWPFscqJ8C/NUKsUINRC6XgPELnHnMj6ChwEmhXp
 h2ryy64KajQzg==
Message-ID: <sashiko-outbox-212921@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] drm/xe: fix UAF race between exec-queue teardown and
 GuC CT pause-abort
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261113132149.2989667-2-tejas.upadhyay@intel.com>
References: <20261113132149.2989667-2-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 13:46:25 +0000
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
- [High] drm/xe: stalled CLEANUP and queue leak in
  xe_guc_submit_pause_abort()
--

commit 904ab0c1661eb0e9b87cd4d66b549b254ac2e0f0
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>

drm/xe: fix UAF race between exec-queue teardown and GuC CT pause-abort

This commit uses kref_get_unless_zero() in xe_guc_submit_pause_abort() to
skip exec queues whose refcount has already dropped to zero during
concurrent teardown.

> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_g=
uc_submit.c
> index 9e7c2778029ca..92290b8be24aa 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -3297,12 +3297,18 @@ void xe_guc_submit_pause_abort(struct xe_guc *guc)
>  	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q) {
>  		struct xe_gpu_scheduler *sched =3D &q->guc->sched;
> =20
> -		/* Prevent redundant attempts to stop parallel queues */
> -		if (q->guc->id !=3D index)
> +		/*
> +		 * Prevent redundant attempts to stop parallel queues, and skip
> +		 * queues already dropped to a zero refcount via their own
> +		 * independent teardown (guc_exec_queue_fini(), xarray entry
> +		 * not yet erased)
> +		 */
> +		if (q->guc->id !=3D index || !kref_get_unless_zero(&q->refcount))
>  			continue;
> =20
>  		xe_sched_submission_start(sched);
>  		guc_exec_queue_kill(q);
> +		xe_exec_queue_put(q);
>  	}
>  	mutex_unlock(&guc->submission_state.lock);
>  }

[Severity: High]
Does skipping xe_sched_submission_start(sched) when
kref_get_unless_zero(&q->refcount) fails leave sched permanently stopped
with an unprocessed CLEANUP message, leaking q?

When the final reference to q is dropped via xe_exec_queue_put(),
q->refcount is already zero when xe_exec_queue_destroy() ->
guc_exec_queue_destroy() queues STATIC_MSG_CLEANUP onto sched->msgs to run
teardown asynchronously on sched->work_process_msg:

drivers/gpu/drm/xe/xe_guc_submit.c:guc_exec_queue_destroy() {
	struct xe_sched_msg *msg =3D q->guc->static_msgs + STATIC_MSG_CLEANUP;

	guc_exec_queue_add_msg(q, msg, CLEANUP);
}

Callers of xe_guc_submit_pause_abort() first stop every scheduler in
exec_queue_lookup via xe_guc_submit_stop() -> xe_sched_submission_stop(),
which stops the workqueue and cancels sched->work_process_msg.  During
driver unbind or SR-IOV VF removal, guc_submit_fini() drops references on
wedged queues (and earlier devm release actions such as xe_migrate_fini()
drop kernel queues) right before calling xe_guc_submit_stop().  If
xe_sched_submission_stop() runs before work_process_msg pops
STATIC_MSG_CLEANUP, exec_queue_destroyed(q) is still false, so
guc_exec_queue_stop() does not destroy the queue either.

When xe_guc_submit_pause_abort() then skips xe_sched_submission_start(sched)
because q->refcount is zero, STATIC_MSG_CLEANUP remains stranded on the
stopped scheduler.  guc_exec_queue_destroy_async() and guc_exec_queue_fini()
never run, leaking q along with its runtime PM and drm_device references,
leaving its entry in exec_queue_lookup (which trips the xa_empty() assert in
guc_submit_sw_fini()), and hanging xe_file_close() on
xef->exec_queue.pending_removal for user queues.

Should xe_sched_submission_start(sched) be called before checking
kref_get_unless_zero(&q->refcount) so pending CLEANUP messages can still
be processed?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113132149.2989=
667-2-tejas.upadhyay@intel.com?part=3D1
