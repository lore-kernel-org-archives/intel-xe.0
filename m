Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFD46F4198F
	for <intel-xe@archiver.kernel.org>; Wed, 15 Apr 2026 10:54:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8426310E6BC;
	Wed, 15 Apr 2026 10:54:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kiFRlctD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78A1D10E6BC
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Apr 2026 10:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776250477; x=1807786477;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=VtdCfeEH/9XyRzaMo+WJiJIgGP/y+htG0sQT8UkZb34=;
 b=kiFRlctDWe6p0Yog27oLl0qL8ObUXYizrzKNIYJcFpIBQgFZ9a1tyaun
 tzyb2MyGvQi8U8vBUoRt3rTvPxBGxrFc4/KxY8zyx3C6Zvz1UMU05HBMc
 Skuhds2alOqIgqxD+OioULu329KWORnCFnM3NcrXXHTiSzMf6iGJbJkL4
 bVKysfGVYDwrd6YXdb8VOSgbCmJmm/BH79wwQy1phu5br7X4QDkze8Ufo
 ecp/R8xNqb6EwCaf5Y/9zd8GM0auDit49J2CYbPbT81eYFP9XVjLuRlgv
 0Z8JYTElBVhRQjnN5hQrs0oru3S2BfL8Quntq/edHhdS54yEaOMBeZxwl A==;
X-CSE-ConnectionGUID: I+rjckeQQXixDJ2kPZF8ng==
X-CSE-MsgGUID: FI3A/Y7DRbSZ3BcfhhdccA==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="76389592"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="76389592"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 03:54:37 -0700
X-CSE-ConnectionGUID: S8Z1LxDbRkC+5OMrLk8OGg==
X-CSE-MsgGUID: mekFF2fFTPilhGR/KFiX1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="230242291"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 03:54:34 -0700
Date: Wed, 15 Apr 2026 12:54:31 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: "Laguna, Lukasz" <lukasz.laguna@intel.com>
Cc: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com,
 riana.tauro@intel.com, michal.wajdeczko@intel.com,
 matthew.d.roper@intel.com, michal.winiarski@intel.com,
 matthew.auld@intel.com, maarten@lankhorst.se, jani.nikula@intel.com,
 zhanjun.dong@intel.com, lukas@wunner.de
Subject: Re: [PATCH v5 9/9] drm/xe/pci: Introduce PCIe FLR
Message-ID: <ad9uZwHL9KFneLWq@black.igk.intel.com>
References: <20260406140722.154445-1-raag.jadav@intel.com>
 <20260406140722.154445-10-raag.jadav@intel.com>
 <3b6e0cd3-9d8c-42cd-8ca8-f67bb59110d4@intel.com>
 <ad9eW3OlG6vCxOMs@black.igk.intel.com>
 <d0fc86ed-2788-4dd8-8741-88370965b034@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d0fc86ed-2788-4dd8-8741-88370965b034@intel.com>
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

On Wed, Apr 15, 2026 at 12:33:41PM +0200, Laguna, Lukasz wrote:
> On 4/15/2026 11:46, Raag Jadav wrote:
> > On Wed, Apr 15, 2026 at 10:43:53AM +0200, Laguna, Lukasz wrote:
> > > On 4/6/2026 16:07, Raag Jadav wrote:
> > > > With bare minimum pieces in place, we can finally introduce PCIe Function
> > > > Level Reset (FLR) handling which re-initializes hardware state without the
> > > > need for reloading the driver from userspace. All VRAM contents are lost
> > > > along with hardware state and driver takes care of recreating the required
> > > > kernel bos as part of re-initialization, but user still needs to recreate
> > > > user bos and reload context after PCIe FLR.
> > > > 
> > > > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > > > ---
> > > > v2: Spell out Function Level Reset (Jani)
> > > > v5: Prevent PM ref leak for wedged device (Matthew Brost)
> > > > ---
> > > >    drivers/gpu/drm/xe/Makefile          |   1 +
> > > >    drivers/gpu/drm/xe/xe_device_types.h |   3 +
> > > >    drivers/gpu/drm/xe/xe_pci.c          |   1 +
> > > >    drivers/gpu/drm/xe/xe_pci.h          |   2 +
> > > >    drivers/gpu/drm/xe/xe_pci_err.c      | 160 +++++++++++++++++++++++++++
> > > >    5 files changed, 167 insertions(+)
> > > >    create mode 100644 drivers/gpu/drm/xe/xe_pci_err.c
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > > > index f9abaf687d46..06b5d53e1629 100644
> > > > --- a/drivers/gpu/drm/xe/Makefile
> > > > +++ b/drivers/gpu/drm/xe/Makefile
> > > > @@ -100,6 +100,7 @@ xe-y += xe_bb.o \
> > > >    	xe_page_reclaim.o \
> > > >    	xe_pat.o \
> > > >    	xe_pci.o \
> > > > +	xe_pci_err.o \
> > > >    	xe_pci_rebar.o \
> > > >    	xe_pcode.o \
> > > >    	xe_pm.o \
> > > > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > > > index 150c76b2acaf..b743b3986205 100644
> > > > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > > > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > > > @@ -482,6 +482,9 @@ struct xe_device {
> > > >    	/** @needs_flr_on_fini: requests function-reset on fini */
> > > >    	bool needs_flr_on_fini;
> > > > +	/** @flr_prepared: Prepared for function-reset */
> > > > +	bool flr_prepared;
> > > > +
> > > >    	/** @wedged: Struct to control Wedged States and mode */
> > > >    	struct {
> > > >    		/** @wedged.flag: Xe device faced a critical error and is now blocked. */
> > > > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > > > index 26eb58e11056..f3515c91e534 100644
> > > > --- a/drivers/gpu/drm/xe/xe_pci.c
> > > > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > > > @@ -1332,6 +1332,7 @@ static struct pci_driver xe_pci_driver = {
> > > >    #ifdef CONFIG_PM_SLEEP
> > > >    	.driver.pm = &xe_pm_ops,
> > > >    #endif
> > > > +	.err_handler = &xe_pci_err_handlers,
> > > >    };
> > > >    /**
> > > > diff --git a/drivers/gpu/drm/xe/xe_pci.h b/drivers/gpu/drm/xe/xe_pci.h
> > > > index 11bcc5fe2c5b..85e85e8508c3 100644
> > > > --- a/drivers/gpu/drm/xe/xe_pci.h
> > > > +++ b/drivers/gpu/drm/xe/xe_pci.h
> > > > @@ -8,6 +8,8 @@
> > > >    struct pci_dev;
> > > > +extern const struct pci_error_handlers xe_pci_err_handlers;
> > > > +
> > > >    int xe_register_pci_driver(void);
> > > >    void xe_unregister_pci_driver(void);
> > > >    struct xe_device *xe_pci_to_pf_device(struct pci_dev *pdev);
> > > > diff --git a/drivers/gpu/drm/xe/xe_pci_err.c b/drivers/gpu/drm/xe/xe_pci_err.c
> > > > new file mode 100644
> > > > index 000000000000..339e8688d37f
> > > > --- /dev/null
> > > > +++ b/drivers/gpu/drm/xe/xe_pci_err.c
> > > > @@ -0,0 +1,160 @@
> > > > +// SPDX-License-Identifier: MIT
> > > > +/*
> > > > + * Copyright © 2026 Intel Corporation
> > > > + */
> > > > +
> > > > +#include "xe_bo_evict.h"
> > > > +#include "xe_device.h"
> > > > +#include "xe_gt.h"
> > > > +#include "xe_gt_idle.h"
> > > > +#include "xe_i2c.h"
> > > > +#include "xe_irq.h"
> > > > +#include "xe_late_bind_fw.h"
> > > > +#include "xe_pci.h"
> > > > +#include "xe_pcode.h"
> > > > +#include "xe_printk.h"
> > > > +#include "xe_pxp.h"
> > > > +#include "xe_wa.h"
> > > > +
> > > > +/* TODO: Extend support as a follow-up */
> > > > +#define XE_FLR_SKIP		(!IS_DGFX(xe) || IS_SRIOV_VF(xe) || pci_num_vf(pdev) || \
> > > Any known issues on integrated platforms? I checked it on PTL and didn't
> > > notice any problems. Everything seems to work fine with display disabled.
> > Thank you. Can I add your Tested-by on this? I can include integrated
> > in next rev with it.
> 
> I triggered an FLR, which completed successfully, then executed
> xe_exec_basic and xe_exec_store and both passed. If that level of validation
> is sufficient, then feel free to add my Tested-by.

I think it should be sufficient for what we hope to achieve in this
series, which is re-initialize GT enough to run new workload.

We definitely need wider coverage, but let's take it piece by piece.

Raag

> > > > +				 xe->info.probe_display)
> > > > +
> > > > +static int xe_flr_prepare(struct xe_device *xe)
> > > > +{
> > > > +	struct xe_gt *gt;
> > > > +	int err;
> > > > +	u8 id;
> > > > +
> > > > +	err = xe_pxp_pm_suspend(xe->pxp);
> > > > +	if (err)
> > > > +		return err;
> > > > +
> > > > +	xe_late_bind_wait_for_worker_completion(&xe->late_bind);
> > > > +
> > > > +	xe_irq_disable(xe);
> > > > +
> > > > +	for_each_gt(gt, xe, id)
> > > > +		xe_gt_flr_prepare(gt);
> > > > +
> > > > +	// TODO: Drop all user bos
> > > > +	xe_bo_pci_dev_remove_pinned(xe);
> > > > +	unmap_mapping_range(xe->drm.anon_inode->i_mapping, 0, 0, 1);
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +static int xe_flr_done(struct xe_device *xe)
> > > > +{
> > > > +	struct xe_tile *tile;
> > > > +	struct xe_gt *gt;
> > > > +	int err;
> > > > +	u8 id;
> > > > +
> > > > +	for_each_gt(gt, xe, id)
> > > > +		xe_gt_idle_disable_c6(gt);
> > > > +
> > > > +	for_each_tile(tile, xe, id)
> > > > +		xe_wa_apply_tile_workarounds(tile);
> > > > +
> > > > +	err = xe_pcode_ready(xe, true);
> > > > +	if (err)
> > > > +		return err;
> > > > +
> > > > +	xe_device_assert_lmem_ready(xe);
> > > > +
> > > > +	err = xe_bo_restore_map(xe);
> > > > +	if (err)
> > > > +		return err;
> > > > +
> > > > +	for_each_gt(gt, xe, id) {
> > > > +		err = xe_gt_flr_done(gt);
> > > > +		if (err)
> > > > +			return err;
> > > > +	}
> > > > +
> > > > +	xe_i2c_pm_resume(xe, true);
> > > > +
> > > > +	xe_irq_resume(xe);
> > > > +
> > > > +	for_each_gt(gt, xe, id) {
> > > > +		err = xe_gt_resume(gt);
> > > > +		if (err)
> > > > +			return err;
> > > > +	}
> > > > +
> > > > +	xe_pxp_pm_resume(xe->pxp);
> > > > +
> > > > +	xe_late_bind_fw_load(&xe->late_bind);
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +static void xe_pci_reset_prepare(struct pci_dev *pdev)
> > > > +{
> > > > +	struct xe_device *xe = pdev_to_xe_device(pdev);
> > > > +
> > > > +	if (XE_FLR_SKIP) {
> > > > +		xe_err(xe, "PCIe FLR not supported\n");
> > > > +		return;
> > > > +	}
> > > > +
> > > > +	if (xe_device_wedged(xe)) {
> > > > +		xe_err(xe, "PCIe FLR aborted, device in unexpected state\n");
> > > > +		return;
> > > > +	}
> > > > +
> > > > +	/* Wedge the device to prevent userspace access but don't send the event yet */
> > > > +	atomic_set(&xe->wedged.flag, 1);
> > > > +
> > > > +	/*
> > > > +	 * The hardware could be in corrupted state and access unreliable, but we try to
> > > > +	 * update data structures and cleanup any pending work to avoid side effects during
> > > > +	 * PCIe FLR. This will be similar to xe_pm_suspend() flow but without migration.
> > > > +	 */
> > > > +	if (xe_flr_prepare(xe)) {
> > > > +		xe_err(xe, "Failed to prepare for PCIe FLR\n");
> > > > +		return;
> > > > +	}
> > > > +
> > > > +	xe->flr_prepared = true;
> > > > +	xe_info(xe, "Prepared for PCIe FLR\n");
> > > > +}
> > > > +
> > > > +static void xe_pci_reset_done(struct pci_dev *pdev)
> > > > +{
> > > > +	struct xe_device *xe = pdev_to_xe_device(pdev);
> > > > +
> > > > +	if (XE_FLR_SKIP)
> > > > +		return;
> > > > +
> > > > +	if (!xe_device_wedged(xe) || !xe->flr_prepared)
> > > > +		return;
> > > > +
> > > > +	/* Unprepare early in case we fail */
> > > > +	xe->flr_prepared = false;
> > > > +
> > > > +	/*
> > > > +	 * We already have the data structures intact, so try to re-initialize the device.
> > > > +	 * This will be similar to xe_pm_resume() flow, except we'll also need to recreate
> > > > +	 * all VRAM contents.
> > > > +	 */
> > > > +	if (xe_flr_done(xe)) {
> > > > +		xe_err(xe, "Re-initialization failed\n");
> > > > +		return;
> > > > +	}
> > > > +
> > > > +	/* Unwedge to allow userspace access */
> > > > +	atomic_set(&xe->wedged.flag, 0);
> > > > +
> > > > +	xe_info(xe, "Re-initialization success\n");
> > > > +}
> > > > +
> > > > +/*
> > > > + * PCIe Function Level Reset (FLR) support only.
> > > > + * TODO: Add PCIe error handlers using similar flow.
> > > > + */
> > > > +const struct pci_error_handlers xe_pci_err_handlers = {
> > > > +	.reset_prepare = xe_pci_reset_prepare,
> > > > +	.reset_done = xe_pci_reset_done,
> > > > +};
