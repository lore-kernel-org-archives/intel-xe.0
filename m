Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABE0DCD4851
	for <intel-xe@archiver.kernel.org>; Tue, 12 May 2026 11:51:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A3D610E07D;
	Tue, 12 May 2026 11:51:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m9cKVWKU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3264710E07D;
 Tue, 12 May 2026 11:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778586711; x=1810122711;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=DTTYfj6q7ghJDtPc5eBdNn0PhVORBYpJIjbNAepA78c=;
 b=m9cKVWKUIGgewAAyfBl7p/dQNCchQyTOj0uLIlfsDxqyUjq8NhzrePxQ
 RJJtPA/AaBbWDw0/BXbK4duiR4qUmDhVozkN2wOmLGxoAMFFtx3cWz4z0
 +rxMMPiyMc1IMIVoCSYqrFb7zLL8lIfKCbYU2DD1EBYNBq/2jCUfgsHQ8
 Ou7jxxtwRaZ51NGTRpEez87eVwybH/gwKk03+J86J+x6ybRW7/1xRbNiq
 iCPZEiK4E7+qbDreE7xyNYp2UhD95yn+vR+YBv62/SH3vBB6JFHci8v2U
 TT8Nm6O0ZQwCaBozzyfvMI/kJvwZkNo11FZq6OS1eI1AW1t48y+nHPx/x Q==;
X-CSE-ConnectionGUID: 6gt4YCUQTJ22wIGq2hLIXQ==
X-CSE-MsgGUID: WN4mXJfKRdeqOOf1soWW8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="90956165"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="90956165"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 04:51:50 -0700
X-CSE-ConnectionGUID: 3047wuQgQr+XPEC29WfXxQ==
X-CSE-MsgGUID: tuVP49awTRWOQw4ezyF7iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="268093721"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.245.203])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 04:51:48 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Vinod Govindapillai <vinod.govindapillai@intel.com>,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, ville.syrjala@linux.intel.com
Subject: Re: [PATCH v2 11/11] drm/i915/bw: insert a sw bw info entry to
 cater low data rate usecases
In-Reply-To: <20260511122816.1235478-12-vinod.govindapillai@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260511122816.1235478-1-vinod.govindapillai@intel.com>
 <20260511122816.1235478-12-vinod.govindapillai@intel.com>
Date: Tue, 12 May 2026 14:51:43 +0300
Message-ID: <72b13fe8baa13cd54791b1c4ab9898e4e2c421e2@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Mon, 11 May 2026, Vinod Govindapillai <vinod.govindapillai@intel.com> wrote:
> In xe3+, soc can lower the fabric frequency when the display
> needs less bandwidth than the minimum GV point. This threshold
> has been defined as 20GB/s. To enable this,
>
> Add a new low bw info point with this peakbw threshold of 20GB/s
> based on the following conditions:
> 1. Only for xe3+ versions
> 2. There is at least one QGV point
> 3. Number QGV points is less than 8
> 4. Lowest peak bw across all the QGV point is less than 20 GB/s
> 5. And the derated bw is in the lowest peak bw qgv point is also
>    less than this threshold of 20GB/s
>
> This will make the driver to send this new threshold of 20GB/s
> as the pmdemand request whenever the bw required for a usecase
> is less than 20GB/s. The current pcode can handle this lower
> peakbw value and adjust the fabric frequency accordingly.
>
> Bspec: 68880
> Assisted-by: Copilot:claude-sonnet-4.6
> Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_bw.c       | 54 +++++++++++++++++++
>  .../drm/i915/display/intel_display_device.h   |  1 +
>  2 files changed, 55 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_bw.c b/drivers/gpu/drm/i915/display/intel_bw.c
> index 938c0294c251..747279075e29 100644
> --- a/drivers/gpu/drm/i915/display/intel_bw.c
> +++ b/drivers/gpu/drm/i915/display/intel_bw.c
> @@ -54,6 +54,8 @@ struct intel_qgv_point {
>  
>  #define DEPROGBWPCLIMIT		60
>  
> +#define PEAK_BW_THRESHOLD	20000
> +
>  struct intel_psf_gv_point {
>  	u8 clk; /* clock in multiples of 16.6666 MHz */
>  };
> @@ -589,6 +591,50 @@ static int icl_get_bw_info(struct intel_display *display,
>  	return 0;
>  }
>  
> +static bool xe3_check_lower_peakbw(struct intel_display *display,
> +				   const struct intel_qgv_info *qi,
> +				   int num_channels)

My pet peeve is naming functions with "check". Is it an assert? What
does it do? What does the return value mean?

BR,
Jani.

> +{
> +	unsigned int lowest_peakbw;
> +
> +	if (!HAS_PEAK_BW_THRESHOLD(display))
> +		return false;
> +
> +	if (qi->num_points >= I915_NUM_QGV_POINTS) {
> +		drm_warn(display->drm, "Cannot insert lowest QGV point, not enough space\n");
> +		return false;
> +	}
> +
> +	lowest_peakbw = DIV_ROUND_CLOSEST(qi->points[0].dclk *
> +					  qi->channel_width * num_channels, 8);
> +	if (lowest_peakbw <= PEAK_BW_THRESHOLD) {
> +		drm_dbg_kms(display->drm,
> +			    "Lowest QGV point has peak BW %u MB/s, no need to insert lower point\n",
> +			    lowest_peakbw);
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
> +static void xe3_insert_lowest_qgv_point(struct intel_display *display,
> +					struct intel_bw_info *bi)
> +{
> +	if (bi->num_qgv_points >= ARRAY_SIZE(bi->deratedbw))
> +		return;
> +
> +	memmove(&bi->deratedbw[1], &bi->deratedbw[0],
> +		bi->num_qgv_points * sizeof(*bi->deratedbw));
> +
> +	memmove(&bi->peakbw[1], &bi->peakbw[0],
> +		bi->num_qgv_points * sizeof(*bi->peakbw));
> +
> +	/* Keep the derated bandwidth as the threshold*/
> +	bi->deratedbw[0] = PEAK_BW_THRESHOLD;
> +	bi->peakbw[0] = PEAK_BW_THRESHOLD;
> +	bi->num_qgv_points++;
> +}
> +
>  static int tgl_get_bw_info(struct intel_display *display,
>  			   const struct dram_info *dram_info,
>  			   const struct intel_sa_info *sa)
> @@ -598,6 +644,7 @@ static int tgl_get_bw_info(struct intel_display *display,
>  	int num_channels = max_t(u8, 1, dram_info->num_channels);
>  	int ipqdepth, ipqdepthpch = 16;
>  	int dclk_max;
> +	bool insert_low_peakbw;
>  	int maxdebw, peakbw;
>  	int clperchgroup;
>  	int num_groups = ARRAY_SIZE(display->bw.max);
> @@ -636,6 +683,10 @@ static int tgl_get_bw_info(struct intel_display *display,
>  	 */
>  	clperchgroup = 4 * DIV_ROUND_UP(8, num_channels) * qi.deinterleave;
>  
> +	insert_low_peakbw = xe3_check_lower_peakbw(display, &qi, num_channels);
> +
> +	display->bw.max[i].num_planes = 0;
> +
>  	for (i = 0; i < num_groups; i++) {
>  		struct intel_bw_info *bi = &display->bw.max[i];
>  		struct intel_bw_info *bi_next;
> @@ -678,6 +729,9 @@ static int tgl_get_bw_info(struct intel_display *display,
>  							  qi.channel_width, 8);
>  		}
>  
> +		if (insert_low_peakbw)
> +			xe3_insert_lowest_qgv_point(display, bi);
> +
>  		for (j = 0; j < qi.num_psf_points; j++) {
>  			const struct intel_psf_gv_point *sp = &qi.psf_points[j];
>  
> diff --git a/drivers/gpu/drm/i915/display/intel_display_device.h b/drivers/gpu/drm/i915/display/intel_display_device.h
> index 65283286771a..b31ec42c3248 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_device.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_device.h
> @@ -192,6 +192,7 @@ struct intel_display_platforms {
>  #define HAS_MBUS_JOINING(__display)	((__display)->platform.alderlake_p || DISPLAY_VER(__display) >= 14)
>  #define HAS_MSO(__display)		(DISPLAY_VER(__display) >= 12)
>  #define HAS_OVERLAY(__display)		(DISPLAY_INFO(__display)->has_overlay)
> +#define HAS_PEAK_BW_THRESHOLD(__display)	(DISPLAY_VER(__display) >= 30)
>  #define HAS_PIPEDMC(__display)		(DISPLAY_VER(__display) >= 12)
>  #define HAS_PIXEL_NORMALIZER(__display)	(DISPLAY_VER(__display) >= 35)
>  #define HAS_PMDEMAND(__display)		(DISPLAY_VER(__display) >= 14)

-- 
Jani Nikula, Intel
