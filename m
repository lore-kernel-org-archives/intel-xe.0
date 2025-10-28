Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27637CCD1BF
	for <intel-xe@archiver.kernel.org>; Tue, 28 Oct 2025 05:12:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C26A110E301;
	Tue, 28 Oct 2025 05:12:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VtQC+TKK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B784A10E301
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Oct 2025 05:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761628333; x=1793164333;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=wGbFbwz71jVZNXWiaPqn7nwnwX44E43r3rPaXnPLhWY=;
 b=VtQC+TKKH1ccOxEG78Y8Yx/rTCI4w+GhJO5OQVI8r0bBGCDDw8dELJI5
 jdpOZLmmAnlqjXXHT2eeUEOKiEpAXOII0RToXrt6TsRRUyW7LkHCs4VF+
 hgbWDtjXV1O0eRBH03xFzjYcscqb9t0Ok7K7nUujPP8Zpyrpx+kGdqkM2
 lizVeR+zsMOsGS4NFBk8B3WoWm1oSs60THuvk/0+nQtolXTtYwz2kaxy6
 WurOyMYZbW+xgmoiu0UBry4tHoWyat3NL4674w7gtQpFTr01MIf7zZTPP
 wESUBnWZ4MfCRKiWs6QqZnWe3fa15SIfM4Fs9URVktwzi/7Xl7IERrk8F A==;
X-CSE-ConnectionGUID: Qp7StsiGQCaG3ey+jjhq4g==
X-CSE-MsgGUID: rWal6Dh4QCilmg/4NxH2Mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74838922"
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; d="scan'208";a="74838922"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 22:12:13 -0700
X-CSE-ConnectionGUID: nxi0fIL1RN6OVzbmyW870g==
X-CSE-MsgGUID: d4Ljz9a+RGuQvwiYCTjaww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; d="scan'208";a="184422697"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 22:12:12 -0700
Date: Tue, 28 Oct 2025 06:12:09 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: lucas.demarchi@intel.com, intel-xe@lists.freedesktop.org,
 riana.tauro@intel.com, badal.nilawar@intel.com
Subject: Re: [PATCH v1] drm/xe/pm: Enable WAKE# support
Message-ID: <aQBQqZvgBhHpViGR@black.igk.intel.com>
References: <20251024102148.3641819-1-raag.jadav@intel.com>
 <aP_c6nylO9L-swL7@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aP_c6nylO9L-swL7@intel.com>
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

On Mon, Oct 27, 2025 at 04:58:18PM -0400, Rodrigo Vivi wrote:
> On Fri, Oct 24, 2025 at 03:51:48PM +0530, Raag Jadav wrote:
> > CRI supports signalling the host through WAKE# pin on smbus alerts while
> > in D3cold. Enable/disable this feature based on device/host configuration.
> > 
> > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_device_types.h |  4 ++
> >  drivers/gpu/drm/xe/xe_pci.c          |  4 ++
> >  drivers/gpu/drm/xe/xe_pcode_api.h    |  5 ++
> >  drivers/gpu/drm/xe/xe_pm.c           | 72 ++++++++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_pm.h           |  1 +
> >  5 files changed, 86 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > index 8f62ee7a73ac..dae2bd06bcea 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -517,6 +517,10 @@ struct xe_device {
> >  		 * Default threshold value is 300mb.
> >  		 */
> >  		u32 vram_threshold;
> > +
> > +		/** @d3cold.wake: Indicates WAKE# capability of device */
> > +		u32 wake;
> > +
> >  		/** @d3cold.lock: protect vram_threshold */
> >  		struct mutex lock;
> >  	} d3cold;
> > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > index 6e59642e7820..edf63f55f345 100644
> > --- a/drivers/gpu/drm/xe/xe_pci.c
> > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > @@ -1105,6 +1105,8 @@ static int xe_pci_suspend(struct device *dev)
> >  	if (err)
> >  		return err;
> >  
> > +	xe_pm_set_wake(xe, true);
> 
> why does it need to be here and not something static inside xe_pm itself?

The expectation is this should be done only if xe_pm_suspend() is
successful or you can guarantee it.

> > +
> >  	/*
> >  	 * Enabling D3Cold is needed for S2Idle/S0ix.
> >  	 * It is save to allow here since xe_pm_suspend has evicted
> > @@ -1156,6 +1158,8 @@ static int xe_pci_runtime_suspend(struct device *dev)
> >  	if (err)
> >  		return err;
> >  
> > +	xe_pm_set_wake(xe, xe->d3cold.allowed);
> > +
> >  	pci_save_state(pdev);
> >  
> >  	if (xe->d3cold.allowed) {
> > diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
> > index 92bfcba51e19..3f8d43c1b4fe 100644
> > --- a/drivers/gpu/drm/xe/xe_pcode_api.h
> > +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
> > @@ -50,6 +50,11 @@
> >  #define	READ_PL_FROM_FW				0x1
> >  #define	READ_PL_FROM_PCODE			0x0
> >  
> > +#define   PCODE_D3COLD_WAKE			0x5A
> > +#define     READ_MODE				0x0
> > +#define     WRITE_MODE				0x1
> > +#define       I2C_WAKE_ENABLE			REG_BIT(1)
> 
> please share the spec with me
> 
> > +
> >  #define   PCODE_LATE_BINDING			0x5C
> >  #define     GET_CAPABILITY_STATUS		0x0
> >  #define       V1_FAN_SUPPORTED			REG_BIT(0)
> > diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> > index 53507e09f7bc..30e4a787b9cb 100644
> > --- a/drivers/gpu/drm/xe/xe_pm.c
> > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > @@ -7,6 +7,8 @@
> >  
> >  #include <linux/fault-inject.h>
> >  #include <linux/pm_runtime.h>
> > +#include <linux/pm_wakeup.h>
> > +#include <linux/string_choices.h>
> >  #include <linux/suspend.h>
> >  
> >  #include <drm/drm_managed.h>
> > @@ -22,6 +24,7 @@
> >  #include "xe_i2c.h"
> >  #include "xe_irq.h"
> >  #include "xe_late_bind_fw.h"
> > +#include "xe_pcode_api.h"
> >  #include "xe_pcode.h"
> >  #include "xe_pxp.h"
> >  #include "xe_sriov_vf_ccs.h"
> > @@ -422,6 +425,74 @@ static int xe_pm_notifier_callback(struct notifier_block *nb,
> >  	return NOTIFY_DONE;
> >  }
> >  
> > +void xe_pm_set_wake(struct xe_device *xe, bool d3cold)
> > +{
> > +	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
> > +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> > +	struct pci_dev *root_pdev;
> > +	bool wakeup;
> > +	u32 val = 0;
> > +	int ret;
> > +
> > +	/* WAKE# is not needed, let PME do the job. */
> > +	if (!d3cold)
> > +		return;
> 
> Please NO! check this outside and only call the function if needed instead
> of passing the need as argument.

Sure.

> > +
> > +	/* Currently WAKE# is supported for I2C only */
> > +	if (!REG_FIELD_GET(I2C_WAKE_ENABLE, xe->d3cold.wake))
> > +		return;
> 
> let's perhaps make it a
> 
> static void i2c_set_wake(struct xe_device *xe)
> {
> ...
> }

No, there are other usecases supported that we're not adding here (yet)
and we don't want to come back revamping/duplicating code when we need them.
Simply add a new bit and call it a day.

Raag

> > +
> > +	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_D3COLD_WAKE, READ_MODE, 0), &val, NULL);
> > +	if (ret)
> > +		return;
> > +
> > +	root_pdev = pcie_find_root_port(pdev);
> > +	wakeup = root_pdev && device_may_wakeup(&root_pdev->dev);
> > +
> > +	if (wakeup)
> > +		val |= I2C_WAKE_ENABLE;
> > +	else
> > +		val &= ~I2C_WAKE_ENABLE;
> > +
> > +	ret = xe_pcode_write(root_tile, PCODE_MBOX(PCODE_D3COLD_WAKE, WRITE_MODE, 0), val);
> > +	if (ret)
> > +		return;
> > +
> > +	drm_dbg(&xe->drm, "WAKE# %s\n", str_enabled_disabled(wakeup));
> > +}
> > +
> > +static void xe_pm_wake_init(struct xe_device *xe)
> > +{
> > +	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
> > +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> > +	struct pci_dev *root_pdev;
> > +	int err;
> > +
> > +	if (xe->info.platform != XE_CRESCENTISLAND)
> > +		return;
> > +
> > +	err = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_D3COLD_WAKE, READ_MODE, 0),
> > +			    &xe->d3cold.wake, NULL);
> > +	if (err || !xe->d3cold.wake) {
> > +		drm_dbg(&xe->drm, "WAKE# not supported by device\n");
> > +		return;
> > +	}
> > +
> > +	root_pdev = pcie_find_root_port(pdev);
> > +	if (!root_pdev || !device_can_wakeup(&root_pdev->dev)) {
> > +		drm_dbg(&xe->drm, "WAKE# not supported by host\n");
> > +		xe->d3cold.wake = 0;
> > +		goto out;
> > +	}
> > +
> > +	if (!xe_i2c_present(xe))
> > +		xe->d3cold.wake &= ~I2C_WAKE_ENABLE;
> > +
> > +	drm_dbg(&xe->drm, "WAKE# configuration 0x%08x\n", xe->d3cold.wake);
> > +out:
> > +	xe_pcode_write(root_tile, PCODE_MBOX(PCODE_D3COLD_WAKE, WRITE_MODE, 0), xe->d3cold.wake);
> > +}
> > +
> >  /**
> >   * xe_pm_init - Initialize Xe Power Management
> >   * @xe: xe device instance
> > @@ -459,6 +530,7 @@ int xe_pm_init(struct xe_device *xe)
> >  			goto err_unregister;
> >  	}
> >  
> > +	xe_pm_wake_init(xe);
> >  	xe_pm_runtime_init(xe);
> >  	return 0;
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
> > index f7f89a18b6fc..9cedba8a7f80 100644
> > --- a/drivers/gpu/drm/xe/xe_pm.h
> > +++ b/drivers/gpu/drm/xe/xe_pm.h
> > @@ -30,6 +30,7 @@ void xe_pm_runtime_get_noresume(struct xe_device *xe);
> >  bool xe_pm_runtime_resume_and_get(struct xe_device *xe);
> >  void xe_pm_assert_unbounded_bridge(struct xe_device *xe);
> >  int xe_pm_set_vram_threshold(struct xe_device *xe, u32 threshold);
> > +void xe_pm_set_wake(struct xe_device *xe, bool d3cold);
> >  void xe_pm_d3cold_allowed_toggle(struct xe_device *xe);
> >  bool xe_rpm_reclaim_safe(const struct xe_device *xe);
> >  struct task_struct *xe_pm_read_callback_task(struct xe_device *xe);
> > -- 
> > 2.34.1
> > 
