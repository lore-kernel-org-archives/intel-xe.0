Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31F62C54F4C
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jul 2026 07:44:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4F3C10E7CF;
	Tue, 28 Jul 2026 07:44:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LryIGuZh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3405A10E7CF;
 Tue, 28 Jul 2026 07:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785224650; x=1816760650;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=ksInDzM+86JhbVT38J/iIk+Qisvyf6Z5sRFODaY2HMM=;
 b=LryIGuZhtpFLDF2IivwypgwEP4JLhDBp3zScTGzULBO4vYEcJ4pmWX/e
 jEutoFB26USRDzhEpd4ROOT7NcGummvY0O+Sv7zQ8k1bIDGoDkPcvrnLz
 8MGaNAzzp0aynyB6fFF+1Es8MyWCzo0cZtsfVj13db/qdSA1B0BFH7VCt
 fUAhPahRHb6D4pSK53iyyRgVZ1NUDUYwQNNNcy67gjEGmD8eigvKoPlcj
 joM/pN0S9npRDiu7UE/splxO3CcFYGRnl/SH639ig3kKnWQnUdp6sXesE
 JfDF69t+CV+Ut1WpP8DS1QE9naYPdKd3a6j6rK85+x+D1zF6i8dKyg0iI g==;
X-CSE-ConnectionGUID: k3IatjI9SBCpEmlz9tlUxA==
X-CSE-MsgGUID: bz7Y0aNzRT6HF4onpjV9SA==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="73338639"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="73338639"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 00:44:09 -0700
X-CSE-ConnectionGUID: 4eNcJ8GpTziOddnGqOEr/g==
X-CSE-MsgGUID: 6djnSKGYSNGJi1/wbVwfgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="259068983"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.76])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 00:44:08 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@intel.com>
Subject: Re: [PATCH v1 1/2] drm/i915/display: fix SKL_DSSM register masks
In-Reply-To: <20260727222125.2459634-2-michal.grzelak@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260727222125.2459634-1-michal.grzelak@intel.com>
 <20260727222125.2459634-2-michal.grzelak@intel.com>
Date: Tue, 28 Jul 2026 10:44:05 +0300
Message-ID: <e1ca770e528bfe634f05bacfc658292083ed91c9@intel.com>
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

On Tue, 28 Jul 2026, Micha=C5=82 Grzelak <michal.grzelak@intel.com> wrote:
> Add indentation into SKL_DSSM reference clock macros. Replace bit shifts
> with REG_GENMASK().
>
> Signed-off-by: Micha=C5=82 Grzelak <michal.grzelak@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display_regs.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_regs.h b/drivers/=
gpu/drm/i915/display/intel_display_regs.h
> index 0f5018482497..0677ca2dde00 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_regs.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_regs.h
> @@ -1779,10 +1779,10 @@
>  #define   XE2LPD_DE_CAP_SCALER_SINGLE	1
>=20=20
>  #define SKL_DSSM				_MMIO(0x51004)
> -#define ICL_DSSM_CDCLK_PLL_REFCLK_MASK		(7 << 29)
> -#define ICL_DSSM_CDCLK_PLL_REFCLK_24MHz		(0 << 29)
> -#define ICL_DSSM_CDCLK_PLL_REFCLK_19_2MHz	(1 << 29)
> -#define ICL_DSSM_CDCLK_PLL_REFCLK_38_4MHz	(2 << 29)
> +#define   ICL_DSSM_CDCLK_PLL_REFCLK_MASK	REG_GENMASK(31, 29)
> +#define   ICL_DSSM_CDCLK_PLL_REFCLK_24MHz	0
> +#define   ICL_DSSM_CDCLK_PLL_REFCLK_19_2MHz	REG_GENMASK(29, 29)
> +#define   ICL_DSSM_CDCLK_PLL_REFCLK_38_4MHz	REG_GENMASK(30, 29)

Define _MASK with REG_GENMASK and values with REG_FIELD_PREP. The above
is just plain wrong.


>=20=20
>  /*GEN11 chicken */
>  #define _PIPEA_CHICKEN				0x70038

--=20
Jani Nikula, Intel
