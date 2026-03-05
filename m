Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F0ADF33A90
	for <intel-xe@archiver.kernel.org>; Thu,  5 Mar 2026 15:26:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B5D510E2BA;
	Thu,  5 Mar 2026 15:26:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DcCC7rzt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AF9B10E2BA
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Mar 2026 15:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772724406; x=1804260406;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=o6jTNxgkb+4zOzKxHvpeiPsy98PwE5H/0ve7rpu4/AY=;
 b=DcCC7rztWIV5/IFAYoOO9bHqlNKryr7vZqeF6yHwGcBe29KTHfAd5sN9
 u64mFju1sefTME92Vl/uLQSnd5lj1VEziepGOYBv5H16lp0Uc0se7h1LR
 mTnMX5+rB+uh+UVkEAXfiV4I/KnsgOdXX7hlBgFzECF9N889qkj9JD68b
 ytiE74ltvb1Rnz4SIBSMmd4YAFeSv62ilcmGdItvF/xbC9Lm3zPjKQQK7
 GMqnd2L7+NFBnpkKWrDQ9kgO95bou4n0ceoid0KlJFFBfmOu0QK/N9tsy
 I7orHLi7g+Unx3NOnHG4F8ZSoYfAWBRucNWVwE08U5u3w7G+d2NdHlF7F Q==;
X-CSE-ConnectionGUID: SF+KRHggRLOvcNEF7fPRbQ==
X-CSE-MsgGUID: P561Cj5+T7e4NNA3o+qatw==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="61387038"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="61387038"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 07:26:45 -0800
X-CSE-ConnectionGUID: i96eO0eQQbuAPWEfZl1YLQ==
X-CSE-MsgGUID: cOBD1PXkTcOwIkGiqaWC/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="249173181"
Received: from vpanait-mobl.ger.corp.intel.com (HELO [10.245.244.71])
 ([10.245.244.71])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 07:26:44 -0800
Message-ID: <575d062fa1ccba64e6248595581e0e324383c891.camel@linux.intel.com>
Subject: Re: [PATCH v6 04/12] drm/xe/bo: Block CPU faults to purgeable
 buffer objects
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Arvind Yadav <arvind.yadav@intel.com>, intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com, 
 pallavi.mishra@intel.com
Date: Thu, 05 Mar 2026 16:26:40 +0100
In-Reply-To: <20260303152015.3499248-5-arvind.yadav@intel.com>
References: <20260303152015.3499248-1-arvind.yadav@intel.com>
 <20260303152015.3499248-5-arvind.yadav@intel.com>
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

On Tue, 2026-03-03 at 20:50 +0530, Arvind Yadav wrote:
> Block CPU page faults to buffer objects marked as purgeable
> (DONTNEED)
> or already purged. Once a BO is marked DONTNEED, its contents can be
> discarded by the kernel at any time, making access undefined
> behavior.
> Return VM_FAULT_SIGBUS immediately to fail consistently instead of
> allowing erratic behavior where access sometimes works (if not yet
> purged) and sometimes fails (if purged).
>=20
> For DONTNEED BOs:
> - Block new CPU faults with SIGBUS to prevent undefined behavior.
> - Existing CPU PTEs may still work until TLB flush, but new faults
> =C2=A0 fail immediately.
>=20
> For PURGED BOs:
> - Backing store has been reclaimed, making CPU access invalid.
> - Without this check, accessing existing mmap mappings would trigger
> =C2=A0 xe_bo_fault_migrate() on freed backing store, causing kernel hangs
> =C2=A0 or crashes.
>=20
> The purgeable check is added to both CPU fault paths:
> - Fastpath (xe_bo_cpu_fault_fastpath): Returns VM_FAULT_SIGBUS
> immediately
> =C2=A0 under dma-resv lock, preventing attempts to migrate/validate
> =C2=A0 DONTNEED/purged pages.
> - Slowpath (xe_bo_cpu_fault): Returns -EFAULT under drm_exec lock,
> =C2=A0 converted to VM_FAULT_SIGBUS.
>=20
> This matches i915 semantics for purged buffer handling.
>=20
> v2:
> =C2=A0 - Added xe_bo_is_purged(bo) instead of atomic_read.
> =C2=A0 - Avoids leaks and keeps drm_dev_exit() while returning.
>=20
> v3:
> =C2=A0 - Move xe_bo_is_purged check under a dma-resv lock (Matthew Brost)
>=20
> v4:
> =C2=A0 - Add purged check to fastpath (xe_bo_cpu_fault_fastpath) to
> prevent
> =C2=A0=C2=A0=C2=A0 hang when accessing existing mmap of purged BO.
>=20
> v6:
> =C2=A0 - Block CPU faults to DONTNEED BOs with VM_FAULT_SIGBUS. (Thomas,
> Matt)
>=20
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>

Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>


> ---
> =C2=A0drivers/gpu/drm/xe/xe_bo.c | 19 +++++++++++++++++++
> =C2=A01 file changed, 19 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 513f01aa2ddd..d05a73756905 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1979,6 +1979,16 @@ static vm_fault_t
> xe_bo_cpu_fault_fastpath(struct vm_fault *vmf, struct xe_devic
> =C2=A0	if (!dma_resv_trylock(tbo->base.resv))
> =C2=A0		goto out_validation;
> =C2=A0
> +	/*
> +	 * Reject CPU faults to purgeable BOs. DONTNEED BOs can be
> purged
> +	 * at any time, and purged BOs have no backing store. Either
> case
> +	 * is undefined behavior for CPU access.
> +	 */
> +	if (xe_bo_madv_is_dontneed(bo) || xe_bo_is_purged(bo)) {
> +		ret =3D VM_FAULT_SIGBUS;
> +		goto out_unlock;
> +	}
> +
> =C2=A0	if (xe_ttm_bo_is_imported(tbo)) {
> =C2=A0		ret =3D VM_FAULT_SIGBUS;
> =C2=A0		drm_dbg(&xe->drm, "CPU trying to access an imported
> buffer object.\n");
> @@ -2069,6 +2079,15 @@ static vm_fault_t xe_bo_cpu_fault(struct
> vm_fault *vmf)
> =C2=A0		if (err)
> =C2=A0			break;
> =C2=A0
> +		/*
> +		 * Reject CPU faults to purgeable BOs. DONTNEED BOs
> can be
> +		 * purged at any time, and purged BOs have no
> backing store.
> +		 */
> +		if (xe_bo_madv_is_dontneed(bo) ||
> xe_bo_is_purged(bo)) {
> +			err =3D -EFAULT;
> +			break;
> +		}
> +
> =C2=A0		if (xe_ttm_bo_is_imported(tbo)) {
> =C2=A0			err =3D -EFAULT;
> =C2=A0			drm_dbg(&xe->drm, "CPU trying to access an
> imported buffer object.\n");
