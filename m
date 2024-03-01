Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FEE1C5475B
	for <intel-xe@archiver.kernel.org>; Fri,  1 Mar 2024 06:55:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEA6C10E247;
	Fri,  1 Mar 2024 06:55:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JtYzVYEs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2812510E247
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Mar 2024 06:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709276145; x=1740812145;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=tsqsq6TalWKJ0lb894Fvww+5Iao2gmxKuqoSf6wgWMM=;
 b=JtYzVYEsrx+HtQ+t9yS2sY78NnUDupbvpM9KEvgR1jzOGGv4utGbsJZu
 zt3YxMTYVD6as1zZOJ5BNn1uzdC41RM3sTYcpeU3p7Z+yFYf5cOztxQ6R
 cWJ1Hk6qPo5ec9Cpx9MVWTXbGBMRtkW3o9nK1YWXJkrkzE5daKcZpFPfC
 fapmdM50VYPtidp6jkaXvCiTe8AZRVXCZGMvEGxuUtdkH4/+xghphaVtR
 pC2+zhpyS/KIq/PuCqWzPNpFFEouQ87HaSjuxFm8EcS1pGo2nJ1PN8Lj2
 AMENnhbKTg1e8iuI+3iFC4nP8MkO4GKj2OPrliB2n3dYGyYCjHWGDB2G/ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="14366847"
X-IronPort-AV: E=Sophos;i="6.06,195,1705392000"; d="scan'208";a="14366847"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 22:55:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,195,1705392000"; d="scan'208";a="12784318"
Received: from yuyingfa-mobl.ccr.corp.intel.com (HELO [10.249.254.26])
 ([10.249.254.26])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 22:55:43 -0800
Message-ID: <6f8409697d39299e3672fd42f7057e421cb54f19.camel@linux.intel.com>
Subject: Re: [PATCH v2 2/3] drm/xe: Validate user fence during creation
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Date: Fri, 01 Mar 2024 07:55:40 +0100
In-Reply-To: <20240301035522.238307-3-matthew.brost@intel.com>
References: <20240301035522.238307-1-matthew.brost@intel.com>
 <20240301035522.238307-3-matthew.brost@intel.com>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3 (3.50.3-1.fc39) 
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

On Thu, 2024-02-29 at 19:55 -0800, Matthew Brost wrote:
> Fail invalidate addresses during user fence creation.
>=20
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel
> GPUs")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_sync.c | 12 ++++++++----
> =C2=A01 file changed, 8 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_sync.c
> b/drivers/gpu/drm/xe/xe_sync.c
> index c836a5f3a1ea..c20e1f9ad267 100644
> --- a/drivers/gpu/drm/xe/xe_sync.c
> +++ b/drivers/gpu/drm/xe/xe_sync.c
> @@ -53,14 +53,18 @@ static struct xe_user_fence
> *user_fence_create(struct xe_device *xe, u64 addr,
> =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u64 value)
> =C2=A0{
> =C2=A0	struct xe_user_fence *ufence;
> +	u64 __user *ptr =3D u64_to_user_ptr(addr);
> +
> +	if (!access_ok(ptr, sizeof(ptr)))
> +		return ERR_PTR(-EFAULT);

I think we also need to enforce u64 alignment. Otherwise, particularly
on 32-bit user-space the user fence memory could cross a page-border?=20

> =C2=A0
> =C2=A0	ufence =3D kmalloc(sizeof(*ufence), GFP_KERNEL);
> =C2=A0	if (!ufence)
> -		return NULL;
> +		return ERR_PTR(-ENOMEM);
> =C2=A0
> =C2=A0	ufence->xe =3D xe;
> =C2=A0	kref_init(&ufence->refcount);
> -	ufence->addr =3D u64_to_user_ptr(addr);
> +	ufence->addr =3D ptr;
> =C2=A0	ufence->value =3D value;
> =C2=A0	ufence->mm =3D current->mm;
> =C2=A0	mmgrab(ufence->mm);
> @@ -183,8 +187,8 @@ int xe_sync_entry_parse(struct xe_device *xe,
> struct xe_file *xef,
> =C2=A0		} else {
> =C2=A0			sync->ufence =3D user_fence_create(xe,
> sync_in.addr,
> =C2=A0						=09
> sync_in.timeline_value);
> -			if (XE_IOCTL_DBG(xe, !sync->ufence))
> -				return -ENOMEM;
> +			if (XE_IOCTL_DBG(xe, IS_ERR(sync->ufence)))
> +				return PTR_ERR(sync->ufence);
> =C2=A0		}
> =C2=A0
> =C2=A0		break;

