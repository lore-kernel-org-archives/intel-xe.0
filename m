Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FAF9C7EE31
	for <intel-xe@archiver.kernel.org>; Fri, 27 Jun 2025 12:58:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0318110EA15;
	Fri, 27 Jun 2025 12:58:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S8bRDulS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F92310EA15
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Jun 2025 12:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751029087; x=1782565087;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Xs7fsDzv9nj/Wqz0gkonZDBgpUmilrNg7jSH3i0VaIU=;
 b=S8bRDulSiL5yEs/IWGwSAYbP3VjCwXcc9YwF44XQYJcnSpikvEeDRene
 3YgJ5RGk+fOqWX0PrEvC5BkdCRCqr6WGtuDfI6Zzr75q1XwBcaCAjCyPF
 tnig7mMVq2jtNOTSeu4Q95BnDKRfnMfSCpItHMXt46OvW/9rtZO8LFUWf
 xqOmWKM5CyIVAHJ9iVGMamsHRNgb+dwE1Zug57BgBFHqsXlylu1u5HuYN
 aknKR3/3l+gHxumxVAukshq6wRkff6R6xaPU3MwmO85HT3f1fnlicVnqn
 vTM3e0YXxpFQSdNU9ELfW3PSCiyIxpfM3BLtS0bX1PN2LhgKIxKOPn95U A==;
X-CSE-ConnectionGUID: 3gMcCRk6T7ynlNJ3wq7g6w==
X-CSE-MsgGUID: riQCIJEKRZCPh+vMZJ0GFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="53422127"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="53422127"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 05:58:07 -0700
X-CSE-ConnectionGUID: wa5IQcybT6231sVgkaOj6Q==
X-CSE-MsgGUID: wUkHkpEqRIife2UL4mbufw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="156846790"
Received: from kuha.fi.intel.com ([10.237.72.152])
 by fmviesa003.fm.intel.com with SMTP; 27 Jun 2025 05:58:01 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation);
 Fri, 27 Jun 2025 15:58:00 +0300
Date: Fri, 27 Jun 2025 15:58:00 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
 "Tauro, Riana" <riana.tauro@intel.com>,
 "Adatrao, Srinivasa" <srinivasa.adatrao@intel.com>,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 intel-xe@lists.freedesktop.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, Karthik Poosa <karthik.poosa@intel.com>
Subject: Re: [PATCH v4 3/4] drm/xe/pm: Wire up suspend/resume for I2C
 controller
Message-ID: <aF6VWADKrLbw1Pbl@kuha.fi.intel.com>
References: <20250626135610.299943-1-heikki.krogerus@linux.intel.com>
 <20250626135610.299943-4-heikki.krogerus@linux.intel.com>
 <aF6SaLLw7HlSxagh@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aF6SaLLw7HlSxagh@black.fi.intel.com>
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

On Fri, Jun 27, 2025 at 03:45:28PM +0300, Raag Jadav wrote:
> Hi Heikki,
> 
> Thanks for picking this up.
> 
> On Thu, Jun 26, 2025 at 04:56:08PM +0300, Heikki Krogerus wrote:
> > From: Raag Jadav <raag.jadav@intel.com>
> > 
> > Wire up suspend/resume handles for I2C controller to match its power
> > state with SGUnit.
> 
> ...
> 
> > diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
> > index bfbfe1de7f77..0227fcba2168 100644
> > --- a/drivers/gpu/drm/xe/xe_i2c.c
> > +++ b/drivers/gpu/drm/xe/xe_i2c.c
> > @@ -227,6 +227,31 @@ static const struct regmap_config i2c_regmap_config = {
> >  	.fast_io = true,
> >  };
> >  
> > +void xe_i2c_pm_suspend(struct xe_device *xe)
> > +{
> > +	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
> > +
> > +	if (!xe->i2c || xe->i2c->ep.cookie != XE_I2C_EP_COOKIE_DEVICE)
> > +		return;
> > +
> > +	xe_mmio_rmw32(mmio, I2C_CONFIG_PMCSR, PCI_PM_CTRL_STATE_MASK, PCI_D3hot);
> 
> I just realized the power modes will need (__force u32) casting to make
> sparse happy. If you're planning another version, can you please include
> it? If not, we can have a quick fix later on.

I can include the casting, np. Is it enough to cast PCI_D3hot?

thanks,

> > +	drm_dbg(&xe->drm, "pmcsr: 0x%08x\n", xe_mmio_read32(mmio, I2C_CONFIG_PMCSR));
> > +}
> > +
> > +void xe_i2c_pm_resume(struct xe_device *xe, bool d3cold)
> > +{
> > +	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
> > +
> > +	if (!xe->i2c || xe->i2c->ep.cookie != XE_I2C_EP_COOKIE_DEVICE)
> > +		return;
> > +
> > +	if (d3cold)
> > +		xe_mmio_rmw32(mmio, I2C_CONFIG_CMD, 0, PCI_COMMAND_MEMORY);
> > +
> > +	xe_mmio_rmw32(mmio, I2C_CONFIG_PMCSR, PCI_PM_CTRL_STATE_MASK, PCI_D0);
> 
> Ditto.
> 
> > +	drm_dbg(&xe->drm, "pmcsr: 0x%08x\n", xe_mmio_read32(mmio, I2C_CONFIG_PMCSR));
> > +}
> 
> Raag

-- 
heikki
