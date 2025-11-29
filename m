Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A9DCCFD2F6
	for <intel-xe@archiver.kernel.org>; Sat, 29 Nov 2025 12:51:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D505A10E1DC;
	Sat, 29 Nov 2025 12:51:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NiimCAAw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E67CA10E1DC
 for <intel-xe@lists.freedesktop.org>; Sat, 29 Nov 2025 12:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764420702; x=1795956702;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=qqT7U75rvdT33sc7PCPib6mU6+yir64wyQY5i5/YgI8=;
 b=NiimCAAwyuYEUYFHpnuTAyotZloh4WjBuhqIbLedVP4t6Vzjo6w6gXzX
 x1z9LlfBCpCicKcJ0JeElrjC/mBNvMgoLwkUwJF3jOW851+3bOtjeDJR6
 KYXGx1aDF1ejcX+XmER3thkoi7ljf6aIdYzyVAF1lbZC16yKndr9MIoW2
 DlWUPYaoKfP7UnOjT8LfgC+V1TbOKhrmIX2VDJ0n4EwVgkhexhP4z6rs9
 Zm8rh9629a2380KlAWIf5kivIVGmMA7LZOSLu5QyfCrgSx9uffHP0M7dr
 JM0enMYFrQd48ndm5EFoXHaFNozMLRBh/npyqZXAxHtC8oIkP5p/dKlet A==;
X-CSE-ConnectionGUID: 0mN2+3KAQVeAaSPC06BOug==
X-CSE-MsgGUID: pc98SR/WRM6YbeYv2VECrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11627"; a="66313102"
X-IronPort-AV: E=Sophos;i="6.20,236,1758610800"; d="scan'208";a="66313102"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2025 04:51:41 -0800
X-CSE-ConnectionGUID: hOvShG9vQBy5btATvRyiFQ==
X-CSE-MsgGUID: Y1gimyA9R72ygR/Fob7UUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,236,1758610800"; d="scan'208";a="198770030"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO [10.245.245.63])
 ([10.245.245.63])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2025 04:51:40 -0800
Message-ID: <b7c3969245a5db71ced0c3aadc52c9531e68141d.camel@linux.intel.com>
Subject: Re: [RFC PATCH] drm/xe/bo: Honor madvise(2) advices
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 29 Nov 2025 13:51:38 +0100
In-Reply-To: <aSoNkE3dldrSbbF9@lstrano-desk.jf.intel.com>
References: <20251128104623.32742-1-thomas.hellstrom@linux.intel.com>
 <dd0ef25a-1fc1-4f7e-8363-74d4c660f71d@intel.com>
 <aSoNkE3dldrSbbF9@lstrano-desk.jf.intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-2.fc41) 
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

On Fri, 2025-11-28 at 13:01 -0800, Matthew Brost wrote:
> On Fri, Nov 28, 2025 at 12:57:15PM +0000, Matthew Auld wrote:
> > On 28/11/2025 10:46, Thomas Hellstr=C3=B6m wrote:
> > > The user can give advices as to how the CPU will access an
> > > address range. Use those advices to determine the number of
> > > bo pages to prefault on a page-fault.
> > >=20
> > > Do this regardless of whether we can find a way to avoid the
> > > fairly slow vm_insert_pfn_prot() to populate buffer
> > > object maps.
> > >=20
> > > Initially, fault up to 512 pages on sequential access and
> > > a single page on random access.
> > >=20
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Cc: Matthew Auld <matthew.auld@intel.com>
> > > Signed-off-by: Thomas Hellstr=C3=B6m
> > > <thomas.hellstrom@linux.intel.com>
> > > ---
> > > =C2=A0 drivers/gpu/drm/xe/xe_bo.c | 18 +++++++++++++++++-
> > > =C2=A0 1 file changed, 17 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/xe/xe_bo.c
> > > b/drivers/gpu/drm/xe/xe_bo.c
> > > index 6fd6ce6c6586..07d0d954f826 100644
> > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > @@ -1821,15 +1821,31 @@ static int xe_bo_fault_migrate(struct
> > > xe_bo *bo, struct ttm_operation_ctx *ctx,
> > > =C2=A0=C2=A0	return err;
> > > =C2=A0 }
> > > +/*
> > > + * Number of prefaulted pages for the MADV_SEQUENTIAL and
> > > + * MADV_RANDOM madvise() advices.
> > > + */
> > > +#define XE_BO_VM_NUM_PREFAULT_SEQ=C2=A0 512
> > > +#define XE_BO_VM_NUM_PREFAULT_RAND 1
> > > +
> > > =C2=A0 /* Call into TTM to populate PTEs, and register bo for PTE
> > > removal on runtime suspend. */
> > > =C2=A0 static vm_fault_t __xe_bo_cpu_fault(struct vm_fault *vmf,
> > > struct xe_device *xe, struct xe_bo *bo)
> > > =C2=A0 {
> > > +	const struct vm_area_struct *vma =3D vmf->vma;
> > > +	pgoff_t num_prefault;
> > > =C2=A0=C2=A0	vm_fault_t ret;
> > > =C2=A0=C2=A0	trace_xe_bo_cpu_fault(bo);
> > > +	if (vma->vm_flags & VM_SEQ_READ)
> > > +		num_prefault =3D XE_BO_VM_NUM_PREFAULT_SEQ;
> > > +	else if (vma->vm_flags & VM_RAND_READ)
> > > +		num_prefault =3D XE_BO_VM_NUM_PREFAULT_RAND;
> > > +	else
> > > +		num_prefault =3D TTM_BO_VM_NUM_PREFAULT;
> >=20
> > Ah, interesting. Do we know if any UMD is making use of these
> > special flags
> > today? Just wondering if this might be a visible change or not?
> > Also would
> > it make sense to document/advertise this somewhere for UMD folks,
> > in case
> > this has an immediate benefit for them?
> >=20
>=20
> I also have a question here - does Xe / TTM support faulting in THP
> on
> the CPU side? Is that something we should also look at doing based on
> madvise / global THP settings? Would that help mitigate the slow
> vm_insert_pfn_prot too?

It would probably help a lot, as long as we actually get 2MiB pages
from TTM.=20

I had that implemented in TTM once with vmwgfx the only user, and it
was working fine except one very important detail: I had implemented it
based on vma information rather than PTE-based information, so
get_user_pages_fast() didn't recognize these pages and was terribly
confused. So it had to be ripped out.

If we're going to try that again, we need to talk to x86 arch to get a
PMD_PUD_SPECIAL pmd/pud flag that behaves just like PTE_SPECIAL, so
that things like get_user_pages_fast() ignore these huge PTEs. Auditing
all page-walks in core-mm for this is non-trivial.

But if that is done, we could bring in that stuff again, although
Christian wasn't very fond of having it in TTM.

But I think it would also be very beneficial for things like ioremap()
and friends.

/Thomas


>=20
> Matt
>=20
> > I guess would be good to add an IGT which uses both flags, if we
> > don't
> > already?
> >=20
> > Anyway, I think change makes sense,
> > Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> >=20
> > > +
> > > =C2=A0=C2=A0	ret =3D ttm_bo_vm_fault_reserved(vmf, vmf->vma-
> > > >vm_page_prot,
> > > -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 TTM_BO_VM_NUM_PREFAULT);
> > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 num_prefault);
> > > =C2=A0=C2=A0	/*
> > > =C2=A0=C2=A0	 * When TTM is actually called to insert PTEs, ensure no
> > > blocking conditions
> > > =C2=A0=C2=A0	 * remain, in which case TTM may drop locks and return
> > > VM_FAULT_RETRY.
> >=20

