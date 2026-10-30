Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FEE5606A31A
	for <intel-xe@archiver.kernel.org>; Fri, 30 Oct 2026 15:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IrV1+eb1
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D05741128C1;
	Fri, 30 Oct 2026 15:20:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 161EC1128D5
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Oct 2026 15:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793373631; x=1824909631;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=H64u6nyo4K21aih29tIPPqcTXQxpVKo/5nsBgx49IsQ=;
 b=IrV1+eb15LJNadISCTBouv3V5GB+bPqdf3x0FHMOpK4xpvVPpt7IeMDl
 SfNj8XoPmNJco78E/cU2KA08+ndRr/iIdC0nAuj6OAMYO9NHEv7IIagQ1
 ZxphSXaIhGxO76Ps+VhZQv8c/jplAQFPAfe5A0seTAZjyHSH+Mb3D/Q20
 y6yOFL4hfxvXIPqyTxeJOTNkmbZ/MHrsTqo7lCRQqtVwjRcEP6jDv/dBk
 2zc15eHtu4xaOXfiVCW3XTMbZXkDuQ2KyktOP/xBKc2JMIEgo8VYmJY8H
 nvK2ezYH0aoz8iAoFV7UoaFEPnFSPnOgGhwvsiDWZ7paj+BC580pG4Vj6 A==;
X-CSE-ConnectionGUID: f7gbM07ORzCtB1r6xPtMeg==
X-CSE-MsgGUID: 1oW/u2mJTGepFs4NRCYr5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2016177"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2016177"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 08:20:31 -0700
X-CSE-ConnectionGUID: XzSahyZKQY299kbusRdaqg==
X-CSE-MsgGUID: 7lIAB73+T9ip6YP92SR8zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5596357"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO [10.245.244.72])
 ([10.245.244.72])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 08:20:30 -0700
Message-ID: <e713f0f1f13c10dd99b8296399f09ec62b040e43.camel@linux.intel.com>
Subject: Re: [PATCH 1/6] drm/xe/migrate: allow larger chunk sizes for
 identity VRAM clears
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
Date: Fri, 30 Oct 2026 16:20:27 +0100
In-Reply-To: <20261030-migrate-bb-optimise-v1-1-b8d01649cfe9@intel.com>
References: <20261030-migrate-bb-optimise-v1-0-b8d01649cfe9@intel.com>
 <20261030-migrate-bb-optimise-v1-1-b8d01649cfe9@intel.com>
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
> xe_migrate_clear() currently clamps every clear pass to 8M. On
> platforms
> with Xe2 blitter instructions and no separate CCS copy emission, VRAM
> clears use the identity map without dynamic PTE updates and execute
> on
> the dedicated migration engine, so clamping each pass to 8M splits
> a 1G+ clear into 100+ jobs. 1G VRAM pages look quite normal in real
> workloads like llama.py with even a small model.
>=20
> It looks like the 8M limit comes from wanting a ~1ms preemption
> granularity, and dates back to i915. But consider:
>=20
> 1. Xe has kernel reserved BCS engine just for migrations on newer hw,
> =C2=A0=C2=A0 so no need to duke it out with userspace jobs. Further, we n=
ow
> also
> =C2=A0=C2=A0 dropped the GPU VM_BIND path, so there is now only a single
> migration
> =C2=A0=C2=A0 queue, so the ~1ms preemption granularity is maybe not a big=
 deal
> =C2=A0=C2=A0 anymore.
>=20
> 2. It does not take ~1ms to clear 8M (single MEM_SET) of VRAM through
> =C2=A0=C2=A0 the identity map. Currently we just lump everything in the s=
ame
> =C2=A0=C2=A0 bucket, even though we have VRAM clearing with identity, VRA=
M
> =C2=A0=C2=A0 clearing with PTE emit, and then copying between VRAM and sy=
stem
> =C2=A0=C2=A0 memory, which will have different characteristics and perfor=
mance.
> =C2=A0=C2=A0 Applying the same 8M limit everywhere seems overly cautious.
>=20
> With that be more optimistic and bump the fast path VRAM clearing
> through identity map to 128M per single MEM_SET instruction. This
> still
> only takes up to around < ~2ms, or < ~1ms if boosted. For very large
> clears, this massively lowers the number of GPU jobs, reducing
> pressure
> on the bb pool and as a bonus gives slightly lower CPU/GPU overhead.
>=20
> Assisted-by: LLM
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/9644
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

> ---
> =C2=A0drivers/gpu/drm/xe/xe_migrate.c | 6 ++++++
> =C2=A01 file changed, 6 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c
> b/drivers/gpu/drm/xe/xe_migrate.c
> index 70408fa0a606..1a216fb12d2b 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -246,6 +246,7 @@ struct xe_migrate {
> =C2=A0
> =C2=A0#define MAX_PREEMPTDISABLE_TRANSFER SZ_8M /* Around 1ms. */
> =C2=A0#define MAX_CCS_LIMITED_TRANSFER SZ_4M /* XE_PAGE_SIZE *
> (FIELD_MAX(XE2_CCS_SIZE_MASK) + 1) */
> +#define MAX_IDENTITY_CLEAR_TRANSFER SZ_128M
> =C2=A0#define NUM_PT_SLOTS 48
> =C2=A0#define LEVEL0_PAGE_TABLE_ENCODE_SIZE SZ_2M
> =C2=A0#define MAX_NUM_PTE 512
> @@ -1964,6 +1965,11 @@ struct dma_fence *xe_migrate_clear(struct
> xe_migrate *m,
> =C2=A0		u32 avail_pts =3D max_mem_transfer_per_pass(xe) /
> LEVEL0_PAGE_TABLE_ENCODE_SIZE;
> =C2=A0
> =C2=A0		clear_L0 =3D xe_migrate_res_sizes(m, &src_it);
> +		if (clear_vram && !xe_migrate_needs_ccs_emit(xe) &&
> +		=C2=A0=C2=A0=C2=A0 gt->info.has_xe2_blt_instructions &&
> +		=C2=A0=C2=A0=C2=A0 xe_migrate_allow_identity(clear_L0, &src_it))
> +			clear_L0 =3D min_t(u64,
> MAX_IDENTITY_CLEAR_TRANSFER,
> +					 src_it.size);
> =C2=A0
> =C2=A0		/* Calculate final sizes and batch size.. */
> =C2=A0		pte_flags =3D clear_vram ? PTE_UPDATE_FLAG_IS_VRAM :
> 0;
