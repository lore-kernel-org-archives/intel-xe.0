Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAC68C0218D
	for <intel-xe@archiver.kernel.org>; Wed, 29 Jan 2025 08:21:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 900F110E2BE;
	Wed, 29 Jan 2025 08:21:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EGvT8PGt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8B7110E755
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Jan 2025 08:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738138914; x=1769674914;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=S++AKQhG3i8AbAjBBmLtwzkU0MlXy4b0EGdAL8ppyl8=;
 b=EGvT8PGtamXg34LrdUnAG2iZXmpPm8BC1TYX0vXOTeOwlgpzsSC3l6Je
 ix9dJj7rJuf/2VWWJmoadZlDTvii0rAyoJLb4EQ7wPSrkAT7M2QmfKbd2
 6QzUyTo52XEQ5ZttmeSJEZSAExQ+uM1DiTRk1UZNLnPQxLR8GXtR/80dX
 pSLJgTg31jbxLsWKpZdtEw5NYgbmNTsPGGqm/+JjWXOLujB5bMDoUL04n
 5s9R9CJ2hkMFUzyK+LUHd78cP/hyzhQVQez7LIBW2xSj3/RJayZZJ6GO2
 QBZxddYbbux0C2XM7Mu9oX1lFpKjz7XU9ogV7fGV+krXT56zr7cHWF/yE Q==;
X-CSE-ConnectionGUID: t5sUzz+tSZGegxMtePPmmg==
X-CSE-MsgGUID: e9TGj4+XR76ZON/HSa9gpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="49229721"
X-IronPort-AV: E=Sophos;i="6.13,242,1732608000"; d="scan'208";a="49229721"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 00:21:53 -0800
X-CSE-ConnectionGUID: P3FOCFnNQCi6DYCd4XEXdA==
X-CSE-MsgGUID: gCgItrMFTpySEguojcODnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,242,1732608000"; d="scan'208";a="113999358"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO [10.245.246.222])
 ([10.245.246.222])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 00:21:52 -0800
Message-ID: <3f8fa3accc06366710b24f8145d5b23268ea9b5d.camel@linux.intel.com>
Subject: Re: [PATCH 2/3] drm/xe: Clear scratch page before vm_bind
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, Oak Zeng <oak.zeng@intel.com>
Cc: intel-xe@lists.freedesktop.org, joonas.lahtinen@linux.intel.com
Date: Wed, 29 Jan 2025 09:21:49 +0100
In-Reply-To: <Z5m22oRBNKgHPy0B@lstrano-desk.jf.intel.com>
References: <20250128222145.3849874-1-oak.zeng@intel.com>
 <20250128222145.3849874-2-oak.zeng@intel.com>
 <Z5ll8YZidnxz9Pp6@lstrano-desk.jf.intel.com>
 <Z5m22oRBNKgHPy0B@lstrano-desk.jf.intel.com>
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

On Tue, 2025-01-28 at 21:04 -0800, Matthew Brost wrote:
> On Tue, Jan 28, 2025 at 03:19:13PM -0800, Matthew Brost wrote:
> > On Tue, Jan 28, 2025 at 05:21:44PM -0500, Oak Zeng wrote:
> > > When a vm runs under fault mode, if scratch page is enabled, we
> > > need
> > > to clear the scratch page mapping before vm_bind for the vm_bind
> > > address range. Under fault mode, we depend on recoverable page
> > > fault
> > > to establish mapping in page table. If scratch page is not
> > > cleared,
> > > GPU access of address won't cause page fault because it always
> > > hits
> > > the existing scratch page mapping.
> > >=20
> > > When vm_bind with IMMEDIATE flag, there is no need of clearing as
> > > immediate bind can overwrite the scratch page mapping.
> > >=20
> > > So far only is xe2 and xe3 products are allowed to enable scratch
> > > page
> > > under fault mode. On other platform we don't allow scratch page
> > > under
> > > fault mode, so no need of such clearing.
> > >=20
> > > Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> > > ---
> > > =C2=A0drivers/gpu/drm/xe/xe_vm.c | 32 +++++++++++++++++++++++++++++++=
+
> > > =C2=A01 file changed, 32 insertions(+)
> > >=20
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.c
> > > b/drivers/gpu/drm/xe/xe_vm.c
> > > index 690330352d4c..196d347c6ac0 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > @@ -38,6 +38,7 @@
> > > =C2=A0#include "xe_trace_bo.h"
> > > =C2=A0#include "xe_wa.h"
> > > =C2=A0#include "xe_hmm.h"
> > > +#include "i915_drv.h"
> > > =C2=A0
> > > =C2=A0static struct drm_gem_object *xe_vm_obj(struct xe_vm *vm)
> > > =C2=A0{
> > > @@ -2917,6 +2918,34 @@ static int
> > > xe_vm_bind_ioctl_validate_bo(struct xe_device *xe, struct xe_bo
> > > *bo,
> > > =C2=A0	return 0;
> > > =C2=A0}
> > > =C2=A0
> > > +static bool __xe_vm_needs_clear_scratch_pages(struct xe_device
> > > *xe,
> > > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_vm *vm,
> > > u32 bind_flags)
> > > +{
> > > +	if (!xe_vm_in_fault_mode(vm))
> > > +		return false;
> > > +
> > > +	if (!xe_vm_has_scratch(vm))
> > > +		return false;
> > > +
> > > +	if (bind_flags & DRM_XE_VM_BIND_FLAG_IMMEDIATE)
> > > +		return false;
> > > +
> > > +	if (!(IS_LUNARLAKE(xe) || IS_BATTLEMAGE(xe) ||
> > > IS_PANTHERLAKE(xe)))
> > > +		return false;
> > > +
> > > +	return true;
> > > +}
> > > +
> > > +static void __xe_vm_clear_scratch_pages(struct xe_device *xe,
> > > struct xe_vm *vm,
> > > +					u64 start, u64 end)
> > > +{
> > > +	struct xe_tile *tile;
> > > +	u8 id;
> > > +
> > > +	for_each_tile(tile, xe, id)
> > > +		xe_pt_zap_range(tile, vm, start, end);
> > > +}
> > > +
> > > =C2=A0int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct
> > > drm_file *file)
> > > =C2=A0{
> > > =C2=A0	struct xe_device *xe =3D to_xe_device(dev);
> > > @@ -3062,6 +3091,9 @@ int xe_vm_bind_ioctl(struct drm_device
> > > *dev, void *data, struct drm_file *file)
> > > =C2=A0		u32 prefetch_region =3D
> > > bind_ops[i].prefetch_mem_region_instance;
> > > =C2=A0		u16 pat_index =3D bind_ops[i].pat_index;
> > > =C2=A0
> > > +		if (__xe_vm_needs_clear_scratch_pages(xe, vm,
> > > flags))
> > > +			__xe_vm_clear_scratch_pages(xe, vm,
> > > addr, addr + range);
> >=20
> > A few things...
> >=20
> > - I believe this is only needed for bind user operations or
> > internal MAP
> > =C2=A0 GPU VMA operations.
> > - I believe a TLB invalidation will be required.
> > - I don't think calling zap PTEs range works here, given how the
> > scratch
> > =C2=A0 tables are set up (i.e., new PTEs need to be created pointing to
> > an
> > =C2=A0 invalid state).
> > - This series appears to be untested based on the points above.
> >=20
> > Therefore, instead of this series, I believe you will need to fully
> > update the bind pipeline to process MAP GPU VMA operations here.
> >=20
> > So roughly...
> >=20
> > - Maybe include a bit in xe_vma_op_map that specifies "invalidate
> > on
> > =C2=A0 bind," set in vm_bind_ioctl_ops_create, since this will need to
> > be
> > =C2=A0 wired throughout the bind pipeline.
> > - Don't validate backing memory in this case.
> > - Ensure that xe_vma_ops_incr_pt_update_ops is called in this case
> > for
> > =C2=A0 MAP operations, forcing entry into the xe_pt.c backend.
> > - Update xe_pt_stage_bind_walk with a variable that indicates
> > clearing
> > =C2=A0 the PTE. Instead of calling pte_encode_vma in
> > xe_pt_stage_bind_entry,
> > =C2=A0 set this variable for PT bind operations derived from MAP
> > operations
> > =C2=A0 that meet the "invalidate on bind" condition.
>=20
> Ugh, typos / nonsense here. Let me try again.
>=20
> "Update xe_pt_stage_bind_walk with a variable that indicates clearing
> the PTE, set this for MAP ops that meet the 'invalidate on bind'
> condition. When this variable is set, instead of calling
> pte_encode_vma
> in xe_pt_stage_bind_entry, call a function which encodes an invalid
> PTE."
>=20
> Matt

I agree with Matt here. This needs to look just like a regular bind,
with the exception that PTEs are cleared instead of pointing towards
valid pages.

/Thomas

