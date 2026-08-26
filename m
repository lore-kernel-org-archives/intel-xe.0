Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCAFCC5DF97
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 11:38:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 796FF10EC50;
	Wed, 26 Aug 2026 11:38:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VawZWVCe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EE0810EC50
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Aug 2026 11:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787744331; x=1819280331;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=6F9L+WNFPG2tqOzt7LEivfxH25OBtSRz/0DFXc0E+nU=;
 b=VawZWVCeKCYkOPjZKNWFKlCKqKGypI2X/Uu4/X4y3vUBlli2ftedkupw
 A257LfPCyAB0ljKxg/E4cKJzb1dgitSk8P+LjIy0/+7ew0EYurUGv2+az
 00XGRVvraSOPoWbS+sWY5UnJu0WIcIsX1iMMQIf9n84d6u07i5JpHoE36
 n17tgekniegwY4m8xQO/NnzpInfuIqyfo5eu+FvcaFVqZtjkaE+QT3rsl
 Sax+dmWNUtiNbglSqaxGE1v+0dVAu4doRspxhIKU8HZk9xLpfMyLc5vzm
 11gr12vL65UsOAyDqoaUsxLNCNCD7utydu0rmi12hW2Vqcsr+6to7hF7V Q==;
X-CSE-ConnectionGUID: rZz7MUQxRPS2+d63DgevPQ==
X-CSE-MsgGUID: F0h1NEvrR4KBnQfuRmh+MQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="92042524"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="92042524"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 04:38:51 -0700
X-CSE-ConnectionGUID: 8MCapPQRQGaV7d7gwTa0RA==
X-CSE-MsgGUID: igiPaqa3QryFwoFphBWgBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="305785276"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 04:38:48 -0700
Date: Wed, 26 Aug 2026 13:38:45 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: "Tauro, Riana" <riana.tauro@intel.com>
Cc: "Laguna, Lukasz" <lukasz.laguna@intel.com>,
 intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 michal.winiarski@intel.com, matthew.auld@intel.com,
 dev@lankhorst.se, jani.nikula@intel.com, lukas@wunner.de,
 daniele.ceraolospurio@intel.com, badal.nilawar@intel.com
Subject: Re: [PATCH v10 09/10] drm/xe/pci: Introduce PCIe Function Level Reset
Message-ID: <ao7QRcbFlJxVxHHP@black.igk.intel.com>
References: <20260821112436.545405-1-raag.jadav@intel.com>
 <20260821112436.545405-10-raag.jadav@intel.com>
 <a1c9ead7-b3f3-4bfd-9840-df36f3e85d99@intel.com>
 <ao6raGv1PAtsmW4b@black.igk.intel.com>
 <a2bb115f-80aa-480a-b8d4-c6f38c590e85@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a2bb115f-80aa-480a-b8d4-c6f38c590e85@intel.com>
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

On Wed, Aug 26, 2026 at 03:22:19PM +0530, Tauro, Riana wrote:
> On 26-08-2026 14:31, Raag Jadav wrote:
> > On Tue, Aug 25, 2026 at 12:06:32PM +0200, Laguna, Lukasz wrote:
> > > On 8/21/2026 13:23, Raag Jadav wrote:
> > > > With bare minimum pieces in place, we can finally introduce PCIe Function
> > > > Level Reset (FLR) support which re-initializes hardware state without the
> > > > need for reloading the driver from userspace. All VRAM contents are lost
> > > > along with hardware state and driver takes care of recreating the required
> > > > kernel bos as part of re-initialization, but user still needs to recreate
> > > > user bos and reload context after PCIe FLR.
> > > > 
> > > > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > > > Tested-by: Lukasz Laguna <lukasz.laguna@intel.com>
> > > > Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > ---
> > > >    v2: Spell out Function Level Reset (Jani)
> > > >    v5: Prevent PM ref leak for wedged device (Matthew Brost)
> > > >    v6: Add PCIe FLR documentation (Daniele)
> > > >    v7: Refine PCIe FLR documentation (Daniele)
> > > >        Introduce xe_pci_reset_skip() helper (Lukasz)
> > > >    v9: Add 'Xe' prefix to document title (Rodrigo)
> > > > v10: Update documentation to include PCI Error Handling (Lukasz)
> > > >        Maintain wedged reference on FLR failure (Lukasz)
> > > > ---
> > > >    drivers/gpu/drm/xe/xe_device_types.h |   3 +
> > > >    drivers/gpu/drm/xe/xe_pci_error.c    | 128 +++++++++++++++++++++++++++
> > > >    2 files changed, 131 insertions(+)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > > > index 7be3f15bf7a0..8cbb5b747710 100644
> > > > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > > > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > > > @@ -518,6 +518,9 @@ struct xe_device {
> > > >    	/** @pxp: Encapsulate Protected Xe Path support */
> > > >    	struct xe_pxp *pxp;
> > > > +	/** @flr_prepared: Prepared for function-reset */
> > > > +	bool flr_prepared;
> > > > +
> > > >    	/** @needs_flr_on_fini: requests function-reset on fini */
> > > >    	bool needs_flr_on_fini;
> > > > diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
> > > > index 48466d726eae..81c4e55fae8f 100644
> > > > --- a/drivers/gpu/drm/xe/xe_pci_error.c
> > > > +++ b/drivers/gpu/drm/xe/xe_pci_error.c
> > > > @@ -12,8 +12,55 @@
> > > >    #include "xe_pm.h"
> > > >    #include "xe_printk.h"
> > > >    #include "xe_ras.h"
> > > > +#include "xe_sriov_pf_helpers.h"
> > > >    #include "xe_survivability_mode.h"
> > > > +/**
> > > > + * DOC: Xe PCI Error Handling
> > > > + *
> > > > + * Xe driver registers PCI callbacks which are called by PCI core in case of
> > > > + * bus errors or resets.
> > > > + *
> > > > + * Currently both Function Level Reset (FLR) and bus error handling callbacks are
> > > > + * supported. Both wipe the VRAM and resets the state of all the hardware units.
> > > > + * Therefore, the contents of all exec queues and BOs in VRAM are lost, and the
> > > > + * hardware needs a full re-initialization. The way Xe driver handles it, is
> > > > + * pretty much similar to system suspend/resume flow with a few notable exceptions.
> > > > + *
> > > > + * Prepare phase:
> > > > + *
> > > > + * - Temporarily wedge the device to prevent userspace access
> > > > + * - Kill exec queues which signals all fences and frees in-flight jobs
> > > > + * - Stop the scheduler and all submissions to GuC
> > > > + * - The fact that FLR is needed is because hardware could be in corrupted state
> > > > + *   and access unreliable, so skip memory eviction due to untrustworthy VRAM
> > > > + *   contents
> > > > + * - Remove all memory mappings since VRAM contents will be lost
> > > > + *
> > > > + * Re-initialization phase:
> > > > + *
> > > > + * - Recreate kernel BOs due to skipped memory eviction in prepare phase
> > > > + * - Restore kernel queues which were killed in prepare phase
> > > > + * - Reload all uC firmwares
> > > > + * - Bring up all hardware units
> > > > + * - Unwedge the device to allow userspace access
> > > > + *
> > > > + * Since VRAM contents are lost, the user is expected to recreate user memory
> > > > + * and reload context.
> > > > + *
> > > > + * TODO: Reuse FLR callbacks for bus error handling.
> > > > + *
> > > > + * Current implementation is only limited to re-initializing GT. This needs to
> > > > + * be extended for a lot of components listed below.
> > > > + *
> > > > + * - Proper re-initialization of GSC and PXP for integrated platforms
> > > > + * - SR-IOV cases which need PF and VF synchronization
> > > > + * - Re-initialization of all child devices registered by Xe
> > > > + * - Prepare existing xe_device_wedged() users for temporary wedging
> > > > + * - MM corner cases
> > > > + * - Display
> > > > + */
> > > > +
> > > >    static void prepare_device_for_reset(struct pci_dev *pdev)
> > > >    {
> > > >    	struct xe_device *xe = pdev_to_xe_device(pdev);
> > > > @@ -142,9 +189,90 @@ static void xe_pci_error_resume(struct pci_dev *pdev)
> > > >    	xe_device_wedged_put(xe);
> > > >    }
> > > > +static inline bool xe_pci_reset_skip(struct xe_device *xe)
> > > > +{
> Add a TODO

Sure.

> > > > +	return !IS_DGFX(xe) || IS_SRIOV_VF(xe) || xe_sriov_pf_num_vfs(xe) || xe->info.probe_display;
> > > > +}
> > > > +
> > > > +static void xe_pci_reset_prepare(struct pci_dev *pdev)
> > > > +{
> > > > +	struct xe_device *xe = pdev_to_xe_device(pdev);
> > > > +	int err;
> > > > +
> > > > +	err = xe_pci_reset_skip(xe);
> > > > +	if (err) {
> > > > +		xe_err(xe, "PCIe FLR not supported\n");
> Nit: Can the log be just PCIe reset

From PCI standpoint there are different types of resets, so better to be
explicit.

> > > > +		goto wedge;
> > > Looks like we always take the reference, so can't we do it at the top of
> > > this function and only return here?
> > Because we check for pre-existing ref below, in that case something else
> > is already wrong and it's pointless to move forward. We take a local ref
> > anyway because PCI core doesn't distinguish failure cases and calls
> > ->reset_done() regardless, so we have to compensate for it by maintaining
> > the ref across calls (which we later drop in ->reset_done()).
> 
>  If it is not supported why not just return in both function calls? Why
> proceed?

You mean allow userspace access while FLR is in progress?

Raag

> > > > +	}
> > > > +
> > > > +	err = xe_device_wedged(xe);
> > > > +	if (err)
> > > > +		xe_err(xe, "PCIe FLR failed, device in unexpected state\n");
> > > > +
> > > > +wedge:
> > > > +	/* Wedge the device to prevent userspace access but don't send the event yet */
> > > > +	xe_device_wedged_get(xe);
> > > > +	if (err)
> > > > +		return;
> > > > +
> > > > +	/*
> > > > +	 * The hardware could be in corrupted state and access unreliable, but we try to
> > > > +	 * update data structures and cleanup any pending work to avoid side effects during
> > > > +	 * PCIe FLR. This will be similar to system suspend flow but without eviction.
> > > > +	 */
> > > > +	err = xe_device_suspend(xe, true);
> > > > +	if (err) {
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
> > > > +	int err;
> > > > +
> > > > +	err = xe_pci_reset_skip(xe);
> > > > +	if (err)
> > > > +		goto out;
> > > > +
> > > > +	if (!xe->flr_prepared)
> > > > +		goto out;
> > > > +
> > > > +	/* Unprepare early in case we fail */
> > > > +	xe->flr_prepared = false;
> > > > +
> > > > +	/*
> > > > +	 * We already have the data structures intact, so try to re-initialize the device.
> > > > +	 * This will be similar to system resume flow, except we'll also need to recreate
> > > > +	 * kernel bos and restore kernel queues.
> > > > +	 */
> > > > +	err = xe_device_resume(xe, true);
> > > > +	if (err) {
> > > > +		xe_err(xe, "Re-initialization failed\n");
> > > > +		goto out;
> > > > +	}
> > > > +
> > > > +	/* Unwedge to allow userspace access */
> > > > +	xe_device_wedged_put(xe);
> > > > +	xe_info(xe, "Re-initialization success\n");
> > > > +
> > > > +	return;
> > > > +out:
> > > > +	/* Most likely the device is unusable and there's nothing we can do about it */
> > > > +	xe_device_declare_wedged(xe);
> > > > +	/* Drop local reference */
> > > > +	xe_device_wedged_put(xe);
> > > > +}
> > > > +
> > > >    const struct pci_error_handlers xe_pci_error_handlers = {
> > > >    	.error_detected	= xe_pci_error_detected,
> > > >    	.mmio_enabled	= xe_pci_error_mmio_enabled,
> > > >    	.slot_reset	= xe_pci_error_slot_reset,
> > > >    	.resume		= xe_pci_error_resume,
> > > > +	.reset_prepare	= xe_pci_reset_prepare,
> > > > +	.reset_done	= xe_pci_reset_done,
> > > >    };
