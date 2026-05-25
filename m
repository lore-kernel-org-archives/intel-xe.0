Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6B26CD5BB1
	for <intel-xe@archiver.kernel.org>; Mon, 25 May 2026 18:30:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86A8B10E3AA;
	Mon, 25 May 2026 18:30:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mSI1VfJZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 655FB10E3AA
 for <intel-xe@lists.freedesktop.org>; Mon, 25 May 2026 18:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779733805; x=1811269805;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=YOUC51JtCPf6juaBVQi0tzIxLG+0zXadTss2PiQuW4k=;
 b=mSI1VfJZKdrzthGBxpAin0a9erFXt8NmT8PMcmhxf9E8NfhpHfIjn69c
 DG169UcnKg3MrNONsvQKuo5CBj2+/nnbb+B04bOLSCt33ETjHSQxGN9Wl
 52GuN1vcOP4o4aasxZywnL8dTZK2BpT45vAJR9fO+8A6Si68vjHg4wNMW
 AdM0KS6RaFv0eJ4zIAltrpxOfKBfNnAi8STMfuh8Z/YIWhnEQ3wGHY/F5
 0+nc5KlrAgTPkfVgNhd8b65256R0jRMomeSLsLTLb83rKoE3A4voVuhDv
 2diy6bqRZt5vELb1b4IfRcZFV/7lD1IgMce8e/30fdNdz+yX90nc15j4H Q==;
X-CSE-ConnectionGUID: BcnfGeDgTcGVoctEjJaD1g==
X-CSE-MsgGUID: qM8MymCST0O9tl6TLrWOww==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="103233595"
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; d="scan'208";a="103233595"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 11:30:05 -0700
X-CSE-ConnectionGUID: NeB/wd9uRuKmwMJVlAEbfw==
X-CSE-MsgGUID: sVoAWkSYS7SjgcXPOQAexg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; d="scan'208";a="241739340"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 11:30:04 -0700
Date: Mon, 25 May 2026 20:30:00 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 5/6] drm/xe/pm: Don't access device in init_early()
Message-ID: <ahSVKPEzpMfAF-wS@black.igk.intel.com>
References: <20260525160529.15890-1-michal.wajdeczko@intel.com>
 <20260525160529.15890-6-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260525160529.15890-6-michal.wajdeczko@intel.com>
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

On Mon, May 25, 2026 at 06:05:28PM +0200, Michal Wajdeczko wrote:
> We should separate software-only state initialization from anything
> else that requires access to the device's hardware. Extract d3cold
> capability detection into a new function. Add simple kernel-doc for
> updated functions here.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c |  4 ++++
>  drivers/gpu/drm/xe/xe_pci.c    |  5 +----
>  drivers/gpu/drm/xe/xe_pm.c     | 27 ++++++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_pm.h     |  1 +
>  4 files changed, 32 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 7ba407f73a02..d224861b6f6f 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -594,6 +594,10 @@ int xe_device_init_early(struct xe_device *xe)
>  	if (err)
>  		return err;
>  
> +	err = xe_pm_init_early(xe);
> +	if (err)
> +		return err;
> +
>  	return 0;
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 6b1a4cb7ccb0..35e611cd2e29 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -1167,7 +1167,7 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  		str_yes_no(xe_device_has_sriov(xe)),
>  		xe_sriov_mode_to_string(xe_device_sriov_mode(xe)));
>  
> -	err = xe_pm_init_early(xe);
> +	err = xe_pm_probe(xe);
>  	if (err)
>  		return err;

I couldn't figure out from the diff here but we need d3cold.capable value
before xe_device_probe(), so assuming it's not broken

Reviewed-by: Raag Jadav <raag.jadav@intel.com>

> @@ -1179,9 +1179,6 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  	if (err)
>  		goto err_driver_cleanup;
>  
> -	drm_dbg(&xe->drm, "d3cold: capable=%s\n",
> -		str_yes_no(xe->d3cold.capable));
> -
>  	return 0;
>  
>  err_driver_cleanup:
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index d4672eb07476..5d1a3a26cb6e 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -24,6 +24,7 @@
>  #include "xe_irq.h"
>  #include "xe_late_bind_fw.h"
>  #include "xe_pcode.h"
> +#include "xe_printk.h"
>  #include "xe_pxp.h"
>  #include "xe_sriov_vf_ccs.h"
>  #include "xe_sysctrl.h"
> @@ -349,6 +350,15 @@ static void xe_pm_runtime_init(struct xe_device *xe)
>  	pm_runtime_put(dev);
>  }
>  
> +/**
> + * xe_pm_init_early() - Initialize Xe Power Management
> + * @xe: the &xe_device instance
> + *
> + * Initialize everything that is a "software-only" state that does not
> + * require access to any of the device's hardware data.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
>  int xe_pm_init_early(struct xe_device *xe)
>  {
>  	int err;
> @@ -363,11 +373,26 @@ int xe_pm_init_early(struct xe_device *xe)
>  	if (err)
>  		return err;
>  
> -	xe->d3cold.capable = xe_pm_pci_d3cold_capable(xe);
>  	return 0;
>  }
>  ALLOW_ERROR_INJECTION(xe_pm_init_early, ERRNO); /* See xe_pci_probe() */
>  
> +/**
> + * xe_pm_probe() - Initialize Xe Power Management
> + * @xe: the &xe_device instance
> + *
> + * Check d3cold capability.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_pm_probe(struct xe_device *xe)
> +{
> +	xe->d3cold.capable = xe_pm_pci_d3cold_capable(xe);
> +	xe_dbg(xe, "d3cold: capable=%s\n", str_yes_no(xe->d3cold.capable));
> +
> +	return 0;
> +}
> +
>  static u32 vram_threshold_value(struct xe_device *xe)
>  {
>  	if (xe->info.platform == XE_BATTLEMAGE) {
> diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
> index 6b27039e7b2d..6d5ab09cb769 100644
> --- a/drivers/gpu/drm/xe/xe_pm.h
> +++ b/drivers/gpu/drm/xe/xe_pm.h
> @@ -17,6 +17,7 @@ int xe_pm_suspend(struct xe_device *xe);
>  int xe_pm_resume(struct xe_device *xe);
>  
>  int xe_pm_init_early(struct xe_device *xe);
> +int xe_pm_probe(struct xe_device *xe);
>  int xe_pm_init(struct xe_device *xe);
>  void xe_pm_fini(struct xe_device *xe);
>  bool xe_pm_runtime_suspended(struct xe_device *xe);
> -- 
> 2.47.1
> 
