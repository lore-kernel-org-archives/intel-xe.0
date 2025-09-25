Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5534ECAC5B0
	for <intel-xe@archiver.kernel.org>; Thu, 25 Sep 2025 23:46:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E105310E099;
	Thu, 25 Sep 2025 23:46:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BUo5y1o9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F401C10E099
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Sep 2025 23:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758844000; x=1790380000;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=89rlVRjBDF95q8LAqG32xN1zrSArq4OzRRYPBoPhDh8=;
 b=BUo5y1o91J9VUyxNSKkLZdiUUPRbYwuhi5S1IBoJadvowMUO/bkkka8Q
 spm1gATaHPENppL1tVrhK5sfItk0vrsVbz3Eq+SXdr5Q0GkLAZ79fLPpf
 OMYfI4yTmRL/X3lqzTEOVYIhVr+ly+BSC4QLEiWfdQgoGEFa2YF8CyhQ7
 vl74sw1t8bB5lVNS89Bzn544zFifi7t3wqFKhKhnaMjpBOnMoyH0Cchcr
 2ohk13FIPM83NA6ZiL6gJv9+uA+o1RBwdxSXOreewriOfhc4Jwf3NnUDT
 1QtHomGfixk+b67lTm00hQb3oY1Rq54OvD2XvjnFor7t/VosyN4FHM1Gg A==;
X-CSE-ConnectionGUID: yPCEmijETwSfrYIN2n5IhA==
X-CSE-MsgGUID: fwp57O1hSTKXyZtKiB3vQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="78817661"
X-IronPort-AV: E=Sophos;i="6.18,293,1751266800"; d="scan'208";a="78817661"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 16:46:40 -0700
X-CSE-ConnectionGUID: u7VvZT2/ScW0BBfv5cs7xw==
X-CSE-MsgGUID: fybyhi5qSCSIAabpl5Op2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,293,1751266800"; d="scan'208";a="181852891"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 16:46:38 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH v2 00/22] Allow configfs to disable specific GT type(s)
Date: Thu, 25 Sep 2025 16:46:28 -0700
Message-ID: <20250925234628.2112163-24-matthew.d.roper@intel.com>
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

v2:
 - About 20 extra patches added to reduce dependencies on an
   always-present primary GT.
 - Kerneldoc and string parsing fixes to the configfs attribute handling
   (Gustavo)


Cc: Gustavo Sousa <gustavo.sousa@intel.com>

Matt Roper (22):
  drm/xe/huc: Adjust HuC check on primary GT
  drm/xe: Drop GT parameter to xe_display_irq_postinstall()
  drm/xe: Move 'va_bits' flag back to platform descriptor
  drm/xe: Move 'vm_max_level' flag back to platform descriptor
  drm/xe: Move 'vram_flags' flag back to platform descriptor
  drm/xe: Move 'has_flatccs' flag back to platform descriptor
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
 drivers/gpu/drm/xe/tests/xe_rtp_test.c        |   6 +-
 drivers/gpu/drm/xe/xe_configfs.c              | 130 +++++++++++++++
 drivers/gpu/drm/xe/xe_configfs.h              |   2 +
 drivers/gpu/drm/xe/xe_device.c                |  11 +-
 drivers/gpu/drm/xe/xe_device_wa_oob.rules     |   3 +
 drivers/gpu/drm/xe/xe_ggtt.c                  |  26 ++-
 drivers/gpu/drm/xe/xe_gsc.c                   |   4 +-
 drivers/gpu/drm/xe/xe_guc_pc.c                |   3 +-
 drivers/gpu/drm/xe/xe_huc.c                   |  10 +-
 drivers/gpu/drm/xe/xe_hw_engine.c             |  10 +-
 drivers/gpu/drm/xe/xe_irq.c                   |  14 +-
 drivers/gpu/drm/xe/xe_pci.c                   | 154 ++++++++++++------
 drivers/gpu/drm/xe/xe_pci_types.h             |   9 +-
 drivers/gpu/drm/xe/xe_platform_types.h        |   1 +
 drivers/gpu/drm/xe/xe_pmu.c                   |  11 +-
 drivers/gpu/drm/xe/xe_query.c                 |   2 +-
 drivers/gpu/drm/xe/xe_reg_whitelist.c         |   3 +-
 drivers/gpu/drm/xe/xe_rtp.c                   |  24 +--
 drivers/gpu/drm/xe/xe_rtp.h                   |  18 +-
 drivers/gpu/drm/xe/xe_rtp_types.h             |   4 +-
 drivers/gpu/drm/xe/xe_sriov.c                 |  19 ++-
 drivers/gpu/drm/xe/xe_sriov.h                 |   2 +-
 drivers/gpu/drm/xe/xe_tile.c                  |   4 -
 drivers/gpu/drm/xe/xe_vm.c                    |   3 +-
 drivers/gpu/drm/xe/xe_wa.c                    |   2 +-
 drivers/gpu/drm/xe/xe_wa_oob.rules            |   8 +-
 include/drm/intel/pciids.h                    |   7 +-
 32 files changed, 386 insertions(+), 124 deletions(-)

-- 
2.51.0

