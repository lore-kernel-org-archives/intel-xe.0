Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45C94C54E58
	for <intel-xe@archiver.kernel.org>; Fri, 15 Mar 2024 07:10:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8AEA10F74A;
	Fri, 15 Mar 2024 07:10:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hv6Cj3bE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A74C410F74A
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Mar 2024 07:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710486620; x=1742022620;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=JXE+uUc3YYFgdO23bo7omPwRQfgAjHruiELKQJJpYcU=;
 b=Hv6Cj3bEDxbefCsRV2yssIuQZNq5p0Cb7RxI+9CoNQzMTeIRMVYtk9wO
 X4f4GxOqqaSzbmxy1j6cu4my/SgAaIu6WSylhAXpTphvccmyCjzer2oFl
 9o7HbNeif2X7SMFFpjvb8P7Kj0oyCaJE1cqkM6Xv0q4VhM7uOMpnmhPOb
 xv0EWBF4gmfAHcG9il/ZbP49lFLHza/MAiJa81OqpOfIjvJCVrDs4iy2d
 tmJT8D5Jp2f6P9WisdAgq3KG+QBgWhPH/lRGF/Hbaf9M35ijXukxU0urM
 sgdcFTDfWtiFtq2wZL2H+m8GH+Fyps82l1C0jvHrPgoylplWAQn7wCcz7 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="5196878"
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; 
   d="scan'208";a="5196878"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2024 00:10:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; d="scan'208";a="12667824"
Received: from aravind-dev.iind.intel.com (HELO [10.145.162.146])
 ([10.145.162.146])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2024 00:10:16 -0700
Message-ID: <d26e6c71-81a3-4d43-9317-126ab5aeaca0@linux.intel.com>
Date: Fri, 15 Mar 2024 12:43:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/xe: Introduce a simple busted state
Content-Language: en-US
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>
References: <20240315010317.193756-1-rodrigo.vivi@intel.com>
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <20240315010317.193756-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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


On 15/03/24 06:33, Rodrigo Vivi wrote:
> Introduce a very simple 'busted' state where any attempt
> to access the GPU is entirely blocked.
>
> On some critical cases, like on gt_reset failure, we need to
> block any other attempt to use the GPU. Otherwise we are at
> a risk of reaching cases that would force us to reboot the machine.
>
> So, when this cases are identified we corner and block any GPU
> access. No IOCTL and not even another GT reset should be attempted.
>
> The 'busted' state in Xe is an end state with no way back.
> Only a device "re-probe" (unbind + bind) can restore the GPU access.
>
> v2: - s/wedged/busted (Lucas)
>     - use unbind+bind instead of module reload (Lucas)
>     - added more info on unbind operations and instruction on bug report
>     - only print the message once.
>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c       |  6 ++++++
>  drivers/gpu/drm/xe/xe_device.h       | 18 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_device_types.h |  3 +++
>  drivers/gpu/drm/xe/xe_gt.c           |  4 ++++
>  drivers/gpu/drm/xe/xe_migrate.c      |  6 ++++++
>  5 files changed, 37 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index b0bfe75eb59f..d02e59fb49eb 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -142,6 +142,9 @@ static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
>  	struct xe_device *xe = to_xe_device(file_priv->minor->dev);
>  	long ret;
>  
> +	if (xe_device_busted(xe))
> +		return -ECANCELED;
> +
>  	ret = xe_pm_runtime_get_ioctl(xe);
>  	if (ret >= 0)
>  		ret = drm_ioctl(file, cmd, arg);
> @@ -157,6 +160,9 @@ static long xe_drm_compat_ioctl(struct file *file, unsigned int cmd, unsigned lo
>  	struct xe_device *xe = to_xe_device(file_priv->minor->dev);
>  	long ret;
>  
> +	if (xe_device_busted(xe))
> +		return -ECANCELED;
> +
>  	ret = xe_pm_runtime_get_ioctl(xe);
>  	if (ret >= 0)
>  		ret = drm_compat_ioctl(file, cmd, arg);
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index 14be34d9f543..2c6d9b77821a 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -176,4 +176,22 @@ void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *p);
>  u64 xe_device_canonicalize_addr(struct xe_device *xe, u64 address);
>  u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address);
>  
> +static inline bool xe_device_busted(struct xe_device *xe)
> +{
> +	return atomic_read(&xe->busted);
> +}
> +
> +static inline void xe_device_declare_busted(struct xe_device *xe)
> +{
> +	if (!atomic_xchg(&xe->busted, 1))
> +		drm_err(&xe->drm,
> +			"CRITICAL: Xe has declared device %s as busted.\n"
> +			"IOCTLs and executions are blocked until device is probed again with unbind and bind operations:\n"
> +			"echo '%s' | sudo tee /sys/bus/pci/drivers/xe/unbind\n"
> +			"echo '%s' | sudo tee /sys/bus/pci/drivers/xe/bind\n"
> +			"Please file a _new_ bug report at https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n",
> +			dev_name(xe->drm.dev), dev_name(xe->drm.dev),
> +			dev_name(xe->drm.dev));
I know we set needs_flr_on_fini when GT reset fails and i can see in xe_driver_flr that FLR can fail, in such a case
do we need to do a bigger reset like warm reset(SBR)


Thanks,
Aravind.
> +}
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 9785eef2e5a4..2633fdfc1a38 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -455,6 +455,9 @@ struct xe_device {
>  	/** @needs_flr_on_fini: requests function-reset on fini */
>  	bool needs_flr_on_fini;
>  
> +	/** @busted: Xe device faced a critical error and is now blocked. */
> +	atomic_t busted;
> +
>  	/* private: */
>  
>  #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 85408e7a932b..2f29f7fa682b 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -633,6 +633,9 @@ static int gt_reset(struct xe_gt *gt)
>  {
>  	int err;
>  
> +	if (xe_device_busted(gt_to_xe(gt)))
> +		return -ECANCELED;
> +
>  	/* We only support GT resets with GuC submission */
>  	if (!xe_device_uc_enabled(gt_to_xe(gt)))
>  		return -ENODEV;
> @@ -686,6 +689,7 @@ static int gt_reset(struct xe_gt *gt)
>  	xe_gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));
>  
>  	gt_to_xe(gt)->needs_flr_on_fini = true;
> +	xe_device_declare_busted(gt_to_xe(gt));
>  
>  	return err;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index ee1bb938c493..d7eb409e8415 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -713,6 +713,9 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>  		xe_bo_needs_ccs_pages(src_bo) && xe_bo_needs_ccs_pages(dst_bo);
>  	bool copy_system_ccs = copy_ccs && (!src_is_vram || !dst_is_vram);
>  
> +	if (xe_device_busted(xe))
> +		return ERR_PTR(-ECANCELED);
> +
>  	/* Copying CCS between two different BOs is not supported yet. */
>  	if (XE_WARN_ON(copy_ccs && src_bo != dst_bo))
>  		return ERR_PTR(-EINVAL);
> @@ -986,6 +989,9 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>  	int err;
>  	int pass = 0;
>  
> +	if (xe_device_busted(xe))
> +		return ERR_PTR(-ECANCELED);
> +
>  	if (!clear_vram)
>  		xe_res_first_sg(xe_bo_sg(bo), 0, bo->size, &src_it);
>  	else
