Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA62A606A32A
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 17:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CdSl+UeD
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B305310E610;
	Thu, 19 Nov 2026 17:27:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 193DD10E64E
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Nov 2026 17:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795109232; x=1826645232;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=L6nw/ZfOw769K9K64B47JXm60T/ITQzt0m2JvDlfHOA=;
 b=CdSl+UeDyY9GyxQ7bZT+oIzbB4hdUxBhoiMyvaP0xZWJ15apTF5u5NTo
 /C64rv+qKG+JbiHTE5YGxP/ARGQGY3t1a1xgVaHW83Gs11tvnTfBY6mkP
 DqvhT+qPLB9jig0/P9c1JS8kN9wG556xrfbEVoCpV285uElv4esQCdMMX
 50hr4ul7weOEKN2waY+kFu9htYY1KGd21mfL90qvf3MWRnZH4+E8HCkdv
 7XSJt14T1sY+2moSlYwfsaeZ6vSrC2EOQd7Mz/atdRabrW/OOzl8CrTuP
 L03Fm+AmFBWUY3TQhfy/CTibXAao47/uthqoOIk6g3DNJtcnbyLljIW6v Q==;
X-CSE-ConnectionGUID: z0353hQdREGFZJ8DL2dbGA==
X-CSE-MsgGUID: qdmzl4qbR/SEHvkgsBzZBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3819137"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3819137"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 09:26:47 -0800
X-CSE-ConnectionGUID: tAAX4Zp2Re6UthgkBOnlcQ==
X-CSE-MsgGUID: enkApadpSMCtJpMiDvCrrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; d="scan'208";a="10481642"
Received: from amilburn-desk.amilburn-desk (HELO [10.245.245.91])
 ([10.245.245.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 09:26:46 -0800
Message-ID: <90e8b4228e4233d89c5295fec195f804a8a487de.camel@linux.intel.com>
Subject: Re: [PATCH 2/5] drm/xe: Requeue the rebind worker instead of
 retrying in-line on -EAGAIN
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, Matthew Brost	
 <matthew.brost@intel.com>, Himal Prasad Ghimiray	
 <himal.prasad.ghimiray@intel.com>, Stuart Summers <stuart.summers@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 19 Nov 2026 18:26:43 +0100
In-Reply-To: <d88e9520-7e9e-45c2-9179-e5c50e86d2ae@intel.com>
References: <20261119-userptr-repin-v1-0-af2e327833a9@intel.com>
 <20261119-userptr-repin-v1-2-af2e327833a9@intel.com>
 <d2c8112c02a1324473e3808aec2df793f60b9397.camel@linux.intel.com>
 <d88e9520-7e9e-45c2-9179-e5c50e86d2ae@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 2026-11-19 at 16:29 +0000, Matthew Auld wrote:
> On 19/11/2026 12:51, Thomas Hellstr=C3=B6m wrote:
> > On Thu, 2026-11-19 at 11:14 +0000, Matthew Auld wrote:
> > > From: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > >=20
> > > When the preempt rebind worker needs to retry, it currently jumps
> > > back
> > > and keeps holding vm->lock in write mode across the retry. Only
> > > VFs
> > > with migration support drop the lock and requeue the worker.
> > >=20
> > > Holding the vm lock across retries needlessly blocks other users
> > > of
> > > the
> > > lock and other work on the ordered workqueue, and makes the retry
> > > unfit
> > > for conditions that may last for a while, like repeatedly
> > > invalidated
> > > userptrs.
> > >=20
> > > Always drop the vm lock and requeue the worker on -EAGAIN. This
> > > also
> > > fixes a leak of the preempt fences allocated in the failed
> > > attempt on
> > > the existing VF path.
> >=20
> > Do we need a Fixes: here?
>=20
> Yeah, should I also split out the leak fix? Feels like a separate=20
> change?=C2=A0

Yes please do.

> And do we want a fixes tag also for the new requeue behaviour?

Hm. You mean if we want to backport the whole series to fix the
timeout?

/Thomas


>=20
> >=20
> > Also needs a separate reviewer.
>=20
> I don't think I touched anything other than adding my sob:
>=20
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>=20
> >=20
> > >=20
> > > The userptr invalidation injection state that forces one retry
> > > per
> > > rebind sequence was a local variable that would be reset by a
> > > requeue.
> > > Move it to the vm.
> > >=20
> > > Signed-off-by: Thomas Hellstr=C3=B6m
> > > <thomas.hellstrom@linux.intel.com>
> > > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > > ---
> > > =C2=A0=C2=A0drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 59
> > > ++++++++++++++++++++++++++----
> > > ----------
> > > =C2=A0=C2=A0drivers/gpu/drm/xe/xe_vm_types.h |=C2=A0 8 ++++++
> > > =C2=A0=C2=A02 files changed, 46 insertions(+), 21 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.c
> > > b/drivers/gpu/drm/xe/xe_vm.c
> > > index 75be5e5329bd..ff8d355728fc 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > @@ -542,6 +542,31 @@ void xe_vm_resume_rebind_worker(struct xe_vm
> > > *vm)
> > > =C2=A0=C2=A0	queue_work(vm->xe->ordered_wq, &vm-
> > > >preempt.rebind_work);
> > > =C2=A0=C2=A0}
> > > =C2=A0=20
> > > +#if IS_ENABLED(CONFIG_DRM_XE_USERPTR_INVAL_INJECT)
> > > +/*
> > > + * Force one retry per rebind sequence. The sequence spans
> > > requeues
> > > of the
> > > + * worker, so the state must live in the vm.
> > > + */
> > > +static bool xe_vm_rebind_worker_inject_retry(struct xe_vm *vm)
> > > +{
> > > +	return !vm->preempt.inval_inject_tries++;
> > > +}
> > > +
> > > +static void xe_vm_rebind_worker_reset_inject(struct xe_vm *vm)
> > > +{
> > > +	vm->preempt.inval_inject_tries =3D 0;
> > > +}
> > > +#else
> > > +static bool xe_vm_rebind_worker_inject_retry(struct xe_vm *vm)
> > > +{
> > > +	return false;
> > > +}
> > > +
> > > +static void xe_vm_rebind_worker_reset_inject(struct xe_vm *vm)
> > > +{
> > > +}
> > > +#endif
> > > +
> > > =C2=A0=C2=A0static void preempt_rebind_work_func(struct work_struct *=
w)
> > > =C2=A0=C2=A0{
> > > =C2=A0=C2=A0	struct xe_vm *vm =3D container_of(w, struct xe_vm,
> > > preempt.rebind_work);
> > > @@ -551,7 +576,6 @@ static void preempt_rebind_work_func(struct
> > > work_struct *w)
> > > =C2=A0=C2=A0	LIST_HEAD(preempt_fences);
> > > =C2=A0=C2=A0	int err =3D 0;
> > > =C2=A0=C2=A0	long wait;
> > > -	int __maybe_unused tries =3D 0;
> > > =C2=A0=20
> > > =C2=A0=C2=A0	xe_assert(vm->xe, xe_vm_in_preempt_fence_mode(vm));
> > > =C2=A0=C2=A0	trace_xe_vm_rebind_worker_enter(vm);
> > > @@ -564,7 +588,6 @@ static void preempt_rebind_work_func(struct
> > > work_struct *w)
> > > =C2=A0=C2=A0		return;
> > > =C2=A0=C2=A0	}
> > > =C2=A0=20
> > > -retry:
> > > =C2=A0=C2=A0	if (!try_wait_for_completion(&vm->xe->pm_block) &&
> > > vm_suspend_rebind_worker(vm)) {
> > > =C2=A0=C2=A0		up_write(&vm->lock);
> > > =C2=A0=C2=A0		/* We don't actually block but don't make
> > > progress.
> > > */
> > > @@ -614,20 +637,14 @@ static void preempt_rebind_work_func(struct
> > > work_struct *w)
> > > =C2=A0=C2=A0		goto out_unlock;
> > > =C2=A0=C2=A0	}
> > > =C2=A0=20
> > > -#define retry_required(__tries, __vm) \
> > > -	(IS_ENABLED(CONFIG_DRM_XE_USERPTR_INVAL_INJECT) ? \
> > > -	(!(__tries)++ || __xe_vm_userptr_needs_repin(__vm)) : \
> > > -	__xe_vm_userptr_needs_repin(__vm))
> > > -
> > > =C2=A0=C2=A0	xe_svm_notifier_lock(vm);
> > > -	if (retry_required(tries, vm)) {
> > > +	if (xe_vm_rebind_worker_inject_retry(vm) ||
> > > +	=C2=A0=C2=A0=C2=A0 __xe_vm_userptr_needs_repin(vm)) {
> > > =C2=A0=C2=A0		xe_svm_notifier_unlock(vm);
> > > =C2=A0=C2=A0		err =3D -EAGAIN;
> > > =C2=A0=C2=A0		goto out_unlock;
> > > =C2=A0=C2=A0	}
> > > =C2=A0=20
> > > -#undef retry_required
> > > -
> > > =C2=A0=C2=A0	xe_vm_bump_lru(vm, &exec);
> > > =C2=A0=20
> > > =C2=A0=C2=A0	/* Point of no return. */
> > > @@ -642,20 +659,20 @@ static void preempt_rebind_work_func(struct
> > > work_struct *w)
> > > =C2=A0=C2=A0		trace_xe_vm_rebind_worker_retry(vm);
> > > =C2=A0=20
> > > =C2=A0=C2=A0		/*
> > > -		 * We can't block in workers on a VF which
> > > supports
> > > migration
> > > -		 * given this can block the VF post-migration
> > > workers from
> > > -		 * getting scheduled.
> > > +		 * Drop all locks and requeue rather than
> > > retrying
> > > in-line.
> > > +		 * This avoids blocking other work items, such
> > > as VF
> > > +		 * post-migration workers, and lets other users
> > > of
> > > the vm
> > > +		 * lock make progress between attempts.
> > > =C2=A0=C2=A0		 */
> > > -		if (IS_SRIOV_VF(vm->xe) &&
> > > -		=C2=A0=C2=A0=C2=A0 xe_sriov_vf_migration_supported(vm->xe)) {
> > > -			up_write(&vm->lock);
> > > -			xe_vm_queue_rebind_worker(vm);
> > > -			return;
> > > -		}
> > > -
> > > -		goto retry;
> > > +		up_write(&vm->lock);
> > > +		free_preempt_fences(&preempt_fences);
> > > +		xe_vm_queue_rebind_worker(vm);
> > > +		trace_xe_vm_rebind_worker_exit(vm);
> > > +		return;
> > > =C2=A0=C2=A0	}
> > > =C2=A0=20
> > > +	xe_vm_rebind_worker_reset_inject(vm);
> > > +
> > > =C2=A0=C2=A0	if (err) {
> > > =C2=A0=C2=A0		drm_warn(&vm->xe->drm, "VM worker error: %d\n",
> > > err);
> > > =C2=A0=C2=A0		xe_vm_kill(vm, true);
> > > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
> > > b/drivers/gpu/drm/xe/xe_vm_types.h
> > > index fb9305124679..756cf2dbee8a 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > > @@ -350,6 +350,14 @@ struct xe_vm {
> > > =C2=A0=C2=A0		 * kicked on resume.
> > > =C2=A0=C2=A0		 */
> > > =C2=A0=C2=A0		struct list_head pm_activate_link;
> > > +#if IS_ENABLED(CONFIG_DRM_XE_USERPTR_INVAL_INJECT)
> > > +		/**
> > > +		 * @inval_inject_tries: Number of rebind
> > > attempts in
> > > the
> > > +		 * current rebind sequence. Used to force a
> > > retry
> > > for testing.
> > > +		 * Protected by @lock.
> > > +		 */
> > > +		unsigned int inval_inject_tries;
> > > +#endif
> > > =C2=A0=C2=A0	} preempt;
> > > =C2=A0=20
> > > =C2=A0=C2=A0	/** @exec_queues: Manages list of exec queues attached
> > > to
> > > this VM, protected by lock. */
