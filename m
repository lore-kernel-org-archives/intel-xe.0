Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71448C369BD
	for <intel-xe@archiver.kernel.org>; Wed, 16 Apr 2025 10:58:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FD9310E097;
	Wed, 16 Apr 2025 10:58:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WQqv8GzK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 303E810E8D4
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Apr 2025 10:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744801112; x=1776337112;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=6K4YO7uxKmJYoAXEJU6ZdTsEzyrxGk7Ns6XA4KXcT7Y=;
 b=WQqv8GzKAgzWRbGLDESRSjH33kGJxcmX4aqsqq0tI0MpQQJEtsLXwA6n
 Jrv46MZQ/rOEvKPuYF/6oEo2NyE7LohUUtfiguQPDRBfCxVNaHwSMlyIT
 YUCDoqU1asGF/RSlX1UQ7fm7F3iGvHHIMhvCO1P+f+XYD+GHxDq3MvD0A
 +zI5R882fKE0U4jcsWL30QMjYglpodH6BTWdbWZk4Nac0NpdcZDThyi7m
 /S3DjlHP0FHPyON4h8OsNsfKN6ajGICkmbXXXDE2rVAagySER5ZDKxkuO
 gt0unKvU8HjZZnVW7Fn4MjvEasd2PSKZjQzmZv2qTGaLFqbPmTUdPhe62 g==;
X-CSE-ConnectionGUID: cNmOkoDqS1qgW5xFbilGJg==
X-CSE-MsgGUID: qXNuf1olT8CXDZE3cxCI4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="46263491"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; d="scan'208";a="46263491"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 03:58:31 -0700
X-CSE-ConnectionGUID: VpnbJsW6R0S9hptmpHvCnQ==
X-CSE-MsgGUID: Z53ECiSaSie/zJP+4pAMtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; d="scan'208";a="153633273"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 03:58:29 -0700
Date: Wed, 16 Apr 2025 13:58:26 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com
Subject: Re: [PATCH v2 2/3] drm/xe: Expose PCIe Gen4 downspeed attributes
Message-ID: <Z_-NUpQjdXIqrP_9@black.fi.intel.com>
References: <20250403174742.1294227-1-raag.jadav@intel.com>
 <20250403174742.1294227-3-raag.jadav@intel.com>
 <d98a6b4b-1b14-4dbc-8833-e39c846a3b12@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d98a6b4b-1b14-4dbc-8833-e39c846a3b12@intel.com>
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

On Wed, Apr 16, 2025 at 03:36:55PM +0530, Riana Tauro wrote:
> Hi Raag
> 
> On 4/3/2025 11:17 PM, Raag Jadav wrote:
> > Expose sysfs attributes for PCIe Gen4 downspeed capability and status.
> > 
> > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_device_sysfs.c | 86 ++++++++++++++++++++++++++++
> >   drivers/gpu/drm/xe/xe_pcode_api.h    |  5 ++
> >   2 files changed, 91 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
> > index d4c73acea1cf..4e6175907832 100644
> > --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
> > +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
> > @@ -11,6 +11,9 @@
> >   #include "xe_device.h"
> >   #include "xe_device_sysfs.h"
> > +#include "xe_mmio.h"
> > +#include "xe_pcode_api.h"
> > +#include "xe_pcode.h"
> >   #include "xe_pm.h"
> >   /**
> > @@ -63,12 +66,85 @@ vram_d3cold_threshold_store(struct device *dev, struct device_attribute *attr,
> >   static DEVICE_ATTR_RW(vram_d3cold_threshold);
> > +/**
> > + * DOC: PCIe Gen5 Update Limitations
> > + *
> > + * Default link speed of discrete GPUs is determined by FIT parameters stored
> > + * in their flash memory, which are subject to override through user initiated
> > + * firmware updates. It has been observed that devices configured with PCIe
> > + * Gen5 as their default speed can come across link quality issues due to host
> > + * or motherboard limitations and may have to auto-downspeed to PCIe Gen4 when
> > + * faced with unstable link at Gen5. The users are required to ensure that the
> > + * device is capable of auto-downspeeding to PCIe Gen4 link before pushing the
> > + * image with Gen5 as default configuration. This can be done by reading
> > + * ``pcie_gen4_downspeed_capable`` sysfs entry, which will denote PCIe Gen4
> > + * downspeed capability of the device with boolean output value of ``0`` or
> > + * ``1``, meaning `incapable` or `capable` respectively.
> > + *
> > + * .. code-block:: shell
> > + *
> > + *    $ cat /sys/bus/pci/devices/<bdf>/pcie_gen4_downspeed_capable
> > + *
> > + * Pushing PCIe Gen5 update on a downspeed incapable device and facing link
> > + * instability due to host or motherboard limitations can result in driver not
> > + * being able to successfully bind to the device, making further firmware
> > + * updates impossible with RMA being the only last resort.
> > + *
> > + * Link downspeed status of PCIe Gen4 downspeed capable devices is available
> > + * through ``pcie_gen4_downspeed_status`` sysfs entry with boolean output value
> > + * of ``0`` or ``1``, where ``0`` means no auto-downspeeding was required during
> > + * link training (which is the optimal scenario) and ``1`` means the device has
> > + * auto-downsped to PCIe Gen4 due to unstable Gen5 link.
> > + *
> > + * .. code-block:: shell
> > + *
> > + *    $ cat /sys/bus/pci/devices/<bdf>/pcie_gen4_downspeed_status
> Why downspeed? Shouldn't it be downgrade?

It's distinguishable.
https://lore.kernel.org/intel-xe/Z-4CxE_CDYHk_nxS@black.fi.intel.com/

> > +static ssize_t
> > +pcie_gen4_downspeed_capable_show(struct device *dev, struct device_attribute *attr, char *buf)
> > +{
> > +	struct pci_dev *pdev = to_pci_dev(dev);
> > +	struct xe_device *xe = pdev_to_xe_device(pdev);
> > +	u32 cap, val;
> > +
> > +	xe_pm_runtime_get(xe);
> > +	val = xe_mmio_read32(xe_root_tile_mmio(xe), BMG_PCIE4_CAP);
> > +	xe_pm_runtime_put(xe);
> > +
> > +	cap = REG_FIELD_GET(PCIE4_DOWNSPEED, val);
> > +	return sysfs_emit(buf, "%u\n", cap == DOWNSPEED_CAPABLE ? true : false);
> > +}
> > +static DEVICE_ATTR_RO(pcie_gen4_downspeed_capable);
> > +
> > +static ssize_t
> > +pcie_gen4_downspeed_status_show(struct device *dev, struct device_attribute *attr, char *buf)
> > +{
> > +	struct pci_dev *pdev = to_pci_dev(dev);
> > +	struct xe_device *xe = pdev_to_xe_device(pdev);
> > +	u32 val;
> > +	int ret;
> > +
> > +	xe_pm_runtime_get(xe);
> > +	ret = xe_pcode_read(xe_device_get_root_tile(xe), PCODE_MBOX(DGFX_PCODE_STATUS,
> > +			    DGFX_GET_INIT_STATUS, 0), &val, NULL);
> indentation

Can you please elaborate? Shouldn't it follow the parentheses?

> +	xe_pm_runtime_put(xe);
> > +
> > +	return ret ?: sysfs_emit(buf, "%u\n", REG_FIELD_GET(DGFX_PCIE4_DOWNSPEED_STATUS, val));
> > +}
> > +static DEVICE_ATTR_RO(pcie_gen4_downspeed_status);
> > +
> >   static void xe_device_sysfs_fini(void *arg)
> >   {
> >   	struct xe_device *xe = arg;
> >   	if (xe->d3cold.capable)
> >   		sysfs_remove_file(&xe->drm.dev->kobj, &dev_attr_vram_d3cold_threshold.attr);
> > +
> > +	if (xe->info.platform == XE_BATTLEMAGE) {
> > +		sysfs_remove_file(&xe->drm.dev->kobj, &dev_attr_pcie_gen4_downspeed_capable.attr);
> > +		sysfs_remove_file(&xe->drm.dev->kobj, &dev_attr_pcie_gen4_downspeed_status.attr);
> > +	}
> >   }
> >   int xe_device_sysfs_init(struct xe_device *xe)
> > @@ -82,5 +158,15 @@ int xe_device_sysfs_init(struct xe_device *xe)
> >   			return ret;
> >   	}
> > +	if (xe->info.platform == XE_BATTLEMAGE) {
> > +		ret = sysfs_create_file(&dev->kobj, &dev_attr_pcie_gen4_downspeed_capable.attr);
> > +		if (ret)
> > +			return ret;
> > +
> > +		ret = sysfs_create_file(&dev->kobj, &dev_attr_pcie_gen4_downspeed_status.attr);
> > +		if (ret)
> > +			return ret;
> > +	}
> This should be create_files. If second one fails, none of the other files
> are removed.

Sure.

Raag
