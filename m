Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 227C8C61DB9
	for <intel-xe@archiver.kernel.org>; Fri, 28 Aug 2026 07:54:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4A1E10F2B8;
	Fri, 28 Aug 2026 07:54:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WSLDeRbW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85B7710F2B8
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Aug 2026 07:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787903656; x=1819439656;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=HPlyJKDNQhscW9aStCzVg66faZkconKwmSx88dcMsKA=;
 b=WSLDeRbW4LT0z/rNTkFrZFBmDYgxzNxPBBXY8A4dP2i1vuIxHpL3O2Ey
 wNaoe3nzW7AL7TUaidkXsJ6d54snN5g0eHpyMfmOdy4z+WFL61sKpmg4b
 8EIGVtuNnOUM2MtPXydorlUhPtQhRMy7vtIFcKQIvO0whBl8vSI8VZitz
 unKkgR2SivTeZiYEhguYBj5SK878xRIvjOXudYG9f1TsVv9vx/oypm4ks
 BsmYooVHS66nzTyGuXan6xUiwyDMraxyonLXK4aClgt4x4EcvuN9TT/Sk
 dTADSEK82ypexZB5Fjc+T+GybJxlVgoPj68e7Qm2t0IOgWrI7mpMuRz2L A==;
X-CSE-ConnectionGUID: obObBF+LQDeKpgaHl37zIA==
X-CSE-MsgGUID: 8KJI81NGSvGnQFQtPP1kxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="88174543"
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; d="scan'208";a="88174543"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 00:54:15 -0700
X-CSE-ConnectionGUID: uCc4UbtcT2Wijo51wkOEcw==
X-CSE-MsgGUID: nu5/b1h/TzGWHsoWeBMCUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; d="scan'208";a="270047477"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 00:54:13 -0700
Date: Fri, 28 Aug 2026 09:54:09 +0200
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
Message-ID: <apE-oWyuJAmV1t0I@black.igk.intel.com>
References: <20260821112436.545405-1-raag.jadav@intel.com>
 <20260821112436.545405-10-raag.jadav@intel.com>
 <a1c9ead7-b3f3-4bfd-9840-df36f3e85d99@intel.com>
 <ao6raGv1PAtsmW4b@black.igk.intel.com>
 <a2bb115f-80aa-480a-b8d4-c6f38c590e85@intel.com>
 <ao7QRcbFlJxVxHHP@black.igk.intel.com>
 <2f41b3f0-076b-4876-93b6-216fa88e7c83@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2f41b3f0-076b-4876-93b6-216fa88e7c83@intel.com>
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

On Fri, Aug 28, 2026 at 11:42:12AM +0530, Tauro, Riana wrote:
> On 26-08-2026 17:08, Raag Jadav wrote:
> > On Wed, Aug 26, 2026 at 03:22:19PM +0530, Tauro, Riana wrote:
> > > On 26-08-2026 14:31, Raag Jadav wrote:
> > > > On Tue, Aug 25, 2026 at 12:06:32PM +0200, Laguna, Lukasz wrote:
> > > > > On 8/21/2026 13:23, Raag Jadav wrote:
> > > > > > With bare minimum pieces in place, we can finally introduce PCIe Function
> > > > > > Level Reset (FLR) support which re-initializes hardware state without the
> > > > > > need for reloading the driver from userspace. All VRAM contents are lost
> > > > > > along with hardware state and driver takes care of recreating the required
> > > > > > kernel bos as part of re-initialization, but user still needs to recreate
> > > > > > user bos and reload context after PCIe FLR.
> > > > > > 
> > > > > > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > > > > > Tested-by: Lukasz Laguna <lukasz.laguna@intel.com>
> > > > > > Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > > > ---
> > > > > >     v2: Spell out Function Level Reset (Jani)
> > > > > >     v5: Prevent PM ref leak for wedged device (Matthew Brost)
> > > > > >     v6: Add PCIe FLR documentation (Daniele)
> > > > > >     v7: Refine PCIe FLR documentation (Daniele)
> > > > > >         Introduce xe_pci_reset_skip() helper (Lukasz)
> > > > > >     v9: Add 'Xe' prefix to document title (Rodrigo)
> > > > > > v10: Update documentation to include PCI Error Handling (Lukasz)
> > > > > >         Maintain wedged reference on FLR failure (Lukasz)
> > > > > > ---
> > > > > >     drivers/gpu/drm/xe/xe_device_types.h |   3 +
> > > > > >     drivers/gpu/drm/xe/xe_pci_error.c    | 128 +++++++++++++++++++++++++++
> > > > > >     2 files changed, 131 insertions(+)
> > > > > > 
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > > > > > index 7be3f15bf7a0..8cbb5b747710 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > > > > > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > > > > > @@ -518,6 +518,9 @@ struct xe_device {
> > > > > >     	/** @pxp: Encapsulate Protected Xe Path support */
> > > > > >     	struct xe_pxp *pxp;
> > > > > > +	/** @flr_prepared: Prepared for function-reset */
> > > > > > +	bool flr_prepared;
> > > > > > +
> > > > > >     	/** @needs_flr_on_fini: requests function-reset on fini */
> > > > > >     	bool needs_flr_on_fini;
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
> > > > > > index 48466d726eae..81c4e55fae8f 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_pci_error.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_pci_error.c
> > > > > > @@ -12,8 +12,55 @@
> > > > > >     #include "xe_pm.h"
> > > > > >     #include "xe_printk.h"
> > > > > >     #include "xe_ras.h"
> > > > > > +#include "xe_sriov_pf_helpers.h"
> > > > > >     #include "xe_survivability_mode.h"
> > > > > > +/**
> > > > > > + * DOC: Xe PCI Error Handling
> > > > > > + *
> > > > > > + * Xe driver registers PCI callbacks which are called by PCI core in case of
> > > > > > + * bus errors or resets.
> > > > > > + *
> > > > > > + * Currently both Function Level Reset (FLR) and bus error handling callbacks are
> > > > > > + * supported. Both wipe the VRAM and resets the state of all the hardware units.
> > > > > > + * Therefore, the contents of all exec queues and BOs in VRAM are lost, and the
> > > > > > + * hardware needs a full re-initialization. The way Xe driver handles it, is
> > > > > > + * pretty much similar to system suspend/resume flow with a few notable exceptions.
> > > > > > + *
> > > > > > + * Prepare phase:
> > > > > > + *
> > > > > > + * - Temporarily wedge the device to prevent userspace access
> > > > > > + * - Kill exec queues which signals all fences and frees in-flight jobs
> > > > > > + * - Stop the scheduler and all submissions to GuC
> > > > > > + * - The fact that FLR is needed is because hardware could be in corrupted state
> > > > > > + *   and access unreliable, so skip memory eviction due to untrustworthy VRAM
> > > > > > + *   contents
> > > > > > + * - Remove all memory mappings since VRAM contents will be lost
> > > > > > + *
> > > > > > + * Re-initialization phase:
> > > > > > + *
> > > > > > + * - Recreate kernel BOs due to skipped memory eviction in prepare phase
> > > > > > + * - Restore kernel queues which were killed in prepare phase
> > > > > > + * - Reload all uC firmwares
> > > > > > + * - Bring up all hardware units
> > > > > > + * - Unwedge the device to allow userspace access
> > > > > > + *
> > > > > > + * Since VRAM contents are lost, the user is expected to recreate user memory
> > > > > > + * and reload context.
> > > > > > + *
> > > > > > + * TODO: Reuse FLR callbacks for bus error handling.
> > > > > > + *
> > > > > > + * Current implementation is only limited to re-initializing GT. This needs to
> > > > > > + * be extended for a lot of components listed below.
> > > > > > + *
> > > > > > + * - Proper re-initialization of GSC and PXP for integrated platforms
> > > > > > + * - SR-IOV cases which need PF and VF synchronization
> > > > > > + * - Re-initialization of all child devices registered by Xe
> > > > > > + * - Prepare existing xe_device_wedged() users for temporary wedging
> > > > > > + * - MM corner cases
> > > > > > + * - Display
> > > > > > + */
> > > > > > +
> > > > > >     static void prepare_device_for_reset(struct pci_dev *pdev)
> > > > > >     {
> > > > > >     	struct xe_device *xe = pdev_to_xe_device(pdev);
> > > > > > @@ -142,9 +189,90 @@ static void xe_pci_error_resume(struct pci_dev *pdev)
> > > > > >     	xe_device_wedged_put(xe);
> > > > > >     }
> > > > > > +static inline bool xe_pci_reset_skip(struct xe_device *xe)
> > > > > > +{
> > > Add a TODO
> > Sure.
> > 
> > > > > > +	return !IS_DGFX(xe) || IS_SRIOV_VF(xe) || xe_sriov_pf_num_vfs(xe) || xe->info.probe_display;
> > > > > > +}
> > > > > > +
> > > > > > +static void xe_pci_reset_prepare(struct pci_dev *pdev)
> > > > > > +{
> > > > > > +	struct xe_device *xe = pdev_to_xe_device(pdev);
> > > > > > +	int err;
> > > > > > +
> > > > > > +	err = xe_pci_reset_skip(xe);
> > > > > > +	if (err) {
> > > > > > +		xe_err(xe, "PCIe FLR not supported\n");
> > > Nit: Can the log be just PCIe reset
> >  From PCI standpoint there are different types of resets, so better to be
> > explicit.
> 
> I see bus-reset also using the reset_prepare/done callbacks.

If we ever need to do that then we have bigger fish to fry ;)

> I was thinking use the same name as function calls
> It's a nit so upto you.

Coming right up.

> > > > > > +		goto wedge;
> > > > > Looks like we always take the reference, so can't we do it at the top of
> > > > > this function and only return here?
> > > > Because we check for pre-existing ref below, in that case something else
> > > > is already wrong and it's pointless to move forward. We take a local ref
> > > > anyway because PCI core doesn't distinguish failure cases and calls
> > > > ->reset_done() regardless, so we have to compensate for it by maintaining
> > > > the ref across calls (which we later drop in ->reset_done()).
> > >   If it is not supported why not just return in both function calls? Why
> > > proceed?
> > You mean allow userspace access while FLR is in progress?
> 
> If we do not quiesce the device and trigger a flr would it not cause other
> crashes anyway?

Exactly, we already know without re-initialization the device is basically
dead. So just maintain a local ref until we permanently wedge and prevent
all the chaos.

Raag

> > > > > > +	}
> > > > > > +
> > > > > > +	err = xe_device_wedged(xe);
> > > > > > +	if (err)
> > > > > > +		xe_err(xe, "PCIe FLR failed, device in unexpected state\n");
> > > > > > +
> > > > > > +wedge:
> > > > > > +	/* Wedge the device to prevent userspace access but don't send the event yet */
> > > > > > +	xe_device_wedged_get(xe);
> > > > > > +	if (err)
> > > > > > +		return;
> > > > > > +
> > > > > > +	/*
> > > > > > +	 * The hardware could be in corrupted state and access unreliable, but we try to
> > > > > > +	 * update data structures and cleanup any pending work to avoid side effects during
> > > > > > +	 * PCIe FLR. This will be similar to system suspend flow but without eviction.
> > > > > > +	 */
> > > > > > +	err = xe_device_suspend(xe, true);
> > > > > > +	if (err) {
> > > > > > +		xe_err(xe, "Failed to prepare for PCIe FLR\n");
> > > > > > +		return;
> > > > > > +	}
> > > > > > +
> > > > > > +	xe->flr_prepared = true;
> > > > > > +	xe_info(xe, "Prepared for PCIe FLR\n");
> > > > > > +}
> > > > > > +
> > > > > > +static void xe_pci_reset_done(struct pci_dev *pdev)
> > > > > > +{
> > > > > > +	struct xe_device *xe = pdev_to_xe_device(pdev);
> > > > > > +	int err;
> > > > > > +
> > > > > > +	err = xe_pci_reset_skip(xe);
> > > > > > +	if (err)
> > > > > > +		goto out;
> > > > > > +
> > > > > > +	if (!xe->flr_prepared)
> > > > > > +		goto out;
> > > > > > +
> > > > > > +	/* Unprepare early in case we fail */
> > > > > > +	xe->flr_prepared = false;
> > > > > > +
> > > > > > +	/*
> > > > > > +	 * We already have the data structures intact, so try to re-initialize the device.
> > > > > > +	 * This will be similar to system resume flow, except we'll also need to recreate
> > > > > > +	 * kernel bos and restore kernel queues.
> > > > > > +	 */
> > > > > > +	err = xe_device_resume(xe, true);
> > > > > > +	if (err) {
> > > > > > +		xe_err(xe, "Re-initialization failed\n");
> > > > > > +		goto out;
> > > > > > +	}
> > > > > > +
> > > > > > +	/* Unwedge to allow userspace access */
> > > > > > +	xe_device_wedged_put(xe);
> > > > > > +	xe_info(xe, "Re-initialization success\n");
> > > > > > +
> > > > > > +	return;
> > > > > > +out:
> > > > > > +	/* Most likely the device is unusable and there's nothing we can do about it */
> > > > > > +	xe_device_declare_wedged(xe);
> > > > > > +	/* Drop local reference */
> > > > > > +	xe_device_wedged_put(xe);
> > > > > > +}
> > > > > > +
> > > > > >     const struct pci_error_handlers xe_pci_error_handlers = {
> > > > > >     	.error_detected	= xe_pci_error_detected,
> > > > > >     	.mmio_enabled	= xe_pci_error_mmio_enabled,
> > > > > >     	.slot_reset	= xe_pci_error_slot_reset,
> > > > > >     	.resume		= xe_pci_error_resume,
> > > > > > +	.reset_prepare	= xe_pci_reset_prepare,
> > > > > > +	.reset_done	= xe_pci_reset_done,
> > > > > >     };
