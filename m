Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FAA3D74ECB
	for <intel-xe@archiver.kernel.org>; Fri, 23 Jan 2026 13:31:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D17F510EAE7;
	Fri, 23 Jan 2026 13:31:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PIHINGcE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D568B10EAF2
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Jan 2026 13:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769175095; x=1800711095;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=H1n0CtORSkycxjJDQjQelKbVLK1PrY5PMS94qYWQGvM=;
 b=PIHINGcESmS0A8w4GegYt4kA9U18ARisoO4ZRIpYOmdVkIn+HBqyQaUS
 ztrleK0vQa/g9tnsy0rJF7sppLVCwqnyzldKjdwtXW5lcGRhauLFEqOz8
 Diwxq9aLLgl1pQa8p6x/Z9HYzIR/KqJJia8gbdW7IyMWSlxfoMOyNw9f5
 OqGqXdAgE9WwikRmp2EIVp0WYAlP4oh8TwRcr31O34DIvyaDkSTg1sNsK
 /FSgf8omf0ofE2I2eH+OVTE8CubxKgItK0jv8fp4eZXqydA2nnhkKHGq+
 x63UmQVyRuhA+Dgm+bDX571g3oUjea28I0Tfym6Q4gOORkMnNbb+tDd4u g==;
X-CSE-ConnectionGUID: RlR23eq/TJy//VKcTu5pMg==
X-CSE-MsgGUID: wl1WbxolRhumw1mfSgcvPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="95897153"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="95897153"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 05:31:35 -0800
X-CSE-ConnectionGUID: yVNt4X6iQIaWIUlRDK0aog==
X-CSE-MsgGUID: VE25h7PvQki7DD45U9DaIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="211898096"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO [10.245.244.177])
 ([10.245.244.177])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 05:31:33 -0800
Message-ID: <06e2e9a9493b5389c9bf01304ea248dd3c86c8e4.camel@linux.intel.com>
Subject: Re: [PATCH v4 7/8] drm/xe/madvise: Block imported and exported
 dma-bufs
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, Arvind Yadav
 <arvind.yadav@intel.com>
Cc: intel-xe@lists.freedesktop.org, himal.prasad.ghimiray@intel.com, 
 pallavi.mishra@intel.com
Date: Fri, 23 Jan 2026 14:31:31 +0100
In-Reply-To: <aW/ArJw02DG/6wHv@lstrano-desk.jf.intel.com>
References: <20260120060900.3137984-1-arvind.yadav@intel.com>
 <20260120060900.3137984-8-arvind.yadav@intel.com>
 <aW/ArJw02DG/6wHv@lstrano-desk.jf.intel.com>
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

On Tue, 2026-01-20 at 09:51 -0800, Matthew Brost wrote:
> On Tue, Jan 20, 2026 at 11:38:53AM +0530, Arvind Yadav wrote:
> > Prevent marking imported or exported dma-bufs as purgeable.
> > External devices may be accessing these buffers without our
> > knowledge, making purging unsafe.
> >=20
> > Check drm_gem_is_imported() for buffers created by other
> > drivers and obj->dma_buf for buffers exported to other
> > drivers. Silently skip these BOs during madvise processing.
> >=20
> > This follows drm_gem_shmem's purgeable implementation and
> > prevents data corruption from purging actively-used shared
> > buffers.
> >=20
> > v3:
> > =C2=A0=C2=A0 - Addresses review feedback from Matt Roper about handling
> > =C2=A0=C2=A0=C2=A0=C2=A0 imported/exported BOs correctly in the purgeab=
le BO
> > =C2=A0=C2=A0=C2=A0=C2=A0 implementation.
> >=20
> > v4:
> > =C2=A0=C2=A0 - Check should be add to xe_vm_madvise_purgeable_bo.
> >=20
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
>=20
> @Thomas - couple questions below here I need a 2nd opinion on.
>=20
> > Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> > ---
> > =C2=A0drivers/gpu/drm/xe/xe_vm_madvise.c | 33
> > ++++++++++++++++++++++++++++++
> > =C2=A01 file changed, 33 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c
> > b/drivers/gpu/drm/xe/xe_vm_madvise.c
> > index 27b6ad65b314..5808fef89777 100644
> > --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> > +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> > @@ -180,6 +180,31 @@ static void madvise_pat_index(struct xe_device
> > *xe, struct xe_vm *vm,
> > =C2=A0	}
> > =C2=A0}
> > =C2=A0
> > +/**
> > + * xe_bo_is_external_dmabuf() - Check if BO is imported or
> > exported dma-buf
> > + * @bo: Buffer object
> > + *
> > + * Prevent marking imported or exported dma-bufs as purgeable.
> > + * External devices may be accessing these buffers without our
> > + * knowledge, making purging unsafe.
> > + *
> > + * Return: true if BO is imported or exported, false otherwise
> > + */
> > +static bool xe_bo_is_external_dmabuf(struct xe_bo *bo)
> > +{
>=20
> @Thomas
>=20
> Should we have this check more generic? e.g., if a BO is not tied to
> a
> VM, we don't allow purablity to be set?

I think if NEO is going to implement this in one form or another, we
need to support also external bos as long as they're not exported,
since NEO refuses to use local bos.

>=20
> > +	struct drm_gem_object *obj =3D &bo->ttm.base;
> > +
> > +	/* Imported from another driver */
> > +	if (drm_gem_is_imported(obj))
> > +		return true;
> > +
> > +	/* Exported to another driver */
> > +	if (obj->dma_buf)
> > +		return true;
> > +
> > +	return false;
> > +}
> > +
> > =C2=A0/**
> > =C2=A0 * xe_bo_all_vmas_dontneed() - Check if all VMAs of a BO are
> > marked DONTNEED
> > =C2=A0 * @bo: Buffer object
> > @@ -200,6 +225,10 @@ static bool xe_bo_all_vmas_dontneed(struct
> > xe_bo *bo)
> > =C2=A0
> > =C2=A0	dma_resv_assert_held(bo->ttm.base.resv);
> > =C2=A0
> > +	/* External dma-bufs cannot be purgeable */
> > +	if (xe_bo_is_external_dmabuf(bo))
> > +		return false;
> > +
> > =C2=A0	drm_gem_for_each_gpuvm_bo(vm_bo, obj) {
> > =C2=A0		drm_gpuvm_bo_for_each_va(gpuva, vm_bo) {
> > =C2=A0			struct xe_vma *vma =3D gpuva_to_vma(gpuva);
> > @@ -277,6 +306,10 @@ static bool xe_vm_madvise_purgeable_bo(struct
> > xe_device *xe, struct xe_vm *vm,
> > =C2=A0		/* BO must be locked before modifying madv state
> > */
> > =C2=A0		xe_bo_assert_held(bo);
> > =C2=A0
> > +		/* Skip external dma-bufs */
> > +		if (xe_bo_is_external_dmabuf(bo))
> > +			continue;
>=20
> @Thomas
>=20
> I think instead of silently continuing here we fail the IOCTL with
> -EINVAL?
>=20
> What do you think?

Hmm. If we view the export as yet another map, then IMO silently
continuing would probably be the best option and consistent with
sharing across VMs.

Finally I wonder if we should update the purgeable state on final dma-
buf attach.

Floating an idea here:

Could the code be simplified if we maintain a map_count and a
purgeable_count on each bo? Bo is purgeable iff map_count =3D=3D
purgeable_count. vmas and dma-buf attachments are included in
map_count.

Thanks,
Thomas


>=20
> Matt
>=20
> > +
> > =C2=A0		/*
> > =C2=A0		 * Once purged, always purged. Cannot transition
> > back to WILLNEED.
> > =C2=A0		 * This matches i915 semantics where purged BOs
> > are permanently invalid.
> > --=20
> > 2.43.0
> >=20
