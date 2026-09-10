Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09F39C79F9F
	for <intel-xe@archiver.kernel.org>; Thu, 10 Sep 2026 11:23:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2AF710E274;
	Thu, 10 Sep 2026 11:23:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="He7cVbDE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E06F10E274;
 Thu, 10 Sep 2026 11:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789039385; x=1820575385;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Z9C/2srLh2sis/MGhlglEihl0ntMVdSE592nlKcBNss=;
 b=He7cVbDEGNafPPmJzD6XGzSpIVx2i7/aPKXBjI8uczW7zMT4Fg0TUsnm
 R/2joo0epWuqrxTaAG2YchrHoj7ypUgg1zjRugrgrzwt2yAi6HtR9OdQZ
 8953Li54FddXY34FDUoTgL7q/Eygmzqy4FUHstKHqqo28bISSa2b7J4DY
 O34FJgrS/bd6FfFboy8UpbDcBklpCa51pTmlKqh7CvDw8olyBiXOFWTD6
 ionQfAEj34P7GtmgHjZMRH7jwtEHiOIBc8nkphSbjUAvy7jEMI5u5Brdr
 WBJZr40dZgItWMfeF9pJpy0ZHszcZrz2mK/Avtnau5CilBoesImdu1zB4 A==;
X-CSE-ConnectionGUID: OPAiM/jTTmyXMwe4B8e9AA==
X-CSE-MsgGUID: 7zKXkgBcR7G53v8AEH9F/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89697759"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="89697759"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 04:23:05 -0700
X-CSE-ConnectionGUID: yewCGyUhQKq8/W926Befpg==
X-CSE-MsgGUID: rKewsaTXSvm0HoJXv9MrUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; d="scan'208";a="309850667"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.238])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 04:23:03 -0700
Date: Thu, 10 Sep 2026 14:23:01 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: sashiko-reviews@lists.linux.dev
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v2 12/13] drm/i915/dsb: Add tracepoints for DSB commit
Message-ID: <aqKTFanaLavoU0DN@intel.com>
References: <20260909161730.12969-1-ville.syrjala@linux.intel.com>
 <20260909161730.12969-13-ville.syrjala@linux.intel.com>
 <20260909163450.000EE1F00898@smtp.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260909163450.000EE1F00898@smtp.kernel.org>
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

On Wed, Sep 09, 2026 at 04:34:49PM +0000, sashiko-bot@kernel.org wrote:
> > diff --git a/drivers/gpu/drm/i915/display/intel_dsb.c b/drivers/gpu/drm/i915/display/intel_dsb.c
> > index 8e01e1eed291e..299d778520a22 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dsb.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dsb.c
> [ ... ]
> > @@ -1124,6 +1127,8 @@ void intel_dsb_irq_handler(struct intel_display *display,
> >  		spin_lock(&display->drm->event_lock);
> >  
> >  		if (crtc->dsb_event) {
> > +			trace_intel_dsb_done(crtc, dsb_id);
> > +
> 
> [Severity: Medium]
> Will this lead to unbalanced commit/done trace events for background updates?
> 
> The trace_intel_dsb_done() tracepoint is conditionally called only when a
> userspace vblank event is present. If a commit completes in hardware
> without an associated vblank event, the irq handler will skip emitting the
> completion tracepoint.

There is never a commit without an associated vblank event. See
drm_atomic_helper_setup_commit().

-- 
Ville Syrjälä
Intel
