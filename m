Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D846083629
	for <intel-xe@archiver.kernel.org>; Thu,  5 Nov 2026 15:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jOUEamuP
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DE071127F4;
	Thu,  5 Nov 2026 15:51:23 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 576AF10E2F5
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Nov 2026 15:51:16 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 9971D605F4;
 Thu,  5 Nov 2026 15:51:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 381CA1F000C1;
 Thu,  5 Nov 2026 15:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793893875;
 bh=2d5lvGV7yyvswmRHm36kJoi6ciNZb+ZP4q3Ut3esClM=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=jOUEamuP0lxQHSpFt+2xe71eomVB/LfTHCeYH7ugda818FFkbs1Mf1d+maYPbSQQ9
 HwduDuv766F74FCDf7TJvhrMkDzOv93FuMleEX1eur9q8tjtvDMwSog9Qwpa9VOLZ6
 2jXDDVjEpXUIz/awMf4SPEV+kWGsxvMsN9aWbYwyHYoaqB7wtSQ60pMj+W0UEFzAPJ
 8UOvofYxGZu3Ue2S3afPkCWTSSg7ATvrOMsTx2DDmbvQUA3RpZ/Zm7Vem8awSyckVg
 7FAIM7nFdtKH/eeCizfwy5Bumh8rq2aS67j8VchsX36hBbDVyEyrxtv3Rp68/jRvGb
 RuMRgmNWrjTmg==
Message-ID: <sashiko-outbox-199354@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] drm/xe: Keep ulls alive while servicing ops.
To: "Maarten Lankhorst" <dev@lankhorst.se>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261102185834.136370-2-dev@lankhorst.se>
References: <20261102185834.136370-2-dev@lankhorst.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 15:51:14 +0000
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

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] drm/xe: ulls_used refcount leak on error in vm_bind_ioctl_ops_crea=
te()
- [Medium] drm/xe: premature xe_migrate_ulls_leave() in vm_bind_ioctl_ops_c=
reate()
- [Medium] drm/xe: ULLS exits while ulls_used > 0 in xe_migrate_ulls_exit()
- [Medium] drm/xe: race between xe_migrate_ulls_leave() and xe_migrate_ulls=
_enter()
- [Medium] drm/xe: concurrent xe_migrate_ulls_enter() returns before ULLS e=
nabled
--

commit 12e9880121b0cd4ae8ab769d216e3524d057e97e
Author: Maarten Lankhorst <dev@lankhorst.se>

drm/xe: Keep ulls alive while servicing ops.

This commit introduces an atomic ulls_used reference counter and a paired
xe_migrate_ulls_leave() helper to keep ULLS mode active across pagefault and
SVM prefetch operations.

> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migr=
ate.c
> index 19c37eb315893..308bc52e1be52 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c

[ ... ]

> @@ -692,6 +696,12 @@ void xe_migrate_ulls_enter(struct xe_migrate *m)
>  	if (!IS_DGFX(xe) || !m->ulls.exit_ms)
>  		return;
> =20
> +	/* Bump */
> +	if (atomic_inc_return(&m->ulls_used) > 1)
> +		return;
> +
> +	cancel_delayed_work_sync(&m->ulls.exit_work);
> +
>  job_alloc:
>  	if (alloc) {
>  		/*

[Severity: Medium]
What happens if a second caller enters xe_migrate_ulls_enter() in
drivers/gpu/drm/xe/xe_migrate.c while the first caller is still transitioni=
ng
m->ulls_used from 0 to 1?

The first caller runs cancel_delayed_work_sync(&m->ulls.exit_work) and
allocates the scheduler job via xe_sched_job_create() outside m->job_mutex
before acquiring m->job_mutex to push the ULLS_ENTER job and set
m->ulls.enabled =3D true:

drivers/gpu/drm/xe/xe_migrate.c:xe_migrate_ulls_enter() {
	if (atomic_inc_return(&m->ulls_used) > 1)
		return;

	cancel_delayed_work_sync(&m->ulls.exit_work);

job_alloc:
	if (alloc) {
		job =3D xe_sched_job_create(m->q, batch_addr);
		if (WARN_ON_ONCE(IS_ERR(job)))
			return;		/* Not fatal */
	}

	mutex_lock(&m->job_mutex);
	if (!xe_migrate_ulls_enabled(m)) {
		if (!job) {
			alloc =3D true;
			mutex_unlock(&m->job_mutex);
			goto job_alloc;
		}
		...
		xe_migrate_ulls_toggle_enable(m, true);
	}
}

During that window (or if xe_sched_job_create() fails and returns early), a
concurrent caller of xe_migrate_ulls_enter() sees
atomic_inc_return(&m->ulls_used) > 1 and returns immediately before ULLS is
actually enabled. Could that concurrent caller then acquire m->job_mutex in
xe_migrate_job_push() first, see xe_migrate_ulls_enabled(m) =3D=3D false, a=
nd
submit its migration jobs with ULLS_NONE instead of ULLS_ACTIVE?

> @@ -725,10 +735,30 @@ void xe_migrate_ulls_enter(struct xe_migrate *m)
>  	}
>  	if (job)
>  		xe_sched_job_put(job);
> +	mutex_unlock(&m->job_mutex);
> +}
> +
> +/**
> + * xe_migrate_ulls_leave() - Leave ULLS mode
> + * @m: The migration context.
> + *
> + * Leaves the critical part of the migration context, it may continue to=
 be enabled.
> + * Pairs with xe_migrate_ulls_enter().
> + */
> +void xe_migrate_ulls_leave(struct xe_migrate *m)
> +{
> +	struct xe_device *xe =3D tile_to_xe(m->tile);
> +
> +	if (!IS_DGFX(xe) || !m->ulls.exit_ms)
> +		return;
> +
> +	if (atomic_dec_return(&m->ulls_used))
> +		return;
> +
> +	guard(mutex)(&m->job_mutex);
>  	if (xe_migrate_ulls_enabled(m))
>  		mod_delayed_work(system_percpu_wq, &m->ulls.exit_work,
>  				 ULLS_EXIT_JIFFIES(m));
> -	mutex_unlock(&m->job_mutex);
>  }

[Severity: Medium]
Can m->ulls.exit_work still fire and disable ULLS while m->ulls_used is
non-zero?

In drivers/gpu/drm/xe/xe_migrate.c, xe_migrate_job_push() unconditionally
re-arms m->ulls.exit_work whenever a migration job is pushed:

drivers/gpu/drm/xe/xe_migrate.c:xe_migrate_job_push() {
	if (xe_migrate_ulls_enabled(m)) {
		ulls =3D ULLS_ACTIVE;
		mod_delayed_work(system_percpu_wq, &m->ulls.exit_work,
				 ULLS_EXIT_JIFFIES(m));
	}
}

And when the worker runs, xe_migrate_ulls_exit() only checks whether m->q is
idle without checking m->ulls_used:

drivers/gpu/drm/xe/xe_migrate.c:xe_migrate_ulls_exit() {
	scoped_guard(mutex, &m->job_mutex) {
		if (xe_exec_queue_is_idle(m->q, 1)) {
			fence =3D __xe_migrate_job_push(m, job, ULLS_EXIT);
			dma_fence_put(fence);

			xe_pm_runtime_put(xe);	/* Pairs with PM get in enter */
			xe_migrate_ulls_toggle_enable(m, false);
			...
		}
	}
}

If a migration job finishes on the GPU while the CPU is still servicing an
operation (for example, waiting on CPU page faults or locks in
xe_pagefault_service()) for longer than exit_ms before submitting the next
migration job, won't xe_migrate_ulls_exit() exit ULLS mode while
m->ulls_used > 0? Once m->ulls.enabled is false while m->ulls_used > 0, both
the remaining jobs in the current operation and any overlapping callers of
xe_migrate_ulls_enter() (which return early on
atomic_inc_return(&m->ulls_used) > 1) will run without ULLS enabled.

Also, in xe_migrate_ulls_leave(), atomic_dec_return(&m->ulls_used) happens
before acquiring m->job_mutex, and m->ulls_used is not re-checked under
m->job_mutex:

CPU0                                     CPU1
xe_migrate_ulls_leave(m)
  atomic_dec_return(&m->ulls_used) =3D=3D 0
                                         xe_migrate_ulls_enter(m)
                                           atomic_inc_return(&m->ulls_used)=
 =3D=3D 1
                                           cancel_delayed_work_sync(&m->ull=
s.exit_work)
                                           mutex_lock(&m->job_mutex)
                                           /* sees m->ulls.enabled =3D=3D t=
rue */
                                           mutex_unlock(&m->job_mutex)
  guard(mutex)(&m->job_mutex);
  mod_delayed_work(..., &m->ulls.exit_work, ...);

Could this race leave m->ulls.exit_work armed while CPU1 holds an active
m->ulls_used reference?

> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index dfbabfb19cbba..aac89b3714791 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2603,7 +2603,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct x=
e_vma_ops *vops,
>  				if (addr)
>  					goto alloc_next_range;
>  				else
> -					goto print_op_label;
> +					goto ulls_leave;
>  			}
> =20
>  			if (IS_ERR(svm_range)) {
> @@ -2649,8 +2649,10 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct =
xe_vma_ops *vops,
>  			if (need_put)
>  				xe_svm_range_put(svm_range);
> =20
> +ulls_leave:
> +			for_each_tile(tile, vm->xe, id)
> +				xe_migrate_ulls_leave(tile->migrate);
>  		}
> -print_op_label:
>  		print_op(vm->xe, __op);
>  	}

[Severity: High]
Does vm_bind_ioctl_ops_create() in drivers/gpu/drm/xe/xe_vm.c leak the
tile->migrate->ulls_used reference count on all tiles if an error occurs
after entering ULLS?

When handling DRM_GPUVA_OP_PREFETCH on a CPU address mirror VMA,
vm_bind_ioctl_ops_create() calls xe_migrate_ulls_enter(tile->migrate) for
each tile before the alloc_next_range loop:

drivers/gpu/drm/xe/xe_vm.c:vm_bind_ioctl_ops_create() {
			for_each_tile(tile, vm->xe, id) {
				xe_migrate_ulls_enter(tile->migrate);
				tile_mask |=3D 0x1 << id;
			}
			...
alloc_next_range:
			svm_range =3D xe_svm_range_find_or_insert(vm, addr, vma, &ctx);
			...
			if (IS_ERR(svm_range)) {
				err =3D PTR_ERR(svm_range);
				goto unwind_prefetch_ops;
			}
			...
			err =3D xa_alloc(&op->prefetch_range.range,
				       &i, svm_range, xa_limit_32b,
				       GFP_KERNEL);

			if (err) {
				xe_svm_range_put(svm_range);
				goto unwind_prefetch_ops;
			}
}

If xe_svm_range_find_or_insert() returns an error other than -ENOENT or if
xa_alloc() fails, execution jumps to unwind_prefetch_ops, bypassing the
ulls_leave label. Because unwind_prefetch_ops does not call
xe_migrate_ulls_leave(), won't tile->migrate->ulls_used remain permanently
elevated on every tile, preventing m->ulls.exit_work from being scheduled a=
nd
leaking the runtime PM reference acquired in xe_migrate_ulls_enter()?

[Severity: Medium]
Is vm_bind_ioctl_ops_create() in drivers/gpu/drm/xe/xe_vm.c calling
xe_migrate_ulls_leave() before the actual prefetch migrations and page-table
binds take place?

In vm_bind_ioctl_ops_create(), the DRM_GPUVA_OP_PREFETCH loop only looks up
or inserts CPU-side xe_svm_range structures and records them in
op->prefetch_range.range before jumping to ulls_leave and dropping
tile->migrate->ulls_used back to 0.

The actual SVM prefetch work (migrating pages to device memory and updating
page tables) happens later in xe_vm_bind_ioctl():

drivers/gpu/drm/xe/xe_vm.c:xe_vm_bind_ioctl() {
	...
	err =3D vm_bind_ioctl_ops_prefetch_ranges(vm, &vops);
	if (err)
		goto unwind_ops;

	fence =3D vm_bind_ioctl_ops_execute(vm, &vops);
	...
}

Should the ULLS reference be held across vm_bind_ioctl_ops_prefetch_ranges()
and vm_bind_ioctl_ops_execute() rather than being released at the end of
vm_bind_ioctl_ops_create()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102185834.1363=
70-2-dev@lankhorst.se?part=3D1
