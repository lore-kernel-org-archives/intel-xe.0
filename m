Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FFF5C83F14
	for <intel-xe@archiver.kernel.org>; Wed, 30 Aug 2023 12:38:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E040E10E51E;
	Wed, 30 Aug 2023 12:38:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 723B510E51E
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Aug 2023 12:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693399097; x=1724935097;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MAawguZVC7RJbjc6CD+0iN2LE0q2T9sB8xFa6Be4KXw=;
 b=g7yLoyV2c6Or8bmT/xBvO97DHFqvVE88NqgEh2zVEknsn6kb3ORH/3WI
 7tWU7TIozJEecuPBq3fGevBTQbngm5Cl9Xs0tOgtipcw3wPXk3SYvBjos
 /DK90AHjNbS1PTgN/6xdEtlVO6M4JyP9BWCyh82pd4qRRM9w8Tuq48IhX
 Jjz57gTc/HyR+4JSBZDZbSvUA/s84453wKj7k6Akd42hAZSA5/1nz4Q89
 wV1XiMoA5Sso2lHlq8/1pyKwrMrk0T4Rs7Dc4Q2g87YhGZaFGtmsAmUeX
 Xc41laWCQIwkKFVjbTFINTqyqnHLbvPS4tu9PPpnAnUtXd7EMwUkLo4+h A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="365835566"
X-IronPort-AV: E=Sophos;i="6.02,213,1688454000"; d="scan'208";a="365835566"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2023 05:37:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="688888221"
X-IronPort-AV: E=Sophos;i="6.02,213,1688454000"; d="scan'208";a="688888221"
Received: from cooperst-gp139.amr.corp.intel.com (HELO 01811ef90267.intel.com)
 ([10.251.214.151])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2023 05:37:35 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 30 Aug 2023 12:37:19 +0000
Message-Id: <20230830123722.6-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 0/3] Use Xe assert macros instead of
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

Francois Dugast (2):
  drm/xe: Replace XE_WARN_ON with drm_warn when just printing string
  drm/xe: Use Xe assert macros instead of XE_WARN_ON macro

Michal Wajdeczko (1):
  drm/xe: Introduce Xe assert macros

 drivers/gpu/drm/xe/xe_assert.h              | 177 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_bb.c                  |   8 +-
 drivers/gpu/drm/xe/xe_bo.c                  |  67 ++++----
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
 drivers/gpu/drm/xe/xe_vm.c                  |  74 ++++----
 drivers/gpu/drm/xe/xe_vm.h                  |   2 +-
 drivers/gpu/drm/xe/xe_vm_madvise.c          |   2 +-
 drivers/gpu/drm/xe/xe_wopcm.c               |  18 +-
 35 files changed, 449 insertions(+), 232 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_assert.h

-- 
2.34.1

