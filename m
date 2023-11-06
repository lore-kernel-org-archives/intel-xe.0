Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 223F2C4332F
	for <intel-xe@archiver.kernel.org>; Mon,  6 Nov 2023 18:39:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB70310E3B1;
	Mon,  6 Nov 2023 18:39:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0BCA10E3AF
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Nov 2023 18:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699295971; x=1730831971;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hIoDGF3cXUs72I8EorHCumW8qk/yKEt7tkEki2TrJpE=;
 b=bU+aFWhghhnnnjTljeAMr2cvjmv/dAGdck7AXQUBZYcY4DgD+W0unQt2
 c5emAPOlNStYZTbcGGWa2oBYGzqecSweAvWQNwl7tWtBKzukSZKL5E1Pf
 KtfpFeocYZtWWha88cFKNELxZU0tNVyWS4buYEE9qHkG486k6+dIeBE57
 wE94Y2JrJgpPjVTwQc9ANJ2yIzqlF9/mRtMamWReJAmxBeShZRbIN9o39
 XOKKmGlmZLDHmhrD4KKkoDunznIO2FJf//WLC8nfNHZGNTwzrB3EXVnFo
 a1hfT1K9admrComu1EI5IK84Hipt4qY9tmP7DwjUZvIixMWBnQxB7AafV w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="392215422"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; d="scan'208";a="392215422"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 10:39:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="766047765"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; d="scan'208";a="766047765"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 10:39:30 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon,  6 Nov 2023 10:39:36 -0800
Message-Id: <20231106183938.71640-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/2] Sync DRM scheduler with upstream
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

Pull in DRM scheduler from upstream. Will need a rebase to pull down
the scheduler changes below the Xe driver.

Matthew Brost (2):
  drm/xe: Update to upstream DRM scheduler code
  drm/xe: Use pool of ordered wq for GuC submission

 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c  |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c   |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c      |   2 +-
 drivers/gpu/drm/etnaviv/etnaviv_sched.c      |   6 +-
 drivers/gpu/drm/lima/lima_sched.c            |   6 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c   |   4 +-
 drivers/gpu/drm/msm/msm_ringbuffer.c         |   5 +-
 drivers/gpu/drm/nouveau/nouveau_sched.c      |   6 +-
 drivers/gpu/drm/panfrost/panfrost_job.c      |   6 +-
 drivers/gpu/drm/scheduler/sched_entity.c     |  97 ++--
 drivers/gpu/drm/scheduler/sched_fence.c      |   2 +-
 drivers/gpu/drm/scheduler/sched_main.c       | 477 +++++++++----------
 drivers/gpu/drm/v3d/v3d_sched.c              |  27 +-
 drivers/gpu/drm/xe/Makefile                  |   1 +
 drivers/gpu/drm/xe/xe_exec_queue_types.h     |   3 +
 drivers/gpu/drm/xe/xe_execlist.c             |   5 +-
 drivers/gpu/drm/xe/xe_gpu_scheduler.c        | 101 ++++
 drivers/gpu/drm/xe/xe_gpu_scheduler.h        |  73 +++
 drivers/gpu/drm/xe/xe_gpu_scheduler_types.h  |  58 +++
 drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |   8 +-
 drivers/gpu/drm/xe/xe_guc_submit.c           | 212 ++++++---
 drivers/gpu/drm/xe/xe_guc_types.h            |   7 +
 drivers/gpu/drm/xe/xe_migrate.c              |   2 +-
 drivers/gpu/drm/xe/xe_trace.h                |  13 +-
 include/drm/gpu_scheduler.h                  |  89 ++--
 25 files changed, 717 insertions(+), 504 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_gpu_scheduler.c
 create mode 100644 drivers/gpu/drm/xe/xe_gpu_scheduler.h
 create mode 100644 drivers/gpu/drm/xe/xe_gpu_scheduler_types.h

-- 
2.34.1

