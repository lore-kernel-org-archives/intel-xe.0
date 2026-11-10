Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E019606A321
	for <intel-xe@archiver.kernel.org>; Tue, 10 Nov 2026 18:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OvMNXRw8
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 596AC10E321;
	Tue, 10 Nov 2026 18:53:38 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75E0410E321
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Nov 2026 18:53:32 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id BABB263B16;
 Tue, 10 Nov 2026 18:53:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48F121F008A3;
 Tue, 10 Nov 2026 18:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794336811;
 bh=wxs/jnYCntbhrcVoa02DT0hqOkZlB5KyNBmbC8quyOw=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=OvMNXRw8omtvzA+3Usl0aWJXOC6JkTanDfULs9f1I4cAWsA+vKmcts9fsAVu9gvbH
 bADhz0ZVMSeVH5ysAMGTwKTlRLmlBY+Nm7a7RIfYc7zysezCHbD9+5x2BDc4z2+Z/j
 GBhGcRs9ZSY2Ck2WBaL+tgTx0PtRbpUF3+ti+Sx50rZvCInPqHQtoFkCKMct9xEInj
 9KAn90AUBANo5MXREAEqFB0irqFtHSXuY+Ef9SF6Gk4sMlUGTZyNmu1BSayoIJm2bV
 BCXccarxEWjrjkb0bGWzoRquOWwImbpmXXXwW2lxo8ZPOPZL2xRzgdh3bVsSSu7EIT
 JUTIuTEGqBFIw==
Message-ID: <sashiko-outbox-207617@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 17/17] drm/xe/vsec: Support survivability mode for CRI
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261110183505.694124-36-michael.j.ruhl@intel.com>
References: <20261110183505.694124-19-michael.j.ruhl@intel.com>
 <20261110183505.694124-36-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 18:53:30 +0000
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] drm/xe/vsec: use xe_survivability_mode_is_boot_enabled() instead
  of pmt cache
--

commit c58d99d8bdca0b8d22ebde50d5dc7b64549279f1
Author: Michael J. Ruhl <michael.j.ruhl@intel.com>

drm/xe/vsec: Support survivability mode for CRI

This commit adds a VSEC configuration for Crescent Island in survivability
mode that exposes only the PUNIT crashlog PMT capability.

> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe=
_device_types.h
> index a35a8b6e733e5..5d4548d863761 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -492,6 +492,8 @@ struct xe_device {
>  		u32 retry_count;
>  		/** @pmt.punit_guid_cache: cache of the PUNIT GUID */
>  		u32 punit_guid_cache;
> +		/** @pmt.survivability_mode: cache of survivability mode state */
> +		bool survivability_mode;
>  	} pmt;
> =20
>  	/** @soc_remapper: SoC remapper object */
> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index f27bfe8218d78..ffaed9ef43b25 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c

[ ... ]

> @@ -319,7 +339,7 @@ static bool wait_for_fw(struct xe_device *xe)
>  {
>  	int retries =3D VSEC_LATE_BIND_RETRY;  /* wait up to 20 secs */
> =20
> -	if (xe->info.platform !=3D XE_CRESCENTISLAND)
> +	if (xe->info.platform !=3D XE_CRESCENTISLAND || xe->pmt.survivability_m=
ode)
>  		return true;
> =20
>  	while (retries--) {
> @@ -538,6 +558,8 @@ static const int vsec_platforms[] =3D {
> =20
>  static enum xe_vsec get_platform_info(struct xe_device *xe)
>  {
> +	struct xe_survivability *survivability =3D &xe->survivability;
> +
>  	if (xe->info.platform > XE_CRESCENTISLAND)
>  		return XE_VSEC_UNKNOWN;
> =20
> @@ -546,6 +568,9 @@ static enum xe_vsec get_platform_info(struct xe_devic=
e *xe)
>  	     xe->info.platform =3D=3D XE_CRESCENTISLAND))
>  		return XE_VSEC_UNKNOWN;
> =20
> +	if (survivability->mode && xe->info.platform =3D=3D XE_CRESCENTISLAND)
> +		return XE_VSEC_CRI_SURVIVABILITY;
> +
>  	return vsec_platforms[xe->info.platform];
>  }
> =20
> @@ -686,6 +711,13 @@ int xe_vsec_init(struct xe_device *xe)
>  		xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
>  		break;
> =20
> +	case XE_VSEC_CRI_SURVIVABILITY:
> +		xe->pmt.base_offset =3D CRI_PMT_OFFSET;
> +		xe->pmt.survivability_mode =3D true;
> +		info->priv_data =3D &xe_cri_pmt_cb;
> +		xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
> +		break;

[Severity: Low]
Could wait_for_fw() and get_platform_info() call
xe_survivability_mode_is_boot_enabled(xe) directly instead of reaching into
xe->survivability.mode and caching it in xe->pmt.survivability_mode?  Other
subsystems (such as xe_pci.c, xe_heci_gsc.c and xe_i2c.c) already use that
helper, which would also avoid adding the duplicate boolean to struct
xe_device.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110183505.6941=
24-19-michael.j.ruhl@intel.com?part=3D17
