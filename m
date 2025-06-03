Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A194FC5AE59
	for <intel-xe@archiver.kernel.org>; Tue,  3 Jun 2025 17:41:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4025B10E13B;
	Tue,  3 Jun 2025 17:41:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OcD574qn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2960610E203
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Jun 2025 17:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748972512; x=1780508512;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=R/Bo7efpKbsD9H8EVMHsNSZ8Vs6vX2A3xiZwW5Cy5HU=;
 b=OcD574qnbnBDDbJdSfjtBcOPTQxeZrSpM3q2TTDEkvXQneLeShIeCChl
 X4Q8X4EWDeTqScFsitQ0PU0XL3Xrx9E3DxiHJK0S5kcKY4SN4YN503Wgo
 VdE4mXXaP/1KVCr3qsvG8ZgAY4um41Xbqf6PS921/PwBxoCm0wERDikNH
 v1AnFbwr5PvuMplLXZ9U6iWotgxfD5JdFFGA88afJlmVM5SdczON0Kd/j
 PaNE5KypWWvUOeHzb/WVf3C5Z6qsQFo7kggFIhI5Ka+E/7jhBgAaz2AzX
 SPXW02z49AjgqgPlAxVB2ISGohqEW0jpLNJYcCcayFRcVWgACMske7DM4 w==;
X-CSE-ConnectionGUID: mIYsE4JdRCC7ALoYv/xtEQ==
X-CSE-MsgGUID: Rvp3LmcTRluWmNsV3Zjt/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="50886461"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="50886461"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 10:41:51 -0700
X-CSE-ConnectionGUID: AiYnqzKyRjWXN6EJC8WTJA==
X-CSE-MsgGUID: Ymn0qY/lSECYg+3xm9099w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="149970672"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 10:41:49 -0700
Date: Tue, 3 Jun 2025 20:41:46 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com
Subject: Re: [PATCH v1] drm/xe/pm: Wire up suspend/resume for I2C controller
Message-ID: <aD8z2oY6dPAUZupz@black.fi.intel.com>
References: <20250602070818.701834-1-raag.jadav@intel.com>
 <aD2rsWvCNozyqqcM@kuha.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aD2rsWvCNozyqqcM@kuha.fi.intel.com>
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

On Mon, Jun 02, 2025 at 04:48:33PM +0300, Heikki Krogerus wrote:
> On Mon, Jun 02, 2025 at 12:38:18PM +0530, Raag Jadav wrote:
> > Wire up suspend/resume handles for I2C controller to match its power
> > state with SGUnit.
> > 
> > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > ---
> > 
> > This depends on I2C series by Heikki on [1].
> > [1] https://lore.kernel.org/intel-xe/20250530141744.3605983-1-heikki.krogerus@linux.intel.com/
> 
> If it's okay to everybody, I'll include this to my series when I
> resend after the merge window is closed.

Let's give it a few days in case of any comments. If not, perhaps you can
include it.

Raag

> >  drivers/gpu/drm/xe/regs/xe_i2c_regs.h |  5 +++++
> >  drivers/gpu/drm/xe/xe_i2c.c           | 29 +++++++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_i2c.h           |  4 ++++
> >  drivers/gpu/drm/xe/xe_pm.c            |  9 +++++++++
> >  4 files changed, 47 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/regs/xe_i2c_regs.h b/drivers/gpu/drm/xe/regs/xe_i2c_regs.h
> > index 2acb55eeef0d..fce0066e92e5 100644
> > --- a/drivers/gpu/drm/xe/regs/xe_i2c_regs.h
> > +++ b/drivers/gpu/drm/xe/regs/xe_i2c_regs.h
> > @@ -2,6 +2,8 @@
> >  #ifndef _XE_I2C_REGS_H_
> >  #define _XE_I2C_REGS_H_
> >  
> > +#include <linux/pci_regs.h>
> > +
> >  #include "xe_reg_defs.h"
> >  
> >  #define SOC_BASE			0x280000
> > @@ -13,4 +15,7 @@
> >  #define CLIENT_DISC_COOKIE		XE_REG(SOC_BASE + 0x0164)
> >  #define CLIENT_DISC_ADDRESS		XE_REG(SOC_BASE + 0x0168)
> >  
> > +#define I2C_CONFIG_CMD			XE_REG(I2C_CONFIG_SPACE_OFFSET + PCI_COMMAND)
> > +#define I2C_CONFIG_PMCSR		XE_REG(I2C_CONFIG_SPACE_OFFSET + 0x84)
> > +
> >  #endif /* _XE_I2C_REGS_H_ */
> > diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
> > index cc231368789f..6cfb04a739dd 100644
> > --- a/drivers/gpu/drm/xe/xe_i2c.c
> > +++ b/drivers/gpu/drm/xe/xe_i2c.c
> > @@ -208,6 +208,31 @@ static const struct regmap_config i2c_regmap_config = {
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
> > +	drm_dbg(&xe->drm, "pmcsr: 0x%08x\n", xe_mmio_read32(mmio, I2C_CONFIG_PMCSR));
> > +}
> > +
> >  static void xe_i2c_remove(void *data)
> >  {
> >  	struct xe_i2c *i2c = data;
> > @@ -243,6 +268,10 @@ int xe_i2c_probe(struct xe_device *xe)
> >  	i2c->mmio = xe_root_tile_mmio(xe);
> >  	i2c->drm_dev = xe->drm.dev;
> >  	i2c->ep = ep;
> > +	xe->i2c = i2c;
> > +
> > +	/* PCI PM isn't aware of this device, bring it up and match it with SGUnit state. */
> > +	xe_i2c_pm_resume(xe, true);
> >  
> >  	regmap = devm_regmap_init(i2c->drm_dev, NULL, i2c, &i2c_regmap_config);
> >  	if (IS_ERR(regmap))
> > diff --git a/drivers/gpu/drm/xe/xe_i2c.h b/drivers/gpu/drm/xe/xe_i2c.h
> > index ab8e21630838..2a275826c4da 100644
> > --- a/drivers/gpu/drm/xe/xe_i2c.h
> > +++ b/drivers/gpu/drm/xe/xe_i2c.h
> > @@ -52,9 +52,13 @@ struct xe_i2c {
> >  #if IS_ENABLED(CONFIG_I2C)
> >  int xe_i2c_probe(struct xe_device *xe);
> >  void xe_i2c_irq_handler(struct xe_device *xe, u32 master_ctl);
> > +void xe_i2c_pm_suspend(struct xe_device *xe);
> > +void xe_i2c_pm_resume(struct xe_device *xe, bool d3cold);
> >  #else
> >  static inline int xe_i2c_probe(struct xe_device *xe) { return 0; }
> >  static inline void xe_i2c_irq_handler(struct xe_device *xe, u32 master_ctl) { }
> > +static inline void xe_i2c_pm_suspend(struct xe_device *xe) { }
> > +static inline void xe_i2c_pm_resume(struct xe_device *xe, bool d3cold) { }
> >  #endif
> >  
> >  #endif
> > diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> > index 693866def183..dbadbb0d95a6 100644
> > --- a/drivers/gpu/drm/xe/xe_pm.c
> > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > @@ -19,6 +19,7 @@
> >  #include "xe_ggtt.h"
> >  #include "xe_gt.h"
> >  #include "xe_guc.h"
> > +#include "xe_i2c.h"
> >  #include "xe_irq.h"
> >  #include "xe_pcode.h"
> >  #include "xe_pxp.h"
> > @@ -146,6 +147,8 @@ int xe_pm_suspend(struct xe_device *xe)
> >  
> >  	xe_display_pm_suspend_late(xe);
> >  
> > +	xe_i2c_pm_suspend(xe);
> > +
> >  	drm_dbg(&xe->drm, "Device suspended\n");
> >  	return 0;
> >  
> > @@ -191,6 +194,8 @@ int xe_pm_resume(struct xe_device *xe)
> >  	if (err)
> >  		goto err;
> >  
> > +	xe_i2c_pm_resume(xe, xe->d3cold.allowed);
> > +
> >  	xe_irq_resume(xe);
> >  
> >  	for_each_gt(gt, xe, id)
> > @@ -488,6 +493,8 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
> >  
> >  	xe_display_pm_runtime_suspend_late(xe);
> >  
> > +	xe_i2c_pm_suspend(xe);
> > +
> >  	xe_rpm_lockmap_release(xe);
> >  	xe_pm_write_callback_task(xe, NULL);
> >  	return 0;
> > @@ -535,6 +542,8 @@ int xe_pm_runtime_resume(struct xe_device *xe)
> >  			goto out;
> >  	}
> >  
> > +	xe_i2c_pm_resume(xe, xe->d3cold.allowed);
> > +
> >  	xe_irq_resume(xe);
> >  
> >  	for_each_gt(gt, xe, id)
> > -- 
> > 2.34.1
> 
> -- 
> heikki
