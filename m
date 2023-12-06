Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B491C4167B
	for <intel-xe@archiver.kernel.org>; Wed,  6 Dec 2023 12:30:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B1CD10E0EE;
	Wed,  6 Dec 2023 12:30:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0269710E0EE
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Dec 2023 12:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701865832; x=1733401832;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=/kkchUNfUox26sbSJqMUZcCxU/JlFnTRvEWVvLocQOo=;
 b=hbcBEVtBq3FK6u7Q+owAf9+YscJDjrOM/GGOjnYvvjQ93AYbCe8S7x6i
 2c2rFyWz3BX2f+zpvyu6ErzgzEQPINAW7wQX0QQFMJ9T6ZWUR0X5vjxVD
 PTDhlxfJXWUKxA/N7b9O9fHMIF8y7RtbDl1a7qaPbxRcfT7ELDBowah1/
 aD+xlXvyUpOCSFFKvv1yvk0z74BdQ+74K/P7LziG+6KlmCMndD0HnjSwW
 R5Jp31FJfw1aZuLU/lhvnxEyY/cjCPpsmVN67Rb5GqnEbqLhVLT2/JcNB
 uMgQGhtTRhbNApElkxLyp88afQH9eppWqBo5sD9JMs9EwFwzkNIu+ayzl A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="374231868"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; d="scan'208";a="374231868"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 04:30:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="1102813276"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; d="scan'208";a="1102813276"
Received: from binm223x-mobl2.gar.corp.intel.com (HELO [10.249.254.121])
 ([10.249.254.121])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 04:30:27 -0800
Message-ID: <9baff47528e6e706000461d520509b418be4113b.camel@linux.intel.com>
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>, 
 intel-xe@lists.freedesktop.org
Date: Wed, 06 Dec 2023 13:30:25 +0100
In-Reply-To: <20231205214135.958847-3-himal.prasad.ghimiray@intel.com>
References: <20231205214135.958847-1-himal.prasad.ghimiray@intel.com>
 <20231205214135.958847-3-himal.prasad.ghimiray@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
Subject: Re: [Intel-xe] [PATCH v3 2/9] drm/xe/xe2: Allocate extra pages for
 ccs during bo create
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

On Wed, 2023-12-06 at 03:11 +0530, Himal Prasad Ghimiray wrote:
> Each byte of CCS data now represents 512 bytes of main memory data.
> Allocate extra pages to handle ccs region for igfx too.
>=20
> Bspec:58796
>=20
> v2:
> =C2=A0- For dgfx ensure system bit is not set.
> =C2=A0- Modify comments.(Thomas)
>=20
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Himal Prasad Ghimiray
> <himal.prasad.ghimiray@intel.com>
Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

> ---
> =C2=A0drivers/gpu/drm/xe/regs/xe_gpu_commands.h |=C2=A0 2 +-
> =C2=A0drivers/gpu/drm/xe/xe_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 14 +++++++++-----
> =C2=A0drivers/gpu/drm/xe/xe_device.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> =C2=A03 files changed, 11 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
> b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
> index f1c5bf203b3d..1f9c32e694c6 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
> @@ -16,7 +16,7 @@
> =C2=A0#define=C2=A0=C2=A0 XY_CTRL_SURF_MOCS_MASK=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0GENMASK(31, 26)
> =C2=A0#define=C2=A0=C2=A0 XE2_XY_CTRL_SURF_MOCS_INDEX_MASK=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0GENMASK(31, 28)
> =C2=A0#define=C2=A0=C2=A0 NUM_CCS_BYTES_PER_BLOCK=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0256
> -#define=C2=A0=C2=A0 NUM_BYTES_PER_CCS_BYTE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0256
> +#define=C2=A0=C2=A0 NUM_BYTES_PER_CCS_BYTE(_xe)=C2=A0=C2=A0(GRAPHICS_VER=
(_xe) >=3D 20 ?
> 512 : 256)
> =C2=A0#define=C2=A0=C2=A0 NUM_CCS_BLKS_PER_XFER=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0102=
4
> =C2=A0
> =C2=A0#define XY_FAST_COLOR_BLT_CMD=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0(2 << 29 | 0x44 << 22)
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 72dc4a4eed4e..81630838d769 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -2173,8 +2173,8 @@ int xe_bo_evict(struct xe_bo *bo, bool
> force_alloc)
> =C2=A0 * placed in system memory.
> =C2=A0 * @bo: The xe_bo
> =C2=A0 *
> - * If a bo has an allowable placement in XE_PL_TT memory, it can't
> use
> - * flat CCS compression, because the GPU then has no way to access
> the
> + * For dgfx if a bo has an allowable placement in XE_PL_TT memory,
> it can't
> + * use flat CCS compression, because the GPU then has no way to
> access the
> =C2=A0 * CCS metadata using relevant commands. For the opposite case, we
> need to
> =C2=A0 * allocate storage for the CCS metadata when the BO is not residen=
t
> in
> =C2=A0 * VRAM memory.
> @@ -2183,9 +2183,13 @@ int xe_bo_evict(struct xe_bo *bo, bool
> force_alloc)
> =C2=A0 */
> =C2=A0bool xe_bo_needs_ccs_pages(struct xe_bo *bo)
> =C2=A0{
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return bo->ttm.type =3D=3D ttm=
_bo_type_device &&
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0!(bo->flags & XE_BO_CREATE_SYSTEM_BIT) &&
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0(bo->flags & XE_BO_CREATE_VRAM_MASK);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct xe_device *xe =3D xe_bo=
_device(bo);
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return (xe_device_has_flat_ccs=
(xe) &&
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0bo->ttm.type =3D=3D ttm_bo_type_device &&
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0((IS_DGFX(xe) && (bo->flags & XE_BO_CREATE_VRAM_MASK)
> &&
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 !(bo->flags & XE_BO_CREATE_SYSTEM_BIT)) ||
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0(!IS_DGFX(xe) && (bo->flags &
> XE_BO_CREATE_SYSTEM_BIT))));
> =C2=A0}
> =C2=A0
> =C2=A0/**
> diff --git a/drivers/gpu/drm/xe/xe_device.c
> b/drivers/gpu/drm/xe/xe_device.c
> index 400fa1ac6168..50c87f03c51c 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -605,7 +605,7 @@ void xe_device_wmb(struct xe_device *xe)
> =C2=A0u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return xe_device_has_flat=
_ccs(xe) ?
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0DIV_ROUND_UP(size, NUM_BYTES_PER_CCS_BYTE) : 0;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0DIV_ROUND_UP(size, NUM_BYTES_PER_CCS_BYTE(xe)) : 0;
> =C2=A0}
> =C2=A0
> =C2=A0bool xe_device_mem_access_ongoing(struct xe_device *xe)

