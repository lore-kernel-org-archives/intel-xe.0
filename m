Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97D0AC27C5E
	for <intel-xe@archiver.kernel.org>; Tue, 11 Jun 2024 12:47:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0D8A10E08C;
	Tue, 11 Jun 2024 12:47:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aC0Md1pf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15D2810E08C
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Jun 2024 12:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718110052; x=1749646052;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=kqay4CZlefGGpLd/tJVTqxfRNJKy4CRis1Ricwt/yAw=;
 b=aC0Md1pfbtCb6o1i5osUA4CaUhDTi2hpOzZ1if0zJaEGiYY2BI+snjp+
 AcCWvTmuvHmlrmo2w238Hqm2Yh19m2pwS1FGB1eXveTUbT3kERLPH27xE
 LgutwBciEdQHwRjNk60rBsk7U3y9xJ9XZ+RFRLQGdAdnAEGMD56EuF71/
 Ed+r5rHKym35Wsa/ogmkXu3cYqM3vPrqFEFi7WRVGJMCCv1orI+yzOeP/
 vKJ1qSc6brNozpdaLXDFYtX0xPcHzvS/CYDkqQ7gyew3Wd5xrfdbLgOBW
 kkS6XX0EvKjEvoeNDuHSbh2sS83uWQiTFcjFqwK4S6ae0ymEKLyni+oIs A==;
X-CSE-ConnectionGUID: vcjLNifgQEuphI52INcZuw==
X-CSE-MsgGUID: qO7gG1tNQaCwWXE1UbLBYQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="14969482"
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="14969482"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 05:47:31 -0700
X-CSE-ConnectionGUID: Uc3YwAuURimFCYiBZpn9Lw==
X-CSE-MsgGUID: HtNnitauQKmV8n5sm3zxaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="44336695"
Received: from unknown (HELO [10.245.245.125]) ([10.245.245.125])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 05:47:29 -0700
Message-ID: <3dd4733f3cc7f322f25354c3e9d4a2dd363d2331.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Use ttm_uncached for BO with NEEDS_UC flag
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>, 
 intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>
Date: Tue, 11 Jun 2024 14:47:27 +0200
In-Reply-To: <20240606195630.1548-1-michal.wajdeczko@intel.com>
References: <20240606195630.1548-1-michal.wajdeczko@intel.com>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
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

Hi, Michal,

On Thu, 2024-06-06 at 21:56 +0200, Michal Wajdeczko wrote:
> We should honor requested uncached mode also at the TTM layer.
> Otherwise, we risk losing updates to the memory based interrupts
> source or status vectors, as those require uncached memory.
>=20
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_bo.c | 3 +++
> =C2=A01 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 2bae01ce4e5b..2573cc118f29 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -378,6 +378,9 @@ static struct ttm_tt *xe_ttm_tt_create(struct
> ttm_buffer_object *ttm_bo,
> =C2=A0	=C2=A0=C2=A0=C2=A0 (xe->info.graphics_verx100 >=3D 1270 && bo->fla=
gs &
> XE_BO_FLAG_PAGETABLE))
> =C2=A0		caching =3D ttm_write_combined;
> =C2=A0
> +	if (bo->flags & XE_BO_FLAG_NEEDS_UC)
> +		caching =3D ttm_uncached;
> +
> =C2=A0	err =3D ttm_tt_init(&tt->ttm, &bo->ttm, page_flags, caching,
> extra_pages);
> =C2=A0	if (err) {
> =C2=A0		kfree(tt);

To me the preferred method is to teach bo->cpu_caching about the
uncached mode and then include it in the switch statement above.

/Thomas

