Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFA06CD98CF
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jun 2026 15:20:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CFA210E4F5;
	Mon, 15 Jun 2026 15:20:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bucWbcG3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D635410E4F5;
 Mon, 15 Jun 2026 15:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781536811; x=1813072811;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=gtrSkE+6aBdyhSdyVLWn+zmd9fy5btvjeKIZHxuO8rg=;
 b=bucWbcG3IZ2JMc1W/B0+huQwDhV20xE+Nca6nCPC21OxvKdbUefkSB1e
 fiWIpFqt5woZ0uc95SIx03nfRzcfVakAtmUcW2IjA+qBKYdFpj947ma1s
 VWi0dI8a6gFxtD1cRtsbKfkE4rGvDZO5jjtTwdafFlSuSijG0lTKNkFJ5
 FpggWduMlnBOG8IqtpiIx+DjtRwaRhtVaOHXfMBaBqqnL3RCG39Kw4aVJ
 YS4k2KMEkn0xr8v55XOh6Q9XfI6ao4sTvgw+3eCP8UNZmJLqQHZNIYWHM
 jsUpI9J44jZZt/O6i4wteTygxCi5L252+AHxTPuaVjAPN8+ZjzZjzx0// Q==;
X-CSE-ConnectionGUID: oGi8ypVnQQCykyGHJqf/Iw==
X-CSE-MsgGUID: 9+j2TsfKReWCHosHKRcR7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="86180241"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="86180241"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 08:20:10 -0700
X-CSE-ConnectionGUID: VmGy7RC7RFKPeOM4VBi+gw==
X-CSE-MsgGUID: pr6SN36jSdS4V48Pw8E01w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="246389526"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.28])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 08:20:08 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Jouni =?utf-8?Q?H=C3=B6gander?= <jouni.hogander@intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: Jouni =?utf-8?Q?H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: Re: [PATCH] drm/i915/psr: Force fastset on debugfs write for each
 connector supporting PSR
In-Reply-To: <20260609044149.274249-1-jouni.hogander@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260609044149.274249-1-jouni.hogander@intel.com>
Date: Mon, 15 Jun 2026 18:20:05 +0300
Message-ID: <c9246940e0f15570906d3fd6f134c5ede55e9fe7@intel.com>
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

On Tue, 09 Jun 2026, Jouni H=C3=B6gander <jouni.hogander@intel.com> wrote:
> Currently intel_psr_fast_set_force is forcing fastset only for eDP
> connectors. Panel Replay is supported on DP as well and writing
> i915_edp_psr_debug is setting debug parameters for each DP transcoder
> (struct intel_dp:psr:debug). Force fastset for each connector supporting
> PSR.
>
> Signed-off-by: Jouni H=C3=B6gander <jouni.hogander@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_psr.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i=
915/display/intel_psr.c
> index e138982dc91f6..78795bd3ceba4 100644
> --- a/drivers/gpu/drm/i915/display/intel_psr.c
> +++ b/drivers/gpu/drm/i915/display/intel_psr.c
> @@ -3446,10 +3446,12 @@ static int intel_psr_fastset_force(struct intel_d=
isplay *display)
>  retry:
>  	drm_connector_list_iter_begin(display->drm, &conn_iter);
>  	drm_for_each_connector_iter(conn, &conn_iter) {
> +		struct intel_connector *intel_connector =3D to_intel_connector(conn);

	for_each_intel_connector_iter(connector, &conn_iter)

>  		struct drm_connector_state *conn_state;
>  		struct drm_crtc_state *crtc_state;
>=20=20
> -		if (conn->connector_type !=3D DRM_MODE_CONNECTOR_eDP)
> +		if (!intel_connector->dp.psr_caps.support &&
> +		    !intel_connector->dp.panel_replay_caps.support)
>  			continue;
>=20=20
>  		conn_state =3D drm_atomic_get_connector_state(state, conn);

--=20
Jani Nikula, Intel
