Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 423A3C54E58
	for <intel-xe@archiver.kernel.org>; Mon, 11 Mar 2024 19:23:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07AA5112C20;
	Mon, 11 Mar 2024 19:23:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C9tt79Mf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 591E4112C20
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Mar 2024 19:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710185011; x=1741721011;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=MEviFB5mxxWX8AWFpNmhqsPWspvqC4+meb2Qkc1prmk=;
 b=C9tt79MfyjFfP9JGZjGgnucPzTQoJx8btPiym/hGAJW6jEa66A3ogT4l
 n86+2VJOAAVepgGq0Ra8HPLNqV6SlD6nNBLHrsQjwF5HvR5UKSHYAVNhQ
 DCbPibOjtl+AwzM7cMFrNjmf/gjySWwEwtXlpOCM1z7K2G1ufL2Xnri8P
 cko8QmWmB42j7eeDZLsZI9ebgRyQxXAHP2pz7HuguKVH56IrgWpvzKF01
 BICdgOupqXvgMhYHuIPksOQEID9Hmv5HKxo8CWL1jksy3aTAhfWuI3296
 2N2npQSIWkUG+wg6yr5KjD/Eh3uLa1EAkarEF3IF1TbQUSI3i5Axvz/iy Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="4744240"
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; 
   d="scan'208";a="4744240"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 12:23:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; d="scan'208";a="42182470"
Received: from binis42x-mobl.gar.corp.intel.com (HELO [10.249.254.59])
 ([10.249.254.59])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 12:23:30 -0700
Message-ID: <2613ec1be671403e6746ad93e2f2966d3f8898a9.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Invalidate userptr VMA on page pin fault
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, fei.yang@intel.com, rodrigo.vivi@intel.com
Date: Mon, 11 Mar 2024 20:23:27 +0100
In-Reply-To: <Ze9SNeu2Ifl+/vOI@DUT025-TGLU.fm.intel.com>
References: <20240308213747.597649-1-matthew.brost@intel.com>
 <8203b1a23e65a876d02a5929a8e489eb9ad387de.camel@linux.intel.com>
 <de53c4465285bb4cc25ad4ebd23a950ce1dd12eb.camel@linux.intel.com>
 <Ze9SNeu2Ifl+/vOI@DUT025-TGLU.fm.intel.com>
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

On Mon, 2024-03-11 at 18:49 +0000, Matthew Brost wrote:
> On Mon, Mar 11, 2024 at 02:29:26PM +0100, Thomas Hellstr=C3=B6m wrote:
> > On Mon, 2024-03-11 at 11:55 +0100, Thomas Hellstr=C3=B6m wrote:
> > > Hi, Matthew
> > >=20
> > > On Fri, 2024-03-08 at 13:37 -0800, Matthew Brost wrote:
> > > > Rather than return an error to the user or ban the VM when
> > > > userptr
> > > > VMA
> > > > page pin fails with -EFAULT, invalidate VMA mappings. This
> > > > supports
> > > > the
> > > > UMD use case of freeing userptr while still having bindings.
> > > >=20
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > ---
> > > > =C2=A0drivers/gpu/drm/xe/xe_gt_pagefault.c |=C2=A0 4 ++--
> > > > =C2=A0drivers/gpu/drm/xe/xe_trace.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 2 +-
> > > > =C2=A0drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 20 +++++++++++++-------
> > > > =C2=A0drivers/gpu/drm/xe/xe_vm_types.h=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 7 ++-----
> > > > =C2=A04 files changed, 18 insertions(+), 15 deletions(-)
> > > >=20
> > > > diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > > > b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > > > index 73c535193a98..241c294270d9 100644
> > > > --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > > > +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > > > @@ -69,7 +69,7 @@ static bool access_is_atomic(enum access_type
> > > > access_type)
> > > > =C2=A0static bool vma_is_valid(struct xe_tile *tile, struct xe_vma
> > > > *vma)
> > > > =C2=A0{
> > > > =C2=A0	return BIT(tile->id) & vma->tile_present &&
> > > > -		!(BIT(tile->id) & vma->usm.tile_invalidated);
> > > > +		!(BIT(tile->id) & vma->tile_invalidated);
> > > > =C2=A0}
> > > > =C2=A0
> > > > =C2=A0static bool vma_matches(struct xe_vma *vma, u64 page_addr)
> > > > @@ -226,7 +226,7 @@ static int handle_pagefault(struct xe_gt
> > > > *gt,
> > > > struct pagefault *pf)
> > > > =C2=A0
> > > > =C2=A0	if (xe_vma_is_userptr(vma))
> > > > =C2=A0		ret =3D
> > > > xe_vma_userptr_check_repin(to_userptr_vma(vma));
> > > > -	vma->usm.tile_invalidated &=3D ~BIT(tile->id);
> > > > +	vma->tile_invalidated &=3D ~BIT(tile->id);
> > > > =C2=A0
> > > > =C2=A0unlock_dma_resv:
> > > > =C2=A0	drm_exec_fini(&exec);
> > > > diff --git a/drivers/gpu/drm/xe/xe_trace.h
> > > > b/drivers/gpu/drm/xe/xe_trace.h
> > > > index 4ddc55527f9a..846f14507d5f 100644
> > > > --- a/drivers/gpu/drm/xe/xe_trace.h
> > > > +++ b/drivers/gpu/drm/xe/xe_trace.h
> > > > @@ -468,7 +468,7 @@ DEFINE_EVENT(xe_vma,
> > > > xe_vma_userptr_invalidate,
> > > > =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0 TP_ARGS(vma)
> > > > =C2=A0);
> > > > =C2=A0
> > > > -DEFINE_EVENT(xe_vma, xe_vma_usm_invalidate,
> > > > +DEFINE_EVENT(xe_vma, xe_vma_invalidate,
> > > > =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0 TP_PROTO(struct xe_vma *vma),
> > > > =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0 TP_ARGS(vma)
> > > > =C2=A0);
> > > > diff --git a/drivers/gpu/drm/xe/xe_vm.c
> > > > b/drivers/gpu/drm/xe/xe_vm.c
> > > > index 643b3701a738..9a19044f7ef6 100644
> > > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > > @@ -724,11 +724,18 @@ int xe_vm_userptr_pin(struct xe_vm *vm)
> > > > =C2=A0	list_for_each_entry_safe(uvma, next, &vm-
> > > > > userptr.repin_list,
> > > > =C2=A0				 userptr.repin_link) {
> > > > =C2=A0		err =3D xe_vma_userptr_pin_pages(uvma);
> > > > -		if (err < 0)
> > > > -			return err;
> > > > -
> > > > =C2=A0		list_del_init(&uvma->userptr.repin_link);
> > > > -		list_move_tail(&uvma-
> > > > >vma.combined_links.rebind,
> > > > &vm->rebind_list);
> > > > +		if (err =3D=3D -EFAULT) {
> > > > +			err =3D xe_vm_invalidate_vma(&uvma-
> > > > >vma);
> > >=20
> > > I think we need to check for FAULT_MODE here. If we hit this path
> > > in
> > > FAULT_MODE, we already have an invalid gpu access and can kill
> > > the
> > > VM.
> > >=20
>=20
> Agree, will fix.
>=20
> > > In preempt-fence mode, we should probably be calling
> > > xe_vm_unbind_vma(), because xe_vm_invalidate_vma() isn't safe to
> > > call
> > > outside of the mmu_notifier, and if there are still BOOKKEEP
> > > fences
> > > pending- see the asserts in that function.
> >=20
> >=20
> > Actually, xe_vm_invalidate_vma() would probably work if we grabbed
> > the
> > vm resv and waited for bookkeep fences first, and updated the
> > asserts.=C2=A0
> >=20
>=20
> Yes, I think that will work but is that even needed? We have vm->lock
> here in write mode which should prevent any further updates to the
> page
> tables. What are we trying prevent a race a against? An in-flight
> bind
> job which touches the same page tables? I guess that is possible.

Yeah, if we adhere to the locking rules for page tables we don't need
to care about keeping track of current and future potential racing code
paths.

> =C2=A0
> > But then xe_vm_unbind_vma() might still be better since we also
> > clean
> > up the page-tables.
> >=20
>=20
> I think we do not want to mess with the VMA state as that should only
> be
> changed by user IOCTLs. An invalidation seems to be the right call
> here.

I think the tile_present is the only vma_state touched there. What I'm
after is really also freeing the now unused page-directories, but
that's not a necessity.=20

/Thomas



>=20
> > /Thomas
> >=20
> >=20
> > >=20
> > > > +			if (err)
> > > > +				return err;
> > > > +		} else {
> > > > +			if (err < 0)
> > > > +				return err;
> > > > +
> > > > +			list_move_tail(&uvma-
> > > > > vma.combined_links.rebind,
> > > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &vm->rebind_list);
> > > > +		}
> > > > =C2=A0	}
> > > > =C2=A0
> > > > =C2=A0	return 0;
> > > > @@ -3214,9 +3221,8 @@ int xe_vm_invalidate_vma(struct xe_vma
> > > > *vma)
> > > > =C2=A0	u8 id;
> > > > =C2=A0	int ret;
> > > > =C2=A0
> > > > -	xe_assert(xe, xe_vm_in_fault_mode(xe_vma_vm(vma)));
> > > > =C2=A0	xe_assert(xe, !xe_vma_is_null(vma));
> > > > -	trace_xe_vma_usm_invalidate(vma);
> > > > +	trace_xe_vma_invalidate(vma);
> > > > =C2=A0
> > > > =C2=A0	/* Check that we don't race with page-table updates */
> > > > =C2=A0	if (IS_ENABLED(CONFIG_PROVE_LOCKING)) {
> > > > @@ -3254,7 +3260,7 @@ int xe_vm_invalidate_vma(struct xe_vma
> > > > *vma)
> > > > =C2=A0		}
> > > > =C2=A0	}
> > > > =C2=A0
> > > > -	vma->usm.tile_invalidated =3D vma->tile_mask;
> > > > +	vma->tile_invalidated =3D vma->tile_mask;
> > > > =C2=A0
> > > > =C2=A0	return 0;
> > > > =C2=A0}
> > > > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
> > > > b/drivers/gpu/drm/xe/xe_vm_types.h
> > > > index 79b5cab57711..ae5fb565f6bf 100644
> > > > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > > > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > > > @@ -84,11 +84,8 @@ struct xe_vma {
> > > > =C2=A0		struct work_struct destroy_work;
> > > > =C2=A0	};
> > > > =C2=A0
> > > > -	/** @usm: unified shared memory state */
> > > > -	struct {
> > > > -		/** @tile_invalidated: VMA has been
> > > > invalidated */
> > > > -		u8 tile_invalidated;
> > > > -	} usm;
> > > > +	/** @tile_invalidated: VMA has been invalidated */
> > > > +	u8 tile_invalidated;
> > >=20
> > > Add a comment in the commit message about removing the usm
> > > struct?
>=20
> Will add.
>=20
> Matt
>=20
> > > /Thomas
> > >=20
> > >=20
> > > > =C2=A0
> > > > =C2=A0	/** @tile_mask: Tile mask of where to create binding
> > > > for
> > > > this VMA */
> > > > =C2=A0	u8 tile_mask;
> > >=20
> >=20

