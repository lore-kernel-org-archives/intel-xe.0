Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20A9FC77B7F
	for <intel-xe@archiver.kernel.org>; Fri, 27 Jun 2025 14:29:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6FFC10E322;
	Fri, 27 Jun 2025 14:29:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gm5MEYs1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D489410E322
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Jun 2025 14:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751034548; x=1782570548;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=lY5thLXbj17N+RX0pqfYo4kIDapsy9PFTah1vS9YyTQ=;
 b=Gm5MEYs1MJP4Qpid0Ch7BpQ0DRyc8hU2jbiI53BozAhoBxYuvcD4A0Zq
 PzW+NYKwz/1sSextfwr4GmFNceRFXpzIakBGO9wbQ1TgiJIOnO+IK8ExE
 6qEZ8ihtzX69VNY7QF31FmL0zepVj7bZgR6rwhf8jNbMyOQUqSHrYGIgM
 zgzgezVjPfrVCf6BbbIvyTvXCGjYgQVRbIufAy+lTKhTXzwNvJ0LmU419
 JZOpqZsq10pp4py2l6p++So0m0onS2krDnbjaeSgWaZuLE76elO1PGwZp
 dPJuxaybVbalRqF8Rf25P6uGn8S5VNnhAHcv/GDrk1qy2JaviipM8Hkjl Q==;
X-CSE-ConnectionGUID: cUyDD7lCQHyTiMUFp4nhcA==
X-CSE-MsgGUID: Hf7Hj4fYTc6Pvo/TRoIczA==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="75896204"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="75896204"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 07:29:07 -0700
X-CSE-ConnectionGUID: 3yMObefARgiD9/QF+51ARg==
X-CSE-MsgGUID: HbDTWz5ZQvO1Upim0MJCZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="152557321"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO [10.245.245.93])
 ([10.245.245.93])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 07:29:06 -0700
Message-ID: <644dbb1d98220f9e3c8044829fc7f95580c2eae1.camel@linux.intel.com>
Subject: Re: [PATCH v4 02/20] drm/xe/uapi: Add madvise interface
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org, =?ISO-8859-1?Q?Jos=E9?= Roberto de Souza
 <jose.souza@intel.com>
Date: Fri, 27 Jun 2025 16:29:02 +0200
In-Reply-To: <aFjYdUYGIazU3XZZ@lstrano-desk.jf.intel.com>
References: <20250613125558.2607665-1-himal.prasad.ghimiray@intel.com>
 <20250613125558.2607665-3-himal.prasad.ghimiray@intel.com>
 <aFjYdUYGIazU3XZZ@lstrano-desk.jf.intel.com>
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

On Sun, 2025-06-22 at 21:30 -0700, Matthew Brost wrote:
> On Fri, Jun 13, 2025 at 06:25:40PM +0530, Himal Prasad Ghimiray
> wrote:
> > This commit introduces a new madvise interface to support
> > driver-specific ioctl operations. The madvise interface allows for
> > more
> > efficient memory management by providing hints to the driver about
> > the
> > expected memory usage and pte update policy for gpuvma.
> >=20
> > v2 (Matthew/Thomas)
> > - Drop num_ops support
> > - Drop purgeable support
> > - Add kernel-docs
> > - IOWR/IOW
> >=20
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Signed-off-by: Himal Prasad Ghimiray
> > <himal.prasad.ghimiray@intel.com>
> > Acked-by: Jos=C3=A9 Roberto de Souza <jose.souza@intel.com>
> > ---
> > =C2=A0include/uapi/drm/xe_drm.h | 118
> > ++++++++++++++++++++++++++++++++++++++
> > =C2=A01 file changed, 118 insertions(+)
> >=20
> > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > index 6a702ba7817c..b5f8d11faaa8 100644
> > --- a/include/uapi/drm/xe_drm.h
> > +++ b/include/uapi/drm/xe_drm.h
> > @@ -81,6 +81,7 @@ extern "C" {
> > =C2=A0 *=C2=A0 - &DRM_IOCTL_XE_EXEC
> > =C2=A0 *=C2=A0 - &DRM_IOCTL_XE_WAIT_USER_FENCE
> > =C2=A0 *=C2=A0 - &DRM_IOCTL_XE_OBSERVATION
> > + *=C2=A0 - &DRM_IOCTL_XE_MADVISE
> > =C2=A0 */
> > =C2=A0
> > =C2=A0/*
> > @@ -102,6 +103,7 @@ extern "C" {
> > =C2=A0#define DRM_XE_EXEC			0x09
> > =C2=A0#define DRM_XE_WAIT_USER_FENCE		0x0a
> > =C2=A0#define DRM_XE_OBSERVATION		0x0b
> > +#define DRM_XE_MADVISE			0x0c
> > =C2=A0
> > =C2=A0/* Must be kept compact -- no holes */
> > =C2=A0
> > @@ -117,6 +119,7 @@ extern "C" {
> > =C2=A0#define
> > DRM_IOCTL_XE_EXEC			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_=
xe_exec)
> > =C2=A0#define
> > DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_U=
SER_FENCE,structdrm_xe_wait_user_fence)
> > =C2=A0#define
> > DRM_IOCTL_XE_OBSERVATION		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OBSERVATION=
,structdrm_xe_observation_param)
> > +#define
> > DRM_IOCTL_XE_MADVISE			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_MADVISE, struc=
tdrm_xe_madvise)
> > =C2=A0
> > =C2=A0/**
> > =C2=A0 * DOC: Xe IOCTL Extensions
> > @@ -1970,6 +1973,121 @@ struct drm_xe_query_eu_stall {
> > =C2=A0	__u64 sampling_rates[];
> > =C2=A0};
> > =C2=A0
> > +/**
> > + * struct drm_xe_madvise - Input of &DRM_IOCTL_XE_MADVISE
> > + *
> > + * This structure is used to set memory attributes for a virtual
> > address range
> > + * in a VM. The type of attribute is specified by @type, and the
> > corresponding
> > + * union member is used to provide additional parameters for
> > @type.
> > + *
> > + * Supported attribute types:
> > + * - DRM_XE_VMA_ATTR_PREFERRED_LOC: Set preferred memory location.
> > + * - DRM_XE_VMA_ATTR_ATOMIC: Set atomic access policy.
> > + * - DRM_XE_VMA_ATTR_PAT: Set page attribute table index.
> > + *
> > + * Example:
> > + *
> > + * .. code-block:: C
> > + *
> > + * struct drm_xe_madvise madvise =3D {
> > + * =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .vm_id =3D vm_id,
> > + * =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .start =3D 0x10000=
0,
> > + * =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .range =3D 0x2000,
> > + * =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .type =3D DRM_XE_V=
MA_ATTR_ATOMIC,
> > + * =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .atomic_val =3D DR=
M_XE_VMA_ATOMIC_DEVICE,
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
> > + *
> > + * ioctl(fd, DRM_IOCTL_XE_MADVISE, &madvise);
> > + *
> > + */
> > +struct drm_xe_madvise {
> > +	/** @extensions: Pointer to the first extension struct, if
> > any */
> > +	__u64 extensions;
> > +
> > +	/** @start: start of the virtual address range */
> > +	__u64 start;
> > +
> > +	/** @size: size of the virtual address range */
> > +	__u64 range;
> > +
> > +	/** @vm_id: vm_id of the virtual range */
> > +	__u32 vm_id;
> > +
> > +#define DRM_XE_VMA_ATTR_PREFERRED_LOC	0
> > +#define DRM_XE_VMA_ATTR_ATOMIC		1
> > +#define DRM_XE_VMA_ATTR_PAT		2
> > +	/** @type: type of attribute */
> > +	__u32 type;
> > +
> > +	union {
>=20
> Nit: I'd make this union is same order as the defines (e.g.,
> preferred location
> first, atomic second, pat third).
>=20
> > +		/**
> > +		 * @atomic: Atomic access policy
> > +		 *
> > +		 * Used when @type =3D=3D DRM_XE_VMA_ATTR_ATOMIC.
> > +		 *
> > +		 * Supported values for @atomic.val:
> > +		 * - DRM_XE_VMA_ATOMIC_UNDEFINED: Undefined or
> > default behaviour
> > +		 *=C2=A0=C2=A0 Support both GPU and CPU atomic operations
> > for system allocator
> > +		 *=C2=A0=C2=A0 Support GPU atomic operations for normal(bo)
> > allocator
> > +		 * - DRM_XE_VMA_ATOMIC_DEVICE: Support GPU atomic
> > operations
> > +		 * - DRM_XE_VMA_ATOMIC_GLOBAL: Support both GPU
> > and CPU atomic operations
> > +		 * - DRM_XE_VMA_ATOMIC_CPU: Support CPU atomic
> > +		 */
> > +		struct {
> > +#define DRM_XE_VMA_ATOMIC_UNDEFINED	0
> > +#define DRM_XE_VMA_ATOMIC_DEVICE	1
> > +#define DRM_XE_VMA_ATOMIC_GLOBAL	2
> > +#define DRM_XE_VMA_ATOMIC_CPU		3
> > +			/** @atomic.val: value of atomic operation
> > */
> > +			__u32 val;
> > +
> > +			/** @atomic.reserved: Reserved */
> > +			__u32 reserved;
> > +		} atomic;
> > +
> > +		/**
> > +		 * @pat_index: Page attribute table index
> > +		 *
> > +		 * Used when @type =3D=3D DRM_XE_VMA_ATTR_PAT.
> > +		 */
> > +		struct {
> > +			/** @pat_index.val: PAT index value */
> > +			__u32 val;
> > +
> > +			/** @pat_index.reserved: Reserved */
> > +			__u32 reserved;
> > +		} pat_index;
> > +
> > +		/**
> > +		 * @preferred_mem_loc: preferred memory location
> > +		 *
> > +		 * Used when @type =3D=3D
> > DRM_XE_VMA_ATTR_PREFERRED_LOC
> > +		 *
> > +		 * Supported values for
> > @preferred_mem_loc.devmem_fd:
> > +		 * - DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE: set vram
> > of faulting tile as preferred loc
> > +		 * - DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM: set smem
> > as preferred loc
> > +		 *
> > +		 * Supported values for
> > @preferred_mem_loc.migration_policy:
> > +		 * - DRM_XE_MIGRATE_ALL_PAGES
> > +		 * - DRM_XE_MIGRATE_ONLY_SYSTEM_PAGES
> > +		 */
> > +		struct {
> > +#define DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE	0
> > +#define DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM	-1
> > +			/** @preferred_mem_loc.devmem_fd: fd for
> > preferred loc */
> > +			__u32 devmem_fd;
> > +
> > +#define DRM_XE_MIGRATE_ALL_PAGES		0
> > +#define DRM_XE_MIGRATE_ONLY_SYSTEM_PAGES	1
>=20
> I'd double check with Thomas / maintainers if they want this
> (migration_policy)
> to be included in this version as still more or less unused in this
> series.
>=20
> > +			/** @preferred_mem_loc.migration_policy:
> > Page migration policy */
> > +			__u32 migration_policy;
>=20
> Could we future proof a little, maybe migration_policy is a __u16 (or
> __u8?) and
> stick a reserved __u16 in here?
>=20
> Matt

Yeah, I think we need to have a strategy for extensions here. Perhaps
we could add new madvise types by extending the union and add
additional types, but then I think we need to expand the union size to
accomodate reasonable future additions.

Additions could also be made using extensions, so that if a suitable
extension is present, the union is never used?

/Thomas



>=20
> > +		} preferred_mem_loc;
> > +	};
> > +
> > +	/** @reserved: Reserved */
> > +	__u64 reserved[2];
> > +};
> > +
> > =C2=A0#if defined(__cplusplus)
> > =C2=A0}
> > =C2=A0#endif
> > --=20
> > 2.34.1
> >=20

