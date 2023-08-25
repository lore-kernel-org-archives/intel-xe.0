Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D47CC3DA66
	for <intel-xe@archiver.kernel.org>; Fri, 25 Aug 2023 11:54:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBF5110E661;
	Fri, 25 Aug 2023 11:54:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D140710E660
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Aug 2023 11:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692964472; x=1724500472;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=o124tTo9PlnF2i9R1+X6VTtwZdLfp5Up6krVpPqogSE=;
 b=XevSRAzaiyaVab2HpF4XN6E5uLxHhDfniU0fAPs9ErlqqLqyfSKgtqWx
 9d9rYRlmwWTlAfV/uWQXM2cSi914pIeFVJVzjxw6B+HTX+XwMGM6H8aWe
 wKieQiy1US/gKhnw8uHynHQxSUeL+uvp1XSo7KCra+Kvv6L+daRVPU+hM
 ymeVA7fgIYVOP3FWFSz6L5kKVQm6h/Q4KYMP3uZFLQE56DaKNEcZgTRAz
 Q2JB9ZuLdgojjjX3AZfY65Uqyp+SmpRqhsI1mckHS4mMcqyrpOFDo5hzs
 n1N31M5ClH4zfFEO9mwU2dgraa2b8T/oooQbTiUKA760Lv1OHLXt76V9l Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="355025690"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="355025690"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2023 04:54:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="802942473"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="802942473"
Received: from kmreisi-mobl.ger.corp.intel.com (HELO c50b99051e3b.intel.com)
 ([10.252.57.20])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2023 04:54:31 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 25 Aug 2023 11:54:13 +0000
Message-Id: <20230825115415.7-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC PATCH 0/2] Use Xe assert macros instead of
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

Francois Dugast (1):
  drm/xe: Use Xe assert macros instead of XE_WARN_ON macro

Michal Wajdeczko (1):
  drm/xe: Introduce Xe assert macros

 drivers/gpu/drm/xe/xe_assert.h              | 177 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_bb.c                  |   8 +-
 drivers/gpu/drm/xe/xe_bo.c                  |  69 ++++----
 drivers/gpu/drm/xe/xe_bo_evict.c            |   4 +-
 drivers/gpu/drm/xe/xe_debugfs.c             |   4 +-
 drivers/gpu/drm/xe/xe_device.c              |   8 +-
 drivers/gpu/drm/xe/xe_dma_buf.c             |   2 +-
 drivers/gpu/drm/xe/xe_exec.c                |   2 +-
 drivers/gpu/drm/xe/xe_execlist.c            |  12 +-
 drivers/gpu/drm/xe/xe_force_wake.c          |   4 +-
 drivers/gpu/drm/xe/xe_force_wake.h          |   6 +-
 drivers/gpu/drm/xe/xe_ggtt.c                |  14 +-
 drivers/gpu/drm/xe/xe_gt.c                  |  23 +--
 drivers/gpu/drm/xe/xe_gt_clock.c            |   2 +-
 drivers/gpu/drm/xe/xe_gt_debugfs.c          |   4 +-
 drivers/gpu/drm/xe/xe_gt_pagefault.c        |   2 +-
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |  12 +-
 drivers/gpu/drm/xe/xe_guc.c                 |  31 ++--
 drivers/gpu/drm/xe/xe_guc_ads.c             |  22 +--
 drivers/gpu/drm/xe/xe_guc_ct.c              |  31 ++--
 drivers/gpu/drm/xe/xe_guc_log.c             |   4 +-
 drivers/gpu/drm/xe/xe_guc_pc.c              |  20 ++-
 drivers/gpu/drm/xe/xe_guc_submit.c          |  74 ++++----
 drivers/gpu/drm/xe/xe_huc.c                 |   3 +-
 drivers/gpu/drm/xe/xe_hw_engine.c           |  11 +-
 drivers/gpu/drm/xe/xe_lrc.c                 |   9 +-
 drivers/gpu/drm/xe/xe_migrate.c             |  31 ++--
 drivers/gpu/drm/xe/xe_mocs.c                |   2 +-
 drivers/gpu/drm/xe/xe_pt.c                  |  14 +-
 drivers/gpu/drm/xe/xe_reg_sr.c              |   4 +-
 drivers/gpu/drm/xe/xe_ring_ops.c            |  13 +-
 drivers/gpu/drm/xe/xe_sched_job.c           |   2 +-
 drivers/gpu/drm/xe/xe_uc.c                  |   4 +-
 drivers/gpu/drm/xe/xe_uc_fw.c               |  16 +-
 drivers/gpu/drm/xe/xe_vm.c                  |  84 +++++-----
 drivers/gpu/drm/xe/xe_vm.h                  |   2 +-
 drivers/gpu/drm/xe/xe_vm_madvise.c          |   2 +-
 drivers/gpu/drm/xe/xe_wopcm.c               |  18 +-
 38 files changed, 485 insertions(+), 265 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_assert.h

-- 
2.34.1

