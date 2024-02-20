Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1BB5C48BC4
	for <intel-xe@archiver.kernel.org>; Tue, 20 Feb 2024 08:44:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FC4010E20E;
	Tue, 20 Feb 2024 08:44:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z7Zeml71";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCCFF10E20E
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Feb 2024 08:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708418643; x=1739954643;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=+Vekp26og1ohYxYGkUe7ASJ4gcm94617ms999shhzqE=;
 b=Z7Zeml71jiy0/XABvb60zVErASts4sYfIe1wYaZznckpYwC0dYUh8qzK
 KEbsVbNreuyjaLGw6raYx/8TaEI+80pDckXOwAQx7nOTomph+wVY4ILgF
 0U+1+ftp1UZHDfbISpiR199RujpMYPe+2AoG2ZQ2SP6Adks/hqSIXEQJY
 T0rowsIThLUYydWIGYZ+cNO/O4BpsmKWLpM04MY2yVkmVSFLJbzyXUoxZ
 YwhzGzHLL2Q07+sXQiiVzrweA3P4iPqoH2IpGcugcAcwdjYOhDmqKc6Yu
 wzXy3OCp1z4gTywMxqMClThbOMasKCm1K0CZ5YWCoMuymuGp+g8uU1k6e Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="13626139"
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; d="scan'208";a="13626139"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 00:44:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; 
   d="scan'208";a="5081609"
Received: from ettammin-mobl1.ger.corp.intel.com (HELO [10.249.254.16])
 ([10.249.254.16])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 00:44:02 -0800
Message-ID: <08f5202a0e2606979cd740c8dbe687856759f595.camel@linux.intel.com>
Subject: Re: [PATCH v2 2/3] drm/xe: Add XE_VMA_PTE_64K VMA flag
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Date: Tue, 20 Feb 2024 09:43:59 +0100
In-Reply-To: <20240219211942.3633795-3-matthew.brost@intel.com>
References: <20240219211942.3633795-1-matthew.brost@intel.com>
 <20240219211942.3633795-3-matthew.brost@intel.com>
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
> Add XE_VMA_PTE_64K VMA flag to ensure skipping rebinds does not cross
> 64k page boundaries.
>=20
> Fixes: 8f33b4f054fc ("drm/xe: Avoid doing rebinds")
> Fixes: c47794bdd63d ("drm/xe: Set max pte size when skipping
> rebinds")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>


> ---
> =C2=A0drivers/gpu/drm/xe/xe_pt.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 6 =
++++--
> =C2=A0drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 5 =
+++++
> =C2=A0drivers/gpu/drm/xe/xe_vm_types.h | 1 +
> =C2=A03 files changed, 10 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 1e35c7525447..46cea37bdac5 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -499,10 +499,12 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent,
> pgoff_t offset,
> =C2=A0		 * this device *requires* 64K PTE size for VRAM,
> fail.
> =C2=A0		 */
> =C2=A0		if (level =3D=3D 0 && !xe_parent->is_compact) {
> -			if (xe_pt_is_pte_ps64K(addr, next, xe_walk))
> +			if (xe_pt_is_pte_ps64K(addr, next, xe_walk))
> {
> +				xe_walk->vma->gpuva.flags |=3D
> XE_VMA_PTE_64K;
> =C2=A0				pte |=3D XE_PTE_PS64;
> -			else if (XE_WARN_ON(xe_walk->needs_64K))
> +			} else if (XE_WARN_ON(xe_walk->needs_64K)) {
> =C2=A0				return -EINVAL;
> +			}
> =C2=A0		}
> =C2=A0
> =C2=A0		ret =3D xe_pt_insert_entry(xe_walk, xe_parent, offset,
> NULL, pte);
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 2b0c76c663e5..7781290d2b99 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2192,6 +2192,8 @@ static u64 xe_vma_max_pte_size(struct xe_vma
> *vma)
> =C2=A0		return SZ_1G;
> =C2=A0	else if (vma->gpuva.flags & XE_VMA_PTE_2M)
> =C2=A0		return SZ_2M;
> +	else if (vma->gpuva.flags & XE_VMA_PTE_64K)
> +		return SZ_64K;
> =C2=A0	else if (vma->gpuva.flags & XE_VMA_PTE_4K)
> =C2=A0		return SZ_4K;
> =C2=A0
> @@ -2207,6 +2209,9 @@ static void xe_vma_set_pte_size(struct xe_vma
> *vma, u64 size)
> =C2=A0	case SZ_2M:
> =C2=A0		vma->gpuva.flags |=3D XE_VMA_PTE_2M;
> =C2=A0		break;
> +	case SZ_64K:
> +		vma->gpuva.flags |=3D XE_VMA_PTE_64K;
> +		break;
> =C2=A0	case SZ_4K:
> =C2=A0		vma->gpuva.flags |=3D XE_VMA_PTE_4K;
> =C2=A0		break;
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
> b/drivers/gpu/drm/xe/xe_vm_types.h
> index 5ac9c5bebabc..91800ce70845 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -29,6 +29,7 @@ struct xe_vm;
> =C2=A0#define XE_VMA_PTE_4K		(DRM_GPUVA_USERBITS << 5)
> =C2=A0#define XE_VMA_PTE_2M		(DRM_GPUVA_USERBITS << 6)
> =C2=A0#define XE_VMA_PTE_1G		(DRM_GPUVA_USERBITS << 7)
> +#define XE_VMA_PTE_64K		(DRM_GPUVA_USERBITS << 8)
> =C2=A0
> =C2=A0/** struct xe_userptr - User pointer */
> =C2=A0struct xe_userptr {

