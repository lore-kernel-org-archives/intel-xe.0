Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1E51CD8CB9
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jun 2026 17:32:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A17A710EB20;
	Wed, 10 Jun 2026 17:32:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EYMFjB/T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4833010E67C;
 Wed, 10 Jun 2026 17:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781112733; x=1812648733;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=qCrHKHlsHifLxKwAe643Gk+C4Z+knKR3HYYQ90KEAC8=;
 b=EYMFjB/Tnsbn8Rgg4ZHWxFkcplMbBgACEkrpeStttm4Q+Ob9elJZuX+A
 8+Hq9IqdM8QG+SyUU5PylxlHzaINapqD3cyWmMB3tvBEEUkCsPy1bv6R9
 Pz2HRVL8WdeSmhRg6/eFtyQekn+vWrZPDev1OvvsXYF45btvSi067HmGf
 oxjdusdv0dZdGmXt98QSXeOazrG+aBT4l236nGuujvpzm3z3kwNg663Q3
 nwUqeXE4DfWya56E7p7i7i98qpb3w5VAWapI21Zoz9sqyclxhMHnf1N54
 5wGNVEX8Que+w/tegkKTrlCde0708BoANXhfB7JPSPCXs2n8OkNkUTrWN w==;
X-CSE-ConnectionGUID: ZsILtzRGTiGMoVndrHATZQ==
X-CSE-MsgGUID: akxQLDo9SdytPV0UWijpqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="81916357"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="81916357"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 10:32:13 -0700
X-CSE-ConnectionGUID: jUQDKOLsTM2TSto2ebk34Q==
X-CSE-MsgGUID: TlqObeRaTOyiQsmNXjJYZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="248106898"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.244.3])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 10:32:11 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 01/14] drm/i915/cdclk: Don't bail if pcode post nofify
 fails
In-Reply-To: <20260610170652.5320-2-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260610170652.5320-1-ville.syrjala@linux.intel.com>
 <20260610170652.5320-2-ville.syrjala@linux.intel.com>
Date: Wed, 10 Jun 2026 20:32:09 +0300
Message-ID: <511da82834da302ac50a326c082c45f6134b2556@intel.com>
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
> We already changed the actual cdclk frequency by the time we do
> the pcode post notify. So skipping the subsequent readout is plain
> wrong.

Fixes: ?

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_cdclk.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm=
/i915/display/intel_cdclk.c
> index 189ae2d3cfc9..9ca56bab281f 100644
> --- a/drivers/gpu/drm/i915/display/intel_cdclk.c
> +++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
> @@ -2301,12 +2301,10 @@ static void bxt_set_cdclk(struct intel_display *d=
isplay,
>  						       HSW_PCODE_DE_WRITE_FREQ_REQ,
>  						       cdclk_config->voltage_level, 2);
>  	}
> -	if (ret) {
> +	if (ret)
>  		drm_err(display->drm,
>  			"PCode CDCLK freq set failed, (err %d, freq %d)\n",
>  			ret, cdclk);
> -		return;
> -	}
>=20=20
>  	intel_update_cdclk(display);

--=20
Jani Nikula, Intel
