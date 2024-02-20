Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9828C48BC4
	for <intel-xe@archiver.kernel.org>; Tue, 20 Feb 2024 08:44:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5310410E20E;
	Tue, 20 Feb 2024 08:44:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bPMdvtRx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B9DC10E20E
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Feb 2024 08:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708418684; x=1739954684;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=SV3WkZfI+/YO8mmi/rUWIPRczKHE6b9/ovqREh3RXA0=;
 b=bPMdvtRxrGdUqhho6M53yP5n6bh/T7O1PulL77JnD5K+exFWOKA2YoL1
 o+EM3X1/g4wTDO4zOv3CHa6jDje5dbgepvcg8xxOzbFbKwN+dJA6aE9K/
 nrPTZK0+1FFGUGC10AEDpCh1urOF9/JoNHVtpb3XdsSP0P0jPMAk4Almr
 Di+oXeacbmXvXTvWNzmuuBanIqBfr0GFldGHk2O5R/XoUkdxe10HN99ov
 QaByHTcJD/c5sksQZVZGSMwhhVEknjIPoqx2jYpNRLFJKnf6i5xhpJv0I
 1hydZzzG3xInlrrJKl+4zpL6GeelIx2R+Tj4DD8Mh0zVvYef4vIY8hYe3 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="2618762"
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; 
   d="scan'208";a="2618762"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 00:44:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; 
   d="scan'208";a="5000816"
Received: from ettammin-mobl1.ger.corp.intel.com (HELO [10.249.254.16])
 ([10.249.254.16])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 00:44:42 -0800
Message-ID: <2b5c35e2812e9cb6cd5479962dd2628c701bdaf3.camel@linux.intel.com>
Subject: Re: [PATCH v2 3/3] drm/xe: Return 2MB page size for compact 64k PTEs
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>
Date: Tue, 20 Feb 2024 09:44:39 +0100
In-Reply-To: <20240219211942.3633795-4-matthew.brost@intel.com>
References: <20240219211942.3633795-1-matthew.brost@intel.com>
 <20240219211942.3633795-4-matthew.brost@intel.com>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3 (3.50.3-1.fc39) 
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

On Mon, 2024-02-19 at 13:19 -0800, Matthew Brost wrote:
> Compact 64k PTEs are only intended to be used within a single VMA
> which
> covers the entire 2MB range of the compact 64k PTEs. Add
> XE_VMA_PTE_COMPACT VMA flag to indicate compact 64k PTEs are used and
> update xe_vma_max_pte_size to return at least 2MB if set.
>=20
> v2: Include missing changes
>=20
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/758
> Fixes: 8f33b4f054fc ("drm/xe: Avoid doing rebinds")
> Fixes: c47794bdd63d ("drm/xe: Set max pte size when skipping
> rebinds")
> Reported-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

> ---
> =C2=A0drivers/gpu/drm/xe/xe_pt.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 5 =
++++-
> =C2=A0drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 =
+-
> =C2=A0drivers/gpu/drm/xe/xe_vm_types.h | 1 +
> =C2=A03 files changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 46cea37bdac5..7f54bc3e389d 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -547,13 +547,16 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent,
> pgoff_t offset,
> =C2=A0		*child =3D &xe_child->base;
> =C2=A0
> =C2=A0		/*
> -		 * Prefer the compact pagetable layout for L0 if
> possible.
> +		 * Prefer the compact pagetable layout for L0 if
> possible. Only
> +		 * possible if VMA covers entire 2MB region as
> compact 64k and
> +		 * 4k pages cannot be mixed within a 2MB region.
> =C2=A0		 * TODO: Suballocate the pt bo to avoid wasting a
> lot of
> =C2=A0		 * memory.
> =C2=A0		 */
> =C2=A0		if (GRAPHICS_VERx100(tile_to_xe(xe_walk->tile)) >=3D
> 1250 && level =3D=3D 1 &&
> =C2=A0		=C2=A0=C2=A0=C2=A0 covers && xe_pt_scan_64K(addr, next, xe_walk))=
 {
> =C2=A0			walk->shifts =3D xe_compact_pt_shifts;
> +			xe_walk->vma->gpuva.flags |=3D
> XE_VMA_PTE_COMPACT;
> =C2=A0			flags |=3D XE_PDE_64K;
> =C2=A0			xe_child->is_compact =3D true;
> =C2=A0		}
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 7781290d2b99..23a44ef85aa4 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2190,7 +2190,7 @@ static u64 xe_vma_max_pte_size(struct xe_vma
> *vma)
> =C2=A0{
> =C2=A0	if (vma->gpuva.flags & XE_VMA_PTE_1G)
> =C2=A0		return SZ_1G;
> -	else if (vma->gpuva.flags & XE_VMA_PTE_2M)
> +	else if (vma->gpuva.flags & (XE_VMA_PTE_2M |
> XE_VMA_PTE_COMPACT))
> =C2=A0		return SZ_2M;
> =C2=A0	else if (vma->gpuva.flags & XE_VMA_PTE_64K)
> =C2=A0		return SZ_64K;
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
> b/drivers/gpu/drm/xe/xe_vm_types.h
> index 91800ce70845..a603cc2eb56b 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -30,6 +30,7 @@ struct xe_vm;
> =C2=A0#define XE_VMA_PTE_2M		(DRM_GPUVA_USERBITS << 6)
> =C2=A0#define XE_VMA_PTE_1G		(DRM_GPUVA_USERBITS << 7)
> =C2=A0#define XE_VMA_PTE_64K		(DRM_GPUVA_USERBITS << 8)
> +#define XE_VMA_PTE_COMPACT	(DRM_GPUVA_USERBITS << 9)
> =C2=A0
> =C2=A0/** struct xe_userptr - User pointer */
> =C2=A0struct xe_userptr {

