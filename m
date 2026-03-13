Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D563105F781
	for <intel-xe@archiver.kernel.org>; Fri, 13 Mar 2026 08:56:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5584010EB4D;
	Fri, 13 Mar 2026 08:56:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EKJtpEO5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31AA810EB4D
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Mar 2026 08:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773392171; x=1804928171;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/eUbvf6aAXRzNoxqM+TJdEatR8CrKgHiEXrBrPU/iAc=;
 b=EKJtpEO5Vd07M/z3R+L+LTRcU4fo1BnYryKXmCrt0RJxGugR8sNoI1ey
 pXsBss0Tv4zx3pnDz/rgeVNmb30W5O6lTbpjVQkVSHP5JDQeb7bhEKNF2
 EykzK9t/eXvW7QpSHUgmZk+EkxdjmpkiNy2hUj3100Z36xa+3ZoQrgYks
 M0Awb1p8gd+ISXrZdM+B2gVFLwfQFMja7X05ypbTWgtF5PBc3CPylU505
 +zHXgzpzoPC+mZu0YtQWE8yfgXUvXXymeFk7XvimEuBU6EWvdLrUW+J8Q
 7Dzc1hN4z8/r3CPYggFMKHDIXHgm2CLR2QerUb5HYlLv/9NGJT8+k4YwY A==;
X-CSE-ConnectionGUID: UQisubx6QLC7scoRflUgZQ==
X-CSE-MsgGUID: dRl6g14KSreXh0oydNb1Ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="74608691"
X-IronPort-AV: E=Sophos;i="6.23,117,1770624000"; d="scan'208";a="74608691"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2026 01:56:11 -0700
X-CSE-ConnectionGUID: 4jSm0ncRQj6CmpTx30Kn7Q==
X-CSE-MsgGUID: v7qMQbSDRiagSPRf6HRA6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,117,1770624000"; d="scan'208";a="246315819"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa001.fm.intel.com with ESMTP; 13 Mar 2026 01:56:09 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
 id A8DBE95; Fri, 13 Mar 2026 09:56:08 +0100 (CET)
Date: Fri, 13 Mar 2026 10:55:24 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org, andi.shyti@linux.intel.com,
 rodrigo.vivi@intel.com, matthew.d.roper@intel.com
Subject: Re: [PATCH v1] drm/xe/i2c: Assert/Deassert I2C IRQ
Message-ID: <abPQ_Ej-I6dZJfxJ@kuha>
References: <20260313080438.4166251-1-raag.jadav@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313080438.4166251-1-raag.jadav@intel.com>
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

Fri, Mar 13, 2026 at 01:34:38PM +0530, Raag Jadav kirjoitti:
> I2C IRQ is triggered using virtual wire. Assert/Deassert it in IRQ
> handler to allow subsequent interrupt generation.
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>

Looks good to me. FWIW:

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/gpu/drm/xe/xe_i2c.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
> index 1deb812fe01d..706783863d07 100644
> --- a/drivers/gpu/drm/xe/xe_i2c.c
> +++ b/drivers/gpu/drm/xe/xe_i2c.c
> @@ -176,11 +176,18 @@ static bool xe_i2c_irq_present(struct xe_device *xe)
>   */
>  void xe_i2c_irq_handler(struct xe_device *xe, u32 master_ctl)
>  {
> -	if (!xe_i2c_irq_present(xe))
> +	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
> +
> +	if (!(master_ctl & I2C_IRQ) || !xe_i2c_irq_present(xe))
>  		return;
>  
> -	if (master_ctl & I2C_IRQ)
> -		generic_handle_irq_safe(xe->i2c->adapter_irq);
> +	/* Forward interrupt to I2C adapter */
> +	generic_handle_irq_safe(xe->i2c->adapter_irq);
> +
> +	/* Deassert after I2C adapter clears the interrupt */
> +	xe_mmio_rmw32(mmio, I2C_CONFIG_CMD, 0, PCI_COMMAND_INTX_DISABLE);
> +	/* Reassert to allow subsequent interrupt generation */
> +	xe_mmio_rmw32(mmio, I2C_CONFIG_CMD, PCI_COMMAND_INTX_DISABLE, 0);
>  }
>  
>  void xe_i2c_irq_reset(struct xe_device *xe)
> @@ -190,6 +197,7 @@ void xe_i2c_irq_reset(struct xe_device *xe)
>  	if (!xe_i2c_irq_present(xe))
>  		return;
>  
> +	xe_mmio_rmw32(mmio, I2C_CONFIG_CMD, 0, PCI_COMMAND_INTX_DISABLE);
>  	xe_mmio_rmw32(mmio, I2C_BRIDGE_PCICFGCTL, ACPI_INTR_EN, 0);
>  }
>  
> @@ -201,6 +209,7 @@ void xe_i2c_irq_postinstall(struct xe_device *xe)
>  		return;
>  
>  	xe_mmio_rmw32(mmio, I2C_BRIDGE_PCICFGCTL, 0, ACPI_INTR_EN);
> +	xe_mmio_rmw32(mmio, I2C_CONFIG_CMD, PCI_COMMAND_INTX_DISABLE, 0);
>  }
>  
>  static int xe_i2c_irq_map(struct irq_domain *h, unsigned int virq,
> -- 
> 2.43.0

-- 
heikki
