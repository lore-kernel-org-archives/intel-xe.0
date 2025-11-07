Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEF65CCF9F8
	for <intel-xe@archiver.kernel.org>; Fri,  7 Nov 2025 18:13:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 816F310E1D4;
	Fri,  7 Nov 2025 18:13:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k6vvz3S9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1639910E1D2
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Nov 2025 18:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762539204; x=1794075204;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HScDqt5AIAimah00/FpsfgV4xSicOAM8ubb+QpngwFg=;
 b=k6vvz3S9Np5aTVZHM9n3DkVFS6ip0GidMjFIdG44lpTPadiylu4vNTjx
 AcWmoV/0j/SuA1SOtqNX2EC+k/5VfOrdkrhwB7YMYf+ruwdIIFSdFyo7y
 L3w8i9yXOShLc1J4aZ/CbGEw1reQcOOKc5s16/34pyWzm9gWodiCtypT2
 KdbTXUgL+2nvXMqapX314tzIXIrXOwrhXggX0Y8Uqgsq9MeHMOsb5x5e0
 OAaShXPvjTgARlp/yN1usTZO6AmN/SPRlgvoi+LiFjesm2W7KAHwpo91T
 m4tVwh4CEg4GaSvv0Obpwf8fvx6m0IuyLxxMCKN0IrdfZ2b1rvRzffti3 A==;
X-CSE-ConnectionGUID: 5m7dDOb0RwWCknXUTceSfw==
X-CSE-MsgGUID: TcjTvn44TYWlefxbRn7fAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="64730178"
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="64730178"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 10:13:23 -0800
X-CSE-ConnectionGUID: gx3E9rx2SiaH79f+nxhl6Q==
X-CSE-MsgGUID: aC5+iFxiRDe+2+gbmGSNRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="193271126"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 10:13:23 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 00/33] Scope-based forcewake and runtime PM
Date: Fri,  7 Nov 2025 10:13:16 -0800
Message-ID: <20251107181315.631642-35-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Forcewake and runtime PM both follow reference-counted get/put models;
when used in functions that can encounter errors and return early, it's
easy for developers to make mistakes and fail to drop a reference on all
of the error paths.  Cleanup of these reference counts is often
addressed by goto-based error handling which is somewhat ugly and
subject to its own set of mistakes once we accumulate too many error
labels in a function.

Scope-based cleanup ([1][2]) has been gaining increasing popularity in
the Linux kernel for cleaning up various kinds of resources in a more
automated way when code has lots of error paths and early exits.  Let's
add scope-based cleanup for both forcewake and runtime PM, based on the
mechanisms provided in include/linux/cleanup.h.  Scope-based cleanup
allows cleanup destructors to be executed automatically when the current
scope is exited by any means (end of block, return, break, etc.).

For xe_runtime_pm_{get,put} pairs that were grabbed and released within
a single function or block, the preferred replacement is now just

        guard(xe_pm_runtime_noresume)(xe);

which will take care of releasing the runtime PM reference
automatically.  scoped_guard() can be used instead if the reference
should only be held over part of the block.  There are also guard
variants added for xe_pm_runtime_noresume and xe_pm_runtime_ioctl that
allow replacement of those alternate functions as well.

Unlike runtime PM, where all reference tracking is done within the
object parameter itself, forcewake is currently a model where get
operations return a cookie that needs to be passed back to put
operations.  That necessitates a slightly different type of cleanup
helper (CLASS instead of guard), although the underlying mechanisms are
the same.  For forcewake that is grabbed and released within a single
function or block, the preferred form is now:

        CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);

which, like the runtime PM equivalent, will cause the forcewake
reference to be dropped automatically.  If forcewake needs to be held
over only a subset of the current block,

        xe_with_force_wake(fw_ref, gt_to_fw(gt), XE_FW_GT) { ... }

can be used in the same way scoped_guard() is used for runtime PM.

The first few patches in this series make some general cleanups and
restructuring of the existing force wake code.  Then the new guards and
classes for runtime PM and forcewake are defined.  Finally, most of the
existing runtime PM and forcewake usage in the driver is converted to
the scope-based form in the remainder of the series.  Some of the
conversions eliminate goto-based cleanup models and/or significantly
simplify the code.  Other conversions don't significantly simplify the
code (aside from a slight reduction in line count), but are still useful
for consistency across our codebase.

An advantage of doing the conversion everywhere possible, not just the
places where it noticeably simplifies the code, is that it helps
highlight the remaining get/put usage as special cases where wake
references follow more complicated lifetimes (e.g., obtained in one
function and released in a different one, often tied to some other type
of resource or operation).  With fewer direct get/put calls overall, its
easier to identify the ones that remain as special cases and make sure
they truly are paired up properly.

There's other areas where scope-based cleanup could potentially be
applied in the future (e.g., mutex locks, bo locking, etc.), but this
series does not try to address those, even in places where those
resources are also part of the same error handling cleanup paths as
forcewake and runtime PM.  We can potentially think about converting
other types of resources to scope-based cleanup down the road if it
winds up working well here for forcewake and PM.


References:
 [1] https://www.kernel.org/doc/html/next/core-api/cleanup.html
 [2] https://lwn.net/Articles/934679/


Matt Roper (33):
  drm/xe/forcewake: Improve kerneldoc
  drm/xe/eustall: Store forcewake reference in stream structure
  drm/xe/oa: Store forcewake reference in stream structure
  drm/xe/forcewake: Create dedicated type for forcewake references
  squash! drm/xe/forcewake: Create dedicated type for forcewake
    references
  squash! squash! drm/xe/forcewake: Create dedicated type for forcewake
    references
  drm/xe/forcewake: Add scope-based cleanup for forcewake
  drm/xe/pm: Add scope-based cleanup helper for runtime PM
  drm/xe/gt: Use scope-based cleanup
  drm/xe/gt_idle: Use scope-based cleanup
  drm/xe/guc: Use scope-based cleanup
  drm/xe/guc_pc: Use scope-based cleanup
  drm/xe/mocs: Use scope-based cleanup
  drm/xe/pat: Use scope-based forcewake
  drm/xe/pxp: Use scope-based cleanup
  drm/xe/gsc: Use scope-based cleanup
  drm/xe/device: Use scope-based cleanup
  drm/xe/devcoredump: Use scope-based cleanup
  drm/xe/display: Use scoped-cleanup
  drm/xe: Create scoped cleanup class for force_wake_get_any_engine()
  drm/xe/drm_client: Use scope-based cleanup
  drm/xe/gt_debugfs: Use scope-based cleanup
  drm/xe/huc: Use scope-based forcewake
  drm/xe/query: Use scope-based forcewake
  drm/xe/reg_sr: Use scope-based forcewake
  drm/xe/vram: Use scope-based forcewake
  drm/xe/bo: Use scope-based runtime PM
  drm/xe/ggtt: Use scope-based runtime pm
  drm/xe/hwmon: Use scope-based runtime PM
  drm/xe/sriov: Use scope-based runtime PM
  drm/xe/tests: Use scope-based runtime PM
  drm/xe/sysfs: Use scope-based runtime power management
  drm/xe/debugfs: Use scope-based runtime PM

 drivers/gpu/drm/xe/display/xe_fb_pin.c        |  24 ++-
 drivers/gpu/drm/xe/display/xe_hdcp_gsc.c      |  25 +--
 drivers/gpu/drm/xe/tests/xe_bo.c              |  10 +-
 drivers/gpu/drm/xe/tests/xe_dma_buf.c         |   3 +-
 drivers/gpu/drm/xe/tests/xe_migrate.c         |  10 +-
 drivers/gpu/drm/xe/tests/xe_mocs.c            |  27 +---
 drivers/gpu/drm/xe/xe_bo.c                    |   3 +-
 drivers/gpu/drm/xe/xe_debugfs.c               |  39 +++--
 drivers/gpu/drm/xe/xe_devcoredump.c           |  26 ++-
 drivers/gpu/drm/xe/xe_device.c                |  35 ++--
 drivers/gpu/drm/xe/xe_device_sysfs.c          |  33 ++--
 drivers/gpu/drm/xe/xe_drm_client.c            |  77 +++++----
 drivers/gpu/drm/xe/xe_eu_stall.c              |   8 +-
 drivers/gpu/drm/xe/xe_force_wake.c            |  19 ++-
 drivers/gpu/drm/xe/xe_force_wake.h            |  23 ++-
 drivers/gpu/drm/xe/xe_force_wake_types.h      |  41 ++++-
 drivers/gpu/drm/xe/xe_ggtt.c                  |   3 +-
 drivers/gpu/drm/xe/xe_gsc.c                   |  28 ++--
 drivers/gpu/drm/xe/xe_gsc_debugfs.c           |   3 +-
 drivers/gpu/drm/xe/xe_gsc_proxy.c             |  17 +-
 drivers/gpu/drm/xe/xe_gt.c                    | 149 ++++++------------
 drivers/gpu/drm/xe/xe_gt_debugfs.c            |  29 +---
 drivers/gpu/drm/xe/xe_gt_freq.c               |  27 ++--
 drivers/gpu/drm/xe/xe_gt_idle.c               |  32 ++--
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c   |  12 +-
 drivers/gpu/drm/xe/xe_gt_throttle.c           |   3 +-
 drivers/gpu/drm/xe/xe_guc.c                   |  13 +-
 drivers/gpu/drm/xe/xe_guc_debugfs.c           |   3 +-
 drivers/gpu/drm/xe/xe_guc_log.c               |  10 +-
 drivers/gpu/drm/xe/xe_guc_pc.c                |  62 ++------
 drivers/gpu/drm/xe/xe_guc_submit.c            |   9 +-
 drivers/gpu/drm/xe/xe_guc_tlb_inval.c         |   4 +-
 drivers/gpu/drm/xe/xe_huc.c                   |   7 +-
 drivers/gpu/drm/xe/xe_huc_debugfs.c           |   3 +-
 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c |   6 +-
 drivers/gpu/drm/xe/xe_hwmon.c                 |  16 +-
 drivers/gpu/drm/xe/xe_mocs.c                  |  18 +--
 drivers/gpu/drm/xe/xe_oa.c                    |   9 +-
 drivers/gpu/drm/xe/xe_oa_types.h              |   3 +
 drivers/gpu/drm/xe/xe_pat.c                   |  36 ++---
 drivers/gpu/drm/xe/xe_pci_sriov.c             |   3 +-
 drivers/gpu/drm/xe/xe_pm.h                    |  17 ++
 drivers/gpu/drm/xe/xe_pmu.c                   |  10 +-
 drivers/gpu/drm/xe/xe_pxp.c                   |  49 ++----
 drivers/gpu/drm/xe/xe_query.c                 |  16 +-
 drivers/gpu/drm/xe/xe_reg_sr.c                |  17 +-
 drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c      |   6 +-
 drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c        |   6 +-
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c          |   5 +-
 drivers/gpu/drm/xe/xe_tile_debugfs.c          |   3 +-
 drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.c |   3 +-
 drivers/gpu/drm/xe/xe_vram.c                  |   7 +-
 52 files changed, 422 insertions(+), 625 deletions(-)

-- 
2.51.1

