Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C211EC0218A
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jan 2025 08:36:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67EC210E057;
	Thu, 30 Jan 2025 08:36:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LOB01Ts/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61D2710E057
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Jan 2025 08:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738226218; x=1769762218;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=vfaMi2k7hrJykmWVqVqJr5oiZdHIxJWgNUZCaK7A6XA=;
 b=LOB01Ts/WCwPeSWXBnM/0NXM0pOTYFsih3G0si6nm4SVNAc34XgrQ28o
 B96Stj/qyMTS8HhSQOJ4rakU4G3PJoco756JV+BGjxm5NFXUtqmC5DN90
 EHXKMtEHuhERcqH8rj7o2vuXptKOYLgJVTtR+6BNTIX6a/5z4Fo04oSfn
 CcI5zG5iSYoLoPgX6QE8gT7o652s4m+xP1sI5eAio+rWBuiJiaZh7w5ic
 1fQcg/oJ9LHS5MueBGTAOTotS1s5+Ti5zrUb4xFN4O5fHGySLw/sk4X9y
 dF1a7UNsM3QqR6lTqWus/xzekjBnPzboZMOENzvi2K64YjTRjpMXs2nFX g==;
X-CSE-ConnectionGUID: n5eEQBmSSSmjQi1dBU1LSw==
X-CSE-MsgGUID: msYZNLPaQsuZ37rqxBZFwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="56186262"
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; d="scan'208";a="56186262"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 00:36:58 -0800
X-CSE-ConnectionGUID: OiKuvZr/Ria8Q0hzXA2nHA==
X-CSE-MsgGUID: M3jgG8wyS+C+gRJQSVipMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; d="scan'208";a="109241819"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO [10.245.246.79])
 ([10.245.246.79])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 00:36:58 -0800
Message-ID: <fbf07f6f921f018ea842dfae60bbcc6f7a4bd2ad.camel@linux.intel.com>
Subject: Re: [PATCH 2/3] drm/xe: Clear scratch page before vm_bind
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, "Zeng, Oak" <oak.zeng@intel.com>
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, 
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>
Date: Thu, 30 Jan 2025 09:36:54 +0100
In-Reply-To: <Z5rXo41N+OmJaN9Q@lstrano-desk.jf.intel.com>
References: <20250128222145.3849874-1-oak.zeng@intel.com>
 <20250128222145.3849874-2-oak.zeng@intel.com>
 <Z5ll8YZidnxz9Pp6@lstrano-desk.jf.intel.com>
 <MN2PR11MB47285CC53C87B37B279D7C4092EE2@MN2PR11MB4728.namprd11.prod.outlook.com>
 <Z5rXo41N+OmJaN9Q@lstrano-desk.jf.intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
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

On Wed, 2025-01-29 at 17:36 -0800, Matthew Brost wrote:
> On Wed, Jan 29, 2025 at 02:01:38PM -0700, Zeng, Oak wrote:
> >=20
> >=20
> > > -----Original Message-----
> > > From: Brost, Matthew <matthew.brost@intel.com>
> > > Sent: January 28, 2025 6:19 PM
> > > To: Zeng, Oak <oak.zeng@intel.com>
> > > Cc: intel-xe@lists.freedesktop.org;
> > > joonas.lahtinen@linux.intel.com;
> > > Thomas.Hellstrom@linux.intel.com
> > > Subject: Re: [PATCH 2/3] drm/xe: Clear scratch page before
> > > vm_bind
> > >=20
> > > On Tue, Jan 28, 2025 at 05:21:44PM -0500, Oak Zeng wrote:
> > > > When a vm runs under fault mode, if scratch page is enabled, we
> > > need
> > > > to clear the scratch page mapping before vm_bind for the
> > > > vm_bind
> > > > address range. Under fault mode, we depend on recoverable page
> > > fault
> > > > to establish mapping in page table. If scratch page is not
> > > > cleared,
> > > > GPU access of address won't cause page fault because it always
> > > > hits
> > > > the existing scratch page mapping.
> > > >=20
> > > > When vm_bind with IMMEDIATE flag, there is no need of clearing
> > > > as
> > > > immediate bind can overwrite the scratch page mapping.
> > > >=20
> > > > So far only is xe2 and xe3 products are allowed to enable
> > > > scratch
> > > page
> > > > under fault mode. On other platform we don't allow scratch page
> > > under
> > > > fault mode, so no need of such clearing.
> > > >=20
> > > > Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> > > > ---
> > > > =C2=A0drivers/gpu/drm/xe/xe_vm.c | 32
> > > ++++++++++++++++++++++++++++++++
> > > > =C2=A01 file changed, 32 insertions(+)
> > > >=20
> > > > diff --git a/drivers/gpu/drm/xe/xe_vm.c
> > > b/drivers/gpu/drm/xe/xe_vm.c
> > > > index 690330352d4c..196d347c6ac0 100644
> > > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > > @@ -38,6 +38,7 @@
> > > > =C2=A0#include "xe_trace_bo.h"
> > > > =C2=A0#include "xe_wa.h"
> > > > =C2=A0#include "xe_hmm.h"
> > > > +#include "i915_drv.h"
> > > >=20
> > > > =C2=A0static struct drm_gem_object *xe_vm_obj(struct xe_vm *vm)
> > > > =C2=A0{
> > > > @@ -2917,6 +2918,34 @@ static int
> > > xe_vm_bind_ioctl_validate_bo(struct xe_device *xe, struct xe_bo
> > > *bo,
> > > > =C2=A0	return 0;
> > > > =C2=A0}
> > > >=20
> > > > +static bool __xe_vm_needs_clear_scratch_pages(struct xe_device
> > > *xe,
> > > > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_vm
> > > > *vm, u32
> > > bind_flags)
> > > > +{
> > > > +	if (!xe_vm_in_fault_mode(vm))
> > > > +		return false;
> > > > +
> > > > +	if (!xe_vm_has_scratch(vm))
> > > > +		return false;
> > > > +
> > > > +	if (bind_flags & DRM_XE_VM_BIND_FLAG_IMMEDIATE)
> > > > +		return false;
> > > > +
> > > > +	if (!(IS_LUNARLAKE(xe) || IS_BATTLEMAGE(xe) ||
> > > IS_PANTHERLAKE(xe)))
> > > > +		return false;
> > > > +
> > > > +	return true;
> > > > +}
> > > > +
> > > > +static void __xe_vm_clear_scratch_pages(struct xe_device *xe,
> > > struct xe_vm *vm,
> > > > +					u64 start, u64 end)
> > > > +{
> > > > +	struct xe_tile *tile;
> > > > +	u8 id;
> > > > +
> > > > +	for_each_tile(tile, xe, id)
> > > > +		xe_pt_zap_range(tile, vm, start, end);
> > > > +}
> > > > +
> > > > =C2=A0int xe_vm_bind_ioctl(struct drm_device *dev, void *data,
> > > > struct
> > > drm_file *file)
> > > > =C2=A0{
> > > > =C2=A0	struct xe_device *xe =3D to_xe_device(dev);
> > > > @@ -3062,6 +3091,9 @@ int xe_vm_bind_ioctl(struct drm_device
> > > *dev, void *data, struct drm_file *file)
> > > > =C2=A0		u32 prefetch_region =3D
> > > bind_ops[i].prefetch_mem_region_instance;
> > > > =C2=A0		u16 pat_index =3D bind_ops[i].pat_index;
> > > >=20
> > > > +		if (__xe_vm_needs_clear_scratch_pages(xe, vm,
> > > flags))
> > > > +			__xe_vm_clear_scratch_pages(xe, vm,
> > > > addr,
> > > addr + range);
> > >=20
> > > A few things...
> > >=20
> > > - I believe this is only needed for bind user operations or
> > > internal MAP
> > > =C2=A0 GPU VMA operations.
> >=20
> > Did you mean this is only needed for user bind, but not for
> > internal map?
> >=20
>=20
> Needed for user bind and also for internal MAP. With updating the
> bind
> pipeline you will only care MAP ops.
> =C2=A0
> > > - I believe a TLB invalidation will be required.
> >=20
> > My understanding is, NULL pte won't be cached in TLB, so TLB
> > invalidation is not needed.=20
> >=20
>=20
> I would think NULL ptes are cached but not certain either way.

Note that a NULL / scratch mapping for larger pages may point to a
physical page.

/Thomas


>=20
> > > - I don't think calling zap PTEs range works here, given how the
> > > scratch
> > > =C2=A0 tables are set up (i.e., new PTEs need to be created pointing
> > > to an
> > > =C2=A0 invalid state).
> >=20
> > You are right.=20
> >=20
> > I didn't realize that using xe_pt_walk_shared to walk and zap PTEs
> > has a limitation:
> > For the virtual address range we want to zap, all the page tables
> > has to be already
> > exist. This interface doesn't create new page tables. Even though
> > xe_pt_walk_shared
> > takes a range parameter (addr, end), range parameter can't be
> > arbitrary.
> >=20
> > Today only [xe_vma_start, xe_vma_end) is used to specify the
> > xe_pt_walk_shared
> > Walking range. Arbitrary range won't work as you pointed out. To me
> > this is a small
> > Interface design issue. If you agree, I can re-parameterize
> > xe_pt_walk_shared to take
> > VMA vs addr/end. This way people won't make the same mistake in the
> > future.
> >=20
>=20
> Ah, no. SVM will use ranges so I think (addr, end) are the right
> parameters for internal PT functions.
>=20
> > Anyway, I will follow the direction you give below to rework this
> > series.
> >=20
>=20
> +1
>=20
> Matt
>=20
> > Oak
> >=20
> > > - This series appears to be untested based on the points above.
> > >=20
> > > Therefore, instead of this series, I believe you will need to
> > > fully
> > > update the bind pipeline to process MAP GPU VMA operations here.
> > >=20
> > > So roughly...
> > >=20
> > > - Maybe include a bit in xe_vma_op_map that specifies "invalidate
> > > on
> > > =C2=A0 bind," set in vm_bind_ioctl_ops_create, since this will need t=
o
> > > be
> > > =C2=A0 wired throughout the bind pipeline.
> > > - Don't validate backing memory in this case.
> > > - Ensure that xe_vma_ops_incr_pt_update_ops is called in this
> > > case
> > > for
> > > =C2=A0 MAP operations, forcing entry into the xe_pt.c backend.
> > > - Update xe_pt_stage_bind_walk with a variable that indicates
> > > clearing
> > > =C2=A0 the PTE. Instead of calling pte_encode_vma in
> > > xe_pt_stage_bind_entry,
> > > =C2=A0 set this variable for PT bind operations derived from MAP
> > > operations
> > > =C2=A0 that meet the "invalidate on bind" condition.
> > > - Ensure needs_invalidation is set in struct
> > > xe_vm_pgtable_update_ops if
> > > =C2=A0 a MAP operation is included that meets the "invalidate on bind=
"
> > > =C2=A0 condition.
> > > - Set the VMA tile_invalidated in addition to tile_present for
> > > MAP
> > > =C2=A0 operations that meet the "invalidate on bind" condition.
> > >=20
> > > I might be missing some implementation details mentioned above,
> > > but this
> > > should provide you with some direction.
> > >=20
> > > Lastly, and perhaps most importantly, please test this using an
> > > IGT
> > > and
> > > include the results in the next post.
> > >=20
> > > Matt
> > >=20
> > > > +
> > > > =C2=A0		ops[i] =3D vm_bind_ioctl_ops_create(vm, bos[i],
> > > obj_offset,
> > > > =C2=A0						=C2=A0 addr, range,
> > > > op, flags,
> > > > =C2=A0						=C2=A0
> > > > prefetch_region,
> > > pat_index);
> > > > --
> > > > 2.26.3
> > > >=20

