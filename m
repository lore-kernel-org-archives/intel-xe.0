Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBBDDCE8D78
	for <intel-xe@archiver.kernel.org>; Thu, 19 Sep 2024 11:10:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BE3610E2A3;
	Thu, 19 Sep 2024 11:10:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kpNYbSrT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAAE210E266
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Sep 2024 11:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726744246; x=1758280246;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=S0QPQ9J35NhCplZAzLnWfunw3Ru6gsLt+twPF7aMf3U=;
 b=kpNYbSrTCJwhLKZrSNk6zv8Dk0JK1ed82jH44aY97F7R4qO4otTlM4+T
 1UgGALo7yd4h81UIvuXx22C1O5RkXWDpgp/554MFTBWxv7uNUbdLMnzYz
 ydgwifGP+nhQ0ueQmxpyHmkJwwOGU13078BwzrB+8f2LssYHIakqRDoPa
 dntUq17rLGbibEycmCNBz7fc84ykmCHXvK030Ydf8eKIQ5TKWHqA69iTw
 UmWw4GmJUNb/6MHqZD8t6rWOND5Si+W9CGcCmpuvDERswhVsbsEyVAdmN
 u/O0k91suDG5eA7vYnglzHOS1u6N4xhVo6PkWoQ7OnxpVzo4rMt6vOXpD w==;
X-CSE-ConnectionGUID: oFzdgdeWS4mrYxQn0DRV+A==
X-CSE-MsgGUID: 7nON7vlnSbiJ168mtsnIsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="29441216"
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; d="scan'208";a="29441216"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 04:10:45 -0700
X-CSE-ConnectionGUID: pK6dk0dZR7C6HvbJQtZRCw==
X-CSE-MsgGUID: UTOq9YTjSBCo1EUTuIQkZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; d="scan'208";a="70026216"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 19 Sep 2024 04:10:42 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 19 Sep 2024 14:10:41 +0300
Date: Thu, 19 Sep 2024 14:10:41 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2 1/3] drm/xe: Move display reference timestamp readout
 to display/
Message-ID: <ZuwGsRmKpY4u7b8A@intel.com>
References: <20240913162910.4145142-4-matthew.d.roper@intel.com>
 <87jzfad88n.fsf@intel.com>
 <rgsiho6xglvsrbgrc5ik3ylw3xhln7zlmfllsjhubdr2czyxk5@big4bvtcxtfg>
 <87cyl09d5p.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87cyl09d5p.fsf@intel.com>
X-Patchwork-Hint: comment
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

On Thu, Sep 19, 2024 at 01:00:02PM +0300, Jani Nikula wrote:
> On Wed, 18 Sep 2024, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> > On Tue, Sep 17, 2024 at 10:55:52AM GMT, Jani Nikula wrote:
> >>On Fri, 13 Sep 2024, Matt Roper <matthew.d.roper@intel.com> wrote:
> >>> It's quite unusual to read display registers as part of GT
> >>> initialization, but use of the display reference timestamp is one
> >>> approach to calculating the GT clock frequency on older platforms.
> >>> Rename the function that does this readout and move it to display/ to
> >>> make it more clear what's actually happening when this route is taken.
> >>> Also add an assert that we've probed display before calling this
> >>> function since we never expect this to be the route taken on platforms
> >>> that lack display.
> >>>
> >>> In the future we may want to move to an intel_display implementation
> >>> that can be shared with i915, but we'll leave that for later.
> >>>
> >>> Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
> >>> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> >>
> >>Mixed feelings about this. On the one hand moving to display seems
> >>appropriate, but adding any new stuff to xe_display.c means more stuff
> >>to clean up for later.
> >>
> >>As you know, i915 does this as well in i915 core. The next logical step
> >>is then to have this in i915/display, and share the code between i915
> >>and xe. Adding another interface for i915/display.
> >
> > humn... but what would be the alternative? Move the i915 one to
> > i915/display and then make both xe-core and i915-core use that?
> > If we move it to display/ here then we can land this and finish the
> > cleanup later.
> 
> The alternative would be to keep it outside of display/ in both drivers,
> because display doesn't appear to need it. The annoying part in that is,
> obviously, that display should take care of display stuff.

This whole code seems rather dodgy. I see Windows has similar code
so I presume that's where it came from. But does anyone know what
this "Broadwell divider mode" actually does?

If we assume that it means the display refclk is also used to
generate the CS timestamps (I'm really suprised to learn that
maybe there are systems with different refclks for display vs.
GT) and that TIMESTAMP_CTR is always generated from the display
refclk then display already reads that out from 
DSSM, no need to read out the TIMESTAMP_OVERRIDE.

Also the current code that reads TIMESTAMP_OVERRIDE doesn't
even seem to check whether the override is actually enabled.
IIRC I saw bit 30==enable at least on some platforms...

-- 
Ville Syrjälä
Intel
