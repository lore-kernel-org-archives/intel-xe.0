Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 922DAC88E4A
	for <intel-xe@archiver.kernel.org>; Fri, 11 Sep 2026 11:24:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2966610E1DF;
	Fri, 11 Sep 2026 11:24:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L7uxWNOW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA4D210E1DF;
 Fri, 11 Sep 2026 11:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789125859; x=1820661859;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=WsfVza/DGVZy64DvUFaBOpzD7mDIHEzLn/McKhLWMvw=;
 b=L7uxWNOWD+yLxn0V5QH7a7dfjBjSUf3X4A4nyCCOJ7EK9DzGDx6gxNy6
 EPzs3l500ZUir2Tib/pRu9Z2jhYDiITEQya+SCrZ8+5OcLZwxZuhHhCE3
 YCpEXfbPuzlA54X7A1AmD7oFY6ItCF3ZzDy3LZcjXGPHjQbR73K+DjbQG
 fdvxItloh1VUCcXoL157ygIJmHqe5Zh6XdyAyIcYJXVl85eRcrqk7VpRA
 r34czplsJ1xdb+L9R/IoATRFnqskRf0HuN5eIyKcGl/h+WOrNm4+NbRNx
 P2mQf9eOcwk4WSnX5/j7aSM5rQZ8zDPXEHVR/+NIqC9MunfnfiT8hBBEv w==;
X-CSE-ConnectionGUID: kFt9Ay5+QU+zrOLoB7qTag==
X-CSE-MsgGUID: eeLWtA+aQaaXpOkVPQRy7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="112358779"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; d="scan'208";a="112358779"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 04:24:18 -0700
X-CSE-ConnectionGUID: lYOFRxI0So6s0Uym5Tq3CA==
X-CSE-MsgGUID: 8lZ+zaGMQUiYYlNBClcGyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; d="scan'208";a="301793346"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.127])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 04:24:17 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com, Suraj Kandpal
 <suraj.kandpal@intel.com>
Subject: Re: [PATCH 01/10] drm/i915/display: Add helper to compute link M/N
 ratio for reuse
In-Reply-To: <20260911041449.3699400-2-suraj.kandpal@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260911041449.3699400-1-suraj.kandpal@intel.com>
 <20260911041449.3699400-2-suraj.kandpal@intel.com>
Date: Fri, 11 Sep 2026 14:24:14 +0300
Message-ID: <123bd5fd897e0c5d7d956d2cc94eb8cec6d7f91c@intel.com>
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

On Fri, 11 Sep 2026, Suraj Kandpal <suraj.kandpal@intel.com> wrote:
> From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>
> Introduce `intel_display_get_link_m_n()` to compute the link M/N ratio

Please drop the backticks. IMO it's just ugly fluff in commit messages.

> based on pixel clock and link clock. This logic was previously embedded
> within `intel_link_compute_m_n()`.
>
> The new helper allows reuse of link M/N computation in other contexts
> without requiring the full data M/N calculation.
>
> No functional changes intended.
>
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index fc30a455bed3..b5682c196646 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -2633,13 +2633,24 @@ static void compute_m_n(u32 *ret_m, u32 *ret_n,
>  	intel_reduce_m_n_ratio(ret_m, ret_n);
>  }
>  
> +static
> +void intel_display_get_link_m_n(u32 *link_m, u32 *link_n,
> +				u32 pixel_clock,
> +				u32 link_clock)

Now we have two functions:

- intel_display_get_link_m_n()
- intel_link_compute_m_n()

in which one is a part of the other, but the names are quite different.

Why? Shouldn't the names be somewhat similar?

BR,
Jani.


> +{
> +	u32 link_symbol_clock = intel_dp_link_symbol_clock(link_clock);
> +
> +	compute_m_n(link_m, link_n,
> +		    pixel_clock, link_symbol_clock,
> +		    0x80000);
> +}
> +
>  void
>  intel_link_compute_m_n(u16 bits_per_pixel_x16, int nlanes,
>  		       int pixel_clock, int link_clock,
>  		       int bw_overhead,
>  		       struct intel_link_m_n *m_n)
>  {
> -	u32 link_symbol_clock = intel_dp_link_symbol_clock(link_clock);
>  	u32 data_m = intel_dp_effective_data_rate(pixel_clock, bits_per_pixel_x16,
>  						  bw_overhead);
>  	u32 data_n = drm_dp_max_dprx_data_rate(link_clock, nlanes);
> @@ -2656,9 +2667,8 @@ intel_link_compute_m_n(u16 bits_per_pixel_x16, int nlanes,
>  		    data_m, data_n,
>  		    0x8000000);
>  
> -	compute_m_n(&m_n->link_m, &m_n->link_n,
> -		    pixel_clock, link_symbol_clock,
> -		    0x80000);
> +	intel_display_get_link_m_n(&m_n->link_m, &m_n->link_n,
> +				   pixel_clock, link_clock);
>  }
>  
>  void intel_panel_sanitize_ssc(struct intel_display *display)

-- 
Jani Nikula, Intel
