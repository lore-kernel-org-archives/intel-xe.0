Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49960606A328
	for <intel-xe@archiver.kernel.org>; Wed,  4 Nov 2026 23:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dCsYT0aB
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 115EF10FFCB;
	Wed,  4 Nov 2026 23:30:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BC8A10E42F;
 Wed,  4 Nov 2026 23:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793834994; x=1825370994;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=xUJbHCwpubnCqZdBj9nJjoATd3V3koD/GYCMbEAmFZk=;
 b=dCsYT0aBWkDTfjY4EhcXjOpdFKR4YykoHewqc8Oi4LvGl1G+B9Q5U010
 hYjskWyJBo4zS7Dx4o5G3ehPGQKG7vj9ew2FksI1sEc0aVXpbY5Fbw8uX
 O64jkSBqfy1kSwmzp+mhWlKltKlG8K1Apx6S8OZf6exZVLjUl7fZB41Uz
 vPd2HC9aUGERBeVjJ/jWrAy0lbbtAm5kI0JZ1MfplMIm9tMobuVNGxoNW
 g6+q+NEoKc6PYGPLMkoife+V1dTRbaGmydg8vlJiwe7QbXz+BmODZcvzc
 BnlBxyiVjTf/+RJDmt8NBPMCKqNgqUtIMLD1TTVyyUhflRGSCgWZoj6CO A==;
X-CSE-ConnectionGUID: T4+OxBeQR2yYRRtUlaES3A==
X-CSE-MsgGUID: 0Us6e9AxTDeWrAhqJlRw2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2644936"
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="2644936"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 15:29:54 -0800
X-CSE-ConnectionGUID: Xi5PuxfLTOG+DjQQc5f+UQ==
X-CSE-MsgGUID: vy5IRSgvQz6lg8Jmjqtj4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="6971431"
Received: from dev-417.igk.intel.com (HELO dev-417) ([10.91.214.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 15:29:52 -0800
Date: Thu, 5 Nov 2026 00:29:44 +0100
From: =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 1/9] drm/i915/de: Introduce dislay->mmio and
 intel_de_init()
Message-ID: <3d3j7jmjm4wyuiwoc2ut3j24wjrslzrqirafcsk7jur5uztl63@pawlk37kuals>
References: <20261104221842.18799-1-ville.syrjala@linux.intel.com>
 <20261104221842.18799-2-ville.syrjala@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261104221842.18799-2-ville.syrjala@linux.intel.com>
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
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

title: s/dislay/display/

On Thu, Nov 05, 2026 at 12:18:34AM GMT, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Add a place for upcoming mmio stuff in the form of
> a display->mmio struct and intel_de_init() to fill it up.
> For now we'll just stick the uncore pointer there, but
> it'll get replaced by something else eventually.
> 
> I originally wanted to call intel_de_init() just after
> intel_display_device_probe(), but i915 calls that before
> the uncore/mmio setup has been done. Right now that wouldn't
> matter since the &i915->uncore is valid nonetheless. But
> eventually I think we'll just want to get the 'void __iomem *'
> from the core driver and that of course need to be mapped
> before intel_de_init() is called. So put the init call into
> __intel_display_device_info_runtime_init() which should be the
> first place where we call any intel_de_*() stuff
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Reviewed-by: Michał Grzelak <michal.grzelak@linux.intel.com>

BR,
Michał

> ---
>  drivers/gpu/drm/i915/display/intel_de.c             | 5 +++++
>  drivers/gpu/drm/i915/display/intel_de.h             | 4 +++-
>  drivers/gpu/drm/i915/display/intel_display_core.h   | 5 +++++
>  drivers/gpu/drm/i915/display/intel_display_device.c | 7 +++++++
>  4 files changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_de.c b/drivers/gpu/drm/i915/display/intel_de.c
> index a7417905192d..6b3d06147e58 100644
> --- a/drivers/gpu/drm/i915/display/intel_de.c
> +++ b/drivers/gpu/drm/i915/display/intel_de.c
> @@ -162,3 +162,8 @@ u16 intel_de_read16(struct intel_display *display, intel_reg_t reg)
>  
>  	return intel_uncore_read16(__to_uncore(display), reg);
>  }
> +
> +void intel_de_init(struct intel_display *display)
> +{
> +	display->mmio.uncore = to_intel_uncore(display->drm);
> +}
> diff --git a/drivers/gpu/drm/i915/display/intel_de.h b/drivers/gpu/drm/i915/display/intel_de.h
> index d0a239a36980..f1135ee5071b 100644
> --- a/drivers/gpu/drm/i915/display/intel_de.h
> +++ b/drivers/gpu/drm/i915/display/intel_de.h
> @@ -14,9 +14,11 @@
>  
>  static inline struct intel_uncore *__to_uncore(struct intel_display *display)
>  {
> -	return to_intel_uncore(display->drm);
> +	return display->mmio.uncore;
>  }
>  
> +void intel_de_init(struct intel_display *display);
> +
>  u8 intel_de_read8(struct intel_display *display, intel_reg_t reg);
>  void intel_de_write8(struct intel_display *display, intel_reg_t reg, u8 val);
>  u16 intel_de_read16(struct intel_display *display, intel_reg_t reg);
> diff --git a/drivers/gpu/drm/i915/display/intel_display_core.h b/drivers/gpu/drm/i915/display/intel_display_core.h
> index c80b4a2f74f9..35409f9abb2f 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_core.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_core.h
> @@ -51,6 +51,7 @@ struct intel_hotplug_irq_funcs;
>  struct intel_initial_plane_config;
>  struct intel_opregion;
>  struct intel_overlay;
> +struct intel_uncore;
>  struct task_struct;
>  
>  /* Amount of SAGV/QGV points, BSpec precisely defines this */
> @@ -530,6 +531,10 @@ struct intel_display {
>  		const struct intel_modeset_funcs *funcs;
>  	} modeset;
>  
> +	struct {
> +		struct intel_uncore *uncore;
> +	} mmio;
> +
>  	struct {
>  		/* protected by wm.wm_mutex */
>  		u16 linetime[I915_MAX_PIPES];
> diff --git a/drivers/gpu/drm/i915/display/intel_display_device.c b/drivers/gpu/drm/i915/display/intel_display_device.c
> index c74256359c25..f1bd1252a960 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_device.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_device.c
> @@ -1798,6 +1798,13 @@ static void __intel_display_device_info_runtime_init(struct intel_display *displ
>  	struct intel_display_runtime_info *display_runtime = DISPLAY_RUNTIME_INFO(display);
>  	enum pipe pipe;
>  
> +	/*
> +	 * TODO end of intel_display_device_probe() would be a more
> +	 * logical place, but at the moment i915 calls that super
> +	 * early when things aren't fully set up yet.
> +	 */
> +	intel_de_init(display);
> +
>  	BUILD_BUG_ON(BITS_PER_TYPE(display_runtime->pipe_mask) < I915_MAX_PIPES);
>  	BUILD_BUG_ON(BITS_PER_TYPE(display_runtime->cpu_transcoder_mask) < I915_MAX_TRANSCODERS);
>  	BUILD_BUG_ON(BITS_PER_TYPE(display_runtime->port_mask) < I915_MAX_PORTS);
> -- 
> 2.56.0
> 
