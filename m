Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1530ACFD2F6
	for <intel-xe@archiver.kernel.org>; Sat, 29 Nov 2025 16:18:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB6E610E159;
	Sat, 29 Nov 2025 16:18:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rl0bvh2w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9513510E159
 for <intel-xe@lists.freedesktop.org>; Sat, 29 Nov 2025 16:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764433087; x=1795969087;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=mDd9AX2zcXlfDPPhVTua36ruqPOErn1z2/gs6JtO1MY=;
 b=Rl0bvh2waW7NeUD32+RfAbGzOOGZkAnxghXAbwTIIn0jt7GBgGX+DnFw
 qIDWXANoMHcSJ3SRyzIiT42dzxCuEStNXLgUVbVEfBlxO79G68Rwe+0hI
 Czk7a5qKz3PyNm/vC69Z2alc9KOP8jHlqlS5Efb9D0YFVUCPP5Xm69YaE
 01aPMQ1N8TnCK7kIIZAvuVJStH+0MR6DsuTx9lBtznlGsPIHrLb2BoEw8
 MAhHg2wa0HPKiFkBnZLqjDDkyxOgJwKEdUFGp4J9Ctx4VtjJJD1CVqt5B
 CvVhB4G+99sbiME/Iju1xIbGNeobVGma/epKeBEieen+E2sACbrhZiJAI Q==;
X-CSE-ConnectionGUID: 549ViTxpQoW3fIQfualg1A==
X-CSE-MsgGUID: +Ve0eMqwR8aJ6VELIW5Vhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11627"; a="66379746"
X-IronPort-AV: E=Sophos;i="6.20,236,1758610800"; d="scan'208";a="66379746"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2025 08:18:06 -0800
X-CSE-ConnectionGUID: JOp2LFcTTLy//6gq8Y2msA==
X-CSE-MsgGUID: X5pfPZknQJeqEnZcfZjDAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,236,1758610800"; d="scan'208";a="217040817"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO [10.245.245.63])
 ([10.245.245.63])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2025 08:18:05 -0800
Message-ID: <bd74224684f03a0d1fea8354f406a9ea03e0d288.camel@linux.intel.com>
Subject: Re: [RFC PATCH] drm/xe/bo: Honor madvise(2) advices
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Date: Sat, 29 Nov 2025 17:18:02 +0100
In-Reply-To: <aSsXWDSOVnI4V2jG@lstrano-desk.jf.intel.com>
References: <20251128104623.32742-1-thomas.hellstrom@linux.intel.com>
 <dd0ef25a-1fc1-4f7e-8363-74d4c660f71d@intel.com>
 <aSoNkE3dldrSbbF9@lstrano-desk.jf.intel.com>
 <b7c3969245a5db71ced0c3aadc52c9531e68141d.camel@linux.intel.com>
 <aSsXWDSOVnI4V2jG@lstrano-desk.jf.intel.com>
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

On Sat, 2025-11-29 at 07:55 -0800, Matthew Brost wrote:
> On Sat, Nov 29, 2025 at 01:51:38PM +0100, Thomas Hellstr=C3=B6m wrote:
> > On Fri, 2025-11-28 at 13:01 -0800, Matthew Brost wrote:
> > > On Fri, Nov 28, 2025 at 12:57:15PM +0000, Matthew Auld wrote:
> > > > On 28/11/2025 10:46, Thomas Hellstr=C3=B6m wrote:
> > > > > The user can give advices as to how the CPU will access an
> > > > > address range. Use those advices to determine the number of
> > > > > bo pages to prefault on a page-fault.
> > > > >=20
> > > > > Do this regardless of whether we can find a way to avoid the
> > > > > fairly slow vm_insert_pfn_prot() to populate buffer
> > > > > object maps.
> > > > >=20
> > > > > Initially, fault up to 512 pages on sequential access and
> > > > > a single page on random access.
> > > > >=20
> > > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > > > Cc: Matthew Auld <matthew.auld@intel.com>
> > > > > Signed-off-by: Thomas Hellstr=C3=B6m
> > > > > <thomas.hellstrom@linux.intel.com>
> > > > > ---
> > > > > =C2=A0 drivers/gpu/drm/xe/xe_bo.c | 18 +++++++++++++++++-
> > > > > =C2=A0 1 file changed, 17 insertions(+), 1 deletion(-)
> > > > >=20
> > > > > diff --git a/drivers/gpu/drm/xe/xe_bo.c
> > > > > b/drivers/gpu/drm/xe/xe_bo.c
> > > > > index 6fd6ce6c6586..07d0d954f826 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > > > @@ -1821,15 +1821,31 @@ static int xe_bo_fault_migrate(struct
> > > > > xe_bo *bo, struct ttm_operation_ctx *ctx,
> > > > > =C2=A0=C2=A0	return err;
> > > > > =C2=A0 }
> > > > > +/*
> > > > > + * Number of prefaulted pages for the MADV_SEQUENTIAL and
> > > > > + * MADV_RANDOM madvise() advices.
> > > > > + */
> > > > > +#define XE_BO_VM_NUM_PREFAULT_SEQ=C2=A0 512
> > > > > +#define XE_BO_VM_NUM_PREFAULT_RAND 1
> > > > > +
> > > > > =C2=A0 /* Call into TTM to populate PTEs, and register bo for PTE
> > > > > removal on runtime suspend. */
> > > > > =C2=A0 static vm_fault_t __xe_bo_cpu_fault(struct vm_fault *vmf,
> > > > > struct xe_device *xe, struct xe_bo *bo)
> > > > > =C2=A0 {
> > > > > +	const struct vm_area_struct *vma =3D vmf->vma;
> > > > > +	pgoff_t num_prefault;
> > > > > =C2=A0=C2=A0	vm_fault_t ret;
> > > > > =C2=A0=C2=A0	trace_xe_bo_cpu_fault(bo);
> > > > > +	if (vma->vm_flags & VM_SEQ_READ)
> > > > > +		num_prefault =3D XE_BO_VM_NUM_PREFAULT_SEQ;
> > > > > +	else if (vma->vm_flags & VM_RAND_READ)
> > > > > +		num_prefault =3D XE_BO_VM_NUM_PREFAULT_RAND;
> > > > > +	else
> > > > > +		num_prefault =3D TTM_BO_VM_NUM_PREFAULT;
> > > >=20
> > > > Ah, interesting. Do we know if any UMD is making use of these
> > > > special flags
> > > > today? Just wondering if this might be a visible change or not?
> > > > Also would
> > > > it make sense to document/advertise this somewhere for UMD
> > > > folks,
> > > > in case
> > > > this has an immediate benefit for them?
> > > >=20
> > >=20
> > > I also have a question here - does Xe / TTM support faulting in
> > > THP
> > > on
> > > the CPU side? Is that something we should also look at doing
> > > based on
> > > madvise / global THP settings? Would that help mitigate the slow
> > > vm_insert_pfn_prot too?
> >=20
> > It would probably help a lot, as long as we actually get 2MiB pages
> > from TTM.=20
> >=20
>=20
> Hmm, yes this seems like a pretty big win too considering Mesa now
> always allocates 2M BOs and then suballocates smaller allocations in
> user space. So we should pretty much always should be getting 2M
> pages /
> faults.
>=20
> > I had that implemented in TTM once with vmwgfx the only user, and
> > it
> > was working fine except one very important detail: I had
> > implemented it
> > based on vma information rather than PTE-based information, so
> > get_user_pages_fast() didn't recognize these pages and was terribly
> > confused. So it had to be ripped out.
> >=20
> > If we're going to try that again, we need to talk to x86 arch to
> > get a
> > PMD_PUD_SPECIAL pmd/pud flag that behaves just like PTE_SPECIAL, so
> > that things like get_user_pages_fast() ignore these huge PTEs.
> > Auditing
> > all page-walks in core-mm for this is non-trivial.
> >=20
>=20
> Agree, core-mm page walks are non-trivial to audit. Recently looked
> at
> 2M device pages series and it really wasn't all that bad though.
>=20
> Out of technical depth on the PTE_SPECIAL comment, but can dig in a
> bit
> here. We do have a maintainer of x86 at Intel (Dave Hansen) which we
> can
> float any ideas wrt to this topic though.

Yeah, I was talking to those people back then and they suggested using
a flag at least initially separate from PTE_SPECIAL. (There are some
available flags in the huge PMDs). But at the time x86_32 was a thing
and using one of the suggested flags would make updating the 64-bit
PTEs with x86_32 the way it was implemented become racy, on top of all
other complications. So while I made significant progress back then, I
decided there were more important things to do, and stopped.

>=20
> > But if that is done, we could bring in that stuff again, although
> > Christian wasn't very fond of having it in TTM.
> >=20
>=20
> We can perhaps bring this up as an option to Christian - from my
> limited
> knowledge on this topic, this seems like something worth while to do
> regardless of the PAT issue as just seems like a pretty big win. This
> however is very unlikely to make it into customer kernels which are
> complaining about this perf issue, so I think ww need to explore
> other
> options too.

Maybe for the issue at hand (I completely understand the NAK of using
apply_to_page_range() from within drivers) maybe we could get a go-
ahead for exporting some useful interfaces from core mm: Like perhaps
vmf_insert_pfns_prot() that takes an array of pfns and inserts them,
and perhaps vmf_insert_pages_as_pfns_prot() which would do the same for
struct page pointer arrays These could do the slow PAT adjustments once
and then insert all pages/pfns using a single page-walk. Either using
apply_to_page_range() or the more generic pagewalk. Could perhaps look
at the i915 implementation, particularly for the iomap stuff and see if
there's something reusable.

/Thomas


>=20
> Matt
>=20
> > But I think it would also be very beneficial for things like
> > ioremap()
> > and friends.
> >=20
> > /Thomas
> >=20
> >=20
> > >=20
> > > Matt
> > >=20
> > > > I guess would be good to add an IGT which uses both flags, if
> > > > we
> > > > don't
> > > > already?
> > > >=20
> > > > Anyway, I think change makes sense,
> > > > Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> > > >=20
> > > > > +
> > > > > =C2=A0=C2=A0	ret =3D ttm_bo_vm_fault_reserved(vmf, vmf->vma-
> > > > > > vm_page_prot,
> > > > > -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > > > > TTM_BO_VM_NUM_PREFAULT);
> > > > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 num_prefault);
> > > > > =C2=A0=C2=A0	/*
> > > > > =C2=A0=C2=A0	 * When TTM is actually called to insert PTEs,
> > > > > ensure no
> > > > > blocking conditions
> > > > > =C2=A0=C2=A0	 * remain, in which case TTM may drop locks and
> > > > > return
> > > > > VM_FAULT_RETRY.
> > > >=20
> >=20

