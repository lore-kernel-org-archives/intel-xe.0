Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A91BF3092A
	for <intel-xe@archiver.kernel.org>; Thu,  5 Mar 2026 10:42:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5629910E247;
	Thu,  5 Mar 2026 10:42:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yb+IJevl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F16D610E247
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Mar 2026 10:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772707319; x=1804243319;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=+4RM+A5IlAE1SW1jd+O3zHnvoCCQBHuUUTAqBqocXj4=;
 b=Yb+IJevlU7ozQnN+Y6bFVjwV8MxdI1upQfwkwnE95GpaJKYtiXrCaS5j
 pxcVQiy3QYx04B6aIMnQ3pRnPGZqlMFLMTVZvaT7aewoyTEq9Ek/BIcPi
 F8tLWkOHMzDEgBVjh5BrZAvoMwQNEmyiSO7r6lW6Swi8s1HY19C0oY7lV
 mTQ5eboc0Ait9bCNGu8MS6gzeT1s+GcsrtD+yWyW+WNYbYcqeFpc0L3tv
 fHTV505OletZ0LaliWwN7v/IuivoFIWaZ5kw7I5TzN6KxlEa7SggpajVn
 mqszJaII4FthBc7lAKP804f7iiOIyQfs4WxU7AKxbh5ynYgM77neVkh0t w==;
X-CSE-ConnectionGUID: B8xiUAFUQzmE3bzEuTbRZA==
X-CSE-MsgGUID: H3F7QPmQSnKxBjMEl/zASQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73859972"
X-IronPort-AV: E=Sophos;i="6.23,102,1770624000"; d="scan'208";a="73859972"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 02:41:58 -0800
X-CSE-ConnectionGUID: x1jJKGUnTkuLgcW6WGZ7Dg==
X-CSE-MsgGUID: 5JIIavIlTLupR//HJdpO6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,102,1770624000"; d="scan'208";a="223329020"
Received: from vpanait-mobl.ger.corp.intel.com (HELO [10.245.244.71])
 ([10.245.244.71])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 02:41:57 -0800
Message-ID: <c2ba6e070b831001aeaab697fe179dd48a3b79cb.camel@linux.intel.com>
Subject: Re: [PATCH V5 1/4] drm/xe/xe3p_lpg: flush shrinker bo cachelines
 manually
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com, carl.zhang@intel.com, jose.souza@intel.com
Date: Thu, 05 Mar 2026 11:41:54 +0100
In-Reply-To: <20260303062441.1860959-7-tejas.upadhyay@intel.com>
References: <20260303062441.1860959-6-tejas.upadhyay@intel.com>
 <20260303062441.1860959-7-tejas.upadhyay@intel.com>
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

Hi, Tejas

On Tue, 2026-03-03 at 11:54 +0530, Tejas Upadhyay wrote:
> XA, new pat_index introduced post xe3p_lpg, is memory shared between
> the
> CPU and GPU is treated differently from other GPU memory when the
> Media
> engine is power-gated.
>=20
> XA is *always* flushed, like at the end-of-submssion (and maybe other
> places), just that internally as an optimisation hw doesn't need to
> make
> that a full flush (which will also include XA) when Media is
> off/powergated, since it doesn't need to worry about GT caches vs
> Media
> coherency, and only CPU vs GPU coherency, so can make that flush a
> targeted XA flush, since stuff tagged with XA now means it's shared
> with
> the CPU. The main implication is that we now need to somehow flush
> non-XA
> before freeing system memory pages, otherwise dirty cachelines could
> be
> flushed after the free (like if Media suddenly turns on and does a
> full
> flush)
>=20
> V3(Thomas/MattA/MattR): Restrict userptr with non-xa, then no need to
> 			flush manually
> V2(MattA): Expand commit description
>=20
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_bo.c=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 ++-
> =C2=A0drivers/gpu/drm/xe/xe_device.c | 23 +++++++++++++++++++++++
> =C2=A0drivers/gpu/drm/xe/xe_device.h |=C2=A0 1 +
> =C2=A03 files changed, 26 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index d6c2cb959cdd..d2ee9701eae6 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -689,7 +689,8 @@ static int xe_bo_trigger_rebind(struct xe_device
> *xe, struct xe_bo *bo,
> =C2=A0
> =C2=A0		if (!xe_vm_in_fault_mode(vm)) {
> =C2=A0			drm_gpuvm_bo_evict(vm_bo, true);
> -			continue;
> +			if (!xe_device_is_l2_flush_optimized(xe))
> +				continue;

Could you please add a code comment here something along the lines of
"L2 cache may not be flushed, so ensure that is done in
xe_vm_invalidate_vma() below"

With that,
Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

I also think a possible follow-up here would be to check the PAT
indices of the vmas we loop over only invalidate if they indicate non-
XA? If that makes sense, please consider as a follow-up patch.

Thanks,
Thomas




> =C2=A0		}
> =C2=A0
> =C2=A0		if (!idle) {
> diff --git a/drivers/gpu/drm/xe/xe_device.c
> b/drivers/gpu/drm/xe/xe_device.c
> index 4b68a2d55651..94c9f17da4b4 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -1097,6 +1097,29 @@ static void tdf_request_sync(struct xe_device
> *xe)
> =C2=A0	}
> =C2=A0}
> =C2=A0
> +/**
> + * xe_device_is_l2_flush_optimized - if L2 flush is optimized by HW
> + * @xe: The device to check.
> + *
> + * Return: true if the HW device optimizing L2 flush, false
> otherwise.
> + */
> +bool xe_device_is_l2_flush_optimized(struct xe_device *xe)
> +{
> +	/* XA is *always* flushed, like at the end-of-submssion (and
> maybe other
> +	 * places), just that internally as an optimisation hw
> doesn't need to make
> +	 * that a full flush (which will also include XA) when Media
> is
> +	 * off/powergated, since it doesn't need to worry about GT
> caches vs Media
> +	 * coherency, and only CPU vs GPU coherency, so can make
> that flush a
> +	 * targeted XA flush, since stuff tagged with XA now means
> it's shared with
> +	 * the CPU. The main implication is that we now need to
> somehow flush non-XA before
> +	 * freeing system memory pages, otherwise dirty cachelines
> could be flushed after the free
> +	 * (like if Media suddenly turns on and does a full flush)
> +	 */
> +	if (GRAPHICS_VER(xe) >=3D 35 && !IS_DGFX(xe))
> +		return true;
> +	return false;
> +}
> +
> =C2=A0void xe_device_l2_flush(struct xe_device *xe)
> =C2=A0{
> =C2=A0	struct xe_gt *gt;
> diff --git a/drivers/gpu/drm/xe/xe_device.h
> b/drivers/gpu/drm/xe/xe_device.h
> index 39464650533b..dfbf96e12d2e 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -184,6 +184,7 @@ void xe_device_snapshot_print(struct xe_device
> *xe, struct drm_printer *p);
> =C2=A0u64 xe_device_canonicalize_addr(struct xe_device *xe, u64 address);
> =C2=A0u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64
> address);
> =C2=A0
> +bool xe_device_is_l2_flush_optimized(struct xe_device *xe);
> =C2=A0void xe_device_td_flush(struct xe_device *xe);
> =C2=A0void xe_device_l2_flush(struct xe_device *xe);
> =C2=A0
