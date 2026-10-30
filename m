Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D679F606A31F
	for <intel-xe@archiver.kernel.org>; Fri, 30 Oct 2026 15:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EGfjQIlH
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F05310E257;
	Fri, 30 Oct 2026 15:25:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0D7C10E254
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Oct 2026 15:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793373924; x=1824909924;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=lhdrjNrSj5oudmvrKk4ju5+yBYY6xFcqOfnPqEaWECg=;
 b=EGfjQIlHdFm1tzjeVLG8zyRO/ehSMfwzY/kJCs3Nud5pN25hGeQnmAOz
 RPy4zKVdYmSpNgQ3r2MwULASz/RH9/whXiiQnGyZsPqZABNh16aQ/Fir8
 rvXUUA9HOUjhRy1lrjRoE127R03f67lcM4oi8xlVi26hIzmPOPz/OqkGJ
 alK83avkgK25U+kCPpD9S9plt6HRV5jKqPFS8AJ9rrRquoIKO5+mpC0ks
 /E/lM/i9fq5R/8nEfV9kIR6HWPfdCVoucpfP7CoOmS32TMSXrpjdVwkrK
 kf3mvKlfmOXPr6AItQgMoxZTbH4jE3ieBQUZfAPwmzIrbix8SSmYdANk3 w==;
X-CSE-ConnectionGUID: BDcdOwSzTwCnG0yN62qDTQ==
X-CSE-MsgGUID: m+f7oaZtS+qfTQ0byBq3qQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2052991"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2052991"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 08:25:23 -0700
X-CSE-ConnectionGUID: whqTpH9cRRGGqotJFTtBDg==
X-CSE-MsgGUID: YmfCX8EVRXCvT1uhzY9vtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5558101"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO [10.245.244.72])
 ([10.245.244.72])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 08:25:23 -0700
Message-ID: <bc9ed87d9da7d116bf53444164ec8a21d7719ada.camel@linux.intel.com>
Subject: Re: [PATCH 4/6] drm/xe/sa: allow callers to specify interruptible
 suballocator waits
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
Date: Fri, 30 Oct 2026 16:25:20 +0100
In-Reply-To: <20261030-migrate-bb-optimise-v1-4-b8d01649cfe9@intel.com>
References: <20261030-migrate-bb-optimise-v1-0-b8d01649cfe9@intel.com>
 <20261030-migrate-bb-optimise-v1-4-b8d01649cfe9@intel.com>
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
> __xe_sa_bo_new() currently hardcodes intr=3Dtrue when calling
> drm_suballoc_new(), making every suballocator wait interruptible even
> when the caller cannot tolerate -ERESTARTSYS.
>=20
> Plumb a bool intr parameter through __xe_sa_bo_new(), xe_sa_bo_new(),
> and __xe_bb_new(), while defaulting xe_bb_new() to false for
> kernel-internal callers.
>=20
> Assisted-by: LLM
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

> ---
> =C2=A0drivers/gpu/drm/xe/xe_bb.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 4 ++--
> =C2=A0drivers/gpu/drm/xe/xe_bb.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 9 ++++++++-
> =C2=A0drivers/gpu/drm/xe/xe_guc_buf.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 4 +=
+--
> =C2=A0drivers/gpu/drm/xe/xe_page_reclaim.c | 2 +-
> =C2=A0drivers/gpu/drm/xe/xe_sa.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 6 ++++--
> =C2=A0drivers/gpu/drm/xe/xe_sa.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 9 ++++++---
> =C2=A06 files changed, 23 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
> index 771e50e7c4e3..7f71233b1036 100644
> --- a/drivers/gpu/drm/xe/xe_bb.c
> +++ b/drivers/gpu/drm/xe/xe_bb.c
> @@ -14,7 +14,7 @@
> =C2=A0#include "xe_sched_job.h"
> =C2=A0#include "xe_vm_types.h"
> =C2=A0
> -struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 dwords, bool usm)
> +struct xe_bb *__xe_bb_new(struct xe_gt *gt, u32 dwords, bool usm,
> bool intr)
> =C2=A0{
> =C2=A0	struct xe_tile *tile =3D gt_to_tile(gt);
> =C2=A0	struct xe_bb *bb =3D kmalloc_obj(*bb);
> @@ -30,7 +30,7 @@ struct xe_bb *xe_bb_new(struct xe_gt *gt, u32
> dwords, bool usm)
> =C2=A0	 * reserved by xe_sa_bo_manager_init().
> =C2=A0	 */
> =C2=A0	bb->bo =3D xe_sa_bo_new(!usm ? tile->mem.kernel_bb_pool : gt-
> >usm.bb_pool,
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4 * (dwords + 1));
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4 * (dwords + 1), intr);
> =C2=A0	if (IS_ERR(bb->bo)) {
> =C2=A0		err =3D PTR_ERR(bb->bo);
> =C2=A0		goto err;
> diff --git a/drivers/gpu/drm/xe/xe_bb.h b/drivers/gpu/drm/xe/xe_bb.h
> index b5cc65506696..6f685176d4e8 100644
> --- a/drivers/gpu/drm/xe/xe_bb.h
> +++ b/drivers/gpu/drm/xe/xe_bb.h
> @@ -6,6 +6,8 @@
> =C2=A0#ifndef _XE_BB_H_
> =C2=A0#define _XE_BB_H_
> =C2=A0
> +#include <linux/types.h>
> +
> =C2=A0#include "xe_bb_types.h"
> =C2=A0
> =C2=A0struct dma_fence;
> @@ -14,7 +16,12 @@ struct xe_gt;
> =C2=A0struct xe_exec_queue;
> =C2=A0struct xe_sched_job;
> =C2=A0
> -struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 dwords, bool usm);
> +struct xe_bb *__xe_bb_new(struct xe_gt *gt, u32 dwords, bool usm,
> bool intr);
> +
> +static inline struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 dwords,
> bool usm)
> +{
> +	return __xe_bb_new(gt, dwords, usm, false);
> +}
> =C2=A0struct xe_sched_job *xe_bb_create_job(struct xe_exec_queue *q,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_bb *bb);
> =C2=A0struct xe_sched_job *xe_bb_create_migration_job(struct xe_exec_queu=
e
> *q,
> diff --git a/drivers/gpu/drm/xe/xe_guc_buf.c
> b/drivers/gpu/drm/xe/xe_guc_buf.c
> index 7a8efb62df60..ec0b64a1d4c1 100644
> --- a/drivers/gpu/drm/xe/xe_guc_buf.c
> +++ b/drivers/gpu/drm/xe/xe_guc_buf.c
> @@ -95,7 +95,7 @@ struct xe_guc_buf xe_guc_buf_reserve(struct
> xe_guc_buf_cache *cache, u32 dwords)
> =C2=A0	struct drm_suballoc *sa;
> =C2=A0
> =C2=A0	if (cache->sam)
> -		sa =3D __xe_sa_bo_new(cache->sam, dwords *
> sizeof(u32), GFP_ATOMIC);
> +		sa =3D __xe_sa_bo_new(cache->sam, dwords *
> sizeof(u32), GFP_ATOMIC, false);
> =C2=A0	else
> =C2=A0		sa =3D ERR_PTR(-EOPNOTSUPP);
> =C2=A0
> @@ -117,7 +117,7 @@ struct xe_guc_buf xe_guc_buf_from_data(struct
> xe_guc_buf_cache *cache,
> =C2=A0{
> =C2=A0	struct drm_suballoc *sa;
> =C2=A0
> -	sa =3D __xe_sa_bo_new(cache->sam, size, GFP_ATOMIC);
> +	sa =3D __xe_sa_bo_new(cache->sam, size, GFP_ATOMIC, false);
> =C2=A0	if (!IS_ERR(sa))
> =C2=A0		memcpy(xe_sa_bo_cpu_addr(sa), data, size);
> =C2=A0
> diff --git a/drivers/gpu/drm/xe/xe_page_reclaim.c
> b/drivers/gpu/drm/xe/xe_page_reclaim.c
> index da1ed99cd3f8..921f30ffb4cb 100644
> --- a/drivers/gpu/drm/xe/xe_page_reclaim.c
> +++ b/drivers/gpu/drm/xe/xe_page_reclaim.c
> @@ -76,7 +76,7 @@ struct drm_suballoc
> *xe_page_reclaim_create_prl_bo(struct xe_tlb_inval *tlb_inva
> =C2=A0
> =C2=A0	/* Maximum size of PRL is 1 4K-page */
> =C2=A0	prl_sa =3D __xe_sa_bo_new(tile->mem.reclaim_pool,
> -				prl_size, GFP_ATOMIC);
> +				prl_size, GFP_ATOMIC, false);
> =C2=A0	if (IS_ERR(prl_sa))
> =C2=A0		return prl_sa;
> =C2=A0
> diff --git a/drivers/gpu/drm/xe/xe_sa.c b/drivers/gpu/drm/xe/xe_sa.c
> index b356d4327c97..d9da4276b5dd 100644
> --- a/drivers/gpu/drm/xe/xe_sa.c
> +++ b/drivers/gpu/drm/xe/xe_sa.c
> @@ -93,12 +93,14 @@ struct xe_sa_manager
> *__xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u3
> =C2=A0 * @sa_manager: the &xe_sa_manager
> =C2=A0 * @size: number of bytes we want to suballocate
> =C2=A0 * @gfp: gfp flags used for memory allocation. Typically GFP_KERNEL=
.
> + * @intr: whether to wait interruptibly if space is not immediately
> available
> =C2=A0 *
> =C2=A0 * Try to make a suballocation of size @size.
> =C2=A0 *
> =C2=A0 * Return: a &drm_suballoc, or an ERR_PTR.
> =C2=A0 */
> -struct drm_suballoc *__xe_sa_bo_new(struct xe_sa_manager
> *sa_manager, u32 size, gfp_t gfp)
> +struct drm_suballoc *__xe_sa_bo_new(struct xe_sa_manager
> *sa_manager, u32 size,
> +				=C2=A0=C2=A0=C2=A0 gfp_t gfp, bool intr)
> =C2=A0{
> =C2=A0	/*
> =C2=A0	 * BB to large, return -ENOBUFS indicating user should split
> @@ -107,7 +109,7 @@ struct drm_suballoc *__xe_sa_bo_new(struct
> xe_sa_manager *sa_manager, u32 size,
> =C2=A0	if (size > sa_manager->base.size)
> =C2=A0		return ERR_PTR(-ENOBUFS);
> =C2=A0
> -	return drm_suballoc_new(&sa_manager->base, size, gfp, true,
> 0);
> +	return drm_suballoc_new(&sa_manager->base, size, gfp, intr,
> 0);
> =C2=A0}
> =C2=A0
> =C2=A0/**
> diff --git a/drivers/gpu/drm/xe/xe_sa.h b/drivers/gpu/drm/xe/xe_sa.h
> index 1be744350836..bf81be165ea0 100644
> --- a/drivers/gpu/drm/xe/xe_sa.h
> +++ b/drivers/gpu/drm/xe/xe_sa.h
> @@ -15,7 +15,8 @@ struct dma_fence;
> =C2=A0struct xe_tile;
> =C2=A0
> =C2=A0struct xe_sa_manager *__xe_sa_bo_manager_init(struct xe_tile *tile,
> u32 size, u32 guard, u32 align);
> -struct drm_suballoc *__xe_sa_bo_new(struct xe_sa_manager
> *sa_manager, u32 size, gfp_t gfp);
> +struct drm_suballoc *__xe_sa_bo_new(struct xe_sa_manager
> *sa_manager, u32 size,
> +				=C2=A0=C2=A0=C2=A0 gfp_t gfp, bool intr);
> =C2=A0
> =C2=A0static inline struct xe_sa_manager *xe_sa_bo_manager_init(struct
> xe_tile *tile, u32 size, u32 align)
> =C2=A0{
> @@ -26,14 +27,16 @@ static inline struct xe_sa_manager
> *xe_sa_bo_manager_init(struct xe_tile *tile,
> =C2=A0 * xe_sa_bo_new() - Make a suballocation.
> =C2=A0 * @sa_manager: the &xe_sa_manager
> =C2=A0 * @size: number of bytes we want to suballocate
> + * @intr: whether to wait interruptibly if space is not immediately
> available
> =C2=A0 *
> =C2=A0 * Try to make a suballocation of size @size.
> =C2=A0 *
> =C2=A0 * Return: a &drm_suballoc, or an ERR_PTR.
> =C2=A0 */
> -static inline struct drm_suballoc *xe_sa_bo_new(struct xe_sa_manager
> *sa_manager, u32 size)
> +static inline struct drm_suballoc *xe_sa_bo_new(struct xe_sa_manager
> *sa_manager,
> +						u32 size, bool intr)
> =C2=A0{
> -	return __xe_sa_bo_new(sa_manager, size, GFP_KERNEL);
> +	return __xe_sa_bo_new(sa_manager, size, GFP_KERNEL, intr);
> =C2=A0}
> =C2=A0
> =C2=A0void xe_sa_bo_flush_write(struct drm_suballoc *sa_bo);
