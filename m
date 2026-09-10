Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C0BBC79FB7
	for <intel-xe@archiver.kernel.org>; Thu, 10 Sep 2026 06:27:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2517E10E24E;
	Thu, 10 Sep 2026 06:27:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nh/yH5iY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA08A10E24E
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Sep 2026 06:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789021669; x=1820557669;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=UZ6MNakcTd1n2XzNUzqgEn/kQV4rDZNBIvFTvURFi6I=;
 b=Nh/yH5iYOLGzKNXjbL7j81neF3zvIJYCmpMbM5XaBoEBoUGtHCPYa+xm
 3nYTAxhKkHS1+Vq4S7sy0w87oCSkZLMDNMQ/vxotk81Q2+EcrGJiM7FOa
 cO0FjKgxHV6qtlsrDwrlpK5tg9jXutAey06SUoLALXArAcmMoORkFrA4u
 ciGLJoKk9puOuD3f0dpcSsoZdsHx8s6pMDqKmXf6VjU4VAKumOdKr02Xx
 +sM6TXtGJDwNg3lMJSfgMS674xmJvcp278Khm6SgiiOsIrqvcHS6dPC5n
 uDgmWPxt8dTZya5H158V1nIWwx7dxkqR/z3b7NmRN3pgKihv+wWLOlXe5 w==;
X-CSE-ConnectionGUID: Z4/sCJDyQuK7x2v22X4I2Q==
X-CSE-MsgGUID: e6K5DkfMQjyCuYOTZ+Nq6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="99791413"
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; d="scan'208";a="99791413"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 23:27:49 -0700
X-CSE-ConnectionGUID: OA7X1bvjTQOslpCfcrWoaQ==
X-CSE-MsgGUID: cH3R3ZtoSJ2cTwL3E5+K9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; d="scan'208";a="267250261"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 23:27:46 -0700
Date: Thu, 10 Sep 2026 08:27:44 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, daniele.ceraolospurio@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, michal.wajdeczko@intel.com,
 himal.prasad.ghimiray@intel.com, arvind.yadav@intel.com,
 syed.abdul.muqthyar.ahmed@intel.com, nitin.r.gote@intel.com
Subject: Re: [PATCH v3 07/12] drm/xe/cper: Log CPER records for aggregate
 counter retrival
Message-ID: <aqJN4Gfv7cG8viB1@black.igk.intel.com>
References: <20260906172604.2215987-14-badal.nilawar@intel.com>
 <20260906172604.2215987-21-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260906172604.2215987-21-badal.nilawar@intel.com>
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

On Sun, Sep 06, 2026 at 10:56:12PM +0530, Badal Nilawar wrote:
> Log CPER records for aggregate counter retrieval from userspace
> when cper_on_query sysfs is enabled.
> 
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_drm_ras_types.h |  3 +
>  drivers/gpu/drm/xe/xe_ras.c           | 91 ++++++++++++++++++++++++++-
>  2 files changed, 93 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_drm_ras_types.h b/drivers/gpu/drm/xe/xe_drm_ras_types.h
> index 0be218ba2db7..8fb5d6457c53 100644
> --- a/drivers/gpu/drm/xe/xe_drm_ras_types.h
> +++ b/drivers/gpu/drm/xe/xe_drm_ras_types.h
> @@ -46,6 +46,9 @@ struct xe_drm_ras {
>  
>  	/** @disable_vram_page_offline: cached configfs policy, immutable after init */
>  	bool disable_vram_page_offline;
> +
> +	/** @cper_on_query: emit a CPER record on each counter query */
> +	bool cper_on_query;

Nack, cper is unrelated to drm_ras and should not be mixed here.
This belongs to xe_device with its own state that is maintained
as something like struct xe_cper.

Same goes for disable_vram_page_offline, but that I think is upto
the maintainers.

>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 7e3e62750448..288dbc0942f5 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -4,6 +4,7 @@
>   */
>  
>  #include "xe_configfs.h"
> +#include "xe_cper.h"
>  #include "xe_debugfs.h"
>  #include "xe_device.h"
>  #include "xe_drm_ras.h"
> @@ -199,6 +200,34 @@ static inline const char *comp_to_str(u8 component)
>  	return xe_ras_components[component];
>  }
>  
> +static u32 ras_comp_to_hw_sigid(u8 component)

All the switcheroos are above sev_to_str(), it'd be quite sad for these
to be left alone here.

> +{
> +	switch (component) {
> +	case XE_RAS_COMP_DEVICE_MEMORY:
> +		return XE_SIGID_DEVICE_MEMORY;
> +	case XE_RAS_COMP_CORE_COMPUTE:
> +		return XE_SIGID_CORE_COMPUTE;
> +	case XE_RAS_COMP_PCIE:
> +		return XE_SIGID_PCIE;
> +	case XE_RAS_COMP_FABRIC:
> +		return XE_SIGID_FABRIC;
> +	case XE_RAS_COMP_SOC_INTERNAL:
> +		return XE_SIGID_SOC_INTERNAL;
> +	default:
> +		return U32_MAX;
> +	}
> +}
> +
> +static u8 ras_sev_to_cper_sev(u8 ras_sev)

Ditto.

> +{
> +	switch (ras_sev) {
> +	case XE_RAS_SEV_CORRECTABLE:   return CPER_SEV_CORRECTED;
> +	case XE_RAS_SEV_UNCORRECTABLE: return CPER_SEV_RECOVERABLE;
> +	case XE_RAS_SEV_INFORMATIONAL: return CPER_SEV_INFORMATIONAL;
> +	default:                       return CPER_SEV_RECOVERABLE;

I like this formatting but these should be consistent with similar existing
switcheroos. So whatever your preference, please make all of them consistent.

> +	}
> +}
> +
>  static struct pci_dev *find_usp_dev(struct pci_dev *pdev)
>  {
>  	struct pci_dev *vsp;
> @@ -612,6 +641,7 @@ enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
>   */
>  int xe_ras_get_counter(struct xe_device *xe, u8 severity, u8 component, u32 *value)
>  {
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>  	struct xe_ras_error_class counter = {0};
>  	struct xe_ras_get_counter_response response = {0};
>  	int ret;
> @@ -623,8 +653,13 @@ int xe_ras_get_counter(struct xe_device *xe, u8 severity, u8 component, u32 *val
>  	ret = xe_ras_get_counter_response(xe, &counter, &response);
>  	if (ret)
>  		return ret;
> -

Why?

>  	*value = response.value;
> +
> +	if (xe->ras.cper_on_query)
> +		xe_emit_hardware_error_cper(pdev, ras_sev_to_cper_sev(counter.common.severity),
> +					    ras_comp_to_hw_sigid(counter.common.component),
> +					    (struct xe_ras_error_class *)&counter,
> +					    (struct xe_ras_get_counter_response *)&response);

Why the casting? What changed?

>  	return 0;
>  }
>  
> @@ -1069,6 +1104,56 @@ static const struct attribute_group gpu_health_group = {
>  	.attrs = gpu_health_attrs,
>  };
>  
> +static ssize_t cper_on_query_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	struct xe_device *xe = kdev_to_xe_device(dev);
> +
> +	return sysfs_emit(buf, "%u\n", xe->ras.cper_on_query);
> +}
> +
> +static ssize_t cper_on_query_store(struct device *dev, struct device_attribute *attr,
> +				   const char *buf, size_t count)
> +{
> +	struct xe_device *xe = kdev_to_xe_device(dev);
> +	bool enable;
> +	int ret;
> +
> +	ret = kstrtobool(buf, &enable);
> +	if (ret)
> +		return ret;
> +
> +	xe->ras.cper_on_query = enable;
> +
> +	return count;
> +}
> +static DEVICE_ATTR_ADMIN_RW(cper_on_query);
> +
> +static struct attribute *cper_on_query_attrs[] = {
> +	&dev_attr_cper_on_query.attr,
> +	NULL
> +};
> +
> +/**
> + * DOC: CPER on query

Is this actually hooked to the docs?

> + *
> + * On Intel Xe platforms that support the RAS error reporting interface,
> + * the driver can emit a CPER (Common Platform Error Record) each time an
> + * error counter is queried. This behaviour is controlled through the
> + * following sysfs attribute::
> + *
> + *     /sys/bus/pci/devices/<device>/cper_on_query
> + *
> + * The attribute is a boolean (``0`` or ``1``). When set to ``1``, every
> + * counter query emits a CPER record built from the associated info queue
> + * data; when set to ``0`` (default) no record is emitted on query.
> + *
> + * Reading the attribute is available to all users and returns the current
> + * setting, whereas writing is restricted to administrative users.
> + */
> +static const struct attribute_group cper_on_query_group = {
> +	.attrs = cper_on_query_attrs,
> +};
> +
>  /**
>   * xe_ras_init - Initialize Xe RAS
>   * @xe: xe device instance
> @@ -1098,4 +1183,8 @@ void xe_ras_init(struct xe_device *xe)
>  	ret = devm_device_add_group(xe->drm.dev, &gpu_health_group);
>  	if (ret)
>  		xe_err(xe, "Failed to create GPU health sysfs, err=%d\n", ret);
> +
> +	ret = devm_device_add_group(xe->drm.dev, &cper_on_query_group);
> +	if (ret)
> +		xe_err(xe, "Failed to create cper_on_query sysfs, err=%d\n", ret);

I really dislike that we're ignoring error here. Same was done with
gpu_health_group. I know they're non-fatal but it just makes them
harder to root cause when something else breaks as a side-effect of
this. But again, not my call.

Raag

>  }
> -- 
> 2.54.0
> 
