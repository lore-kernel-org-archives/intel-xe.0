Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1223ECCA470
	for <intel-xe@archiver.kernel.org>; Wed,  8 Oct 2025 08:09:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA6BD10E19C;
	Wed,  8 Oct 2025 08:09:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vxtxphx+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C484E10E19C
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Oct 2025 08:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759910968; x=1791446968;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Gn/1vF1oHGC/Aiv4dHh2arABq0GKNtbVMj0j6oPoTPA=;
 b=Vxtxphx+11yCplP1FuR4jXwez8FVLNGMqcWfgSrmXE4q0G+PjiC1jumb
 XzHWHSkej2UlNxCvzCqg6vmr4jgLdy1ZjrcgvnIqHKuWdRhugOxc3U4rB
 FYGYF6lsultfXZjcOQnMLYF91XfL9/8HvSiJgl6Lo/YpeKCcIktVbAKyn
 kR1wafdON+Xj8Lxr3rBz0qC+qCmlTPTe63yoo525KM2r8uTaBm2amwc6T
 aDO01kGoo9IeuZu41NEd3BQOqnF86g7++k7QNF2uNZBMQ0j4raxAqbXZe
 rJGAiIzGGhHLpPsLSd8rv5fCLFoPGJYJZ3SLFFpZ0mgHcbAOy9MBDPotR w==;
X-CSE-ConnectionGUID: TDXIDDH5R++bS9awwvxcjA==
X-CSE-MsgGUID: orrWt8K6QgulsRka78Agbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="61804212"
X-IronPort-AV: E=Sophos;i="6.18,323,1751266800"; d="scan'208";a="61804212"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 01:09:28 -0700
X-CSE-ConnectionGUID: psQ8nP12TaOKBp67dghTpA==
X-CSE-MsgGUID: 16VKBK7uRAWmcZ6hlrnduA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,323,1751266800"; d="scan'208";a="184761060"
Received: from iherna2-mobl4.amr.corp.intel.com (HELO kuha.fi.intel.com)
 ([10.124.220.169])
 by fmviesa005.fm.intel.com with SMTP; 08 Oct 2025 01:09:23 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation);
 Wed, 08 Oct 2025 11:09:22 +0300
Date: Wed, 8 Oct 2025 11:09:22 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 intel-xe@lists.freedesktop.org, riana.tauro@intel.com
Subject: Re: [PATCH v1 2/2] drm/xe/i2c: Wire up reset/postinstall for I2C IRQ
Message-ID: <aOYcMmasu4Ui2VWc@kuha.fi.intel.com>
References: <20250924200835.3143173-1-raag.jadav@intel.com>
 <20250924200835.3143173-3-raag.jadav@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924200835.3143173-3-raag.jadav@intel.com>
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

On Thu, Sep 25, 2025 at 01:38:35AM +0530, Raag Jadav wrote:
> I2C IRQ needs to be routed to SGUnit or PUnit for the devices that support
> it. Wire up reset/postinstall handles for I2C IRQ to take care of this.
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/gpu/drm/xe/regs/xe_i2c_regs.h |  3 +++
>  drivers/gpu/drm/xe/xe_i2c.c           | 20 ++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_i2c.h           |  4 ++++
>  drivers/gpu/drm/xe/xe_irq.c           |  2 ++
>  4 files changed, 29 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_i2c_regs.h b/drivers/gpu/drm/xe/regs/xe_i2c_regs.h
> index af781c8e4a80..f2e455e2bfe4 100644
> --- a/drivers/gpu/drm/xe/regs/xe_i2c_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_i2c_regs.h
> @@ -14,6 +14,9 @@
>  #define REG_SG_REMAP_ADDR_PREFIX	XE_REG(SOC_BASE + 0x0164)
>  #define REG_SG_REMAP_ADDR_POSTFIX	XE_REG(SOC_BASE + 0x0168)
>  
> +#define I2C_BRIDGE_PCICFGCTL		XE_REG(I2C_BRIDGE_OFFSET + 0x200)
> +#define   ACPI_INTR_EN			REG_BIT(1)
> +
>  #define I2C_CONFIG_CMD			XE_REG(I2C_CONFIG_SPACE_OFFSET + PCI_COMMAND)
>  #define I2C_CONFIG_PMCSR		XE_REG(I2C_CONFIG_SPACE_OFFSET + 0x84)
>  
> diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
> index 25c6b8f3c0bb..69f39df5a692 100644
> --- a/drivers/gpu/drm/xe/xe_i2c.c
> +++ b/drivers/gpu/drm/xe/xe_i2c.c
> @@ -182,6 +182,26 @@ void xe_i2c_irq_handler(struct xe_device *xe, u32 master_ctl)
>  		generic_handle_irq_safe(xe->i2c->adapter_irq);
>  }
>  
> +void xe_i2c_irq_reset(struct xe_device *xe)
> +{
> +	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
> +
> +	if (!xe_i2c_irq_present(xe))
> +		return;
> +
> +	xe_mmio_rmw32(mmio, I2C_BRIDGE_PCICFGCTL, ACPI_INTR_EN, 0);
> +}
> +
> +void xe_i2c_irq_postinstall(struct xe_device *xe)
> +{
> +	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
> +
> +	if (!xe_i2c_irq_present(xe))
> +		return;
> +
> +	xe_mmio_rmw32(mmio, I2C_BRIDGE_PCICFGCTL, 0, ACPI_INTR_EN);
> +}
> +
>  static int xe_i2c_irq_map(struct irq_domain *h, unsigned int virq,
>  			  irq_hw_number_t hw_irq_num)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_i2c.h b/drivers/gpu/drm/xe/xe_i2c.h
> index ecd5f10358e2..425d8160835f 100644
> --- a/drivers/gpu/drm/xe/xe_i2c.h
> +++ b/drivers/gpu/drm/xe/xe_i2c.h
> @@ -51,12 +51,16 @@ struct xe_i2c {
>  int xe_i2c_probe(struct xe_device *xe);
>  bool xe_i2c_present(struct xe_device *xe);
>  void xe_i2c_irq_handler(struct xe_device *xe, u32 master_ctl);
> +void xe_i2c_irq_postinstall(struct xe_device *xe);
> +void xe_i2c_irq_reset(struct xe_device *xe);
>  void xe_i2c_pm_suspend(struct xe_device *xe);
>  void xe_i2c_pm_resume(struct xe_device *xe, bool d3cold);
>  #else
>  static inline int xe_i2c_probe(struct xe_device *xe) { return 0; }
>  static inline bool xe_i2c_present(struct xe_device *xe) { return false; }
>  static inline void xe_i2c_irq_handler(struct xe_device *xe, u32 master_ctl) { }
> +static inline void xe_i2c_irq_postinstall(struct xe_device *xe) { }
> +static inline void xe_i2c_irq_reset(struct xe_device *xe) { }
>  static inline void xe_i2c_pm_suspend(struct xe_device *xe) { }
>  static inline void xe_i2c_pm_resume(struct xe_device *xe, bool d3cold) { }
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index 870edaf69388..af519414a429 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -616,6 +616,7 @@ static void xe_irq_reset(struct xe_device *xe)
>  	tile = xe_device_get_root_tile(xe);
>  	mask_and_disable(tile, GU_MISC_IRQ_OFFSET);
>  	xe_display_irq_reset(xe);
> +	xe_i2c_irq_reset(xe);
>  
>  	/*
>  	 * The tile's top-level status register should be the last one
> @@ -657,6 +658,7 @@ static void xe_irq_postinstall(struct xe_device *xe)
>  	}
>  
>  	xe_display_irq_postinstall(xe, xe_root_mmio_gt(xe));
> +	xe_i2c_irq_postinstall(xe);
>  
>  	/*
>  	 * ASLE backlight operations are reported via GUnit GSE interrupts
> -- 
> 2.34.1

-- 
heikki
