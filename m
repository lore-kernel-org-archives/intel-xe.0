Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE709CFD376
	for <intel-xe@archiver.kernel.org>; Tue,  2 Dec 2025 09:42:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59A5810E5CF;
	Tue,  2 Dec 2025 09:42:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eFam3Hcv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68A8110E5CC
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Dec 2025 09:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764668542; x=1796204542;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=fVWozfvnwYiKENiFzaekg3tfS6iB8AzRMCMIyFEhW3w=;
 b=eFam3HcvYZBn5bxs5+l2QoMGy8O4M93kOqfjkgLK3EmA+7p3EAiFKYXg
 qxhe85Z5HUVJIB+o+B0DiIxaCFJ5g4oaT2o4BQi3SSvZxom3mNe/Oup8s
 gP4UsCwTOi7KOyxG2VdKTULSvulUePRl2ZRM0/ScIwBUXtlkaE0jlVpgI
 Vt+iZmCECRvo1/m+3nCAM686iT2eyy6uuyrd+eICEYA58a5BnsPf4OzRL
 Uk7fU0tV8LShb/+e5o1ujQB3zPjFL/5y3UTgCIhzXM7mQJh5f7ikmxENH
 Wf9DjWky7yOtLINHkhX+O6u7pwJwAWB1S/3D8yA+QiwhUmWHXdzCxVbMI Q==;
X-CSE-ConnectionGUID: l80bbCWWTw+go19oCkZA0A==
X-CSE-MsgGUID: g4sbsXuuRmGf0SnYe/KvCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66795782"
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="66795782"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 01:42:12 -0800
X-CSE-ConnectionGUID: UE3QqjaiSYirRLyhgnE+qA==
X-CSE-MsgGUID: oEqZ9sjkRVKsxMYkKExpMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="194549404"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO [10.245.244.102])
 ([10.245.244.102])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 01:42:09 -0800
Message-ID: <d5fd4f75e084f4e8d0e3eb7e542d8988fab87449.camel@linux.intel.com>
Subject: Re: [RFC v2 3/9] drm/xe/bo: Prevent purging of shared buffer objects
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: "Yadav, Arvind" <arvind.yadav@intel.com>, Matthew Brost
 <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, himal.prasad.ghimiray@intel.com, 
 pallavi.mishra@intel.com
Date: Tue, 02 Dec 2025 10:42:07 +0100
In-Reply-To: <6c3ed737-3dd5-49ca-a78e-593d8e187220@intel.com>
References: <20251201055309.854074-1-arvind.yadav@intel.com>
 <20251201055309.854074-4-arvind.yadav@intel.com>
 <aS4geyZDuwlcyc9R@lstrano-desk.jf.intel.com>
 <6c3ed737-3dd5-49ca-a78e-593d8e187220@intel.com>
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

On Tue, 2025-12-02 at 09:12 +0530, Yadav, Arvind wrote:
>=20
> On 02-12-2025 04:40, Matthew Brost wrote:
> > On Mon, Dec 01, 2025 at 11:20:13AM +0530, Arvind Yadav wrote:
> > > Introduce the `xe_bo_is_shared_locked()` inline helper to
> > > determine if a
> > > buffer object is shared across multiple clients or drivers. A
> > > buffer is
> > > considered shared if it is exported via dma-buf, imported, or has
> > > a
> > > handle count greater than one.
> > >=20
> > > This check is critical for safely implementing purgeable memory.
> > > Purging
> > > a buffer that is shared would lead to data corruption for other
> > > clients
> > > that still hold a reference to it.
> > >=20
> > > The kernel cannot safely determine when all clients are done with
> > > a
> > > shared buffer, so shared BOs must never be marked DONTNEED or
> > > purged.
> > >=20
> > > The new helper is used in two key locations:
> > > 1.=C2=A0 In `xe_vm_madvise_purgeable_bo()`, to prevent userspace from
> > > =C2=A0=C2=A0=C2=A0=C2=A0 successfully marking a shared buffer as `DON=
TNEED`. This is
> > > the
> > > =C2=A0=C2=A0=C2=A0=C2=A0 primary safeguard against incorrect usage.
> > >=20
> > > 2.=C2=A0 In `xe_bo_move()`, as a final safety check before the kernel
> > > =C2=A0=C2=A0=C2=A0=C2=A0 initiates a purge during eviction. This ensu=
res that even if
> > > a
> > > =C2=A0=C2=A0=C2=A0=C2=A0 shared buffer were somehow marked `DONTNEED`=
, it would not
> > > be
> > > =C2=A0=C2=A0=C2=A0=C2=A0 purged.
> > >=20
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > > Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > > Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> > > ---
> > > =C2=A0 drivers/gpu/drm/xe/xe_bo.h | 30 ++++++++++++++++++++++++++++++
> > > =C2=A0 1 file changed, 30 insertions(+)
> > >=20
> > > diff --git a/drivers/gpu/drm/xe/xe_bo.h
> > > b/drivers/gpu/drm/xe/xe_bo.h
> > > index b0a31c77e612..97edb38bf1ed 100644
> > > --- a/drivers/gpu/drm/xe/xe_bo.h
> > > +++ b/drivers/gpu/drm/xe/xe_bo.h
> > > @@ -478,4 +478,34 @@ static inline bool xe_bo_is_mem_type(struct
> > > xe_bo *bo, u32 mem_type)
> > > =C2=A0=C2=A0	xe_bo_assert_held(bo);
> > > =C2=A0=C2=A0	return bo->ttm.resource->mem_type =3D=3D mem_type;
> > > =C2=A0 }
> > > +
> > > +/**
> > > + * xe_bo_is_shared_locked - Check if a buffer object is shared
> > > + * @bo: The buffer object to check
> > > + *
> > > + * Determines if a buffer object is considered shared, which
> > > includes:
> > > + * - Exported via dma-buf (obj->dma_buf is set)
> > > + * - Imported from another driver (obj->import_attach is set)
> > > + * - Referenced by multiple clients (handle_count > 1)
> > > + *
> > > + * This check is used to prevent data loss on shared content by
> > > avoiding
> > > + * certain operations like purging on buffers that other
> > > processes or
> > > + * drivers might still be using.
> > > + *
> > > + * Return: true if the buffer object is shared, false otherwise.
> > > + */
> > > +static inline bool xe_bo_is_shared_locked(const struct xe_bo
> > > *bo)
> > > +{
> > > +	const struct drm_gem_object *obj =3D &bo->ttm.base;
> > > +
> > It seems like everything below here should be a new drm gem helper.
> There is a DRM helper 'drm_gem_object_is_shared_for_memory_stats()',
> but=20
> it's
> specifically scoped for fdinfo memory accounting and doesn't check=20
> import_attach.
> > > +	dma_resv_assert_held(obj->resv);
> > > +
> > > +	if (obj->dma_buf || obj->import_attach)
> > > +		return true;
> > > +
> > > +	if (obj->handle_count > 1)
> > So this covers the case when we prime fd to handle but we resolve
> > to a
> > BO (i.e., we don't do a dma-buf attach, rather just take reference
> > on BO
> > as the BO is from the same device)? I just want to make sure I'm
> > understanding this part correctly. If so, maybe throw a comment in
> > here
> > or update the functions kernel doc a bit with a better
> > explaination.
> Yes, that's correct! The handle_count > 1 check covers exactly that=20
> scenario:
> When we do prime fd-to-handle but both processes are using the same
> xe=20
> device,
> we don't do a dma-buf attach. Instead, we just increment the
> reference=20
> count
> and handle_count on the same xe_bo.
> I will add and update the function with comments.

Arvind, Matt

I think the correct way to check purgability support for shared buffers
is to loop over all vmas attached to the bo and check that they all say
WONTNEED? If they don't, the bo is not purgeable. This will also need a
check at VMA unbinding.

/Thomas






>=20
> ~Arvind
> > Matt
> >=20
> > > +		return true;
> > > +
> > > +	return false;
> > > +}
> > > =C2=A0 #endif
> > > --=20
> > > 2.43.0
> > >=20

