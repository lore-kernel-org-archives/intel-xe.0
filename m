Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DBBEF4368B
	for <intel-xe@archiver.kernel.org>; Fri, 17 Apr 2026 10:32:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CAA110E9DE;
	Fri, 17 Apr 2026 10:32:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NsrOKXVF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B530D10E9DD;
 Fri, 17 Apr 2026 10:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776421965; x=1807957965;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=9tUBpxW3zXnVnqtwz8hha2eXNek4agO6tpcY+zMM5Zc=;
 b=NsrOKXVFOxFRE0FXUgTeFFaGOvA/y81nbI732A9RzCuhPQJm7CcFDu9c
 g8U+7Wv5JPOq3TdSMK4H/94b0R7yMH9tKzyUlQx/oE9lnqUj+RWQK+8S8
 trPrX7l/Hv38i8jgLLZKCq2cvm50cdj0JBPiUGHGJibj0YFGs40fIj0e3
 c+/+Bd+vL3HZJ2Mvgi0fW8JQ+3pfmvf9ikajQWoBsuz2z7MvF/Rdk/b8u
 f+vQObS1qP6tb5W+7+lUnJV5HYDOE8wTK63eRfg1AZLD50oxi4Ov4R470
 mYClDZ92kEePuuudTZ7vv4Q8LLHA1fiCxQAMX2eAsx4obCqQZhtj4xpaR g==;
X-CSE-ConnectionGUID: eI2nnSiBT5mjMq1ZF9U22Q==
X-CSE-MsgGUID: hyfcLpwmQJKiL6zHWAfU3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="77445721"
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; d="scan'208";a="77445721"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 03:32:44 -0700
X-CSE-ConnectionGUID: LDztDE/vS3607JdrBuLWiQ==
X-CSE-MsgGUID: q+JvfRIQRSKucyNIYCGTwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; d="scan'208";a="235960927"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.245.127])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2026 03:32:42 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Jouni =?utf-8?Q?H=C3=B6gander?= <jouni.hogander@intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: Jouni =?utf-8?Q?H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: Re: [PATCH v2] drm/i915/psr: Disable PSR2 on Xiaomi Book Pro 14
 2026 as a quirk
In-Reply-To: <20260417102350.28328-1-jouni.hogander@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260417102350.28328-1-jouni.hogander@intel.com>
Date: Fri, 17 Apr 2026 13:32:40 +0300
Message-ID: <1cd1f26d7a74c778f2cbc1ddc3dd5e5fd0f3a80e@intel.com>
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

On Fri, 17 Apr 2026, Jouni H=C3=B6gander <jouni.hogander@intel.com> wrote:
> Add new quirk (QUIRK_DISABLE_PSR2) for disabling PSR2 as a quirk for
> problematic setups. Apply this newly added quirk on Xiaomi Book Pro 14
> 2026.
>
> v2: logging adjusted
>
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/7677
> Signed-off-by: Jouni H=C3=B6gander <jouni.hogander@intel.com>

Acked-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_psr.c    | 3 +++
>  drivers/gpu/drm/i915/display/intel_quirks.c | 9 +++++++++
>  drivers/gpu/drm/i915/display/intel_quirks.h | 1 +
>  3 files changed, 13 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i=
915/display/intel_psr.c
> index 63c19958a9e3..d1bae7d32617 100644
> --- a/drivers/gpu/drm/i915/display/intel_psr.c
> +++ b/drivers/gpu/drm/i915/display/intel_psr.c
> @@ -695,6 +695,9 @@ static void _psr_init_dpcd(struct intel_dp *intel_dp,=
 struct intel_connector *co
>=20=20
>  	connector->dp.psr_caps.sync_latency =3D intel_dp_get_sink_sync_latency(=
intel_dp);
>=20=20
> +	if (intel_has_quirk(display, QUIRK_DISABLE_PSR2))
> +		return;
> +
>  	if (DISPLAY_VER(display) >=3D 9 &&
>  	    connector->dp.psr_caps.dpcd[0] >=3D DP_PSR2_WITH_Y_COORD_IS_SUPPORT=
ED) {
>  		bool y_req =3D connector->dp.psr_caps.dpcd[1] &
> diff --git a/drivers/gpu/drm/i915/display/intel_quirks.c b/drivers/gpu/dr=
m/i915/display/intel_quirks.c
> index 883f297d4b83..d1c428eeb608 100644
> --- a/drivers/gpu/drm/i915/display/intel_quirks.c
> +++ b/drivers/gpu/drm/i915/display/intel_quirks.c
> @@ -94,6 +94,12 @@ static void quirk_disable_edp_panel_replay(struct inte=
l_dp *intel_dp)
>  	drm_info(display->drm, "Applying disable Panel Replay quirk\n");
>  }
>=20=20
> +static void quirk_disable_psr2(struct intel_display *display)
> +{
> +	intel_set_quirk(display, QUIRK_DISABLE_PSR2);
> +	drm_info(display->drm, "PSR2 support not currently available for this s=
etup, applying disable PSR2 quirk\n");
> +}
> +
>  struct intel_quirk {
>  	int device;
>  	int subsystem_vendor;
> @@ -250,6 +256,9 @@ static struct intel_quirk intel_quirks[] =3D {
>=20=20
>  	/* Dell XPS 13 7390 2-in-1 */
>  	{ 0x8a52, 0x1028, 0x08b0, quirk_edp_limit_rate_hbr2 },
> +
> +	/* Xiaomi Book Pro 14 2026 */
> +	{ 0xb081, 0x1d72, 0x2424, quirk_disable_psr2 },
>  };
>=20=20
>  static const struct intel_dpcd_quirk intel_dpcd_quirks[] =3D {
> diff --git a/drivers/gpu/drm/i915/display/intel_quirks.h b/drivers/gpu/dr=
m/i915/display/intel_quirks.h
> index 83214eb94b0c..970a4fe52faf 100644
> --- a/drivers/gpu/drm/i915/display/intel_quirks.h
> +++ b/drivers/gpu/drm/i915/display/intel_quirks.h
> @@ -22,6 +22,7 @@ enum intel_quirk_id {
>  	QUIRK_FW_SYNC_LEN,
>  	QUIRK_EDP_LIMIT_RATE_HBR2,
>  	QUIRK_DISABLE_EDP_PANEL_REPLAY,
> +	QUIRK_DISABLE_PSR2,
>  };
>=20=20
>  void intel_init_quirks(struct intel_display *display);

--=20
Jani Nikula, Intel
