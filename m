Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83424C4345F
	for <intel-xe@archiver.kernel.org>; Mon, 22 Apr 2024 10:15:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3051F11296E;
	Mon, 22 Apr 2024 10:15:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WjbXV1s3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 201C411296D
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Apr 2024 10:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713780928; x=1745316928;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=KnEWSzNJv8oqOQBerxJ0Aki7VsQpz4OyLkzKyt8mq80=;
 b=WjbXV1s3Iqt3PfTpZkgh7+tjiNSYCn+9cA3+8aIGKMyjEUlT7G0SUnNN
 bj9pgcne17/rv80Ojj2pfb9d3GwlwTUicql7WLS6LPjMi7XTebgQuJT5Q
 RFZy4M0oYOe2d1IKmZev1tCoW3EmXeBu3vgNgmZU/CCfqIUkTpg+uoEjP
 jf5K7bjACOZnkecYMQJv49kE71tw+UqtTI9cQQA/Ad0k3xIumUUaOVKNc
 cUGgDve3qz1UQY9ZzN1a8mhSmN1gmL2EBctvsSoxIhIqG8XsFODaIQryh
 2yPUx1s0xM+ZNc2DXmO6AROSozbvyEm3dCinsCK6Hu5Ddumec8ex54uql Q==;
X-CSE-ConnectionGUID: LsOGP1YDT7WD8BXbvHLpnQ==
X-CSE-MsgGUID: BSbzxyswR165wDKOwZbJYA==
X-IronPort-AV: E=McAfee;i="6600,9927,11051"; a="20005704"
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; d="scan'208";a="20005704"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 03:15:28 -0700
X-CSE-ConnectionGUID: BuUJ4apFQqKKXPSdz4CsjA==
X-CSE-MsgGUID: D2vDKTEJQ9Gktenq+Tqemg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; d="scan'208";a="24010232"
Received: from binis42x-mobl.gar.corp.intel.com (HELO [10.249.254.110])
 ([10.249.254.110])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 03:15:26 -0700
Message-ID: <8b7cc93b506aa34f5dc2775ace923388321d5d35.camel@linux.intel.com>
Subject: Re: [PATCH v3 07/11] drm/xe/xe2hpg: Remove extra allocation of CCS
 pages for dgfx
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>, 
 intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Akshata Jahagirdar
 <akshata.jahagirdar@intel.com>
Date: Mon, 22 Apr 2024 12:15:24 +0200
In-Reply-To: <20240408170545.3769566-8-balasubramani.vivekanandan@intel.com>
References: <20240408170545.3769566-1-balasubramani.vivekanandan@intel.com>
 <20240408170545.3769566-8-balasubramani.vivekanandan@intel.com>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
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

Hi!

On Mon, 2024-04-08 at 22:35 +0530, Balasubramani Vivekanandan wrote:
> From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
>=20
> On Xe2 dGPU, compression is only supported with VRAM. When copying
> from
> VRAM -> system memory the KMD uses mapping with uncompressed PAT
> so the copy in system memory is guaranteed to be uncompressed.
> When restoring such buffers from system memory -> VRAM the KMD can't
> easily know which pages were originally compressed, so we always use
> uncompressed -> uncompressed here.
> so this means that there's no need for extra CCS storage on such
> platforms.
>=20
> v2: More description added to commit message

Let's say we have a VRAM bo with compressed content. Then it is evicted
to system. And then it is restored back to VRAM, (and I'd presume the
vma PTEs are still indicating compressed access).

But it sounds like from the commit message, after eviction +
restoration, the content will be uncompressed. Could you explain how
this is handled? What will happen on the next gpu access with
compressed vma PTEs?

Thanks,
Thomas


>=20
> Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
> Signed-off-by: Balasubramani Vivekanandan
> <balasubramani.vivekanandan@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_bo.c | 3 +++
> =C2=A01 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 6166bc715656..fdeb3691d3f6 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -2201,6 +2201,9 @@ bool xe_bo_needs_ccs_pages(struct xe_bo *bo)
> =C2=A0{
> =C2=A0	struct xe_device *xe =3D xe_bo_device(bo);
> =C2=A0
> +	if (GRAPHICS_VER(xe) >=3D 20 && IS_DGFX(xe))
> +		return false;
> +
> =C2=A0	if (!xe_device_has_flat_ccs(xe) || bo->ttm.type !=3D
> ttm_bo_type_device)
> =C2=A0		return false;
> =C2=A0

