Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C74FE77187
	for <intel-xe@archiver.kernel.org>; Tue, 17 Dec 2024 10:58:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 421FB10E914;
	Tue, 17 Dec 2024 10:58:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aZz4M4e8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1236A10E913;
 Tue, 17 Dec 2024 10:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734433085; x=1765969085;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=4PkuinermVxMNjCb8vJ556Ke+IO1Ce1AfAcQuqUsjUw=;
 b=aZz4M4e8eonTziNeS0nHHUuYR00D1TqkQPJESYzGuEHWM5OXTmVMxj5J
 kqeRMtr9LJb8yz8oBRpPnSScmTT9H+OSfoDGRo8wu39i/veGYQAHtUMy3
 aZ3DpwwnPS3zE79vactPynv1bMOhaEYGQZRzhGr8bNkFoWL2BZLJC+Hnd
 /eVZkhq9/NPNdqkta8Z0lGI9ml1M8/O5LWNtDFtAYBbvNJOCY98QrW4u0
 jcN1PEmCmoF1GYlUGVw+dzSfh8FuLWc9tzHDy7d+fNFgE6Bf0uiVeNObx
 VwlGTBLWka4UYtS1HCiQK+Pzruc5OssysZ+Isw5mQUuxJb6LtRHe64gN8 g==;
X-CSE-ConnectionGUID: yjPZZQt9TGipbPVM7FbRkA==
X-CSE-MsgGUID: IfvR6RRgQYuZBfv6c6czaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="34143521"
X-IronPort-AV: E=Sophos;i="6.12,241,1728975600"; d="scan'208";a="34143521"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 02:58:04 -0800
X-CSE-ConnectionGUID: H8yfJE1bRUGUNZxToGipgA==
X-CSE-MsgGUID: ij/69UpETiikJHYT9d/JGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,241,1728975600"; d="scan'208";a="128310811"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.55])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 02:58:03 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, suraj.kandpal@intel.com,
 imre.deak@intel.com
Subject: Re: [PATCH 04/14] drm/i915/dp: Drop check for FEC in
 intel_dp_fec_compute_config
In-Reply-To: <20241217093244.3938132-5-ankit.k.nautiyal@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241217093244.3938132-1-ankit.k.nautiyal@intel.com>
 <20241217093244.3938132-5-ankit.k.nautiyal@intel.com>
Date: Tue, 17 Dec 2024 12:57:59 +0200
Message-ID: <87v7vir2yw.fsf@intel.com>
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

On Tue, 17 Dec 2024, Ankit Nautiyal <ankit.k.nautiyal@intel.com> wrote:
> Support for FEC is already checked by intel_dp_supports_dsc() in
> intel_dp_dsc_compute_config() which gets called before
> intel_dp_fec_compute_config().
>
> Therefore the check can be dropped from the helper
> intel_dp_fec_compute_config().
>
> v2: Changed commit message for clarity. (Suraj)
>
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index 674297ac6315..9a039cbdfcc9 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -2351,7 +2351,6 @@ static int intel_edp_dsc_compute_pipe_bpp(struct intel_dp *intel_dp,
>  }
>  
>  static void intel_dp_fec_compute_config(struct intel_dp *intel_dp,
> -					const struct intel_connector *connector,
>  					struct intel_crtc_state *crtc_state)
>  {
>  	if (crtc_state->fec_enable)
> @@ -2365,9 +2364,6 @@ static void intel_dp_fec_compute_config(struct intel_dp *intel_dp,
>  	if (intel_dp_is_edp(intel_dp))
>  		return;
>  
> -	if (!intel_dp_supports_fec(intel_dp, connector, crtc_state))
> -		return;
> -
>  	if (intel_dp_is_uhbr(crtc_state))
>  		return;
>  
> @@ -2389,7 +2385,7 @@ int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
>  	int num_joined_pipes = intel_crtc_num_joined_pipes(pipe_config);
>  	int ret;
>  
> -	intel_dp_fec_compute_config(intel_dp, connector, pipe_config);
> +	intel_dp_fec_compute_config(intel_dp, pipe_config);
>  
>  	if (!intel_dp_dsc_supports_format(connector, pipe_config->output_format))
>  		return -EINVAL;

-- 
Jani Nikula, Intel
