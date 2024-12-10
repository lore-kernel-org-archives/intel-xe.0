Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47DEDE7717F
	for <intel-xe@archiver.kernel.org>; Tue, 10 Dec 2024 16:40:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 138DB10E923;
	Tue, 10 Dec 2024 16:40:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aEMgqhoP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BFC310E923
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Dec 2024 16:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733848823; x=1765384823;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=SYKyJEhqW3z/ZZTw0I1rKdIhGgLAIkPPbPOcQL0Xu5g=;
 b=aEMgqhoPncJIxa5T4HI4ciPCYKMF2aL9CGEcCqcwT4QFQ0QBY/DsAjf8
 xCl/Djxx0r5ZDzcGnjbc4U2q7yTyd+sJTpMj9YzCoMUPcr2Z76i4LdD1N
 MJH+UfnSDaFMSfPTT3O3m3SMZSqAmNEGKvHyq39adUEBnZIbyeCpdGcsJ
 eI3zfTQVesofe3v0FARdw0fjsUILhuAflVXDHHUzzLIGqyDajUZCdh8Vs
 5MzIuACx0sX1XVUWGJlPHGsh1O2AlVtG1FgAPNQ30stH/qfJabJ8PKmLQ
 F0+6NVuPR4CpN8mSI+f0ajAY7l8BAzz8X86oTyJp/ENHwMVJXdHKPuY2a Q==;
X-CSE-ConnectionGUID: ts2pWGW3TSCT/TLWtYMtKw==
X-CSE-MsgGUID: 012vI99XQsW26bqEln9zWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="33538610"
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; d="scan'208";a="33538610"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 08:40:18 -0800
X-CSE-ConnectionGUID: Q6h1u1K3SV2WGxKhqTKwKg==
X-CSE-MsgGUID: 2KgB8T/CRwmU8Kouy+yD4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; d="scan'208";a="95660103"
Received: from mklonows-mobl1.ger.corp.intel.com (HELO [10.245.246.4])
 ([10.245.246.4])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 08:40:17 -0800
Message-ID: <41de753b03bb5e86be011277429649d6d644687f.camel@linux.intel.com>
Subject: Re: [PATCH v3 2/2] drm/xe: Wait for migration job before unmapping
 pages
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, stable@vger.kernel.org, Matthew Auld
 <matthew.auld@intel.com>
Date: Tue, 10 Dec 2024 17:39:58 +0100
In-Reply-To: <20241210161552.998242-2-nirmoy.das@intel.com>
References: <20241210161552.998242-1-nirmoy.das@intel.com>
 <20241210161552.998242-2-nirmoy.das@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 (3.54.2-1.fc41) 
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

On Tue, 2024-12-10 at 17:15 +0100, Nirmoy Das wrote:
> Fix a potential GPU page fault during tt -> system moves by waiting
> for
> migration jobs to complete before unmapping SG. This ensures that
> IOMMU
> mappings are not prematurely torn down while a migration job is still
> in
> progress.
>=20
> v2: Use intr=3Dfalse(Matt A)
> v3: Update commit message(Matt A)
>=20
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3466
> Fixes: 75521e8b56e8 ("drm/xe: Perform dma_map when moving system
> buffer objects to TT")
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: <stable@vger.kernel.org> # v6.11+
> Cc: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_bo.c | 10 +++++++++-
> =C2=A01 file changed, 9 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 06931df876ab..0a41b6c0583a 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -857,8 +857,16 @@ static int xe_bo_move(struct ttm_buffer_object
> *ttm_bo, bool evict,
> =C2=A0
> =C2=A0out:
> =C2=A0	if ((!ttm_bo->resource || ttm_bo->resource->mem_type =3D=3D
> XE_PL_SYSTEM) &&
> -	=C2=A0=C2=A0=C2=A0 ttm_bo->ttm)
> +	=C2=A0=C2=A0=C2=A0 ttm_bo->ttm) {
> +		long timeout =3D dma_resv_wait_timeout(ttm_bo-
> >base.resv,
> +						=C2=A0=C2=A0=C2=A0=C2=A0
> DMA_RESV_USAGE_BOOKKEEP,
> +						=C2=A0=C2=A0=C2=A0=C2=A0 false,
> +						=C2=A0=C2=A0=C2=A0=C2=A0
> MAX_SCHEDULE_TIMEOUT);
> +		if (timeout < 0)
> +			ret =3D timeout;
> +
> =C2=A0		xe_tt_unmap_sg(ttm_bo->ttm);
> +	}
> =C2=A0
> =C2=A0	return ret;
> =C2=A0}

I assume here we're waiting for the move fence, right? However if
@evict is true, we should hit the ttm_bo_wait_free_node() path. In what
cases do we hit this without evict being true?

Also, shouldn't it be sufficient to wait for DMA_RESV_USAGE_KERNEL
here?=20

Thanks,
Thomas



