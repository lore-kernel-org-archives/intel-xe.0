Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 853E310F3DCB
	for <intel-xe@archiver.kernel.org>; Sat, 28 Mar 2026 04:46:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4289C10E05B;
	Sat, 28 Mar 2026 04:46:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g1zkO0dr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D1E410E05B
 for <intel-xe@lists.freedesktop.org>; Sat, 28 Mar 2026 04:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774673194; x=1806209194;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=hI/6ACb9nYaOW95Efc6YiQCa35aQssS8aPGa3169QOQ=;
 b=g1zkO0dr7g2gBBsnK5r79RRsPN32RNDuK/2OLqpULd2eIo68VIFtZEvo
 YlcQmwYRqYgOpA+ypRY827640XxuWxYmf+D8zLEDlQ0eVppDKGPwH2yEt
 CAteJRTMfBtx8OCWbbIW1g5+wBB7vJ92qZHVT5562cw8IffnNI92c1iME
 PG7KKzU7SR4AU7250/VPsmmhUNihHuy3oZmNufCRb8WHMh72bw9X+zX9u
 DM4uc4lc3UCHw8N2ms/sCONJcsXFyR7LvKCTW3dds+y1w5QvJGYdGkomd
 1rQlJXqMhahtjRNk88w4ChVs7efg0xeQGpSqRfcAl4XIXT06Q/eZSnSLR w==;
X-CSE-ConnectionGUID: zuAdroEGSBSxura86AM+Vg==
X-CSE-MsgGUID: O3b/b55hT+O78Cb5KqC1Pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="63296684"
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; d="scan'208";a="63296684"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 21:46:34 -0700
X-CSE-ConnectionGUID: GmpEOswtQlW41GnKjCVTKg==
X-CSE-MsgGUID: FoydCZtWQbaM0InXtxAyAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; d="scan'208";a="229983366"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 21:46:30 -0700
Date: Sat, 28 Mar 2026 05:46:27 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 michal.winiarski@intel.com, matthew.auld@intel.com,
 maarten@lankhorst.se, jani.nikula@intel.com,
 lukasz.laguna@intel.com, zhanjun.dong@intel.com
Subject: Re: [PATCH v4 9/9] drm/xe/pci: Introduce PCIe FLR
Message-ID: <acddI1v3j5dhkjOD@black.igk.intel.com>
References: <20260327203620.809353-1-raag.jadav@intel.com>
 <20260327203620.809353-10-raag.jadav@intel.com>
 <acbwBKZF9RYxNf9C@gsse-cloud1.jf.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <acbwBKZF9RYxNf9C@gsse-cloud1.jf.intel.com>
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

On Fri, Mar 27, 2026 at 02:00:52PM -0700, Matthew Brost wrote:
> On Sat, Mar 28, 2026 at 02:06:20AM +0530, Raag Jadav wrote:
> > With bare minimum pieces in place, we can finally introduce PCIe Function
> > Level Reset (FLR) handling which re-initializes hardware state without the
> > need for reloading the driver from userspace. All VRAM contents are lost
> > along with hardware state and driver takes care of recreating the required
> > kernel bos as part of re-initialization, but user still needs to recreate
> > user bos and reload context after PCIe FLR.
> > 
> > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > ---
> > v2: Spell out Function Level Reset (Jani)
> > ---
> >  drivers/gpu/drm/xe/Makefile     |   1 +
> >  drivers/gpu/drm/xe/xe_pci.c     |   1 +
> >  drivers/gpu/drm/xe/xe_pci.h     |   2 +
> >  drivers/gpu/drm/xe/xe_pci_err.c | 151 ++++++++++++++++++++++++++++++++
> >  4 files changed, 155 insertions(+)
> >  create mode 100644 drivers/gpu/drm/xe/xe_pci_err.c
> > 
> > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > index dab979287a96..996b43680f84 100644
> > --- a/drivers/gpu/drm/xe/Makefile
> > +++ b/drivers/gpu/drm/xe/Makefile
> > @@ -100,6 +100,7 @@ xe-y += xe_bb.o \
> >  	xe_page_reclaim.o \
> >  	xe_pat.o \
> >  	xe_pci.o \
> > +	xe_pci_err.o \
> >  	xe_pci_rebar.o \
> >  	xe_pcode.o \
> >  	xe_pm.o \
> > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > index 01673d2b2464..f252ac3ea82c 100644
> > --- a/drivers/gpu/drm/xe/xe_pci.c
> > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > @@ -1324,6 +1324,7 @@ static struct pci_driver xe_pci_driver = {
> >  #ifdef CONFIG_PM_SLEEP
> >  	.driver.pm = &xe_pm_ops,
> >  #endif
> > +	.err_handler = &xe_pci_err_handlers,
> >  };
> >  
> >  /**
> > diff --git a/drivers/gpu/drm/xe/xe_pci.h b/drivers/gpu/drm/xe/xe_pci.h
> > index 11bcc5fe2c5b..85e85e8508c3 100644
> > --- a/drivers/gpu/drm/xe/xe_pci.h
> > +++ b/drivers/gpu/drm/xe/xe_pci.h
> > @@ -8,6 +8,8 @@
> >  
> >  struct pci_dev;
> >  
> > +extern const struct pci_error_handlers xe_pci_err_handlers;
> > +
> >  int xe_register_pci_driver(void);
> >  void xe_unregister_pci_driver(void);
> >  struct xe_device *xe_pci_to_pf_device(struct pci_dev *pdev);
> > diff --git a/drivers/gpu/drm/xe/xe_pci_err.c b/drivers/gpu/drm/xe/xe_pci_err.c
> > new file mode 100644
> > index 000000000000..b6ae1d6d85f6
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_pci_err.c
> > @@ -0,0 +1,151 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright © 2026 Intel Corporation
> > + */
> > +
> > +#include "xe_bo_evict.h"
> > +#include "xe_device.h"
> > +#include "xe_gt.h"
> > +#include "xe_gt_idle.h"
> > +#include "xe_i2c.h"
> > +#include "xe_irq.h"
> > +#include "xe_late_bind_fw.h"
> > +#include "xe_pci.h"
> > +#include "xe_pcode.h"
> > +#include "xe_printk.h"
> > +#include "xe_pxp.h"
> > +#include "xe_wa.h"
> > +
> > +static int xe_flr_prepare(struct xe_device *xe)
> > +{
> > +	struct xe_gt *gt;
> > +	int err;
> > +	u8 id;
> > +
> > +	err = xe_pxp_pm_suspend(xe->pxp);
> > +	if (err)
> > +		return err;
> > +
> > +	xe_late_bind_wait_for_worker_completion(&xe->late_bind);
> > +
> > +	xe_irq_disable(xe);
> > +
> > +	for_each_gt(gt, xe, id)
> > +		xe_gt_flr_prepare(gt);
> > +
> > +	// TODO: Drop all user bos
> > +	unmap_mapping_range(xe->drm.anon_inode->i_mapping, 0, 0, 1);
> > +	xe_bo_pci_dev_remove_pinned(xe);
> > +
> > +	return 0;
> > +}
> > +
> > +static int xe_flr_done(struct xe_device *xe)
> > +{
> > +	struct xe_tile *tile;
> > +	struct xe_gt *gt;
> > +	int err;
> > +	u8 id;
> > +
> > +	for_each_gt(gt, xe, id)
> > +		xe_gt_idle_disable_c6(gt);
> > +
> > +	for_each_tile(tile, xe, id)
> > +		xe_wa_apply_tile_workarounds(tile);
> > +
> > +	err = xe_pcode_ready(xe, true);
> > +	if (err)
> > +		return err;
> > +
> > +	xe_device_assert_lmem_ready(xe);
> > +
> > +	err = xe_bo_restore_map(xe);
> > +	if (err)
> > +		return err;
> > +
> > +	for_each_gt(gt, xe, id) {
> > +		err = xe_gt_flr_done(gt);
> > +		if (err)
> > +			return err;
> > +	}
> > +
> > +	xe_i2c_pm_resume(xe, true);
> > +
> > +	xe_irq_resume(xe);
> > +
> > +	for_each_gt(gt, xe, id) {
> > +		err = xe_gt_resume(gt);
> > +		if (err)
> > +			return err;
> > +	}
> > +
> > +	xe_pxp_pm_resume(xe->pxp);
> > +
> > +	xe_late_bind_fw_load(&xe->late_bind);
> > +
> > +	return 0;
> > +}
> > +
> > +static void xe_pci_reset_prepare(struct pci_dev *pdev)
> > +{
> > +	struct xe_device *xe = pdev_to_xe_device(pdev);
> > +
> > +	/* TODO: Extend support as a follow-up */
> > +	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe) || pci_num_vf(pdev) || xe->info.probe_display) {
> > +		xe_err(xe, "PCIe FLR not supported\n");
> > +		return;
> > +	}
> > +
> > +	/* Wedge the device to prevent userspace access but don't send the event yet */
> > +	atomic_set(&xe->wedged.flag, 1);
> > +
> > +	/*
> > +	 * The hardware could be in corrupted state and access unreliable, but we try to
> > +	 * update data structures and cleanup any pending work to avoid side effects during
> > +	 * PCIe FLR. This will be similar to xe_pm_suspend() flow but without migration.
> > +	 */
> > +	if (xe_flr_prepare(xe)) {
> > +		xe_err(xe, "Failed to prepare for PCIe FLR\n");
> > +		return;
> > +	}
> > +
> > +	xe_info(xe, "Prepared for PCIe FLR\n");
> > +}
> > +
> > +static void xe_pci_reset_done(struct pci_dev *pdev)
> > +{
> > +	struct xe_device *xe = pdev_to_xe_device(pdev);
> > +
> > +	/* TODO: Extend support as a follow-up */
> > +	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe) || pci_num_vf(pdev) || xe->info.probe_display)
> > +		return;
> > +
> > +	if (!xe_device_wedged(xe)) {
> > +		xe_err(xe, "Device in unexpected state, re-initialization aborted\n");
> > +		return;
> > +	}
> > +
> > +	/*
> > +	 * We already have the data structures intact, so try to re-initialize the device.
> > +	 * This will be similar to xe_pm_resume() flow, except we'll also need to recreate
> > +	 * all VRAM contents.
> > +	 */
> > +	if (xe_flr_done(xe)) {
> > +		xe_err(xe, "Re-initialization failed\n");
> > +		return;
> > +	}
> > +
> > +	/* Unwedge to allow userspace access */
> > +	atomic_set(&xe->wedged.flag, 0);
> 
> I think this will leak a PM ref which we take wedge the device. I just
> fixed a recalim bug here related to this [1], so this is fresh in my
> mind.
> 
> What I think you want do this is in xe_pci_reset_prepare()...
> 
> xe->wedged.pm_ref = !!atomic_xchg(&xe->wedged.flag, 1);
> 
> Then in xe_pci_reset_done()...
> 
> if (xe->wedged.pm_ref) {
> 	xe_pm_runtime_put(xe);
> 	xe->wedged.pm_ref = false;
> }
> 
> Or you change the structure in [1] mess with 'xe->wedged.pm_ref',
> multiple ways to do this.

Sure, will explore this. Although I'm wondering if we should allow FLR
flow if the device is already wedged? As per uapi doc we should be
rejecting new accesses to the device until it is recovered through the
method of choice.

Raag

> [1] https://patchwork.freedesktop.org/patch/714622/?series=163948&rev=1
> 
> > +
> > +	xe_info(xe, "Re-initialization success\n");
> > +}
> > +
> > +/*
> > + * PCIe Function Level Reset (FLR) support only.
> > + * TODO: Add PCIe error handlers using similar flow.
> > + */
> > +const struct pci_error_handlers xe_pci_err_handlers = {
> > +	.reset_prepare = xe_pci_reset_prepare,
> > +	.reset_done = xe_pci_reset_done,
> > +};
> > -- 
> > 2.43.0
> > 
