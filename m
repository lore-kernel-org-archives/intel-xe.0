Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99E7606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 12 Nov 2026 09:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=f3o4jyg3
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26E5C10FF79;
	Thu, 12 Nov 2026 09:35:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 856A610FF79;
 Thu, 12 Nov 2026 09:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794476141; x=1826012141;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=IQ+SQl87/pownrroeWQN4ZOaCka/9k839nV5/Pgm/N8=;
 b=f3o4jyg3Q10ozaX8oSi9/1T0glFvrbLvcpw1gaytTa/h+f1dR4jDSFM8
 m8P9DPT8UYG9e9WwSwvaa/qoaGXpLpA3b+UjYowz2oNAWNUkED5Is42Mh
 +zCAAt8bmNV2e13+4BdkEgtSrwsKsYrCi8q8StfScLkq+vNVd3rL5gVAi
 3eY9MkU+bpmsrISNzRCv3+qecTF87SvljMpnVmZ+OykeJEDbMDMLP8gEW
 32xJzFqvUQ3G2DUWND/xpCMxpIK3S4pNy9HypCv6OlJBcCb7g/sgmwsDq
 3/OcciVEKXxM6BQCXHUgZKHgyM0i+a7fr5ACfMdghnOHZe8sne/RRxy2a w==;
X-CSE-ConnectionGUID: 08290PCISoS5+RLfyoRhsg==
X-CSE-MsgGUID: XlrKh5rSQJeef7EtPfPlIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3122425"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3122425"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 01:32:13 -0800
X-CSE-ConnectionGUID: GMtAKvlKSTWCSljxuohmDA==
X-CSE-MsgGUID: YDFmFtNKQhmsW8pqchtvJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="8440056"
Received: from dev-417.igk.intel.com (HELO dev-417) ([10.91.214.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 01:32:11 -0800
Date: Thu, 12 Nov 2026 10:32:04 +0100
From: =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 13/15] drm/i915/pfit: No pfit one line mode on i965+
Message-ID: <tj3l6g5qwb72suefko5a7yrftkcrklxonzb6iw4aaypfttrv6y@4bxuxxls54qg>
References: <20261019135309.23578-1-ville.syrjala@linux.intel.com>
 <20261019135309.23578-14-ville.syrjala@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261019135309.23578-14-ville.syrjala@linux.intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 19, 2026 at 04:53:07PM GMT, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> i965+ panel fitter no longer appaers to have the "one line mode"

s/appaers/appears/

Reviewed-by: Michał Grzelak <michal.grzelak@linux.intel.com>

BR,
Michał

> fallback for wide sources. Presumably the line buffers are now
> big enough that the one line mode is not needed.
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_pfit.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_pfit.c b/drivers/gpu/drm/i915/display/intel_pfit.c
> index d8daa463452e..6eb457047bf4 100644
> --- a/drivers/gpu/drm/i915/display/intel_pfit.c
> +++ b/drivers/gpu/drm/i915/display/intel_pfit.c
> @@ -963,7 +963,10 @@ void intel_pfit_get_config(struct intel_crtc_state *crtc_state)
>  
>  bool i9xx_pfit_is_one_line_mode(const struct intel_crtc_state *crtc_state)
>  {
> -	return crtc_state->gmch_pfit.control & PFIT_ENABLE &&
> +	struct intel_display *display = to_intel_display(crtc_state);
> +
> +	return DISPLAY_VER(display) < 4 &&
> +		crtc_state->gmch_pfit.control & PFIT_ENABLE &&
>  		drm_rect_width(&crtc_state->pipe_src) > 1024;
>  }
>  
> -- 
> 2.55.0
> 
> 
