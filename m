Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B73EE6C60F
	for <intel-xe@archiver.kernel.org>; Tue,  3 Dec 2024 07:11:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D71A710E920;
	Tue,  3 Dec 2024 07:11:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JjHPfJI2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A04C910E920
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Dec 2024 07:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733209900; x=1764745900;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=JnNz+cvgO8l8ce7nVA49jecmOKm6VA74/ZVxFQbdz4A=;
 b=JjHPfJI2WlCXunffdaaKP1lwfOb5Z4b4UnTTkPijNewphGZ2+i6hsrod
 dkLbqaVCYZbTTXfvwhlbatYK1jXdDKYoDsW5o0QZILdru1pXtL0yYBvR5
 ORCsthu8q8LIUdM4geCyIUaBb7zP4dlELhAXJ0tGHUMs3Pwa7HLKD7kyX
 3JqSLxz5sFzaRa821q6BnZIYDkG518/sarTJcedLKAcYRduUUqjIsfMoz
 oOrTchYHzwCybI1ms07Kbb70zGWu/3z6KdsCafMpodVNBBD3jI9wRdgL0
 hjYEIwFqZCtlbrqFIQXLX6BEehskuk7WI/HbApYZCiihudcEFjD7L+9Jx Q==;
X-CSE-ConnectionGUID: YtaxhF6LSTOhZnRt3hgNmQ==
X-CSE-MsgGUID: gyUvDNxrSOeSLmvAYz8fJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="43891114"
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; d="scan'208";a="43891114"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 23:09:43 -0800
X-CSE-ConnectionGUID: aaTHHoygQRWzHPDraiFtyQ==
X-CSE-MsgGUID: MSVImfS4SUGhylM0pEuNEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; d="scan'208";a="93802291"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO [10.245.246.120])
 ([10.245.246.120])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 23:09:41 -0800
Message-ID: <c3fe010ee6dc51ea75bad670be5296784beb262d.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Trace xe_bo_validate
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Oak Zeng <oak.zeng@intel.com>, intel-xe@lists.freedesktop.org
Date: Tue, 03 Dec 2024 08:09:39 +0100
In-Reply-To: <20241203022140.1919922-1-oak.zeng@intel.com>
References: <20241203022140.1919922-1-oak.zeng@intel.com>
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

On Mon, 2024-12-02 at 21:21 -0500, Oak Zeng wrote:
> Add a tracepoint for xe_bo_validate function. I found this is
> useful during debug issues.
>=20
> Signed-off-by: Oak Zeng <oak.zeng@intel.com>
Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

> ---
> =C2=A0drivers/gpu/drm/xe/xe_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 =
+
> =C2=A0drivers/gpu/drm/xe/xe_trace_bo.h | 5 +++++
> =C2=A02 files changed, 6 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index bdac446bf8c06..3448ede2befa6 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -2004,6 +2004,7 @@ int xe_bo_validate(struct xe_bo *bo, struct
> xe_vm *vm, bool allow_res_evict)
> =C2=A0		ctx.resv =3D xe_vm_resv(vm);
> =C2=A0	}
> =C2=A0
> +	trace_xe_bo_validate(bo);
> =C2=A0	return ttm_bo_validate(&bo->ttm, &bo->placement, &ctx);
> =C2=A0}
> =C2=A0
> diff --git a/drivers/gpu/drm/xe/xe_trace_bo.h
> b/drivers/gpu/drm/xe/xe_trace_bo.h
> index c6d3140542cff..e393a2dd83dbe 100644
> --- a/drivers/gpu/drm/xe/xe_trace_bo.h
> +++ b/drivers/gpu/drm/xe/xe_trace_bo.h
> @@ -53,6 +53,11 @@ DEFINE_EVENT(xe_bo, xe_bo_create,
> =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0 TP_ARGS(bo)
> =C2=A0);
> =C2=A0
> +DEFINE_EVENT(xe_bo, xe_bo_validate,
> +	=C2=A0=C2=A0=C2=A0=C2=A0 TP_PROTO(struct xe_bo *bo),
> +	=C2=A0=C2=A0=C2=A0=C2=A0 TP_ARGS(bo)
> +);
> +
> =C2=A0TRACE_EVENT(xe_bo_move,
> =C2=A0	=C2=A0=C2=A0=C2=A0 TP_PROTO(struct xe_bo *bo, uint32_t new_placeme=
nt,
> uint32_t old_placement,
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0 bool move_lacks_source),

