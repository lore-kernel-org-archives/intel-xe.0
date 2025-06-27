Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E880EC77B7F
	for <intel-xe@archiver.kernel.org>; Fri, 27 Jun 2025 13:15:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACA7610EA17;
	Fri, 27 Jun 2025 13:15:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JvfQMwv/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C158610EA17
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Jun 2025 13:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751030111; x=1782566111;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=VjdU2NlKVHF9vM2n5EUuxsVjkk9LSUZ5KXU+QdtsE0k=;
 b=JvfQMwv/Iont2s7uS2R2gZQs5BW+a9KQOVpC6vTmtkwqikLaJ1ZIwq+C
 eTVtiOWkWQwV2F6hyPMb7XMZxXs6WhgELUZH37LX31/VwvIaCYF0fkbTt
 ZX10FZsqNQofWuwiWDl7CFA5wAJU2Itkw8H+8pVt81xUgvG2XKOuZrqjx
 9IWIK8kp0Z7nuizpJpW47oyM5sMjQRWG+ZBchaEC1UwjB2Vwdjg1IPVOK
 0riu1B8l7AtYIazsZqCucRapW2jWbi6HIL4Ssv49yHSaEHpgo6cr23kaZ
 5IIsxuuhVPP9+Ldre0ULjwTXpcXsjOGHiY8oJtPvz2+H/gQ79roT386WD w==;
X-CSE-ConnectionGUID: TpZ3WzaCSPaG+z6N45+n+g==
X-CSE-MsgGUID: MvCf6wbtStmqHq3sFjRXMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="57020687"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="57020687"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 06:15:11 -0700
X-CSE-ConnectionGUID: XmokPrzcR6KueluvSsfnog==
X-CSE-MsgGUID: FUzCa7dhSdOjxa0t8jxRWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="153334438"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 06:15:06 -0700
Date: Fri, 27 Jun 2025 16:15:03 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
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
Message-ID: <aF6ZVwtCddEb873G@black.fi.intel.com>
References: <20250626135610.299943-1-heikki.krogerus@linux.intel.com>
 <20250626135610.299943-4-heikki.krogerus@linux.intel.com>
 <aF6SaLLw7HlSxagh@black.fi.intel.com>
 <aF6VWADKrLbw1Pbl@kuha.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aF6VWADKrLbw1Pbl@kuha.fi.intel.com>
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

On Fri, Jun 27, 2025 at 03:58:00PM +0300, Heikki Krogerus wrote:
> On Fri, Jun 27, 2025 at 03:45:28PM +0300, Raag Jadav wrote:
> > Hi Heikki,
> > 
> > Thanks for picking this up.
> > 
> > On Thu, Jun 26, 2025 at 04:56:08PM +0300, Heikki Krogerus wrote:
> > > From: Raag Jadav <raag.jadav@intel.com>
> > > 
> > > Wire up suspend/resume handles for I2C controller to match its power
> > > state with SGUnit.
> > 
> > ...
> > 
> > > diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
> > > index bfbfe1de7f77..0227fcba2168 100644
> > > --- a/drivers/gpu/drm/xe/xe_i2c.c
> > > +++ b/drivers/gpu/drm/xe/xe_i2c.c
> > > @@ -227,6 +227,31 @@ static const struct regmap_config i2c_regmap_config = {
> > >  	.fast_io = true,
> > >  };
> > >  
> > > +void xe_i2c_pm_suspend(struct xe_device *xe)
> > > +{
> > > +	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
> > > +
> > > +	if (!xe->i2c || xe->i2c->ep.cookie != XE_I2C_EP_COOKIE_DEVICE)
> > > +		return;
> > > +
> > > +	xe_mmio_rmw32(mmio, I2C_CONFIG_PMCSR, PCI_PM_CTRL_STATE_MASK, PCI_D3hot);
> > 
> > I just realized the power modes will need (__force u32) casting to make
> > sparse happy. If you're planning another version, can you please include
> > it? If not, we can have a quick fix later on.
> 
> I can include the casting, np. Is it enough to cast PCI_D3hot?

Looking at some of the existing code, it seems should be good enough.

Raag

> > > +	drm_dbg(&xe->drm, "pmcsr: 0x%08x\n", xe_mmio_read32(mmio, I2C_CONFIG_PMCSR));
> > > +}
> > > +
> > > +void xe_i2c_pm_resume(struct xe_device *xe, bool d3cold)
> > > +{
> > > +	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
> > > +
> > > +	if (!xe->i2c || xe->i2c->ep.cookie != XE_I2C_EP_COOKIE_DEVICE)
> > > +		return;
> > > +
> > > +	if (d3cold)
> > > +		xe_mmio_rmw32(mmio, I2C_CONFIG_CMD, 0, PCI_COMMAND_MEMORY);
> > > +
> > > +	xe_mmio_rmw32(mmio, I2C_CONFIG_PMCSR, PCI_PM_CTRL_STATE_MASK, PCI_D0);
> > 
> > Ditto.
> > 
> > > +	drm_dbg(&xe->drm, "pmcsr: 0x%08x\n", xe_mmio_read32(mmio, I2C_CONFIG_PMCSR));
