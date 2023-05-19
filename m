Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AB26C77B7A
	for <intel-xe@archiver.kernel.org>; Fri, 19 May 2023 22:08:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B54F110E0E2;
	Fri, 19 May 2023 22:08:06 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25FF910E0E2
 for <intel-xe@lists.freedesktop.org>; Fri, 19 May 2023 22:08:04 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 70B3C641B2;
 Fri, 19 May 2023 22:08:03 +0000 (UTC)
Received: from rdvivi-mobl4 (unknown [192.55.55.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id F0174C433D2;
 Fri, 19 May 2023 22:08:00 +0000 (UTC)
Date: Fri, 19 May 2023 18:07:58 -0400
From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
To: Anshuman Gupta <anshuman.gupta@intel.com>
Message-ID: <ZGfzPuZbV6PAeKvq@rdvivi-mobl4>
References: <20230519162555.409853-1-anshuman.gupta@intel.com>
 <20230519162555.409853-4-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230519162555.409853-4-anshuman.gupta@intel.com>
Subject: Re: [Intel-xe] [PATCH 3/4] drm/xe/pm: Add vram_d3cold_threshold
 Sysfs
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
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, May 19, 2023 at 09:55:54PM +0530, Anshuman Gupta wrote:
> Add per pci device vram_d3cold_threshold Sysfs to
> control the d3cold_allowed knob.
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_types.h |  8 ++++
>  drivers/gpu/drm/xe/xe_pm.c           | 65 ++++++++++++++++++++++++++++
>  2 files changed, 73 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 8fd3acf60719..68222a3447cf 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -272,6 +272,14 @@ struct xe_device {
>  	/** @d3cold_allowed: Indicates if d3cold is a valid device state */
>  	bool d3cold_allowed;
>  
> +	/**
> +	 * @vram_d3cold_threshold is the permissible threshold(in megabytes)
> +	 * for vram save/restore. d3cold will be disallowed, when vram_usages is
> +	 * above threshold value to avoid the vram save/restore latency.
> +	 * Default threshold value is 300mb.
> +	 */
> +	u32 vram_d3cold_threshold;
> +
>  	/* private: */
>  
>  #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index c250a36b99ad..ebdbdf2e0898 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -7,6 +7,7 @@
>  
>  #include <linux/pm_runtime.h>
>  
> +#include <drm/drm_managed.h>
>  #include <drm/ttm/ttm_placement.h>
>  
>  #include "xe_bo.h"
> @@ -132,6 +133,68 @@ static bool xe_pm_pci_d3cold_capable(struct pci_dev *pdev)
>  	return true;
>  }
>  
> +static ssize_t
> +vram_d3cold_threshold_show(struct device *dev,
> +			   struct device_attribute *attr, char *buf)
> +{
> +	struct pci_dev *pdev = to_pci_dev(dev);
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> +	int ret;
> +
> +	if (!xe)
> +		return -EINVAL;
> +
> +	ret = sysfs_emit(buf, "%d\n", xe->vram_d3cold_threshold);
> +
> +	return ret;
> +}
> +
> +static ssize_t
> +vram_d3cold_threshold_store(struct device *dev, struct device_attribute *attr,
> +			    const char *buff, size_t count)
> +{
> +	struct pci_dev *pdev = to_pci_dev(dev);
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> +	u32 vram_d3cold_threshold;
> +	int ret;
> +
> +	if (!xe)
> +		return -EINVAL;
> +
> +	ret = kstrtou32(buff, 0, &vram_d3cold_threshold);
> +	if (ret)
> +		return ret;
> +
> +	dev_dbg(dev, "vram_d3cold_threshold: %d\n", vram_d3cold_threshold);
> +
> +	xe->vram_d3cold_threshold = vram_d3cold_threshold;
> +
> +	return ret ?: count;
> +}
> +
> +DEVICE_ATTR_RW(vram_d3cold_threshold);
> +
> +void xe_pm_sysfs_fini(struct drm_device *drm, void *arg)
> +{
> +	struct xe_device *xe = arg;
> +
> +	sysfs_remove_file(&xe->drm.dev->kobj, &dev_attr_vram_d3cold_threshold.attr);
> +}
> +
> +int xe_pm_sysfs_init(struct xe_device *xe)
> +{
> +	struct device *dev = xe->drm.dev;
> +	int ret;
> +
> +	ret = sysfs_create_file(&dev->kobj, &dev_attr_vram_d3cold_threshold.attr);
> +	if (ret)
> +		return ret;
> +
> +	ret = drmm_add_action_or_reset(&xe->drm, xe_pm_sysfs_fini, xe);
> +
> +	return ret;
> +}
> +

Let's not spread sysfs files all around the code and create new components
as they fit.

I know we only have a sysfs per gt, so probably time to create the per
device: xe_device_sysfs.{c,h,_types.h}

>  static void xe_pm_runtime_init(struct xe_device *xe)
>  {
>  	struct device *dev = xe->drm.dev;
> @@ -150,6 +213,8 @@ void xe_pm_init(struct xe_device *xe)
>  
>  	xe_pm_runtime_init(xe);
>  	xe->d3cold_capable = xe_pm_pci_d3cold_capable(pdev);
> +	xe->vram_d3cold_threshold = 300;
> +	xe_pm_sysfs_init(xe);
>  }
>  
>  void xe_pm_runtime_fini(struct xe_device *xe)
> -- 
> 2.38.0
> 
