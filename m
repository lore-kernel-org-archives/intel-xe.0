Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB861C77B7F
	for <intel-xe@archiver.kernel.org>; Tue, 24 Jun 2025 13:26:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CF8010E5AA;
	Tue, 24 Jun 2025 13:26:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UHAXundx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF39410E5AA
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Jun 2025 13:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750771608; x=1782307608;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=PpEDuVDx80GyP7uLvb+hr3KMXZGzCMaPqWx2F4TccuQ=;
 b=UHAXundxC/P3m0HMTo8iiqJaE3RkK8+6QLgulEuoPJcCPysXXUsu68lm
 nS2/H2meqWNBKXVmOXprC+/E7OZOGo535LFCd897CWUOIo3HBnetf/roD
 y+KILS5Ba0Ruj6Fy6BLXzZApzRyMYjsdFnjUwsCcdJrv2oF8Ws9K47bgd
 GbBYy9Lnob+WjbeTB4FgegafiRfGzVVge+uisDnOg2W1M/WqR2anQhAKS
 PzB7i+CSrLTCN06EpkO63OuptBizFwlTMM/+TX1S9DhE5G7tKsfQxBe5B
 5njZkY1i38zGWLW4TRIQ9APY4V4ciB2bx3Mo58094cY9trTFKatdo+hLP w==;
X-CSE-ConnectionGUID: v6+6utykQOyuEPujOx8fdg==
X-CSE-MsgGUID: NuU1pZN1Su2jyveXUpm2rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="64068491"
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; d="scan'208";a="64068491"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 06:26:48 -0700
X-CSE-ConnectionGUID: DZh2UalVTGi0Zmenw/GB0A==
X-CSE-MsgGUID: gHTUsEAcR8OLMW7GcTLfYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; d="scan'208";a="175524430"
Received: from kuha.fi.intel.com ([10.237.72.152])
 by fmviesa002.fm.intel.com with SMTP; 24 Jun 2025 06:26:37 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation);
 Tue, 24 Jun 2025 16:26:36 +0300
Date: Tue, 24 Jun 2025 16:26:36 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
 Raag Jadav <raag.jadav@intel.com>, "Tauro, Riana" <riana.tauro@intel.com>,
 "Adatrao, Srinivasa" <srinivasa.adatrao@intel.com>,
 intel-xe@lists.freedesktop.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/4] drm/xe: Support for I2C attached MCUs
Message-ID: <aFqnjOo6H0JG0chR@kuha.fi.intel.com>
References: <20250612132450.3293248-1-heikki.krogerus@linux.intel.com>
 <20250612132450.3293248-3-heikki.krogerus@linux.intel.com>
 <aFB-y_bObI8LZvzp@intel.com> <aFFRMIvChfQI3dND@kuha.fi.intel.com>
 <aFWKnOKTNOqcbTCx@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFWKnOKTNOqcbTCx@intel.com>
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

On Fri, Jun 20, 2025 at 12:21:48PM -0400, Rodrigo Vivi wrote:
> On Tue, Jun 17, 2025 at 02:27:44PM +0300, Heikki Krogerus wrote:
> > Hi Rodrigo,
> > 
> > Thank you for the review.
> > 
> > On Mon, Jun 16, 2025 at 04:30:03PM -0400, Rodrigo Vivi wrote:
> > > On Thu, Jun 12, 2025 at 04:24:48PM +0300, Heikki Krogerus wrote:
> > > > Adding adaption/glue layer where the I2C host adapter
> > > > (Synopsys DesignWare I2C adapter) and the I2C clients (the
> > > > microcontroller units) are enumerated.
> > > > 
> > > > The microcontroller units (MCU) that are attached to the GPU
> > > > depend on the OEM. The initially supported MCU will be the
> > > > Add-In Management Controller (AMC).
> > > > 
> > > > Originally-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> > > > Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/Kconfig            |   1 +
> > > >  drivers/gpu/drm/xe/Makefile           |   1 +
> > > >  drivers/gpu/drm/xe/regs/xe_i2c_regs.h |  15 ++
> > > >  drivers/gpu/drm/xe/regs/xe_irq_regs.h |   1 +
> > > >  drivers/gpu/drm/xe/regs/xe_pmt.h      |   2 +-
> > > >  drivers/gpu/drm/xe/regs/xe_regs.h     |   2 +
> > > >  drivers/gpu/drm/xe/xe_device.c        |   5 +
> > > >  drivers/gpu/drm/xe/xe_device_types.h  |   4 +
> > > >  drivers/gpu/drm/xe/xe_i2c.c           | 270 ++++++++++++++++++++++++++
> > > >  drivers/gpu/drm/xe/xe_i2c.h           |  58 ++++++
> > > >  drivers/gpu/drm/xe/xe_irq.c           |   2 +
> > > >  11 files changed, 360 insertions(+), 1 deletion(-)
> > > >  create mode 100644 drivers/gpu/drm/xe/regs/xe_i2c_regs.h
> > > >  create mode 100644 drivers/gpu/drm/xe/xe_i2c.c
> > > >  create mode 100644 drivers/gpu/drm/xe/xe_i2c.h
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> > > > index c57f1da0791d..5c162031fc3f 100644
> > > > --- a/drivers/gpu/drm/xe/Kconfig
> > > > +++ b/drivers/gpu/drm/xe/Kconfig
> > > > @@ -44,6 +44,7 @@ config DRM_XE
> > > >  	select WANT_DEV_COREDUMP
> > > >  	select AUXILIARY_BUS
> > > >  	select HMM_MIRROR
> > > > +	select REGMAP if I2C
> > > >  	help
> > > >  	  Experimental driver for Intel Xe series GPUs
> > > >  
> > > > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > > > index f5f5775acdc0..293552fc5aaf 100644
> > > > --- a/drivers/gpu/drm/xe/Makefile
> > > > +++ b/drivers/gpu/drm/xe/Makefile
> > > > @@ -124,6 +124,7 @@ xe-y += xe_bb.o \
> > > >  	xe_wait_user_fence.o \
> > > >  	xe_wopcm.o
> > > >  
> > > > +xe-$(CONFIG_I2C)	+= xe_i2c.o
> > > >  xe-$(CONFIG_HMM_MIRROR) += xe_hmm.o
> > > >  xe-$(CONFIG_DRM_XE_GPUSVM) += xe_svm.o
> > > >  
> > > > diff --git a/drivers/gpu/drm/xe/regs/xe_i2c_regs.h b/drivers/gpu/drm/xe/regs/xe_i2c_regs.h
> > > > new file mode 100644
> > > > index 000000000000..fa7223e6ce9e
> > > > --- /dev/null
> > > > +++ b/drivers/gpu/drm/xe/regs/xe_i2c_regs.h
> > > > @@ -0,0 +1,15 @@
> > > > +/* SPDX-License-Identifier: GPL-2.0 */
> > > > +#ifndef _XE_I2C_REGS_H_
> > > > +#define _XE_I2C_REGS_H_
> > > > +
> > > > +#include "xe_reg_defs.h"
> > > > +#include "xe_regs.h"
> > > > +
> > > > +#define I2C_CONFIG_SPACE_OFFSET		(SOC_BASE + 0xf6000)
> > > > +#define I2C_MEM_SPACE_OFFSET		(SOC_BASE + 0xf7400)
> > > > +#define I2C_BRIDGE_OFFSET		(SOC_BASE + 0xd9000)
> 
> nit: could be sorted out starting with lower offset (bridge)

OK.

> > > > +
> > > > +#define CLIENT_DISC_COOKIE		XE_REG(SOC_BASE + 0x0164)
> > > > +#define CLIENT_DISC_ADDRESS		XE_REG(SOC_BASE + 0x0168)
> 
> why is this named cookie and address?
> Shouldn't it be REG_SG_REMAP_ADDR_PREFIX and REG_SG_REMAP_ADDR_POSTFIX ?

Makes sense to me. I'll change it like that.

> > > 
> > > Could you please send me some pointers of the spec for this registers
> > > so I can help on the review here?
> > 
> > Done.
> > 
> > > > +
> > > > +#endif /* _XE_I2C_REGS_H_ */
> > > > diff --git a/drivers/gpu/drm/xe/regs/xe_irq_regs.h b/drivers/gpu/drm/xe/regs/xe_irq_regs.h
> > > > index f0ecfcac4003..13635e4331d4 100644
> > > > --- a/drivers/gpu/drm/xe/regs/xe_irq_regs.h
> > > > +++ b/drivers/gpu/drm/xe/regs/xe_irq_regs.h
> > > > @@ -19,6 +19,7 @@
> > > >  #define   MASTER_IRQ				REG_BIT(31)
> > > >  #define   GU_MISC_IRQ				REG_BIT(29)
> > > >  #define   DISPLAY_IRQ				REG_BIT(16)
> > > > +#define   I2C_IRQ				REG_BIT(12)
> > > >  #define   GT_DW_IRQ(x)				REG_BIT(x)
> > > >  
> > > >  /*
> > > > diff --git a/drivers/gpu/drm/xe/regs/xe_pmt.h b/drivers/gpu/drm/xe/regs/xe_pmt.h
> > > > index b0efd9b48d1e..2995d72c3f78 100644
> > > > --- a/drivers/gpu/drm/xe/regs/xe_pmt.h
> > > > +++ b/drivers/gpu/drm/xe/regs/xe_pmt.h
> > > > @@ -5,7 +5,7 @@
> > > >  #ifndef _XE_PMT_H_
> > > >  #define _XE_PMT_H_
> > > >  
> > > > -#define SOC_BASE			0x280000
> > > > +#include "xe_regs.h"
> > > >  
> > > >  #define BMG_PMT_BASE_OFFSET		0xDB000
> > > >  #define BMG_DISCOVERY_OFFSET		(SOC_BASE + BMG_PMT_BASE_OFFSET)
> > > > diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
> > > > index 3abb17d2ca33..1926b4044314 100644
> > > > --- a/drivers/gpu/drm/xe/regs/xe_regs.h
> > > > +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
> > > > @@ -7,6 +7,8 @@
> > > >  
> > > >  #include "regs/xe_reg_defs.h"
> > > >  
> > > > +#define SOC_BASE				0x280000
> > > > +
> > > >  #define GU_CNTL_PROTECTED			XE_REG(0x10100C)
> > > >  #define   DRIVERINT_FLR_DIS			REG_BIT(31)
> > > >  
> > > > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > > > index 7e87344943cd..ca098ed532b5 100644
> > > > --- a/drivers/gpu/drm/xe/xe_device.c
> > > > +++ b/drivers/gpu/drm/xe/xe_device.c
> > > > @@ -42,6 +42,7 @@
> > > >  #include "xe_guc.h"
> > > >  #include "xe_hw_engine_group.h"
> > > >  #include "xe_hwmon.h"
> > > > +#include "xe_i2c.h"
> > > >  #include "xe_irq.h"
> > > >  #include "xe_memirq.h"
> > > >  #include "xe_mmio.h"
> > > > @@ -921,6 +922,10 @@ int xe_device_probe(struct xe_device *xe)
> > > >  	if (err)
> > > >  		goto err_unregister_display;
> > > >  
> > > > +	err = xe_i2c_probe(xe);
> > > > +	if (err)
> > > > +		goto err_unregister_display;
> > > > +
> > > >  	for_each_gt(gt, xe, id)
> > > >  		xe_gt_sanitize_freq(gt);
> > > >  
> > > > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > > > index ac27389ccb8b..8f3c5ea58034 100644
> > > > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > > > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > > > @@ -33,6 +33,7 @@
> > > >  struct dram_info;
> > > >  struct intel_display;
> > > >  struct xe_ggtt;
> > > > +struct xe_i2c;
> > > >  struct xe_pat_ops;
> > > >  struct xe_pxp;
> > > >  
> > > > @@ -573,6 +574,9 @@ struct xe_device {
> > > >  	/** @pmu: performance monitoring unit */
> > > >  	struct xe_pmu pmu;
> > > >  
> > > > +	/** @i2c: I2C host controller */
> > > > +	struct xe_i2c *i2c;
> > > > +
> > > >  	/** @atomic_svm_timeslice_ms: Atomic SVM fault timeslice MS */
> > > >  	u32 atomic_svm_timeslice_ms;
> > > >  
> > > > diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
> > > > new file mode 100644
> > > > index 000000000000..3d649602ede8
> > > > --- /dev/null
> > > > +++ b/drivers/gpu/drm/xe/xe_i2c.c
> > > > @@ -0,0 +1,270 @@
> > > > +// SPDX-License-Identifier: GPL-2.0
> > > 
> > > Does it really need to be GPL or could it be MIT?
> > > 
> > > (If you copied code from other files that are GPL, then it needs
> > > to be GPL)
> > 
> > Michael, do we need to use GPL here, or is MIT okay?
> 
> Mike?!
> 
> > 
> > > > +/*
> > > > + * Intel Xe I2C attached Microcontroller Units (MCU)
> > > > + *
> > > > + * Copyright (C) 2025 Intel Corporation.
> > > > + */
> > > > +
> > > > +#include <linux/array_size.h>
> > > > +#include <linux/container_of.h>
> > > > +#include <linux/device.h>
> > > > +#include <linux/err.h>
> > > > +#include <linux/i2c.h>
> > > > +#include <linux/ioport.h>
> > > > +#include <linux/irq.h>
> > > > +#include <linux/irqdomain.h>
> > > > +#include <linux/notifier.h>
> > > > +#include <linux/pci.h>
> > > > +#include <linux/platform_device.h>
> > > > +#include <linux/property.h>
> > > > +#include <linux/regmap.h>
> > > > +#include <linux/sprintf.h>
> > > > +#include <linux/string.h>
> > > > +#include <linux/types.h>
> > > > +#include <linux/workqueue.h>
> > > > +
> > > > +#include "regs/xe_i2c_regs.h"
> > > > +#include "regs/xe_irq_regs.h"
> > > > +
> > > > +#include "xe_device.h"
> > > > +#include "xe_device_types.h"
> > > > +#include "xe_i2c.h"
> > > > +#include "xe_mmio.h"
> > > > +#include "xe_platform_types.h"
> > > > +
> > > > +/* Synopsys DesignWare I2C Host Adapter */
> > > > +static const char adapter_name[] = "i2c_designware";
> > > > +
> > > > +static const struct property_entry xe_i2c_adapter_properties[] = {
> > > > +	PROPERTY_ENTRY_STRING("compatible", "intel,xe-i2c"),
> > > > +	PROPERTY_ENTRY_U32("clock-frequency", I2C_MAX_FAST_MODE_PLUS_FREQ),
> > > > +	{ }
> > > > +};
> > > > +
> > > > +static inline void xe_i2c_read_endpoint(struct xe_mmio *mmio, void *ep)
> > > > +{
> > > > +	u32 *val = ep;
> > > > +
> > > > +	val[0] = xe_mmio_read32(mmio, CLIENT_DISC_COOKIE);
> > > > +	val[1] = xe_mmio_read32(mmio, CLIENT_DISC_ADDRESS);
> > > > +}
> > > > +
> > > > +static void xe_i2c_client_work(struct work_struct *work)
> > > > +{
> > > > +	struct xe_i2c *i2c = container_of(work, struct xe_i2c, work);
> > > > +	struct i2c_board_info info = {
> > > > +		.type	= "amc",
> > > > +		.flags	= I2C_CLIENT_HOST_NOTIFY,
> > > > +		.addr	= i2c->ep.addr[1],
> > > > +	};
> > > > +
> > > > +	i2c->client[0] = i2c_new_client_device(i2c->adapter, &info);
> > > > +}
> > > > +
> > > > +static int xe_i2c_notifier(struct notifier_block *nb, unsigned long action, void *data)
> > > > +{
> > > > +	struct xe_i2c *i2c = container_of(nb, struct xe_i2c, bus_notifier);
> > > > +	struct i2c_adapter *adapter = i2c_verify_adapter(data);
> > > > +	struct device *dev = data;
> > > > +
> > > > +	if (action == BUS_NOTIFY_ADD_DEVICE &&
> > > > +	    adapter && dev->parent == &i2c->pdev->dev) {
> > > > +		i2c->adapter = adapter;
> > > > +		schedule_work(&i2c->work);
> > > > +		return NOTIFY_OK;
> > > > +	}
> > > > +
> > > > +	return NOTIFY_DONE;
> > > > +}
> > > > +
> > > > +static int xe_i2c_register_adapter(struct xe_i2c *i2c)
> > > > +{
> > > > +	struct pci_dev *pci = to_pci_dev(i2c->drm_dev);
> > > > +	struct platform_device *pdev;
> > > > +	struct fwnode_handle *fwnode;
> > > > +	int ret;
> > > > +
> > > > +	fwnode = fwnode_create_software_node(xe_i2c_adapter_properties, NULL);
> > > > +	if (!fwnode)
> > > > +		return -ENOMEM;
> > > > +
> > > > +	/*
> > > > +	 * Not using platform_device_register_full() here because we don't have
> > > > +	 * a handle to the platform_device before it returns. xe_i2c_notifier()
> > > > +	 * uses that handle, but it may be called before
> > > > +	 * platform_device_register_full() is done.
> > > > +	 */
> > > > +	pdev = platform_device_alloc(adapter_name, pci_dev_id(pci));
> > > > +	if (!pdev) {
> > > > +		ret = -ENOMEM;
> > > > +		goto err_fwnode_remove;
> > > > +	}
> > > > +
> > > > +	if (i2c->adapter_irq) {
> > > > +		struct resource	res = { };
> > > > +
> > > > +		res.start = i2c->adapter_irq;
> > > > +		res.name = "xe_i2c";
> > > > +		res.flags = IORESOURCE_IRQ;
> > > > +
> > > > +		ret = platform_device_add_resources(pdev, &res, 1);
> > > > +		if (ret)
> > > > +			goto err_pdev_put;
> > > > +	}
> > > > +
> > > > +	pdev->dev.parent = i2c->drm_dev;
> > > > +	pdev->dev.fwnode = fwnode;
> > > > +	i2c->adapter_node = fwnode;
> > > > +	i2c->pdev = pdev;
> > > > +
> > > > +	ret = platform_device_add(pdev);
> > > > +	if (ret)
> > > > +		goto err_pdev_put;
> > > > +
> > > > +	return 0;
> > > > +
> > > > +err_pdev_put:
> > > > +	platform_device_put(pdev);
> > > > +err_fwnode_remove:
> > > > +	fwnode_remove_software_node(fwnode);
> > > > +
> > > > +	return ret;
> > > > +}
> > > > +
> > > > +static void xe_i2c_unregister_adapter(struct xe_i2c *i2c)
> > > > +{
> > > > +	platform_device_unregister(i2c->pdev);
> > > > +	fwnode_remove_software_node(i2c->adapter_node);
> > > > +}
> > > > +
> > > > +void xe_i2c_irq_handler(struct xe_device *xe, u32 master_ctl)
> > > > +{
> > > > +	if (!xe->i2c || !xe->i2c->adapter_irq)
> > > > +		return;
> > > > +
> > > > +	if (master_ctl & I2C_IRQ)
> > > > +		generic_handle_irq_safe(xe->i2c->adapter_irq);
> > > > +}
> > > > +
> > > > +static int xe_i2c_irq_map(struct irq_domain *h, unsigned int virq,
> > > > +			  irq_hw_number_t hw_irq_num)
> > > > +{
> > > > +	irq_set_chip_and_handler(virq, &dummy_irq_chip, handle_simple_irq);
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +static const struct irq_domain_ops xe_i2c_irq_ops = {
> > > > +	.map = xe_i2c_irq_map,
> > > > +};
> > > > +
> > > > +static int xe_i2c_create_irq(struct xe_i2c *i2c)
> > > > +{
> > > > +	struct irq_domain *domain;
> > > > +
> > > > +	if (!(i2c->ep.capabilities & XE_I2C_EP_CAP_IRQ))
> > > > +		return 0;
> > > > +
> > > > +	domain = irq_domain_create_linear(dev_fwnode(i2c->drm_dev), 1, &xe_i2c_irq_ops, NULL);
> > > > +	if (!domain)
> > > > +		return -ENOMEM;
> > > > +
> > > > +	i2c->adapter_irq = irq_create_mapping(domain, 0);
> > > > +	i2c->irqdomain = domain;
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +static void xe_i2c_remove_irq(struct xe_i2c *i2c)
> > > > +{
> > > > +	if (i2c->irqdomain) {
> > > > +		irq_dispose_mapping(i2c->adapter_irq);
> > > > +		irq_domain_remove(i2c->irqdomain);
> > > > +	}
> > > > +}
> > > > +
> > > > +static int xe_i2c_read(void *context, unsigned int reg, unsigned int *val)
> > > > +{
> > > > +	struct xe_i2c *i2c = context;
> > > > +
> > > > +	*val = xe_mmio_read32(i2c->mmio, XE_REG(reg + I2C_MEM_SPACE_OFFSET));
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +static int xe_i2c_write(void *context, unsigned int reg, unsigned int val)
> > > > +{
> > > > +	struct xe_i2c *i2c = context;
> > > > +
> > > > +	xe_mmio_write32(i2c->mmio, XE_REG(reg + I2C_MEM_SPACE_OFFSET), val);
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +static const struct regmap_config i2c_regmap_config = {
> > > > +	.reg_bits = 32,
> > > > +	.val_bits = 32,
> > > > +	.reg_read = xe_i2c_read,
> > > > +	.reg_write = xe_i2c_write,
> > > > +	.fast_io = true,
> > > > +};
> > > > +
> > > > +static void xe_i2c_remove(void *data)
> > > > +{
> > > > +	struct xe_i2c *i2c = data;
> > > > +	int i;
> > > > +
> > > > +	for (i = 0; i < XE_I2C_MAX_CLIENTS; i++)
> > > > +		i2c_unregister_device(i2c->client[i]);
> > > > +
> > > > +	bus_unregister_notifier(&i2c_bus_type, &i2c->bus_notifier);
> > > > +	xe_i2c_unregister_adapter(i2c);
> > > > +	xe_i2c_remove_irq(i2c);
> > > > +}
> > > > +
> > > > +int xe_i2c_probe(struct xe_device *xe)
> > > 
> > > could you please add some /** DOC: Xe i2c ... above
> > > and then add some doc to the exported functions?
> > 
> > Sure thing. But just to be clear to everyone, there no are exported
> > functions here (global but not exported).
> 
> sorry for my terminology confusion, but I meant global. Accessible by
> other xe_ components. We try to keep all the internal abi documented
> to help future developers touching the same code later.

Got it. I'll add the documentation.

thanks,

-- 
heikki
