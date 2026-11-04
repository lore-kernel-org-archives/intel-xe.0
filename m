Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D482E606A326
	for <intel-xe@archiver.kernel.org>; Wed,  4 Nov 2026 23:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QCuQh3wm
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C1EE10E1E2;
	Wed,  4 Nov 2026 23:32:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EBDC10E1E2;
 Wed,  4 Nov 2026 23:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793835133; x=1825371133;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=8VJpIivpzPQol6RP04qs+WvcojEvG0FTlDEMk1jqh6A=;
 b=QCuQh3wmpUWuKtDSie6DWXeNyLNJfe1/DFMaVPmV6gBFouSXQ9ZFpl9c
 t3nr+glX+r0VbI8MOgtfNXTDj9z8aHsEiFntiyEhwv2XvAi3Nw7fjx91/
 0GEMw+OWV2qnmN1z+DlIEhzuMadbaQ/j4/GbC4OIzTCaawf3K+kQpUE0S
 gxlVv6gchKusjM/3N4dBPbSW2t0ZwpAZXCI+6n85tUSC2nqfv8G5tnktB
 t4JqXy8TFpiylojr99DLASTI54QqosMN0ETbeo7n3U+mQyT6E8eOm6Xbx
 Lks3hZEWbfSRH4MIskthDOMvm0EZDlgH7KtfJOeczH4RK4xWflMPYsasI g==;
X-CSE-ConnectionGUID: eDWaQFXoTKCRJDGH/3WPRQ==
X-CSE-MsgGUID: jE7hz+9ETbK1Ko0nr3qX4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2645173"
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="2645173"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 15:32:13 -0800
X-CSE-ConnectionGUID: SeByX+ylRw2IssihAWNZcA==
X-CSE-MsgGUID: 50hvH4VgSm+EsHlc4wVHpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="6971878"
Received: from dev-417.igk.intel.com (HELO dev-417) ([10.91.214.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 15:32:12 -0800
Date: Thu, 5 Nov 2026 00:32:06 +0100
From: =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 3/9] drm/i915/de: Introduce mmio read/write templates
Message-ID: <epnonmddl4eu7f5zxbkqbptllfaojbdydqrqg35bw6orss4vwv@heje5gblaljb>
References: <20261104221842.18799-1-ville.syrjala@linux.intel.com>
 <20261104221842.18799-4-ville.syrjala@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261104221842.18799-4-ville.syrjala@linux.intel.com>
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

On Thu, Nov 05, 2026 at 12:18:36AM GMT, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> In order to eliminate runtime platform check overhead from
> the mmio read/write functions, we'll need a good way to construct
> optimal variants for each platform. Do that in the form of
> __intel_de_{read,write}() that can be customized via (compile time
> constnt) mmio_flags. The compiler will eliminate all the stuff

s/constnt/constant/

> we don't want.
> 
> For now there is nothing to eliminate but next we'll start
> moving more stuff in to make that possible.
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Reviewed-by: Michał Grzelak <michal.grzelak@linux.intel.com>

BR,
Michał

> ---
>  drivers/gpu/drm/i915/display/intel_de.c | 26 +++++++++++++++++++++++--
>  1 file changed, 24 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_de.c b/drivers/gpu/drm/i915/display/intel_de.c
> index 4f423a684ec2..cde2886fe2ca 100644
> --- a/drivers/gpu/drm/i915/display/intel_de.c
> +++ b/drivers/gpu/drm/i915/display/intel_de.c
> @@ -163,16 +163,38 @@ u16 intel_de_read16(struct intel_display *display, intel_reg_t reg)
>  	return intel_uncore_read16(__to_uncore(display), reg);
>  }
>  
> +static __always_inline u32
> +__intel_de_read(struct intel_display *display, intel_reg_t reg,
> +		const unsigned int mmio_flags)
> +{
> +	u32 val;
> +
> +	val = intel_uncore_read(__to_uncore(display), reg);
> +
> +	return val;
> +}
> +
> +static __always_inline void
> +__intel_de_write(struct intel_display *display, intel_reg_t reg, u32 val,
> +		 const unsigned int mmio_flags)
> +{
> +	intel_uncore_write(__to_uncore(display), reg, val);
> +}
> +
> +#define I9XX_MMIO_FLAGS 0
> +
>  static u32 i9xx_mmio_read(struct intel_display *display, intel_reg_t reg)
>  {
> -	return intel_uncore_read(__to_uncore(display), reg);
> +	return __intel_de_read(display, reg, I9XX_MMIO_FLAGS);
>  }
>  
>  static void i9xx_mmio_write(struct intel_display *display, intel_reg_t reg, u32 val)
>  {
> -	intel_uncore_write(__to_uncore(display), reg, val);
> +	__intel_de_write(display, reg, val, I9XX_MMIO_FLAGS);
>  }
>  
> +#undef I9XX_MMIO_FLAGS
> +
>  static const struct intel_mmio_funcs i9xx_mmio_funcs = {
>  	.read = i9xx_mmio_read,
>  	.write = i9xx_mmio_write,
> -- 
> 2.56.0
> 
