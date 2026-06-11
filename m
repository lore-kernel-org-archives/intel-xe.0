Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 563A2CD98CE
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jun 2026 14:09:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0399310EF50;
	Thu, 11 Jun 2026 14:09:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hud9iiyz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48BBD10EF50
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jun 2026 14:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781186990; x=1812722990;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=6IsuKw0bBOrtcyCSs93WMhL19+37CQE3kaLggWc0u3Y=;
 b=hud9iiyzU7dXJ7S74c/xfhBDEjjjVMX9DUEj5wJs7kOxaF429tcQ4Xud
 PNTo1qiuKLfO3bcp/zDRtYwJzrFqiLdId6uy11sn6SyApoG7CNWDTbqpg
 w4UyGVF2CBrlvXL3oq3gs2lGo9+hVVsVkhwpMDMp7QhTOi+y31MVSRZD6
 kSmbCFjzHeE3lrsPgZAwSeesMMGiOusF0TbM8xZarzFKLkyGnXVeOitz4
 uj7tg3+rVGOTJhjONle70w+PLICcBP8XGfUndQPfnupN6zEDIWVKjcv1b
 eDXekjakrLc36Os0pmhu03GTUQP3MSmKsOQEm+wm/1+/G8p+6uepLf5w6 A==;
X-CSE-ConnectionGUID: htsXKNWASTiHnbtDpvTVNg==
X-CSE-MsgGUID: PN4yYfofRwmR54iVMTP4ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="82045355"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; d="scan'208";a="82045355"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 07:09:50 -0700
X-CSE-ConnectionGUID: LBhT/5HqStu0nO8ad/Beog==
X-CSE-MsgGUID: mn/++YxQTV++xM8IpKhgLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; d="scan'208";a="251581604"
Received: from amilburn-desk.amilburn-desk (HELO [10.245.244.169])
 ([10.245.244.169])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 07:09:49 -0700
Message-ID: <43c31bca8f6f8fded74c5610aa20059958e74394.camel@linux.intel.com>
Subject: Re: [RFC PATCH 1/2] drm/gpusvm: Add a DMA-mapping accounting callback
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 11 Jun 2026 16:09:46 +0200
In-Reply-To: <aiq933i+fJm2a/Fb@gsse-cloud1.jf.intel.com>
References: <20260610133451.8930-1-thomas.hellstrom@linux.intel.com>
 <aimExeYtw8KZBsUq@gsse-cloud1.jf.intel.com>
 <aa4085faf0ff44e161a034e58a5150989ca6bf65.camel@linux.intel.com>
 <aiq933i+fJm2a/Fb@gsse-cloud1.jf.intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
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

On Thu, 2026-06-11 at 06:53 -0700, Matthew Brost wrote:
> On Thu, Jun 11, 2026 at 09:42:01AM +0200, Thomas Hellstr=C3=B6m wrote:
> > On Wed, 2026-06-10 at 08:37 -0700, Matthew Brost wrote:
> > > On Wed, Jun 10, 2026 at 03:34:50PM +0200, Thomas Hellstr=C3=B6m wrote=
:
> > > > Drivers that use the GPU SVM core to DMA-map system memory for
> > > > GPU
> > > > access may want to keep track of how many pages they have
> > > > mapped,
> > > > for
> > > > example to expose statistics or to detect leaks. Doing this
> > > > accounting
> > > > in the driver around drm_gpusvm_get_pages() /
> > > > drm_gpusvm_unmap_pages()
> > > > is error prone: the number, order and kind of the dma_addr[]
> > > > entries can
> > > > change between map and unmap (migration, partial unmaps, the
> > > > iova
> > > > vs
> > > > non-iova paths), which makes symmetric accounting hard to get
> > > > right.
> > > >=20
> > > > Add an optional @dma_map_account callback to struct
> > > > drm_gpusvm_ops
> > > > and
> > > > invoke it once per &drm_pagemap_addr entry at the exact points
> > > > where the
> > > > entry is DMA-mapped (sign =3D=3D +1) in drm_gpusvm_get_pages() and
> > > > unmapped
> > > > (sign =3D=3D -1) in __drm_gpusvm_unmap_pages(). Since the map error
> > > > path and
> > > > every unmap/free path funnel through __drm_gpusvm_unmap_pages()
> > > > for
> > > > the
> > > > entries that were actually mapped, the accounting is symmetric
> > > > by
> > > > construction. The callback receives the full &drm_pagemap_addr
> > > > so
> > > > the
> > > > driver can use the order and the proto field to distinguish
> > > > system
> > > > memory mappings from device interconnect mappings.
> > > >=20
> > > > The callback must also be usable by the core drm_gpusvm_pages-
> > > > only
> > > > API
> > > > (mm =3D=3D NULL), as used e.g. for userptr-style mappings. Relax
> > > > drm_gpusvm_init() to allow such users to pass a restricted @ops
> > > > that
> > > > only implements the page-level hooks; the full-SVM hooks
> > > > (@invalidate)
> > > > and the chunk configuration must still be unset in that mode.
> > > >=20
> > > > Assisted-by: GitHub_Copilot:claude-opus-4.8
> > > > Signed-off-by: Thomas Hellstr=C3=B6m
> > > > <thomas.hellstrom@linux.intel.com>
> > > > ---
> > > > =C2=A0drivers/gpu/drm/drm_gpusvm.c | 17 +++++++++++++++--
> > >=20
> > > I believe this makes sense and is useful for debugging/profiling
> > > =E2=80=94
> > > the
> > > same applies to the next patch.
> > >=20
> > > I do have a question, though: drm_pagemap also performs DMA
> > > mapping
> > > for
> > > migrations. Should we include those in the accounting as well, or
> > > was
> > > there a reason this was intentionally omitted?
> >=20
> > SVM migration was initially intentionally omitted, because the
> > primary
> > intention here is to debug UMD size-aligning's influence on the
> > number
> > of 2M pages we get.
> >=20
> > But for completeness before we merge this we might want to add the
> > transient migration entries as well.
> >=20
>=20
> This makes sense. However, one benefit of including transient DMA
> mappings in the stats is that if we leak a DMA mapping, a warning
> will
> appear when the driver is unloaded.
>=20
> Either option works in my opinion, but if transient DMA mappings are
> omitted, please mention this in the commit message letter.
>=20
> So for this version /w an updated commit message:
> Revieved-by: Matthew Brost <matthew.brost@intel.com.

Thanks. There is also still a unit bug in this version. All units are
in 4K bytes, not (4K << order) bytes.

/Thomas



>=20
> > We might also want to add similar stats for the PPGTT PTE sizes.
> >=20
>=20
> Yes, that is probably a good idea but PPGTT is per-user/VM, so unsure
> if
> global stats make sense there. IIRC at one point we had a patch to
> dump
> VM's via debugfs, we could look at reviving that.
>=20
> Matt
> =C2=A0
> > Thanks,
> > Thomas
> >=20
> >=20
> >=20
> > >=20
> > > Matt
> > >=20
> > > > =C2=A0include/drm/drm_gpusvm.h=C2=A0=C2=A0=C2=A0=C2=A0 | 19 +++++++=
++++++++++++
> > > > =C2=A02 files changed, 34 insertions(+), 2 deletions(-)
> > > >=20
> > > > diff --git a/drivers/gpu/drm/drm_gpusvm.c
> > > > b/drivers/gpu/drm/drm_gpusvm.c
> > > > index 958cb605aedd..c18f15c77e94 100644
> > > > --- a/drivers/gpu/drm/drm_gpusvm.c
> > > > +++ b/drivers/gpu/drm/drm_gpusvm.c
> > > > @@ -393,8 +393,15 @@ int drm_gpusvm_init(struct drm_gpusvm
> > > > *gpusvm,
> > > > =C2=A0			return -EINVAL;
> > > > =C2=A0		mmgrab(mm);
> > > > =C2=A0	} else {
> > > > -		/* No full SVM mode, only core
> > > > drm_gpusvm_pages
> > > > API. */
> > > > -		if (ops || num_chunks || mm_range ||
> > > > notifier_size)
> > > > +		/*
> > > > +		 * No full SVM mode, only core
> > > > drm_gpusvm_pages
> > > > API. A
> > > > +		 * restricted @ops that only implements the
> > > > page-
> > > > level hooks
> > > > +		 * (e.g. @dma_map_account) is allowed; the
> > > > full-
> > > > SVM hooks must
> > > > +		 * not be set.
> > > > +		 */
> > > > +		if (num_chunks || mm_range || notifier_size)
> > > > +			return -EINVAL;
> > > > +		if (ops && ops->invalidate)
> > > > =C2=A0			return -EINVAL;
> > > > =C2=A0	}
> > > > =C2=A0
> > > > @@ -1162,6 +1169,8 @@ static void
> > > > __drm_gpusvm_unmap_pages(struct
> > > > drm_gpusvm *gpusvm,
> > > > =C2=A0			else if (dpagemap && dpagemap->ops-
> > > > > device_unmap)
> > > > =C2=A0				dpagemap->ops-
> > > > > device_unmap(dpagemap,
> > > > =C2=A0							=C2=A0=C2=A0=C2=A0
> > > > dev,
> > > > addr);
> > > > +			if (gpusvm->ops && gpusvm->ops-
> > > > > dma_map_account)
> > > > +				gpusvm->ops-
> > > > > dma_map_account(gpusvm, addr, -1);
> > > > =C2=A0			i +=3D 1 << addr->order;
> > > > =C2=A0		}
> > > > =C2=A0
> > > > @@ -1584,6 +1593,10 @@ int drm_gpusvm_get_pages(struct
> > > > drm_gpusvm
> > > > *gpusvm,
> > > > =C2=A0				(addr,
> > > > DRM_INTERCONNECT_SYSTEM,
> > > > order,
> > > > =C2=A0				 dma_dir);
> > > > =C2=A0		}
> > > > +		if (gpusvm->ops && gpusvm->ops-
> > > > >dma_map_account)
> > > > +			gpusvm->ops->dma_map_account(gpusvm,
> > > > +						=C2=A0=C2=A0=C2=A0=C2=A0
> > > > &svm_pages-
> > > > > dma_addr[j],
> > > > +						=C2=A0=C2=A0=C2=A0=C2=A0 1);
> > > > =C2=A0		i +=3D 1 << order;
> > > > =C2=A0		num_dma_mapped =3D i;
> > > > =C2=A0		flags.has_dma_mapping =3D true;
> > > > diff --git a/include/drm/drm_gpusvm.h
> > > > b/include/drm/drm_gpusvm.h
> > > > index 8a4d7134a9a7..87ad2dcaa7c4 100644
> > > > --- a/include/drm/drm_gpusvm.h
> > > > +++ b/include/drm/drm_gpusvm.h
> > > > @@ -75,6 +75,25 @@ struct drm_gpusvm_ops {
> > > > =C2=A0	void (*invalidate)(struct drm_gpusvm *gpusvm,
> > > > =C2=A0			=C2=A0=C2=A0 struct drm_gpusvm_notifier
> > > > *notifier,
> > > > =C2=A0			=C2=A0=C2=A0 const struct mmu_notifier_range
> > > > *mmu_range);
> > > > +
> > > > +	/**
> > > > +	 * @dma_map_account: Account a DMA-mapping change
> > > > (optional)
> > > > +	 * @gpusvm: Pointer to the GPU SVM
> > > > +	 * @addr: The address descriptor of the chunk being
> > > > (un)mapped
> > > > +	 * @sign: +1 when @addr has just been DMA-mapped, -1
> > > > when
> > > > it is being
> > > > +	 *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unmapped
> > > > +	 *
> > > > +	 * Called once per &drm_pagemap_addr entry, when the
> > > > entry
> > > > is
> > > > +	 * DMA-mapped by drm_gpusvm_get_pages() (@sign =3D=3D +1)
> > > > and
> > > > when it is
> > > > +	 * unmapped (@sign =3D=3D -1), so the driver can keep
> > > > symmetric accounting
> > > > +	 * of the pages it has mapped for GPU access. The
> > > > @addr-
> > > > > proto field
> > > > +	 * can be used to distinguish system-memory mappings
> > > > from
> > > > device
> > > > +	 * interconnect mappings. May be provided in both full
> > > > SVM
> > > > mode and the
> > > > +	 * core drm_gpusvm_pages-only mode.
> > > > +	 */
> > > > +	void (*dma_map_account)(struct drm_gpusvm *gpusvm,
> > > > +				const struct drm_pagemap_addr
> > > > *addr,
> > > > +				int sign);
> > > > =C2=A0};
> > > > =C2=A0
> > > > =C2=A0/**
> > > > --=20
> > > > 2.54.0
> > > >=20
