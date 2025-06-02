Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A24BBC5AD49
	for <intel-xe@archiver.kernel.org>; Mon,  2 Jun 2025 13:48:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56D8910E2D6;
	Mon,  2 Jun 2025 13:48:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nU8XWT9e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40B2510E2D6
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Jun 2025 13:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748872119; x=1780408119;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=t1hEg5WcmKe7vRYNCugU5sZ24WECg1bc2TVQTVGauH8=;
 b=nU8XWT9ekAHPRpy0wLQfFMuzgh4q2zcWBJT8udU/wPpQvr0P6GAIJU+f
 R94f9zaliFKYrmopeAV7ubfpXgO8LJh3/xDu3iLd4XAT7sPJHPNO8nmir
 RMTt0zrm9pyDOCJ15pLo3HTdCz5W/0fuSRD/MLiWUFP3w5b6Rshdx3ps+
 RXzM4HVhOosNiyzDGnGraFe7NVTiN25HyAG4sQcjN2hT+g15+WTS6BK5S
 n9pEjW7VnDm7i/jYhaLEW3PMI0GgPbVP+8Gg+ANL9q5aPdCnZpJDPuQIX
 eRS4xll1MkfQDxmrvizQnkWWjrN8julvPdjaODAqfD/lZoaAImQ4Kf72T Q==;
X-CSE-ConnectionGUID: 8u05y/ZJQjeUxue8Zu5O+Q==
X-CSE-MsgGUID: v3CVc0gJTZGl+qwxk6rPfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="68427437"
X-IronPort-AV: E=Sophos;i="6.16,203,1744095600"; d="scan'208";a="68427437"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 06:48:37 -0700
X-CSE-ConnectionGUID: 7SQSy77HTfi+qFNi24A+iA==
X-CSE-MsgGUID: hZr+Uzr7QU6D5OhyvtfciA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,203,1744095600"; d="scan'208";a="148408240"
Received: from kuha.fi.intel.com ([10.237.72.152])
 by fmviesa003.fm.intel.com with SMTP; 02 Jun 2025 06:48:35 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation);
 Mon, 02 Jun 2025 16:48:33 +0300
Date: Mon, 2 Jun 2025 16:48:33 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com
Subject: Re: [PATCH v1] drm/xe/pm: Wire up suspend/resume for I2C controller
Message-ID: <aD2rsWvCNozyqqcM@kuha.fi.intel.com>
References: <20250602070818.701834-1-raag.jadav@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602070818.701834-1-raag.jadav@intel.com>
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

On Mon, Jun 02, 2025 at 12:38:18PM +0530, Raag Jadav wrote:
> Wire up suspend/resume handles for I2C controller to match its power
> state with SGUnit.
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
> 
> This depends on I2C series by Heikki on [1].
> [1] https://lore.kernel.org/intel-xe/20250530141744.3605983-1-heikki.krogerus@linux.intel.com/

If it's okay to everybody, I'll include this to my series when I
resend after the merge window is closed.

thanks,

>  drivers/gpu/drm/xe/regs/xe_i2c_regs.h |  5 +++++
>  drivers/gpu/drm/xe/xe_i2c.c           | 29 +++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_i2c.h           |  4 ++++
>  drivers/gpu/drm/xe/xe_pm.c            |  9 +++++++++
>  4 files changed, 47 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_i2c_regs.h b/drivers/gpu/drm/xe/regs/xe_i2c_regs.h
> index 2acb55eeef0d..fce0066e92e5 100644
> --- a/drivers/gpu/drm/xe/regs/xe_i2c_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_i2c_regs.h
> @@ -2,6 +2,8 @@
>  #ifndef _XE_I2C_REGS_H_
>  #define _XE_I2C_REGS_H_
>  
> +#include <linux/pci_regs.h>
> +
>  #include "xe_reg_defs.h"
>  
>  #define SOC_BASE			0x280000
> @@ -13,4 +15,7 @@
>  #define CLIENT_DISC_COOKIE		XE_REG(SOC_BASE + 0x0164)
>  #define CLIENT_DISC_ADDRESS		XE_REG(SOC_BASE + 0x0168)
>  
> +#define I2C_CONFIG_CMD			XE_REG(I2C_CONFIG_SPACE_OFFSET + PCI_COMMAND)
> +#define I2C_CONFIG_PMCSR		XE_REG(I2C_CONFIG_SPACE_OFFSET + 0x84)
> +
>  #endif /* _XE_I2C_REGS_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
> index cc231368789f..6cfb04a739dd 100644
> --- a/drivers/gpu/drm/xe/xe_i2c.c
> +++ b/drivers/gpu/drm/xe/xe_i2c.c
> @@ -208,6 +208,31 @@ static const struct regmap_config i2c_regmap_config = {
>  	.fast_io = true,
>  };
>  
> +void xe_i2c_pm_suspend(struct xe_device *xe)
> +{
> +	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
> +
> +	if (!xe->i2c || xe->i2c->ep.cookie != XE_I2C_EP_COOKIE_DEVICE)
> +		return;
> +
> +	xe_mmio_rmw32(mmio, I2C_CONFIG_PMCSR, PCI_PM_CTRL_STATE_MASK, PCI_D3hot);
> +	drm_dbg(&xe->drm, "pmcsr: 0x%08x\n", xe_mmio_read32(mmio, I2C_CONFIG_PMCSR));
> +}
> +
> +void xe_i2c_pm_resume(struct xe_device *xe, bool d3cold)
> +{
> +	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
> +
> +	if (!xe->i2c || xe->i2c->ep.cookie != XE_I2C_EP_COOKIE_DEVICE)
> +		return;
> +
> +	if (d3cold)
> +		xe_mmio_rmw32(mmio, I2C_CONFIG_CMD, 0, PCI_COMMAND_MEMORY);
> +
> +	xe_mmio_rmw32(mmio, I2C_CONFIG_PMCSR, PCI_PM_CTRL_STATE_MASK, PCI_D0);
> +	drm_dbg(&xe->drm, "pmcsr: 0x%08x\n", xe_mmio_read32(mmio, I2C_CONFIG_PMCSR));
> +}
> +
>  static void xe_i2c_remove(void *data)
>  {
>  	struct xe_i2c *i2c = data;
> @@ -243,6 +268,10 @@ int xe_i2c_probe(struct xe_device *xe)
>  	i2c->mmio = xe_root_tile_mmio(xe);
>  	i2c->drm_dev = xe->drm.dev;
>  	i2c->ep = ep;
> +	xe->i2c = i2c;
> +
> +	/* PCI PM isn't aware of this device, bring it up and match it with SGUnit state. */
> +	xe_i2c_pm_resume(xe, true);
>  
>  	regmap = devm_regmap_init(i2c->drm_dev, NULL, i2c, &i2c_regmap_config);
>  	if (IS_ERR(regmap))
> diff --git a/drivers/gpu/drm/xe/xe_i2c.h b/drivers/gpu/drm/xe/xe_i2c.h
> index ab8e21630838..2a275826c4da 100644
> --- a/drivers/gpu/drm/xe/xe_i2c.h
> +++ b/drivers/gpu/drm/xe/xe_i2c.h
> @@ -52,9 +52,13 @@ struct xe_i2c {
>  #if IS_ENABLED(CONFIG_I2C)
>  int xe_i2c_probe(struct xe_device *xe);
>  void xe_i2c_irq_handler(struct xe_device *xe, u32 master_ctl);
> +void xe_i2c_pm_suspend(struct xe_device *xe);
> +void xe_i2c_pm_resume(struct xe_device *xe, bool d3cold);
>  #else
>  static inline int xe_i2c_probe(struct xe_device *xe) { return 0; }
>  static inline void xe_i2c_irq_handler(struct xe_device *xe, u32 master_ctl) { }
> +static inline void xe_i2c_pm_suspend(struct xe_device *xe) { }
> +static inline void xe_i2c_pm_resume(struct xe_device *xe, bool d3cold) { }
>  #endif
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 693866def183..dbadbb0d95a6 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -19,6 +19,7 @@
>  #include "xe_ggtt.h"
>  #include "xe_gt.h"
>  #include "xe_guc.h"
> +#include "xe_i2c.h"
>  #include "xe_irq.h"
>  #include "xe_pcode.h"
>  #include "xe_pxp.h"
> @@ -146,6 +147,8 @@ int xe_pm_suspend(struct xe_device *xe)
>  
>  	xe_display_pm_suspend_late(xe);
>  
> +	xe_i2c_pm_suspend(xe);
> +
>  	drm_dbg(&xe->drm, "Device suspended\n");
>  	return 0;
>  
> @@ -191,6 +194,8 @@ int xe_pm_resume(struct xe_device *xe)
>  	if (err)
>  		goto err;
>  
> +	xe_i2c_pm_resume(xe, xe->d3cold.allowed);
> +
>  	xe_irq_resume(xe);
>  
>  	for_each_gt(gt, xe, id)
> @@ -488,6 +493,8 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>  
>  	xe_display_pm_runtime_suspend_late(xe);
>  
> +	xe_i2c_pm_suspend(xe);
> +
>  	xe_rpm_lockmap_release(xe);
>  	xe_pm_write_callback_task(xe, NULL);
>  	return 0;
> @@ -535,6 +542,8 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>  			goto out;
>  	}
>  
> +	xe_i2c_pm_resume(xe, xe->d3cold.allowed);
> +
>  	xe_irq_resume(xe);
>  
>  	for_each_gt(gt, xe, id)
> -- 
> 2.34.1

-- 
heikki
