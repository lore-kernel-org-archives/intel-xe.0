Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D616E77188
	for <intel-xe@archiver.kernel.org>; Sun, 12 Jan 2025 10:44:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 572A310E238;
	Sun, 12 Jan 2025 10:44:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OGP7WxtK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 993BF10E238
 for <intel-xe@lists.freedesktop.org>; Sun, 12 Jan 2025 10:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736678657; x=1768214657;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=a9daRnhkwhMEZL9PNyZx4VMxyEoGsmoaCW+G1prwNn8=;
 b=OGP7WxtKC5CBU3vpKtnyugf//CXcVZFWjsv2lqGxitZxsRZLuyux/Vmg
 ObsKenbF35pV23LntQe0fbC7nzMHoQp9SQ+qgDaMTvM317mAWYyDMbub/
 HcTs4apCHTw6zMTTcuQzdk07TBVCn2v6RJbWb6QyHU74eFb8lKAhn7iBk
 Awr2zZrk7w9Q3ojz2IpmSGJwCLJzdTC1t3mGHTHmoOtYrnuZmg8v5bFkJ
 eFI5EYfsICm4ulb6HsitGyqUfvVf7tGt+1qv7+AgsmwryEGIIj/7cPHbL
 kWoYH8u9iwT026HU2oDYbb1QNKzRqeoAp0OcNNnYBrz/HLOHFShJD9kW+ w==;
X-CSE-ConnectionGUID: bFp1o0XkTP6Rrh3nuXz0oQ==
X-CSE-MsgGUID: M34N2b5HRNK8RtuPpVKWwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11312"; a="47410284"
X-IronPort-AV: E=Sophos;i="6.12,309,1728975600"; d="scan'208";a="47410284"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2025 02:44:17 -0800
X-CSE-ConnectionGUID: P+a38jLzTUCkspZDWTyNsA==
X-CSE-MsgGUID: QiIFuRTzSGq9/w93dnbjDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,309,1728975600"; d="scan'208";a="103969725"
Received: from slindbla-desk.ger.corp.intel.com (HELO [10.245.246.93])
 ([10.245.246.93])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2025 02:44:15 -0800
Message-ID: <267564116c6bcfe8052b8821c0237d22854f0ae2.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Reject BO eviction if BO is bound to current VM
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Oak Zeng <oak.zeng@intel.com>, intel-xe@lists.freedesktop.org
Date: Sun, 12 Jan 2025 11:44:13 +0100
In-Reply-To: <20250110210137.3181576-1-oak.zeng@intel.com>
References: <20250110210137.3181576-1-oak.zeng@intel.com>
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

On Fri, 2025-01-10 at 16:01 -0500, Oak Zeng wrote:
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
> v2:
> Move vm_bo definition from function scope to if(evict) clause
> (Thomas)
> Further constraint the condition by adding ctx->resv (Thomas)
> Add a short comment describe the change.
>=20
> Suggested-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_bo.c | 15 +++++++++++++++
> =C2=A01 file changed, 15 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 4a623a98d9f1f..b024c63d8d296 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -713,6 +713,21 @@ static int xe_bo_move(struct ttm_buffer_object
> *ttm_bo, bool evict,
> =C2=A0		goto out;
> =C2=A0	}
> =C2=A0
> +	/* Reject BO eviction if BO is bound to current VM. */
> +	if (evict && ctx->resv) {
> +		struct drm_gpuvm_bo *vm_bo;
> +
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
> =C2=A0	/*
> =C2=A0	 * Failed multi-hop where the old_mem is still marked as
> =C2=A0	 * TTM_PL_FLAG_TEMPORARY, should just be a dummy move.
Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

