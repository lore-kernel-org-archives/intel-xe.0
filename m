Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D79E606A31D
	for <intel-xe@archiver.kernel.org>; Fri, 30 Oct 2026 15:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=S/MPLksI
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E0821128BF;
	Fri, 30 Oct 2026 15:21:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7442910E249
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Oct 2026 15:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793373705; x=1824909705;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=XzXszaGVWMwcwFRR0T83UWzJI4M+LISU6eN+FVmMhns=;
 b=S/MPLksIeu3/JPFdtf9g/Jle625BrE+/0uq3DU6kaWPfMCIAaGs19Ddd
 3NPKgBOeacYmKpaHCsU9mfY6wmsbD3/ZAZ8HM6mqLLyQ/b+qATB4XPkXy
 5rbgLuTnS0mE9L3gi90FewHoZdUi5ibuXUEroADBz/lDXhIKoyNDpZ7AV
 tC0zGRwqjTsaS3V1NYMRl1N/HGMRPqKO6IGFLM9CooOXMXVzbF4u4E5Ei
 1+yczy4RF1rzJy+O6s33ysQZQQHRKxs6Ovzz5l/x1oNGJQuNvMpMWmk3B
 vIgcwY6GwZRN0OZWVuYnI1+XwYWYcaEzUdaF3oljTIJyPVmWsGjxTeCCa w==;
X-CSE-ConnectionGUID: 5Qyh622EQZiK088ionlKyQ==
X-CSE-MsgGUID: hpUiQypoQBm/xnARQ0F88w==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2044522"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2044522"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 08:21:45 -0700
X-CSE-ConnectionGUID: 5qCEPIhVQLm72dAdFT1yhA==
X-CSE-MsgGUID: h3xoC+JrTOOyNdgQXvG1sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="7297913"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO [10.245.244.72])
 ([10.245.244.72])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 08:21:44 -0700
Message-ID: <39655ff5489c884bda44278f6d84c51c217bd5ec.camel@linux.intel.com>
Subject: Re: [PATCH 2/6] drm/xe/bb: drop per-batch prefetch padding
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
Date: Fri, 30 Oct 2026 16:21:42 +0100
In-Reply-To: <20261030-migrate-bb-optimise-v1-2-b8d01649cfe9@intel.com>
References: <20261030-migrate-bb-optimise-v1-0-b8d01649cfe9@intel.com>
 <20261030-migrate-bb-optimise-v1-2-b8d01649cfe9@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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

On Fri, 2026-10-30 at 11:49 +0000, Matthew Auld wrote:
> xe_bb_new() currently appends bb_prefetch() (512B or 1K) to every
> batch suballocation, inflating a 36B identity-mapped clear batch to
> ~1K and also causing xe_sa_bo_flush_write() to copy up to 1K of
> unused
> padding to VRAM on every batch.
>=20
> However, both kernel_bb_pool and usm.bb_pool are initialised via
> xe_sa_bo_manager_init(), which already reserves a 4K guard region at
> the end of the backing BO to cover CS prefetch, and prefetching into
> adjacent suballocations within the mapped pool should be harmless.
> Drop
> bb_prefetch().
>=20
> This should reduce pressure on the bb pool.
>=20
> Assisted-by: LLM
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/9644
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>


> ---
> =C2=A0drivers/gpu/drm/xe/xe_bb.c | 26 ++++++--------------------
> =C2=A01 file changed, 6 insertions(+), 20 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
> index b896b6f6615c..b2603902c147 100644
> --- a/drivers/gpu/drm/xe/xe_bb.c
> +++ b/drivers/gpu/drm/xe/xe_bb.c
> @@ -14,20 +14,6 @@
> =C2=A0#include "xe_sched_job.h"
> =C2=A0#include "xe_vm_types.h"
> =C2=A0
> -static int bb_prefetch(struct xe_gt *gt)
> -{
> -	struct xe_device *xe =3D gt_to_xe(gt);
> -
> -	if (GRAPHICS_VERx100(xe) >=3D 1250 && xe_gt_is_main_type(gt))
> -		/*
> -		 * RCS and CCS require 1K, although other engines
> would be
> -		 * okay with 512.
> -		 */
> -		return SZ_1K;
> -	else
> -		return SZ_512;
> -}
> -
> =C2=A0struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 dwords, bool usm)
> =C2=A0{
> =C2=A0	struct xe_tile *tile =3D gt_to_tile(gt);
> @@ -38,13 +24,13 @@ struct xe_bb *xe_bb_new(struct xe_gt *gt, u32
> dwords, bool usm)
> =C2=A0		return ERR_PTR(-ENOMEM);
> =C2=A0
> =C2=A0	/*
> -	 * We need to allocate space for the requested number of
> dwords,
> -	 * one additional MI_BATCH_BUFFER_END dword, and additional
> buffer
> -	 * space to accommodate the platform-specific hardware
> prefetch
> -	 * requirements.
> +	 * We need to allocate space for the requested number of
> dwords and
> +	 * one additional MI_BATCH_BUFFER_END dword. Hardware CS
> prefetch
> +	 * at the end of the pool BO is covered by the SZ_4K guard
> region
> +	 * reserved by xe_sa_bo_manager_init().
> =C2=A0	 */
> =C2=A0	bb->bo =3D xe_sa_bo_new(!usm ? tile->mem.kernel_bb_pool : gt-
> >usm.bb_pool,
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4 * (dwords + 1) + bb_prefetch(gt));
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4 * (dwords + 1));
> =C2=A0	if (IS_ERR(bb->bo)) {
> =C2=A0		err =3D PTR_ERR(bb->bo);
> =C2=A0		goto err;
> @@ -129,7 +115,7 @@ __xe_bb_create_job(struct xe_exec_queue *q,
> struct xe_bb *bb, u64 *addr)
> =C2=A0	if (bb->len =3D=3D 0 || bb->cs[bb->len - 1] !=3D
> MI_BATCH_BUFFER_END)
> =C2=A0		bb->cs[bb->len++] =3D MI_BATCH_BUFFER_END;
> =C2=A0
> -	xe_gt_assert(q->gt, bb->len * 4 + bb_prefetch(q->gt) <=3D
> size);
> +	xe_gt_assert(q->gt, bb->len * 4 <=3D size);
> =C2=A0
> =C2=A0	xe_sa_bo_flush_write(bb->bo);
> =C2=A0
