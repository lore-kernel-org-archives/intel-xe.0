Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CAA8E9128C
	for <intel-xe@archiver.kernel.org>; Thu,  5 Feb 2026 08:06:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6107210E7EF;
	Thu,  5 Feb 2026 08:06:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="COvSiK+B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9672B10E7EF
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Feb 2026 08:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770278788; x=1801814788;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=8EEdGcfn32+09UeHiAP6mOhxLORnhBb3TDYskA0y/Ss=;
 b=COvSiK+B9WgJScofyMyVT36G9MIH8sBppAvW2pC7GvWEdQ6O3iZ9ditM
 Q9cIF8XACYejQOIsRVvobic1ZXs0RMCHznyP1H3XS48hncwZl4CCVJNay
 Qdr8nhr3Keva4Tt4GanULObuKZ5aaATS8/YmaqKHBbykb2In34HS7+tcW
 TDxNZDTEfwqROYvsX8wDBUshu+th/0gx+1W+Tl7lUy+/6uK+V9K8hiszH
 lw2nuRyD64WyV8GSmFxh8Mtc6lqdYumjJt+REwiDaD0vk1YFH88IoQQDV
 VX0YFgDOCBph7rwJeh2s8CNFsWIVJMm7GE1HBwBuQqb811k9ir0WiahgU A==;
X-CSE-ConnectionGUID: 2L7k+xDIQLu7c3z6fprdqA==
X-CSE-MsgGUID: +Zx01dLgR0Sz/QxY+KrshA==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71533294"
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="71533294"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 00:06:27 -0800
X-CSE-ConnectionGUID: GqI5XvWCQOeQyIiRtk5Hrg==
X-CSE-MsgGUID: IXf/BN6vSZiQFuiPT0uNzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="209718255"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO [10.245.244.93])
 ([10.245.244.93])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 00:06:26 -0800
Message-ID: <4a012fa66d9eb5858f41159d5b65f790d57e6297.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe/uapi: Introduce a flag to disallow vm overcommit
 in fault mode
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, John Falkowski
 <john.falkowski@intel.com>,  Michal Mrozek <michal.mrozek@intel.com>
Date: Thu, 05 Feb 2026 09:06:24 +0100
In-Reply-To: <aYOWWAg9O1KUhnpO@lstrano-desk.jf.intel.com>
References: <20260204153320.17989-1-thomas.hellstrom@linux.intel.com>
 <aYOWWAg9O1KUhnpO@lstrano-desk.jf.intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
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

On Wed, 2026-02-04 at 10:56 -0800, Matthew Brost wrote:
> On Wed, Feb 04, 2026 at 04:33:20PM +0100, Thomas Hellstr=C3=B6m wrote:
> > Some compute applications may try to allocate device memory to
> > probe
> > how much device memory is actually available, assuming that the
> > application will be the only one running on the particular GPU.
> >=20
> > That strategy fails in fault mode since it allows VM overcommit.
> >=20
> > While this could be resolved in user-space it's further complicated
> > by cgroups potentially restricting the amount of memory available
> > to the application.
> >=20
> > Introduce a vm create flag, DRM_XE_VM_CREATE_NO_VM_OVERCOMMIT, that
> > allows fault mode to mimic the behaviour of !fault mode WRT this.
> > It
> > blocks evicting same vm bos during VM_BIND processing. However,
> > it does *not* block evicting same-vm bos during pagefault
> > processing, preferring eviction rather than VM banning in
> > OOM situations.
> >=20
> > Cc: John Falkowski <john.falkowski@intel.com>
> > Cc: Michal Mrozek <michal.mrozek@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > ---
> > =C2=A0drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | =
11 +++++++++--
> > =C2=A0drivers/gpu/drm/xe/xe_vm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 7 +++++++
> > =C2=A0drivers/gpu/drm/xe/xe_vm_types.h |=C2=A0 1 +
> > =C2=A0include/uapi/drm/xe_drm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 6 ++++++
> > =C2=A04 files changed, 23 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c
> > b/drivers/gpu/drm/xe/xe_vm.c
> > index 8fe54a998385..cf92b6e13a16 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -1938,7 +1938,8 @@ find_ufence_get(struct xe_sync_entry *syncs,
> > u32 num_syncs)
> > =C2=A0
> > =C2=A0#define ALL_DRM_XE_VM_CREATE_FLAGS
> > (DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE | \
> > =C2=A0				=C2=A0=C2=A0=C2=A0 DRM_XE_VM_CREATE_FLAG_LR_MODE
> > | \
> > -				=C2=A0=C2=A0=C2=A0
> > DRM_XE_VM_CREATE_FLAG_FAULT_MODE)
> > +				=C2=A0=C2=A0=C2=A0
> > DRM_XE_VM_CREATE_FLAG_FAULT_MODE | \
> > +				=C2=A0=C2=A0=C2=A0
> > DRM_XE_VM_CREATE_FLAG_NO_VM_OVERCOMMIT)
> > =C2=A0
> > =C2=A0int xe_vm_create_ioctl(struct drm_device *dev, void *data,
> > =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_file *file)
> > @@ -1977,12 +1978,18 @@ int xe_vm_create_ioctl(struct drm_device
> > *dev, void *data,
> > =C2=A0			 args->flags &
> > DRM_XE_VM_CREATE_FLAG_FAULT_MODE))
> > =C2=A0		return -EINVAL;
> > =C2=A0
> > +	if (XE_IOCTL_DBG(xe, !(args->flags &
> > DRM_XE_VM_CREATE_FLAG_FAULT_MODE) &&
> > +			 args->flags &
> > DRM_XE_VM_CREATE_FLAG_NO_VM_OVERCOMMIT))
> > +		return -EINVAL;
> > +
> > =C2=A0	if (args->flags & DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE)
> > =C2=A0		flags |=3D XE_VM_FLAG_SCRATCH_PAGE;
> > =C2=A0	if (args->flags & DRM_XE_VM_CREATE_FLAG_LR_MODE)
> > =C2=A0		flags |=3D XE_VM_FLAG_LR_MODE;
> > =C2=A0	if (args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE)
> > =C2=A0		flags |=3D XE_VM_FLAG_FAULT_MODE;
> > +	if (args->flags & DRM_XE_VM_CREATE_FLAG_NO_VM_OVERCOMMIT)
> > +		flags |=3D XE_VM_FLAG_NO_VM_OVERCOMMIT;
> > =C2=A0
> > =C2=A0	vm =3D xe_vm_create(xe, flags, xef);
> > =C2=A0	if (IS_ERR(vm))
> > @@ -2903,7 +2910,7 @@ static int vma_lock_and_validate(struct
> > drm_exec *exec, struct xe_vma *vma,
> > =C2=A0			err =3D drm_exec_lock_obj(exec, &bo-
> > >ttm.base);
> > =C2=A0		if (!err && validate)
> > =C2=A0			err =3D xe_bo_validate(bo, vm,
> > -					=C2=A0=C2=A0=C2=A0=C2=A0
> > !xe_vm_in_preempt_fence_mode(vm) &&
> > +					=C2=A0=C2=A0=C2=A0=C2=A0
> > xe_vm_allow_vm_eviction(vm) &&
>=20
> One question. This is existing code but can you refresh my memory why
> we
> allow overcommit on dma-fencing VMs? Wouldn't the next exec IOCTL
> immediately fail?

Yes, but mesa can handle that by user-space eviction. In practice IIRC
they unbind everything and re-bind on demand. No care for performance.

For preempt-fence mode we have the dreaded oom-in-the-rebind-worker
which we still haven't fixed with a UMD notification, so we're forced
to avoid that if at all possible.

/Thomas


>=20
> Matt
>=20
> > =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0 res_evict, exec);
> > =C2=A0	}
> > =C2=A0
> > diff --git a/drivers/gpu/drm/xe/xe_vm.h
> > b/drivers/gpu/drm/xe/xe_vm.h
> > index 288115c7844a..f849e369432b 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.h
> > +++ b/drivers/gpu/drm/xe/xe_vm.h
> > @@ -220,6 +220,13 @@ static inline bool
> > xe_vm_in_preempt_fence_mode(struct xe_vm *vm)
> > =C2=A0	return xe_vm_in_lr_mode(vm) && !xe_vm_in_fault_mode(vm);
> > =C2=A0}
> > =C2=A0
> > +static inline bool xe_vm_allow_vm_eviction(struct xe_vm *vm)
> > +{
> > +	return !xe_vm_in_lr_mode(vm) ||
> > +		(xe_vm_in_fault_mode(vm) &&
> > +		 !(vm->flags & XE_VM_FLAG_NO_VM_OVERCOMMIT));
> > +}
> > +
> > =C2=A0int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct
> > xe_exec_queue *q);
> > =C2=A0void xe_vm_remove_compute_exec_queue(struct xe_vm *vm, struct
> > xe_exec_queue *q);
> > =C2=A0
> > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
> > b/drivers/gpu/drm/xe/xe_vm_types.h
> > index 43203e90ee3e..1f6f7e30e751 100644
> > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > @@ -232,6 +232,7 @@ struct xe_vm {
> > =C2=A0#define XE_VM_FLAG_TILE_ID(flags)	FIELD_GET(GENMASK(7, 6),
> > flags)
> > =C2=A0#define XE_VM_FLAG_SET_TILE_ID(tile)	FIELD_PREP(GENMASK(7, 6),
> > (tile)->id)
> > =C2=A0#define XE_VM_FLAG_GSC			BIT(8)
> > +#define XE_VM_FLAG_NO_VM_OVERCOMMIT=C2=A0=C2=A0=C2=A0=C2=A0 BIT(9)
> > =C2=A0	unsigned long flags;
> > =C2=A0
> > =C2=A0	/**
> > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > index 077e66a682e2..e54f8e12acd9 100644
> > --- a/include/uapi/drm/xe_drm.h
> > +++ b/include/uapi/drm/xe_drm.h
> > @@ -975,6 +975,11 @@ struct drm_xe_gem_mmap_offset {
> > =C2=A0 *=C2=A0=C2=A0=C2=A0 demand when accessed, and also allows per-VM=
 overcommit of
> > memory.
> > =C2=A0 *=C2=A0=C2=A0=C2=A0 The xe driver internally uses recoverable pa=
gefaults to
> > implement
> > =C2=A0 *=C2=A0=C2=A0=C2=A0 this.
> > + *=C2=A0 - %DRM_XE_VM_CREATE_FLAG_NO_VM_OVERCOMMIT - Requires also
> > + *=C2=A0=C2=A0=C2=A0 DRM_XE_VM_CREATE_FLAG_FAULT_MODE. This disallows =
per-VM
> > overcommit
> > + *=C2=A0=C2=A0=C2=A0 but only during a &DRM_IOCTL_XE_VM_BIND operation=
 with the
> > + *=C2=A0=C2=A0=C2=A0 %DRM_XE_VM_BIND_FLAG_IMMEDIATE flag set. This may=
 be useful
> > for
> > + *=C2=A0=C2=A0=C2=A0 user-space naively probing the amount of availabl=
e memory.
> > =C2=A0 */
> > =C2=A0struct drm_xe_vm_create {
> > =C2=A0	/** @extensions: Pointer to the first extension struct, if
> > any */
> > @@ -983,6 +988,7 @@ struct drm_xe_vm_create {
> > =C2=A0#define DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE	(1 << 0)
> > =C2=A0#define DRM_XE_VM_CREATE_FLAG_LR_MODE	=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 (1 << 1)
> > =C2=A0#define DRM_XE_VM_CREATE_FLAG_FAULT_MODE	(1 << 2)
> > +#define DRM_XE_VM_CREATE_FLAG_NO_VM_OVERCOMMIT=C2=A0 (1 << 3)
> > =C2=A0	/** @flags: Flags */
> > =C2=A0	__u32 flags;
> > =C2=A0
> > --=20
> > 2.52.0
> >=20
