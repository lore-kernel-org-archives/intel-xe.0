Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6DD4CCA471
	for <intel-xe@archiver.kernel.org>; Thu,  9 Oct 2025 06:14:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA7FC10E917;
	Thu,  9 Oct 2025 06:14:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NLeIWPaj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B729B10E917
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Oct 2025 06:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759990451; x=1791526451;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ja7EX8qbq/mgOwQVTodNEuhL+akkOL04UKz0JlMFVFc=;
 b=NLeIWPajMXWUvJWb5NVJVZUb4EGAV5scydz4vZaYiCerCjFOsIgtlYyC
 rlCJM4WGcUSADipZW5NA2KwUaOFyZI0IxpCf/ViHmnmpfCuEKEPOA+xLh
 HXO/5sAPT/OMKZ2lcRiSHFFytSUqa4xpLNctXY3i+4LV08NVSyzvmmTIJ
 e7NnW7LY4jjkxmCykpRQ20VxVos3oPPlZeXCc8S6TZqMBIJ1WM05JiqJQ
 /823dXL9Op1y8AwHogoltHYbbgPxSdv6fjkRH+O1xopWuWtxcCYqfjtZ6
 zNVNJtzIq38lyUPn/8D0rG16WKxWqI686lD3/XP7Xr3nL2L1R9fuehVNl w==;
X-CSE-ConnectionGUID: nZebRNREQuC2pHWdoSPIiQ==
X-CSE-MsgGUID: qwiQB77XSCqy8ViQ4Z7cWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="61230251"
X-IronPort-AV: E=Sophos;i="6.19,215,1754982000"; d="scan'208";a="61230251"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 23:14:10 -0700
X-CSE-ConnectionGUID: p/a1sCKWQD20brJu9sXZ8g==
X-CSE-MsgGUID: X+50KDN+Qh+m4RTv2SLpUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,215,1754982000"; d="scan'208";a="179881051"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 23:14:08 -0700
Date: Thu, 9 Oct 2025 08:14:05 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, intel-xe@lists.freedesktop.org,
 riana.tauro@intel.com
Subject: Re: [PATCH v1 2/2] drm/xe/i2c: Wire up reset/postinstall for I2C IRQ
Message-ID: <aOdSrW9hTsWuELC6@black.igk.intel.com>
References: <20250924200835.3143173-1-raag.jadav@intel.com>
 <20250924200835.3143173-3-raag.jadav@intel.com>
 <v4k2wbqubd3axseacmj645rxf6oorhfksjew7wx2roy67cyx5i@msal4niodlrx>
 <aNu9eRb7dqnEjgaf@black.igk.intel.com>
 <aOYaSh5rlCElWurt@kuha.fi.intel.com>
 <aOYbP6NCdKGtpcCj@kuha.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aOYbP6NCdKGtpcCj@kuha.fi.intel.com>
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

On Wed, Oct 08, 2025 at 11:05:19AM +0300, Heikki Krogerus wrote:
> On Wed, Oct 08, 2025 at 11:01:21AM +0300, Heikki Krogerus wrote:
> > Hi,
> > 
> > On Tue, Sep 30, 2025 at 01:22:33PM +0200, Raag Jadav wrote:
> > > On Tue, Sep 30, 2025 at 01:13:57PM +0200, Andi Shyti wrote:
> > > > Hi Raag,
> > > > 
> > > > On Thu, Sep 25, 2025 at 01:38:35AM +0530, Raag Jadav wrote:
> > > > > I2C IRQ needs to be routed to SGUnit or PUnit for the devices that support
> > > > > it. Wire up reset/postinstall handles for I2C IRQ to take care of this.
> > > > > 
> > > > > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > > > 
> > > > Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> > > 
> > > Awesome, thanks Andi.
> > > 
> > > Heikki, I can integrate your DISABLE_MSI changes which I'm assuming
> > > will be in the same path here?
> > 
> > Yes, that would be awesome!
> 
> So something like this squashed into this patch?

Done. Coming right up.

Raag

> diff --git a/drivers/gpu/drm/xe/regs/xe_i2c_regs.h b/drivers/gpu/drm/xe/regs/xe_i2c_regs.h
> index f2e455e2bfe4..396d78c3b6a3 100644
> --- a/drivers/gpu/drm/xe/regs/xe_i2c_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_i2c_regs.h
> @@ -16,6 +16,7 @@
>  
>  #define I2C_BRIDGE_PCICFGCTL           XE_REG(I2C_BRIDGE_OFFSET + 0x200)
>  #define   ACPI_INTR_EN                 REG_BIT(1)
> +#define   DISABLE_MSI_CAP              REG_BIT(29)
>  
>  #define I2C_CONFIG_CMD                 XE_REG(I2C_CONFIG_SPACE_OFFSET + PCI_COMMAND)
>  #define I2C_CONFIG_PMCSR               XE_REG(I2C_CONFIG_SPACE_OFFSET + 0x84)
> diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
> index 69f39df5a692..8a4ba6a411e4 100644
> --- a/drivers/gpu/drm/xe/xe_i2c.c
> +++ b/drivers/gpu/drm/xe/xe_i2c.c
> @@ -189,7 +189,7 @@ void xe_i2c_irq_reset(struct xe_device *xe)
>         if (!xe_i2c_irq_present(xe))
>                 return;
>  
> -       xe_mmio_rmw32(mmio, I2C_BRIDGE_PCICFGCTL, ACPI_INTR_EN, 0);
> +       xe_mmio_rmw32(mmio, I2C_BRIDGE_PCICFGCTL, ACPI_INTR_EN, DISABLE_MSI_CAP);
>  }
>  
>  void xe_i2c_irq_postinstall(struct xe_device *xe)
> @@ -199,7 +199,7 @@ void xe_i2c_irq_postinstall(struct xe_device *xe)
>         if (!xe_i2c_irq_present(xe))
>                 return;
>  
> -       xe_mmio_rmw32(mmio, I2C_BRIDGE_PCICFGCTL, 0, ACPI_INTR_EN);
> +       xe_mmio_rmw32(mmio, I2C_BRIDGE_PCICFGCTL, DISABLE_MSI_CAP, ACPI_INTR_EN);
>  }
>  
>  static int xe_i2c_irq_map(struct irq_domain *h, unsigned int virq,
> 
> -- 
> heikki
