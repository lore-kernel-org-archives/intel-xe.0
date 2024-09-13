Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEAB8FC6168
	for <intel-xe@archiver.kernel.org>; Fri, 13 Sep 2024 16:54:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABA8110ED49;
	Fri, 13 Sep 2024 16:54:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U4PSGDez";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFCD910ED49
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Sep 2024 16:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726246478; x=1757782478;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=03Yjlp1BUYK2SUNmHGHvy3X+Rdy2NWGGfOcXKZDXWVI=;
 b=U4PSGDez/VOYOf3IVugrcgaOT7ofxaZ/K3A5IEeeqkm6bbizGtCpbf8Z
 4Cb7HGvqYdaC86vdc53SX6cPa1DBIvGp9cFdKcfC4Dt7IZ7C36K17osN9
 pRP+bUW3VNx/Gxr0rDK6OXJRLBSt2OR5NSOgkUKqCFmhLe/EJmTjZNs/u
 CpK439wGZX2BiSYb57jcGsO8w9drmDhdxT6RLTqc/LozxJbcJJ+1k7FAZ
 k4fqyvqve6ZGvCrhS0lxNB1SWdEm7inWXoEi2Zwo/Y62a0TIbXxvb2Mm2
 +V7CGvYU2d9U93aHNFFN0+oCz13vgu9P4IukeF99siSb67XmhJ0sgtKnj w==;
X-CSE-ConnectionGUID: vGcWpBSARqus6lydIGc9Ug==
X-CSE-MsgGUID: cwRbjNTpSr+hUgyT/BfuWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="25090860"
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; d="scan'208";a="25090860"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2024 09:54:38 -0700
X-CSE-ConnectionGUID: fz526DRLQNaahnWMKiak4A==
X-CSE-MsgGUID: jkHOyeo9QhWBWe73IKIbWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; d="scan'208";a="68222075"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 13 Sep 2024 09:54:35 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 13 Sep 2024 19:54:34 +0300
Date: Fri, 13 Sep 2024 19:54:34 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: rafael@kernel.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] drm/xe: Restore pci state upon resume
Message-ID: <ZuRuSgnnjGSr8xI_@intel.com>
References: <20240912190530.435976-1-rodrigo.vivi@intel.com>
 <ZuQbnRfh-wkuMR83@intel.com> <ZuRduLqXs4za8_PN@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZuRduLqXs4za8_PN@intel.com>
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

On Fri, Sep 13, 2024 at 11:43:52AM -0400, Rodrigo Vivi wrote:
> On Fri, Sep 13, 2024 at 02:01:49PM +0300, Ville Syrjälä wrote:
> > On Thu, Sep 12, 2024 at 03:05:30PM -0400, Rodrigo Vivi wrote:
> > > The pci state was saved, but not restored. Restore
> > > right after the power state transition request like
> > > every other driver.
> > > 
> > > Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> > > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_pci.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > > index 5ba4ec229494..6d29ef4b396f 100644
> > > --- a/drivers/gpu/drm/xe/xe_pci.c
> > > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > > @@ -949,6 +949,8 @@ static int xe_pci_resume(struct device *dev)
> > >  	if (err)
> > >  		return err;
> > >  
> > > +	pci_restore_state(pdev);
> > 
> > Why is xe even doing this stuff by hand instead of letting
> > the pci core handle it?
> 
> That's a fair question, given that there's not much documentation
> around it.
> 
> Looking the pci code, it looks that the pci core is not calling itself
> for the restoration of the config space anywhere and looking to
> other drivers around it looks like a safe thing to do.
> 
> And the pci_restore_state is paired with the pci_save_state.
> Both i915 and Xe are doing the pci_save_state and not restoring
> it.

i915 needs it because (as a side effect) it prevents the pci
code from automagically sticking the device into D3, which
apparently breaks hibernation on some old crappy laptops.
But xe shouldn't need that.

> 
> So, we either add the restore state to both, or we remove the
> save state. Adding seems to be the most conservative approach,
> hence this patch (i915 is queued in a branch with other display
> refactor).
> 
> Rafael, any guidance here?
> 
> Cc: Rafael J. Wysocki <rafael@kernel.org>
> 
> > 
> > > +
> > >  	err = pci_enable_device(pdev);
> > >  	if (err)
> > >  		return err;
> > > -- 
> > > 2.46.0
> > 
> > -- 
> > Ville Syrjälä
> > Intel

-- 
Ville Syrjälä
Intel
