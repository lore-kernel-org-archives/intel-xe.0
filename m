Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E24ACC43458
	for <intel-xe@archiver.kernel.org>; Thu,  9 Jul 2026 21:14:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A32210E0E0;
	Thu,  9 Jul 2026 21:14:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UDNe0CiR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C90DA10E0E0
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Jul 2026 21:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783631680; x=1815167680;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=TgAUPn2EMqUFveuWFTQTLqIVvFUHjF9Sk4VUkbkTxWs=;
 b=UDNe0CiRxgxaZbdx4vUHNA4DpDqSat9Uuxr54924rgZEh25BdQpI9IZN
 SipjldFiW3XkBufMM3OLuol3+9Dl5yGSQuVHNyH0PkSlErWXuMb0p+K8A
 rDfSzLj4+JY/KjI50Mq1MsJdd9WBUnZR3aP4BicQE27i4qOtWl88GnAqi
 zhEMlvLgkeNCFX35M/3HyD3lu5XIeXszb9EA+hYL4+Mu0BQCOsTQM+gG6
 dM84lZGmy/d/Guq7Ji5o7gFSP9MyBPovnXNwO1nfzfRi5eykQ3weYb1WL
 1lWz6jwFoApqbck4C49Ymmko0ulX++1xYZacKkzPvWlES7dgaYTY+p0kv w==;
X-CSE-ConnectionGUID: xoRDFxhHTcKjjit7Sa5wMg==
X-CSE-MsgGUID: Sx1hJ77bRpGjXf825PFW0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84445354"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="84445354"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 14:14:40 -0700
X-CSE-ConnectionGUID: K1oOety/TiSbzR+X3BGMuA==
X-CSE-MsgGUID: CUtBrINLRZWvzeIrf197GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="250282231"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO [10.245.244.93])
 ([10.245.244.93])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 14:14:39 -0700
Message-ID: <7c426a289b766e2ca8f8ec4e3d00370cb0748c0e.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Wait on external BO kernel fences in exec IOCTL
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org, 
 stable@vger.kernel.org
Date: Thu, 09 Jul 2026 23:14:36 +0200
In-Reply-To: <ak/wRrF9DWBdykiP@gsse-cloud1.jf.intel.com>
References: <20260702215805.4011228-1-matthew.brost@intel.com>
 <d5c3258a-04d1-42d6-9d74-cdd9a1172d97@intel.com>
 <42f4a99a3b572f7141ff1a2d7db2854d457300c4.camel@linux.intel.com>
 <ak/wRrF9DWBdykiP@gsse-cloud1.jf.intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
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

On Thu, 2026-07-09 at 12:02 -0700, Matthew Brost wrote:
> On Thu, Jul 09, 2026 at 01:01:07PM +0200, Thomas Hellstr=C3=B6m wrote:
> > On Fri, 2026-07-03 at 09:45 +0100, Matthew Auld wrote:
> > > On 02/07/2026 22:58, Matthew Brost wrote:
> > > > Before arming a user job, xe_exec_ioctl() only added the VM's
> > > > dma-resv KERNEL slot as a dependency. That slot covers rebinds
> > > > and
> > > > the kernel operations of the VM's private BOs, but not external
> > > > BOs
> > > > (bo->vm =3D=3D NULL), which carry their kernel operations
> > > > (evictions,
> > > > moves, ...) in their own dma-resv KERNEL slot.
> > > >=20
> > > > The DMA_RESV_USAGE_KERNEL slot is the cross-driver contract for
> > > > memory management operations that must complete before the BO
> > > > or
> > > > its
> > > > backing store may be used: any accessor is required to wait on
> > > > the
> > > > KERNEL fences before touching the resv. By skipping the
> > > > external
> > > > BOs'
> > > > KERNEL slots, the exec path violated that contract and could
> > > > schedule
> > > > a user job while a kernel operation on an external BO mapped by
> > > > the
> > > > VM
> > > > was still in flight, racing against it and potentially reading
> > > > or
> > > > writing memory that was being moved.
> > > >=20
> > > > Replace the VM-only dependency with an iteration over every
> > > > object
> > > > locked by the exec, adding each object's KERNEL slot as a job
> > > > dependency. This covers the VM resv (rebinds and private BOs)
> > > > as
> > > > well
> > > > as every external BO, mirroring the drm_gpuvm_resv_add_fence()
> > > > call
> > > > that later publishes the job fence to the same set of objects.
> > > > Long-running mode continues to skip this, as before.
> > > >=20
> > > > Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for
> > > > Intel
> > > > GPUs")
> > > > Cc: stable@vger.kernel.org
> > > > Assisted-by: GitHub_Copilot:claude-opus-4.8
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > >=20
> > > Wow, kind of surprised we missed this.
> >=20
> > Hm. Does this actually add any additional kernel fences to the exec
> > dep?
> >=20
> > Isn't the safety mechanism we have that no valid GPU PTEs are
> > allowed
> > to be set up with active kernel fences, and in the cases (rebinds,
> > munmap split) we generate a VM kernel fence.=C2=A0
>=20
> I think that is an arbitrary Xe-enforced rule that just happens to be
> true today. A different driver could install a KERNEL fence on a
> shared
> BO that effectively says, "don't touch this until I'm done," without
> triggering any rebind flows, and we'd break.


That is true, but I guess this use-case is new as well. Are you still
issuing a move_notify to block faulting jobs and cpu-faults, force new
dma-buf maps if exported?

>=20
> What actually exposed this issue is some local WIP where I use the
> `dma_iova_*` functions to manage TT mappings. In that model, when
> memory
> moves, a rebind does not need to be triggered because the IOVA
> remains
> the same. What does change is the IOVA linkage, which is protected by
> a
> KERNEL fence. The exec IOCTL did not detect that fence and
> subsequently
> hit a CAT[33] error.
>=20
> So, in my opinion, this is fixing a clear violation of the semantics
> of
> a KERNEL fence.
>=20
> Per the doc:
>=20
> =C2=A079=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Drivers =
*always* must wait for those fences before
> accessing the
> =C2=A080=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * resource=
 protected by the dma_resv object. The only
> exception for
> =C2=A081=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * that is =
when the resource is known to be locked down
> in place by
> =C2=A082=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * pinning =
it previously.

That is true. If xe doesn't have to rebind it makes sense to ensure
execs wait for kernel fences.

/Thomas


>=20
> Matt
>=20
> >=20
> > So if an exec runs trying to access such a bo with an active clear,
> > for
> > example, it would typically generate a pagefault?
> >=20
> > Thomas
> >=20
> >=20
> >=20
> >=20
> >=20
> > >=20
> > > Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> > >=20
> > > > ---
> > > > =C2=A0 drivers/gpu/drm/xe/xe_exec.c | 22 ++++++++++++++++------
> > > > =C2=A0 1 file changed, 16 insertions(+), 6 deletions(-)
> > > >=20
> > > > diff --git a/drivers/gpu/drm/xe/xe_exec.c
> > > > b/drivers/gpu/drm/xe/xe_exec.c
> > > > index e05dabfcd43c..d5293bc33a67 100644
> > > > --- a/drivers/gpu/drm/xe/xe_exec.c
> > > > +++ b/drivers/gpu/drm/xe/xe_exec.c
> > > > @@ -292,13 +292,23 @@ int xe_exec_ioctl(struct drm_device *dev,
> > > > void *data, struct drm_file *file)
> > > > =C2=A0=C2=A0		goto err_exec;
> > > > =C2=A0=C2=A0	}
> > > > =C2=A0=20
> > > > -	/* Wait behind rebinds */
> > > > +	/*
> > > > +	 * Wait behind rebinds and any kernel operations
> > > > (evictions, defrag
> > > > +	 * moves, ...) on the VM and all external BOs. The
> > > > VM's
> > > > private BOs
> > > > +	 * carry their kernel ops in the VM dma-resv KERNEL
> > > > slot,
> > > > while each
> > > > +	 * external BO carries them in its own dma-resv KERNEL
> > > > slot; both are
> > > > +	 * covered by iterating every object locked by the
> > > > exec,
> > > > mirroring the
> > > > +	 * drm_gpuvm_resv_add_fence() below.
> > > > +	 */
> > > > =C2=A0=C2=A0	if (!xe_vm_in_lr_mode(vm)) {
> > > > -		err =3D xe_sched_job_add_deps(job,
> > > > -					=C2=A0=C2=A0=C2=A0 xe_vm_resv(vm),
> > > > -					=C2=A0=C2=A0=C2=A0
> > > > DMA_RESV_USAGE_KERNEL);
> > > > -		if (err)
> > > > -			goto err_put_job;
> > > > +		struct drm_gem_object *obj;
> > > > +
> > > > +		drm_exec_for_each_locked_object(exec, obj) {
> > > > +			err =3D xe_sched_job_add_deps(job, obj-
> > > > > resv,
> > > > +						=C2=A0=C2=A0=C2=A0
> > > > DMA_RESV_USAGE_KERNEL);
> > > > +			if (err)
> > > > +				goto err_put_job;
> > > > +		}
> > > > =C2=A0=C2=A0	}
> > > > =C2=A0=20
> > > > =C2=A0=C2=A0	for (i =3D 0; i < num_syncs && !err; i++)
