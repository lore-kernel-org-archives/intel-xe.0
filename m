Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DD39CA5FD2
	for <intel-xe@archiver.kernel.org>; Thu,  1 Oct 2026 14:54:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCE5B10F6CC;
	Thu,  1 Oct 2026 14:54:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WWPnEgLV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB1BE10F6CC
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Oct 2026 14:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790866474; x=1822402474;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=GGPXe71Y8LhpSzC0yLGIheVCyoKTA9rdGqvQBoZFI+8=;
 b=WWPnEgLVaOaEdNGK5HZ/AY387vDTcKbTPkqX1+twrwL0SkhnMZ4b9qVw
 U0Ehu7YaRi8fE5yo8iqUqPCd2KwJxo3XmYokB383o4alDGtp7MqJR3vYy
 +MYPK34GQq7ZGjvoNhJ6UFVdeY6mun2CAEeDG6PL8TrgyX9dxGe7L2GkU
 WK0oaX6j17v+pQwJxIh5+aAzDT+/d6z81gQtFlKRp0MhzJuJAh6K9x8z0
 SwUGqAQyOKsXFiScjPHhGy5m/cZOPsIePPIgjHisHRM/WSDEixm2bNH7m
 xLMObVki+gSvqfqVn2r5AQ1N2/ig36zg9QHTepk/UIMFqSOqKHvw6BzSD w==;
X-CSE-ConnectionGUID: QGtebUmzTe6Jj/4XJTcX0Q==
X-CSE-MsgGUID: gqZ+wo6rTNWQNmFTz9ptkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="117155264"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="117155264"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 07:54:34 -0700
X-CSE-ConnectionGUID: TJjnmF7iSniirEErUQUVYg==
X-CSE-MsgGUID: 11ogy7+bQm6bWum1LQuN6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="272436963"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.111])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 07:54:32 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>, intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com, raag.jadav@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, heikki.krogerus@linux.intel.com,
 himal.prasad.ghimiray@intel.com
Subject: Re: [PATCH v3] drm/xe/i2c: Expose AMC Alert reason sysfs
In-Reply-To: <20261001121302.4102629-2-badal.nilawar@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261001121302.4102629-2-badal.nilawar@intel.com>
Date: Thu, 01 Oct 2026 17:54:29 +0300
Message-ID: <0ce399b0e0e23f168d5b916cbdcf60ad6fc058c3@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Thu, 01 Oct 2026, Badal Nilawar <badal.nilawar@intel.com> wrote:
> AMC raises an SMBUS alert before performing a power removal or
> power-cycle operation. The xe driver then places the device into
> vendor-specific wedge mode until the recovery is performed.
>
> Expose a read-only xe_amc_alert_reason sysfs attribute to help users
> identify the required recovery action.
>
> Assisted-by: Claude:claude-opus-4.8
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
> v2:
>  - Created sysfs during i2c probe time
>  - Fix Documentation (Rodrigo)
> v3:
>  - Keep limited information in "DOC:" section (Michal)
>  - Handle AMC alert none and unknown cases, document
>    in ABI
>  - Clear i2c->amc on sysfs creation failure (Sashiko)
> v4:
>  - Fix sashiko comments
>  - Fix review comments (Michal)
> ---
>  .../ABI/testing/sysfs-driver-intel-xe-amc     | 24 ++++++
>  drivers/gpu/drm/xe/xe_amc.c                   | 82 ++++++++++++++++---
>  2 files changed, 96 insertions(+), 10 deletions(-)
>  create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-amc
>
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-amc b/Documentation/ABI/testing/sysfs-driver-intel-xe-amc
> new file mode 100644
> index 000000000000..34927fa5dcfe
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-amc
> @@ -0,0 +1,24 @@
> +What:		/sys/bus/pci/drivers/xe/.../xe_amc_alert_reason
> +Date:		October 2026
> +KernelVersion:	7.4
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:
> +		This file exposes the reason for the most recent Add-In
> +		Management Controller (AMC) alert on supported Intel Xe platforms.
> +
> +		An AMC alert is delivered via an SMBUS interrupt and causes the
> +		device to be wedged, requiring vendor-specific recovery.
> +		The attribute is read-only and  available to all users.
> +
> +		Read returns a single line containing one of the following
> +		alert reasons:
> +
> +			"none"
> +				No AMC alert has been received
> +			"unknown"
> +				AMC alert received but with unknown reason
> +			"firmware_download"
> +			"thermal_trip"
> +			"oob_request"
> +			"oob_reset"
> +			"catastrophic"
> diff --git a/drivers/gpu/drm/xe/xe_amc.c b/drivers/gpu/drm/xe/xe_amc.c
> index edd50bf8261e..7f21044fd1b7 100644
> --- a/drivers/gpu/drm/xe/xe_amc.c
> +++ b/drivers/gpu/drm/xe/xe_amc.c
> @@ -18,6 +18,7 @@
>  #include "xe_device.h"
>  #include "xe_i2c.h"
>  #include "xe_mmio.h"
> +#include "xe_printk.h"
>  
>  /**
>   * DOC: Add-In Management Controller (AMC)
> @@ -46,16 +47,19 @@ enum xe_amc_alert {
>  };
>  
>  static const char * const amc_alert[] = {
> -	[AMC_ALERT_FW_DOWNLOAD]		= "Firmware Download",
> -	[AMC_ALERT_THERMAL_TRIP]	= "Thermal Trip",
> -	[AMC_ALERT_OOB_REQUEST]		= "OOB Request",
> -	[AMC_ALERT_OOB_RESET]		= "OOB Reset",
> -	[AMC_ALERT_CATERR]		= "Catastrophic",
> +	[AMC_ALERT_UNKNOWN]		= "unknown",
> +	[AMC_ALERT_FW_DOWNLOAD]		= "firmware_download",
> +	[AMC_ALERT_THERMAL_TRIP]	= "thermal_trip",
> +	[AMC_ALERT_OOB_REQUEST]		= "oob_request",
> +	[AMC_ALERT_OOB_RESET]		= "oob_reset",
> +	[AMC_ALERT_CATERR]		= "catastrophic",
>  };
>  
>  struct xe_amc {
>  	struct xe_i2c *i2c;
>  	struct work_struct work;
> +	u8 alert_reason;

Why u8 instead of enum xe_amc_alert?

> +	bool alert_seen;
>  };
>  
>  struct amc_header {
> @@ -104,6 +108,45 @@ static const struct amc_request amc_get_alert_reason = {
>  	},
>  };
>  
> +/**
> + * DOC: AMC Alert Reason
> + *
> + * Expose AMC alert reason through device sysfs
> + *
> + * See Documentation/ABI/testing/sysfs-driver-intel-xe-amc for the ABI
> + * specification.
> + */
> +
> +static ssize_t amc_alert_reason_show(struct device *dev,
> +				     struct device_attribute *attr, char *buf)
> +{
> +	struct xe_device *xe = pdev_to_xe_device(to_pci_dev(dev));
> +	struct xe_amc *amc = xe->i2c->amc;
> +	u8 alert_reason;
> +
> +	if (!amc->alert_seen)
> +		return sysfs_emit(buf, "none\n");
> +
> +	alert_reason = READ_ONCE(amc->alert_reason);
> +
> +	return sysfs_emit(buf, "%s\n", amc_alert[alert_reason]);

Please add a function for returning amc alert reason,
e.g. amc_alert_reason(). You'll thank me later.

> +}
> +static DEVICE_ATTR_RO(amc_alert_reason);
> +
> +static void amc_remove_alert_sysfs(struct xe_i2c *i2c)
> +{
> +	struct device *dev = i2c->drm_dev;
> +
> +	device_remove_file(dev, &dev_attr_amc_alert_reason);
> +}
> +
> +static int amc_create_alert_sysfs(struct xe_i2c *i2c)
> +{
> +	struct device *dev = i2c->drm_dev;
> +
> +	return device_create_file(dev, &dev_attr_amc_alert_reason);
> +}
> +
>  static void xe_amc_work(struct work_struct *work)
>  {
>  	const struct amc_request *request = &amc_get_alert_reason;
> @@ -153,17 +196,26 @@ static void xe_amc_work(struct work_struct *work)
>  out_reassert_interrupt:
>  	xe_mmio_rmw32(amc->i2c->mmio, I2C_CONFIG_CMD, PCI_COMMAND_INTX_DISABLE, 0);
>  
> +	amc->alert_seen = true;
> +
>  	switch (alert_reason) {
>  	case AMC_ALERT_FW_DOWNLOAD:
>  	case AMC_ALERT_THERMAL_TRIP:
>  	case AMC_ALERT_OOB_REQUEST:
>  	case AMC_ALERT_OOB_RESET:
> -	case AMC_ALERT_CATERR:
> -		dev_warn(amc->i2c->drm_dev, "AMC Alert: %s\n", amc_alert[alert_reason]);
> -		xe_device_declare_wedged(i2c_client_to_xe_device(client));
> +	case AMC_ALERT_CATERR: {
> +		struct xe_device *xe = i2c_client_to_xe_device(client);
> +
> +		WRITE_ONCE(amc->alert_reason, alert_reason);
> +		dev_warn(amc->i2c->drm_dev,
> +			 "AMC Alert: %s (%u)\n", amc_alert[alert_reason], alert_reason);
> +		xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_VENDOR);
> +		xe_device_declare_wedged(xe);
>  		break;
> +	}
>  	default:
> -		dev_warn(amc->i2c->drm_dev, "unknown AMC alert: %d\n", alert_reason);
> +		WRITE_ONCE(amc->alert_reason, AMC_ALERT_UNKNOWN);
> +		dev_warn(amc->i2c->drm_dev, "AMC Alert: unknown (%u)\n", alert_reason);
>  		break;
>  	}
>  }
> @@ -176,6 +228,7 @@ void xe_amc_handle_alert(struct xe_i2c *i2c)
>  int xe_amc_init(struct xe_i2c *i2c)
>  {
>  	struct xe_amc *amc;
> +	int ret;
>  
>  	amc = kzalloc_obj(*amc);
>  	if (!amc)
> @@ -185,13 +238,22 @@ int xe_amc_init(struct xe_i2c *i2c)
>  	i2c->amc = amc;
>  	amc->i2c = i2c;
>  
> -	return 0;
> +	amc->alert_seen = false;
> +	ret = amc_create_alert_sysfs(i2c);
> +	if (ret) {
> +		kfree(i2c->amc);
> +		i2c->amc = NULL;
> +	}
> +
> +	return ret;
>  }
>  
>  void xe_amc_exit(struct xe_i2c *i2c)
>  {
>  	if (i2c->amc) {
> +		amc_remove_alert_sysfs(i2c);
>  		cancel_work_sync(&i2c->amc->work);
>  		kfree(i2c->amc);
> +		i2c->amc = NULL;
>  	}
>  }

-- 
Jani Nikula, Intel
