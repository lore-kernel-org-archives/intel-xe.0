Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5F69D116F1
	for <intel-xe@archiver.kernel.org>; Sat, 29 Nov 2025 12:40:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A15D10E1DC;
	Sat, 29 Nov 2025 12:40:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gkdS05vu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9A4E10E1DC
 for <intel-xe@lists.freedesktop.org>; Sat, 29 Nov 2025 12:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764420049; x=1795956049;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=+u225I+QgiTAjyhOeDrI0RDGHBrNDIWIltObF7J7S3U=;
 b=gkdS05vuGOOn/eikis0alcvuDlis8TZWgWQqTjYUctBR5Lgs7NNFvE20
 YjrNC25CEKeUAWYWCbTE/ZBs3tFSb2LTzlTHAQsDa59ZlL90lnXYgAQv9
 +p94M9jBtQdRRcTBLvier4Il13dRckAEw0Ia61klvzK1nadlKnxVPLAKd
 BjqebG5ZTa86SgeoyWOTjJSwubjLKbl+v0NI6MhzXUChvNDwiSyZmVT7I
 1n433kovJ1bcHvvDJrUWMwpCO+FC3iuRynyTfuH4Ka/EPJukOM2GMghJC
 1YfA189UFX2k2JN5T80H6IitEfLPytcFyR7J3QdRXJ1g3ZPq57eADAtgJ g==;
X-CSE-ConnectionGUID: 7a7DSnxSTGSnHy3KhIDECA==
X-CSE-MsgGUID: vjrscih0SZSnMkHRNdzWAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11627"; a="77050109"
X-IronPort-AV: E=Sophos;i="6.20,236,1758610800"; d="scan'208";a="77050109"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2025 04:40:48 -0800
X-CSE-ConnectionGUID: CirIHfNBSq6C8WFt7k5QWA==
X-CSE-MsgGUID: wLneFA4KRf+wHqA2VyOvrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,236,1758610800"; d="scan'208";a="198125133"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO [10.245.245.63])
 ([10.245.245.63])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2025 04:40:47 -0800
Message-ID: <abb174af96e5737716f0dfff3840d48b3e83d167.camel@linux.intel.com>
Subject: Re: [RFC PATCH] drm/xe/bo: Honor madvise(2) advices
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
Date: Sat, 29 Nov 2025 13:40:29 +0100
In-Reply-To: <dd0ef25a-1fc1-4f7e-8363-74d4c660f71d@intel.com>
References: <20251128104623.32742-1-thomas.hellstrom@linux.intel.com>
 <dd0ef25a-1fc1-4f7e-8363-74d4c660f71d@intel.com>
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

On Fri, 2025-11-28 at 12:57 +0000, Matthew Auld wrote:
> On 28/11/2025 10:46, Thomas Hellstr=C3=B6m wrote:
> > The user can give advices as to how the CPU will access an
> > address range. Use those advices to determine the number of
> > bo pages to prefault on a page-fault.
> >=20
> > Do this regardless of whether we can find a way to avoid the
> > fairly slow vm_insert_pfn_prot() to populate buffer
> > object maps.
> >=20
> > Initially, fault up to 512 pages on sequential access and
> > a single page on random access.
> >=20
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > ---
> > =C2=A0 drivers/gpu/drm/xe/xe_bo.c | 18 +++++++++++++++++-
> > =C2=A0 1 file changed, 17 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c
> > b/drivers/gpu/drm/xe/xe_bo.c
> > index 6fd6ce6c6586..07d0d954f826 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -1821,15 +1821,31 @@ static int xe_bo_fault_migrate(struct xe_bo
> > *bo, struct ttm_operation_ctx *ctx,
> > =C2=A0=C2=A0	return err;
> > =C2=A0 }
> > =C2=A0=20
> > +/*
> > + * Number of prefaulted pages for the MADV_SEQUENTIAL and
> > + * MADV_RANDOM madvise() advices.
> > + */
> > +#define XE_BO_VM_NUM_PREFAULT_SEQ=C2=A0 512
> > +#define XE_BO_VM_NUM_PREFAULT_RAND 1
> > +
> > =C2=A0 /* Call into TTM to populate PTEs, and register bo for PTE
> > removal on runtime suspend. */
> > =C2=A0 static vm_fault_t __xe_bo_cpu_fault(struct vm_fault *vmf, struct
> > xe_device *xe, struct xe_bo *bo)
> > =C2=A0 {
> > +	const struct vm_area_struct *vma =3D vmf->vma;
> > +	pgoff_t num_prefault;
> > =C2=A0=C2=A0	vm_fault_t ret;
> > =C2=A0=20
> > =C2=A0=C2=A0	trace_xe_bo_cpu_fault(bo);
> > =C2=A0=20
> > +	if (vma->vm_flags & VM_SEQ_READ)
> > +		num_prefault =3D XE_BO_VM_NUM_PREFAULT_SEQ;
> > +	else if (vma->vm_flags & VM_RAND_READ)
> > +		num_prefault =3D XE_BO_VM_NUM_PREFAULT_RAND;
> > +	else
> > +		num_prefault =3D TTM_BO_VM_NUM_PREFAULT;
>=20
> Ah, interesting. Do we know if any UMD is making use of these special
> flags today? Just wondering if this might be a visible change or not?

I'm not aware of any.

> Also would it make sense to document/advertise this somewhere for UMD
> folks, in case this has an immediate benefit for them?
>=20
> I guess would be good to add an IGT which uses both flags, if we
> don't=20
> already?

No we don't. Just trying to get some feedback at this point. Reason is
we've got some complaints about xe being significantly slower on first
CPU access than i915. There is resistance adding something i915-like
from core mm, and until we find out a way to do that cleanly, this
might perhaps suffice. Trying to get that confirmed / rejected.

/Thomas


>=20
> Anyway, I think change makes sense,
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>=20
> > +
> > =C2=A0=C2=A0	ret =3D ttm_bo_vm_fault_reserved(vmf, vmf->vma-
> > >vm_page_prot,
> > -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 TTM_BO_VM_NUM_PREFAULT);
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 num_prefault);
> > =C2=A0=C2=A0	/*
> > =C2=A0=C2=A0	 * When TTM is actually called to insert PTEs, ensure no
> > blocking conditions
> > =C2=A0=C2=A0	 * remain, in which case TTM may drop locks and return
> > VM_FAULT_RETRY.
>=20

