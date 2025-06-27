Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39EDDC7EE31
	for <intel-xe@archiver.kernel.org>; Fri, 27 Jun 2025 13:47:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 030E310EA45;
	Fri, 27 Jun 2025 13:47:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mYRLqSz8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D866F10EA45
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Jun 2025 13:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751032040; x=1782568040;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=FGNwAabhQZ/vEi6IV1mcuhSUJcu4JWPX2VUmMtKeYBo=;
 b=mYRLqSz8lMwXYa/6hHvSO9YsdcsGG7UpRTckpCvzJo/eyLiWo4r7i/34
 mDSmQ5+j9ba/Vmu8DT9ln4vuPHiixOIdl8epAtsnQ8MF8uwHHxFTYnC0S
 Bg1FFI0GxaPef2/yYYQ8s2kN8BwWI8cs10KF0JZwI48ixHjymLHcAoJG/
 n8SVMHSx9OycQJ3Ny+oq+iQ0GGhoAys8fw9tzF7qQKGRycyPoi5uTFwnJ
 g3qOuQ56yCOTBZR+8ryijgGJNYzOIPiGoAREkzdtqpZK5Tc1SoexWP4gK
 bZybLJyzhWp75MhBVPEE87ZzkviLwkDDPYmoKM3ZzHTTAj62MwqPcpYZL g==;
X-CSE-ConnectionGUID: e2WRPruWQqCLSeCxlJRHww==
X-CSE-MsgGUID: 40BfAXKVSGWc/IjkmFLJHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="57151032"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="57151032"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 06:47:19 -0700
X-CSE-ConnectionGUID: 3Hx18DTLQXmK/SaheWwShA==
X-CSE-MsgGUID: Zav53Nk2S7Ww/5PJdGy66g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="152206606"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO [10.245.245.93])
 ([10.245.245.93])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 06:47:18 -0700
Message-ID: <0716a0368c6606a473b70b9db023d2b77c495e40.camel@linux.intel.com>
Subject: Re: [PATCH v4 02/20] drm/xe/uapi: Add madvise interface
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, Matthew
 Brost	 <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, =?ISO-8859-1?Q?Jos=E9?= Roberto de Souza
 <jose.souza@intel.com>
Date: Fri, 27 Jun 2025 15:47:14 +0200
In-Reply-To: <53291701-bd80-4813-bc4f-11b8e2ecd8d5@intel.com>
References: <20250613125558.2607665-1-himal.prasad.ghimiray@intel.com>
 <20250613125558.2607665-3-himal.prasad.ghimiray@intel.com>
 <aFjYdUYGIazU3XZZ@lstrano-desk.jf.intel.com>
 <53291701-bd80-4813-bc4f-11b8e2ecd8d5@intel.com>
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

On Mon, 2025-06-23 at 11:50 +0530, Ghimiray, Himal Prasad wrote:
>=20
>=20
> On 23-06-2025 10:00, Matthew Brost wrote:
> > On Fri, Jun 13, 2025 at 06:25:40PM +0530, Himal Prasad Ghimiray
> > wrote:
> > > This commit introduces a new madvise interface to support
> > > driver-specific ioctl operations. The madvise interface allows
> > > for more
> > > efficient memory management by providing hints to the driver
> > > about the
> > > expected memory usage and pte update policy for gpuvma.
> > >=20
> > > v2 (Matthew/Thomas)
> > > - Drop num_ops support
> > > - Drop purgeable support
> > > - Add kernel-docs
> > > - IOWR/IOW
> > >=20
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Signed-off-by: Himal Prasad Ghimiray
> > > <himal.prasad.ghimiray@intel.com>
> > > Acked-by: Jos=C3=A9 Roberto de Souza <jose.souza@intel.com>
> > > ---
> > > =C2=A0 include/uapi/drm/xe_drm.h | 118
> > > ++++++++++++++++++++++++++++++++++++++
> > > =C2=A0 1 file changed, 118 insertions(+)
> > >=20
> > > diff --git a/include/uapi/drm/xe_drm.h
> > > b/include/uapi/drm/xe_drm.h
> > > index 6a702ba7817c..b5f8d11faaa8 100644
> > > --- a/include/uapi/drm/xe_drm.h
> > > +++ b/include/uapi/drm/xe_drm.h
> > > @@ -81,6 +81,7 @@ extern "C" {
> > > =C2=A0=C2=A0 *=C2=A0 - &DRM_IOCTL_XE_EXEC
> > > =C2=A0=C2=A0 *=C2=A0 - &DRM_IOCTL_XE_WAIT_USER_FENCE
> > > =C2=A0=C2=A0 *=C2=A0 - &DRM_IOCTL_XE_OBSERVATION
> > > + *=C2=A0 - &DRM_IOCTL_XE_MADVISE
> > > =C2=A0=C2=A0 */
> > > =C2=A0=20
> > > =C2=A0 /*
> > > @@ -102,6 +103,7 @@ extern "C" {
> > > =C2=A0 #define DRM_XE_EXEC			0x09
> > > =C2=A0 #define DRM_XE_WAIT_USER_FENCE		0x0a
> > > =C2=A0 #define DRM_XE_OBSERVATION		0x0b
> > > +#define DRM_XE_MADVISE			0x0c
> > > =C2=A0=20
> > > =C2=A0 /* Must be kept compact -- no holes */
> > > =C2=A0=20
> > > @@ -117,6 +119,7 @@ extern "C" {
> > > =C2=A0 #define
> > > DRM_IOCTL_XE_EXEC			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, structdrm=
_xe_exec)
> > > =C2=A0 #define
> > > DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT=
_USER_FENCE,structdrm_xe_wait_user_fence)
> > > =C2=A0 #define
> > > DRM_IOCTL_XE_OBSERVATION		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OBSERVATI=
ON,structdrm_xe_observation_param)
> > > +#define
> > > DRM_IOCTL_XE_MADVISE			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_MADVISE,stru=
ctdrm_xe_madvise)
> > > =C2=A0=20
> > > =C2=A0 /**
> > > =C2=A0=C2=A0 * DOC: Xe IOCTL Extensions
> > > @@ -1970,6 +1973,121 @@ struct drm_xe_query_eu_stall {
> > > =C2=A0=C2=A0	__u64 sampling_rates[];
> > > =C2=A0 };
> > > =C2=A0=20
> > > +/**
> > > + * struct drm_xe_madvise - Input of &DRM_IOCTL_XE_MADVISE
> > > + *
> > > + * This structure is used to set memory attributes for a virtual
> > > address range
> > > + * in a VM. The type of attribute is specified by @type, and the
> > > corresponding
> > > + * union member is used to provide additional parameters for
> > > @type.
> > > + *
> > > + * Supported attribute types:
> > > + * - DRM_XE_VMA_ATTR_PREFERRED_LOC: Set preferred memory
> > > location.
> > > + * - DRM_XE_VMA_ATTR_ATOMIC: Set atomic access policy.
> > > + * - DRM_XE_VMA_ATTR_PAT: Set page attribute table index.
> > > + *
> > > + * Example:
> > > + *
> > > + * .. code-block:: C
> > > + *
> > > + * struct drm_xe_madvise madvise =3D {
> > > + * =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .vm_id =3D vm_id=
,
> > > + * =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .start =3D 0x100=
000,
> > > + * =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .range =3D 0x200=
0,
> > > + * =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .type =3D DRM_XE=
_VMA_ATTR_ATOMIC,
> > > + * =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .atomic_val =3D =
DRM_XE_VMA_ATOMIC_DEVICE,
> > > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
> > > + *
> > > + * ioctl(fd, DRM_IOCTL_XE_MADVISE, &madvise);
> > > + *
> > > + */
> > > +struct drm_xe_madvise {
> > > +	/** @extensions: Pointer to the first extension struct,
> > > if any */
> > > +	__u64 extensions;
> > > +
> > > +	/** @start: start of the virtual address range */
> > > +	__u64 start;
> > > +
> > > +	/** @size: size of the virtual address range */
> > > +	__u64 range;
> > > +
> > > +	/** @vm_id: vm_id of the virtual range */
> > > +	__u32 vm_id;
> > > +
> > > +#define DRM_XE_VMA_ATTR_PREFERRED_LOC	0
> > > +#define DRM_XE_VMA_ATTR_ATOMIC		1
> > > +#define DRM_XE_VMA_ATTR_PAT		2
> > > +	/** @type: type of attribute */
> > > +	__u32 type;
> > > +
> > > +	union {
> >=20
> > Nit: I'd make this union is same order as the defines (e.g.,
> > preferred location
> > first, atomic second, pat third).
>=20
> sure
>=20
> >=20
> > > +		/**
> > > +		 * @atomic: Atomic access policy
> > > +		 *
> > > +		 * Used when @type =3D=3D DRM_XE_VMA_ATTR_ATOMIC.
> > > +		 *
> > > +		 * Supported values for @atomic.val:
> > > +		 * - DRM_XE_VMA_ATOMIC_UNDEFINED: Undefined or
> > > default behaviour
> > > +		 *=C2=A0=C2=A0 Support both GPU and CPU atomic operations
> > > for system allocator
> > > +		 *=C2=A0=C2=A0 Support GPU atomic operations for
> > > normal(bo) allocator
> > > +		 * - DRM_XE_VMA_ATOMIC_DEVICE: Support GPU
> > > atomic operations
> > > +		 * - DRM_XE_VMA_ATOMIC_GLOBAL: Support both GPU
> > > and CPU atomic operations
> > > +		 * - DRM_XE_VMA_ATOMIC_CPU: Support CPU atomic
> > > +		 */
> > > +		struct {
> > > +#define DRM_XE_VMA_ATOMIC_UNDEFINED	0
> > > +#define DRM_XE_VMA_ATOMIC_DEVICE	1
> > > +#define DRM_XE_VMA_ATOMIC_GLOBAL	2
> > > +#define DRM_XE_VMA_ATOMIC_CPU		3
> > > +			/** @atomic.val: value of atomic
> > > operation */
> > > +			__u32 val;
> > > +
> > > +			/** @atomic.reserved: Reserved */
> > > +			__u32 reserved;
> > > +		} atomic;
> > > +
> > > +		/**
> > > +		 * @pat_index: Page attribute table index
> > > +		 *
> > > +		 * Used when @type =3D=3D DRM_XE_VMA_ATTR_PAT.
> > > +		 */
> > > +		struct {
> > > +			/** @pat_index.val: PAT index value */
> > > +			__u32 val;
> > > +
> > > +			/** @pat_index.reserved: Reserved */
> > > +			__u32 reserved;
> > > +		} pat_index;
> > > +
> > > +		/**
> > > +		 * @preferred_mem_loc: preferred memory location
> > > +		 *
> > > +		 * Used when @type =3D=3D
> > > DRM_XE_VMA_ATTR_PREFERRED_LOC
> > > +		 *
> > > +		 * Supported values for
> > > @preferred_mem_loc.devmem_fd:
> > > +		 * - DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE: set
> > > vram of faulting tile as preferred loc
> > > +		 * - DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM: set
> > > smem as preferred loc
> > > +		 *
> > > +		 * Supported values for
> > > @preferred_mem_loc.migration_policy:
> > > +		 * - DRM_XE_MIGRATE_ALL_PAGES
> > > +		 * - DRM_XE_MIGRATE_ONLY_SYSTEM_PAGES
> > > +		 */
> > > +		struct {
> > > +#define DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE	0
> > > +#define DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM	-1
> > > +			/** @preferred_mem_loc.devmem_fd: fd for
> > > preferred loc */
> > > +			__u32 devmem_fd;
> > > +
> > > +#define DRM_XE_MIGRATE_ALL_PAGES		0
> > > +#define DRM_XE_MIGRATE_ONLY_SYSTEM_PAGES	1
> >=20
> > I'd double check with Thomas / maintainers if they want this
> > (migration_policy)
> > to be included in this version as still more or less unused in this
> > series.

I think if UMD wants it now to distinguish between VRAM and system
that's fine. I think we'd want to add another op or an extension for
multi-device and any advanced migration strategies UMD would want us to
support. If UMD doesn't use this now at all, we'd need to leave it out
for now.

/Thomas


>=20
> Sure
>=20
> >=20
> > > +			/** @preferred_mem_loc.migration_policy:
> > > Page migration policy */
> > > +			__u32 migration_policy;
> >=20
> > Could we future proof a little, maybe migration_policy is a __u16
> > (or __u8?) and
> > stick a reserved __u16 in here?
>=20
> OK
>=20
> >=20
> > Matt
> >=20
> > > +		} preferred_mem_loc;
> > > +	};
> > > +
> > > +	/** @reserved: Reserved */
> > > +	__u64 reserved[2];
> > > +};
> > > +
> > > =C2=A0 #if defined(__cplusplus)
> > > =C2=A0 }
> > > =C2=A0 #endif
> > > --=20
> > > 2.34.1
> > >=20
>=20
>=20

