Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3BDDD3EE75
	for <intel-xe@archiver.kernel.org>; Thu, 22 Jan 2026 15:06:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 877E110E9D7;
	Thu, 22 Jan 2026 15:06:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lgv+bSys";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C18A10E9DE
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Jan 2026 15:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769094361; x=1800630361;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Gr1PWYlpF0eocEBCUfx7my7RxiHacwkiBDNbAHzIySY=;
 b=Lgv+bSysHGn2S5//wYd5jmrto6DBet5S0fp3yjGpTGR1pQyVUSxW929F
 /TqSYIUTigygagu0fU/BZJAkL5qI4aeDDz9lGUR3LuSw57JBj79dI7QnM
 F3hQJqPUDZ94T/qSSZSImwqmTpSuQr2UtBzsJ4XeLrv36FC1a0M8XWvZE
 EIFyKGIlWMaUo+RiNDVFChUVZxrVghxRBmeInSsf57VZquyvluO/JHJZy
 vZd90V41L98HCeF5K2FWVT0dzzpZbCdXr9s3Enq6IWpfBqeGvxwcmPhcS
 Kz3fn8LxXvYiG0Q2X3TxPrzMuzeMfTFbi/FslVHPtVpFRMTYzhJfxj/Ne Q==;
X-CSE-ConnectionGUID: Yf7RITOBTTeby8kEdi4gHA==
X-CSE-MsgGUID: JGbJ0CdNRj6ZNdKIp9J2sQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="81780784"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="81780784"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 07:06:00 -0800
X-CSE-ConnectionGUID: CQakmkA4RNONycTsOgvPHQ==
X-CSE-MsgGUID: uJV0kdkRT2C72N6l3shGTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="210891371"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO [10.245.245.235])
 ([10.245.245.235])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 07:05:58 -0800
Message-ID: <90a89422ed4a6e007770d1f6e0fcaa4399044a62.camel@linux.intel.com>
Subject: Re: [PATCH v4 2/8] drm/xe/bo: Add purgeable bo state tracking and
 field madv to xe_bo
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, Arvind Yadav
 <arvind.yadav@intel.com>
Cc: intel-xe@lists.freedesktop.org, himal.prasad.ghimiray@intel.com, 
 pallavi.mishra@intel.com
Date: Thu, 22 Jan 2026 16:05:56 +0100
In-Reply-To: <aW+/LsX/Od66W8NX@lstrano-desk.jf.intel.com>
References: <20260120060900.3137984-1-arvind.yadav@intel.com>
 <20260120060900.3137984-3-arvind.yadav@intel.com>
 <aW+/LsX/Od66W8NX@lstrano-desk.jf.intel.com>
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

On Tue, 2026-01-20 at 09:45 -0800, Matthew Brost wrote:
> On Tue, Jan 20, 2026 at 11:38:48AM +0530, Arvind Yadav wrote:
> > Add infrastructure for tracking purgeable state of buffer objects.
> > This includes:
> >=20
> > Introduce enum xe_madv_purgeable_state with three states:
> > =C2=A0=C2=A0 - XE_MADV_PURGEABLE_WILLNEED (0): BO is needed and should =
not be
> > =C2=A0=C2=A0=C2=A0=C2=A0 purged. This is the default state for all BOs.
> >=20
> > =C2=A0=C2=A0 - XE_MADV_PURGEABLE_DONTNEED (1): BO is not currently need=
ed and
> > =C2=A0=C2=A0=C2=A0=C2=A0 can be purged by the kernel under memory press=
ure to reclaim
> > =C2=A0=C2=A0=C2=A0=C2=A0 resources. Only non-shared BOs can be marked a=
s DONTNEED.
> >=20
> > =C2=A0=C2=A0 - XE_MADV_PURGEABLE_PURGED (2): BO has been purged by the
> > kernel.
> > =C2=A0=C2=A0=C2=A0=C2=A0 Accessing a purged BO results in error. Follow=
s i915 semantics
> > =C2=A0=C2=A0=C2=A0=C2=A0 where once purged, the BO remains permanently =
invalid ("once
> > =C2=A0=C2=A0=C2=A0=C2=A0 purged, always purged").
> >=20
> > Add atomic_t madv field to struct xe_bo for state tracking
> > =C2=A0 of purgeable state across concurrent access paths
> >=20
> > v2:
> > =C2=A0 - Add xe_bo_is_purged() helper, improve state documentation
> >=20
> > v3:
> > =C2=A0 - Add the kernel doc(Matthew Brost)
> > =C2=A0 - Add the new helpers xe_bo_madv_is_dontneed(Matthew Brost)
> >=20
> > v4:
> > =C2=A0 - @madv_purgeable atomic_t =E2=86=92 u32 change across all relev=
ant
> > patches. (Matt)
> >=20
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> > ---
> > =C2=A0drivers/gpu/drm/xe/xe_bo.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | =
56
> > ++++++++++++++++++++++++++++++++
> > =C2=A0drivers/gpu/drm/xe/xe_bo_types.h |=C2=A0 3 ++
> > =C2=A02 files changed, 59 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_bo.h
> > b/drivers/gpu/drm/xe/xe_bo.h
> > index 8ab4474129c3..00e93b3065c9 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.h
> > +++ b/drivers/gpu/drm/xe/xe_bo.h
> > @@ -86,6 +86,28 @@
> > =C2=A0
> > =C2=A0#define XE_PCI_BARRIER_MMAP_OFFSET	(0x50 << XE_PTE_SHIFT)
> > =C2=A0
> > +/**
> > + * enum xe_madv_purgeable_state - Buffer object purgeable state
> > enumeration
> > + *
> > + * This enum defines the possible purgeable states for a buffer
> > object,
> > + * allowing userspace to provide memory usage hints to the kernel
> > for
> > + * better memory management under pressure.
> > + *
> > + * @XE_MADV_PURGEABLE_WILLNEED: The buffer object is needed and
> > should not be purged.
> > + * This is the default state.
> > + * @XE_MADV_PURGEABLE_DONTNEED: The buffer object is not currently
> > needed and can be
> > + * purged by the kernel under memory pressure.
> > + * @XE_MADV_PURGEABLE_PURGED: The buffer object has been purged by
> > the kernel.
> > + *
> > + * Accessing a purged buffer will result in an error. Per i915
> > semantics,
> > + * once purged, a BO remains permanently invalid and must be
> > destroyed and recreated.
> > + */
> > +enum xe_madv_purgeable_state {
> > +	XE_MADV_PURGEABLE_WILLNEED,
> > +	XE_MADV_PURGEABLE_DONTNEED,
> > +	XE_MADV_PURGEABLE_PURGED,
> > +};
> > +
> > =C2=A0struct sg_table;
> > =C2=A0
> > =C2=A0struct xe_bo *xe_bo_alloc(void);
> > @@ -214,6 +236,40 @@ static inline bool xe_bo_is_protected(const
> > struct xe_bo *bo)
> > =C2=A0	return bo->pxp_key_instance;
> > =C2=A0}
> > =C2=A0
> > +/**
> > + * xe_bo_is_purged() - Check if buffer object has been purged
> > + * @bo: The buffer object to check
> > + *
> > + * Checks if the buffer object's backing store has been discarded
> > by the
> > + * kernel due to memory pressure after being marked as purgeable
> > (DONTNEED).
> > + * Once purged, the BO cannot be restored and any attempt to use
> > it will fail.
> > + *
> > + * Context: Caller must hold the BO's dma-resv lock
> > + * Return: true if the BO has been purged, false otherwise
> > + */
> > +static inline bool xe_bo_is_purged(struct xe_bo *bo)
> > +{
> > +	xe_bo_assert_held(bo);
> > +	return bo->madv_purgeable =3D=3D XE_MADV_PURGEABLE_PURGED;
> > +}
> > +
> > +/**
> > + * xe_bo_madv_is_dontneed() - Check if BO is marked as DONTNEED
> > + * @bo: The buffer object to check
> > + *
> > + * Checks if userspace has marked this BO as DONTNEED (i.e., its
> > contents
> > + * are not currently needed and can be discarded under memory
> > pressure).
> > + * This is used internally to decide whether a BO is eligible for
> > purging.
> > + *
> > + * Context: Caller must hold the BO's dma-resv lock
> > + * Return: true if the BO is marked DONTNEED, false otherwise
> > + */
> > +static inline bool xe_bo_madv_is_dontneed(struct xe_bo *bo)
> > +{
> > +	xe_bo_assert_held(bo);
> > +	return bo->madv_purgeable =3D=3D XE_MADV_PURGEABLE_DONTNEED;
> > +}
> > +
> > =C2=A0static inline void xe_bo_unpin_map_no_vm(struct xe_bo *bo)
> > =C2=A0{
> > =C2=A0	if (likely(bo)) {
> > diff --git a/drivers/gpu/drm/xe/xe_bo_types.h
> > b/drivers/gpu/drm/xe/xe_bo_types.h
> > index d4fe3c8dca5b..6acfed0c0bb4 100644
> > --- a/drivers/gpu/drm/xe/xe_bo_types.h
> > +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> > @@ -108,6 +108,9 @@ struct xe_bo {
> > =C2=A0	 * from default
> > =C2=A0	 */
> > =C2=A0	u64 min_align;
> > +
> > +	/** @madv_purgeable: user space advise on BO purgeability
> > */
>=20
> , protected by BO's dma-resv lock.
>=20
> Everything else LGTM.

Agree, LGTM.

/Thomas


>=20
> Matt
>=20
> > +	u32 madv_purgeable;
> > =C2=A0};
> > =C2=A0
> > =C2=A0#endif
> > --=20
> > 2.43.0
> >=20
