Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F1A3CA9EC5
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 14:31:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3152610E59B;
	Mon, 12 Oct 2026 14:31:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E76510E59B
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 14:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791815493; x=1823351493;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=fTVGDgj9j6sKgpgTcY6KyN3DSjc3YSdtPsToVSanqbk=;
 b=Rlqa4kWa1HCVm+ihLGK4CZwxYRuc19dl8IuZL5gV8WIY1c964xOTduFA
 oWSrEpvZkLK8n9V+T8PHKe2diQwx6UiLBjRobwfBDE7OhK6HXM56YFw5g
 o1h6B8CI/91wNOrpko90WxcN4UT80s9YW/1Tszv6+3fTmCj+uNj9C6i7c
 kMaphlFKL/CsXqU4d9gt94F4W/n5M1T7V8+qWMvAO3FUJUNX4LDrn+Lwa
 hKnEEpsJTllsHq253OYS3rzhidazxLLuE2JR+au0Lvh/YC8QOHUIBRsb8
 ybdscszmqlAxzS0OY2YuTATufqAbu1XQ1kMvzzNVPac1Wj2kkud2RkaF6 A==;
X-CSE-ConnectionGUID: TcAvVyWfQ/mjlk5vsVXYYg==
X-CSE-MsgGUID: GIMvV3IVTlCCFBAg3c2dEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="513870"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="513870"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 07:31:33 -0700
X-CSE-ConnectionGUID: doQFXOpjSwOcS/gKbYS3qA==
X-CSE-MsgGUID: Tnyg7V5oQGK/61jj4+R/pA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="2695772"
Received: from slindbla-desk.ger.corp.intel.com (HELO [10.245.244.196])
 ([10.245.244.196])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 07:31:32 -0700
Message-ID: <de000967974d7f6180644fa27e2f6607994963a6.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Bump LRU for external objects on exec and rebind
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, Matthew Brost
 <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 12 Oct 2026 16:31:29 +0200
In-Reply-To: <dd0ad60b-c6a2-45c1-b85d-0368415526da@intel.com>
References: <20261012132607.21387-1-thomas.hellstrom@linux.intel.com>
 <aszkZLFG57cmurw3@gsse-cloud1.jf.intel.com>
 <dd0ad60b-c6a2-45c1-b85d-0368415526da@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
MIME-Version: 1.0
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, 2026-10-12 at 15:21 +0100, Matthew Auld wrote:
> On 12/10/2026 14:45, Matthew Brost wrote:
> > On Mon, Oct 12, 2026 at 03:26:07PM +0200, Thomas Hellstr=C3=B6m wrote:
> >=20
> > Yikes, not sure how we missed this one and this is certainly not
> > the
> > intent and will be large issue for compositor buffers.
> >=20
> > I'd honestly lean towards this being a fixes.
>=20
> +1

Thanks for reviewing, Matt & Matt. Yeah I agree totally. Just forgot
about it before submission. I wonder whether I broke this during the
GPUVM helper rewrite. Anyway, I'll dig up the history.

Thanks,
Thomas


>=20
> >=20
> > > The VM's private BOs get their LRU position refreshed in bulk via
> > > ttm_lru_bulk_move_tail() on vm->lru_bulk_move, both after a
> > > successful
> > > non-LR exec and after the LR preempt-fence rebind worker runs.
> > > External
> > > objects (BOs potentially shared across VMs) are never added to
> > > that
> > > per-VM bulk move list, so their LRU position is never refreshed
> > > by
> > > either path. This makes external objects in active use look more
> > > evictable than they are.
> > >=20
> > > Add xe_vm_bump_lru(), which, under a single lru_lock critical
> > > section,
> > > performs the bulk move of the VM's private BOs and bumps each
> > > external
> > > object locked by the drm_exec transaction. Use it from both the
> > > non-LR
> > > exec path and the LR rebind worker, replacing the open-coded bulk
> > > move.
> > >=20
> > > Cc: Matthew Auld <matthew.auld@intel.com>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> >=20
> > Consider the above:
> > Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>=20
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>=20
> >=20
> > > Assisted-by: LLM
> > > Signed-off-by: Thomas Hellstr=C3=B6m
> > > <thomas.hellstrom@linux.intel.com>
> > > ---
> > > =C2=A0 drivers/gpu/drm/xe/xe_exec.c |=C2=A0 7 ++-----
> > > =C2=A0 drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0 | 31 ++++++++++++++++++=
++++++++++-
> > > --
> > > =C2=A0 drivers/gpu/drm/xe/xe_vm.h=C2=A0=C2=A0 |=C2=A0 2 ++
> > > =C2=A0 3 files changed, 32 insertions(+), 8 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/xe/xe_exec.c
> > > b/drivers/gpu/drm/xe/xe_exec.c
> > > index d5293bc33a67..7dc9a0a1f569 100644
> > > --- a/drivers/gpu/drm/xe/xe_exec.c
> > > +++ b/drivers/gpu/drm/xe/xe_exec.c
> > > @@ -346,11 +346,8 @@ int xe_exec_ioctl(struct drm_device *dev,
> > > void *data, struct drm_file *file)
> > > =C2=A0=C2=A0	xe_sched_job_push(job);
> > > =C2=A0=C2=A0	xe_vm_reactivate_rebind(vm);
> > > =C2=A0=20
> > > -	if (!err && !xe_vm_in_lr_mode(vm)) {
> > > -		spin_lock(&xe->ttm.lru_lock);
> > > -		ttm_lru_bulk_move_tail(&vm->lru_bulk_move);
> > > -		spin_unlock(&xe->ttm.lru_lock);
> > > -	}
> > > +	if (!err && !xe_vm_in_lr_mode(vm))
> > > +		xe_vm_bump_lru(vm, exec);
> > > =C2=A0=20
> > > =C2=A0=C2=A0	if (mode =3D=3D EXEC_MODE_LR)
> > > =C2=A0=C2=A0		xe_hw_engine_group_resume_faulting_lr_jobs(group
> > > );
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.c
> > > b/drivers/gpu/drm/xe/xe_vm.c
> > > index ef369df4aa26..095f762bbb6f 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > @@ -413,6 +413,33 @@ int xe_vm_validate_rebind(struct xe_vm *vm,
> > > struct drm_exec *exec,
> > > =C2=A0=C2=A0	return 0;
> > > =C2=A0 }
> > > =C2=A0=20
> > > +/**
> > > + * xe_vm_bump_lru() - Bump the LRU position of BOs used by a
> > > submission
> > > + * @vm: The vm for which we are bumping LRUs.
> > > + * @exec: The struct drm_exec with the locked GEM objects.
> > > + *
> > > + * Move the VM's private BOs, and all external objects locked by
> > > @exec,
> > > + * to the LRU tail. Private BOs are moved in bulk using @vm's
> > > + * &xe_vm.lru_bulk_move. External objects, which may be shared
> > > with other
> > > + * VMs, are not part of that bulk move and are bumped
> > > individually.
> > > + */
> > > +void xe_vm_bump_lru(struct xe_vm *vm, struct drm_exec *exec)
> > > +{
> > > +	spinlock_t *lru_lock =3D &vm->xe->ttm.lru_lock;
> > > +	struct drm_gem_object *obj;
> > > +
> > > +	spin_lock(lru_lock);
> > > +	ttm_lru_bulk_move_tail(&vm->lru_bulk_move);
> > > +	drm_exec_for_each_locked_object(exec, obj) {
> > > +		if (!drm_gpuvm_is_extobj(&vm->gpuvm, obj))
> > > +			continue;
> > > +
> > > +		ttm_bo_move_to_lru_tail(&gem_to_xe_bo(obj)-
> > > >ttm);
> > > +		cond_resched_lock(lru_lock);
> > > +	}
> > > +	spin_unlock(lru_lock);
> > > +}
> > > +
> > > =C2=A0 static int xe_preempt_work_begin(struct drm_exec *exec, struct
> > > xe_vm *vm,
> > > =C2=A0=C2=A0				 bool *done)
> > > =C2=A0 {
> > > @@ -563,9 +590,7 @@ static void preempt_rebind_work_func(struct
> > > work_struct *w)
> > > =C2=A0=20
> > > =C2=A0 #undef retry_required
> > > =C2=A0=20
> > > -	spin_lock(&vm->xe->ttm.lru_lock);
> > > -	ttm_lru_bulk_move_tail(&vm->lru_bulk_move);
> > > -	spin_unlock(&vm->xe->ttm.lru_lock);
> > > +	xe_vm_bump_lru(vm, &exec);
> > > =C2=A0=20
> > > =C2=A0=C2=A0	/* Point of no return. */
> > > =C2=A0=C2=A0	arm_preempt_fences(vm, &preempt_fences);
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.h
> > > b/drivers/gpu/drm/xe/xe_vm.h
> > > index 89c4f95984a2..06138c3c4315 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.h
> > > +++ b/drivers/gpu/drm/xe/xe_vm.h
> > > @@ -284,6 +284,8 @@ int xe_vm_lock_vma(struct drm_exec *exec,
> > > struct xe_vma *vma);
> > > =C2=A0 int xe_vm_validate_rebind(struct xe_vm *vm, struct drm_exec
> > > *exec,
> > > =C2=A0=C2=A0			=C2=A0 unsigned int num_fences);
> > > =C2=A0=20
> > > +void xe_vm_bump_lru(struct xe_vm *vm, struct drm_exec *exec);
> > > +
> > > =C2=A0 struct dma_fence *xe_vm_bind_kernel_bo(struct xe_vm *vm, struc=
t
> > > xe_bo *bo,
> > > =C2=A0=C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_exec_q=
ueue *q,
> > > u64 addr,
> > > =C2=A0=C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum xe_cache_le=
vel
> > > cache_lvl);
> > > --=20
> > > 2.56.0
> > >=20
