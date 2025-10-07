Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E7B8CCA476
	for <intel-xe@archiver.kernel.org>; Tue,  7 Oct 2025 20:48:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60CE110E389;
	Tue,  7 Oct 2025 20:48:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ol/qbvO9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E08A10E389
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Oct 2025 20:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759870125; x=1791406125;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ay2x8utKLOIcn0zZU+kp0U8z9udbGZC1R+k44MPPZ30=;
 b=Ol/qbvO9TF9t+YzPtoZwO0U++x4s0KF3XKw0QXveaTUF57ywzKjwHKOg
 md3WlbjhGPpKFvjmsuFpDqxSjW9N8L6PJ6HMWiK88W0gdfkbtHWdarNzN
 hxgzehyB22XBKDWulOI4XqTkZFlKZfTemQFQ6qMZJZTewFfPVLoYFH9j8
 1GacJT3izp12ygpUGl4u0OIMslVEeXSSy3NI3wdvcztMgvfkdbZIYZmbw
 E8LC3bVNZchQsWpL7pzNhIoqEo7OJzcjnbyP7cdhNqOBsj/hQd4ZFfbbC
 5iYz7Rr3dVbdeUCPHSxDMZc15W+TNce2JbnSG3KEQF5+mDOXaTHrgRyc5 g==;
X-CSE-ConnectionGUID: jcgiwHBmQaCbpKDVCLhlig==
X-CSE-MsgGUID: UgzOHXyyT6G3GTFLQOEBLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="49616728"
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="49616728"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 13:48:44 -0700
X-CSE-ConnectionGUID: V4kCRtcHQyyayteOAvpc9w==
X-CSE-MsgGUID: 1oljVdJMSgmoVlnDpSvUvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="184631044"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 13:48:44 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, Gustavo Sousa <gustavo.sousa@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v4 00/23] Allow configfs to disable specific GT type(s)
Date: Tue,  7 Oct 2025 13:48:30 -0700
Message-ID: <20251007204829.1468209-25-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.0
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

During various debug or hardware bring-up activities, it is often useful
to completely disable one of the GTs to reduce the scope of the debug.
Add a configfs attribute to make this easy to do in a standard manner,
similar to the existing attribute we have to limit engines.

One of the changes in this series is that we reverse direction on the
placement of a few feature flags.  Previously we had moved things like
number of page table levels, size of the virtual address space, or
presence/absence of FlatCCS into the graphics descriptor to tie it to
the general architecture (Xe2, Xe3, etc.).  But upon further reflection,
these kind of flags and values are truly platform-specific
characteristics rather than being tied just to the graphics IP.  The
value of these winds up being platform-wide (as already evidenced by the
fact that we copied their values into xe->info rather than gt->info) and
all IP blocks in a hardware platform (graphics, media, and display) are
going to have a consistent understanding of these characteristics;
they're not just "graphics" values, and we need to be able to detect and
handle them properly even when "graphics" (in the form of the primary
GT) is absent.  So this series moves some of those flags back into the
platform-level descriptors and tries to keep the graphics descriptor's
fields focused on values that are truly tied to the primary GT.

Note that at the moment it's only possible to disable the media GT.
Although this series includes a number of patches aimed at reducing the
driver's reliance on the primary GT and assumptions that the primary GT
will always be present and non-NULL, we're not quite at the point where
the driver can actually run with primary GT disabled.  The main
remaining blocker for that is the reliance on the BCS engines (which
reside in the primary GT) for various VRAM and migration operations.
Additional work after this series will be required to eliminate those
dependencies.

v4:
 - Initialize gt->tile for SR-IOV's dummy GT to prevent null derefence.
 - Switch internal function interface from one function that returns a
   mask to two functions (one primary, one media) that return true/false
   if the engine type is enabled.
 - Use scope-based cleanup in a couple places to fix memory leaks on
   error paths and to make code simpler in general.
 - Block SR-IOV without primary GT simply by adjusting .has_sriov during
   early init.
 - Drop some outdated comments and commit message paragraphs that should
   have been removed with the code changes in v3.
 - Tweak wording of a couple commit messages to reduce ambiguity of
   meaning.

v3:
 - Drop default values and set va_bits / vm_max_level on all descriptors
   (Michal, Lucas)
 - Use a specifically allocated GT to do SRIOV pre-init GT operations
   rather than filling tile0's primary GT with data for each tile & GT.
   This allows the primary GT's allocation to be moved to a more
   appropriate place (and skipped completely if the primary GT is
   disabled).
 - If primary GT is disabled, do PF->native demotion and VF probe failure
   in xe_info_init rather than SRIOV pre-init.  (Michal)

v2:
 - About 20 extra patches added to reduce dependencies on an
   always-present primary GT.
 - Kerneldoc and string parsing fixes to the configfs attribute handling
   (Gustavo)

Cc: Gustavo Sousa <gustavo.sousa@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>

Matt Roper (23):
  drm/xe/huc: Adjust HuC check on primary GT
  drm/xe: Drop GT parameter to xe_display_irq_postinstall()
  drm/xe: Move 'va_bits' flag back to platform descriptor
  drm/xe: Move 'vm_max_level' flag back to platform descriptor
  drm/xe: Move 'vram_flags' flag back to platform descriptor
  drm/xe: Move 'has_flatccs' flag back to platform descriptor
  drm/xe: Read VF GMD_ID with a specifically-allocated dummy GT
  drm/xe: Move primary GT allocation from xe_tile_init_early to
    xe_tile_init
  drm/xe: Skip L2 / TDF cache flushes if primary GT is disabled
  drm/xe/query: Report hwconfig size as 0 if primary GT is disabled
  drm/xe/pmu: Initialize PMU event types based on first available GT
  drm/xe: Check for primary GT before looking up Wa_22019338487
  drm/xe: Make display part of Wa_22019338487 a device workaround
  drm/xe/irq: Don't try to lookup engine masks for non-existent primary
    GT
  drm/xe: Handle Wa_22010954014 and Wa_14022085890 as device workarounds
  drm/xe/rtp: Pass xe_device parameter to FUNC matches
  drm/xe: Bypass Wa_14018094691 when primary GT is disabled
  drm/xe: Correct lineage for Wa_22014953428 and only check with valid
    GT
  drm/xe: Check that GT is not NULL before testing Wa_16023588340
  drm/xe: Don't check BIOS-disabled FlatCCS if primary GT is disabled
  drm/xe: Break GT setup out of xe_info_init()
  drm/xe/configfs: Add attribute to disable GT types
  drm/xe/sriov: Disable SR-IOV if primary GT is disabled via configfs

 drivers/gpu/drm/xe/display/intel_fbdev_fb.c   |   4 +-
 drivers/gpu/drm/xe/display/xe_display.c       |   5 +-
 drivers/gpu/drm/xe/display/xe_display.h       |   4 +-
 drivers/gpu/drm/xe/display/xe_display_wa.c    |   3 +-
 drivers/gpu/drm/xe/display/xe_plane_initial.c |   4 +-
 drivers/gpu/drm/xe/tests/xe_pci.c             |   6 +-
 drivers/gpu/drm/xe/tests/xe_rtp_test.c        |   6 +-
 drivers/gpu/drm/xe/xe_configfs.c              | 145 +++++++++++
 drivers/gpu/drm/xe/xe_configfs.h              |   4 +
 drivers/gpu/drm/xe/xe_device.c                |   7 +
 drivers/gpu/drm/xe/xe_device_wa_oob.rules     |   3 +
 drivers/gpu/drm/xe/xe_ggtt.c                  |  31 ++-
 drivers/gpu/drm/xe/xe_gsc.c                   |   4 +-
 drivers/gpu/drm/xe/xe_guc_pc.c                |   3 +-
 drivers/gpu/drm/xe/xe_huc.c                   |  10 +-
 drivers/gpu/drm/xe/xe_hw_engine.c             |  10 +-
 drivers/gpu/drm/xe/xe_irq.c                   |  14 +-
 drivers/gpu/drm/xe/xe_pci.c                   | 236 ++++++++++++------
 drivers/gpu/drm/xe/xe_pci_types.h             |   9 +-
 drivers/gpu/drm/xe/xe_platform_types.h        |   1 +
 drivers/gpu/drm/xe/xe_pmu.c                   |  11 +-
 drivers/gpu/drm/xe/xe_query.c                 |   2 +-
 drivers/gpu/drm/xe/xe_reg_whitelist.c         |   3 +-
 drivers/gpu/drm/xe/xe_rtp.c                   |  24 +-
 drivers/gpu/drm/xe/xe_rtp.h                   |  18 +-
 drivers/gpu/drm/xe/xe_rtp_types.h             |   4 +-
 drivers/gpu/drm/xe/xe_tile.c                  |   4 -
 drivers/gpu/drm/xe/xe_vm.c                    |   3 +-
 drivers/gpu/drm/xe/xe_wa.c                    |   2 +-
 drivers/gpu/drm/xe/xe_wa_oob.rules            |   8 +-
 include/drm/intel/pciids.h                    |   7 +-
 31 files changed, 439 insertions(+), 156 deletions(-)

-- 
2.51.0

