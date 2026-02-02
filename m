Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDC5CE7DEFC
	for <intel-xe@archiver.kernel.org>; Mon,  2 Feb 2026 16:02:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73DF210E504;
	Mon,  2 Feb 2026 16:02:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fP9isPWp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3926510E501;
 Mon,  2 Feb 2026 16:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770048174; x=1801584174;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=93vC35IoasH+ZPtHd4L8/1MfGfVTntkR6ZOHyPwamGo=;
 b=fP9isPWpPXoGEwXOA8geQkA1dHF8JEzPyzNfLGYX35sOYokZ7KnWUuhj
 HqXSmIEtCuXs746h6lZ5JWQ3wwEiHbpg/shxFnnDP7rt9Tvfxga93U7LQ
 QtPJAgzzJ/937x0kkF7fnozwFSA0HDcYNLg8RoW/YxPGnGGwcbnF7vMdi
 aoDiTAsFghA0OYtiYOXNje0ElIFPzA9+GWYzI3Va/7ZxLL8hrzdMOfdW1
 hhdqrtaxmGsf8nTpkan+KAK0zWZtZcC5R622JsXjluCgESoe84OKwUYvd
 JdNe4TZPgDkTxOJlddlHj0bnOeRH4usvyc0Lx8/SkcTOuDQ3B5tsZMASA g==;
X-CSE-ConnectionGUID: P80HNB26RbyqLkC5Ppc/1A==
X-CSE-MsgGUID: 4gcCFacaTEq7Ip3iBy+1UA==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="71105848"
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; d="scan'208";a="71105848"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 08:02:53 -0800
X-CSE-ConnectionGUID: 0+LfPTEaR96bWLI8YVAiBQ==
X-CSE-MsgGUID: GNlrpl3KR+CjXe8/Ci1geA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; d="scan'208";a="209559118"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.247])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 08:02:49 -0800
Date: Mon, 2 Feb 2026 18:02:46 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jouni.hogander@intel.com
Subject: Re: [PATCH 2/4] drm/i915/vrr: Avoid vrr for PCON with HDMI2.1 sink
Message-ID: <aYDKpm3SKZPyZMnA@intel.com>
References: <20251111093007.3771409-1-ankit.k.nautiyal@intel.com>
 <20251111093007.3771409-3-ankit.k.nautiyal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251111093007.3771409-3-ankit.k.nautiyal@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

On Tue, Nov 11, 2025 at 03:00:05PM +0530, Ankit Nautiyal wrote:
> Currently we do not support VRR with HDMI so skip vrr compute
> config step for DP PCON with HDMI sink.
> 
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_vrr.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
> index 00cbc126fb36..7a58e1f8acea 100644
> --- a/drivers/gpu/drm/i915/display/intel_vrr.c
> +++ b/drivers/gpu/drm/i915/display/intel_vrr.c
> @@ -42,7 +42,14 @@ bool intel_vrr_is_capable(struct intel_connector *connector)
>  	case DRM_MODE_CONNECTOR_DisplayPort:
>  		if (connector->mst.dp)
>  			return false;
> +
>  		intel_dp = intel_attached_dp(connector);
> +		/*
> +		 * VRR via PCON is currently unsupported.
> +		 * TODO: Add support for VRR for DP HDMI2.1 PCON.
> +		 */
> +		if (intel_dp_has_hdmi_sink(intel_dp))

That just checks what the EDID says about HDMI support, it
doesn't really mean anything wrt. PCON vs. not.

So if we eg. have a DVI sink attach through a PCON we won't
bail out here.

> +			return false;
>  
>  		if (!drm_dp_sink_can_do_video_without_timing_msa(intel_dp->dpcd))
>  			return false;
> -- 
> 2.45.2

-- 
Ville Syrjälä
Intel
