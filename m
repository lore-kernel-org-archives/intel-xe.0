Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93BCB1125869
	for <intel-xe@archiver.kernel.org>; Wed, 11 Mar 2026 19:03:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5024310E3E4;
	Wed, 11 Mar 2026 19:03:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PjwK7OYS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6094210E3E3;
 Wed, 11 Mar 2026 19:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773255783; x=1804791783;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=5LeoInOG72AC63xWadzf3zI9WdMs0+cPlz+u001cIjg=;
 b=PjwK7OYSaoXcdX30yr7SwRpgxXixpfvTo+pba1479pJtCG5tcSGkakGx
 EwUscwk55zKw1KdvgQ10PhRaKZS2OJeRwN1WPbAjGw0uuihxr1fgYEf6M
 WNt7smGfNVrTCVA4TCHY99QsoV+zpMPlXjqM5ErlY+CXLSAJMu90Bbvhs
 WAiMqhLj5PHcG0B6mEPp+FBpTvHYueJo2SewBbX8Sr92lCSz8TzW6KoRf
 r9ALM3SBgf0WapCBLyKIhqSSdNrovy17teHcHzYRg332s9PHZfCjtYkec
 FcHpWVJqksi1U348EkG+0OS/xrwYOvvx2/FCJQyA4EGg1DlL4oSZXzght w==;
X-CSE-ConnectionGUID: ZZ6zs3y5Rd22DT/v6+KLZA==
X-CSE-MsgGUID: CAzMrluvQu2VwjBzBdFktA==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="74231133"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="74231133"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 12:03:02 -0700
X-CSE-ConnectionGUID: YHT7ROcfRYaPmlJvkd5tlg==
X-CSE-MsgGUID: 9p9KeXFOTbaDUJ1ThCBlxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="220516067"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO [10.245.244.202])
 ([10.245.244.202])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 12:02:59 -0700
Message-ID: <78e96e9a6bf228c19c43698666785268b9477493.camel@linux.intel.com>
Subject: Re: [PATCH 1/3] drm/sa: Scan all holes when fences are disabled
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>, 
 intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, Maarten Lankhorst	
 <dev@lankhorst.se>, Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Christian =?ISO-8859-1?Q?K=F6nig?=	 <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Date: Wed, 11 Mar 2026 20:02:57 +0100
In-Reply-To: <20260311155233.1903253-6-satyanarayana.k.v.p@intel.com>
References: <20260311155233.1903253-5-satyanarayana.k.v.p@intel.com>
 <20260311155233.1903253-6-satyanarayana.k.v.p@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
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

On Wed, 2026-03-11 at 15:52 +0000, Satyanarayana K V P wrote:
> The suballocator algorithm tracks a hole cursor at the last
> allocation
> and tries to allocate after it. This is optimized for fence-ordered
> progress, where older allocations are expected to become reusable
> first.
>=20
> In fence-enabled mode, that ordering assumption holds. In fence-
> disabled
> mode, allocations may be freed in arbitrary order, so limiting
> allocation
> to the current hole window can miss valid free space and fail
> allocations
> despite sufficient total space.
>=20
> Update the fence-disabled path to walk through all holes and select
> any
> fitting range, while keeping the existing fence-based behavior
> unchanged.
>=20
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Cc: Maarten Lankhorst <dev@lankhorst.se>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: dri-devel@lists.freedesktop.org

Hmm.

The amount of changes we discover are needed for this use-case makes me
wonder whether we are actually using the incorrect subsystems and
should have coded up a separate utility for this: The utility holds the
HW and shadow BOs, and we then embed (or possibly point to) a struct
drm_mm_node in the bos.

Perhaps should've Claude code that up and see what it looks like?

Thanks,
Thomas



> ---
> =C2=A0drivers/gpu/drm/drm_suballoc.c | 90
> ++++++++++++++++++++++++++++++++++
> =C2=A0include/drm/drm_suballoc.h=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 5 ++
> =C2=A02 files changed, 95 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_suballoc.c
> b/drivers/gpu/drm/drm_suballoc.c
> index b74277bbc14b..307da191a855 100644
> --- a/drivers/gpu/drm/drm_suballoc.c
> +++ b/drivers/gpu/drm/drm_suballoc.c
> @@ -78,12 +78,33 @@ void drm_suballoc_manager_init(struct
> drm_suballoc_manager *sa_manager,
> =C2=A0	sa_manager->size =3D size;
> =C2=A0	sa_manager->align =3D align;
> =C2=A0	sa_manager->hole =3D &sa_manager->olist;
> +	sa_manager->fence_disable =3D false;
> =C2=A0	INIT_LIST_HEAD(&sa_manager->olist);
> =C2=A0	for (i =3D 0; i < DRM_SUBALLOC_MAX_QUEUES; ++i)
> =C2=A0		INIT_LIST_HEAD(&sa_manager->flist[i]);
> =C2=A0}
> =C2=A0EXPORT_SYMBOL(drm_suballoc_manager_init);
> =C2=A0
> +/**
> + * drm_suballoc_manager_fence_disable() - Enable or disable fence
> tracking.
> + * @sa_manager: Pointer to the suballocation manager.
> + * @fence_disable: Whether to disable fence tracking for free
> suballocations.
> + *
> + * When @fence_disable is true allocation scans all holes without
> waiting on
> + * fences. When false, the manager tracks free suballocations behind
> fences and
> + * reuses them only after the fence signals.
> + *
> + * This should be called immediately after creating the suballocator
> and before
> + * any allocations are made. The behaviour is undefined if this is
> called after
> + * allocations have been made.
> + */
> +void drm_suballoc_manager_fence_disable(struct drm_suballoc_manager
> *sa_manager,
> +					bool fence_disable)
> +{
> +	sa_manager->fence_disable =3D fence_disable;
> +}
> +EXPORT_SYMBOL(drm_suballoc_manager_fence_disable);
> +
> =C2=A0/**
> =C2=A0 * drm_suballoc_manager_fini() - Destroy the drm_suballoc_manager
> =C2=A0 * @sa_manager: pointer to the sa_manager
> @@ -110,6 +131,7 @@ void drm_suballoc_manager_fini(struct
> drm_suballoc_manager *sa_manager)
> =C2=A0	}
> =C2=A0
> =C2=A0	sa_manager->size =3D 0;
> +	sa_manager->fence_disable =3D false;
> =C2=A0}
> =C2=A0EXPORT_SYMBOL(drm_suballoc_manager_fini);
> =C2=A0
> @@ -161,6 +183,69 @@ static size_t drm_suballoc_hole_eoffset(struct
> drm_suballoc_manager *sa_manager)
> =C2=A0	return sa_manager->size;
> =C2=A0}
> =C2=A0
> +/**
> + * drm_suballoc_hole_soffset_eoffset() - Find a hole fitting size
> and alignment.
> + * @sa_manager: Suballocator manager.
> + * @soffset: Start offset of the selected hole.
> + * @eoffset: End offset of the selected hole.
> + * @size: Size to be allocated.
> + * @align: Allocation alignment.
> + *
> + * This function is used when fences are disabled. It scans the
> holes starting
> + * at the current hole pointer and selects the first one that can
> satisfy @size
> + * once @align padding is applied. We may need to scan the entire
> list of holes
> + * and update soffset and eoffset for each hole to find a suitable
> one, as the
> + * current hole pointer may not be the same as sa_manager->hole.
> + *
> + * Return: true if a suitable hole is found, false otherwise.
> + */
> +static bool drm_suballoc_hole_soffset_eoffset(struct
> drm_suballoc_manager *sa_manager,
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 size_t *soffset,
> size_t *eoffset,
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 size_t size, size_t
> align)
> +{
> +	struct list_head *start, *hole;
> +
> +	if (!sa_manager->fence_disable)
> +		return true;
> +
> +	start =3D sa_manager->hole;
> +	hole =3D start;
> +
> +	do {
> +		size_t s, e, wasted;
> +
> +		/*
> +		 * We can't use drm_suballoc_hole_soffset() and
> +		 * drm_suballoc_hole_eoffset() here as the hole may
> not be same
> +		 * as sa_manager->hole.
> +		 */
> +		if (hole !=3D &sa_manager->olist)
> +			s =3D list_entry(hole, struct drm_suballoc,
> olist)->eoffset;
> +		else
> +			s =3D 0;
> +
> +		if (hole->next !=3D &sa_manager->olist)
> +			e =3D list_entry(hole->next, struct
> drm_suballoc, olist)->soffset;
> +		else
> +			e =3D sa_manager->size;
> +
> +		if (e < s || e =3D=3D s || (e - s) < size) {
> +			hole =3D hole->next;
> +			continue;
> +		}
> +
> +		wasted =3D round_up(s, align) - s;
> +		if ((e - s) >=3D (size + wasted)) {
> +			*soffset =3D s;
> +			*eoffset =3D e;
> +			sa_manager->hole =3D hole;
> +			return true;
> +		}
> +	} while (hole !=3D start);
> +
> +	return false;
> +}
> +
> =C2=A0static bool drm_suballoc_try_alloc(struct drm_suballoc_manager
> *sa_manager,
> =C2=A0				=C2=A0=C2=A0 struct drm_suballoc *sa,
> =C2=A0				=C2=A0=C2=A0 size_t size, size_t align)
> @@ -169,6 +254,11 @@ static bool drm_suballoc_try_alloc(struct
> drm_suballoc_manager *sa_manager,
> =C2=A0
> =C2=A0	soffset =3D drm_suballoc_hole_soffset(sa_manager);
> =C2=A0	eoffset =3D drm_suballoc_hole_eoffset(sa_manager);
> +
> +	if (!drm_suballoc_hole_soffset_eoffset(sa_manager, &soffset,
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &eoffset, size,
> align))
> +		return false;
> +
> =C2=A0	wasted =3D round_up(soffset, align) - soffset;
> =C2=A0
> =C2=A0	if ((eoffset - soffset) >=3D (size + wasted)) {
> diff --git a/include/drm/drm_suballoc.h b/include/drm/drm_suballoc.h
> index 29befdda35d2..066412196f8a 100644
> --- a/include/drm/drm_suballoc.h
> +++ b/include/drm/drm_suballoc.h
> @@ -20,6 +20,7 @@
> =C2=A0 * @flist: Array[fence context hash] of queues of fenced allocated
> ranges.
> =C2=A0 * @size: Size of the managed range.
> =C2=A0 * @align: Default alignment for the managed range.
> + * @fence_disable: Fences are disabled for this SA manager.
> =C2=A0 */
> =C2=A0struct drm_suballoc_manager {
> =C2=A0	wait_queue_head_t wq;
> @@ -28,6 +29,7 @@ struct drm_suballoc_manager {
> =C2=A0	struct list_head flist[DRM_SUBALLOC_MAX_QUEUES];
> =C2=A0	size_t size;
> =C2=A0	size_t align;
> +	bool fence_disable;
> =C2=A0};
> =C2=A0
> =C2=A0/**
> @@ -51,6 +53,9 @@ struct drm_suballoc {
> =C2=A0void drm_suballoc_manager_init(struct drm_suballoc_manager
> *sa_manager,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 size_t size, size_t align);
> =C2=A0
> +void drm_suballoc_manager_fence_disable(struct drm_suballoc_manager
> +					*sa_manager, bool
> fence_disable);
> +
> =C2=A0void drm_suballoc_manager_fini(struct drm_suballoc_manager
> *sa_manager);
> =C2=A0
> =C2=A0struct drm_suballoc *drm_suballoc_alloc(gfp_t gfp);
