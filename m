Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22183C88E53
	for <intel-xe@archiver.kernel.org>; Tue, 15 Sep 2026 07:43:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C781010FAAE;
	Tue, 15 Sep 2026 07:43:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XVBC3gd1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A65DE10FAAD;
 Tue, 15 Sep 2026 07:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789458193; x=1820994193;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=igs3QBGhGBrMy22ozYcuBOuK4W1daD7Ckjvvva2z7Dk=;
 b=XVBC3gd1n20iHzD77g9MTtk+DpZbz/i7mPB6BmAwH9Q6A9eNH19HKM8c
 +ipuxR48W5Qazfm6t3HHchC/ZZPXBdaZjif94BnEVlm++hotbRz5b/P3r
 gRXPFtLfZh/xUBdJi4G6aKAiWLQqsjVo14Z69lWBITyx46/I3UUIiR4tL
 BWP53C0Rta2t3VMTQMBZFokdYbr5yO+jW/1N8fzcVFLsaCnkjvXwJZrMl
 IQZYBStySsoFXGA1sMv3FtLYUxJA9P9h8iZsdEa973ZHsqrnH5oivIMVj
 gyU5Ev6RtMk6M+JfyzhnosQ1HIvx8VHy2eLZX7o4fhy83CRuZj8fNMfSv g==;
X-CSE-ConnectionGUID: HIMFRbdFTTyYIY4QbAyKFg==
X-CSE-MsgGUID: ECgLa1wJQA2WxD7b8Yxyzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89945620"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="89945620"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 00:43:12 -0700
X-CSE-ConnectionGUID: vtGsUCK2QAqQdq4r5LAeAQ==
X-CSE-MsgGUID: lwYBJ9RfQJq19Kl/2OOjWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="297897673"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 00:43:11 -0700
Date: Tue, 15 Sep 2026 09:43:08 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Vinod Govindapillai <vinod.govindapillai@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 jouni.hogander@intel.com
Subject: Re: [PATCH v7 2/7] drm/xe/pm: introduce PM PME support
Message-ID: <aqj3DN5CzZVOCByy@black.igk.intel.com>
References: <20260914204034.309566-1-vinod.govindapillai@intel.com>
 <20260914204034.309566-3-vinod.govindapillai@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914204034.309566-3-vinod.govindapillai@intel.com>
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

On Mon, Sep 14, 2026 at 11:40:29PM +0300, Vinod Govindapillai wrote:
> Introduce PME support for PME capable devices. Whether device is
> PME capable is assessed during PCI probe routine. And the whether
> PME is enabled for a specific context is assessed during the PM
> runtime suspend call if the device is PME capable.
> 
> If the PME is enabled, HPDs can generate PME which in turn call
> the runtime resume call and do the wakeup routines. Till now
> the driver was relying on HPD polling to wakeup in case of any
> HPDs. HPD polling can be avoided in platforms with PME support
> and instead rely on this PCI PME for HPD induced wakeup.
> 
> v2: access functions for xe.pme.enabled status and clear the pme.
>     enabled in case of error in xe_pm_runtime_suspend()
> 
> v3: use the local pme_enabled flag to clear the device wakeup
>     incase of error
> 
> Bspec: 52979, 52980, 68857, 68867, 68970
> Assisted-by: GitHub_Copilot:claude-opus-5
> Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_types.h | 13 ++++++++++
>  drivers/gpu/drm/xe/xe_pci.c          | 16 +++++++++++-
>  drivers/gpu/drm/xe/xe_pm.c           | 39 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_pm.h           |  2 ++
>  4 files changed, 69 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 4661bfce2f4e..bb4234f00453 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -460,6 +460,19 @@ struct xe_device {
>  		struct mutex lock;
>  	} d3cold;
>  
> +	/** @pme: Encapsulate pme related stuff */
> +	struct {
> +		/** @pme.capable: Indicates if device is PME capable */
> +		bool capable;
> +
> +		/** @pme.enabled:
> +		 *
> +		 * Indicates if PME is enabled - depends on user controllable
> +		 * sysfs interface as well
> +		 */
> +		bool enabled;
> +	} pme;
> +
>  	/** @pm_notifier: Our PM notifier to perform actions in response to various PM events. */
>  	struct notifier_block pm_notifier;
>  	/** @pm_block: Completion to block validating tasks on suspend / hibernate prepare */
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 30c81042145f..3e7ee67c46f9 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -1384,8 +1384,14 @@ static int xe_pci_runtime_suspend(struct device *dev)
>  {
>  	struct pci_dev *pdev = to_pci_dev(dev);
>  	struct xe_device *xe = pdev_to_xe_device(pdev);
> +	bool pme_enabled;
>  	int err;
>  
> +	pme_enabled = xe->pme.capable && !xe->d3cold.allowed &&
> +		      pci_enable_wake(pdev, PCI_D3hot, true) == 0;

Can't all this debt be avoided by simply letting the PCI PM take care
of it?

Raag

> +	xe_pm_update_pme_enabled(xe, pme_enabled);
> +
>  	/*
>  	 * We hold an additional reference to the runtime PM to keep PF in D0
>  	 * during VFs lifetime, as our VFs do not implement the PM capability.
> @@ -1396,8 +1402,14 @@ static int xe_pci_runtime_suspend(struct device *dev)
>  	xe_assert(xe, !pci_num_vf(pdev));
>  
>  	err = xe_pm_runtime_suspend(xe);
> -	if (err)
> +	if (err) {
> +		if (pme_enabled) {
> +			pci_enable_wake(pdev, PCI_D3hot, false);
> +			xe_pm_update_pme_enabled(xe, false);
> +		}
> +
>  		return err;
> +	}
>  
>  	pci_save_state(pdev);
>  
> @@ -1426,6 +1438,8 @@ static int xe_pci_runtime_resume(struct device *dev)
>  
>  	pci_restore_state(pdev);
>  
> +	xe_pm_update_pme_enabled(xe, false);
> +
>  	if (xe->d3cold.allowed) {
>  		err = pci_enable_device(pdev);
>  		if (err)
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index f517bf453b54..ca5665d015e9 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -78,6 +78,8 @@
>   * management (RPS).
>   */
>  
> +#define HAS_PM_PME_SUPPORT(xe) (GRAPHICS_VERx100(xe) >= 3500)
> +
>  #ifdef CONFIG_LOCKDEP
>  static struct lockdep_map xe_pm_runtime_d3cold_map = {
>  	.name = "xe_rpm_d3cold_map"
> @@ -384,6 +386,14 @@ int xe_pm_init_early(struct xe_device *xe)
>  }
>  ALLOW_ERROR_INJECTION(xe_pm_init_early, ERRNO); /* See xe_pci_probe() */
>  
> +static bool xe_pm_pci_pme_capable(struct xe_device *xe)
> +{
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +
> +	return HAS_PM_PME_SUPPORT(xe) ?
> +		pci_pme_capable(pdev, PCI_D3hot) : false;
> +}
> +
>  /**
>   * xe_pm_probe() - Initialize Xe Power Management
>   * @xe: the &xe_device instance
> @@ -397,6 +407,9 @@ int xe_pm_probe(struct xe_device *xe)
>  	xe->d3cold.capable = xe_pm_pci_d3cold_capable(xe);
>  	xe_dbg(xe, "d3cold: capable=%s\n", str_yes_no(xe->d3cold.capable));
>  
> +	xe->pme.capable = xe_pm_pci_pme_capable(xe);
> +	xe_dbg(xe, "pme: capable=%s\n", str_yes_no(xe->pme.capable));
> +
>  	return 0;
>  }
>  
> @@ -650,6 +663,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>  	return 0;
>  
>  out_resume:
> +	xe_pm_update_pme_enabled(xe, false);
>  	xe_display_pm_runtime_resume(xe);
>  	xe_pxp_pm_resume(xe->pxp);
>  out:
> @@ -993,6 +1007,31 @@ int xe_pm_set_vram_threshold(struct xe_device *xe, u32 threshold)
>  	return 0;
>  }
>  
> +/**
> + * xe_pm_pme_enabled - get the current state of PME enabled status
> + * @xe: xe device instance
> + *
> + * Return:
> + * * True if PME is enabled, false otherwise.
> + */
> +bool xe_pm_pme_enabled(struct xe_device *xe)
> +{
> +	return xe->pme.enabled;
> +}
> +
> +/**
> + * xe_pm_update_pme_enabled - Update the PME enabled state
> + * @xe: xe device instance
> + * @status: New PME enabled status
> + *
> + * Called during runtime suspend / resume with status set to True if PME is
> + * enabled during runtime_suspend. Cleared on runtime_resume.
> + */
> +void xe_pm_update_pme_enabled(struct xe_device *xe, bool status)
> +{
> +	xe->pme.enabled = status;
> +}
> +
>  /**
>   * xe_pm_d3cold_allowed_toggle - Check conditions to toggle d3cold.allowed
>   * @xe: xe device instance
> diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
> index 6d5ab09cb769..037c73ea4342 100644
> --- a/drivers/gpu/drm/xe/xe_pm.h
> +++ b/drivers/gpu/drm/xe/xe_pm.h
> @@ -33,6 +33,8 @@ bool xe_pm_runtime_resume_and_get(struct xe_device *xe);
>  void xe_pm_assert_unbounded_bridge(struct xe_device *xe);
>  int xe_pm_set_vram_threshold(struct xe_device *xe, u32 threshold);
>  void xe_pm_d3cold_allowed_toggle(struct xe_device *xe);
> +bool xe_pm_pme_enabled(struct xe_device *xe);
> +void xe_pm_update_pme_enabled(struct xe_device *xe, bool status);
>  bool xe_rpm_reclaim_safe(const struct xe_device *xe);
>  struct task_struct *xe_pm_read_callback_task(struct xe_device *xe);
>  int xe_pm_block_on_suspend(struct xe_device *xe);
> -- 
> 2.43.0
> 
