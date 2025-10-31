Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F324CCCF9EE
	for <intel-xe@archiver.kernel.org>; Fri, 31 Oct 2025 08:03:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A868E10EAC3;
	Fri, 31 Oct 2025 08:03:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KZqNCcJY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3406610EABC
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Oct 2025 08:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761897814; x=1793433814;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=D5QF7OO9rcmYE1MIMTuVIKEHR6joTJyU/aZitdEu7Yc=;
 b=KZqNCcJYFtVS5mBusM7Tup04k8N1M3bLuOHRLfoXG9ZFdQrTEXGZpIDz
 ERNyBalVng2odmqx6i1Mc91ia9/eA6MhJz9FmJrWEsGXxJURFhpL047jp
 rt4K7ohxbh0URSPFfQCFdDufcT0jIvTuFL9PDX/HAiFpy4pgksK07NSFe
 D7ljBZgIsomwb5iXcPyKhHHeyDeiOXMaAGISvlnOo77rIgXmqHfc0k2zJ
 rPQWtb/oUv8mDgEJO+hNvdl8LeN5Ed7BTiFl9jmlFm2AYwBGjOGwoXhAh
 VqaSZttMJ+58vDd4SetsqE+QGgMDxnl4/hncaXsat2rXFqd2490sDYAJ5 A==;
X-CSE-ConnectionGUID: 8R3IaeQaSF+c0qcKubw4Ng==
X-CSE-MsgGUID: /YdXvxMOSu2/MTCa072nZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="75503056"
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; d="scan'208";a="75503056"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 01:03:34 -0700
X-CSE-ConnectionGUID: mmrtAxbaSHyiXzOQCkjNtQ==
X-CSE-MsgGUID: iZ4YLsG7RQWBYKUu2BryEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; d="scan'208";a="186914889"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 01:03:32 -0700
Date: Fri, 31 Oct 2025 09:03:29 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: lucas.demarchi@intel.com, intel-xe@lists.freedesktop.org,
 riana.tauro@intel.com, badal.nilawar@intel.com
Subject: Re: [PATCH v2] drm/xe/pm: Enable WAKE# support
Message-ID: <aQRtUa_Q9Yc-0Fft@black.igk.intel.com>
References: <20251030112751.110634-1-raag.jadav@intel.com>
 <aQOsB-jRCbGPnjAn@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQOsB-jRCbGPnjAn@intel.com>
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

On Thu, Oct 30, 2025 at 02:18:47PM -0400, Rodrigo Vivi wrote:
> On Thu, Oct 30, 2025 at 04:57:51PM +0530, Raag Jadav wrote:
> > CRI supports signalling the host through WAKE# pin on smbus alerts while
> > in D3cold. Enable/disable this feature based on device/host configuration.
> 
> Could you please expand this explanation a bit further?
> The doc you shared has the bit information, but it doesn't explain
> what that has to do with the device_may_wakeup or device_can_wakeup.

There's a requirement to enable/disable it for debug cases so we also
take user input into account. Will add this.

> I also don't understand the cases in which the can_wakeup will
> be set to false and more specifically what does it have to do with the
> ability of toggle of WAKE uppon host_i2c_alert.

We defeature it if not supported by host but I see your point.

> Perhaps I need more coffee here today, but anyway I believe it should
> be documented here for people like me on similar situation (needing more
> coffee :))

Yeah, we already brought it back so now we can have as much as we want ;)

> oh, and more below...
> 
> 
> > 
> > v2: Make wakeup helper static, drop d3cold argument (Rodrigo)
> > 
> > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_device_types.h |  4 ++
> >  drivers/gpu/drm/xe/xe_pcode_api.h    |  5 +++
> >  drivers/gpu/drm/xe/xe_pm.c           | 66 ++++++++++++++++++++++++++++
> >  3 files changed, 75 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > index dc17f63f9353..1249ca50a65c 100644
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
> > index 7b089e6fb63f..04621bbd0b44 100644
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
> > @@ -205,6 +231,9 @@ int xe_pm_suspend(struct xe_device *xe)
> >  
> >  	xe_i2c_pm_suspend(xe);
> >  
> > +	/* Should be the last call in suspend path */
> 
> I don't believe this kind of comment is needed.
> But also please explain why this is needed as the last call in the suspend
> path, specially if no unset is done anywhere after the init...

Why bother setting wakeup if we're not suspended yet?

> > +	xe_pm_set_wakeup(xe);
> > +
> >  	drm_dbg(&xe->drm, "Device suspended\n");
> >  	xe_pm_block_end_signalling();
> >  
> > @@ -422,6 +451,38 @@ static int xe_pm_notifier_callback(struct notifier_block *nb,
> >  	return NOTIFY_DONE;
> >  }
> >  
> > +static void xe_pm_wakeup_init(struct xe_device *xe)
> > +{
> > +	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
> > +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> > +	struct pci_dev *root_pdev;
> > +	u32 val = 0;
> > +	int err;
> > +
> > +	if (xe->info.platform != XE_CRESCENTISLAND)
> > +		return;
> > +
> > +	err = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_D3COLD_WAKE, READ_MODE, 0), &val, NULL);
> > +	if (err || !val) {
> > +		drm_dbg(&xe->drm, "WAKE# not supported by device\n");
> > +		return;
> > +	}
> > +
> > +	root_pdev = pcie_find_root_port(pdev);
> > +	if (!root_pdev || !device_can_wakeup(&root_pdev->dev)) {
> > +		drm_dbg(&xe->drm, "WAKE# not supported by host\n");
> > +		goto out;
> > +	}
> > +
> > +	if (!xe_i2c_present(xe))
> > +		val &= ~I2C_WAKE_ENABLE;
> > +
> > +	xe->d3cold.wake = val;
> > +	drm_dbg(&xe->drm, "WAKE# configuration 0x%08x\n", xe->d3cold.wake);
> > +out:
> > +	xe_pcode_write(root_tile, PCODE_MBOX(PCODE_D3COLD_WAKE, WRITE_MODE, 0), xe->d3cold.wake);
> 
> Why do we need to initialize this with 0? Why don't we need to reset to zero
> upon resume?

Good point. Will drop it.

Raag

> > +}
> > +
> >  /**
> >   * xe_pm_init - Initialize Xe Power Management
> >   * @xe: xe device instance
> > @@ -459,6 +520,7 @@ int xe_pm_init(struct xe_device *xe)
> >  			goto err_unregister;
> >  	}
> >  
> > +	xe_pm_wakeup_init(xe);
> >  	xe_pm_runtime_init(xe);
> >  	return 0;
> >  
> > @@ -602,6 +664,10 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
> >  
> >  	xe_i2c_pm_suspend(xe);
> >  
> > +	/* Should be the last call in suspend path */
> > +	if (xe->d3cold.allowed)
> > +		xe_pm_set_wakeup(xe);
> > +
> >  	xe_rpm_lockmap_release(xe);
> >  	xe_pm_write_callback_task(xe, NULL);
> >  	return 0;
> > -- 
> > 2.34.1
> > 
