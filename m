Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C04C9CA0FF0
	for <intel-xe@archiver.kernel.org>; Mon,  1 Sep 2025 08:00:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6989610E3A0;
	Mon,  1 Sep 2025 08:00:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f8o7gMwP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93C7810E3A0
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Sep 2025 08:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756713633; x=1788249633;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=d/EediesBQqQCDa9hAr2Ni6/LoBxCIBMZWXudYG93NM=;
 b=f8o7gMwPfqdVRzOjy8/Gw9stS85iu0lyiZJD4RUwcO+cgrJ1fcYO8aI3
 /1fp7CFHmPWLIKCey96XkZTatBX053wPhMF1cyjWhF3wsYozQb3AJ2djB
 bBfk/9LP6yrS+aPP6P0JyDHK4yGQehlGlNz6aelwxN86JmMn577OzsF0h
 MRVSFPzyo6mx7oOncsdjCkwspaoaJeATXcD3HXYWv5oUi9MnIBf9zKOt4
 kHaAjKHBFdSoSVwVf6ARHrRz8fIz30r1KvesRLUQoCDmmgg60Y2/LL8yY
 9poIot0ktRZe4voZjEW5rH30994nIlp41vkRKRr4itI4D2PjeKYwRaE1Q Q==;
X-CSE-ConnectionGUID: tpYYA1NYTy2pa6I1BpY4lA==
X-CSE-MsgGUID: 4VDELp4+RKinIG8R1m+3yQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11539"; a="57968053"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; d="scan'208";a="57968053"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2025 00:45:40 -0700
X-CSE-ConnectionGUID: QJsOen5xQvuJlbXkmIY+Dg==
X-CSE-MsgGUID: FS6PHQugSkmwg6+d4GoyEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; d="scan'208";a="170192472"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO [10.245.244.171])
 ([10.245.244.171])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2025 00:45:38 -0700
Message-ID: <4b015479864427adf7102f327ca713b987f3a14b.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe: improve dma-resv handling for backup object
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
Date: Mon, 01 Sep 2025 09:45:32 +0200
In-Reply-To: <20250829164715.720735-2-matthew.auld@intel.com>
References: <20250829164715.720735-2-matthew.auld@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
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

On Fri, 2025-08-29 at 17:47 +0100, Matthew Auld wrote:
> Since the dma-resv is shared we don't need to reserve and add a fence
> slot fence twice, plus no need to loop through the dependencies.
>=20
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>


> ---
> =C2=A0drivers/gpu/drm/xe/xe_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 13 +----=
--------
> =C2=A0drivers/gpu/drm/xe/xe_migrate.c |=C2=A0 2 +-
> =C2=A02 files changed, 2 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 4faf15d5fa6d..49911247f6cb 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1260,14 +1260,11 @@ int xe_bo_evict_pinned(struct xe_bo *bo)
> =C2=A0		else
> =C2=A0			migrate =3D mem_type_to_migrate(xe, bo-
> >ttm.resource->mem_type);
> =C2=A0
> +		xe_assert(xe, bo->ttm.base.resv =3D=3D backup-
> >ttm.base.resv);
> =C2=A0		ret =3D dma_resv_reserve_fences(bo->ttm.base.resv, 1);
> =C2=A0		if (ret)
> =C2=A0			goto out_backup;
> =C2=A0
> -		ret =3D dma_resv_reserve_fences(backup->ttm.base.resv,
> 1);
> -		if (ret)
> -			goto out_backup;
> -
> =C2=A0		fence =3D xe_migrate_copy(migrate, bo, backup, bo-
> >ttm.resource,
> =C2=A0					backup->ttm.resource,
> false);
> =C2=A0		if (IS_ERR(fence)) {
> @@ -1277,8 +1274,6 @@ int xe_bo_evict_pinned(struct xe_bo *bo)
> =C2=A0
> =C2=A0		dma_resv_add_fence(bo->ttm.base.resv, fence,
> =C2=A0				=C2=A0=C2=A0 DMA_RESV_USAGE_KERNEL);
> -		dma_resv_add_fence(backup->ttm.base.resv, fence,
> -				=C2=A0=C2=A0 DMA_RESV_USAGE_KERNEL);
> =C2=A0		dma_fence_put(fence);
> =C2=A0	} else {
> =C2=A0		ret =3D xe_bo_vmap(backup);
> @@ -1356,10 +1351,6 @@ int xe_bo_restore_pinned(struct xe_bo *bo)
> =C2=A0		if (ret)
> =C2=A0			goto out_unlock_bo;
> =C2=A0
> -		ret =3D dma_resv_reserve_fences(backup->ttm.base.resv,
> 1);
> -		if (ret)
> -			goto out_unlock_bo;
> -
> =C2=A0		fence =3D xe_migrate_copy(migrate, backup, bo,
> =C2=A0					backup->ttm.resource, bo-
> >ttm.resource,
> =C2=A0					false);
> @@ -1370,8 +1361,6 @@ int xe_bo_restore_pinned(struct xe_bo *bo)
> =C2=A0
> =C2=A0		dma_resv_add_fence(bo->ttm.base.resv, fence,
> =C2=A0				=C2=A0=C2=A0 DMA_RESV_USAGE_KERNEL);
> -		dma_resv_add_fence(backup->ttm.base.resv, fence,
> -				=C2=A0=C2=A0 DMA_RESV_USAGE_KERNEL);
> =C2=A0		dma_fence_put(fence);
> =C2=A0	} else {
> =C2=A0		ret =3D xe_bo_vmap(backup);
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c
> b/drivers/gpu/drm/xe/xe_migrate.c
> index 9643442ef101..861d9d0633d1 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -908,7 +908,7 @@ struct dma_fence *xe_migrate_copy(struct
> xe_migrate *m,
> =C2=A0		if (!fence) {
> =C2=A0			err =3D xe_sched_job_add_deps(job, src_bo-
> >ttm.base.resv,
> =C2=A0						=C2=A0=C2=A0=C2=A0
> DMA_RESV_USAGE_BOOKKEEP);
> -			if (!err && src_bo !=3D dst_bo)
> +			if (!err && src_bo->ttm.base.resv !=3D dst_bo-
> >ttm.base.resv)
> =C2=A0				err =3D xe_sched_job_add_deps(job,
> dst_bo->ttm.base.resv,
> =C2=A0							=C2=A0=C2=A0=C2=A0
> DMA_RESV_USAGE_BOOKKEEP);
> =C2=A0			if (err)

