Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AD3BC83029
	for <intel-xe@archiver.kernel.org>; Mon, 30 Jun 2025 17:34:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D775310E4AD;
	Mon, 30 Jun 2025 17:34:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a5i9RhNV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64B7210E4A9
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Jun 2025 17:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751304886; x=1782840886;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lMWFKnrQkQ5fWtZFzAXZTT0EIz7qyRjWgbaZSTw04SQ=;
 b=a5i9RhNVu1VrU0tu13fAhBX4lFkKcmCwVuPBfquYzOa/BjZ1UMT1CXQb
 VrT/aV8zEOy7Ly7WhWuvTShsg7zYpgddO+te+AYLArx/thKldnhSWvacY
 25QKMm+MhkK4ComQBvTbBLlIyf9J7+lkfEs1L/fEXShYS1Ok12fSRUvQL
 1y5TXANa4ehLk8sROecfbAydWgDbleepLn2T8/+PZYw1RVFg06Gh1Lgh4
 bv89w328VJQhHI09R4SIH/re4ynUQWjurJgltElrEZXMNL16smuCw1WXp
 t+37YFlCyGQPtdQau896ib3P6pEQFLg9KNCcOa8JpEg4gcuhV3vkVVLz2 Q==;
X-CSE-ConnectionGUID: galJZfmERwetgJQ8YERxWw==
X-CSE-MsgGUID: KfsFgW1gQJK62PAxSGGusg==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="57223395"
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; d="scan'208";a="57223395"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 10:34:46 -0700
X-CSE-ConnectionGUID: osj4IA17SxKcp3p8KdJKeg==
X-CSE-MsgGUID: DV8fD+tRT3y64Q4a+wgf8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; d="scan'208";a="184543699"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 10:34:43 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH v3 0/6] Future-proof for multi-tile + multi-GT cases
Date: Mon, 30 Jun 2025 10:34:39 -0700
Message-ID: <20250630173438.2342706-8-matthew.d.roper@intel.com>
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

Matt Roper (6):
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
 drivers/gpu/drm/xe/xe_mmio.c           |  8 ---
 drivers/gpu/drm/xe/xe_pci.c            | 69 ++++++++------------------
 drivers/gpu/drm/xe/xe_pci_types.h      | 41 +++++++++++++++
 drivers/gpu/drm/xe/xe_pmu.c            |  4 +-
 drivers/gpu/drm/xe/xe_query.c          | 27 +++++-----
 drivers/gpu/drm/xe/xe_step.c           |  2 +
 14 files changed, 154 insertions(+), 101 deletions(-)

-- 
2.49.0

