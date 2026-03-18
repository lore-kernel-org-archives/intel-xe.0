Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C477D103E166
	for <intel-xe@archiver.kernel.org>; Wed, 18 Mar 2026 11:31:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8998010E77F;
	Wed, 18 Mar 2026 11:31:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WnNr38WG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E68710E77F
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Mar 2026 11:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773833480; x=1805369480;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=vnb3Sb0ttO/cpWyuTmbZsofDhsvilrK6KJPzFe0a2RU=;
 b=WnNr38WGF/2enWhRGkcT6hximPI7qY6xDCWVBD5aDLHnuuWTUWjjFB5x
 G4qTDSzhKma3DpH9YXvVFyAEW89UmPJpodFhi1fnghRZvXlHaQX8EIag7
 u/xLSGd7UAM2ChU2CT/ToU4zMVlPUI9INfGP9Eku94kZJYoaYBlweRf/7
 HkRomy1Ezecomi2R5QZVO6s63IS4FHzdKcIxjam0MvpYi1mh64zy+CWmX
 mqVtBFXvd51MXPSRpI90QFliSCwkTf5ww767ZU5bWocmS9Tnc3aLrvRgo
 HqcSl/2QWnFsVHax3rugtxRU3GI/i9hxw3FdB44JZktrA/Qr9ZzJb5q8Q A==;
X-CSE-ConnectionGUID: 0Ovvezk/ShSi+IJdW+L7GA==
X-CSE-MsgGUID: itVjA0X5Qz+SiIiXMVCqcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="78494187"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="78494187"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 04:31:20 -0700
X-CSE-ConnectionGUID: kcpb3nmXSw6K3UJBTk5mHQ==
X-CSE-MsgGUID: 9Dc1nR2KS/KsegoSpzFVeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="221831572"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa010.jf.intel.com with ESMTP; 18 Mar 2026 04:31:19 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
 id 8EFF799; Wed, 18 Mar 2026 12:31:17 +0100 (CET)
Date: Wed, 18 Mar 2026 13:30:29 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org, andi.shyti@linux.intel.com,
 rodrigo.vivi@intel.com, matthew.d.roper@intel.com
Subject: Re: [PATCH v1] drm/xe/i2c: Assert/Deassert I2C IRQ
Message-ID: <abqM1X6B4blCKukO@kuha>
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

Hi Raag,

Fri, Mar 13, 2026 at 01:34:38PM +0530, Raag Jadav wrote:
> I2C IRQ is triggered using virtual wire. Assert/Deassert it in IRQ
> handler to allow subsequent interrupt generation.
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
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

Do we need to do this always, or only with the SMBus Alerts?

thanks,

-- 
heikki
