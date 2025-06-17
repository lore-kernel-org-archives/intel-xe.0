Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75F88C71159
	for <intel-xe@archiver.kernel.org>; Tue, 17 Jun 2025 02:09:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A60910E2AB;
	Tue, 17 Jun 2025 02:09:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FsTEUkjK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C3ED10E2AB
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Jun 2025 02:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750126153; x=1781662153;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/AL7paBee8pMf6p5G6K7GhOXGmgkWT+2o1fj3BJ5hd8=;
 b=FsTEUkjKEpkWVbgicbPeZWNyqVNj/2eiX1Z8uyaJn3E76lgjzovBiJRt
 y3lxV0YAZxqa+6ASRL0oL6NPw01N2sV8unvIDsqQ+xIbUvZgULX0Q3lVC
 lDsQlyzvl2mqHkTChUUZhLVkD1QMyk8ewQl+lJZ3JuN8vPLBQWB/YoHpz
 jkWrun3Wjl67eOYKJ2737lXL28MLnyiw3wHAHZtQXbxMi9/rRcEvqC3Mk
 GKoEp3GaSQzQa/YEvM1B8pEtoG78zAI6I8Z0n+bxiHSbaKk0/RyGrpAYW
 8gWtyoxPwJaHtf+4QDCMLJXQMwlJZBLUqyAfCmWZ9X6Hw38uSShEN6dDD g==;
X-CSE-ConnectionGUID: V9zMErDnS6O3qiKRcq/iqw==
X-CSE-MsgGUID: /Vth9mbpRcG9JzfsHjVx+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="62890147"
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; d="scan'208";a="62890147"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 19:09:13 -0700
X-CSE-ConnectionGUID: CNIJBnb6RyqvOz1hWmA+YA==
X-CSE-MsgGUID: FTUz1502RVe0JeL2I4LP8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; d="scan'208";a="149174183"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 19:09:13 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH v2 0/5] Future-proof for multi-tile + multi-GT cases
Date: Mon, 16 Jun 2025 19:09:07 -0700
Message-ID: <20250617020906.1719276-7-matthew.d.roper@intel.com>
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

Matt Roper (5):
  drm/xe: Export xe_step_name for kunit tests
  drm/xe: Track maximum GTs per tile on a per-platform basis
  drm/xe/tests/pci: Ensure all platforms have a valid GT/tile count
  drm/xe: Assign GT IDs properly on multi-tile + multi-GT platforms
  drm/xe: Don't compare GT ID to GT count when determining valid GTs

 drivers/gpu/drm/xe/tests/xe_pci.c      | 31 ++++++++++++
 drivers/gpu/drm/xe/tests/xe_pci_test.c | 12 +++++
 drivers/gpu/drm/xe/tests/xe_pci_test.h |  1 +
 drivers/gpu/drm/xe/xe_device.h         | 47 ++++++++----------
 drivers/gpu/drm/xe/xe_device_types.h   |  2 +
 drivers/gpu/drm/xe/xe_eu_stall.c       |  6 ++-
 drivers/gpu/drm/xe/xe_exec_queue.c     |  2 +-
 drivers/gpu/drm/xe/xe_hw_engine.c      |  3 +-
 drivers/gpu/drm/xe/xe_mmio.c           |  8 ---
 drivers/gpu/drm/xe/xe_pci.c            | 68 ++++++++------------------
 drivers/gpu/drm/xe/xe_pci_types.h      | 40 +++++++++++++++
 drivers/gpu/drm/xe/xe_pmu.c            |  4 +-
 drivers/gpu/drm/xe/xe_query.c          |  2 +-
 drivers/gpu/drm/xe/xe_step.c           |  2 +
 14 files changed, 140 insertions(+), 88 deletions(-)

-- 
2.49.0

