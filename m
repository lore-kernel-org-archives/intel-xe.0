Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDE46C77B7F
	for <intel-xe@archiver.kernel.org>; Fri, 27 Jun 2025 14:32:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87F8610E327;
	Fri, 27 Jun 2025 14:32:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y5eiaXtg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 795B610E327
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Jun 2025 14:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751034727; x=1782570727;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=UOTLYjD1quG9ON5WPqJWpWZNiK3otAjoxmDOF03UDx4=;
 b=Y5eiaXtg1Gmu2uaXaKFZuRFWm3DzJwKAvWJ99GtFL0+WiZVIVl5b9AK8
 uk6M5nwF2U7osmoI7Gzv5a1JBppKXDQe7AuYnf+OmIgaspQxwWN8IfPND
 7GCwueypegi9yHdApM7qWiCqvt6H3OkAiePeqDRyHEKR6KM/ncoZtY5QT
 Oo5Bi+y5IJuZk92Tmrgfeod/zArQnIL92gDKkXz9t6EO4yx7lyOkSdRPW
 N9rWUvCnHzd4VnkHN5BzqEVs4virwfqf5pkFS6PNridct7PQ4EnVIMSh6
 stRy9Xycb4ziIaBpYhkFtHpDCh9muJPbDzQqphJ8gqhY3LOig49DIrE+x A==;
X-CSE-ConnectionGUID: hg1R20lYSA6H/btZktOe9g==
X-CSE-MsgGUID: Wp0ITJXXRaeCtEZe4FphNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="75896575"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="75896575"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 07:32:06 -0700
X-CSE-ConnectionGUID: 1rcWGL/aSTSlxNy53AVUQA==
X-CSE-MsgGUID: FyvtlfknQCiwUQ29e9f4eQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="153532858"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO [10.245.245.93])
 ([10.245.245.93])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 07:32:05 -0700
Message-ID: <08393f11d4416659f565011d94c0f40bc96e3dc9.camel@linux.intel.com>
Subject: Re: [PATCH v4 03/20] drm/xe/vm: Add attributes struct as member of vma
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 27 Jun 2025 16:32:01 +0200
In-Reply-To: <aFjVisKVDa1g5THP@lstrano-desk.jf.intel.com>
References: <20250613125558.2607665-1-himal.prasad.ghimiray@intel.com>
 <20250613125558.2607665-4-himal.prasad.ghimiray@intel.com>
 <aFjVisKVDa1g5THP@lstrano-desk.jf.intel.com>
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

On Sun, 2025-06-22 at 21:18 -0700, Matthew Brost wrote:
> On Fri, Jun 13, 2025 at 06:25:41PM +0530, Himal Prasad Ghimiray
> wrote:
> > The attribute of xe_vma will determine the migration policy and the
> > encoding of the page table entries (PTEs) for that vma.
> > This attribute helps manage how memory pages are moved and how
> > their
> > addresses are translated. It will be used by madvise to set the
> > behavior of the vma.
> >=20
> > v2 (Matthew Brost)
> > - Add docs
> >=20
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Signed-off-by: Himal Prasad Ghimiray
> > <himal.prasad.ghimiray@intel.com>
> > ---
> > =C2=A0drivers/gpu/drm/xe/xe_vm_types.h | 28 +++++++++++++++++++++++++++=
+
> > =C2=A01 file changed, 28 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
> > b/drivers/gpu/drm/xe/xe_vm_types.h
> > index bed6088e1bb3..c7663058a7e3 100644
> > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > @@ -77,6 +77,27 @@ struct xe_userptr {
> > =C2=A0#endif
> > =C2=A0};
> > =C2=A0
> > +/**
> > + * struct xe_vma_mem_attr - memory attributes associated with vma
> > + */
> > +struct xe_vma_mem_attr {
> > +	/** @preferred_loc: perferred memory_location*/
> > +	struct {
> > +		/** @preferred_loc.migration_policy: Policy for
> > migration of pages */
> > +		u32 migration_policy;
> > +
> > +		/**
> > +		 * @preferred_loc.devmem_fd: used for determining
> > pagemap_fd requested by user
> > +		 * DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM and
> > DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE mean
> > +		 * system memory or closest device memory
> > respectively.
>=20
> Nit, I generally prefer 80 character line wraps. I know checkpatch
> allows 100 but in general I think Xe generally wraps at 80 unless it
> is
> an odd case with nested code and an 80 character wrap makes the code
> unreadable.
>=20
> 80 generally allows 2 windows split vertically in vi on a typical
> laptop
> which makes navigating the code a bit easier.
>=20
> > +		 */
> > +		u32 devmem_fd;
> > +	} preferred_loc;
> > +
> > +	/** @atomic_access: The atomic access type for the vma */
>=20
> I'd reference the uAPI here. e.g., DRM_XE_VMA_ATOMIC_*

+1.

>=20
> With the minor nits fixed:
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>

Also with those fixes, feel free to add
Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

>=20
> Matt
>=20
> > +	u32 atomic_access;
> > +};
> > +
> > =C2=A0struct xe_vma {
> > =C2=A0	/** @gpuva: Base GPUVA object */
> > =C2=A0	struct drm_gpuva gpuva;
> > @@ -135,6 +156,13 @@ struct xe_vma {
> > =C2=A0	 * Needs to be signalled before UNMAP can be processed.
> > =C2=A0	 */
> > =C2=A0	struct xe_user_fence *ufence;
> > +
> > +	/**
> > +	 * @attr: The attributes of vma which determines the
> > migration policy
> > +	 * and encoding of the PTEs for this vma.
> > +	 */
> > +	struct xe_vma_mem_attr attr;
> > +
> > =C2=A0};
> > =C2=A0
> > =C2=A0/**
> > --=20
> > 2.34.1
> >=20

