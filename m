Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C6B3FD8FD7
	for <intel-xe@archiver.kernel.org>; Thu, 26 Feb 2026 16:44:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 185EC10E9B3;
	Thu, 26 Feb 2026 16:44:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nOYFg5zx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 531B310E9B3;
 Thu, 26 Feb 2026 16:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772124269; x=1803660269;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=uj/i/HnaT46DmpNzeqdOvzysLKqoqq43QXVgDygdMx4=;
 b=nOYFg5zxhbk5ig6Cqihtl4d8AJCVobZ5mcCGrCZLXKUOahpHQ2KEpA1s
 NgvK6QTJYTz7eVxNxzQA/nWJnnVaMEssemvPVS/ixSElPytff+ZiqlLHq
 DziElejioBH6laYmeIPYm0r7WjYx6HrExC82DBo0fxCj+kSVrWiI+OxRn
 RnyHP0n9CzjP6vZUAUlMTn/nTfYhPSBM4gf0vdZo7e5ucExnq10Mtt6Pz
 C7gosAmtWGl7gcUA5RzxgQLq8f7EC5Q2VP7jMUsRfp35WFEuiA+Vkr8zr
 aUnkp8M9zkIw+AbalPGGsiq/q4hA/qfEZpfq8Oy2GjQv6UaoDm4ZdLB6p g==;
X-CSE-ConnectionGUID: q5OCKfXrTB6onYSK9wKWRw==
X-CSE-MsgGUID: MHiRA2H7QEiGfeV6f2A2dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="60765769"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="60765769"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 08:44:29 -0800
X-CSE-ConnectionGUID: HYP7DCj+RW2lWilrPLVc/g==
X-CSE-MsgGUID: RDX/POpcTOe0StFiBqnnnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="221135527"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.244.224])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 08:44:27 -0800
Date: Thu, 26 Feb 2026 18:44:23 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jouni.hogander@intel.com, animesh.manna@intel.com
Subject: Re: [PATCH 12/14] include/drm/display/dp: Add DPCD registers for
 configuring Panel Replay + VRR
Message-ID: <aaB4ZypdYVFRgXX7@intel.com>
References: <20260223134431.1639308-1-ankit.k.nautiyal@intel.com>
 <20260223134431.1639308-13-ankit.k.nautiyal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260223134431.1639308-13-ankit.k.nautiyal@intel.com>
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

On Mon, Feb 23, 2026 at 07:14:29PM +0530, Ankit Nautiyal wrote:
> Add additional DPCDs required to be configured to support VRR with Panel
> Replay. These DPCDs are specifically required for configuring Adaptive Sync
> SDP and are introduced in DP v2.1.
> 
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>  include/drm/display/drm_dp.h | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
> index e4eebabab975..e63705415647 100644
> --- a/include/drm/display/drm_dp.h
> +++ b/include/drm/display/drm_dp.h
> @@ -773,6 +773,15 @@
>  # define DP_PANEL_REPLAY_SU_Y_GRANULARITY_EXTENDED_VAL_SEL_MASK  (0xf << 3)
>  # define DP_PANEL_REPLAY_SU_REGION_SCANLINE_CAPTURE		 (1 << 7)
>  
> +#define PANEL_REPLAY_CONFIG3				0x11a	/* DP 2.1 */
> +# define AS_SDP_SETUP_TIME_MASK				(3 << 6)
> +# define AS_SDP_SETUP_TIME_T1				0
> +# define AS_SDP_SETUP_TIME_DYNAMIC			1	/* uses Table 2-227 */
                                                                        ^^^^^^^^^^^

That reference is likely very DP spec version specific.

> +# define AS_SDP_SETUP_TIME_T2				2

Missing the shift on the values.

> +
> +#define AS_SDP_TRANSMISSION_TIMIING_CONFIG	0x11b	/* DP 2.1 */
> +# define AS_SDP_ONE_LINE_EARLIER_ENABLE		BIT(7)
> +
>  #define DP_PAYLOAD_ALLOCATE_SET		    0x1c0
>  #define DP_PAYLOAD_ALLOCATE_START_TIME_SLOT 0x1c1
>  #define DP_PAYLOAD_ALLOCATE_TIME_SLOT_COUNT 0x1c2
> -- 
> 2.45.2

-- 
Ville Syrjälä
Intel
