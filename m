Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EA0CC7EE2D
	for <intel-xe@archiver.kernel.org>; Tue, 23 May 2023 05:44:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11D2E10E3D7;
	Tue, 23 May 2023 05:44:00 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2763F10E0B5
 for <intel-xe@lists.freedesktop.org>; Tue, 23 May 2023 05:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684820637; x=1716356637;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=B5+O9gZw8DED7Msy69zHT6AegQIGtWG3adJDHpXIDno=;
 b=IFhw/AtRSlmeYKNCuMP4begilQHzzPCRIWCBL7NraLmdPhEwOkKrgSA0
 /sfI0z5MuJnYoAD8fDfcOcFC5qM4rliWBlG3eHnWORUzZhk3Z0ejxT+zT
 vTQmAKnqU0kxWsoLcEihf8uDWnE5ZUkO03TkUYsivqv5621zoYRaEsigT
 GgHTjk46G6sIT1BHC5DtxwPyRjGUGngS70cyHM97uLiYeR9hdgGw41SEe
 vQi3Wy1KuKKkjezon5VQj2sMs6VG4+pz7WGhF3wP/HCyza8/xqLnGIMA+
 Qf4ruSzM1jAgJjqz7BZBJyfMQZLqRwaFMf4FOhJIfvv72rc3EvAofoIRF w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="439489806"
X-IronPort-AV: E=Sophos;i="6.00,185,1681196400"; d="scan'208";a="439489806"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 22:43:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="1033910166"
X-IronPort-AV: E=Sophos;i="6.00,185,1681196400"; d="scan'208";a="1033910166"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 22:43:55 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon, 22 May 2023 22:43:56 -0700
Message-Id: <20230523054404.4011148-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 0/8] Scheduler changes for upstreaming
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

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  3 +-
 drivers/gpu/drm/etnaviv/etnaviv_sched.c    |  5 +-
 drivers/gpu/drm/lima/lima_sched.c          |  5 +-
 drivers/gpu/drm/msm/msm_ringbuffer.c       |  7 +-
 drivers/gpu/drm/panfrost/panfrost_job.c    |  5 +-
 drivers/gpu/drm/scheduler/sched_entity.c   | 85 +++++++++++++++----
 drivers/gpu/drm/scheduler/sched_fence.c    |  2 +-
 drivers/gpu/drm/scheduler/sched_main.c     | 88 ++++++++++++++++---
 drivers/gpu/drm/v3d/v3d_sched.c            | 25 +++---
 drivers/gpu/drm/xe/xe_bo.c                 | 24 +++++-
 drivers/gpu/drm/xe/xe_bo.h                 |  4 +-
 drivers/gpu/drm/xe/xe_devcoredump_types.h  |  1 +
 drivers/gpu/drm/xe/xe_dma_buf.c            |  2 +-
 drivers/gpu/drm/xe/xe_engine.c             | 36 +++++++-
 drivers/gpu/drm/xe/xe_engine.h             |  4 +
 drivers/gpu/drm/xe/xe_exec.c               | 14 +++
 drivers/gpu/drm/xe/xe_execlist.c           |  3 +-
 drivers/gpu/drm/xe/xe_guc_engine_types.h   |  2 +
 drivers/gpu/drm/xe/xe_guc_submit.c         | 99 +++++++++++++++++++---
 drivers/gpu/drm/xe/xe_trace.h              |  5 ++
 drivers/gpu/drm/xe/xe_vm.c                 | 12 ++-
 drivers/gpu/drm/xe/xe_vm_types.h           |  3 +
 include/drm/gpu_scheduler.h                | 29 +++++--
 23 files changed, 383 insertions(+), 80 deletions(-)

-- 
2.34.1

