Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57FE8606A326
	for <intel-xe@archiver.kernel.org>; Fri,  6 Nov 2026 16:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Cqyyhike
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C436112EE4;
	Fri,  6 Nov 2026 16:03:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF84A112EA1;
 Fri,  6 Nov 2026 16:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793981029; x=1825517029;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=3e5zDchh9lbINzlMeKR/rKzqc1Y6C20PCpox8LpLzkA=;
 b=CqyyhikeYFnv5UtChlGn11mJPCyf9jL6ifQ2ExmKbVkAzcb2acjXYM2H
 1N+oklkp/gPwVVxyWUDAInsElNHgoeTDOMUPmd04uGbuwKoWjimXK5KTe
 Ndv2Rsw2Igx6GsYcMcLAuabIPoIiw0bP3/E3im/gf6/oAJKfqHWowJQSZ
 Kx51tlfjtVtTeDKV1EodPlzA8pvfyRqo18pJcgR094U15iJ9dTWOsfdvk
 Q0TnZxj/I/QjnEOPj0vUadAt5ChJAKo2MdymMJM2CFAXMMBPJzJuQehiL
 ueCsLHvMYRVhmvW1BlxDXbaVJJNJQ7JQ/2FUFPQLHWFL+IjGS5oFWAe3W Q==;
X-CSE-ConnectionGUID: SIYvZ/eJTlKSBqZzjgllPg==
X-CSE-MsgGUID: 2V89lq/hTbWy8B/9sylQxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2835597"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2835597"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 08:03:48 -0800
X-CSE-ConnectionGUID: T0y3ACk2RbKPPnM/AtDV9w==
X-CSE-MsgGUID: fdhGLyo4Rh6er3c+ISDk6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="9074366"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 08:03:47 -0800
Date: Fri, 6 Nov 2026 18:03:43 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 3/9] drm/i915/de: Introduce mmio read/write templates
Message-ID: <au35-6h_qwLrZH0f@intel.com>
References: <20261104221842.18799-1-ville.syrjala@linux.intel.com>
 <20261104221842.18799-4-ville.syrjala@linux.intel.com>
 <283ba9737e27cff4d70b7ee2ab3b0ec287d573de@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <283ba9737e27cff4d70b7ee2ab3b0ec287d573de@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

On Fri, Nov 06, 2026 at 04:52:22PM +0200, Jani Nikula wrote:
> On Thu, 05 Nov 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >
> > In order to eliminate runtime platform check overhead from
> > the mmio read/write functions, we'll need a good way to construct
> > optimal variants for each platform. Do that in the form of
> > __intel_de_{read,write}() that can be customized via (compile time
> > constnt) mmio_flags. The compiler will eliminate all the stuff
> > we don't want.
> 
> Are the __always_inline required?

Perhaps not in practice, don't think I actually checked the
generated code without them. I put them there because I really
want to force the compiler to notice that mmio_flags is a
compile time constant and thus there is dead code to eliminate. 
Dunno if I want to rely on compiler inlining heuristics for that.

> 
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
> 
> >
> > For now there is nothing to eliminate but next we'll start
> > moving more stuff in to make that possible.
> >
> > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_de.c | 26 +++++++++++++++++++++++--
> >  1 file changed, 24 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_de.c b/drivers/gpu/drm/i915/display/intel_de.c
> > index 4f423a684ec2..cde2886fe2ca 100644
> > --- a/drivers/gpu/drm/i915/display/intel_de.c
> > +++ b/drivers/gpu/drm/i915/display/intel_de.c
> > @@ -163,16 +163,38 @@ u16 intel_de_read16(struct intel_display *display, intel_reg_t reg)
> >  	return intel_uncore_read16(__to_uncore(display), reg);
> >  }
> >  
> > +static __always_inline u32
> > +__intel_de_read(struct intel_display *display, intel_reg_t reg,
> > +		const unsigned int mmio_flags)
> > +{
> > +	u32 val;
> > +
> > +	val = intel_uncore_read(__to_uncore(display), reg);
> > +
> > +	return val;
> > +}
> > +
> > +static __always_inline void
> > +__intel_de_write(struct intel_display *display, intel_reg_t reg, u32 val,
> > +		 const unsigned int mmio_flags)
> > +{
> > +	intel_uncore_write(__to_uncore(display), reg, val);
> > +}
> > +
> > +#define I9XX_MMIO_FLAGS 0
> > +
> >  static u32 i9xx_mmio_read(struct intel_display *display, intel_reg_t reg)
> >  {
> > -	return intel_uncore_read(__to_uncore(display), reg);
> > +	return __intel_de_read(display, reg, I9XX_MMIO_FLAGS);
> >  }
> >  
> >  static void i9xx_mmio_write(struct intel_display *display, intel_reg_t reg, u32 val)
> >  {
> > -	intel_uncore_write(__to_uncore(display), reg, val);
> > +	__intel_de_write(display, reg, val, I9XX_MMIO_FLAGS);
> >  }
> >  
> > +#undef I9XX_MMIO_FLAGS
> > +
> >  static const struct intel_mmio_funcs i9xx_mmio_funcs = {
> >  	.read = i9xx_mmio_read,
> >  	.write = i9xx_mmio_write,
> 
> -- 
> Jani Nikula, Intel

-- 
Ville Syrjälä
Intel
