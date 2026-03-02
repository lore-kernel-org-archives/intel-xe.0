Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB298D58E48
	for <intel-xe@archiver.kernel.org>; Mon,  2 Mar 2026 17:00:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C2C010E573;
	Mon,  2 Mar 2026 17:00:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a5lAdp1W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7193B10E573
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Mar 2026 17:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772470837; x=1804006837;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=QGv5GoudJEPLl+YRCbZrd3bRUi8YyLhVhK1Jg8UraUc=;
 b=a5lAdp1WDsphjugpDuJguUs+uSbirYmSyHo5n7rE4v9a6dFOxag5Cbb4
 XaLDA6uGuu6T8WJN36jrufUmbAFqhCXEzQYta19/buX372gqWo1a4wF1q
 KG5ArsMmvp5C+tY7rgBG710TeuzmrJ8ahw4xDZ//rCi82ykd2oTrc/g9X
 cUWIpc0/VosocYQRlkhPxNChe7eP/Qdzafyx5SW13sK7E4Rt2IEhOiFYp
 J/uNG1u+XPgDDz4xjcY/UrAxE/LIbUcM8M98vd5E9oawJp6weOFg3kihu
 Kq89zQ4dbsbBKK9g49RCCGY6B+RNsk/bxoXzFm2lA7L1puv7EPSt2/PyZ A==;
X-CSE-ConnectionGUID: zzHeeNbwRkSiigy0W1euWg==
X-CSE-MsgGUID: eTFX9ZSqSaOUobGv+KjgKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="73526163"
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="73526163"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 09:00:36 -0800
X-CSE-ConnectionGUID: EjroxUMpRi2+jMJfIVKAbQ==
X-CSE-MsgGUID: V+6H/GCFT4GM5AX5q1Iw8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="244736477"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 09:00:34 -0800
Date: Mon, 2 Mar 2026 18:00:31 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com
Subject: Re: [PATCH v2 02/11] drm/xe/xe_survivability: Decouple survivability
 info from boot survivability
Message-ID: <aaXCL5mABQdwlG_X@black.igk.intel.com>
References: <20260302102155.4074630-13-riana.tauro@intel.com>
 <20260302102155.4074630-15-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260302102155.4074630-15-riana.tauro@intel.com>
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

On Mon, Mar 02, 2026 at 03:51:57PM +0530, Riana Tauro wrote:
> On CSC runtime firmware errors that requires firmware flash through SPI,
> PCODE sets the FDO mode bit in the Capability register.
> Currently the survivability_info group is created only for boot
> survivability.
> 
> Create survivability_info group even for runtime survivability to allow
> userspace to check FDO mode sysfs.
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_survivability_mode.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
> index db64cac39c94..70feb192fa2f 100644
> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
> @@ -98,6 +98,15 @@
>   *	# cat /sys/bus/pci/devices/<device>/survivability_mode
>   *	  Runtime
>   *
> + * On some CSC firmware errors, PCODE sets FDO mode and the only recovery possible is through
> + * firmware flash using SPI driver. Userspace can check if FDO mode is set by checking the below
> + * sysfs entry.
> + *
> + * .. code-block:: shell
> + *
> + *	# cat /sys/bus/pci/devices/<device>/survivability_info/fdo_mode
> + *       enabled

Currently FDO_INFO is defined as (MAX_SCRATCH_REG + 1), but I couldn't
find this case in survivability_info_attrs_visible(). Or did I miss
something?

Raag

>   * When such errors occur, userspace is notified with the drm device wedged uevent and runtime
>   * survivability mode. User can then initiate a firmware flash using userspace tools like fwupd
>   * to restore device to normal operation.
> @@ -296,7 +305,8 @@ static int create_survivability_sysfs(struct pci_dev *pdev)
>  	if (ret)
>  		return ret;
>  
> -	if (check_boot_failure(xe)) {
> +	/* Surivivability info is not required if enabled via configfs */
> +	if (!xe_configfs_get_survivability_mode(pdev)) {
>  		ret = devm_device_add_group(dev, &survivability_info_group);
>  		if (ret)
>  			return ret;
> -- 
> 2.47.1
> 
