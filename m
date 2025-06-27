Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3863C7EE31
	for <intel-xe@archiver.kernel.org>; Fri, 27 Jun 2025 13:20:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63DC810EA22;
	Fri, 27 Jun 2025 13:20:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sp6kXLmG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E214F10EA22
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Jun 2025 13:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751030422; x=1782566422;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=D2fW7hPv6aZjzHPfoWcqI/Z3qPXy/Kg7SMNa0QhdmbQ=;
 b=Sp6kXLmG1tApbxk0vQXdIBNcpwYtx3PSgL7znjJfYth7jTo4J79GVFrN
 jFxBAfnrJWPOgaHdUFP31SZgqoUSrKQrDhBOT1s6LsidGl+NcrGg/7IZN
 zElqz4p9u8TEgFFK8NR3mup0wz2kfMniw53Ys0YQCgFR6YO/n56UNnDmH
 8BCoh53nfB8cSUabNutVnCDSCytGRwIMJBVuViIMXO7u9YkVwspp1r+ZG
 5X62C5/mfDj13VhNL4GZBLYmtpFSJTsqlEP68CMDH1LQW6ouD2JLkkpQG
 /XjG5AAfVm6Nlf8JPxouyOLXuO6ZiB8lcVSeZVMRBVtqj2V1MTDW/AhmC g==;
X-CSE-ConnectionGUID: muyEJ7swSYeTe8Y+1PvaFQ==
X-CSE-MsgGUID: p2WE71l1QXu+lz1fgOcu8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="57124852"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="57124852"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 06:20:22 -0700
X-CSE-ConnectionGUID: X9SbA59vTge7Nz2c8Q4uNQ==
X-CSE-MsgGUID: sSOPTIAXSlKTsyu6NLA1xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="153518902"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO [10.245.245.93])
 ([10.245.245.93])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 06:20:19 -0700
Message-ID: <10a3618313f0324c36bf922cb38a57cc23f9b82d.camel@linux.intel.com>
Subject: Re: [PATCH v4 19/20] drm/xe/uapi: Add UAPI for querying VMA count
 and memory attributes
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 27 Jun 2025 15:20:16 +0200
In-Reply-To: <aFoK/ldaqoZFBRw0@lstrano-desk.jf.intel.com>
References: <20250613125558.2607665-1-himal.prasad.ghimiray@intel.com>
 <20250613125558.2607665-20-himal.prasad.ghimiray@intel.com>
 <aFoK/ldaqoZFBRw0@lstrano-desk.jf.intel.com>
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

On Mon, 2025-06-23 at 19:18 -0700, Matthew Brost wrote:
> On Fri, Jun 13, 2025 at 06:25:57PM +0530, Himal Prasad Ghimiray
> wrote:
> > Introduce the DRM_IOCTL_XE_VM_QUERY_VMAS_ATTRS ioctl to allow
> > userspace
> > to query memory attributes of VMAs within a specified virtual
> > address
> > range.
> > If num_vmas =3D=3D 0 and vector_of_vma_mem_attr =3D=3D NULL, the ioctl
> > returns
> > the number of VMAs in the specified range.
> > If num_vmas > 0 and a valid user pointer is provided in
> > vector_of_vma_mem_attr, the ioctl fills the buffer with memory
> > attributes for each VMA.
> > This two-step interface allows userspace to first query the
> > required
> > buffer size, then retrieve detailed attributes efficiently.
> >=20
> > v2 (Matthew Brost)
> > - Use same ioctl to overload functionality
> >=20
> > v3
> > - Add kernel-doc
> >=20
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Signed-off-by: Himal Prasad Ghimiray
> > <himal.prasad.ghimiray@intel.com>
> > ---
> > =C2=A0drivers/gpu/drm/xe/xe_device.c |=C2=A0=C2=A0 1 +
> > =C2=A0drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 89 +++=
+++++++++++++++++++
> > =C2=A0drivers/gpu/drm/xe/xe_vm.h=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 =
2 +-
> > =C2=A0include/uapi/drm/xe_drm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 130
> > +++++++++++++++++++++++++++++++++
> > =C2=A04 files changed, 221 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_device.c
> > b/drivers/gpu/drm/xe/xe_device.c
> > index 632d3ab12392..1f9969acbcd9 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -199,6 +199,7 @@ static const struct drm_ioctl_desc xe_ioctls[]
> > =3D {
> > =C2=A0			=C2=A0 DRM_RENDER_ALLOW),
> > =C2=A0	DRM_IOCTL_DEF_DRV(XE_OBSERVATION, xe_observation_ioctl,
> > DRM_RENDER_ALLOW),
> > =C2=A0	DRM_IOCTL_DEF_DRV(XE_MADVISE, xe_vm_madvise_ioctl,
> > DRM_RENDER_ALLOW),
> > +	DRM_IOCTL_DEF_DRV(XE_VM_QUERY_VMAS_ATTRS,
> > xe_vm_query_vmas_attrs_ioctl, DRM_RENDER_ALLOW),
> > =C2=A0};
> > =C2=A0
> > =C2=A0static long xe_drm_ioctl(struct file *file, unsigned int cmd,
> > unsigned long arg)
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c
> > b/drivers/gpu/drm/xe/xe_vm.c
> > index 14e554f3f4d5..d9ce25f3abf4 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -2171,6 +2171,95 @@ int xe_vm_destroy_ioctl(struct drm_device
> > *dev, void *data,
> > =C2=A0	return err;
> > =C2=A0}
> > =C2=A0
> > +static void xe_vm_query_vmas(struct xe_vm *vm, u32 *num_vmas, u64
> > start, u64 end)
> > +{
> > +	struct drm_gpuva *gpuva;
> > +
> > +	lockdep_assert_held(&vm->lock);
> > +	drm_gpuvm_for_each_va_range(gpuva, &vm->gpuvm, start, end)
> > +		(*num_vmas)++;
> > +}
> > +
> > +static int get_mem_attrs(struct xe_vm *vm, u32 *num_vmas, u64
> > start,
> > +			 u64 end, struct drm_xe_vma_mem_attr
> > *attrs)
> > +{
> > +	struct drm_gpuva *gpuva;
> > +	int i =3D 0;
> > +
> > +	lockdep_assert_held(&vm->lock);
> > +
> > +	drm_gpuvm_for_each_va_range(gpuva, &vm->gpuvm, start, end)
> > {
> > +		struct xe_vma *vma =3D gpuva_to_vma(gpuva);
> > +
> > +		if (i =3D=3D *num_vmas)
> > +			return -EINVAL;
> > +
> > +		attrs[i].start =3D xe_vma_start(vma);
> > +		attrs[i].end =3D xe_vma_end(vma);
> > +		attrs[i].atomic.val =3D vma->attr.atomic_access;
> > +		attrs[i].pat_index.val =3D vma->attr.pat_index;
> > +		attrs[i].preferred_mem_loc.devmem_fd =3D vma-
> > >attr.preferred_loc.devmem_fd;
> > +		attrs[i].preferred_mem_loc.migration_policy =3D vma-
> > >attr.preferred_loc.migration_policy;
> > +
> > +		i++;
> > +	}
> > +
> > +	if (i <=C2=A0 (*num_vmas - 1))
> > +		*num_vmas =3D i;
> > +	return 0;
> > +}
> > +
> > +int xe_vm_query_vmas_attrs_ioctl(struct drm_device *dev, void
> > *data, struct drm_file *file)
> > +{
> > +	struct xe_device *xe =3D to_xe_device(dev);
> > +	struct xe_file *xef =3D to_xe_file(file);
> > +	struct drm_xe_vma_mem_attr *mem_attrs;
> > +	struct drm_xe_vm_query_vmas_attr *args =3D data;
> > +	u64 __user *attrs_user =3D u64_to_user_ptr(args-
> > >vector_of_vma_mem_attr);
> > +	struct xe_vm *vm;
> > +	int err =3D 0;
> > +
> > +	if (XE_IOCTL_DBG(xe,
> > +			 (args->num_vmas =3D=3D 0 && attrs_user) ||
> > +			(args->num_vmas > 0 && !attrs_user)))
> > +		return -EINVAL;
> > +
> > +	vm =3D xe_vm_lookup(xef, args->vm_id);
> > +	if (XE_IOCTL_DBG(xe, !vm))
> > +		return -EINVAL;
> > +
> > +	down_read(&vm->lock);
> > +
> > +	attrs_user =3D u64_to_user_ptr(args-
> > >vector_of_vma_mem_attr);
> > +
> > +	if (args->num_vmas =3D=3D 0 && !attrs_user) {
> > +		xe_vm_query_vmas(vm, &args->num_vmas, args->start,
> > args->start + args->range);
> > +		goto unlock_vm;
> > +	}
> > +
> > +	mem_attrs =3D kvmalloc_array(args->num_vmas, sizeof(struct
> > drm_xe_vma_mem_attr),
> > +				=C2=A0=C2=A0 GFP_KERNEL | __GFP_ACCOUNT |
> > +				=C2=A0=C2=A0 __GFP_RETRY_MAYFAIL |
> > __GFP_NOWARN);
> > +	if (!mem_attrs) {
> > +		err =3D args->num_vmas > 1 ? -ENOBUFS : -ENOMEM;
> > +		goto unlock_vm;
> > +	}
> > +
> > +	err =3D get_mem_attrs(vm, &args->num_vmas, args->start,
> > +			=C2=A0=C2=A0=C2=A0 args->start + args->range, mem_attrs);
> > +	if (err)
> > +		goto free_mem_attrs;
> > +
> > +	err =3D __copy_to_user(attrs_user, mem_attrs,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0 sizeof(struct drm_xe_vma_mem_attr) *
> > args->num_vmas);
> > +
> > +free_mem_attrs:
> > +	kvfree(mem_attrs);
> > +unlock_vm:
> > +	up_read(&vm->lock);
> > +	return err;
> > +}
> > +
> > =C2=A0static bool vma_matches(struct xe_vma *vma, u64 page_addr)
> > =C2=A0{
> > =C2=A0	if (page_addr > xe_vma_end(vma) - 1 ||
> > diff --git a/drivers/gpu/drm/xe/xe_vm.h
> > b/drivers/gpu/drm/xe/xe_vm.h
> > index 1fb639a33ffb..e4a601a3583f 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.h
> > +++ b/drivers/gpu/drm/xe/xe_vm.h
> > @@ -195,7 +195,7 @@ int xe_vm_destroy_ioctl(struct drm_device *dev,
> > void *data,
> > =C2=A0			struct drm_file *file);
> > =C2=A0int xe_vm_bind_ioctl(struct drm_device *dev, void *data,
> > =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_file *file);
> > -
> > +int xe_vm_query_vmas_attrs_ioctl(struct drm_device *dev, void
> > *data, struct drm_file *file);
> > =C2=A0void xe_vm_close_and_put(struct xe_vm *vm);
> > =C2=A0
> > =C2=A0static inline bool xe_vm_in_fault_mode(struct xe_vm *vm)
> > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > index 81e90270313d..c0aa7c19870e 100644
> > --- a/include/uapi/drm/xe_drm.h
> > +++ b/include/uapi/drm/xe_drm.h
> > @@ -82,6 +82,7 @@ extern "C" {
> > =C2=A0 *=C2=A0 - &DRM_IOCTL_XE_WAIT_USER_FENCE
> > =C2=A0 *=C2=A0 - &DRM_IOCTL_XE_OBSERVATION
> > =C2=A0 *=C2=A0 - &DRM_IOCTL_XE_MADVISE
> > + *=C2=A0 - &DRM_IOCTL_XE_VM_QUERY_VMAS_ATTRS
> > =C2=A0 */
> > =C2=A0
> > =C2=A0/*
> > @@ -104,6 +105,7 @@ extern "C" {
> > =C2=A0#define DRM_XE_WAIT_USER_FENCE		0x0a
> > =C2=A0#define DRM_XE_OBSERVATION		0x0b
> > =C2=A0#define DRM_XE_MADVISE			0x0c
> > +#define DRM_XE_VM_QUERY_VMAS_ATTRS	0x0d
> > =C2=A0
> > =C2=A0/* Must be kept compact -- no holes */
> > =C2=A0
> > @@ -120,6 +122,7 @@ extern "C" {
> > =C2=A0#define
> > DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_U=
SER_FENCE,structdrm_xe_wait_user_fence)
> > =C2=A0#define
> > DRM_IOCTL_XE_OBSERVATION		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OBSERVATION=
,structdrm_xe_observation_param)
> > =C2=A0#define
> > DRM_IOCTL_XE_MADVISE			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_MADVISE, struc=
tdrm_xe_madvise)
> > +#define
> > DRM_IOCTL_XE_VM_QUERY_VMAS_ATTRS	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_=
QUERY_VMAS_ATTRS,structdrm_xe_vm_query_vmas_attr)
> > =C2=A0
> > =C2=A0/**
> > =C2=A0 * DOC: Xe IOCTL Extensions
> > @@ -2093,6 +2096,133 @@ struct drm_xe_madvise {
> > =C2=A0	__u64 reserved[2];
> > =C2=A0};
> > =C2=A0
> > +/**
> > + * struct drm_xe_vma_mem_attr - Output of
> > &DRM_IOCTL_XE_VM_QUERY_VMAS_ATTRS
> > + *
> > + * This structure is provided by userspace and filled by KMD in
> > response to the
> > + * DRM_IOCTL_XE_VM_QUERY_VMAS_ATTRS ioctl. It describes memory
> > attributes of
> > + * a VMA within a specified address range in a VM.
> > + *
> > + * The structure includes information such as atomic access
> > policy, purgeable
> > + * state, page attribute table (PAT) index, and preferred memory
> > location.
> > + * Userspace allocates an array of these structures and passes a
> > pointer to the
> > + * ioctl to retrieve attributes for each VMA
> > + *
> > + * @extensions: Pointer to the first extension struct, if any
> > + * @start: Start address of the virtual memory area
> > + * @end: End address of the virtual memory area
> > + *
> > + * @atomic.val: Value of atomic operation policy
> > + * @atomic.reserved: Reserved, must be zero
> > + *
> > + * @purge_state_val.val: Value for DRM_XE_VMA_ATTR_PURGEABLE_STATE
> > + * @purge_state_val.reserved: Reserved, must be zero
> > + *
> > + * @pat_index.val: Page Attribute Table (PAT) index
> > + * @pat_index.reserved: Reserved, must be zero
> > + *
> > + * @preferred_mem_loc.devmem_fd: File descriptor for preferred
> > device memory
> > + * @preferred_mem_loc.migration_policy: Migration policy for
> > memory placement
> > + *
> > + */
> > +struct drm_xe_vma_mem_attr {
> > +	 /** @extensions: Pointer to the first extension struct,
> > if any */
> > +	__u64 extensions;
> > +
> > +	/** @start: start of the vma */
> > +	__u64 start;
> > +
> > +	/** @end: end of the vma */
> > +	__u64 end;
> > +
> > +	struct {
> > +		struct {
> > +		/** @atomic.val: atomic attribute for vma*/
> > +			__u32 val;
> > +
> > +		/** @atomic.reserved: Reserved */
> > +			__u32 reserved;
> > +		} atomic;
> > +
> > +		struct {
> > +			/** @pat_index.val: PAT index of vma */
> > +			__u32 val;
> > +
> > +			/** @pat_index.reserved: Reserved */
> > +			__u32 reserved;
> > +		} pat_index;
> > +
> > +		/** @preferred_mem_loc: preferred memory location
> > */
> > +		struct {
> > +			/** @preferred_mem_loc.devmem_fd: fd for
> > preferred loc */
> > +			__u32 devmem_fd;
> > +
> > +			/** @preferred_mem_loc.migration_policy:
> > Page migration policy */
> > +			__u32 migration_policy;
> > +		} preferred_mem_loc;
> > +	};
>=20
> I just realized this interface isn=E2=80=99t very future-proof. Let me gi=
ve
> an
> easy example of how this could break. Let=E2=80=99s say we add three more
> madvise attributes at some point in the future =E2=80=94 we wouldn=E2=80=
=99t be able
> to
> fit those three additional attributes here.
>=20
> Hmm, maybe in drm_xe_vm_query_vmas_attr we could also return the
> sizeof
> a single struct drm_xe_vma_mem_attr entry. That would allow us to
> grow
> individual entries indefinitely without breaking userspace, as long
> as
> it does something like the code below, and as long as we only grow
> struct drm_xe_vm_query_vmas_attr by appending new fields (i.e. we
> never
> reorder existing ones).
>=20
> struct drm_xe_vm_query_vmas_attr query =3D {
> =C2=A0=C2=A0=C2=A0 .vm_id =3D vm,
> =C2=A0=C2=A0=C2=A0 .start =3D start,
> =C2=A0=C2=A0=C2=A0 .range =3D range,
> };
>=20
> /* First ioctl to get number of VMAs and the size of each attribute
> */
> ioctl(fd, DRM_IOCTL_XE_VM_QUERY_VMAS_ATTRS, &query);
>=20
> /* Allocate buffer for the VMA attributes */
> void *ptr =3D malloc(query.num_vmas * query.sizeof_vma_mem_attr);
>=20
> query.vector_of_vma_mem_attr =3D (uintptr_t)ptr;
>=20
> /* Second ioctl to actually fill the VMA attributes */
> ioctl(fd, DRM_IOCTL_XE_VM_QUERY_VMAS_ATTRS, &query);
>=20
> /* Iterate over the returned VMA attributes */
> for (unsigned int i =3D 0; i < query.num_vmas; ++i) {
> =C2=A0=C2=A0=C2=A0 struct drm_xe_vma_mem_attr *vma_attr =3D (struct
> drm_xe_vma_mem_attr *)ptr;
>=20
> =C2=A0=C2=A0=C2=A0 /* Do something with vma_attr */
>=20
> =C2=A0=C2=A0=C2=A0 /* Move pointer by one VMA entry */
> =C2=A0=C2=A0=C2=A0 ptr +=3D query.sizeof_vma_mem_attr;
> }
>=20
> I think we need to double-check with the maintainer to see if this
> type
> of interface is allowed, but I don=E2=80=99t see any reason why it wouldn=
=E2=80=99t
> be.

Please check how this is handled in the other query ioctls, that is
when the total size of the number of items return exceeds the space
reserved for them.

I think we do something like Matt describes, calling twice.

/Thomas



>=20
> Matt
>=20
> > +
> > +	 /** @reserved: Reserved */
> > +	__u64 reserved[2];
> > +};
> > +
> > +/**
> > + * struct drm_xe_vm_query_vmas_attr - Input of
> > &DRM_IOCTL_XE_VM_QUERY_MEM_ATTRIBUTES
> > + *
> > + * This structure is used to query memory attributes of virtual
> > memory areas
> > + * (VMAs) within a specified address range in a VM. It provides
> > detailed
> > + * information about each VMA, including atomic access policy,
> > purgeable state,
> > + * page attribute table (PAT) index, and preferred memory
> > location.
> > + *
> > + * Userspace first calls the ioctl with @num_vmas =3D 0 and
> > + * @vector_of_vma_mem_attr =3D NULL to retrieve the number of VMAs
> > in the range.
> > + * Then, it allocates a buffer of that size and calls the ioctl
> > again to fill
> > + * the buffer with VMA attributes.
> > + *
> > + * Example:
> > + *
> > + * .. code-block:: C
> > + *
> > + *=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_xe_vma_mem_attr *attrs;
> > + *=C2=A0=C2=A0=C2=A0=C2=A0 __u32 num_vmas;
> > + *
> > + *=C2=A0=C2=A0=C2=A0=C2=A0 // First call to get number of VMAs
> > + *=C2=A0=C2=A0=C2=A0=C2=A0 ioctl(fd, DRM_IOCTL_XE_VM_QUERY_VMAS_ATTRS,=
 &query);
> > + *=C2=A0=C2=A0=C2=A0=C2=A0 num_vmas =3D query.num_vmas;
> > + *
> > + *=C2=A0=C2=A0=C2=A0=C2=A0 // Allocate and query attributes
> > + *=C2=A0=C2=A0=C2=A0=C2=A0 attrs =3D malloc(num_vmas, sizeof(*attrs));
> > + *=C2=A0=C2=A0=C2=A0=C2=A0 query.vector_of_vma_mem_attr =3D (__u64)(ui=
ntptr_t)attrs;
> > + *=C2=A0=C2=A0=C2=A0=C2=A0 query.num_vmas =3D num_vmas;
> > + *=C2=A0=C2=A0=C2=A0=C2=A0 ioctl(fd, DRM_IOCTL_XE_VM_QUERY_VMAS_ATTRS,=
 &query);
> > + */
> > +struct drm_xe_vm_query_vmas_attr {
> > +	/** @extensions: Pointer to the first extension struct, if
> > any */
> > +	__u64 extensions;
> > +
> > +	/** @vm_id: vm_id of the virtual range */
> > +	__u32 vm_id;
> > +
> > +	/** @num_vmas: number of vmas in range */
> > +	__u32 num_vmas;
> > +
> > +	/** @start: start of the virtual address range */
> > +	__u64 start;
> > +
> > +	/** @size: size of the virtual address range */
> > +	__u64 range;
> > +
> > +	/**
> > +	 * @vector_of_ops: userptr to array of struct
> > +	 * drm_xe_vma_mem_attr
> > +	 */
> > +	__u64 vector_of_vma_mem_attr;
> > +
> > +	/** @reserved: Reserved */
> > +	__u64 reserved[2];
> > +
> > +};
> > +
> > =C2=A0#if defined(__cplusplus)
> > =C2=A0}
> > =C2=A0#endif
> > --=20
> > 2.34.1
> >=20

