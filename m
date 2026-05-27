Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD5FDCD5BD5
	for <intel-xe@archiver.kernel.org>; Wed, 27 May 2026 12:43:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51CCF10E266;
	Wed, 27 May 2026 12:43:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E+AoB2Iv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7051D10E266;
 Wed, 27 May 2026 12:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779885824; x=1811421824;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=syQzwI99ojOtkRMCz+e3ggZYLNpj1OOZpaylZfyndJ8=;
 b=E+AoB2IvZTZG+MeH4PKDBqfbsQGCZVunycaryx65xLel4RDN4NK2q9ah
 KUiBxDWFHEqpJvSSsywDYXzFN3rkAO3xmqKYD2PprYFF/IqgmtDDyyrWB
 hb36ZIvz3jg86l2KX/+YjDWX7OzJWQH9efnGQxx8cXyrR+kDiL2Jxwc0/
 JusgnJU518I5Fy6bF6CyyE+PYSs840hjUPjMKONqZVI9zsW1typWlz/+A
 HeS/yauOjFdonxxkynZSBLHzLRnjBUMw1vWs98VMxerZnVzJXLSwcPn5t
 GY+H5e2VbqPJwAGhw5ofmAoHCCXrgQAreK++V5krlpJ9X8YfAc+w3XvrG Q==;
X-CSE-ConnectionGUID: 80LOgx83Tni5WufG4yvpfg==
X-CSE-MsgGUID: v9SPtTgUQf+p+DRHKib8rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="80696565"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="80696565"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 05:43:43 -0700
X-CSE-ConnectionGUID: hxBqI2KeR5OQfdCRD1f2Jw==
X-CSE-MsgGUID: uZ/5ENlsThC3wpB9r+IR+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="272566367"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.245.80])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 05:43:41 -0700
Date: Wed, 27 May 2026 15:43:37 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jouni.hogander@intel.com, animesh.manna@intel.com
Subject: Re: [PATCH 10/12] drm/i915/dp: Compute AS SDP after PSR compute config
Message-ID: <ahbm-c-GA8lAkjzr@intel.com>
References: <20260527041050.601735-1-ankit.k.nautiyal@intel.com>
 <20260527041050.601735-11-ankit.k.nautiyal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260527041050.601735-11-ankit.k.nautiyal@intel.com>
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

On Wed, May 27, 2026 at 09:40:48AM +0530, Ankit Nautiyal wrote:
> A subsequent change makes intel_dp_needs_as_sdp() depend on
> crtc_state->has_panel_replay, which is set by intel_psr_compute_config().
> 
> Move call for intel_dp_compute_as_sdp() after the
> intel_psr_compute_config().
> 
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index a3aa0dadf0e1..af52ba636f55 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -3706,8 +3706,8 @@ intel_dp_compute_config(struct intel_encoder *encoder,
>  		pipe_config->dp_m_n.data_m *= pipe_config->splitter.link_count;
>  
>  	intel_vrr_compute_config(pipe_config, conn_state);
> -	intel_dp_compute_as_sdp(intel_dp, pipe_config);
>  	intel_psr_compute_config(intel_dp, pipe_config, conn_state);
> +	intel_dp_compute_as_sdp(intel_dp, pipe_config);
>  	intel_alpm_lobf_compute_config(intel_dp, pipe_config, conn_state);
>  	intel_dp_drrs_compute_config(connector, pipe_config, link_bpp_x16);
>  	intel_dp_compute_vsc_sdp(intel_dp, pipe_config, conn_state);
> -- 
> 2.45.2

-- 
Ville Syrjälä
Intel
