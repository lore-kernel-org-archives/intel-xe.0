Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F6A5CCFA13
	for <intel-xe@archiver.kernel.org>; Sat,  8 Nov 2025 13:13:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81E0710E08D;
	Sat,  8 Nov 2025 13:13:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bQwOjnvB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57BE410E08D
 for <intel-xe@lists.freedesktop.org>; Sat,  8 Nov 2025 13:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762607603; x=1794143603;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=lLbyAQRVjTm/cgPfdBUDGPtwmlKaIhnVby/LwcQDUho=;
 b=bQwOjnvBqxqTOFjA3pKottmevnua0zor4q1G5Py/qzGJjndbA6fm13Sn
 vV+IZXTAdisPsfRjRJ7oj7gkGq+l8dRUSTghqDHyT552FtZxPsQrevKxJ
 1eoPSSWBFyO2GI0e4K29yzfciIvbx2rhezxNtNsWxCy4TeODoAt7V95RK
 xp/aHamiYDLxXE/pGUYrNQGy0tLEIfsz9ue0W1vBgt8FDM5wVS5wv5rQy
 UmhRD1sH6uoYB92sXCcSeRfWVNU+yZRQQr7Hu/zlI5ngCpZdxuonbH0kG
 6fnBW/eUtKv0U8JQ+KG54YF8Ej+3yRdcf2/17A+qAwPgmSRNiCzX63x3+ g==;
X-CSE-ConnectionGUID: opEbyMIMRTKXo3Ie9abMoQ==
X-CSE-MsgGUID: W2PjgwnORhigIlSPN9Mx1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="52297431"
X-IronPort-AV: E=Sophos;i="6.19,289,1754982000"; d="scan'208";a="52297431"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2025 05:13:22 -0800
X-CSE-ConnectionGUID: 9wVGvK9NS9OxfWc+AQrgSw==
X-CSE-MsgGUID: 07x2/ziSRh6hvnRZsjnqEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,289,1754982000"; d="scan'208";a="187579927"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2025 05:13:20 -0800
Date: Sat, 8 Nov 2025 14:13:17 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: lucas.demarchi@intel.com, intel-xe@lists.freedesktop.org,
 riana.tauro@intel.com, badal.nilawar@intel.com
Subject: Re: [PATCH v3] drm/xe/pm: Enable WAKE# support
Message-ID: <aQ9B7RvEhxzLGE-a@black.igk.intel.com>
References: <20251105145010.428268-1-raag.jadav@intel.com>
 <aQ66MkE7o8hwNGKK@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQ66MkE7o8hwNGKK@intel.com>
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

On Fri, Nov 07, 2025 at 10:34:10PM -0500, Rodrigo Vivi wrote:
> On Wed, Nov 05, 2025 at 08:20:10PM +0530, Raag Jadav wrote:
> > CRI supports signalling the host through WAKE# pin on smbus alerts
> > while in D3cold. Enable/disable this feature based on device/host
> > configuration. We also take user input into account in case the user
> > wants to enable/disable it from userspace.
> 
> I'm sorry, but this whole patch still makes no sense to me.
> 
> Let me summarize what I am seeing so you have the change to correct
> me or provide more info to show me where I'm not getting it:
> 
> We are reading a capability bit from pcode at init.
> we stash this bit in the d3cold.wake
> at **every** suspend we set this bit.
> we never ever clear this bit, but we continue setting it
> on every suspend.
> 
> Why?
> 
> Why do we need to keep setting if we are not clearing it?
> Why can't we simply set this once at init if we know we need it?
> 
> like, read the capability, check our i2c presence and set the bit
> and move on...
> 
> where am I getting this wrong?

Can you guarantee that pcode configurations persist through d3cold
cycle?

Raag

> > v2: Make wakeup helper static, drop d3cold argument (Rodrigo)
> > v3: Expand commit message, drop defeature on init (Rodrigo)
> > 
> > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_device_types.h |  4 +++
> >  drivers/gpu/drm/xe/xe_pcode_api.h    |  5 +++
> >  drivers/gpu/drm/xe/xe_pm.c           | 53 ++++++++++++++++++++++++++++
> >  3 files changed, 62 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > index a03cc83aa26f..602849fcd3aa 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -528,6 +528,10 @@ struct xe_device {
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
> > +
> >  #define   PCODE_LATE_BINDING			0x5C
> >  #define     GET_CAPABILITY_STATUS		0x0
> >  #define       V1_FAN_SUPPORTED			REG_BIT(0)
> > diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> > index 7b089e6fb63f..94a0b1c9acc6 100644
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
> > @@ -161,6 +164,29 @@ static void xe_rpm_lockmap_release(const struct xe_device *xe)
> >  			 &xe_pm_runtime_d3cold_map);
> >  }
> >  
> > +static void xe_pm_set_wakeup(struct xe_device *xe)
> > +{
> > +	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
> > +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> > +	struct pci_dev *root_pdev;
> > +	bool wakeup;
> > +	int ret;
> > +
> > +	/* Currently WAKE# is supported for I2C only */
> > +	if (!REG_FIELD_GET(I2C_WAKE_ENABLE, xe->d3cold.wake))
> > +		return;
> > +
> > +	root_pdev = pcie_find_root_port(pdev);
> > +	wakeup = root_pdev && device_may_wakeup(&root_pdev->dev);
> > +
> > +	ret = xe_pcode_write(root_tile, PCODE_MBOX(PCODE_D3COLD_WAKE, WRITE_MODE, 0),
> > +			     wakeup ? xe->d3cold.wake : 0);
> > +	if (ret)
> > +		return;
> > +
> > +	drm_dbg(&xe->drm, "WAKE# %s\n", str_enabled_disabled(wakeup));
> > +}
> > +
> >  /**
> >   * xe_pm_suspend - Helper for System suspend, i.e. S0->S3 / S0->S2idle
> >   * @xe: xe device instance
> > @@ -205,6 +231,8 @@ int xe_pm_suspend(struct xe_device *xe)
> >  
> >  	xe_i2c_pm_suspend(xe);
> >  
> > +	xe_pm_set_wakeup(xe);
> > +
> >  	drm_dbg(&xe->drm, "Device suspended\n");
> >  	xe_pm_block_end_signalling();
> >  
> > @@ -422,6 +450,27 @@ static int xe_pm_notifier_callback(struct notifier_block *nb,
> >  	return NOTIFY_DONE;
> >  }
> >  
> > +static void xe_pm_wakeup_init(struct xe_device *xe)
> > +{
> > +	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
> > +	int err;
> > +
> > +	if (xe->info.platform != XE_CRESCENTISLAND)
> > +		return;
> > +
> > +	err = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_D3COLD_WAKE, READ_MODE, 0),
> > +			    &xe->d3cold.wake, NULL);
> > +	if (err || !xe->d3cold.wake) {
> > +		drm_dbg(&xe->drm, "WAKE# not supported\n");
> > +		return;
> > +	}
> > +
> > +	if (!xe_i2c_present(xe))
> > +		xe->d3cold.wake &= ~I2C_WAKE_ENABLE;
> > +
> > +	drm_dbg(&xe->drm, "WAKE# configuration 0x%08x\n", xe->d3cold.wake);
> > +}
> > +
> >  /**
> >   * xe_pm_init - Initialize Xe Power Management
> >   * @xe: xe device instance
> > @@ -459,6 +508,7 @@ int xe_pm_init(struct xe_device *xe)
> >  			goto err_unregister;
> >  	}
> >  
> > +	xe_pm_wakeup_init(xe);
> >  	xe_pm_runtime_init(xe);
> >  	return 0;
> >  
> > @@ -602,6 +652,9 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
> >  
> >  	xe_i2c_pm_suspend(xe);
> >  
> > +	if (xe->d3cold.allowed)
> > +		xe_pm_set_wakeup(xe);
> > +
> >  	xe_rpm_lockmap_release(xe);
> >  	xe_pm_write_callback_task(xe, NULL);
> >  	return 0;
> > -- 
> > 2.34.1
> > 
