Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 644B7C55172
	for <intel-xe@archiver.kernel.org>; Tue,  4 Aug 2026 09:17:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2781110E934;
	Tue,  4 Aug 2026 09:17:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DupmHSwO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDCA310E92F;
 Tue,  4 Aug 2026 09:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785835059; x=1817371059;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=F4x+YkhuCAcgmxxm4Wp7gFMo6k6+e0OhVQf+RqWa3VY=;
 b=DupmHSwOoO4GZaI+lMa6Xq2762WqNPNP9yZKpywaGZwgnNUIEIyOYMFC
 qsElOPc9G5puMqIMOCdft59nn8Wnkk0nCWbDJd1KV4vnmENz/06BsLz3C
 J6RVNArGi9qOWnU3kaop9jLlTxS7bobhfnyVTdXJZMVuOKMAsL0OHN4+7
 uNqoSHW66VUeCSf2qpyAx6wosH+9LztwP6Ayk32Rw230PS70jmSm64ogf
 vtzHxUVD+c7X1FcC9UkoK4mEYPVs/piODvVdD9hjv3pzLlELOwPHloiv7
 3qdtF+XwNb/aFIk4w5GIfXlYJr5d9dpbp0WwJQtICYfSrbZXybwaLn91d w==;
X-CSE-ConnectionGUID: LtrhzQ59QjSZX6j5GVXR5Q==
X-CSE-MsgGUID: bSuBZzBCTf2W1DO/QANrmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="86256580"
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; d="scan'208";a="86256580"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 02:17:37 -0700
X-CSE-ConnectionGUID: nOB/ygX6SUycVYmJf6+xgA==
X-CSE-MsgGUID: mmXIaIgGQ0GsdxnEvW/d7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; d="scan'208";a="291385660"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.151])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 02:17:36 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, Suraj Kandpal <suraj.kandpal@intel.com>
Subject: Re: [PATCH] drm/i915/dp: Use array size for intersect_rates() bound
In-Reply-To: <20260804085658.1306761-1-suraj.kandpal@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260804085658.1306761-1-suraj.kandpal@intel.com>
Date: Tue, 04 Aug 2026 12:17:33 +0300
Message-ID: <fc063639e68f981c433e8610110382d742eee76f@intel.com>
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

On Tue, 04 Aug 2026, Suraj Kandpal <suraj.kandpal@intel.com> wrote:
> Take an explicit common_len parameter and pass
> ARRAY_SIZE(intel_dp->common_rates) at the call site, so the bound is
> tied to the destination array.
>
> Fixes: e6bda3e4cb43 ("drm/i915: Avoid overflowing the DP link rate arrays")
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index 7f13595f40c1..dd0fbb0ba20d 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -625,13 +625,13 @@ intel_dp_set_source_rates(struct intel_dp *intel_dp)
>  
>  static int intersect_rates(const int *source_rates, int source_len,
>  			   const int *sink_rates, int sink_len,
> -			   int *common_rates)
> +			   int *common_rates, int common_len)
>  {
>  	int i = 0, j = 0, k = 0;
>  
>  	while (i < source_len && j < sink_len) {
>  		if (source_rates[i] == sink_rates[j]) {
> -			if (WARN_ON(k >= DP_MAX_SUPPORTED_RATES))
> +			if (WARN_ON(k >= common_len))
>  				return k;
>  			common_rates[k] = source_rates[i];
>  			++k;
> @@ -671,7 +671,8 @@ static void intel_dp_get_common_rates(struct intel_dp *intel_dp,
>  					    intel_dp->num_source_rates,
>  					    intel_dp->sink_rates,
>  					    intel_dp->num_sink_rates,
> -					    common_rates);
> +					    intel_dp->common_rates,
> +					    ARRAY_SIZE(intel_dp->common_rates));

This is using some old baseline.

BR,
Jani.

>  
>  	/* Paranoia, there should always be something in common. */
>  	if (drm_WARN_ON(display->drm, *num_common_rates == 0)) {

-- 
Jani Nikula, Intel
