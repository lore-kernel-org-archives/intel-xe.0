Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C2A6082BDB
	for <intel-xe@archiver.kernel.org>; Mon,  9 Nov 2026 12:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Pip9COj3
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B8A610F249;
	Mon,  9 Nov 2026 12:34:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17DA610F251
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Nov 2026 12:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794227655; x=1825763655;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=bC+mB9LGv84DaQnLc5kGa5Fv2zlcqV9I9Hfd0M9jmVQ=;
 b=Pip9COj3O9VAs0bLlNsrXguU9Z5CfPwt9Oe2U3wkPxDuUb31qUNg/qFM
 Svfb+38x4DnKwRCOxwWU8dQCsiAH0CVBCf8A6hVG91IzAVKtqfgrqaGCV
 cHx8H8zOB5oHv+CeXK3ZZa4F+niTU/Ao2ygMR2rATrn2tLJA2nKvSINYs
 iuwVPtnJu7Sw7kIQD6vrzTGo2dXczsin7s5mQsPxtMZzNwGJBB1djtXoT
 v+drtoOHQj2ghHpHCHgBeoPbezhXFrhqokCIzms4lZwZLkRnVcBY8sp3v
 ksRWn290GEDZYMvl9HsZP99JoIAU5Z1r/9aA+Kx+qV6Wz+H1PZ8iIKVTy g==;
X-CSE-ConnectionGUID: tQLinpWsRiW8Xc3PEbGqAw==
X-CSE-MsgGUID: EbTlmx5iQEaZgB0x4JMzKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2835090"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="2835090"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 04:34:14 -0800
X-CSE-ConnectionGUID: Ea/BnHQMSiCoRvDlBku8Pw==
X-CSE-MsgGUID: Rd+LO+SFSCCjpBA6TrBCyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="7979985"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.135])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 04:34:14 -0800
Date: Mon, 9 Nov 2026 14:34:10 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 4/4] drm/xe: Use intel_display_gse_irq_handler()
Message-ID: <avG9wtEtkxdYfdDf@intel.com>
References: <20261109114554.19597-1-ville.syrjala@linux.intel.com>
 <20261109114554.19597-5-ville.syrjala@linux.intel.com>
 <07539696cef399115faedc5d3f84439e7d22207a@intel.com>
 <avG5Zm_5f_q8Kdgk@intel.com>
 <1c47a450915aef0eefdedf56656fd77359c7f76c@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1c47a450915aef0eefdedf56656fd77359c7f76c@intel.com>
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

On Mon, Nov 09, 2026 at 02:22:58PM +0200, Jani Nikula wrote:
> On Mon, 09 Nov 2026, Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
> > On Mon, Nov 09, 2026 at 02:05:08PM +0200, Jani Nikula wrote:
> >> On Mon, 09 Nov 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> >> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >> >
> >> > Replace the direct intel_opregion_asle_intr() call with the
> >> > new intel_display_gse_irq_handler() abstraction. We don't
> >> > want to leak random opregion symbols out from the display
> >> > code.
> >> 
> >> This depends on [1] which I don't think is merged yet?
> >
> > It's in drm-intel-next. Need to remember to postpone this
> > one when pushing the rest to drm-xe-next.
> 
> So it is, my bad.
> 
> I think patch 4 is independent of 1-3, and could be merged right away
> via drm-intel-next, as is usual for display patches. Right?

Hmm. I figured it would create a conflict, but looks like this
line didn't end up in the context of the other patches. So yeah,
should be fine to push this into drm-intel-next.

> 
> BR,
> Jani.
> 
> >
> >> 
> >> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
> >> 
> >> 
> >> [1] https://lore.kernel.org/r/20261105203427.8696-3-ville.syrjala@linux.intel.com
> >> 
> >> >
> >> > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >> > ---
> >> >  drivers/gpu/drm/xe/display/xe_display.c | 2 +-
> >> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >> >
> >> > diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
> >> > index 21692408f9be..0236f69a0f88 100644
> >> > --- a/drivers/gpu/drm/xe/display/xe_display.c
> >> > +++ b/drivers/gpu/drm/xe/display/xe_display.c
> >> > @@ -220,7 +220,7 @@ void xe_display_gse_irq_handler(struct xe_device *xe, u32 gu_misc_iir)
> >> >  		return;
> >> >  
> >> >  	if (gu_misc_iir & GU_MISC_GSE)
> >> > -		intel_opregion_asle_intr(display);
> >> > +		intel_display_gse_irq_handler(display);
> >> >  }
> >> >  
> >> >  void xe_display_irq_reset(struct xe_device *xe)
> >> 
> >> -- 
> >> Jani Nikula, Intel
> 
> -- 
> Jani Nikula, Intel

-- 
Ville Syrjälä
Intel
