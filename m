Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9E17CAC592
	for <intel-xe@archiver.kernel.org>; Mon, 22 Sep 2025 11:09:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AD2110E41B;
	Mon, 22 Sep 2025 11:09:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dbizUZWw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10F1510E41B
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Sep 2025 11:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758539361; x=1790075361;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=h/36iT+32KLsNbfjElsjqPxdlYVhyh0XrJRDufppvVw=;
 b=dbizUZWwYKJ/E3ZmBKMmMkr+i67lTgvWCWYGzGfivSgmNuYBinsco/lH
 w9WGEEF0NqcLYuXrDoP8B6EMKZcqbdRp/JNym6V46AJsbALzhc1kPIfpC
 qtRqrfkzjb+6a7dqSnEunPUVUOx/arnEYrQIrupyHnhZeQBvMrXmze0rM
 tibA/ThNDYcusBDZpKaA3oyz0OGZFG36A9/qQOKUTWjlmzBS2hSFm4oZ9
 jD4AJFRnJYv4+Obw8N5gp6Gh8qxoXzKZ6BbX+nvEndG7ACx5OEhk+WuSf
 GuUOG7dchDwk1PoI0Ih6X2FKyMR6/eWqC+zEZOhlWr3Q4FgEn8ULOhrbf A==;
X-CSE-ConnectionGUID: zOzuQU8ASTyWbhOaeeAh/A==
X-CSE-MsgGUID: wLuDLusiQAe8hciSGOKk3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11560"; a="86233707"
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; d="scan'208";a="86233707"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 04:09:20 -0700
X-CSE-ConnectionGUID: +q+VGBZgTZ6IzU6qP9kNCQ==
X-CSE-MsgGUID: lW23Ug1PTBioLifsBpYH9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; d="scan'208";a="175587682"
Received: from rvuia-mobl.ger.corp.intel.com (HELO [10.245.244.93])
 ([10.245.244.93])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 04:09:18 -0700
Message-ID: <a390df38c880bdbd163d9c5efd6d418d29df2259.camel@linux.intel.com>
Subject: Re: [PATCH 2/2] drm/xe/uapi: Enable madvise to pass multiple pat
 indeces
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>, 
 intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
Date: Mon, 22 Sep 2025 13:09:15 +0200
In-Reply-To: <20250918080003.153906-3-himal.prasad.ghimiray@intel.com>
References: <20250918080003.153906-1-himal.prasad.ghimiray@intel.com>
 <20250918080003.153906-3-himal.prasad.ghimiray@intel.com>
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

On Thu, 2025-09-18 at 13:30 +0530, Himal Prasad Ghimiray wrote:
> Allow users to pass multiple PAT indices via madvise, which can be
> used
> to encode PTEs based on the actual memory location system memory,
> local
> VRAM, or remote GPU memory.
>=20
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Himal Prasad Ghimiray
> <himal.prasad.ghimiray@intel.com>

Based on the feedback from UMD, it might make sense to add two special
values,
XE_PAT_INDEX_INITIAL - that sets  the pat index to the initial value of
the VM_BIND
XE_PAT_INDEX_KEEP - Keep the current value.

And then we perhaps we can use __s16 values where needed.
Let's see where the discussion lands. If we're not able to resolve this
before your vacation, I can pick up the patches from where you left
off.

Thanks,
Thomas



> ---
> =C2=A0drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 7 +++--
> =C2=A0drivers/gpu/drm/xe/xe_vm_madvise.c | 33 ++++++++++++++++-------
> =C2=A0include/uapi/drm/xe_drm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 42 +++++++++++++++++++++++++---
> --
> =C2=A03 files changed, 62 insertions(+), 20 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 6122061786f6..a4906ae94bd4 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2003,10 +2003,9 @@ static int get_mem_attrs(struct xe_vm *vm, u32
> *num_vmas, u64 start,
> =C2=A0		attrs[i].start =3D xe_vma_start(vma);
> =C2=A0		attrs[i].end =3D xe_vma_end(vma);
> =C2=A0		attrs[i].atomic.val =3D vma->attr.atomic_access;
> -
> -		/* TODO: Modify drm_xe_mem_range_attr for all pats
> */
> -		attrs[i].pat_index.val =3D vma-
> >attr.pat_index.initial;
> -
> +		attrs[i].pat_index.smem =3D vma->attr.pat_index.smem;
> +		attrs[i].pat_index.devmem =3D vma-
> >attr.pat_index.devmem;
> +		attrs[i].pat_index.remote =3D vma-
> >attr.pat_index.remote;
> =C2=A0		attrs[i].preferred_mem_loc.devmem_fd =3D vma-
> >attr.preferred_loc.devmem_fd;
> =C2=A0		attrs[i].preferred_mem_loc.migration_policy =3D
> =C2=A0		vma->attr.preferred_loc.migration_policy;
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c
> b/drivers/gpu/drm/xe/xe_vm_madvise.c
> index e3f0cf23a3a9..3116036e6d24 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -149,16 +149,15 @@ static void madvise_pat_index(struct xe_device
> *xe, struct xe_vm *vm,
> =C2=A0	xe_assert(vm->xe, op->type =3D=3D DRM_XE_MEM_RANGE_ATTR_PAT);
> =C2=A0
> =C2=A0	for (i =3D 0; i < num_vmas; i++) {
> -		/*TODO : Pass different pat_indexes from ioctl */
> -		if (vmas[i]->attr.pat_index.smem =3D=3D op-
> >pat_index.val &&
> -		=C2=A0=C2=A0=C2=A0 vmas[i]->attr.pat_index.devmem =3D=3D op-
> >pat_index.val &&
> -		=C2=A0=C2=A0=C2=A0 vmas[i]->attr.pat_index.remote =3D=3D op-
> >pat_index.val) {
> +		if (vmas[i]->attr.pat_index.smem =3D=3D op-
> >pat_index.smem &&
> +		=C2=A0=C2=A0=C2=A0 vmas[i]->attr.pat_index.devmem =3D=3D op-
> >pat_index.devmem &&
> +		=C2=A0=C2=A0=C2=A0 vmas[i]->attr.pat_index.remote =3D=3D op-
> >pat_index.remote) {
> =C2=A0			vmas[i]->skip_invalidation =3D true;
> =C2=A0		} else {
> =C2=A0			vmas[i]->skip_invalidation =3D false;
> -			vmas[i]->attr.pat_index.smem =3D op-
> >pat_index.val;
> -			vmas[i]->attr.pat_index.devmem =3D op-
> >pat_index.val;
> -			vmas[i]->attr.pat_index.remote =3D=C2=A0 op-
> >pat_index.val;
> +			vmas[i]->attr.pat_index.smem =3D op-
> >pat_index.smem;
> +			vmas[i]->attr.pat_index.devmem =3D op-
> >pat_index.devmem;
> +			vmas[i]->attr.pat_index.remote =3D=C2=A0 op-
> >pat_index.remote;
> =C2=A0		}
> =C2=A0	}
> =C2=A0}
> @@ -273,12 +272,26 @@ static bool madvise_args_are_sane(struct
> xe_device *xe, const struct drm_xe_madv
> =C2=A0		break;
> =C2=A0	case DRM_XE_MEM_RANGE_ATTR_PAT:
> =C2=A0	{
> -		u16 coh_mode =3D xe_pat_index_get_coh_mode(xe, args-
> >pat_index.val);
> +		u16 coh_mode_smem =3D xe_pat_index_get_coh_mode(xe,
> args->pat_index.smem);
> +		u16 coh_mode_devmem =3D xe_pat_index_get_coh_mode(xe,
> args->pat_index.devmem);
> +		u16 coh_mode_remote =3D xe_pat_index_get_coh_mode(xe,
> args->pat_index.remote);
> =C2=A0
> -		if (XE_IOCTL_DBG(xe, !coh_mode))
> +		if (XE_IOCTL_DBG(xe, !coh_mode_smem))
> =C2=A0			return false;
> =C2=A0
> -		if (XE_WARN_ON(coh_mode > XE_COH_AT_LEAST_1WAY))
> +		if (XE_IOCTL_DBG(xe, !coh_mode_devmem))
> +			return false;
> +
> +		if (XE_IOCTL_DBG(xe, !coh_mode_remote))
> +			return false;
> +
> +		if (XE_WARN_ON(coh_mode_smem >
> XE_COH_AT_LEAST_1WAY))
> +			return false;
> +
> +		if (XE_WARN_ON(coh_mode_devmem >
> XE_COH_AT_LEAST_1WAY))
> +			return false;
> +
> +		if (XE_WARN_ON(coh_mode_remote >
> XE_COH_AT_LEAST_1WAY))
> =C2=A0			return false;
> =C2=A0
> =C2=A0		if (XE_IOCTL_DBG(xe, args->pat_index.pad))
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 40ff19f52a8d..09d9a9cf02e8 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -2101,11 +2101,26 @@ struct drm_xe_madvise {
> =C2=A0		 * Used when @type =3D=3D DRM_XE_MEM_RANGE_ATTR_PAT.
> =C2=A0		 */
> =C2=A0		struct {
> -			/** @pat_index.val: PAT index value */
> -			__u32 val;
> +			/**
> +			 * @pat_index.smem: PAT index value to be
> used when
> +			 * location is system memory during GPU
> access time.
> +			 */
> +			__u16 smem;
> +
> +			/**
> +			 * @pat_index.devmem: PAT index value to be
> used when
> +			 * location is local vram during GPU access
> time.
> +			 */
> +			__u16 devmem;
> +
> +			/**
> +			 * @pat_index.remote: PAT index value to be
> used when
> +			 * location is remote gpu vram during GPU
> access time.
> +			 */
> +			__u16 remote;
> =C2=A0
> =C2=A0			/** @pat_index.pad: MBZ */
> -			__u32 pad;
> +			__u16 pad;
> =C2=A0
> =C2=A0			/** @pat_index.reserved: Reserved */
> =C2=A0			__u64 reserved;
> @@ -2163,11 +2178,26 @@ struct drm_xe_mem_range_attr {
> =C2=A0
> =C2=A0	 /** @pat_index: Page attribute table index */
> =C2=A0	struct {
> -		/** @pat_index.val: PAT index */
> -		__u32 val;
> +		/**
> +		 * @pat_index.smem: PAT index value to be used when
> +		 * location is system memory during GPU access time.
> +		 */
> +		__u16 smem;
> +
> +		/**
> +		 * @pat_index.devmem: PAT index value to be used
> when
> +		 * location is local vram during GPU access time.
> +		 */
> +		__u16 devmem;
> +
> +		/**
> +		 * @pat_index.remote: PAT index value to be used
> when
> +		 * location is remote gpu tiles during GPU access
> time.
> +		 */
> +		__u16 remote;
> =C2=A0
> =C2=A0		/** @pat_index.reserved: Reserved */
> -		__u32 reserved;
> +		__u16 reserved;
> =C2=A0	} pat_index;
> =C2=A0
> =C2=A0	/** @reserved: Reserved */

