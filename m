Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26DF5E77188
	for <intel-xe@archiver.kernel.org>; Fri, 10 Jan 2025 14:45:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E20A210E508;
	Fri, 10 Jan 2025 14:45:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ewHLlKQP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD1A110E508
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Jan 2025 14:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736520306; x=1768056306;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=qBIYqiR4Qn3UZ0pANyHl31dkc+rf29wuMG3KT1ij7IQ=;
 b=ewHLlKQPksq3PTz1nmHBCuNEpRRw8tr37ts1Rq6kd2R6b6WI+pBxpsSI
 psAZVgWSo9lAhETPOIXjMj20RcoRLhBfl9FeYdEQytqQU453iax0q69gT
 Bu3XOOfX/19/O/oryc6aQRxMXdkx2Qryvs1fYql6VGYeiCjxOoynwj1Df
 QXHpFTdBGaEpcKgr0fFebJpwwg18PTH1b87yHxgUe1BaogGrW2BUFUW59
 UKnJglhVId4/3N0l0/Xpm0QhMsYAHvaP7X44yk7OqqeT0M5SvSMF8Ax/c
 QUEqxbVdFCWP9daHpBBGBu3Vp84W0LMFufkW3i4XxesalesBBN8OF5r8c w==;
X-CSE-ConnectionGUID: hcEHQjKHRaWuuYDB6KJDOQ==
X-CSE-MsgGUID: khUxRcoHQRC0wKylCtBx2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="59293688"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; d="scan'208";a="59293688"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2025 06:45:05 -0800
X-CSE-ConnectionGUID: zDQkwBt+T3iSCDLEo1LjxQ==
X-CSE-MsgGUID: lQiOfc4bRcyicYUlZYhbyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; d="scan'208";a="134586304"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO [10.245.246.11])
 ([10.245.246.11])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2025 06:45:04 -0800
Message-ID: <a67290be139bcf7f58964850e93b7b5141aabd13.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Reject BO eviction if BO is bound to current VM
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Oak Zeng <oak.zeng@intel.com>, intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com
Date: Fri, 10 Jan 2025 15:45:00 +0100
In-Reply-To: <20241217231358.2361242-1-oak.zeng@intel.com>
References: <20241217231358.2361242-1-oak.zeng@intel.com>
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

Hi, Oak.

On Tue, 2024-12-17 at 18:13 -0500, Oak Zeng wrote:
> This is a follow up fix for
> https://patchwork.freedesktop.org/patch/msgid/20241203021929.1919730-1-oa=
k.zeng@intel.com
> The overall goal is to fail vm_bind when there is memory pressure.
> See more
> details in the commit message of above patch. Abbove patch fixes the
> issue
> when user pass in a vm_id parameter during gem_create. If user
> doesn't pass
> in a vm_id during gem_create, above patch doesn't help.
>=20
> This patch further reject BO eviction (which could be triggered by bo
> validation)
> if BO is bound to the current VM. vm_bind could fail due to the
> eviction failure.
> The BO to VM reverse mapping structure is used to determine whether
> BO is bound
> to VM.
>=20
> Suggested-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_bo.c | 13 +++++++++++++
> =C2=A01 file changed, 13 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 283cd02945708..abdeed1c325ea 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -664,6 +664,7 @@ static int xe_bo_move(struct ttm_buffer_object
> *ttm_bo, bool evict,
> =C2=A0	u32 old_mem_type =3D old_mem ? old_mem->mem_type :
> XE_PL_SYSTEM;
> =C2=A0	struct ttm_tt *ttm =3D ttm_bo->ttm;
> =C2=A0	struct xe_migrate *migrate =3D NULL;
> +	struct drm_gpuvm_bo *vm_bo;

Move this declaration inside if (evict) {

> =C2=A0	struct dma_fence *fence;
> =C2=A0	bool move_lacks_source;
> =C2=A0	bool tt_has_data;
> @@ -713,6 +714,18 @@ static int xe_bo_move(struct ttm_buffer_object
> *ttm_bo, bool evict,
> =C2=A0		goto out;
> =C2=A0	}
> =C2=A0

Short comment here?

> +	if (evict) {

Perhaps if (evict && ctx->resv)

> +		drm_gem_for_each_gpuvm_bo(vm_bo, &bo->ttm.base) {
> +			struct xe_vm *vm =3D gpuvm_to_vm(vm_bo->vm);
> +
> +			if (xe_vm_resv(vm) =3D=3D ctx->resv &&
> +			=C2=A0=C2=A0=C2=A0 xe_vm_in_preempt_fence_mode(vm)) {
> +				ret =3D -EBUSY;
> +				goto out;
> +			}
> +		}
> +	}
> +

Otherwise LGTM.

> =C2=A0	/*
> =C2=A0	 * Failed multi-hop where the old_mem is still marked as
> =C2=A0	 * TTM_PL_FLAG_TEMPORARY, should just be a dummy move.

