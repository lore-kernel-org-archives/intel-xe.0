Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9F39D49C80
	for <intel-xe@archiver.kernel.org>; Fri, 30 Jan 2026 08:59:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D7B910E93E;
	Fri, 30 Jan 2026 08:59:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="il1dRf3C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D99810E93E
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Jan 2026 08:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769763594; x=1801299594;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Vm8lP+NwdY310yf960f4DVGuX+KfO9W/1YRMnbpZrQY=;
 b=il1dRf3CGBnnwFsdE+r+reDsWUI1lT6WOBtRvWrC3kPEftUodhrdhC78
 BV2grWtYjBitCVwWNWOndB2bbsoJXj5iQ57gi7ZJ2//3xaY2Cp10/Df1v
 /7KHBoswptEi708OhG24uTsLXET9L8e7X678Rmgj+7g1i2rgOZ9zr2r9O
 yxrvWTMqUbQGbBmvNAbDadTzxydx+wEId4Km1TdJn2e2TRXwTeBvFBL/K
 +hH7qnWNwDjPjehlxf7FFbSK/+ScUPliCYegWvo0UhsBfVIUx7gkYh7GB
 XQkJASxPMjKP4G99GE6/Tp2Txcr9WtW7TXq1dVQCGFcEDyzELcEVTw5NX Q==;
X-CSE-ConnectionGUID: utktEFLQSZeiZf56pbuwmQ==
X-CSE-MsgGUID: ZaC9BAPRTemwnqPB5xIR+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="81746477"
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="81746477"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 00:59:54 -0800
X-CSE-ConnectionGUID: ImDVSNVYRT6/GlihAi1Djg==
X-CSE-MsgGUID: W49FldB6QZe59Gs+xstiRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="208721594"
Received: from rvuia-mobl.ger.corp.intel.com (HELO [10.245.244.13])
 ([10.245.244.13])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 00:59:52 -0800
Message-ID: <3fe5bd7e1d45686f5e637c7751954f04573deb7b.camel@linux.intel.com>
Subject: Re: [PATCH v4 7/8] drm/xe/madvise: Block imported and exported
 dma-bufs
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: "Yadav, Arvind" <arvind.yadav@intel.com>, Matthew Brost
 <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, himal.prasad.ghimiray@intel.com, 
 pallavi.mishra@intel.com
Date: Fri, 30 Jan 2026 09:59:50 +0100
In-Reply-To: <f7ff5e5a-f4f1-473b-bd53-01afe5cc5c89@intel.com>
References: <20260120060900.3137984-1-arvind.yadav@intel.com>
 <20260120060900.3137984-8-arvind.yadav@intel.com>
 <aW/ArJw02DG/6wHv@lstrano-desk.jf.intel.com>
 <06e2e9a9493b5389c9bf01304ea248dd3c86c8e4.camel@linux.intel.com>
 <f7ff5e5a-f4f1-473b-bd53-01afe5cc5c89@intel.com>
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

On Fri, 2026-01-30 at 13:52 +0530, Yadav, Arvind wrote:
>=20
> On 23-01-2026 19:01, Thomas Hellstr=C3=B6m wrote:
> > On Tue, 2026-01-20 at 09:51 -0800, Matthew Brost wrote:
> > > On Tue, Jan 20, 2026 at 11:38:53AM +0530, Arvind Yadav wrote:
> > > > Prevent marking imported or exported dma-bufs as purgeable.
> > > > External devices may be accessing these buffers without our
> > > > knowledge, making purging unsafe.
> > > >=20
> > > > Check drm_gem_is_imported() for buffers created by other
> > > > drivers and obj->dma_buf for buffers exported to other
> > > > drivers. Silently skip these BOs during madvise processing.
> > > >=20
> > > > This follows drm_gem_shmem's purgeable implementation and
> > > > prevents data corruption from purging actively-used shared
> > > > buffers.
> > > >=20
> > > > v3:
> > > > =C2=A0=C2=A0=C2=A0 - Addresses review feedback from Matt Roper abou=
t handling
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 imported/exported BOs correctly in t=
he purgeable BO
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 implementation.
> > > >=20
> > > > v4:
> > > > =C2=A0=C2=A0=C2=A0 - Check should be add to xe_vm_madvise_purgeable=
_bo.
> > > >=20
> > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > > Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > > @Thomas - couple questions below here I need a 2nd opinion on.
> > >=20
> > > > Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > > > Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> > > > ---
> > > > =C2=A0=C2=A0drivers/gpu/drm/xe/xe_vm_madvise.c | 33
> > > > ++++++++++++++++++++++++++++++
> > > > =C2=A0=C2=A01 file changed, 33 insertions(+)
> > > >=20
> > > > diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c
> > > > b/drivers/gpu/drm/xe/xe_vm_madvise.c
> > > > index 27b6ad65b314..5808fef89777 100644
> > > > --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> > > > +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> > > > @@ -180,6 +180,31 @@ static void madvise_pat_index(struct
> > > > xe_device
> > > > *xe, struct xe_vm *vm,
> > > > =C2=A0=C2=A0	}
> > > > =C2=A0=C2=A0}
> > > > =C2=A0=20
> > > > +/**
> > > > + * xe_bo_is_external_dmabuf() - Check if BO is imported or
> > > > exported dma-buf
> > > > + * @bo: Buffer object
> > > > + *
> > > > + * Prevent marking imported or exported dma-bufs as purgeable.
> > > > + * External devices may be accessing these buffers without our
> > > > + * knowledge, making purging unsafe.
> > > > + *
> > > > + * Return: true if BO is imported or exported, false otherwise
> > > > + */
> > > > +static bool xe_bo_is_external_dmabuf(struct xe_bo *bo)
> > > > +{
> > > @Thomas
> > >=20
> > > Should we have this check more generic? e.g., if a BO is not tied
> > > to
> > > a
> > > VM, we don't allow purablity to be set?
> > I think if NEO is going to implement this in one form or another,
> > we
> > need to support also external bos as long as they're not exported,
> > since NEO refuses to use local bos.
>=20
>=20
> You're right, and I believe the current implementation should support
> that.
>=20
> To clarify: "external" here refers only to dma-buf sharing (imported
> or
> exported), not to placement. System-memory BOs that NEO typically
> uses
> remain fully eligible for purging.
>=20
> The xe_bo_is_dmabuf_shared() check specifically targets:
> =C2=A0=C2=A0 - Imported dma-bufs (we don't own backing store)
> =C2=A0=C2=A0 - Exported dma-bufs (external devices may have active mappin=
gs)
>=20
> Regular Xe-owned system BOs can be marked DONTNEED and purged under
> memory
> pressure. We only skip cases where the BO is shared via dma-buf,
> following
> the same pattern as drm_gem_shmem_is_purgeable().
>=20
> Please let me know if I've misunderstood the NEO requirements.

No it sounds right. We have
*local BOs, those that Matt refers to as tied to a VM. They are not
sharable.
*external BOs. Those may or may not be exported as dma-bufs. NEO uses
only these, and they need to be purgeable as well, as long as they are
not exported or imported dma-bufs.

Thanks,
Thomas



>=20
>=20
> > > > +	struct drm_gem_object *obj =3D &bo->ttm.base;
> > > > +
> > > > +	/* Imported from another driver */
> > > > +	if (drm_gem_is_imported(obj))
> > > > +		return true;
> > > > +
> > > > +	/* Exported to another driver */
> > > > +	if (obj->dma_buf)
> > > > +		return true;
> > > > +
> > > > +	return false;
> > > > +}
> > > > +
> > > > =C2=A0=C2=A0/**
> > > > =C2=A0=C2=A0 * xe_bo_all_vmas_dontneed() - Check if all VMAs of a B=
O are
> > > > marked DONTNEED
> > > > =C2=A0=C2=A0 * @bo: Buffer object
> > > > @@ -200,6 +225,10 @@ static bool xe_bo_all_vmas_dontneed(struct
> > > > xe_bo *bo)
> > > > =C2=A0=20
> > > > =C2=A0=C2=A0	dma_resv_assert_held(bo->ttm.base.resv);
> > > > =C2=A0=20
> > > > +	/* External dma-bufs cannot be purgeable */
> > > > +	if (xe_bo_is_external_dmabuf(bo))
> > > > +		return false;
> > > > +
> > > > =C2=A0=C2=A0	drm_gem_for_each_gpuvm_bo(vm_bo, obj) {
> > > > =C2=A0=C2=A0		drm_gpuvm_bo_for_each_va(gpuva, vm_bo) {
> > > > =C2=A0=C2=A0			struct xe_vma *vma =3D
> > > > gpuva_to_vma(gpuva);
> > > > @@ -277,6 +306,10 @@ static bool
> > > > xe_vm_madvise_purgeable_bo(struct
> > > > xe_device *xe, struct xe_vm *vm,
> > > > =C2=A0=C2=A0		/* BO must be locked before modifying madv
> > > > state
> > > > */
> > > > =C2=A0=C2=A0		xe_bo_assert_held(bo);
> > > > =C2=A0=20
> > > > +		/* Skip external dma-bufs */
> > > > +		if (xe_bo_is_external_dmabuf(bo))
> > > > +			continue;
> > > @Thomas
> > >=20
> > > I think instead of silently continuing here we fail the IOCTL
> > > with
> > > -EINVAL?
> > >=20
> > > What do you think?
> > Hmm. If we view the export as yet another map, then IMO silently
> > continuing would probably be the best option and consistent with
> > sharing across VMs.
> Noted, I'll keep the silent skip behavior for dma-buf shared BOs to=20
> match the "unanimous DONTNEED" model.
> >=20
> > Finally I wonder if we should update the purgeable state on final
> > dma-
> > buf attach.
>=20
>=20
> Good point. Currently the check only happens at madvise time, so
> there's=20
> a window where a BO marked DONTNEED could later be exported.
> Would it make sense to hook into the export path to force transition
> to=20
> WILLNEED? That would make the "export as implicit mapping" model
> complete,
> though it adds complexity. Let me know your preference.
>=20
> >=20
> > Floating an idea here:
> >=20
> > Could the code be simplified if we maintain a map_count and a
> > purgeable_count on each bo? Bo is purgeable iff map_count =3D=3D
> > purgeable_count. vmas and dma-buf attachments are included in
> > map_count.
>=20
>=20
> That's good idea and would avoid VMA iteration. The tradeoff is=20
> maintaining correct counts across all VMA and dma-buf lifecycle
> paths.
>=20
> For this series, would you prefer I pursue the counter-based refactor
> now, or is the current iteration approach acceptable
> with counters as a future optimization? I'm happy to go either
> direction=20
> based on your feedback.
>=20
>=20
> Thanks,
> Arvind
>=20
> >=20
> > Thanks,
> > Thomas
> >=20
> >=20
> > > Matt
> > >=20
> > > > +
> > > > =C2=A0=C2=A0		/*
> > > > =C2=A0=C2=A0		 * Once purged, always purged. Cannot
> > > > transition
> > > > back to WILLNEED.
> > > > =C2=A0=C2=A0		 * This matches i915 semantics where purged
> > > > BOs
> > > > are permanently invalid.
> > > > --=20
> > > > 2.43.0
> > > >=20
