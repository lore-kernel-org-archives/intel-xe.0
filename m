Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEFB8C7EE23
	for <intel-xe@archiver.kernel.org>; Fri, 19 May 2023 22:16:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76A5710E0E2;
	Fri, 19 May 2023 22:16:39 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 173A110E0E2
 for <intel-xe@lists.freedesktop.org>; Fri, 19 May 2023 22:16:36 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 720A961313;
 Fri, 19 May 2023 22:16:36 +0000 (UTC)
Received: from rdvivi-mobl4 (unknown [192.55.55.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id 815ACC433D2;
 Fri, 19 May 2023 22:16:34 +0000 (UTC)
Date: Fri, 19 May 2023 18:16:31 -0400
From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
To: Anshuman Gupta <anshuman.gupta@intel.com>
Message-ID: <ZGf1P0JzVkjR8O9a@rdvivi-mobl4>
References: <20230519162555.409853-1-anshuman.gupta@intel.com>
 <20230519162555.409853-5-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230519162555.409853-5-anshuman.gupta@intel.com>
Subject: Re: [Intel-xe] [PATCH 4/4] xe/drm/pm: manoeuvre d3cold_allowed
 using vram_usages
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

On Fri, May 19, 2023 at 09:55:55PM +0530, Anshuman Gupta wrote:
> Adding support to control d3cold by using vram_usages metric from
> ttm resource manager.
> When root port  is capable of d3cold but xe has disallowed d3cold
> due to vrame_usages above vram_d3ccold_threshol. It is required to
> disable d3cold to avoid any resume failure because root port may
> transition to d3cold when all of pcie endpoints and
> {upstream, virtual} switch ports will transition to D3hot.
> 
> TODO: At resume vram save/restore only in case card really lost power.
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pci.c | 24 ++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_pm.c  | 19 +++++++++++++++++++
>  drivers/gpu/drm/xe/xe_pm.h  |  1 +
>  3 files changed, 44 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 137026ddee42..1d12e1b5bb62 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -738,6 +738,25 @@ static int xe_pci_resume(struct device *dev)
>  	return 0;
>  }
>  
> +static void xe_pci_d3cold_enable_disable(struct pci_dev *pdev, bool enable)

static void d3cold_toggle(pdev, enable)?

we don't need prefix namespace for static functions and also toggle looks
better and shorter to type than enable_disable...

> +{
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> +	struct pci_dev *root_pdev;
> +
> +	if (!xe->d3cold_capable)
> +		return;
> +
> +	root_pdev = pcie_find_root_port(pdev);
> +	if (!root_pdev)
> +		return;
> +
> +	if (enable)
> +		pci_d3cold_enable(root_pdev);
> +	else
> +		pci_d3cold_disable(root_pdev);
> +
> +}
> +
>  static int xe_pci_runtime_suspend(struct device *dev)
>  {
>  	struct pci_dev *pdev = to_pci_dev(dev);
> @@ -755,6 +774,7 @@ static int xe_pci_runtime_suspend(struct device *dev)
>  		pci_ignore_hotplug(pdev);
>  		pci_set_power_state(pdev, PCI_D3cold);
>  	} else {
> +		xe_pci_d3cold_enable_disable(pdev, false);

and maybe an enum as the second argument...

>  		pci_set_power_state(pdev, PCI_D3hot);
>  	}
>  
> @@ -779,6 +799,8 @@ static int xe_pci_runtime_resume(struct device *dev)
>  			return err;
>  
>  		pci_set_master(pdev);
> +	} else {
> +		xe_pci_d3cold_enable_disable(pdev, true);
>  	}
>  
>  	return xe_pm_runtime_resume(xe);
> @@ -794,6 +816,8 @@ static int xe_pci_runtime_idle(struct device *dev)
>  		return 0;
>  	}
>  
> +	xe->d3cold_allowed = xe_pm_vram_d3cold_allowed(xe);
> +
>  	/*
>  	 * TODO: d3cold should be allowed (true) if
>  	 * (IS_DGFX(xe) && !xe_device_mem_access_ongoing(xe))
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index ebdbdf2e0898..c864dc2ac6c2 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -133,6 +133,25 @@ static bool xe_pm_pci_d3cold_capable(struct pci_dev *pdev)
>  	return true;
>  }
>  
> +bool xe_pm_vram_d3cold_allowed(struct xe_device *xe)
> +{
> +	struct ttm_resource_manager *man;
> +	u64 vram_used;
> +	size_t total_vram_used_mb = 0;
> +	int i;
> +
> +	/* TODO: Extend the logic to beyond XE_PL_VRAM1 */
> +	for (i = XE_PL_VRAM0; i <= XE_PL_VRAM1; ++i) {
> +		man = ttm_manager_type(&xe->ttm, i);
> +		if (man) {
> +			vram_used = ttm_resource_manager_usage(man);
> +			total_vram_used_mb += DIV_ROUND_UP_ULL(vram_used, 1024 * 1024);
> +		}
> +	}
> +
> +	return total_vram_used_mb <= xe->vram_d3cold_threshold;
> +}
> +
>  static ssize_t
>  vram_d3cold_threshold_show(struct device *dev,
>  			   struct device_attribute *attr, char *buf)
> diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
> index e0c4f92e27c5..6c0016470abf 100644
> --- a/drivers/gpu/drm/xe/xe_pm.h
> +++ b/drivers/gpu/drm/xe/xe_pm.h
> @@ -13,6 +13,7 @@ struct xe_device;
>  int xe_pm_suspend(struct xe_device *xe);
>  int xe_pm_resume(struct xe_device *xe);
>  
> +bool xe_pm_vram_d3cold_allowed(struct xe_device *xe);
>  void xe_pm_init(struct xe_device *xe);
>  void xe_pm_runtime_fini(struct xe_device *xe);
>  int xe_pm_runtime_suspend(struct xe_device *xe);
> -- 
> 2.38.0
> 
