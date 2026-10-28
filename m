Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791F2606A31A
	for <intel-xe@archiver.kernel.org>; Wed, 28 Oct 2026 10:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JL+p+WQO
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F0AA10FB40;
	Wed, 28 Oct 2026 10:40:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E19D10FB4F
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Oct 2026 10:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793184041; x=1824720041;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=XMfdoD3eqRVmmkBvjCNgpNlml6WjnNuzxdDi7StoWFw=;
 b=JL+p+WQOAt5bpDNbU6CD68qP6Opar7xGXu8eU450qvXE2FLTcmYyrpci
 bbGfbpANUoP8SCpeuKdlvnwyUWRLFQkSfldZogFIA8L6tVrEXzRJwBMw8
 NAfXdBJC8L5bd2fMK+HxCYEFu/qLrLIOPiYT1J8osDJhkfbuna799Vv0Z
 sWEefF8/haeygRx71AAwB/QTzqcSkNQGrk42lho0D4z/8p63jqMKiHrSJ
 gTB7u6j7Fz4TeIsyxsgyuhQwdWrwj/CS+BDaqJuupnpe4H0VVsWmHEANR
 CaBg5nvU0twP3XImue+MaO9bIFHzvORhUXURJo+HwyeFx+OqllZD1sUDk Q==;
X-CSE-ConnectionGUID: B/OGoLjRTfWQCAYarctPZw==
X-CSE-MsgGUID: vZix0CRgS1S/vD3GHo6QtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="2005429"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="2005429"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 03:40:40 -0700
X-CSE-ConnectionGUID: SO8alTFURXCdWVjmi0/Htg==
X-CSE-MsgGUID: 6TfsokfVRAORJMBtbKqCfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="5203629"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.146])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 03:40:39 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>, intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: Re: [PATCH v3 2/2] drm/xe/display: Use xe_bo_addr_iter in remapped
 DPT pinning
In-Reply-To: <20261027180354.340849-4-dev@lankhorst.se>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261027180354.340849-3-dev@lankhorst.se>
 <20261027180354.340849-4-dev@lankhorst.se>
Date: Wed, 28 Oct 2026 12:40:36 +0200
Message-ID: <c9bbe8de41cb7ef856b6da950f0f57bc7b0d9456@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 27 Oct 2026, Maarten Lankhorst <dev@lankhorst.se> wrote:
> Right now we're using xe_bo_addr() on each individual address, which gives
> problems at larger resolution and sizes, since it's a O(N=C2=B2).
>
> By using xe_bo_addr_iter_first() + xe_bo_addr_iter_addr(), the time
> complexity is reduced again to O(N).
>
> To fix rotated pinning requires some thinking.
>
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> ---
> Changes since v1:
> - handle plane->src_stride !=3D plane->width
> Changes since v2:
> - Add missing u32 casts.
> ---
>  drivers/gpu/drm/xe/display/xe_fb_pin.c | 29 ++++++++++++++------------
>  1 file changed, 16 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/=
display/xe_fb_pin.c
> index e09116265ae95..e6c375f47a65b 100644
> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> @@ -17,6 +17,7 @@
>  #include "xe_ggtt.h"
>  #include "xe_pat.h"
>  #include "xe_pm.h"
> +#include "xe_res_cursor.h"
>  #include "xe_vram_types.h"
>=20=20
>  static void
> @@ -67,15 +68,15 @@ write_dpt_remapped_linear(struct xe_bo *bo, struct io=
sys_map *map,
>  	struct xe_ggtt *ggtt =3D xe_device_get_root_tile(xe)->mem.ggtt;
>  	const u64 pte =3D xe_ggtt_encode_pte_flags(ggtt, bo,
>  						 xe_cache_pat_idx(xe, XE_CACHE_NONE));
> -	unsigned int offset =3D plane->offset * XE_PAGE_SIZE;
> -	unsigned int size =3D plane->size;
> +	unsigned int offset =3D (u32)plane->offset * XE_PAGE_SIZE;
> +	unsigned int size =3D (u32)plane->size * XE_PAGE_SIZE;

What do you need the casts for? Useless?

> +	struct xe_res_cursor cur;
>=20=20
> -	while (size--) {
> -		u64 addr =3D xe_bo_addr(bo, offset, XE_PAGE_SIZE);
> +	for (xe_bo_addr_iter_first(bo, &cur, offset, size); cur.remaining; xe_r=
es_next(&cur, XE_PAGE_SIZE)) {
> +		u64 addr =3D xe_bo_addr_iter_addr(&cur);
>=20=20
>  		iosys_map_wr(map, dest, u64, addr | pte);
>  		dest +=3D sizeof(u64);
> -		offset +=3D XE_PAGE_SIZE;
>  	}
>=20=20
>  	return dest;
> @@ -90,20 +91,22 @@ write_dpt_remapped_tiled(struct xe_bo *bo, struct ios=
ys_map *map,
>  	struct xe_ggtt *ggtt =3D xe_device_get_root_tile(xe)->mem.ggtt;
>  	const u64 pte =3D xe_ggtt_encode_pte_flags(ggtt, bo,
>  						 xe_cache_pat_idx(xe, XE_CACHE_NONE));
> -	unsigned int offset, column, row;
> +	u32 offset =3D (u32)plane->offset * XE_PAGE_SIZE;

Ditto.

> +	struct xe_res_cursor cur;
>=20=20
> -	for (row =3D 0; row < plane->height; row++) {
> -		offset =3D (plane->offset + plane->src_stride * row) *
> -			 XE_PAGE_SIZE;
> -
> -		for (column =3D 0; column < plane->width; column++) {
> -			u64 addr =3D xe_bo_addr(bo, offset, XE_PAGE_SIZE);
> +	xe_bo_addr_iter_first(bo, &cur, offset, (u32)plane->height * plane->src=
_stride * XE_PAGE_SIZE);
> +	while (cur.remaining) {
> +		for (u32 column =3D 0; column < plane->width; column++) {
> +			u64 addr =3D xe_bo_addr_iter_addr(&cur);
>=20=20
>  			iosys_map_wr(map, dest, u64, addr | pte);
>  			dest +=3D sizeof(u64);
> -			offset +=3D XE_PAGE_SIZE;
> +			xe_res_next(&cur, XE_PAGE_SIZE);
>  		}
>=20=20
> +		if (plane->src_stride !=3D plane->width)
> +			xe_res_next(&cur, (u32)(plane->src_stride - plane->width) * XE_PAGE_S=
IZE);
> +
>  		dest =3D write_dpt_padding(map, dest,
>  					 plane->dst_stride - plane->width);
>  	}

--=20
Jani Nikula, Intel
