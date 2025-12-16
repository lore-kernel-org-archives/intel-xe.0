Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55933D5E146
	for <intel-xe@archiver.kernel.org>; Tue, 16 Dec 2025 12:08:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0939210E0C4;
	Tue, 16 Dec 2025 12:08:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bC8Wi5ZR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB01010E0C4
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Dec 2025 12:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765886938; x=1797422938;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=U/1tGvAq/vD3wILhGA+jNVpV6oKJNicWaQMvh1CtlBw=;
 b=bC8Wi5ZRUpN948MxHwh6HDaTecUWyAWvdWJfq9zi2ic5Sts6yQHMZodD
 dDtE7+OlRmhmNHT7TqeI1SX8s67M22YYmO7dT1sA8uyvvc5qMVMruJpJ9
 NRImUfADV5itzz2xE3LMl3qq8eHCHlVvDpOlGlS2ocOxoa9avzA7Y1TOk
 lsStnyL1rMuHIzatNy0kc7jE/jAIcym/PqsLjJd0EMPTMSMoMu0Eofr8L
 wxMwKQQfv7Jtl2H2sTXlDo/0XwvyUwiZJ2qvsy2V4JyxGXCmwRxNeIwpp
 7WQVYuLMYVmvrwXRVeslsAy2uOZBS7h4ijO4e/PE0UwAdviBrQjP2uucy w==;
X-CSE-ConnectionGUID: GShDDbo7Q6yumOBSUl7RRA==
X-CSE-MsgGUID: hoe6bdY5TK2Snh6wUz2lzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="67763719"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; d="scan'208";a="67763719"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 04:08:57 -0800
X-CSE-ConnectionGUID: tUmLdzhFQ8ac3bvioXN/nQ==
X-CSE-MsgGUID: U/le1mfUTBGhPwS694yB5g==
X-ExtLoop1: 1
Received: from sramkris-mobl1.amr.corp.intel.com (HELO kuha) ([10.124.223.55])
 by fmviesa003.fm.intel.com with SMTP; 16 Dec 2025 04:08:54 -0800
Received: by kuha (sSMTP sendmail emulation); Tue, 16 Dec 2025 14:08:42 +0200
Date: Tue, 16 Dec 2025 14:08:42 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 andi.shyti@linux.intel.com, riana.tauro@intel.com
Subject: Re: [PATCH v1] drm/xe/i2c: Force polling mode in survivability
Message-ID: <aUFLysxZvs_C24T8@kuha>
References: <20251211182353.1149481-1-raag.jadav@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251211182353.1149481-1-raag.jadav@intel.com>
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

Thu, Dec 11, 2025 at 11:53:53PM +0530, Raag Jadav kirjoitti:
> SGUnit interrupts are not initialized in survivability. Force I2C
> controller to polling mode while in survivability.
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>

Like Mika said, polling should always work. This should be fine

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/gpu/drm/xe/xe_i2c.c                | 8 +++++---
>  drivers/gpu/drm/xe/xe_survivability_mode.c | 2 +-
>  2 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
> index 8eccbae05705..6f14ba1e5217 100644
> --- a/drivers/gpu/drm/xe/xe_i2c.c
> +++ b/drivers/gpu/drm/xe/xe_i2c.c
> @@ -213,11 +213,13 @@ static const struct irq_domain_ops xe_i2c_irq_ops = {
>  	.map = xe_i2c_irq_map,
>  };
>  
> -static int xe_i2c_create_irq(struct xe_i2c *i2c)
> +static int xe_i2c_create_irq(struct xe_device *xe)
>  {
> +	struct xe_survivability *survivability = &xe->survivability;
> +	struct xe_i2c *i2c = xe->i2c;
>  	struct irq_domain *domain;
>  
> -	if (!(i2c->ep.capabilities & XE_I2C_EP_CAP_IRQ))
> +	if (survivability->mode || !(i2c->ep.capabilities & XE_I2C_EP_CAP_IRQ))
>  		return 0;
>  
>  	domain = irq_domain_create_linear(dev_fwnode(i2c->drm_dev), 1, &xe_i2c_irq_ops, NULL);
> @@ -351,7 +353,7 @@ int xe_i2c_probe(struct xe_device *xe)
>  	if (ret)
>  		return ret;
>  
> -	ret = xe_i2c_create_irq(i2c);
> +	ret = xe_i2c_create_irq(xe);
>  	if (ret)
>  		goto err_unregister_notifier;
>  
> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
> index 7520d7b7f9b8..a34a638bfb76 100644
> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
> @@ -324,7 +324,7 @@ static int enable_boot_survivability_mode(struct pci_dev *pdev)
>  	if (ret)
>  		return ret;
>  
> -	/* Make sure xe_heci_gsc_init() knows about survivability mode */
> +	/* Make sure xe_heci_gsc_init() and xe_i2c_probe() are aware of survivability */
>  	survivability->mode = true;
>  
>  	xe_heci_gsc_init(xe);
> -- 
> 2.43.0

-- 
heikki
