Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C41E5CD8CB9
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jun 2026 17:31:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CF5110E1C4;
	Wed, 10 Jun 2026 17:31:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OoIDqObO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AA6E10E1C4;
 Wed, 10 Jun 2026 17:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781112713; x=1812648713;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=B/YZfjmutsZZkHO47Np9ptYY/1Um+YYmQpt7mOTDUzs=;
 b=OoIDqObOhmHbLhyg3EYOzDS9tMBPkaT8l5Fy42ivSytYt07cbEJBHxOs
 huGuTO/P10FLC522hmMMj2HCFHqwr6scDeIK+Cl2vGOWIxRuCyAMe68fn
 nDYhyBAQ1NXnWMTSNdZDnjHGqVKRoLqDRuENQ5CMjPOGm62K2NjD2Q+7n
 2TeKM+zBIQ9wDmMHAt7yiFW274FYxwXi7Ie7ISixxi8h7cttkmxg83LHM
 WG8RaIx6BsKQKECiCwtoa6icHyZ1tbB9eThlo2DBTm3GfE7gLVElsX/Rx
 WwlhthxM18YkhSW0K5GyNfEd7L+TooWyjKscRVSgf+oJ9Ugit+gXkQY2g w==;
X-CSE-ConnectionGUID: KQCHUryZTZqA79R7XL5lJQ==
X-CSE-MsgGUID: VNy30xX/T2OuyKIbQCebwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="92233576"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="92233576"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 10:31:53 -0700
X-CSE-ConnectionGUID: BsBZgVexRoShuvg035cFZA==
X-CSE-MsgGUID: wNvcGwDsTjORIYyFkMfGrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="239887752"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.244.3])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 10:31:51 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 02/14] drm/i915/cdclk: Pass CDCLK in MHz to pcode on DG2
In-Reply-To: <20260610170652.5320-3-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260610170652.5320-1-ville.syrjala@linux.intel.com>
 <20260610170652.5320-3-ville.syrjala@linux.intel.com>
Date: Wed, 10 Jun 2026 20:31:48 +0300
Message-ID: <4e72aea4331149f4f54016dfb884e171255ba483@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Wed, 10 Jun 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> We are currently trying to pass the CDCLK in kHz to the pcode
> on DG2, while the pcode expects a value in MHz units. Adjust
> the units appropriately.

How is it working? :o

Fixes: ?

> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_cdclk.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm=
/i915/display/intel_cdclk.c
> index 9ca56bab281f..9718062d8d6c 100644
> --- a/drivers/gpu/drm/i915/display/intel_cdclk.c
> +++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
> @@ -2703,8 +2703,10 @@ static void intel_cdclk_pcode_pre_notify(struct in=
tel_atomic_state *state)
>  	 * if CDCLK is decreasing or not changing, set bits 25:16 to current CD=
CLK,
>  	 * which basically means we choose the maximum of old and new CDCLK, if=
 we know both
>  	 */
> -	if (change_cdclk)
> +	if (change_cdclk) {
>  		cdclk =3D max(new_cdclk_state->actual.cdclk, old_cdclk_state->actual.c=
dclk);
> +		cdclk =3D DIV_ROUND_UP(cdclk, 1000);
> +	}

I'd consider s/cdclk/cdclk_mhz/g here and in intel_pcode_notify() to
emphasize it's not kHz.

>  	/*
>  	 * According to "Sequence For Pipe Count Change",
> @@ -2740,8 +2742,10 @@ static void intel_cdclk_pcode_post_notify(struct i=
ntel_atomic_state *state)
>  	 * According to "Sequence After Frequency Change",
>  	 * set bits 25:16 to current CDCLK
>  	 */
> -	if (update_cdclk)
> +	if (update_cdclk) {
>  		cdclk =3D new_cdclk_state->actual.cdclk;
> +		cdclk =3D DIV_ROUND_UP(cdclk, 1000);
> +	}

Ditto.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

>=20=20
>  	/*
>  	 * According to "Sequence For Pipe Count Change",

--=20
Jani Nikula, Intel
