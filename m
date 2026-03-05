Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0296F3093C
	for <intel-xe@archiver.kernel.org>; Thu,  5 Mar 2026 11:02:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9942510E002;
	Thu,  5 Mar 2026 11:02:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WUTwUrRb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC79710E002
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Mar 2026 11:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772708559; x=1804244559;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=i807A9hBBGS+MjOlUMR6QrE1Eqy9wbseIxzO3zL2ykE=;
 b=WUTwUrRblp8lJgU2XMpxeAli+Gkup4tS77YXJ5eqYwouaO3LQgZ9qoLR
 H/0CFy79cop3bxnXwO9GQjIUYDvWEXpNlQNMoHr+lrYsn9SJxNpG1Jmo4
 Ge94xf22x9lITGoF4+mgzGLRO9EFxze3+FHqmLZcq1qn3tNvHQWbNTSGy
 X7sMi00SeRKyOy9SaJmBJZXJuAlhk6NMcHpwJXPhTO3mrRa0FAJG+G5ol
 OwGG/eecnBPyeUgt1XL7N6hXArn3ZiV7cyZ1fO7r7wUND13pDO57cfxwR
 fUMO3AhvcbeRt8EM9SuI1v+XBmPzwsW+yO6+AhLd/6XznjqapvrRKGQYn Q==;
X-CSE-ConnectionGUID: y14PV7oyRMKZyT1sF5SKmQ==
X-CSE-MsgGUID: 3eLjaOvzQ+2hAwgT8dOQAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="61366375"
X-IronPort-AV: E=Sophos;i="6.23,102,1770624000"; d="scan'208";a="61366375"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 03:02:38 -0800
X-CSE-ConnectionGUID: hThikkAuTZ6gTTZQYjOuuw==
X-CSE-MsgGUID: Ks0XsRfDSrWYqPrIQwp/sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,102,1770624000"; d="scan'208";a="215469400"
Received: from vpanait-mobl.ger.corp.intel.com (HELO [10.245.244.71])
 ([10.245.244.71])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 03:02:36 -0800
Message-ID: <2ecfbbf73b825da172c7176c7ae9c46096221bd4.camel@linux.intel.com>
Subject: Re: [PATCH V5 3/4] drm/xe/xe3p_lpg: Restrict UAPI to enable L2
 flush optimization
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com, carl.zhang@intel.com, jose.souza@intel.com,
 Michal Mrozek <michal.mrozek@intel.com>
Date: Thu, 05 Mar 2026 12:02:33 +0100
In-Reply-To: <20260303062441.1860959-9-tejas.upadhyay@intel.com>
References: <20260303062441.1860959-6-tejas.upadhyay@intel.com>
 <20260303062441.1860959-9-tejas.upadhyay@intel.com>
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

Hi, Tejas,

On Tue, 2026-03-03 at 11:54 +0530, Tejas Upadhyay wrote:
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
> V4(MattA): Modify uapi doc and commit
> V3(MattA): check valid op and pat_index value
> V2(MattA): validate dma-buf bos and madvise pat-index
>=20
> Acked-by: Michal Mrozek <michal.mrozek@intel.com>
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
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

Claude has some suggestions on this patch:

"
commit 77271d8c323486ebe5dc6f1264fc318a43a29084
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>

drm/xe/xe3p_lpg: Restrict UAPI to enable L2 flush optimization

This commit adds UAPI validation to restrict userptr, svm, and dmabuf
mappings on L2 flush optimized platforms (Xe3p+ non-DGFX) to use either
2WAY coherency or XA with 1WAY coherency (pat_index 19).

> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 99fa36123f58..42356d73ca65 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c

[ ... ]

> @@ -3480,6 +3480,10 @@ static int vm_bind_ioctl_check_args(struct
xe_device *xe, struct xe_vm *vm,
>  			 op =3D=3D DRM_XE_VM_BIND_OP_MAP_USERPTR) ||
>  	    XE_IOCTL_DBG(xe, coh_mode =3D=3D XE_COH_NONE &&
>  			 op =3D=3D DRM_XE_VM_BIND_OP_MAP_USERPTR) ||
> +	    XE_IOCTL_DBG(xe, xe_device_is_l2_flush_optimized(xe) &&
> +			 (op =3D=3D DRM_XE_VM_BIND_OP_MAP_USERPTR ||
> +			  is_cpu_addr_mirror) &&
> +			 (pat_index !=3D 19 || coh_mode !=3D XE_COH_2WAY))
||

The condition uses || but should this use && instead?

The commit message says mappings should be allowed if they use "either
2WAY or XA+1WAY". The UAPI documentation also says "the kernel expects
either 2WAY or 1WAY and XA @pat_index".

Looking at xe3p_lpg_pat_table in xe_pat.c:

    [19] =3D XE2_PAT( 1, 0, 0, 2, 3, 2 )

The last parameter is coh_mode=3D2, which maps to XE_COH_1WAY based on
the XE2_PAT macro:

    .coh_mode =3D __coh_mode ? __coh_mode : XE_COH_NONE

So pat_index 19 has coh_mode=3DXE_COH_1WAY, not XE_COH_2WAY.

With the current || condition, for pat_index 19:
  - pat_index !=3D 19 is false
  - coh_mode !=3D XE_COH_2WAY is true (since coh_mode is XE_COH_1WAY)
  - false || true =3D true, validation fails

This means userptr/svm operations will always fail validation on L2
flush optimized platforms, even when using the correct pat_index 19.

Should the condition be:

    (pat_index !=3D 19 && coh_mode !=3D XE_COH_2WAY)

This would fail only if the mapping is neither pat_index 19 (XA+1WAY)
nor using 2WAY coherency, matching the commit message intent.

The same issue appears in xe_vm_bind_ioctl_validate_bo() and
xe_vm_madvise_ioctl() at the similar validation points.

"

Thanks,
Thomas

