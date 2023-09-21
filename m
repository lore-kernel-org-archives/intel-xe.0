Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55069E71062
	for <intel-xe@archiver.kernel.org>; Thu, 21 Sep 2023 12:18:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CC7E10E0C1;
	Thu, 21 Sep 2023 12:18:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1236C10E0C1
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Sep 2023 12:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695298695; x=1726834695;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=sDelDt7M3bRIkFZcmDrgtYpwULgsxyHiMoG5Jr0eJ+I=;
 b=llhu+iaphfMiqwe5ywdoOEnJucrYqA9AU50ZCAHxo4Dsvst1311cP5mo
 t7zCX0myKRa3GaT/p3XGI2PcpsGzGAYD+RJLgXKa+SeOy+WJgp8RVJeFH
 Heq6yILlfEdAigGO5H8uMZI+K5ydkkwfuOQIkUxhKHrylta/XlBg9sG24
 mGONi4lL9h2/3ZGHqTWj3HYykChntYFOBaK/UqGXhMGNoCCnemO06iArl
 ZsqAAzuYQtb2RqhAeMQ4t41CyImabE3rQwQ6MCJVEQBLQ7c8FnZ9Zm6aP
 iDcwjy0YdHyzZ0nwM6fU20XcZbFmq92TiUjsFELCTfWNC/qUw7NI7DNKB w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="380410994"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; d="scan'208";a="380410994"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2023 05:18:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="837291782"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; d="scan'208";a="837291782"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.153])
 by FMSMGA003.fm.intel.com with SMTP; 21 Sep 2023 05:18:11 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 21 Sep 2023 15:18:11 +0300
Date: Thu, 21 Sep 2023 15:18:11 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Shankar, Uma" <uma.shankar@intel.com>
Message-ID: <ZQw0gxPDgHqyGCir@intel.com>
References: <20230918173711.625930-1-uma.shankar@intel.com>
 <20230918173711.625930-3-uma.shankar@intel.com>
 <87h6nqtpzb.fsf@intel.com>
 <DM4PR11MB63600D5DCF025595B46C98B9F4F9A@DM4PR11MB6360.namprd11.prod.outlook.com>
 <878r91rwbm.fsf@intel.com>
 <DM4PR11MB6360E6B0DAAF5EADCB0BAA31F4F9A@DM4PR11MB6360.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DM4PR11MB6360E6B0DAAF5EADCB0BAA31F4F9A@DM4PR11MB6360.namprd11.prod.outlook.com>
X-Patchwork-Hint: comment
Subject: Re: [Intel-xe] [PATCH 2/3] drm/xe: Add wrapper function for VGA
 decode setup
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Sep 20, 2023 at 12:39:19PM +0000, Shankar, Uma wrote:
> 
> 
> > -----Original Message-----
> > From: Nikula, Jani <jani.nikula@intel.com>
> > Sent: Wednesday, September 20, 2023 3:38 PM
> > To: Shankar, Uma <uma.shankar@intel.com>; intel-xe@lists.freedesktop.org
> > Cc: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>
> > Subject: RE: [PATCH 2/3] drm/xe: Add wrapper function for VGA decode setup
> > 
> > On Wed, 20 Sep 2023, "Shankar, Uma" <uma.shankar@intel.com> wrote:
> > >> -----Original Message-----
> > >> From: Nikula, Jani <jani.nikula@intel.com>
> > >> Sent: Tuesday, September 19, 2023 4:00 PM
> > >> To: Shankar, Uma <uma.shankar@intel.com>;
> > >> intel-xe@lists.freedesktop.org
> > >> Cc: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>;
> > >> Shankar, Uma <uma.shankar@intel.com>
> > >> Subject: Re: [PATCH 2/3] drm/xe: Add wrapper function for VGA decode
> > >> setup
> > >>
> > >> On Mon, 18 Sep 2023, Uma Shankar <uma.shankar@intel.com> wrote:
> > >> > Some of the VGA functionality is not needed by the Intel Xe driver.
> > >> > Adding a wrapper function for VGA decode setup.
> > >> >
> > >> > Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> > >> > ---
> > >> >  drivers/gpu/drm/xe/display/ext/i915_utils.c | 5 +++++
> > >> >  drivers/gpu/drm/xe/xe_display.h             | 1 +
> > >> >  2 files changed, 6 insertions(+)
> > >> >
> > >> > diff --git a/drivers/gpu/drm/xe/display/ext/i915_utils.c
> > >> > b/drivers/gpu/drm/xe/display/ext/i915_utils.c
> > >> > index 981edc2788bc..aa3e9ad718c3 100644
> > >> > --- a/drivers/gpu/drm/xe/display/ext/i915_utils.c
> > >> > +++ b/drivers/gpu/drm/xe/display/ext/i915_utils.c
> > >> > @@ -20,3 +20,8 @@ int __i915_inject_probe_error(struct
> > >> > drm_i915_private *i915, int err,  {
> > >> >     return 0;
> > >> >  }
> > >> > +
> > >> > +unsigned int intel_gmch_vga_set_decode(struct pci_dev *pdev, bool
> > >> > +enable_decode) {
> > >> > +   return -EIO;
> > >> > +}
> > >>
> > >> We don't really want to add anything new to i915_utils.c. It's just
> > >> temporary cruft that had to be taken from i915 to make the rest compile.
> > >
> > > Hi Jani,
> > > Thanks for the feedback.
> > >
> > > I was looking at any good place to stack it together. There are some
> > > misc stuff like this which we may need for some other stuff as well.
> > > Should I add a xe_disp_misc file for this or any other suggestion on file which
> > we can use.
> > 
> > Let's take a step back, though.
> > 
> > Why is this call needed on i915 but not on xe?
> 
> Ideally it should be needed even here. Not sure on the exact usage though, the GMCHGraphicsControl
> is there on current platforms as well. Trying to gather some info to get clarity.
> 
> @ville.syrjala@linux.intel.com Do you know how critical this is or can we defer its enabling and
> add support later directly in upstream.

That whole code is mostly nonsense since that register is normally
locked by the BIOS. So despite what the code thinks it cannot realibly
be used to enable/disable VGA decoding. I have some old branch somewhere
that tries to use other means to control this, but IIRC for some reason
I had to resort to stop_machine() to make it not suck in some way.

-- 
Ville Syrjälä
Intel
