Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6AD2CA0EC4
	for <intel-xe@archiver.kernel.org>; Tue, 12 Aug 2025 13:05:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BE6410E3F5;
	Tue, 12 Aug 2025 13:05:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C9feRnSh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F13110E3F5
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Aug 2025 13:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755003931; x=1786539931;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=08uWTbeHMSQ9UKHJNx/zFh5UwCuhA53dT3AecdSvREk=;
 b=C9feRnShlu5Z2KgmjLyrsLTwkMBAWgWFDaOT+6IP6ORm1h0BJUefZ177
 NJ1PrwqKySe4FbFemoVc+1lW+gE10c9Np/O04ya6TXEGon/x8dJyGe6t5
 0MNEXN4aWuqdAYmYYgBQDZrCdKdZ8XLj9cflE6zL7lPovnOguHOPk1MyD
 qg5WY2KSCw3gCI8L4dRndCV8uDKkiI2hCBjQjdnS4tQkW14lETz1AqNSa
 4ivHSZaInq/e15+I2KgXJ3gDBye4T2hLtzZo3+RKRANOWWI26qfSDdY5g
 WGTolkkpwx95+g80cPudwU2wwRwxDhfKNsZDIdoAT5fpksqWafV9yDRmS Q==;
X-CSE-ConnectionGUID: ap/0hqRQTOuhfEMC9tl/dw==
X-CSE-MsgGUID: jkGiDMbrSgS9bluGG+iGBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="79849597"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; d="scan'208";a="79849597"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2025 06:05:31 -0700
X-CSE-ConnectionGUID: yuGtytMGTzS07dAnVRIOqA==
X-CSE-MsgGUID: x/0BTlr4Tdaxah1SIb8/mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; d="scan'208";a="203385510"
Received: from kuha.fi.intel.com ([10.237.72.152])
 by orviesa001.jf.intel.com with SMTP; 12 Aug 2025 06:05:29 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation);
 Tue, 12 Aug 2025 16:05:27 +0300
Date: Tue, 12 Aug 2025 16:05:27 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 intel-xe@lists.freedesktop.org, riana.tauro@intel.com
Subject: Re: [PATCH v1] drm/xe/i2c: Introduce xe_i2c_present()
Message-ID: <aJs8F1gFEhKszBD1@kuha.fi.intel.com>
References: <20250812122646.1178231-1-raag.jadav@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250812122646.1178231-1-raag.jadav@intel.com>
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

On Tue, Aug 12, 2025 at 05:56:46PM +0530, Raag Jadav wrote:
> In preparation of wider usecases which require checking for I2C
> controller presence, introduce xe_i2c_present() helper.
> 
> Suggested-by: Riana Tauro <riana.tauro@intel.com>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>

LGTM. FWIW:

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/gpu/drm/xe/xe_i2c.c | 18 ++++++++++++++++--
>  drivers/gpu/drm/xe/xe_i2c.h |  2 ++
>  2 files changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
> index bc7dc2099470..6534ec5de6dc 100644
> --- a/drivers/gpu/drm/xe/xe_i2c.c
> +++ b/drivers/gpu/drm/xe/xe_i2c.c
> @@ -146,6 +146,20 @@ static void xe_i2c_unregister_adapter(struct xe_i2c *i2c)
>  	fwnode_remove_software_node(i2c->adapter_node);
>  }
>  
> +/**
> + * xe_i2c_present: I2C controller is present and functional
> + * @xe: xe device instance
> + *
> + * Check whether the I2C controller is present and functioning with valid
> + * endpoint cookie.
> + *
> + * Return: %true if present, %false otherwise.
> + */
> +bool xe_i2c_present(struct xe_device *xe)
> +{
> +	return xe->i2c && xe->i2c->ep.cookie == XE_I2C_EP_COOKIE_DEVICE;
> +}
> +
>  /**
>   * xe_i2c_irq_handler: Handler for I2C interrupts
>   * @xe: xe device instance
> @@ -230,7 +244,7 @@ void xe_i2c_pm_suspend(struct xe_device *xe)
>  {
>  	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
>  
> -	if (!xe->i2c || xe->i2c->ep.cookie != XE_I2C_EP_COOKIE_DEVICE)
> +	if (!xe_i2c_present(xe))
>  		return;
>  
>  	xe_mmio_rmw32(mmio, I2C_CONFIG_PMCSR, PCI_PM_CTRL_STATE_MASK, (__force u32)PCI_D3hot);
> @@ -241,7 +255,7 @@ void xe_i2c_pm_resume(struct xe_device *xe, bool d3cold)
>  {
>  	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
>  
> -	if (!xe->i2c || xe->i2c->ep.cookie != XE_I2C_EP_COOKIE_DEVICE)
> +	if (!xe_i2c_present(xe))
>  		return;
>  
>  	if (d3cold)
> diff --git a/drivers/gpu/drm/xe/xe_i2c.h b/drivers/gpu/drm/xe/xe_i2c.h
> index b767ed8ce52b..ecd5f10358e2 100644
> --- a/drivers/gpu/drm/xe/xe_i2c.h
> +++ b/drivers/gpu/drm/xe/xe_i2c.h
> @@ -49,11 +49,13 @@ struct xe_i2c {
>  
>  #if IS_ENABLED(CONFIG_I2C)
>  int xe_i2c_probe(struct xe_device *xe);
> +bool xe_i2c_present(struct xe_device *xe);
>  void xe_i2c_irq_handler(struct xe_device *xe, u32 master_ctl);
>  void xe_i2c_pm_suspend(struct xe_device *xe);
>  void xe_i2c_pm_resume(struct xe_device *xe, bool d3cold);
>  #else
>  static inline int xe_i2c_probe(struct xe_device *xe) { return 0; }
> +static inline bool xe_i2c_present(struct xe_device *xe) { return false; }
>  static inline void xe_i2c_irq_handler(struct xe_device *xe, u32 master_ctl) { }
>  static inline void xe_i2c_pm_suspend(struct xe_device *xe) { }
>  static inline void xe_i2c_pm_resume(struct xe_device *xe, bool d3cold) { }
> -- 
> 2.34.1

-- 
heikki
