Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88F25CD6E6B
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jun 2026 12:38:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B3A1113FCF;
	Thu,  4 Jun 2026 12:38:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NhY0eZTU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D189113FCF
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Jun 2026 12:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780576735; x=1812112735;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8Y7onhrUSGnKop5rdjAL/wL2kKHVQvBjYales/riuj4=;
 b=NhY0eZTUpKwBA1l5WvmLX2xMX2hklBDyS7SRCTCll4bAA9RL+aH4wxz2
 6Ki7EQtchvTFCkpwogJ0gdNISqqcnCGDzD0ffNEESR8jh3PUWll0UO7o8
 0c4tCwnlTtfhTUevK2T2lbb1vtxEKi4FTZYNWZtAFmj6hw9g5VJn587nn
 TM9lWjeFbiS+Sp5lBgT8h+msz2xwWpP2Z7IZbxq0O/Jortzgat0sd+mv9
 9YodD0cCkxDjpScaxfhUJQ/kRVwqNKEmUAhKFEoy0wIlwU11/GXMBLDBv
 BrOqCpdBZRANhoksmjEI//CD2Z63GFX8GpGmNB4/Adi/43kXHFIJVQJvy g==;
X-CSE-ConnectionGUID: 5AlxdUV3QqaKs+HmrzjAdw==
X-CSE-MsgGUID: UyRpOdsRQ9ygxpUu3HFUlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="104062600"
X-IronPort-AV: E=Sophos;i="6.24,187,1774335600"; d="scan'208";a="104062600"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2026 05:38:54 -0700
X-CSE-ConnectionGUID: Crxa5DR/TX+La/nfzm4mFw==
X-CSE-MsgGUID: AXMzfJyZSnmFiknY2XmPZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,187,1774335600"; d="scan'208";a="243460302"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2026 05:38:53 -0700
Date: Thu, 4 Jun 2026 14:38:50 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org, saurabhg.gupta@intel.com,
 alex.zuo@intel.com
Subject: Re: [PATCH] drm/xe/i2c: Report i2c irq handler issue
Message-ID: <aiFx2veqtpl9mdSo@black.igk.intel.com>
References: <20260603201007.3768029-1-jonathan.cavitt@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603201007.3768029-1-jonathan.cavitt@intel.com>
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

On Thu, Jun 04, 2026 at 04:10:07AM +0800, Jonathan Cavitt wrote:
> xe_i2c_irq_handler calls generic_handle_irq_safe, which can return an

Use '()' for functions.

> error value.  In all other cases, this is passed to a

Why the early wrapping? Looks like the next word can fit here.

> .*_err_ratelimited error message helper.  Add the missing error handler.

There's no change in the code path so it wasn't "missing".
I'd rephrase this as "Log the error".

> This issue was caught by static analysis.

This is redundant information but I'll leave it to you.

> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Raag Jadav <raag.jadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_i2c.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
> index 706783863d07..acfc171483b2 100644
> --- a/drivers/gpu/drm/xe/xe_i2c.c
> +++ b/drivers/gpu/drm/xe/xe_i2c.c
> @@ -177,12 +177,15 @@ static bool xe_i2c_irq_present(struct xe_device *xe)
>  void xe_i2c_irq_handler(struct xe_device *xe, u32 master_ctl)
>  {
>  	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
> +	int ret;
>  
>  	if (!(master_ctl & I2C_IRQ) || !xe_i2c_irq_present(xe))
>  		return;
>  
>  	/* Forward interrupt to I2C adapter */
> -	generic_handle_irq_safe(xe->i2c->adapter_irq);
> +	ret = generic_handle_irq_safe(xe->i2c->adapter_irq);
> +	if (ret)
> +		drm_err_ratelimited(&xe->drm, "error handling i2c irq: %d\n", ret);

drm_err_ratelimited() already logs "error" so I'd rephrase this as
"failed to handle i2c irq".

Raag

>  	/* Deassert after I2C adapter clears the interrupt */
>  	xe_mmio_rmw32(mmio, I2C_CONFIG_CMD, 0, PCI_COMMAND_INTX_DISABLE);
> -- 
> 2.53.0
> 
