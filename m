Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1523BC54E58
	for <intel-xe@archiver.kernel.org>; Tue, 12 Mar 2024 07:08:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 999A410E5C9;
	Tue, 12 Mar 2024 07:08:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fsVQyoEf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0275B10E5C9
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Mar 2024 07:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710227290; x=1741763290;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=wY+TAp1aXNWd2//FcfMDA7JJT/JOy3dPzMX7bMPXVVQ=;
 b=fsVQyoEfUhZZ59O4OJ4eOIn2FvE+P64jM4BZ2K+imsIY2cstwewZHI53
 w5/DQaMNLCiWY1mmAFIYY0CDekX22PB6D3TwvpLVIuQYUMNiQ2paExPje
 EiNhUysBP+DnV2Q8WEUmsUIztHZ3Abc0MV8hc6ITay0mjvbgtb67ndz3i
 hHjTFGIKocVIAxuavxp2JLjP9xWFIRH1FP8cbb/f5n890yHLQTzqU9Q6c
 WdRxxQBhLzVsctFINDr06FbR+b2GNCKxFhUra4ps1HrhCExMhIjdATJfJ
 l02e/kHsAe+HjDX829WiY+bhDqNFwFCX9IyIalnAySpb1I6pmxYEdAAr1 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="4776992"
X-IronPort-AV: E=Sophos;i="6.07,118,1708416000"; 
   d="scan'208";a="4776992"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 00:08:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,118,1708416000"; d="scan'208";a="42354639"
Received: from amirafax-mobl4.gar.corp.intel.com (HELO [10.249.254.59])
 ([10.249.254.59])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 00:08:07 -0700
Message-ID: <171fbe6519745c112ee9d11e266e4953b8fb37cf.camel@linux.intel.com>
Subject: Re: [PATCH v3] drm/xe: Invalidate userptr VMA on page pin fault
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, fei.yang@intel.com
Date: Tue, 12 Mar 2024 08:08:04 +0100
In-Reply-To: <Ze9lgpge9lcXpMoM@DUT025-TGLU.fm.intel.com>
References: <20240311192045.852975-1-matthew.brost@intel.com>
 <3c16d6322a6d0127f9448c11a9b5876c688fe41d.camel@linux.intel.com>
 <Ze9lgpge9lcXpMoM@DUT025-TGLU.fm.intel.com>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3 (3.50.3-1.fc39) 
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

On Mon, 2024-03-11 at 20:11 +0000, Matthew Brost wrote:
> On Mon, Mar 11, 2024 at 08:47:50PM +0100, Thomas Hellstr=C3=B6m wrote:
> > On Mon, 2024-03-11 at 12:20 -0700, Matthew Brost wrote:
> > > Rather than return an error to the user or ban the VM when
> > > userptr
> > > VMA
> > > page pin fails with -EFAULT, invalidate VMA mappings. This
> > > supports
> > > the
> > > UMD use case of freeing userptr while still having bindings.
> > >=20
> > > Now that non-faulting VMs can invalidate VMAs, drop the usm
> > > prefix
> > > for
> > > the tile_invalidated member.
> > >=20
> > > v2:
> > > =C2=A0- Fix build error (CI)
> > > v3:
> > > =C2=A0- Don't invalidate VMA if in fault mode, rather kill VM (Thomas=
)
> > > =C2=A0- Update commit message with tile_invalidated name chagne
> > > (Thomas)
> > > =C2=A0- Wait VM bookkeep slots with VM resv lock (Thomas)
> > >=20
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > > =C2=A0drivers/gpu/drm/xe/xe_gt_pagefault.c |=C2=A0 4 ++--
> > > =C2=A0drivers/gpu/drm/xe/xe_trace.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 2 +-
> > > =C2=A0drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 29 ++++++++++++++++++++--
> > > ----
> > > --
> > > =C2=A0drivers/gpu/drm/xe/xe_vm_types.h=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 7 ++-----
> > > =C2=A04 files changed, 26 insertions(+), 16 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > > b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > > index 73c535193a98..241c294270d9 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > > +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > > @@ -69,7 +69,7 @@ static bool access_is_atomic(enum access_type
> > > access_type)
> > > =C2=A0static bool vma_is_valid(struct xe_tile *tile, struct xe_vma
> > > *vma)
> > > =C2=A0{
> > > =C2=A0	return BIT(tile->id) & vma->tile_present &&
> > > -		!(BIT(tile->id) & vma->usm.tile_invalidated);
> > > +		!(BIT(tile->id) & vma->tile_invalidated);
> > > =C2=A0}
> > > =C2=A0
> > > =C2=A0static bool vma_matches(struct xe_vma *vma, u64 page_addr)
> > > @@ -226,7 +226,7 @@ static int handle_pagefault(struct xe_gt *gt,
> > > struct pagefault *pf)
> > > =C2=A0
> > > =C2=A0	if (xe_vma_is_userptr(vma))
> > > =C2=A0		ret =3D
> > > xe_vma_userptr_check_repin(to_userptr_vma(vma));
> > > -	vma->usm.tile_invalidated &=3D ~BIT(tile->id);
> > > +	vma->tile_invalidated &=3D ~BIT(tile->id);
> > > =C2=A0
> > > =C2=A0unlock_dma_resv:
> > > =C2=A0	drm_exec_fini(&exec);
> > > diff --git a/drivers/gpu/drm/xe/xe_trace.h
> > > b/drivers/gpu/drm/xe/xe_trace.h
> > > index 4ddc55527f9a..846f14507d5f 100644
> > > --- a/drivers/gpu/drm/xe/xe_trace.h
> > > +++ b/drivers/gpu/drm/xe/xe_trace.h
> > > @@ -468,7 +468,7 @@ DEFINE_EVENT(xe_vma,
> > > xe_vma_userptr_invalidate,
> > > =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0 TP_ARGS(vma)
> > > =C2=A0);
> > > =C2=A0
> > > -DEFINE_EVENT(xe_vma, xe_vma_usm_invalidate,
> > > +DEFINE_EVENT(xe_vma, xe_vma_invalidate,
> > > =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0 TP_PROTO(struct xe_vma *vma),
> > > =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0 TP_ARGS(vma)
> > > =C2=A0);
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.c
> > > b/drivers/gpu/drm/xe/xe_vm.c
> > > index 643b3701a738..19323b411cb2 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > @@ -724,11 +724,25 @@ int xe_vm_userptr_pin(struct xe_vm *vm)
> > > =C2=A0	list_for_each_entry_safe(uvma, next, &vm-
> > > > userptr.repin_list,
> > > =C2=A0				 userptr.repin_link) {
> > > =C2=A0		err =3D xe_vma_userptr_pin_pages(uvma);
> > > -		if (err < 0)
> > > -			return err;
> > > -
> > > =C2=A0		list_del_init(&uvma->userptr.repin_link);
> > > -		list_move_tail(&uvma->vma.combined_links.rebind,
> > > &vm->rebind_list);
> > > +		if (err =3D=3D -EFAULT && !xe_vm_in_fault_mode(vm))
> > > {
>=20
> Just remembered this now. This function is not called in fault mode
> either. It is called by the exec IOCTL (dma-fence mode) or preempt
> rebind worker.
>=20
> I'll delete this part and add an assert at the top of the function.
>=20
> > > +			/* Wait for pending binds */
> > > +			xe_vm_lock(vm, false);
> > > +			dma_resv_wait_timeout(xe_vm_resv(vm),
> > > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > > DMA_RESV_USAGE_BOOKKEEP,
> > > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 false,
> > > MAX_SCHEDULE_TIMEOUT);
> > > +
> > > +			err =3D xe_vm_invalidate_vma(&uvma->vma);
> >=20
> > This can still race with yet another notifier, I think.
> >=20
>=20
> Wouldn't another invalidate just add it back to the
> &vm->userptr.invalidated list and trigger xe_vm_userptr_pin again?
> That
> seems to be fine to me.

What I'm more afraid of is if we modify state without the relevant
locks held, although that might be restricted to the tile_invalidated
member. But most probably the invalidation can race against itself as
well so we might want to look at handling that separately.

>=20
> The lockdep in xe_vm_invalidate_vma would be unhappy though (I
> think)?

I think lockdep should be happy, actually. It only checks whether the
seqno is invalid and at this point it should be AFAICT, since we
haven't updated it yet.

> Maybe we call a version of xe_vm_invalidate_vma here where the
> lockdep
> checks are skipped?
>=20
> > > +			xe_vm_unlock(vm);
> > > +			if (err)
> > > +				return err;
> > > +		} else {
> > > +			if (err < 0)
> >=20
> > And here we should've kept the userptr on the repin list.
> >=20
>=20
> Yes this is a change in behavior but this change is fine as I think
> we
> try to kill the VM at this point, right? I can change it back if you
> feel strongly.

If it's an exec and hit an -ENOMEM, chances are that the user wants to
retry after freeing up memory. Not sure if we can see -ERESTARTSYS or -
EINTR at this point, but we probably will once we make the
mmu_interval_read_begin() wait interruptible.

/Thomas


> =C2=A0
> Matt
>=20
> >=20
> > /Thomas
> >=20
> >=20
> > > +				return err;
> > > +
> >=20
> >=20
> > > +			list_move_tail(&uvma-
> > > > vma.combined_links.rebind,
> > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &vm->rebind_list);
> > > +		}
> > > =C2=A0	}
> > > =C2=A0
> > > =C2=A0	return 0;
> > > @@ -2024,7 +2038,7 @@ static int xe_vm_prefetch(struct xe_vm *vm,
> > > struct xe_vma *vma,
> > > =C2=A0			return err;
> > > =C2=A0	}
> > > =C2=A0
> > > -	if (vma->tile_mask !=3D (vma->tile_present & ~vma-
> > > > usm.tile_invalidated)) {
> > > +	if (vma->tile_mask !=3D (vma->tile_present & ~vma-
> > > > tile_invalidated)) {
> > > =C2=A0		return xe_vm_bind(vm, vma, q, xe_vma_bo(vma),
> > > syncs,
> > > num_syncs,
> > > =C2=A0				=C2=A0 true, first_op, last_op);
> > > =C2=A0	} else {
> > > @@ -3214,9 +3228,8 @@ int xe_vm_invalidate_vma(struct xe_vma
> > > *vma)
> > > =C2=A0	u8 id;
> > > =C2=A0	int ret;
> > > =C2=A0
> > > -	xe_assert(xe, xe_vm_in_fault_mode(xe_vma_vm(vma)));
> > > =C2=A0	xe_assert(xe, !xe_vma_is_null(vma));
> > > -	trace_xe_vma_usm_invalidate(vma);
> > > +	trace_xe_vma_invalidate(vma);
> > > =C2=A0
> > > =C2=A0	/* Check that we don't race with page-table updates */
> > > =C2=A0	if (IS_ENABLED(CONFIG_PROVE_LOCKING)) {
> > > @@ -3254,7 +3267,7 @@ int xe_vm_invalidate_vma(struct xe_vma
> > > *vma)
> > > =C2=A0		}
> > > =C2=A0	}
> > > =C2=A0
> > > -	vma->usm.tile_invalidated =3D vma->tile_mask;
> > > +	vma->tile_invalidated =3D vma->tile_mask;
> > > =C2=A0
> > > =C2=A0	return 0;
> > > =C2=A0}
> > > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
> > > b/drivers/gpu/drm/xe/xe_vm_types.h
> > > index 79b5cab57711..ae5fb565f6bf 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > > @@ -84,11 +84,8 @@ struct xe_vma {
> > > =C2=A0		struct work_struct destroy_work;
> > > =C2=A0	};
> > > =C2=A0
> > > -	/** @usm: unified shared memory state */
> > > -	struct {
> > > -		/** @tile_invalidated: VMA has been invalidated
> > > */
> > > -		u8 tile_invalidated;
> > > -	} usm;
> > > +	/** @tile_invalidated: VMA has been invalidated */
> > > +	u8 tile_invalidated;
> > > =C2=A0
> > > =C2=A0	/** @tile_mask: Tile mask of where to create binding for
> > > this VMA */
> > > =C2=A0	u8 tile_mask;
> >=20

