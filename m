Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1BF0C0218D
	for <intel-xe@archiver.kernel.org>; Wed, 29 Jan 2025 08:53:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 923B510E0BB;
	Wed, 29 Jan 2025 08:53:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CLMQkUP1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 362FA10E0BB
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Jan 2025 08:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738140780; x=1769676780;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=PDULPKtyEEw0i7qSpTzswz0Uf3vcUEJtT6iTCGo/yM4=;
 b=CLMQkUP1eDr9WMFMmlkDAGUMokDWqdzrMl+VPArCUnQTqR6KglefC+a9
 wZNfvRaXELDzeWey51DfgzGIrFfThZqRjcU/8pDAf9HlYY9p5aVgtcMVN
 0c1CfNmRNAitmut1UOsO3Y2xvmag3Klav2SmhT7em+Ruv8/zgW8y76pJF
 F6UVnEwcBHy+ea9JSc6SbcbBmg2Tys/JAOk2UZdnGQx2InlRScHx+rHvQ
 bMX9UH7CFQ9BrYAtdoBhcj3hEYw5IrAEixHz47iCullPGsqEuSCxymW5/
 BEZZfDC5vGRYHx5UDxikEcZugnxF5H5XnFUvJ0dXxDTYR4/lUhdj9wvgd w==;
X-CSE-ConnectionGUID: PTpzfQShQ2eZSJIT30vcdQ==
X-CSE-MsgGUID: I1WDU1dPR2uxfxCQIvXYgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="38674124"
X-IronPort-AV: E=Sophos;i="6.13,242,1732608000"; d="scan'208";a="38674124"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 00:52:59 -0800
X-CSE-ConnectionGUID: w3jbccIKTEiHG5PHFmddpw==
X-CSE-MsgGUID: VW+W/3ilRdSIS1u7Dhq1lQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,242,1732608000"; d="scan'208";a="109068846"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO [10.245.246.222])
 ([10.245.246.222])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 00:52:57 -0800
Message-ID: <ca61d5a98bb2e6bf778912a10f189512bae4ef1e.camel@linux.intel.com>
Subject: Re: [PATCH 3/3] drm/xe: Allow scratch page under fault mode for
 certain platform
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Oak Zeng <oak.zeng@intel.com>, intel-xe@lists.freedesktop.org
Cc: joonas.lahtinen@linux.intel.com
Date: Wed, 29 Jan 2025 09:52:54 +0100
In-Reply-To: <20250128222145.3849874-3-oak.zeng@intel.com>
References: <20250128222145.3849874-1-oak.zeng@intel.com>
 <20250128222145.3849874-3-oak.zeng@intel.com>
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

On Tue, 2025-01-28 at 17:21 -0500, Oak Zeng wrote:
> Normally scratch page is not allowed when a vm is operate under page
> fault mode, i.e., in the existing codes,
> DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE
> and DRM_XE_VM_CREATE_FLAG_FAULT_MODE are mutual exclusive. The reason
> is fault mode relies on recoverable page to work, while scratch page
> can mute recoverable page fault.
>=20
> On xe2 and xe3, HW prefetching can cause page fault interrupt. Due to
> page fault interrupt overhead (i.e., need Guc and KMD involved to fix
> the page fault), HW prefetching can be slowed by many orders of
> magnitude.

The problem on xe2 and xe3 as I understand it is not the overhead but
the fact that OOB prefetching causes pagefaults and we can't resolve
those.

>=20
> Fix this problem by allowing scratch page under fault mode for xe2
> and xe3.
> With scratch page in place, HW prefetching could always hit scratch
> page
> instead of causing interrupt.
>=20
> Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_vm.c | 9 +++++----
> =C2=A01 file changed, 5 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 196d347c6ac0..3346f88f284a 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1732,6 +1732,11 @@ int xe_vm_create_ioctl(struct drm_device *dev,
> void *data,
> =C2=A0	if (XE_IOCTL_DBG(xe, args->extensions))
> =C2=A0		return -EINVAL;
> =C2=A0
> +	if (XE_IOCTL_DBG(xe, args->flags &
> DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE &&
> +			 args->flags &
> DRM_XE_VM_CREATE_FLAG_FAULT_MODE &&
> +			 !(IS_LUNARLAKE(xe) || IS_BATTLEMAGE(xe) ||
> IS_PANTHERLAKE(xe))))
> +		return -EINVAL;
> +

Could we perhaps add a bit in the xe->info structure?

/Thomas


> =C2=A0	if (XE_WA(xe_root_mmio_gt(xe), 14016763929))
> =C2=A0		args->flags |=3D DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE;
> =C2=A0
> @@ -1745,10 +1750,6 @@ int xe_vm_create_ioctl(struct drm_device *dev,
> void *data,
> =C2=A0	if (XE_IOCTL_DBG(xe, args->flags &
> ~ALL_DRM_XE_VM_CREATE_FLAGS))
> =C2=A0		return -EINVAL;
> =C2=A0
> -	if (XE_IOCTL_DBG(xe, args->flags &
> DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE &&
> -			 args->flags &
> DRM_XE_VM_CREATE_FLAG_FAULT_MODE))
> -		return -EINVAL;
> -
> =C2=A0	if (XE_IOCTL_DBG(xe, !(args->flags &
> DRM_XE_VM_CREATE_FLAG_LR_MODE) &&
> =C2=A0			 args->flags &
> DRM_XE_VM_CREATE_FLAG_FAULT_MODE))
> =C2=A0		return -EINVAL;

