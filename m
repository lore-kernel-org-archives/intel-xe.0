Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1EA0C7EE30
	for <intel-xe@archiver.kernel.org>; Tue,  1 Jul 2025 20:13:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60A2910E135;
	Tue,  1 Jul 2025 20:13:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W0Sk0Kxq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC84810E135
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Jul 2025 20:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751400811; x=1782936811;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KEtENZtNU/NhChOgVaeK6u1Iy62Y+cKkNdKu9oXHFNY=;
 b=W0Sk0KxqhEAKfNSENqzyR2LBWNsVEBAw+eiWa6IVN6df47TuHrKLsp4M
 FpAzDHBWiV2zm8y/w7jntIJSomHwzozbZYs+9YMrRoDVmC23eizsnNujR
 P7yipl0KQWg3tWUX65A7lZGh9NdRx5Ac2ZBwO9W3I/r21ARP82i/f1UzM
 2kEeFCoR8Q4nWI8uoee91J3NT1DWh1YnZs2g3bKrBB5HveVTrcXPz/diG
 K5XH5IuWIMnKni1wT19KXMiOWhqpucsIKYeCbbqyG+5X8E3bvMlSRn/Il
 WFL/marH9VsbcpBOmxYKdWO0Gf9VbUCuBm1wfX45vrDCMAGnE9fP9WLgA Q==;
X-CSE-ConnectionGUID: YAd9Vig8TMi/SIi7qTHqdQ==
X-CSE-MsgGUID: 9+soAIBAS0WMpdJqK03nVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="53545986"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="53545986"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 13:13:30 -0700
X-CSE-ConnectionGUID: BpRcPwx8TfajDJPjNWt6ew==
X-CSE-MsgGUID: qavskWL4QFuYKaRVDZV+9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="177539663"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 13:13:30 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH v4 0/7] Future-proof for multi-tile + multi-GT cases
Date: Tue,  1 Jul 2025 13:13:21 -0700
Message-ID: <20250701201320.2514369-9-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.49.0
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

Today all of our platforms fall into one of three cases:
 * Single tile platforms with a single (primary) GT
 * Single tile platforms with two GTs (primary + media)
 * Two-tile platforms with a single GT (primary) in each

Our numbering of GTs has been a bit inconsistent between platforms
(e.g., GT1 is the media GT on some platforms, but the second tile's
primary GT on others).  In the future we'll likely have platforms that
are both multi-tile and multi-GT, which will make the situation more
confusing.  We could also wind up with more than just two types of GTs
at some point in the future.

Going forward we should standardize the way we assign uapi GT IDs to
internal GT structures.  Let's declare that for userspace GT ID n,

  GT[n]'s tile             = n / (max gt per tile)
  GT[n]'s slot within tile = n % (max gt per tile)

If we allow 'max gt per tile' to vary by platform, we can support any
possible future tile/GT combinations (even if new types of GTs show up)
without changing any behavior of our existing platforms.

v2:
 - Rebase on top of the latest xe_pci test updates from Michal.  Convert
   the kunit test into a parameterized test that will run against each
   PCI ID supported by the driver.
v3:
 - Rebase again
 - Add an additional patch at the end of the series to ensure
   the GT query list is filled out properly.
v4:
 - If MTCFG makes us go back and reduce the tile count, also reduce
   gt_count in an equivalent manner to prune any GTs that would have
   belonged to the removed tiles.  (PVC CI)
 - Add additional patch at beginning of series to fix PMU GT check
   before starting refactoring.  (Riana)

Matt Roper (7):
  drm/xe/pmu: Fix GT sanity check in event_supported()
  drm/xe: Export xe_step_name for kunit tests
  drm/xe: Track maximum GTs per tile on a per-platform basis
  drm/xe/tests/pci: Ensure all platforms have a valid GT/tile count
  drm/xe: Assign GT IDs properly on multi-tile + multi-GT platforms
  drm/xe: Don't compare GT ID to GT count when determining valid GTs
  drm/xe/xe_query: Use separate iterator while filling GT list

 drivers/gpu/drm/xe/tests/xe_pci.c      | 31 ++++++++++++
 drivers/gpu/drm/xe/tests/xe_pci_test.c | 12 +++++
 drivers/gpu/drm/xe/tests/xe_pci_test.h |  1 +
 drivers/gpu/drm/xe/xe_device.h         | 47 ++++++++----------
 drivers/gpu/drm/xe/xe_device_types.h   |  2 +
 drivers/gpu/drm/xe/xe_eu_stall.c       |  6 ++-
 drivers/gpu/drm/xe/xe_exec_queue.c     |  2 +-
 drivers/gpu/drm/xe/xe_hw_engine.c      |  3 +-
 drivers/gpu/drm/xe/xe_mmio.c           | 16 +++---
 drivers/gpu/drm/xe/xe_pci.c            | 69 ++++++++------------------
 drivers/gpu/drm/xe/xe_pci_types.h      | 41 +++++++++++++++
 drivers/gpu/drm/xe/xe_pmu.c            |  7 ++-
 drivers/gpu/drm/xe/xe_query.c          | 29 ++++++-----
 drivers/gpu/drm/xe/xe_step.c           |  2 +
 14 files changed, 168 insertions(+), 100 deletions(-)

-- 
2.49.0

