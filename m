Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F4B0F33A61
	for <intel-xe@archiver.kernel.org>; Thu,  5 Mar 2026 13:52:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 420E610E2A6;
	Thu,  5 Mar 2026 13:52:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RpPWALlL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2FD710E173
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Mar 2026 13:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772718757; x=1804254757;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=UqfzhNlvLuyKy10kfFaDvAErX6FQN+OsMcfuUfPx/7k=;
 b=RpPWALlL2VwPwsVjbW2fJOHxXjHUqmgGS1xoNy+AwB+Yi5bB24/gBg1f
 wNS+P8j1iVjaw8W8HKKH5J/7ZPBwXfNyACrJglsxM4ib8agekO20aDwS+
 4BcZmv3lUNFsT8LexdZ71/O+wAmpjhkRWBJHml6yy+QXJSXWLlveVDArC
 dzQWTtMaOimalZ8a5T0mJNyfZRyru27lInl6gugz1m0B9UcI5ESjdVj46
 cY4PEEeml7lFF2h4GV72Qq98JEGU+TwW3Q8vYFCmRjAMls4/ypEYM8svb
 niMGSFgT8wN4ZA8j+njSIPkW15gZ+BM24l1sCbzwY0i6rPkZPShfNs4Bv g==;
X-CSE-ConnectionGUID: p3m+SeFJTt+IKBBPLV3w/w==
X-CSE-MsgGUID: 6dFP8xkhQhi09KoRVCRqcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="91378675"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="91378675"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 05:52:36 -0800
X-CSE-ConnectionGUID: 9swnNmW2Qs2Of4h9PCpRXA==
X-CSE-MsgGUID: ng1pOCrlRDWuD00m4h/IlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="222838441"
Received: from vpanait-mobl.ger.corp.intel.com (HELO [10.245.244.71])
 ([10.245.244.71])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 05:52:34 -0800
Message-ID: <f021d322cb6e894e1f47d1a9bc8b794b899b13f3.camel@linux.intel.com>
Subject: Re: [PATCH V6 3/4] drm/xe/xe3p_lpg: Restrict UAPI to enable L2
 flush optimization
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com, carl.zhang@intel.com, jose.souza@intel.com,
 Michal Mrozek <michal.mrozek@intel.com>
Date: Thu, 05 Mar 2026 14:52:31 +0100
In-Reply-To: <20260305121902.1892593-9-tejas.upadhyay@intel.com>
References: <20260305121902.1892593-6-tejas.upadhyay@intel.com>
 <20260305121902.1892593-9-tejas.upadhyay@intel.com>
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

On Thu, 2026-03-05 at 17:49 +0530, Tejas Upadhyay wrote:
> When set, starting xe3p_lpg, the L2 flush optimization
> feature will control whether L2 is in Persistent or
> Transient mode through monitoring of media activity.
>=20
> To enable L2 flush optimization include new feature flag
> GUC_CTL_ENABLE_L2FLUSH_OPT for Novalake platforms when
> media type is detected.
>=20
> Tighten UAPI validation to restrict userptr, svm and
> dmabuf mappings to be either 2WAY or XA+1WAY
>=20
> V5(Thomas): logic correction
> V4(MattA): Modify uapi doc and commit
> V3(MattA): check valid op and pat_index value
> V2(MattA): validate dma-buf bos and madvise pat-index
>=20
> Acked-by: Jos=C3=A9 Roberto de Souza <jose.souza@intel.com>
> Acked-by: Michal Mrozek <michal.mrozek@intel.com>
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

> ---
> =C2=A0drivers/gpu/drm/xe/xe_guc.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 3 +++
> =C2=A0drivers/gpu/drm/xe/xe_guc_fwif.h=C2=A0=C2=A0 |=C2=A0 1 +
> =C2=A0drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 8 ++++++++
> =C2=A0drivers/gpu/drm/xe/xe_vm_madvise.c | 23 +++++++++++++++++++++++
> =C2=A0include/uapi/drm/xe_drm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 4 +++-
> =C2=A05 files changed, 38 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc.c
> b/drivers/gpu/drm/xe/xe_guc.c
> index 54d2fc780127..43dc4353206f 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -98,6 +98,9 @@ static u32 guc_ctl_feature_flags(struct xe_guc
> *guc)
> =C2=A0	if (xe_guc_using_main_gamctrl_queues(guc))
> =C2=A0		flags |=3D GUC_CTL_MAIN_GAMCTRL_QUEUES;
> =C2=A0
> +	if (GRAPHICS_VER(xe) >=3D 35 && !IS_DGFX(xe) &&
> xe_gt_is_media_type(guc_to_gt(guc)))
> +		flags |=3D GUC_CTL_ENABLE_L2FLUSH_OPT;
> +
> =C2=A0	return flags;
> =C2=A0}
> =C2=A0
> diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h
> b/drivers/gpu/drm/xe/xe_guc_fwif.h
> index bb8f71d38611..b73fae063fac 100644
> --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
> +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
> @@ -67,6 +67,7 @@ struct guc_update_exec_queue_policy {
> =C2=A0#define=C2=A0=C2=A0 GUC_CTL_ENABLE_PSMI_LOGGING	BIT(7)
> =C2=A0#define=C2=A0=C2=A0 GUC_CTL_MAIN_GAMCTRL_QUEUES	BIT(9)
> =C2=A0#define=C2=A0=C2=A0 GUC_CTL_DISABLE_SCHEDULER	BIT(14)
> +#define=C2=A0=C2=A0 GUC_CTL_ENABLE_L2FLUSH_OPT	BIT(15)
> =C2=A0
> =C2=A0#define GUC_CTL_DEBUG			3
> =C2=A0#define=C2=A0=C2=A0 GUC_LOG_VERBOSITY		REG_GENMASK(1, 0)
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index da0ce0b3704c..0b236e08c158 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3481,6 +3481,10 @@ static int vm_bind_ioctl_check_args(struct
> xe_device *xe, struct xe_vm *vm,
> =C2=A0				 op =3D=3D
> DRM_XE_VM_BIND_OP_MAP_USERPTR) ||
> =C2=A0		=C2=A0=C2=A0=C2=A0 XE_IOCTL_DBG(xe, coh_mode =3D=3D XE_COH_NONE &=
&
> =C2=A0				 op =3D=3D
> DRM_XE_VM_BIND_OP_MAP_USERPTR) ||
> +		=C2=A0=C2=A0=C2=A0 XE_IOCTL_DBG(xe,
> xe_device_is_l2_flush_optimized(xe) &&
> +				 (op =3D=3D
> DRM_XE_VM_BIND_OP_MAP_USERPTR ||
> +				=C2=A0 is_cpu_addr_mirror) &&
> +				 (pat_index !=3D 19 && coh_mode !=3D
> XE_COH_2WAY)) ||
> =C2=A0		=C2=A0=C2=A0=C2=A0 XE_IOCTL_DBG(xe, comp_en &&
> =C2=A0				 op =3D=3D
> DRM_XE_VM_BIND_OP_MAP_USERPTR) ||
> =C2=A0		=C2=A0=C2=A0=C2=A0 XE_IOCTL_DBG(xe, op =3D=3D
> DRM_XE_VM_BIND_OP_MAP_USERPTR &&
> @@ -3615,6 +3619,10 @@ static int xe_vm_bind_ioctl_validate_bo(struct
> xe_device *xe, struct xe_bo *bo,
> =C2=A0	if (XE_IOCTL_DBG(xe, bo->ttm.base.import_attach && comp_en))
> =C2=A0		return -EINVAL;
> =C2=A0
> +	if (XE_IOCTL_DBG(xe, bo->ttm.base.import_attach &&
> xe_device_is_l2_flush_optimized(xe) &&
> +			 (pat_index !=3D 19 && coh_mode !=3D
> XE_COH_2WAY)))
> +		return -EINVAL;
> +
> =C2=A0	/* If a BO is protected it can only be mapped if the key is
> still valid */
> =C2=A0	if ((bind_flags & DRM_XE_VM_BIND_FLAG_CHECK_PXP) &&
> xe_bo_is_protected(bo) &&
> =C2=A0	=C2=A0=C2=A0=C2=A0 op !=3D DRM_XE_VM_BIND_OP_UNMAP && op !=3D
> DRM_XE_VM_BIND_OP_UNMAP_ALL)
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c
> b/drivers/gpu/drm/xe/xe_vm_madvise.c
> index 07169586e35f..376c014239ee 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -411,6 +411,7 @@ int xe_vm_madvise_ioctl(struct drm_device *dev,
> void *data, struct drm_file *fil
> =C2=A0	struct xe_vmas_in_madvise_range madvise_range =3D {.addr =3D
> args->start,
> =C2=A0							 .range =3D=C2=A0
> args->range, };
> =C2=A0	struct xe_madvise_details details;
> +	u16 pat_index, coh_mode;
> =C2=A0	struct xe_vm *vm;
> =C2=A0	struct drm_exec exec;
> =C2=A0	int err, attr_type;
> @@ -447,6 +448,17 @@ int xe_vm_madvise_ioctl(struct drm_device *dev,
> void *data, struct drm_file *fil
> =C2=A0	if (err || !madvise_range.num_vmas)
> =C2=A0		goto madv_fini;
> =C2=A0
> +	if (args->type =3D=3D DRM_XE_MEM_RANGE_ATTR_PAT) {
> +		pat_index =3D array_index_nospec(args->pat_index.val,
> xe->pat.n_entries);
> +		coh_mode =3D xe_pat_index_get_coh_mode(xe, pat_index);
> +		if (XE_IOCTL_DBG(xe,
> madvise_range.has_svm_userptr_vmas &&
> +				 xe_device_is_l2_flush_optimized(xe)
> &&
> +				 (pat_index !=3D 19 && coh_mode !=3D
> XE_COH_2WAY))) {
> +			err =3D -EINVAL;
> +			goto madv_fini;
> +		}
> +	}
> +
> =C2=A0	if (madvise_range.has_bo_vmas) {
> =C2=A0		if (args->type =3D=3D DRM_XE_MEM_RANGE_ATTR_ATOMIC) {
> =C2=A0			if (!check_bo_args_are_sane(vm,
> madvise_range.vmas,
> @@ -464,6 +476,17 @@ int xe_vm_madvise_ioctl(struct drm_device *dev,
> void *data, struct drm_file *fil
> =C2=A0
> =C2=A0				if (!bo)
> =C2=A0					continue;
> +
> +				if (args->type =3D=3D
> DRM_XE_MEM_RANGE_ATTR_PAT) {
> +					if (XE_IOCTL_DBG(xe, bo-
> >ttm.base.import_attach &&
> +						=09
> xe_device_is_l2_flush_optimized(xe) &&
> +							 (pat_index
> !=3D 19 &&
> +							=C2=A0 coh_mode
> !=3D XE_COH_2WAY))) {
> +						err =3D -EINVAL;
> +						goto err_fini;
> +					}
> +				}
> +
> =C2=A0				err =3D drm_exec_lock_obj(&exec, &bo-
> >ttm.base);
> =C2=A0				drm_exec_retry_on_contention(&exec);
> =C2=A0				if (err)
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index ef2565048bdf..862fed3cf1ed 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -1103,7 +1103,9 @@ struct drm_xe_vm_bind_op {
> =C2=A0	 * incoherent GT access is possible.
> =C2=A0	 *
> =C2=A0	 * Note: For userptr and externally imported dma-buf the
> kernel expects
> -	 * either 1WAY or 2WAY for the @pat_index.
> +	 * either 1WAY or 2WAY for the @pat_index. Starting from
> NVL-P, for
> +	 * userptr, svm, madvise and externally imported dma-buf the
> kernel expects
> +	 * either 2WAY or 1WAY and XA @pat_index.
> =C2=A0	 *
> =C2=A0	 * For DRM_XE_VM_BIND_FLAG_NULL bindings there are no KMD
> restrictions
> =C2=A0	 * on the @pat_index. For such mappings there is no actual
> memory being
