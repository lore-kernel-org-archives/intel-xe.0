Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77B11C43458
	for <intel-xe@archiver.kernel.org>; Wed,  1 Jul 2026 18:36:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 323A610F09F;
	Wed,  1 Jul 2026 18:36:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iKIZUZvO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E778710F09D;
 Wed,  1 Jul 2026 18:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782930996; x=1814466996;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version:content-id;
 bh=H4EFlqiJ6rdWVTHSsVtS11pxLnVrlXNxdf/uQn6jBvk=;
 b=iKIZUZvO0pWnHKpqsFw6w96roP2gEIkv5yzoh7n5pFrJLH9OD6d00m6F
 JOS3fVnTH61DXMydMmyLaG1NW1AZ0ItgV2R0A1U+7IV+68wQX69Lep7K9
 hTgKaDBiN71sS4JzdISV/MgHHVB+ROfNcqFbi+9ijQmyZdvqo4ExKseI5
 MeHEpWTomPm7KUAWbG4yg8WxvlvaWSaLU2LlQPJB/Ct+Yv/5DTI2ois7h
 e9vBwQW0Rg7mkJNm7cQn3lsjyGiVsYF6jUjIaO5AsW/9uJcbDSwHuzDBW
 hDzgOmu6UVO0ZUMmkJzYNuegcUV0t/kJ+YyOXnWabhQhN58KvabhiUOUP A==;
X-CSE-ConnectionGUID: Tzl6dExnQ2uyiEs6FteMMQ==
X-CSE-MsgGUID: oUMJAkY2S/eXBL97xuTKIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="95057561"
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; d="scan'208";a="95057561"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2026 11:36:36 -0700
X-CSE-ConnectionGUID: Si/NIYL5Ru2etQriXTzfFQ==
X-CSE-MsgGUID: tL3RIBGJTR2UDTU3pwDZkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; d="scan'208";a="256975644"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2026 11:36:34 -0700
Date: Wed, 1 Jul 2026 20:36:32 +0200 (CEST)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: Luca Coelho <luciano.coelho@intel.com>
cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [v6,4/4] drm/i915/display: remove unnecessary PHY_NONE definition
In-Reply-To: <20260609095525.570614-5-luciano.coelho@intel.com>
Message-ID: <fb91bb75-3da8-c0cb-f97e-5b79afcf917f@intel.com>
References: <20260609095525.570614-5-luciano.coelho@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1990365703-1782929956=:605841"
Content-ID: <ac4415ea-1333-c673-724d-e67801daa999@intel.com>
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1990365703-1782929956=:605841
Content-Type: text/plain; CHARSET=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <1f5fa6aa-bd8f-1103-053b-639cdfdc388b@intel.com>

On Tue, 9 Jun 2026, Luca Coelho wrote:
> PHY_NONE is not really used, but we define it and, thus, need to check
> for it in a few places we use phy.  The only potential places where

double space: s/  / /

> phy may become PHY_NONE, is in intel_port_to_phy(), where it derives
> from port, which can be PORT_NONE.  Many of its callers don't check

double space: s/  / /

> for PHY_NONE, which can cause unknown behavior.  Additionally, this

double space: s/  / /

> can only happen if the encoder used has PORT_NONE, which should not be
> the case either, without unexpected consequences.
>
> Remove the PHY_NONE definition entirely and add a couple of WARNs at
> the relevant places, just to be sure.
>
> Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
> ---
> drivers/gpu/drm/i915/display/intel_display.c           | 10 ++++++----
> drivers/gpu/drm/i915/display/intel_display.h           |  2 --
> .../gpu/drm/i915/display/intel_display_power_well.c    |  6 +++++-
> drivers/gpu/drm/i915/display/intel_hti.c               |  3 ---
> 4 files changed, 11 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index bdf02b67c1d8..58713ad04d37 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -1810,9 +1810,7 @@ static void hsw_crtc_disable(struct intel_atomic_state *state,
> /* Prefer intel_encoder_is_combo() */
> bool intel_phy_is_combo(struct intel_display *display, enum phy phy)
> {
> -	if (phy == PHY_NONE)
> -		return false;
> -	else if (display->platform.alderlake_s)
> +	if (display->platform.alderlake_s)
> 		return phy <= PHY_E;
> 	else if (display->platform.dg1 || display->platform.rocketlake)
> 		return phy <= PHY_D;
> @@ -1866,7 +1864,7 @@ bool intel_phy_is_snps(struct intel_display *display, enum phy phy)
> 	 * For DG2, and for DG2 only, all four "combo" ports and the TC1 port
> 	 * (PHY E) use Synopsis PHYs. See intel_phy_is_tc().
> 	 */
> -	return display->platform.dg2 && phy > PHY_NONE && phy <= PHY_E;
> +	return display->platform.dg2 && phy <= PHY_E;
> }
>
> /* Prefer intel_encoder_to_phy() */
> @@ -1884,6 +1882,10 @@ enum phy intel_port_to_phy(struct intel_display *display, enum port port)
> 		 port == PORT_D)
> 		return PHY_A;
>
> +	if (drm_WARN(display->drm, port < 0,
> +		     "PHY is invalid if port < 0 (%d), assuming PHY_A\n", port))
> +		return PHY_A;
> +
> 	return PHY_A + port - PORT_A;
> }
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display.h b/drivers/gpu/drm/i915/display/intel_display.h
> index 98b589e8360d..a4f621934b33 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.h
> +++ b/drivers/gpu/drm/i915/display/intel_display.h
> @@ -136,8 +136,6 @@ enum tc_port {
> };
>
> enum phy {
> -	PHY_NONE = -1,
> -
> 	PHY_A = 0,

I'm wondering if with this change we could remove the assignment above
(PHY_A = 0), since I think enums are starting from 0 by default; but
again I might be missing common codestyle guidelines. Anyways:

Reviewed-by: Micha³ Grzelak <michal.grzelak@intel.com>

BR,
Micha³

> 	PHY_B,
> 	PHY_C,
> diff --git a/drivers/gpu/drm/i915/display/intel_display_power_well.c b/drivers/gpu/drm/i915/display/intel_display_power_well.c
> index 04bd0dde5bed..daea2452a19e 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_power_well.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_power_well.c
> @@ -325,7 +325,11 @@ static enum phy icl_aux_pw_to_phy(struct intel_display *display,
> {
> 	struct intel_encoder *encoder = icl_aux_pw_to_encoder(display, power_well);
>
> -	return encoder ? intel_encoder_to_phy(encoder) : PHY_NONE;
> +	if (drm_WARN(display->drm, !encoder,
> +		     "PHY is invalid if encoder is NULL, assuming PHY_A\n"))
> +		return PHY_A;
> +
> +	return intel_encoder_to_phy(encoder);
> }
>
> static bool icl_aux_pw_is_tc_phy(struct intel_display *display,
> diff --git a/drivers/gpu/drm/i915/display/intel_hti.c b/drivers/gpu/drm/i915/display/intel_hti.c
> index dc454420c134..56602240ceff 100644
> --- a/drivers/gpu/drm/i915/display/intel_hti.c
> +++ b/drivers/gpu/drm/i915/display/intel_hti.c
> @@ -23,9 +23,6 @@ void intel_hti_init(struct intel_display *display)
>
> bool intel_hti_uses_phy(struct intel_display *display, enum phy phy)
> {
> -	if (drm_WARN_ON(display->drm, phy == PHY_NONE))
> -		return false;
> -
> 	return display->hti.state & HDPORT_ENABLED &&
> 		display->hti.state & HDPORT_DDI_USED(phy);
> }
>
--8323329-1990365703-1782929956=:605841--
