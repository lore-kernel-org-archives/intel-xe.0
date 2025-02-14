Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C44D8C02198
	for <intel-xe@archiver.kernel.org>; Fri, 14 Feb 2025 18:57:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 894D910ED3F;
	Fri, 14 Feb 2025 18:57:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TG8LJnrF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0869510ED38
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Feb 2025 18:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739559469; x=1771095469;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=biQC+jGoBfEA/Koy2U81hIW+jom2/JXh0AxL9J5DkuA=;
 b=TG8LJnrFv0p/LZsMz4P8miff4YyVx/49vOE5uw+s1plD5HkkUKVC6Akw
 sxjnlnR28db0Kh7X0DafHivx6xn2YxLd1hTxoutrJMSb7lIzM9VEKCYNJ
 1rr9gAWzDH+ICcfAtBTDEReF84u0Sto4Crvcbh3CzlZb/TsZLncYzRe+7
 m5hPdbwxXqsosRQaF1USmrVaMYZAZu6kHlOsYXcxN5ETygdjkdNFx86kA
 Kfm79g3W7a3qur3RaMC8FlrfFukMsaUCa8cIkR5WyHTbCzF5Dq7DWZ9Yz
 /dCH0syDiGURRSEevqGV7aswo6jGd9ex8F9LSh9Yd0w7HEkAtKzOxo5Gb A==;
X-CSE-ConnectionGUID: /B4OwMw2SoSzQaHgpWPkFA==
X-CSE-MsgGUID: PIX6GlbnTuWpUvrwMu4rDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="51722229"
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; d="scan'208";a="51722229"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 10:57:47 -0800
X-CSE-ConnectionGUID: vXSc0cZpR4KAB1ra3o8DqQ==
X-CSE-MsgGUID: bAOnCY7FR8SInoN44io+rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="136762051"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 10:57:44 -0800
Date: Fri, 14 Feb 2025 20:58:41 +0200
From: Imre Deak <imre.deak@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/display: Remove hpd cancel work sync from runtime
 pm path
Message-ID: <Z6-SYUaiQIXmsATl@ideak-desk.fi.intel.com>
References: <20250212192447.402715-1-rodrigo.vivi@intel.com>
 <SJ1PR11MB620460FFCB4F6B7B9786392881FF2@SJ1PR11MB6204.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SJ1PR11MB620460FFCB4F6B7B9786392881FF2@SJ1PR11MB6204.namprd11.prod.outlook.com>
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
Reply-To: imre.deak@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Feb 13, 2025 at 03:04:44PM +0200, Upadhyay, Tejas wrote:
> 
> 
> > -----Original Message-----
> > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Rodrigo
> > Vivi
> > Sent: Thursday, February 13, 2025 12:55 AM
> > To: intel-xe@lists.freedesktop.org
> > Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>; Deak, Imre <imre.deak@intel.com>
> > Subject: [PATCH] drm/xe/display: Remove hpd cancel work sync from runtime
> > pm path
> >
> > This function will synchronously cancel and wait for many display work queue
> > items, which might try to take the runtime pm reference causing a bad
> > deadlock. So, remove it from the runtime_pm suspend patch.
> >
> > Reported-by: Imre Deak <imre.deak@intel.com>
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> >  drivers/gpu/drm/xe/display/xe_display.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/xe/display/xe_display.c
> > b/drivers/gpu/drm/xe/display/xe_display.c
> > index 651799c946ac..f0f427689a56 100644
> > --- a/drivers/gpu/drm/xe/display/xe_display.c
> > +++ b/drivers/gpu/drm/xe/display/xe_display.c
> > @@ -311,7 +311,8 @@ static void __xe_display_pm_suspend(struct
> > xe_device *xe, bool runtime)
> >
> >       xe_display_flush_cleanup_work(xe);
> >
> > -     intel_hpd_cancel_work(xe);
> > +     if (!runtime)
> > +             intel_hpd_cancel_work(xe);
> 
> So the before suspend still need to make sure hpd work is cancelled smoothly, no?

Not sure what you mean (the patch is merged already). The point is that
there is no point in canceling them with the IRQs being enabled, because
right after canceling they could be rescheduled again (via a new IRQ).
And here the IRQs are still enabled. In addition, even if IRQs were
disabled, a synchornous cancel could lead to a deadlock as the commit
log explains. There is also no reason for canceling the hpd work
during runtime suspend.

> 
> Tejas
> >
> >       if (!runtime && has_display(xe)) {
> >               intel_display_driver_suspend_access(display);
> > --
> > 2.48.1
> 
