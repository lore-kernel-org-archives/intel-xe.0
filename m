Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2822C04A94
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jul 2023 14:55:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9304E10E5AD;
	Thu, 27 Jul 2023 14:55:42 +0000 (UTC)
Received: from mgamail.intel.com (unknown [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E70DD10E5B7
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Jul 2023 14:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690469739; x=1722005739;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ft6QI1AWcjubR6nT+CjdFeFaPKfi7/pcvVGclAcT4KI=;
 b=hNaKphe9bS7yN1lsp1EEbg6pIYAz2iGLkqNWnpqgpU5QDz0m1JVjk72N
 M6SRrU02JIWCsKAOXYztVzEJW0OGLwSibsKFu3QSf2sluHwIOgR0FnxLP
 1Qr0p6FDgc2dnkaiQxtLLS4gC2VS6ZM9RKW5NxNWjR2772hHLEh7rASQE
 3cy0s2tueoAZV/5lyb98qePOme4lsqkViXZsW5e5KCRzJlKXpuW5NlGcF
 1YkhrdaySJE5w7TGoSox6B2B87kQhIB1j/hFAhFchsCTAn3hIbmBgGWiJ
 vSDCmHWHhhVhJDvYUqcZp8uL36gvNNW60cu0Dfvew+Rk780oCx1by4grk g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="353244884"
X-IronPort-AV: E=Sophos;i="6.01,235,1684825200"; d="scan'208";a="353244884"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 07:55:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="797091703"
X-IronPort-AV: E=Sophos;i="6.01,235,1684825200"; d="scan'208";a="797091703"
Received: from cweger-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.249.37.139])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 07:55:37 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 27 Jul 2023 14:55:27 +0000
Message-Id: <20230727145530.7-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 0/3] Remove use of BUG_ON
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
Cc: Francois Dugast <francois.dugast@intel.com>, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

After offline discussions and feedback on the first series, taking a step back
here and only address the issue of misusing BUG_ON() in situations where it is
not needed.
Proper error handling with recovery code and switching to drm_err* require case
by case analysis and fix, so this will be done in another series.

v2: Use regular WARN_ON() (Rodrigo Vivi)

Francois Dugast (3):
  drm/xe/macro: Remove unused constant
  drm/xe: Prefer WARN() over BUG() to avoid crashing the kernel
  drm/xe: Use regular WARN_ON() instead of driver-specific XE_WARN_ON()

 drivers/gpu/drm/i915/display/intel_display.c |  2 +-
 drivers/gpu/drm/i915/display/intel_fbdev.c   |  2 +-
 drivers/gpu/drm/xe/display/xe_fb_pin.c       |  2 +-
 drivers/gpu/drm/xe/xe_bb.c                   |  8 +-
 drivers/gpu/drm/xe/xe_bo.c                   | 66 +++++++--------
 drivers/gpu/drm/xe/xe_bo.h                   | 14 ++--
 drivers/gpu/drm/xe/xe_bo_evict.c             |  4 +-
 drivers/gpu/drm/xe/xe_debugfs.c              |  4 +-
 drivers/gpu/drm/xe/xe_device.c               |  8 +-
 drivers/gpu/drm/xe/xe_dma_buf.c              |  2 +-
 drivers/gpu/drm/xe/xe_engine.c               |  2 +-
 drivers/gpu/drm/xe/xe_exec.c                 |  2 +-
 drivers/gpu/drm/xe/xe_execlist.c             | 16 ++--
 drivers/gpu/drm/xe/xe_force_wake.c           |  4 +-
 drivers/gpu/drm/xe/xe_force_wake.h           |  4 +-
 drivers/gpu/drm/xe/xe_ggtt.c                 | 18 ++---
 drivers/gpu/drm/xe/xe_gt.c                   | 22 ++---
 drivers/gpu/drm/xe/xe_gt_clock.c             |  4 +-
 drivers/gpu/drm/xe/xe_gt_debugfs.c           |  4 +-
 drivers/gpu/drm/xe/xe_gt_pagefault.c         |  2 +-
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c  | 12 +--
 drivers/gpu/drm/xe/xe_guc.c                  | 26 +++---
 drivers/gpu/drm/xe/xe_guc.h                  |  2 +-
 drivers/gpu/drm/xe/xe_guc_ads.c              | 16 ++--
 drivers/gpu/drm/xe/xe_guc_ct.c               | 28 +++----
 drivers/gpu/drm/xe/xe_guc_hwconfig.c         |  2 +-
 drivers/gpu/drm/xe/xe_guc_log.c              |  4 +-
 drivers/gpu/drm/xe/xe_guc_pc.c               | 16 ++--
 drivers/gpu/drm/xe/xe_guc_submit.c           | 62 +++++++--------
 drivers/gpu/drm/xe/xe_huc.c                  |  2 +-
 drivers/gpu/drm/xe/xe_hw_engine.c            | 10 +--
 drivers/gpu/drm/xe/xe_hw_fence.c             |  8 +-
 drivers/gpu/drm/xe/xe_lrc.c                  |  8 +-
 drivers/gpu/drm/xe/xe_macros.h               |  4 -
 drivers/gpu/drm/xe/xe_migrate.c              | 40 +++++-----
 drivers/gpu/drm/xe/xe_mocs.c                 |  4 +-
 drivers/gpu/drm/xe/xe_pt.c                   | 32 ++++----
 drivers/gpu/drm/xe/xe_range_fence.c          |  2 +-
 drivers/gpu/drm/xe/xe_reg_sr.c               |  4 +-
 drivers/gpu/drm/xe/xe_res_cursor.h           | 14 ++--
 drivers/gpu/drm/xe/xe_ring_ops.c             |  8 +-
 drivers/gpu/drm/xe/xe_sched_job.c            |  2 +-
 drivers/gpu/drm/xe/xe_sync.c                 |  4 +-
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c       |  4 +-
 drivers/gpu/drm/xe/xe_uc.c                   |  4 +-
 drivers/gpu/drm/xe/xe_uc_debugfs.c           |  2 +-
 drivers/gpu/drm/xe/xe_uc_fw.c                | 18 ++---
 drivers/gpu/drm/xe/xe_uc_fw.h                |  2 +-
 drivers/gpu/drm/xe/xe_vm.c                   | 84 ++++++++++----------
 drivers/gpu/drm/xe/xe_vm.h                   |  2 +-
 drivers/gpu/drm/xe/xe_vm_madvise.c           |  2 +-
 drivers/gpu/drm/xe/xe_wait_user_fence.c      |  2 +-
 drivers/gpu/drm/xe/xe_wopcm.c                | 18 ++---
 53 files changed, 317 insertions(+), 321 deletions(-)

-- 
2.34.1

