Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F216AC4707B
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jan 2024 16:06:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E66B10E84D;
	Thu, 18 Jan 2024 16:06:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D29C10E845
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jan 2024 16:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705593974; x=1737129974;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=81R6oohUSbekc5Gdeknq23EGoQT7pZAW3wXjGSAHPUY=;
 b=lnY50hmVohmoCn8zZiIgGH1RDjoigf5DQ022YtAt7NvktYvir2KAj+pW
 NwiKMUmfCyULz4RczyOghlWGl2TzFtexjSGJD7RuWLuZJfAv+q6U4Oeo9
 uIuwiKSTeNaaf1h/ERVX/5LB+xGn0luaKC8OcQBtI0fnZJMYX9G0lsxd1
 LeZrjU2WXJh4A2zaodozxwuViSmnEfE3PnP+wY/LPwt7eQcH5iyaCbhxC
 +EfTQdFkxi7iOYe+ADWPLQNdOS3AxjeMl6AfBINmxpE8zh+op7S0q6rEm
 MZU+/qrc74v8z3kWbO3AlK1RpvmvSdYWl+jVE4T1IUApTZsaz/IFKNPbd A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="380713"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; 
   d="scan'208";a="380713"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 08:06:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; d="scan'208";a="26796310"
Received: from clanggaa-mobl.ger.corp.intel.com (HELO [10.249.254.203])
 ([10.249.254.203])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 08:06:12 -0800
Message-ID: <3781d25196a6312bffd46e79a862f5b720533ba1.camel@linux.intel.com>
Subject: Re: [PATCH v3] drm/xe/xe2: Use XE_CACHE_WB pat index
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>, 
 intel-xe@lists.freedesktop.org
Date: Thu, 18 Jan 2024 17:06:09 +0100
In-Reply-To: <20240116120512.1542167-1-himal.prasad.ghimiray@intel.com>
References: <20240116120512.1542167-1-himal.prasad.ghimiray@intel.com>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
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
Cc: Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, 2024-01-16 at 17:35 +0530, Himal Prasad Ghimiray wrote:
> The pat table entry associated with XE_CACHE_WB is coherent whereas
> XE_CACHE_NONE is non coherent. Use the coherent entry XE_CACHE_WB for
> buffers not supporting compression.=C2=A0

"since that is what the migrate code currently expects"?

> For read/write to flat ccs region
> the issue is not related to coherency with cpu. The hardware expects
> the pat index associated with GPUVA for indirect access to be
> compression enabled hence use XE_CACHE_NONE_COMPRESSION.
>=20
> Fixes the broken "xe_migrate_test kunit test" on LNL.
>=20
> v2
> - Fix the argument to emit_pte, pass the bool directly. (Thomas)
>=20
> v3
> - Rebase
> - Update commit message (Matt)
>=20
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

There needs to be a Fixes: tag here. Please use "dim fixes" to get it
right:

https://drm.pages.freedesktop.org/maintainer-tools/dim.html


> Signed-off-by: Himal Prasad Ghimiray
> <himal.prasad.ghimiray@intel.com>

Otherwise LGTM.

/Thomas


> ---
> =C2=A0drivers/gpu/drm/xe/xe_migrate.c | 14 +++++++-------
> =C2=A01 file changed, 7 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c
> b/drivers/gpu/drm/xe/xe_migrate.c
> index 44725f978f3e..5de8ee4245c3 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -481,7 +481,7 @@ static void emit_pte(struct xe_migrate *m,
> =C2=A0	/* Indirect access needs compression enabled uncached PAT
> index */
> =C2=A0	if (GRAPHICS_VERx100(xe) >=3D 2000)
> =C2=A0		pat_index =3D is_comp_pte ? xe-
> >pat.idx[XE_CACHE_NONE_COMPRESSION] :
> -					=C2=A0 xe-
> >pat.idx[XE_CACHE_NONE];
> +					=C2=A0 xe->pat.idx[XE_CACHE_WB];
> =C2=A0	else
> =C2=A0		pat_index =3D xe->pat.idx[XE_CACHE_WB];
> =C2=A0
> @@ -769,14 +769,14 @@ struct dma_fence *xe_migrate_copy(struct
> xe_migrate *m,
> =C2=A0		if (src_is_vram && xe_migrate_allow_identity(src_L0,
> &src_it))
> =C2=A0			xe_res_next(&src_it, src_L0);
> =C2=A0		else
> -			emit_pte(m, bb, src_L0_pt, src_is_vram,
> true, &src_it, src_L0,
> -				 src);
> +			emit_pte(m, bb, src_L0_pt, src_is_vram,
> copy_system_ccs,
> +				 &src_it, src_L0, src);
> =C2=A0
> =C2=A0		if (dst_is_vram && xe_migrate_allow_identity(src_L0,
> &dst_it))
> =C2=A0			xe_res_next(&dst_it, src_L0);
> =C2=A0		else
> -			emit_pte(m, bb, dst_L0_pt, dst_is_vram,
> true, &dst_it, src_L0,
> -				 dst);
> +			emit_pte(m, bb, dst_L0_pt, dst_is_vram,
> copy_system_ccs,
> +				 &dst_it, src_L0, dst);
> =C2=A0
> =C2=A0		if (copy_system_ccs)
> =C2=A0			emit_pte(m, bb, ccs_pt, false, false,
> &ccs_it, ccs_size, src);
> @@ -1018,8 +1018,8 @@ struct dma_fence *xe_migrate_clear(struct
> xe_migrate *m,
> =C2=A0		if (clear_vram &&
> xe_migrate_allow_identity(clear_L0, &src_it))
> =C2=A0			xe_res_next(&src_it, clear_L0);
> =C2=A0		else
> -			emit_pte(m, bb, clear_L0_pt, clear_vram,
> true, &src_it, clear_L0,
> -				 dst);
> +			emit_pte(m, bb, clear_L0_pt, clear_vram,
> clear_system_ccs,
> +				 &src_it, clear_L0, dst);
> =C2=A0
> =C2=A0		bb->cs[bb->len++] =3D MI_BATCH_BUFFER_END;
> =C2=A0		update_idx =3D bb->len;

