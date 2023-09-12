Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67FF2EE3F22
	for <intel-xe@archiver.kernel.org>; Tue, 12 Sep 2023 20:00:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1054210E053;
	Tue, 12 Sep 2023 20:00:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27C2C10E053
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Sep 2023 19:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694548799; x=1726084799;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lG2tiiTVOyD+FWezIp02vPr52pXUl1dYirhKjSfw9MU=;
 b=LhgFYNtN0bU836hwQDBI0cBXhO9Be1YBRQ36nPpLPl9Ifr7i5sXHSz/H
 au0dggETfSGJVBJUY77zRwSMe1ECzTdWDY+YFNeoP9UmteXmqoNfptpa9
 ZKXYyeQAXRghv60GaDCXRTpbrbchNJHjkveL/IIRU5eISagfJXpcMfI1f
 CGjCZgLeL7mkw28KF9+GgSxS8tWTI+2lnx2SVi6R49KzBXyl4jUjDW8MU
 vFhfVPYJGwN+cPPuOyWzxANzy+QYrYQBdkXj4oHFn2Zs5NakCEqInGqZN
 bMxe+VKLdfYqnzPT5J3USqvIDySEyltGnfd+mcFSdr+dTKSr9ZXm66j1L Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="363513920"
X-IronPort-AV: E=Sophos;i="6.02,141,1688454000"; d="scan'208";a="363513920"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 12:59:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="990621075"
X-IronPort-AV: E=Sophos;i="6.02,141,1688454000"; d="scan'208";a="990621075"
Received: from rdomark-mobl.ccr.corp.intel.com (HELO c4b530f05251.intel.com)
 ([10.252.37.41])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 12:59:56 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 12 Sep 2023 19:59:42 +0000
Message-Id: <20230912195945.7-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v5 0/3] Use Xe assert macros instead of
 XE_WARN_ON macro
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
Cc: Francois Dugast <francois.dugast@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Use the assert macros introduced by Michal Wajdeczko:
https://patchwork.freedesktop.org/series/121549/

Some occurrences of XE_WARN_ON are still present
as they will require a bit more refactoring.

v2:
- Move XE_WARN_ON -> drm_warn to a separate patch (Matt Roper)
- Only convert the instances where the condition evaluation is not
  strictly  needed (Matt Roper and Thomas Hellström)

v3:
- Rebase
- Keep WARN splats in xe_wopcm.c (Matt Roper)

v4: Rebase

v5: Use v4 of Xe assert macro

Francois Dugast (2):
  drm/xe: Replace XE_WARN_ON with drm_warn when just printing a string
  drm/xe: Use Xe assert macros instead of XE_WARN_ON macro

Michal Wajdeczko (1):
  drm/xe: Introduce Xe assert macros

 drivers/gpu/drm/xe/xe_assert.h              | 177 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_bb.c                  |   8 +-
 drivers/gpu/drm/xe/xe_bo.c                  |  64 +++----
 drivers/gpu/drm/xe/xe_bo_evict.c            |   4 +-
 drivers/gpu/drm/xe/xe_device.c              |   6 +-
 drivers/gpu/drm/xe/xe_exec.c                |   2 +-
 drivers/gpu/drm/xe/xe_execlist.c            |  12 +-
 drivers/gpu/drm/xe/xe_force_wake.c          |   4 +-
 drivers/gpu/drm/xe/xe_force_wake.h          |   6 +-
 drivers/gpu/drm/xe/xe_ggtt.c                |  14 +-
 drivers/gpu/drm/xe/xe_gt.c                  |   1 +
 drivers/gpu/drm/xe/xe_gt_clock.c            |   2 +-
 drivers/gpu/drm/xe/xe_gt_debugfs.c          |   7 +-
 drivers/gpu/drm/xe/xe_gt_pagefault.c        |   3 +-
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |  12 +-
 drivers/gpu/drm/xe/xe_guc.c                 |  24 +--
 drivers/gpu/drm/xe/xe_guc_ads.c             |  22 +--
 drivers/gpu/drm/xe/xe_guc_ct.c              |  31 ++--
 drivers/gpu/drm/xe/xe_guc_log.c             |   4 +-
 drivers/gpu/drm/xe/xe_guc_pc.c              |   2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c          |  74 ++++----
 drivers/gpu/drm/xe/xe_huc.c                 |   3 +-
 drivers/gpu/drm/xe/xe_hw_engine.c           |  11 +-
 drivers/gpu/drm/xe/xe_lrc.c                 |   9 +-
 drivers/gpu/drm/xe/xe_migrate.c             |  31 ++--
 drivers/gpu/drm/xe/xe_mocs.c                |   2 +-
 drivers/gpu/drm/xe/xe_pt.c                  |  14 +-
 drivers/gpu/drm/xe/xe_ring_ops.c            |  13 +-
 drivers/gpu/drm/xe/xe_sched_job.c           |   2 +-
 drivers/gpu/drm/xe/xe_uc.c                  |   2 +-
 drivers/gpu/drm/xe/xe_uc_fw.c               |  16 +-
 drivers/gpu/drm/xe/xe_vm.c                  |  66 ++++----
 drivers/gpu/drm/xe/xe_vm.h                  |   2 +-
 drivers/gpu/drm/xe/xe_vm_madvise.c          |   2 +-
 34 files changed, 434 insertions(+), 218 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_assert.h

-- 
2.34.1

