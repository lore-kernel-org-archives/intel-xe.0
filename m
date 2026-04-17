Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FA02F433DC
	for <intel-xe@archiver.kernel.org>; Fri, 17 Apr 2026 08:30:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0B2610E993;
	Fri, 17 Apr 2026 08:30:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U0pHksDj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFE9610E993;
 Fri, 17 Apr 2026 08:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776414619; x=1807950619;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=BKnoEXnxjJEvFklKhNXe3RQ3ASirB3xi7a6x9QmFl6g=;
 b=U0pHksDjFKFuGVPqBCnWeupjAo62Dci75s/Y7em/bDHNd9T+7d1mIn7v
 2dR2sZipcP4rnUS+Wrg6qQBucB4ViQ8De3+LhM6t9M06OD1wKq6MKUn2M
 dDMi8ZyIV5L66VFjO1Ez9bAA8395V5WoVGdUN+AUhvIghhh/ibCAZ7TwD
 nUYhRoSZal0GuNFpUlu9/1s/QWA3NZY2jaP+oTN+eKUinXCF0kWd4BGbT
 S4eI4hLOqvc5yIdcENY7g76gU+zMdTuBW9Nh9EoPgb2jIK18WjrKmK67P
 MPuujRXZldbfpkFKjcRMoSeSzifv8TmV3uDX+W/xe/gc0wSRhNTnjwsai Q==;
X-CSE-ConnectionGUID: B6XogFCBS0KtHZ5RfNdQmg==
X-CSE-MsgGUID: a2nsygQnTYWp4VSV4U+AGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="88046260"
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="88046260"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 01:30:14 -0700
X-CSE-ConnectionGUID: lqtVBFleQ8urdebuEhYNbQ==
X-CSE-MsgGUID: bApVpZyKQriNRDAHjwHNGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="230122273"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.245.127])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2026 01:30:12 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Jouni =?utf-8?Q?H=C3=B6gander?= <jouni.hogander@intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: Jouni =?utf-8?Q?H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: Re: [PATCH] drm/i915/psr: Disable PSR2 on Xiaomi Book Pro 14 2026
 as a quirk
In-Reply-To: <20260417044926.750354-1-jouni.hogander@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260417044926.750354-1-jouni.hogander@intel.com>
Date: Fri, 17 Apr 2026 11:30:09 +0300
Message-ID: <cb644bbb5baaeca058d8639fbbeaceb748f51522@intel.com>
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
> problematic setups. Apply this newly added quirk on Xiaomi Book Pro 14 20=
26.
>
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/7677
> Signed-off-by: Jouni H=C3=B6gander <jouni.hogander@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_psr.c    | 6 ++++++
>  drivers/gpu/drm/i915/display/intel_quirks.c | 9 +++++++++
>  drivers/gpu/drm/i915/display/intel_quirks.h | 1 +
>  3 files changed, 16 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i=
915/display/intel_psr.c
> index b4ca5843d098..19b3b9d52eb9 100644
> --- a/drivers/gpu/drm/i915/display/intel_psr.c
> +++ b/drivers/gpu/drm/i915/display/intel_psr.c
> @@ -695,6 +695,12 @@ static void _psr_init_dpcd(struct intel_dp *intel_dp=
, struct intel_connector *co
>=20=20
>  	connector->dp.psr_caps.sync_latency =3D intel_dp_get_sink_sync_latency(=
intel_dp);
>=20=20
> +	if (intel_has_quirk(display, QUIRK_DISABLE_PSR2)) {
> +		drm_dbg_kms(display->drm,
> +			    "PSR2 support not currently available for this setup\n");

I think the logging when matching at intel_quirks.c should be
sufficient.

> +		return;
> +	}
> +
>  	if (DISPLAY_VER(display) >=3D 9 &&
>  	    connector->dp.psr_caps.dpcd[0] >=3D DP_PSR2_WITH_Y_COORD_IS_SUPPORT=
ED) {
>  		bool y_req =3D connector->dp.psr_caps.dpcd[1] &
> diff --git a/drivers/gpu/drm/i915/display/intel_quirks.c b/drivers/gpu/dr=
m/i915/display/intel_quirks.c
> index 883f297d4b83..229e0025a06c 100644
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
> +	drm_info(display->drm, "Applying disable PSR2 quirk\n");

Maybe "applying quirk" isn't the most informative? Perhaps combine
something from the other message here?

BR,
Jani.

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
