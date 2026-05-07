Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1CFECD3445
	for <intel-xe@archiver.kernel.org>; Thu,  7 May 2026 08:14:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A61C810F072;
	Thu,  7 May 2026 08:14:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AaoJIool";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D469D10F06B;
 Thu,  7 May 2026 08:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778141655; x=1809677655;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=18Z93yTZERyU+jDlICnJG04o+YTpNZx85czGC3CZbgA=;
 b=AaoJIoolS3/hMQI665GR3sf0jZZ0xvF1pFsOfbaQm0JBLpx4Rvd5uD/7
 QNnwGpGfmbLtsKC2H0ieOntGMc+mEFoA3eOirh26dlYbXmge951h7M/uK
 2O4Kcyj1FmL2rAsMRIHqZFth2bGxzJmteDT2FcJ5XpANnHBV12uErwBGi
 Ef8M3u9yNfjJQ9zKSjMgyUvpWICZY0FCcV394nlG8uc4C4myeaJS77H26
 +H61SAaJVAwVzbwMrWrh4BHUOpcrfJzO/NKfmr0CDb7Jvp9pquAZ6DLuP
 C27qRv4MlRLMv1ezCGUu3lbwHB7PaL5wFvXAtqsBDHMMjrI48stv6SJWh g==;
X-CSE-ConnectionGUID: 6KuUXNFcRQ+2bQFY1YUvjA==
X-CSE-MsgGUID: 8hNmL/9jR6K4thKLdCecMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="82709166"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="82709166"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 01:14:14 -0700
X-CSE-ConnectionGUID: J8vc0bRUTFSDIDqhN5l3Gg==
X-CSE-MsgGUID: X4O36w+wSkaJhoVIwBBBfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="240725722"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.117])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 01:14:13 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Imre Deak <imre.deak@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 041/108] drm/i915/dp_link_caps: Add helper to get all
 supported link rates
In-Reply-To: <20260428125233.1664668-42-imre.deak@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260428125233.1664668-1-imre.deak@intel.com>
 <20260428125233.1664668-42-imre.deak@intel.com>
Date: Thu, 07 May 2026 11:14:10 +0300
Message-ID: <6c083574233e33bbc9b1e052da4c00ab74eac702@intel.com>
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

On Tue, 28 Apr 2026, Imre Deak <imre.deak@intel.com> wrote:
> Add intel_dp_link_caps_all_common_rates() to return all supported link
> rates tracked by the link_caps module. This prepares for tracking
> these capabilities internally within the link caps module.

There's no other use for this than printing. Maybe don't have a way to
get common rates, but have a way to print common rates.

BR,
Jani.

>
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c       |  6 ++++-
>  .../gpu/drm/i915/display/intel_dp_link_caps.c | 23 +++++++++++++++++++
>  .../gpu/drm/i915/display/intel_dp_link_caps.h |  2 ++
>  3 files changed, 30 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index febcf413bb63b..d92160c522f93 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -1531,6 +1531,8 @@ static void intel_dp_print_rates(struct intel_dp *intel_dp)
>  {
>  	struct intel_display *display = to_intel_display(intel_dp);
>  	DECLARE_SEQ_BUF(s, 128); /* FIXME: too big for stack? */
> +	const int *common_rates;
> +	int num_common_rates;
>  
>  	if (!drm_debug_enabled(DRM_UT_KMS))
>  		return;
> @@ -1543,7 +1545,9 @@ static void intel_dp_print_rates(struct intel_dp *intel_dp)
>  	drm_dbg_kms(display->drm, "sink rates: %s\n", seq_buf_str(&s));
>  
>  	seq_buf_clear(&s);
> -	seq_buf_print_array(&s, intel_dp->common_rates, intel_dp->num_common_rates);
> +	intel_dp_link_caps_all_common_rates(intel_dp->link.caps,
> +					    &common_rates, &num_common_rates);
> +	seq_buf_print_array(&s, common_rates, num_common_rates);
>  	drm_dbg_kms(display->drm, "common rates: %s\n", seq_buf_str(&s));
>  }
>  
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_caps.c b/drivers/gpu/drm/i915/display/intel_dp_link_caps.c
> index 9f8b7da98305f..94a643b6e68b6 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_link_caps.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_link_caps.c
> @@ -66,6 +66,29 @@ int intel_dp_max_common_rate(struct intel_dp *intel_dp)
>  	return intel_dp_common_rate(intel_dp, intel_dp->num_common_rates - 1);
>  }
>  
> +/**
> + * intel_dp_link_caps_all_common_rates - get all common link rates
> + * @link_caps: link capabilities state
> + * @rates: returned pointer to the common rate array
> + * @num_rates: returned number of entries in @rates
> + *
> + * Return all link rates through @rates and @num_rates that are currently
> + * supported by @link_caps, common to both the source and the sink. The
> + * returned array is owned by @link_caps.
> + *
> + * Besides the usual locking requirement for API access, the caller must
> + * also serialize any dereference of the returned array against concurrent
> + * updates to @link_caps.
> + */
> +void intel_dp_link_caps_all_common_rates(struct intel_dp_link_caps *link_caps,
> +					 const int **rates, int *num_rates)
> +{
> +	struct intel_dp *intel_dp = link_caps->dp;
> +
> +	*rates = intel_dp->common_rates;
> +	*num_rates = intel_dp->num_common_rates;
> +}
> +
>  static int forced_lane_count(struct intel_dp *intel_dp)
>  {
>  	struct intel_dp_link_caps *link_caps = intel_dp->link.caps;
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_caps.h b/drivers/gpu/drm/i915/display/intel_dp_link_caps.h
> index 09e580bc5c9b3..636a1d16dbb47 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_link_caps.h
> +++ b/drivers/gpu/drm/i915/display/intel_dp_link_caps.h
> @@ -15,6 +15,8 @@ int intel_dp_common_len_rate_limit(const struct intel_dp *intel_dp,
>  				   int max_rate);
>  int intel_dp_common_rate(struct intel_dp *intel_dp, int index);
>  int intel_dp_max_common_rate(struct intel_dp *intel_dp);
> +void intel_dp_link_caps_all_common_rates(struct intel_dp_link_caps *link_caps,
> +					 const int **rates, int *num_rates);
>  
>  void intel_dp_link_caps_get_forced_params(struct intel_dp_link_caps *link_caps,
>  					  struct intel_dp_link_config *forced_params);

-- 
Jani Nikula, Intel
