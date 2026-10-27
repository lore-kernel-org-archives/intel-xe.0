Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6673606A31A
	for <intel-xe@archiver.kernel.org>; Tue, 27 Oct 2026 16:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IKpqstOi
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6476210E43D;
	Tue, 27 Oct 2026 16:37:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5153D10E44F;
 Tue, 27 Oct 2026 16:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793119034; x=1824655034;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=No0XLV7PN7qhEDdTIx6Ho3n0N4IGXgtNQOWSA2gZFrY=;
 b=IKpqstOiFIDNRT/oaoWSz9tvlfnCsBfd6ZKMRpYR0vep/5NeEKx5pQzN
 7AyZrXAZv0xDQ0PzGURo+SUNRxtdo95S0BF6GD82BkUoigJlHtq3Fw741
 xCpnNqj60krDADmhdtLynx2A3QmTfEbTzUTsI1qXeR4Rz1zaZh1rwtsUx
 3CPY8aNcy0dz/gnElfy+fqLnC5irpCGn86JDy16W6+/yYP/ifYE6j1tNJ
 DcoW2NnsCqxVf6ibenIYbQCBL85rAgy3+/8SvQYfRf7aYq6nuXucADnHY
 RREjGZsT+ERRy0cFuuChqXc1xWiPcUTRUqenKX7VtueCAnEwpPMzbpVNO w==;
X-CSE-ConnectionGUID: SUHAtEuCQcmDLpSfTGoB0A==
X-CSE-MsgGUID: BGxr6FnxS6qIb4YCdgmMLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1837390"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1837390"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 09:37:14 -0700
X-CSE-ConnectionGUID: xiPl4+S+QrqG0tUbk72toQ==
X-CSE-MsgGUID: 353MZofkRcO5ZNwBkVcG7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="4488939"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.33])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 09:37:13 -0700
Date: Tue, 27 Oct 2026 18:37:09 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 01/13] drm/i915/vrr: Fix intel_vrr_dcb_vmin_vblank_start()
Message-ID: <auDTNSrRc78Wj8wx@intel.com>
References: <20261023165803.31016-1-ville.syrjala@linux.intel.com>
 <20261023165803.31016-2-ville.syrjala@linux.intel.com>
 <956f60a3c6194f7ab12f8cb44d413c0bb58ec541@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <956f60a3c6194f7ab12f8cb44d413c0bb58ec541@intel.com>
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
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 27, 2026 at 06:04:39PM +0200, Jani Nikula wrote:
> On Fri, 23 Oct 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >
> > intel_vrr_dcb_vmin_vblank_start() may evaluate
> > intel_vrr_dcb_vmin_vblank_start_next() twice, and given that
> > this is doing hardware access under the hood isn't really
> > desired.
> 
> Feels like there's a word missing there. This? It?

One of those, yes.

> 
> > Even worse, the double evaluation might even cause
> > intel_vrr_dcb_vmin_vblank_start() itself to finally
> > return -EINVAL (if we race against the DMC hard enough),
> > which we definitely never want to do.
> >
> > Eliminate the double evaluation, guaranteeing a sane
> > final return value at the same time.
> 
> I think a Fixes: would be in order.

Fixes: c4aba65c26fd ("drm/i915/display: Wait for VRR PUSH status
update")

although the whole DC balance stuff is currently disabled 
due to other issues.

> 
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
> 
> >
> > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_vrr.c | 10 +++++++---
> >  1 file changed, 7 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
> > index b14750692ae0..e59345bd1d33 100644
> > --- a/drivers/gpu/drm/i915/display/intel_vrr.c
> > +++ b/drivers/gpu/drm/i915/display/intel_vrr.c
> > @@ -1202,9 +1202,13 @@ int intel_vrr_safe_window_start(const struct intel_crtc_state *crtc_state)
> >  static int
> >  intel_vrr_dcb_vmin_vblank_start(const struct intel_crtc_state *crtc_state)
> >  {
> > -	return (intel_vrr_dcb_vmin_vblank_start_next(crtc_state) < 0) ?
> > -		intel_vrr_dcb_vmin_vblank_start_final(crtc_state) :
> > -		intel_vrr_dcb_vmin_vblank_start_next(crtc_state);
> > +	int vblank_start;
> > +
> > +	vblank_start = intel_vrr_dcb_vmin_vblank_start_next(crtc_state);
> > +	if (vblank_start < 0)
> > +		vblank_start = intel_vrr_dcb_vmin_vblank_start_final(crtc_state);
> > +
> > +	return vblank_start;
> >  }
> >  
> >  int intel_vrr_vmin_safe_window_end(const struct intel_crtc_state *crtc_state)
> 
> -- 
> Jani Nikula, Intel

-- 
Ville Syrjälä
Intel
