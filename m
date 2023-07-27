Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3569CC001DC
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jul 2023 13:26:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F305810E123;
	Thu, 27 Jul 2023 13:26:44 +0000 (UTC)
Received: from mgamail.intel.com (unknown [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52FC910E123
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Jul 2023 13:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690464403; x=1722000403;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IlG//ruHvzxbvziEEG1G7COiacCi8CRI8jG08lnXzVk=;
 b=DXdt1lmT67zqnOoe3TPU4IY1coDyEKq338tkYAOf5KDdTqS+L6maqO1f
 Wsarvp7n9uKFJ7g/AESqVkxuddwWJZZ6BzX/f1U3umjo6PXWo8+jhW7Q7
 04xNFVljP0laM0z+rZpYiVSki8E1m54NEJikkmvZudRtZDIpcNwBDHhEJ
 B2pN6/hZClEt9UXrrHvzytSx/3SqlpJkodhMo5qW7VH0ORmT2+xd6hKiR
 n7fvjRWlzfCA2bBlYu0Nk/IYG1bPeamAcN+1Ldth1vOrMo+scugmfRr2X
 fLNdJ9POAEgkiJRo3IBGrY8Uoqej7PjH9kKTT1p7ekryLHnSttgAgMj5B A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="365765639"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; d="scan'208";a="365765639"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 06:26:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="973547842"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; d="scan'208";a="973547842"
Received: from cweger-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.249.37.139])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 06:26:41 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 27 Jul 2023 13:26:27 +0000
Message-Id: <20230727132630.7-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 0/3] Remove use of BUG_ON
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

Francois Dugast (3):
  drm/xe/macro: Remove unused constant
  drm/xe: Prefer WARN() over BUG() to avoid crashing the kernel
  drm/xe/macro: Display XE_WARN_ON messages only in debug mode

 drivers/gpu/drm/i915/display/intel_display.c |  2 +-
 drivers/gpu/drm/xe/xe_bb.c                   |  8 +--
 drivers/gpu/drm/xe/xe_bo.c                   | 52 +++++++++---------
 drivers/gpu/drm/xe/xe_bo.h                   | 14 ++---
 drivers/gpu/drm/xe/xe_bo_evict.c             |  4 +-
 drivers/gpu/drm/xe/xe_execlist.c             | 14 ++---
 drivers/gpu/drm/xe/xe_force_wake.c           |  4 +-
 drivers/gpu/drm/xe/xe_force_wake.h           |  4 +-
 drivers/gpu/drm/xe/xe_ggtt.c                 | 12 ++---
 drivers/gpu/drm/xe/xe_gt_clock.c             |  4 +-
 drivers/gpu/drm/xe/xe_gt_debugfs.c           |  2 +-
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c  | 12 ++---
 drivers/gpu/drm/xe/xe_guc.c                  | 22 ++++----
 drivers/gpu/drm/xe/xe_guc_ads.c              | 14 ++---
 drivers/gpu/drm/xe/xe_guc_ct.c               | 22 ++++----
 drivers/gpu/drm/xe/xe_guc_hwconfig.c         |  2 +-
 drivers/gpu/drm/xe/xe_guc_log.c              |  4 +-
 drivers/gpu/drm/xe/xe_guc_submit.c           | 48 ++++++++---------
 drivers/gpu/drm/xe/xe_huc.c                  |  2 +-
 drivers/gpu/drm/xe/xe_hw_engine.c            | 10 ++--
 drivers/gpu/drm/xe/xe_hw_fence.c             |  2 +-
 drivers/gpu/drm/xe/xe_lrc.c                  |  8 +--
 drivers/gpu/drm/xe/xe_macros.h               |  9 +++-
 drivers/gpu/drm/xe/xe_migrate.c              | 34 ++++++------
 drivers/gpu/drm/xe/xe_pt.c                   | 22 ++++----
 drivers/gpu/drm/xe/xe_res_cursor.h           | 12 ++---
 drivers/gpu/drm/xe/xe_ring_ops.c             |  8 +--
 drivers/gpu/drm/xe/xe_sched_job.c            |  2 +-
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c       |  4 +-
 drivers/gpu/drm/xe/xe_uc_fw.c                | 16 +++---
 drivers/gpu/drm/xe/xe_uc_fw.h                |  2 +-
 drivers/gpu/drm/xe/xe_vm.c                   | 56 ++++++++++----------
 drivers/gpu/drm/xe/xe_wait_user_fence.c      |  2 +-
 drivers/gpu/drm/xe/xe_wopcm.c                | 18 +++----
 34 files changed, 228 insertions(+), 223 deletions(-)

-- 
2.34.1

