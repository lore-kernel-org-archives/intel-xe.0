Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 827E2EB64DB
	for <intel-xe@archiver.kernel.org>; Thu, 15 Jun 2023 17:32:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5153D10E530;
	Thu, 15 Jun 2023 17:32:14 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF79510E530
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Jun 2023 17:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686850331; x=1718386331;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2gbGIbfeH77L1nX3IoJ5caPzU0YBx8YOzHwT8/WWoyc=;
 b=RntXLuDG7gaJbs+s3J7xKRLRJhp/uQ+fNhL5kvQjqxhYxBhUUZ8dNXJI
 jGs875b0nobFttapDSa4Zzpiu2cKB0lgefW4YeT6xkgxnajH/P/FO7w/1
 Bkljg4Y77VWAKTxRY91UATzXtCvsKKwbz3rPJKZbQFQPKwHeGAAbo+V2D
 VhZleVlODkNrxQXvGpMlL/9jCi/yBNjZlkd64qRLsUmtSLI6VDVpAvbSr
 IJEdU2wY2ihG0wgXraCCISEzmrUl9MWJFDOVgPs/X6ZEmMHfPSyk/LQuT
 8TifLnjo6NWp8OQXVXl/OFP0W7P+pWMCc4xppTBrEoNGRFYe5nGYXpQBM A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="348695149"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; d="scan'208";a="348695149"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2023 10:30:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="742321888"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; d="scan'208";a="742321888"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2023 10:30:00 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Thu, 15 Jun 2023 10:30:06 -0700
Message-Id: <20230615173014.258703-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 0/8] Scheduler changes for upstreaming
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

First 8 patches of the follow series with comments addressed:
https://patchwork.freedesktop.org/series/117156/

A follow up with submit a GuC doorbell series and a GPUVA series.

v2: Fix 'Add DRM_SCHED_POLICY_SINGLE_ENTITY scheduling policy' rebase,
checkpatch, update VM LRU bulk move removal to be in GEM free callback
rather than close
v3: Rebase, move VM LRU bulk move removal back to close
v4: Address latest round of comments

Matthew Brost (8):
  fixup! drm/sched: Convert drm scheduler to use a work queue rather
    than kthread
  drm/sched: Move schedule policy to scheduler
  drm/sched: Add DRM_SCHED_POLICY_SINGLE_ENTITY scheduling policy
  drm/xe: Use DRM_SCHED_POLICY_SINGLE_ENTITY mode
  drm/xe: Long running job update
  drm/xe: Ensure LR engines are not persistent
  drm/xe: Only try to lock external BOs in VM bind
  drm/xe: VM LRU bulk move

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |   3 +-
 drivers/gpu/drm/etnaviv/etnaviv_sched.c    |   5 +-
 drivers/gpu/drm/lima/lima_sched.c          |   5 +-
 drivers/gpu/drm/msm/msm_ringbuffer.c       |   7 +-
 drivers/gpu/drm/panfrost/panfrost_job.c    |   5 +-
 drivers/gpu/drm/scheduler/sched_entity.c   |  85 ++++++++++++++---
 drivers/gpu/drm/scheduler/sched_fence.c    |   2 +-
 drivers/gpu/drm/scheduler/sched_main.c     |  90 +++++++++++++++---
 drivers/gpu/drm/v3d/v3d_sched.c            |  25 +++--
 drivers/gpu/drm/xe/xe_bo.c                 |  31 ++++++-
 drivers/gpu/drm/xe/xe_bo.h                 |   4 +-
 drivers/gpu/drm/xe/xe_devcoredump_types.h  |   1 +
 drivers/gpu/drm/xe/xe_dma_buf.c            |   2 +-
 drivers/gpu/drm/xe/xe_engine.c             |  36 +++++++-
 drivers/gpu/drm/xe/xe_engine.h             |   4 +
 drivers/gpu/drm/xe/xe_exec.c               |  14 +++
 drivers/gpu/drm/xe/xe_execlist.c           |   3 +-
 drivers/gpu/drm/xe/xe_guc_engine_types.h   |   2 +
 drivers/gpu/drm/xe/xe_guc_submit.c         | 102 +++++++++++++++++----
 drivers/gpu/drm/xe/xe_trace.h              |   5 +
 drivers/gpu/drm/xe/xe_vm.c                 |  12 ++-
 drivers/gpu/drm/xe/xe_vm_types.h           |   3 +
 include/drm/gpu_scheduler.h                |  29 ++++--
 23 files changed, 390 insertions(+), 85 deletions(-)

-- 
2.34.1

