Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E53BEF8D75E
	for <intel-xe@archiver.kernel.org>; Thu, 16 Apr 2026 15:48:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A179110E8E9;
	Thu, 16 Apr 2026 15:48:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EtNTfUye";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 138E210E8E9
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Apr 2026 15:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776354489; x=1807890489;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/F27EGr2wSBagM3BUpd6I3UNTSFyOWqgSZFiW7SEylQ=;
 b=EtNTfUyecqEXD3qBaIro5T8oaoIK+inABo7ifQoGlhcOz6q2aDBCEShH
 UeRO7WwovJzSFWRlpY35SvQQDYwqL+CW6G353XBaTFmPvsodwaZXM4THl
 P+yeTcAatjMtfkPAPWDLbs52QPQpCumunI90NJLvuRRxOkDl0ZiOdabga
 5fblcY5A9Lq3k2VYWXcF2n+sCdG+ChoMYykXG8dZH9h2LzBz32AjaD2dg
 BN8OE60JANzjx5YKevroNbnsbLuInJ26gIQ132hDL6FZNPKDu9BYisd8B
 Tkyyp2Dzv6C/yBilQqpYNR2cMoSqy+vJNJDXR09cPCvQ7VBU3b8hn5hQt Q==;
X-CSE-ConnectionGUID: wrzyiOWOT0GHyhwpOQDvIQ==
X-CSE-MsgGUID: AIKM28KITG+UWCQtH3x80w==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="77265485"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="77265485"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 08:48:08 -0700
X-CSE-ConnectionGUID: ti1R+0X9SQOR/ZgepWr5AA==
X-CSE-MsgGUID: l06ioMw4Qsmf5LjEJgD/eA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="230695642"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 08:48:07 -0700
Date: Thu, 16 Apr 2026 17:48:03 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, sk.anirban@intel.com
Subject: Re: [PATCH v2] drm/xe/xe_survivability: Fix runtime survivability
 error handling
Message-ID: <aeEEs4oi6zK-W3SZ@black.igk.intel.com>
References: <20260414172641.570653-2-mallesh.koujalagi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414172641.570653-2-mallesh.koujalagi@intel.com>
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

On Tue, Apr 14, 2026 at 10:56:42PM +0530, Mallesh Koujalagi wrote:
> xe_survivability_mode_runtime_enable() returns an int, but its caller
> csc_hw_error_work() cannot take any meaningful recovery action on
> failure. The function already handles all internal errors via dev_err()
> and proceeds to enable survivability mode regardless of sysfs creation
> failure.
> 
> Change the return type to void and drop unnecessary error handling
> in csc_hw_error_work().
> 
> v2:
> - Return is not require after the sysfs creation fail. (Rodrigo/Riana)
> - Change int to void return type. (Rodrigo)
> - Remove extra message from csc_hw_error_work().
> 
> Fixes: a2ca0633a0fe ("drm/xe/xe_survivability: Add support for Runtime survivability mode")
> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_hw_error.c           | 5 +----
>  drivers/gpu/drm/xe/xe_survivability_mode.c | 8 ++------
>  drivers/gpu/drm/xe/xe_survivability_mode.h | 2 +-
>  3 files changed, 4 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
> index 2a31b430570e..64d2260e761b 100644
> --- a/drivers/gpu/drm/xe/xe_hw_error.c
> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
> @@ -169,11 +169,8 @@ static void csc_hw_error_work(struct work_struct *work)
>  {
>  	struct xe_tile *tile = container_of(work, typeof(*tile), csc_hw_error_work);
>  	struct xe_device *xe = tile_to_xe(tile);
> -	int ret;
>  
> -	ret = xe_survivability_mode_runtime_enable(xe);
> -	if (ret)
> -		drm_err(&xe->drm, "Failed to enable runtime survivability mode\n");
> +	xe_survivability_mode_runtime_enable(xe);
>  }
>  
>  static void csc_hw_error_handler(struct xe_tile *tile, const enum hardware_error hw_err)
> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
> index db64cac39c94..c68b789d93c7 100644
> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
> @@ -396,10 +396,8 @@ bool xe_survivability_mode_is_requested(struct xe_device *xe)
>   * Runtime survivability mode is enabled when certain errors cause the device to be
>   * in non-recoverable state. The device is declared wedged with the appropriate
>   * recovery method and survivability mode sysfs exposed to userspace
> - *
> - * Return: 0 if runtime survivability mode is enabled, negative error code otherwise.
>   */
> -int xe_survivability_mode_runtime_enable(struct xe_device *xe)
> +void xe_survivability_mode_runtime_enable(struct xe_device *xe)
>  {
>  	struct xe_survivability *survivability = &xe->survivability;
>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);

Drop ret variable here as well, so we don't mislead anyone that it needs
to be returned.

Raag

> @@ -407,7 +405,7 @@ int xe_survivability_mode_runtime_enable(struct xe_device *xe)
>  
>  	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe) || xe->info.platform < XE_BATTLEMAGE) {
>  		dev_err(&pdev->dev, "Runtime Survivability Mode not supported\n");
> -		return -EINVAL;
> +		return;
>  	}
>  
>  	populate_survivability_info(xe);
> @@ -422,8 +420,6 @@ int xe_survivability_mode_runtime_enable(struct xe_device *xe)
>  	xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_VENDOR);
>  	xe_device_declare_wedged(xe);
>  	dev_err(&pdev->dev, "Firmware flash required, Please refer to the userspace documentation for more details!\n");
> -
> -	return 0;
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.h b/drivers/gpu/drm/xe/xe_survivability_mode.h
> index 1cc94226aa82..cd040e4d18bb 100644
> --- a/drivers/gpu/drm/xe/xe_survivability_mode.h
> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.h
> @@ -11,7 +11,7 @@
>  struct xe_device;
>  
>  int xe_survivability_mode_boot_enable(struct xe_device *xe);
> -int xe_survivability_mode_runtime_enable(struct xe_device *xe);
> +void xe_survivability_mode_runtime_enable(struct xe_device *xe);
>  bool xe_survivability_mode_is_boot_enabled(struct xe_device *xe);
>  bool xe_survivability_mode_is_requested(struct xe_device *xe);
>  
> -- 
> 2.34.1
> 
