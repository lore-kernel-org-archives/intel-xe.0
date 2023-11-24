Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4030C61DF4
	for <intel-xe@archiver.kernel.org>; Fri, 24 Nov 2023 11:10:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE5C210E1BC;
	Fri, 24 Nov 2023 11:10:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E0FB10E1BC
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Nov 2023 11:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700824206; x=1732360206;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=75MbRvT12J57RkPESId+3K7CP4Vr8D8GU0CFfCM5Hh8=;
 b=NgndjbNTjW9mO2tHAJjVdOknd5kzHRBkT7F3chxNDRGe7GeIx7pvkwXc
 NiEsgpyBN1ugrmQawmWAUwiTJvFZ8rpfIFOXG9KyW+KlOZLgON0Q/dwHp
 CtJU9rdcPoF6u0QGIwpDBXhNNYyaAY8YHokPXHQyBaXQZxDS+Vmko/ESe
 JksVfhi1+HtkSozi0/3M7wp42bxWo9SVwDiDVWD62UlQ5DqOBhiksuuvY
 u3Ns+Bsu3Hk/TUqdCgoXba99rFr93fwVfoTuV4aJZIItjNE4/Ue+nSYNq
 sJztTz3ttONLXL0ep46wutJ5zBxUex31tq3dPdo8vCjrNjRTJNK3Ti1XF Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="389560055"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; d="scan'208";a="389560055"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2023 03:10:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="743851992"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; d="scan'208";a="743851992"
Received: from cschimpe-mobl1.ger.corp.intel.com (HELO [10.249.254.175])
 ([10.249.254.175])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2023 03:10:00 -0800
Message-ID: <797b983ed6313c2866c8b02aa73a5cab1fc4d4a3.camel@linux.intel.com>
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>, 
 intel-xe@lists.freedesktop.org
Date: Fri, 24 Nov 2023 12:09:58 +0100
In-Reply-To: <20231121100906.3587649-4-himal.prasad.ghimiray@intel.com>
References: <20231121100906.3587649-1-himal.prasad.ghimiray@intel.com>
 <20231121100906.3587649-4-himal.prasad.ghimiray@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
Subject: Re: [Intel-xe] [RFC v2 3/6] drm/xe/xe2: Allocate extra pages for
 ccs during bo create.
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

On Tue, 2023-11-21 at 15:39 +0530, Himal Prasad Ghimiray wrote:
> Each byte of CCS data now represents 512 bytes of main memory data.
> Allocate extra pages to handle ccs region for igfx too.
>=20
> Bspec:58796
>=20
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Himal Prasad Ghimiray
> <himal.prasad.ghimiray@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/regs/xe_gpu_commands.h |=C2=A0 2 +-
> =C2=A0drivers/gpu/drm/xe/xe_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 15 ++++++---------
> =C2=A0drivers/gpu/drm/xe/xe_device.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> =C2=A03 files changed, 8 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
> b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
> index 4402f72481dc..7f74592f99ce 100644
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
> index 4305f5cbc2ab..4730ee3c1012 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -2074,19 +2074,16 @@ int xe_bo_evict(struct xe_bo *bo, bool
> force_alloc)
> =C2=A0 * placed in system memory.
> =C2=A0 * @bo: The xe_bo
> =C2=A0 *
> - * If a bo has an allowable placement in XE_PL_TT memory, it can't
> use
> - * flat CCS compression, because the GPU then has no way to access
> the
> - * CCS metadata using relevant commands. For the opposite case, we
> need to
> - * allocate storage for the CCS metadata when the BO is not resident
> in
> - * VRAM memory.

Please extend modify this comment rather than deleting it


> - *
> =C2=A0 * Return: true if extra pages need to be allocated, false
> otherwise.
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
=C2=A0=C2=A0=C2=A0((IS_DGFX(xe) && (bo->flags &
> XE_BO_CREATE_VRAM_MASK)) ||

It looks like you have removed a restriction for DGFX here: If the BO
has SYSTEM set, then ccs pages are not needed.

> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0(!IS_DGFX(xe) && (bo->flags &
> XE_BO_CREATE_SYSTEM_BIT))));
> =C2=A0}
> =C2=A0
> =C2=A0/**
> diff --git a/drivers/gpu/drm/xe/xe_device.c
> b/drivers/gpu/drm/xe/xe_device.c
> index 07a3e4cf48d1..265f9ffc5323 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -551,7 +551,7 @@ void xe_device_wmb(struct xe_device *xe)
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

