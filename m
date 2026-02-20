Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 517AFC55ABC
	for <intel-xe@archiver.kernel.org>; Fri, 20 Feb 2026 11:50:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 111ED10E769;
	Fri, 20 Feb 2026 11:50:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y/mM9LVG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DF8F10E769
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Feb 2026 11:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771588204; x=1803124204;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=VVmHa6o7NFHKC3bp8KNtsViudgk6Gzc6vc4cxahhkQw=;
 b=Y/mM9LVG0MRAzUdi1PQP3VJd718pjknzqd8l6iwtbYK9wUVIt8KnSXGv
 QqFkdgm+N7kl+3cEAuQBPlnpnYFii/vnYCGpqHhgRgBmTc905IK8TJDTD
 OkhE80IdyjE5uAJM/pu5c2QAQsYxD4RFM7bR70AsqK1BOtyp54awe4b0f
 hvfdEsSZIjFVluwtw9BRwkYZ7UefQrZcP9myDjYM4cu3ag4z501SNymkb
 ldBZK0SQMaOPDV8v2LH/6nVBugeJb3xtgpdMYeGFRpWEYvc73XaEIUydh
 hOl1YmRwCPLNNG2q7C+UQr7LKTJLqdFCClZqs695j/hrqOg718nYpdNtM w==;
X-CSE-ConnectionGUID: f/3KykNMTwmgGSjNbDdDbg==
X-CSE-MsgGUID: iLBmKq3YShK0ubaH7b7mOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="71885564"
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; d="scan'208";a="71885564"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 03:50:04 -0800
X-CSE-ConnectionGUID: OkLm+JmaREGhUnFsn7SVag==
X-CSE-MsgGUID: q64lKsOaQUWWQOrK7EF7cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; d="scan'208";a="214685949"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.245.58])
 ([10.245.245.58])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 03:50:02 -0800
Message-ID: <f78a69da78de6991c22e77140bd68b56904d37e2.camel@linux.intel.com>
Subject: Re: [PATCH V3 3/4] drm/xe/xe3p_lpg: Enable L2 flush optimization
 feature
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>, intel-xe@lists.freedesktop.org
Date: Fri, 20 Feb 2026 12:50:00 +0100
In-Reply-To: <81bc4af0-9601-4709-8bc3-bebb1aa354bd@intel.com>
References: <20260220101638.1609775-6-tejas.upadhyay@intel.com>
 <20260220101638.1609775-9-tejas.upadhyay@intel.com>
 <81bc4af0-9601-4709-8bc3-bebb1aa354bd@intel.com>
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

On Fri, 2026-02-20 at 11:46 +0000, Matthew Auld wrote:
> On 20/02/2026 10:16, Tejas Upadhyay wrote:
> > When set, the L2 flush optimization feature will control
> > whether L2 is in Persistent or Transient mode through
> > monitoring of media activity.
> >=20
> > To enable L2 flush optimization include new feature flag
> > GUC_CTL_ENABLE_L2FLUSH_OPT for Novalake platforms when
> > media type is detected.
> >=20
> > Also, restrict userptr, svm and dmabuf mappings to be
> > either 2WAY or XA+1WAY
> >=20
> > V2(MattA): validate dma-buf bos and madvise pat-index

Question: Assuming that we on *faulting* VMs always perform a TLB flush
on unbind. Can we eliminate the PAT restrictions on those? That would
actually then include all SVM maps.

/Thomas
=20

> >=20
> > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > ---
> > =C2=A0 drivers/gpu/drm/xe/xe_guc.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 3 +++
> > =C2=A0 drivers/gpu/drm/xe/xe_guc_fwif.h=C2=A0=C2=A0 |=C2=A0 1 +
> > =C2=A0 drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 9 +++++++++
> > =C2=A0 drivers/gpu/drm/xe/xe_vm_madvise.c | 18 ++++++++++++++++++
> > =C2=A0 4 files changed, 31 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_guc.c
> > b/drivers/gpu/drm/xe/xe_guc.c
> > index cbbb4d665b8f..97c33c3dd520 100644
> > --- a/drivers/gpu/drm/xe/xe_guc.c
> > +++ b/drivers/gpu/drm/xe/xe_guc.c
> > @@ -98,6 +98,9 @@ static u32 guc_ctl_feature_flags(struct xe_guc
> > *guc)
> > =C2=A0=C2=A0	if (xe_guc_using_main_gamctrl_queues(guc))
> > =C2=A0=C2=A0		flags |=3D GUC_CTL_MAIN_GAMCTRL_QUEUES;
> > =C2=A0=20
> > +	if (GRAPHICS_VER(xe) >=3D 35 && !IS_DGFX(xe) &&
> > xe_gt_is_media_type(guc_to_gt(guc)))
> > +		flags |=3D GUC_CTL_ENABLE_L2FLUSH_OPT;
> > +
> > =C2=A0=C2=A0	return flags;
> > =C2=A0 }
> > =C2=A0=20
> > diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h
> > b/drivers/gpu/drm/xe/xe_guc_fwif.h
> > index a33ea288b907..39ff7b3e960b 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
> > +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
> > @@ -67,6 +67,7 @@ struct guc_update_exec_queue_policy {
> > =C2=A0 #define=C2=A0=C2=A0 GUC_CTL_ENABLE_PSMI_LOGGING	BIT(7)
> > =C2=A0 #define=C2=A0=C2=A0 GUC_CTL_MAIN_GAMCTRL_QUEUES	BIT(9)
> > =C2=A0 #define=C2=A0=C2=A0 GUC_CTL_DISABLE_SCHEDULER	BIT(14)
> > +#define=C2=A0=C2=A0 GUC_CTL_ENABLE_L2FLUSH_OPT	BIT(15)
> > =C2=A0=20
> > =C2=A0 #define GUC_CTL_DEBUG			3
> > =C2=A0 #define=C2=A0=C2=A0 GUC_LOG_VERBOSITY		REG_GENMASK(1, 0)
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c
> > b/drivers/gpu/drm/xe/xe_vm.c
> > index c06fd250e037..e2e4c9648d05 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -3474,6 +3474,11 @@ static int vm_bind_ioctl_check_args(struct
> > xe_device *xe, struct xe_vm *vm,
> > =C2=A0=C2=A0				 op =3D=3D
> > DRM_XE_VM_BIND_OP_MAP_USERPTR) ||
> > =C2=A0=C2=A0		=C2=A0=C2=A0=C2=A0 XE_IOCTL_DBG(xe, coh_mode =3D=3D XE_CO=
H_NONE &&
> > =C2=A0=C2=A0				 op =3D=3D
> > DRM_XE_VM_BIND_OP_MAP_USERPTR) ||
> > +		=C2=A0=C2=A0=C2=A0 XE_IOCTL_DBG(xe,
> > xe_device_is_l2_flush_optimized(xe) &&
> > +				 (op =3D=3D
> > DRM_XE_VM_BIND_OP_MAP_USERPTR ||
> > +				=C2=A0 /* svm */
> > +				=C2=A0 op =3D=3D (DRM_XE_VM_BIND_OP_MAP &&
> > is_cpu_addr_mirror)) &&
>=20
> op =3D=3D (DRM_XE_VM_BIND_OP_MAP && is_cpu_addr_mirror)
>=20
> I think you meant (op =3D=3D DRM_XE_VM_BIND_OP_MAP) && is_cpu ?
>=20
> But maybe just drop the op check. Having the check being consistent
> for=20
> bind/unbind matches existing uapi behaviour?
>=20
> > +				 (pat_index !=3D 19 || coh_mode !=3D
> > XE_COH_2WAY)) ||
> > =C2=A0=C2=A0		=C2=A0=C2=A0=C2=A0 XE_IOCTL_DBG(xe, comp_en &&
> > =C2=A0=C2=A0				 op =3D=3D
> > DRM_XE_VM_BIND_OP_MAP_USERPTR) ||
> > =C2=A0=C2=A0		=C2=A0=C2=A0=C2=A0 XE_IOCTL_DBG(xe, op =3D=3D
> > DRM_XE_VM_BIND_OP_MAP_USERPTR &&
> > @@ -3608,6 +3613,10 @@ static int
> > xe_vm_bind_ioctl_validate_bo(struct xe_device *xe, struct xe_bo
> > *bo,
> > =C2=A0=C2=A0	if (XE_IOCTL_DBG(xe, bo->ttm.base.import_attach &&
> > comp_en))
> > =C2=A0=C2=A0		return -EINVAL;
> > =C2=A0=20
> > +	if (XE_IOCTL_DBG(xe, bo->ttm.base.import_attach &&
> > xe_device_is_l2_flush_optimized(xe) &&
> > +			 (pat_index !=3D 19 || coh_mode !=3D
> > XE_COH_2WAY)))
> > +		return -EINVAL;
> > +
> > =C2=A0=C2=A0	/* If a BO is protected it can only be mapped if the key
> > is still valid */
> > =C2=A0=C2=A0	if ((bind_flags & DRM_XE_VM_BIND_FLAG_CHECK_PXP) &&
> > xe_bo_is_protected(bo) &&
> > =C2=A0=C2=A0	=C2=A0=C2=A0=C2=A0 op !=3D DRM_XE_VM_BIND_OP_UNMAP && op !=
=3D
> > DRM_XE_VM_BIND_OP_UNMAP_ALL)
> > diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c
> > b/drivers/gpu/drm/xe/xe_vm_madvise.c
> > index 1a1ad8c07d49..2a35dbeba2d8 100644
> > --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> > +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> > @@ -411,6 +411,7 @@ int xe_vm_madvise_ioctl(struct drm_device *dev,
> > void *data, struct drm_file *fil
> > =C2=A0=C2=A0	struct xe_vmas_in_madvise_range madvise_range =3D {.addr =
=3D
> > args->start,
> > =C2=A0=C2=A0							 .range =3D=C2=A0
> > args->range, };
> > =C2=A0=C2=A0	struct xe_madvise_details details;
> > +	u16 pat_index, coh_mode;
> > =C2=A0=C2=A0	struct xe_vm *vm;
> > =C2=A0=C2=A0	struct drm_exec exec;
> > =C2=A0=C2=A0	int err, attr_type;
> > @@ -447,6 +448,15 @@ int xe_vm_madvise_ioctl(struct drm_device
> > *dev, void *data, struct drm_file *fil
> > =C2=A0=C2=A0	if (err || !madvise_range.num_vmas)
> > =C2=A0=C2=A0		goto madv_fini;
> > =C2=A0=20
> > +	pat_index =3D array_index_nospec(args->pat_index.val, xe-
> > >pat.n_entries);
>=20
> This needs to be conditional on DRM_XE_MEM_RANGE_ATTR_PAT. This is a=20
> union underneath so pat_index.val is not actually a pat_index for the
> other madv types, but just some other random data.
>=20
> > +	coh_mode =3D xe_pat_index_get_coh_mode(xe, pat_index);
> > +	if (XE_IOCTL_DBG(xe, madvise_range.has_svm_userptr_vmas &&
> > +			 xe_device_is_l2_flush_optimized(xe) &&
> > +			 (pat_index !=3D 19 || coh_mode !=3D
> > XE_COH_2WAY))) {
> > +		err =3D -EINVAL;
> > +		goto madv_fini;
> > +	}
> > +
> > =C2=A0=C2=A0	if (madvise_range.has_bo_vmas) {
> > =C2=A0=C2=A0		if (args->type =3D=3D DRM_XE_MEM_RANGE_ATTR_ATOMIC) {
> > =C2=A0=C2=A0			if (!check_bo_args_are_sane(vm,
> > madvise_range.vmas,
> > @@ -464,6 +474,14 @@ int xe_vm_madvise_ioctl(struct drm_device
> > *dev, void *data, struct drm_file *fil
> > =C2=A0=20
> > =C2=A0=C2=A0				if (!bo)
> > =C2=A0=C2=A0					continue;
> > +
> > +				if (XE_IOCTL_DBG(xe, bo-
> > >ttm.base.import_attach &&
> > +					=09
> > xe_device_is_l2_flush_optimized(xe) &&
> > +						 (pat_index !=3D 19
> > || coh_mode !=3D XE_COH_2WAY))) {
> > +					err =3D -EINVAL;
> > +					goto err_fini;
> > +				}
> > +
> > =C2=A0=C2=A0				err =3D drm_exec_lock_obj(&exec,
> > &bo->ttm.base);
> > =C2=A0=C2=A0				drm_exec_retry_on_contention(&exec
> > );
> > =C2=A0=C2=A0				if (err)
