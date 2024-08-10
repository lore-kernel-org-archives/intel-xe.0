Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8236BC52D7D
	for <intel-xe@archiver.kernel.org>; Sat, 10 Aug 2024 01:54:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E68C10EA54;
	Sat, 10 Aug 2024 01:54:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T2giOvxC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4644310EA54
 for <intel-xe@lists.freedesktop.org>; Sat, 10 Aug 2024 01:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723254893; x=1754790893;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=R166PUCc3ur0q+nBg7ts3GujRlG8LIg4iKNuit253Ko=;
 b=T2giOvxC4N22LkTYBtpLe+sq7OWnIbHGCsJEcqKSuEuDyxlXLQ/wofBx
 8mnfBjCysQf58ZNDi1wifDsKmZDQVWSmrR5eOsWtjsmAD4h9HjJhPULHo
 7Ljuw7uxX2dO3jCI6n2ZsKTLS0M/XwGrIpbU2VA1AypcqOzRhoBgilgXT
 Q0BVvs/ybgk7lST84S39kSvfk3Yv+zE98FBU8SVAH65wsfKPxi8hDuAm1
 fN6gj83S/4yiSuABwvg8yLlOXkVopD2/2j5N29RrU7YRz9fdj4cG9xqCN
 bU5ohVjk3Vp1wEAWVQGPp2wkvZnJKbImLBJM8WYm+ePr0tq4Km1HjfPyX w==;
X-CSE-ConnectionGUID: N9MVM6VIQu61/LdgjD+pmA==
X-CSE-MsgGUID: isAezkjAQzCOcC0gw1VyCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="21420020"
X-IronPort-AV: E=Sophos;i="6.09,278,1716274800"; d="scan'208";a="21420020"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 18:54:53 -0700
X-CSE-ConnectionGUID: Z2Or8CpFRti0zweA+kNVqg==
X-CSE-MsgGUID: v9/eIyBJQ32Q6gq0ei1zDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,278,1716274800"; d="scan'208";a="57813380"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 18:54:52 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 00/11] Fix error paths in driver load
Date: Fri,  9 Aug 2024 18:55:33 -0700
Message-Id: <20240810015544.3443258-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

Combine a few series [1] [2] [3] plus some new patches to get driver
into working state.

The below test case passed on TGL:
for i in {1..19}; do echo "Run $i"; modprobe xe inject_driver_load_error=$i; rmmod xe; done

More error injection points should be added, likely 100s more. Posted to
likely hand off this work to a team member in a working state.

Matt

[1] https://patchwork.freedesktop.org/series/137113/
[2] https://patchwork.freedesktop.org/series/137112/
[3] https://patchwork.freedesktop.org/series/137111/

Daniele Ceraolo Spurio (3):
  drm/xe: use devm instead of drmm for managed bo
  drm/xe/uc: Use managed bo for HuC and GSC objects
  drm/xe/uc: Use devm to register cleanup that includes exec_queues

Matthew Brost (8):
  drm/xe: Fix tile fini sequence
  drm/xe: Add driver load error injection
  drm/xe: Move ggtt_fini to devm managed
  drm/xe: Set firmware state to loadable before registering guc_fini_hw
  drm/xe: Drop warn on xe_guc_pc_gucrc_disable in guc pc fini
  drm/xe: Move hw_engine_fini to devm managed
  drm/xe: Move HuC init before GuC init
  drm/xe: Update xe_sa to use xe_managed_bo_create_pin_map

 drivers/gpu/drm/xe/xe_bo.c           |  6 ++---
 drivers/gpu/drm/xe/xe_device.c       | 31 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_device.h       | 15 ++++++++++++
 drivers/gpu/drm/xe/xe_device_types.h |  4 ++++
 drivers/gpu/drm/xe/xe_ggtt.c         |  4 ++--
 drivers/gpu/drm/xe/xe_gsc.c          | 16 ++++---------
 drivers/gpu/drm/xe/xe_gsc_proxy.c    | 36 +++++-----------------------
 drivers/gpu/drm/xe/xe_gt.c           |  5 ++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf.c  |  4 ++++
 drivers/gpu/drm/xe/xe_guc.c          | 12 ++++++++--
 drivers/gpu/drm/xe/xe_guc_ads.c      |  5 ++++
 drivers/gpu/drm/xe/xe_guc_ct.c       |  4 ++++
 drivers/gpu/drm/xe/xe_guc_log.c      |  5 ++++
 drivers/gpu/drm/xe/xe_guc_pc.c       |  2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c   |  4 ++--
 drivers/gpu/drm/xe/xe_huc.c          | 19 ++++-----------
 drivers/gpu/drm/xe/xe_hw_engine.c    |  4 ++--
 drivers/gpu/drm/xe/xe_mmio.c         | 10 +++++++-
 drivers/gpu/drm/xe/xe_module.c       |  5 ++++
 drivers/gpu/drm/xe/xe_module.h       |  3 +++
 drivers/gpu/drm/xe/xe_pci.c          |  9 +++++++
 drivers/gpu/drm/xe/xe_pm.c           |  8 +++++++
 drivers/gpu/drm/xe/xe_sa.c           | 13 +++++-----
 drivers/gpu/drm/xe/xe_sa_types.h     |  1 +
 drivers/gpu/drm/xe/xe_sriov.c        |  8 ++++++-
 drivers/gpu/drm/xe/xe_tile.c         |  4 ++++
 drivers/gpu/drm/xe/xe_uc.c           | 12 ++++++----
 drivers/gpu/drm/xe/xe_wa.c           |  5 ++++
 drivers/gpu/drm/xe/xe_wopcm.c        |  4 ++++
 29 files changed, 178 insertions(+), 80 deletions(-)

-- 
2.34.1

