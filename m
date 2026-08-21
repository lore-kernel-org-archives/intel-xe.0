Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD431C5DF87
	for <intel-xe@archiver.kernel.org>; Fri, 21 Aug 2026 11:43:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EBDF10E27D;
	Fri, 21 Aug 2026 11:43:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="S/AyFNas";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8093D10E27D
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Aug 2026 11:43:07 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 6100143F72;
 Fri, 21 Aug 2026 11:43:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23BEF1F000E9;
 Fri, 21 Aug 2026 11:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787312586;
 bh=9t+5Wq4xvFUeklGYygVXT4KZifxvrty7VkhKTdX3CBA=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=S/AyFNasjrdw7OUOOjI8R/0D1g0dSR6C/SNGttauzwSkMfzv+GbX50ZcvbYydVw9U
 RA6v+pf1hZExKWXKrZldIMVG5POdi0rXZ/ZZlmyb6E4Ctjo2qlARzths8ubYKVs2Om
 GSKcvlh5aIjiNt0zMmXMRBNIOTdhauDGjXlQZSBbtjya++ZLtroNW/zYFyd5x3jCn0
 skdP53nDhqS36fI1yC36s+TSRESZlrp7tVY02+nxOgoPGJs0acKq5OVJC6z25YrZFz
 Y3RoqzJ0Y6Xiu9DFjLSWn1ndqKzPYEvp6f34D0awuoSVZlmuIO2X/jM2qECt38n6yY
 3/fQC07Q2GbwA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 07/10] drm/xe/pm: Introduce xe_device_suspend/resume()
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260821112436.545405-8-raag.jadav@intel.com>
References: <20260821112436.545405-1-raag.jadav@intel.com>
 <20260821112436.545405-8-raag.jadav@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 11:43:05 +0000
Message-Id: <20260821114306.23BEF1F000E9@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Critical] External pinned BOs lose their DMA mappings during FLR suspend=
 but are not unbound from GPU VMs and not restored on FLR resume, leading t=
o an exploitable DMA UAF.
- [High] Deadlock in FLR prepare path due to waiting for migration jobs aft=
er disabling interrupts and stopping GuC.

Pre-existing issues:
- [High] Incomplete rollback on GT suspend failure leaves device in an inco=
nsistent state.
--

--- Patch [7]: [PATCH v10 07/10] drm/xe/pm: Introduce xe_device_suspend/res=
ume() ---
commit ee6e16bf1e226eef6a606f3d7137d9fbf63f7e82
Author: Raag Jadav <raag.jadav@intel.com>

drm/xe/pm: Introduce xe_device_suspend/resume()
   =20
PCIe FLR prepare/re-initialization flows pretty much reflect system
suspend/resume flows with a few notable exceptions. Repurpose existing
helpers for PCIe FLR with an explicit flag to distinguish between both
flows.

> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> index 396d02eb2af83..012ba47660982 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
[ ... ]
> +int xe_device_suspend(struct xe_device *xe, bool flr)
> +{
> +	struct xe_gt *gt;
> +	u8 id;
> +	int err;
> +
> +	err =3D xe_pxp_pm_suspend(xe->pxp);
> +	if (err)
> +		return err;
> +
> +	xe_late_bind_wait_for_worker_completion(&xe->late_bind);
> +
> +	for_each_gt(gt, xe, id)
> +		xe_gt_suspend_prepare(gt);
> +
> +	if (flr) {
> +		for_each_gt(gt, xe, id)
> +			xe_gt_flr_prepare(gt);
> +	} else {
> +		xe_display_pm_suspend(xe);
> +
> +		/* FIXME: Super racey... */
> +		err =3D xe_bo_evict_all(xe);
> +		if (err)
> +			goto err_display;
> +
> +		for_each_gt(gt, xe, id) {
> +			err =3D xe_gt_suspend(gt);
> +			if (err)
> +				goto err_display;
> +		}
> +	}
> +
> +	xe_irq_suspend(xe);
> +
> +	if (flr) {
> +		/* TODO: Drop all user bos */
> +		xe_bo_pci_dev_remove_pinned(xe);

[Severity: High]
Can this cause a deadlock during the PCIe FLR prepare sequence?

When flr is true, xe_gt_flr_prepare() stops GuC scheduling. The
guc_exec_queue_stop() function explicitly skips banning and triggering
cleanup for kernel queues like the migrate engine, leaving pending migration
jobs in the scheduler.

Later we call xe_irq_suspend() which disables hardware interrupts. Then
xe_bo_pci_dev_remove_pinned() calls xe_tile_migrate_wait(), performing a
blocking dma_fence_wait() on the migrate engine's last job fence.

Since GuC is stopped, interrupts are disabled, and TDR wasn't queued, will
the fence ever signal?

> +
> +		unmap_mapping_range(xe->drm.anon_inode->i_mapping, 0, 0, 1);
> +	} else {
> +		xe_display_pm_suspend_late(xe);
> +
> +		xe_i2c_pm_suspend(xe);
> +	}
> +
> +	return 0;
> +
> +err_display:
> +	xe_display_pm_resume(xe);
> +	xe_pxp_pm_resume(xe->pxp);
> +	return err;
> +}

[Severity: High]
This is a pre-existing issue, but does this error path leave the system in =
an
inconsistent state if we fail during system suspend?

If xe_bo_evict_all() fails (e.g., due to system memory pressure), or
xe_gt_suspend() fails on a subsequent GT, we jump to err_display.

The error path only resumes the display and PXP, but doesn't resume the alr=
eady
suspended GTs, undo xe_gt_suspend_prepare(), or restore the evicted BOs. Co=
uld
this leave the device permanently broken until a reboot?

[ ... ]
> +int xe_device_resume(struct xe_device *xe, bool flr)
> +{
[ ... ]
> +	if (flr) {
> +		if (err)
> +			return err;
> +	} else {
> +		/*
> +		 * Try to bring up display before bailing from GT resume failure,
> +		 * so we don't leave the user clueless with a blank screen.
> +		 */
> +		xe_display_pm_resume(xe);
> +		if (err)
> +			return err;
> +
> +		err =3D xe_bo_restore_late(xe);

[Severity: Critical]
Does skipping xe_bo_restore_late() during FLR resume create an IOMMU bypass=
 or
Use-After-Free risk?

During FLR suspend, xe_bo_pci_dev_remove_pinned() unmaps DMA for external B=
Os
(dma-bufs), but the GPU page tables (which may reside in system memory and
survive FLR) are not updated to remove the old IOVAs.

When resuming from FLR, we take the "flr =3D=3D true" branch above and skip
xe_bo_restore_late(). Since we skip remapping the external BOs, are those B=
Os
left unmapped while their old IOVAs remain in the surviving GPU VMs?

If userspace submits jobs to the old GPU VMs, and the GPU accesses the unma=
pped
IOVAs, could the GPU silently corrupt or exfiltrate memory if the IOMMU has
reallocated those IOVAs to another device or process?

> +		if (err)
> +			return err;
> +
> +		if (IS_VF_CCS_READY(xe))
> +			xe_sriov_vf_ccs_register_context(xe);
> +	}
> +
> +	xe_pxp_pm_resume(xe->pxp);
> +
> +	xe_late_bind_fw_load(&xe->late_bind);
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821112436.5454=
05-1-raag.jadav@intel.com?part=3D7
