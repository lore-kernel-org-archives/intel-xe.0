Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14DD8606A333
	for <intel-xe@archiver.kernel.org>; Tue,  3 Nov 2026 06:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m2Qfew34
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C679D10F367;
	Tue,  3 Nov 2026 06:31:29 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2090110F367
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Nov 2026 06:31:23 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id DE74941471;
 Tue,  3 Nov 2026 06:31:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A614F1F000C1;
 Tue,  3 Nov 2026 06:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793687482;
 bh=79DdbLJ7YRMyHvfH2F7PqaFADYGAW8z1hqX2kqBS0wU=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=m2Qfew34nKB/RY2NtSYy5XVsmY7/P3X1Y+AejtCOhKe6NyvvzQfsCeJTvc1q9v3Be
 Di070Ak47NuYueCNjnlD876TqHq0mqr1hOBlZQPU6CCEtcvuVwmKcZ30h+sb6VstxJ
 fVinTEnAuspLqCylLX3n+wAoTJzex+f33mARMBLwCMzIuo1xSaHQyOGSohTSLTrW0E
 PrUkosTjiouLNtv2ukgALEGq1FF4Wh3rAlY6Ml7o0OyF4xnt5ygwXM8YdnO80j6KeT
 P7maszLoELSHD3JPWAI790zYm96qnOpCW9yjgshcTFtvp/o6NqS900ymohdrxhF5lb
 gFjKLXgGt05xA==
Message-ID: <sashiko-outbox-194633@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 06/10] drm/xe/migrate: Introduce xe_migrate_reinit()
To: "Raag Jadav" <raag.jadav@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261103060649.1015468-7-raag.jadav@intel.com>
References: <20261103060649.1015468-1-raag.jadav@intel.com>
 <20261103060649.1015468-7-raag.jadav@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 06:31:22 +0000
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

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] drm/xe/migrate: missing ULLS teardown and race in xe_migrate_reini=
t()
--

commit e6b24d47b598778e5ce6fbebf60700ba786119b2
Author: Raag Jadav <raag.jadav@intel.com>

drm/xe/migrate: Introduce xe_migrate_reinit()

This commit introduces xe_migrate_reinit() and wires it into xe_gt_reinit()
to re-initialize the migration VM page tables and migration exec queue after
a PCIe FLR.

> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migr=
ate.c
> index 19c37eb315893..71dfb1b3362a3 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -778,6 +778,18 @@ static void xe_migrate_ulls_exit(struct work_struct =
*work)
>  	drm_dev_exit(idx);
>  }
> =20
> +/**
> + * xe_migrate_reinit() - Re-initialize a migrate context
> + * @m: The migration context
> + *
> + * Returns: 0 on success, negative error code otherwise.
> + */
> +int xe_migrate_reinit(struct xe_migrate *m)
> +{
> +	xe_migrate_prepare_vm(m->tile, m, m->q->vm, NULL);
> +	return xe_exec_queue_reinit(m->q);
> +}

[Severity: High]
Does xe_migrate_reinit() (or the preceding FLR preparation path) also need =
to
stop m->ulls.exit_work and reset m->ulls.enabled along with its runtime PM
reference?

On USM-capable dGFX platforms, xe_migrate_ulls_enter() takes a runtime PM
reference via xe_pm_runtime_get_noresume(), sets m->ulls.enabled =3D true,
parks the migration engine on a PPHWSP semaphore in VRAM, and schedules
m->ulls.exit_work (xe_migrate_ulls_exit()) on system_percpu_wq.

During teardown, xe_migrate_fini() cleans this up before destroying the
queue:

drivers/gpu/drm/xe/xe_migrate.c:xe_migrate_fini() {
    ...
	disable_delayed_work_sync(&m->ulls.exit_work);
	scoped_guard(mutex, &m->job_mutex) {
		if (xe_migrate_ulls_enabled(m)) {
			xe_pm_runtime_put(xe);
			xe_migrate_ulls_toggle_enable(m, false);
		}
	}
    ...
}

Across PCIe FLR, however, neither xe_gt_flr_prepare() nor xe_migrate_reinit=
()
cancels m->ulls.exit_work or resets m->ulls.enabled:

1. If m->ulls.exit_work has not fired yet when xe_migrate_reinit() and GT
   restart finish, m->ulls.enabled remains true and the runtime PM reference
   stays held, even though PCIe FLR and xe_lrc_ctx_init() wiped VRAM, zeroed
   the LRC PPHWSP semaphores, and reset the engine out of ULLS mode.
   Subsequent calls to xe_migrate_ulls_enter() will see m->ulls.enabled set
   and skip submitting a ULLS_ENTER job, while xe_migrate_job_push() will t=
ag
   post-FLR jobs as ULLS_ACTIVE, suppressing H2G context submission and ring
   tail updates in submit_exec_queue() and stalling migrations.

2. If xe_migrate_ulls_exit() runs after uc_flr_sanitize() has stopped the
   scheduler (or concurrently with xe_migrate_reinit(), which does not take
   m->job_mutex), xe_migrate_ulls_exit() sees xe_exec_queue_is_idle(m->q, 1)
   and calls __xe_migrate_job_push(m, job, ULLS_EXIT), which arms the job
   (advancing lrc->fence_ctx.next_seqno) and pushes it to m->q->entity. When
   xe_migrate_reinit() -> xe_exec_queue_reinit() -> xe_lrc_ctx_init() runs:

   drivers/gpu/drm/xe/xe_lrc.c:xe_lrc_ctx_init() {
       ...
       map =3D __xe_lrc_seqno_map(lrc);
       xe_map_write32(lrc_to_xe(lrc), &map, lrc->fence_ctx.next_seqno - 1);
       ...
   }

   it writes lrc->fence_ctx.next_seqno - 1 into the LRC seqno map,
   prematurely signaling the unsubmitted ULLS_EXIT fence seqno while the
   stale job remains queued in m->q->entity.

3. If xe_migrate_ulls_exit() runs during xe_uc_flr_prepare() in the window
   after xe_guc_submit_pause_abort() (which restarts the scheduler with m->q
   marked killed and timeout set to 0) and before uc_flr_sanitize() stops t=
he
   scheduler, the ULLS_EXIT job is popped without emitting to the ring
   (leaving job->ptrs[0].head =3D=3D 0) and queues TDR on gt->ordered_wq, w=
hich
   can either restart scheduler submission before xe_sched_reinit() asserts
   drm_sched_is_stopped() or leave the un-emitted job on pending_list so
   guc_exec_queue_start() rewinds lrc->ring.tail to 0 over the instructions
   written by xe_lrc_ctx_init().

Should m->ulls.exit_work be canceled and m->ulls.enabled (along with its
runtime PM reference) be reset before re-initializing m->q?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103060649.1015=
468-1-raag.jadav@intel.com?part=3D6
