Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57081C04FFE
	for <intel-xe@archiver.kernel.org>; Fri, 17 May 2024 07:41:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0A0510EE19;
	Fri, 17 May 2024 07:41:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d6QqCiAz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C7A210EE19
 for <intel-xe@lists.freedesktop.org>; Fri, 17 May 2024 07:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715931700; x=1747467700;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cZhRqhih48dNADIq6seKC+BqlH2GrtqE4V3HP1wrnHA=;
 b=d6QqCiAznS2reuN20Ru7Tm/PFgiA10FhG1XzxBYp7gDLG/tPwM2NZFm7
 kuii7lvHUt/8hWLUn8cg9UpBZl8fpQ3WJfBd8DaDUzxApcn2NoGLVsjw9
 Ys7yWhVRQ8SeHzLQABjRVhBRiIK6SEbCoidhdo/C0IYU775f0vcx8HHG7
 Fy4/ZZaMPF8XPOlJ1jazcZ0yiuOxXbgrQdVu0PU3qlq9uXCJJonfIRMzd
 sQGrgIHpeez0DgK6d/K0iNE8gscNvDYITzSTL/SzPRbp9eB2U+eef57hP
 hvfB3P8A18BRkB/dom7wNpa8cuOJvd6zuO/ZYKkrRKF1+vcpdjELVJ/rH w==;
X-CSE-ConnectionGUID: 005t7pQJTueo9bNh+j606w==
X-CSE-MsgGUID: BODaV2NLT/C2ibolTmiD0A==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="11897572"
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; d="scan'208";a="11897572"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 00:41:40 -0700
X-CSE-ConnectionGUID: JXddNVbpSheLA67dKDZA5w==
X-CSE-MsgGUID: xuXdiwnQT4+gr7aUc5qX0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; d="scan'208";a="36213086"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.17])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 00:41:39 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI v4 00/21] xe bo shrinker and exhaustive eviction
Date: Fri, 17 May 2024 09:41:09 +0200
Message-ID: <20240517074130.2908-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

CI testing of shrinker- and eviction patches

v2:
- Checkpatch error removal
v3:
- Fix incorrect patch order
- Fix compilation errors in other drivers
v4:
- Fix an uninitialized drm_exec member

Thomas Hellström (21):
  drm/ttm: Allow TTM LRU list nodes of different types
  drm/ttm: Slightly clean up LRU list iteration
  drm/ttm: Use LRU hitches
  drm/ttm, drm/amdgpu, drm/xe: Consider hitch moves within bulk sublist
    moves
  drm/ttm: Provide a generic LRU walker helper
  drm/ttm: Use restartable LRU and sleeping locks for swapping.
  drm/ttm: sleeping evict lock.
  drm/ttm: Add a virtual base class for graphics memory backup
  drm/ttm/pool: Provide a helper to shrink pages.
  drm/ttm: Use fault-injection to test error paths
  drm/ttm, drm/xe: Add a shrinker for xe bos
  dma-buf/dma-resv: Introduce dma_resv_trylock_ctx()
  drm/exec: Rework contended locking
  drm/exec: drm_exec_trylock()
  drm/exec: Add a snapshot capability.
  drm/exec: Introduce an evict mode
  drm/ttm: Support drm_exec locking for eviction and swapping
  drm/ttm: Convert ttm vm to using drm_exec.
  drm/xe: Use drm_exec for fault locking
  drm/ttm: Use drm_exec_trylock for bo initialization
  drm/xe: Initial support for drm exec locking during validate.

 drivers/gpu/drm/Kconfig                       |  10 +
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  |  16 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c       |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c       |  12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c       |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_seq64.c     |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c  |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        |   4 +
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c          |   2 +-
 drivers/gpu/drm/drm_exec.c                    | 170 ++++++-
 drivers/gpu/drm/drm_gpuvm.c                   |   8 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c       |   4 +-
 drivers/gpu/drm/imagination/pvr_job.c         |   2 +-
 drivers/gpu/drm/msm/msm_gem_submit.c          |   2 +-
 drivers/gpu/drm/nouveau/nouveau_gem.c         |   4 +-
 drivers/gpu/drm/nouveau/nouveau_uvmm.c        |   2 +-
 drivers/gpu/drm/radeon/radeon_gem.c           |   4 +-
 drivers/gpu/drm/tests/drm_exec_test.c         |  12 +-
 drivers/gpu/drm/ttm/Makefile                  |   2 +-
 drivers/gpu/drm/ttm/ttm_backup_shmem.c        | 137 +++++
 drivers/gpu/drm/ttm/ttm_bo.c                  | 480 ++++++++----------
 drivers/gpu/drm/ttm/ttm_bo_util.c             | 266 ++++++++++
 drivers/gpu/drm/ttm/ttm_bo_vm.c               | 101 ++--
 drivers/gpu/drm/ttm/ttm_device.c              |  29 +-
 drivers/gpu/drm/ttm/ttm_pool.c                | 412 ++++++++++++++-
 drivers/gpu/drm/ttm/ttm_resource.c            | 265 ++++++++--
 drivers/gpu/drm/ttm/ttm_tt.c                  |  37 ++
 drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c    |   6 +-
 drivers/gpu/drm/xe/Makefile                   |   1 +
 drivers/gpu/drm/xe/display/xe_fb_pin.c        |   2 +-
 drivers/gpu/drm/xe/tests/xe_bo.c              | 124 ++++-
 drivers/gpu/drm/xe/tests/xe_bo_test.c         |   1 +
 drivers/gpu/drm/xe/tests/xe_bo_test.h         |   1 +
 drivers/gpu/drm/xe/tests/xe_dma_buf.c         |   4 +-
 drivers/gpu/drm/xe/tests/xe_migrate.c         |   2 +-
 drivers/gpu/drm/xe/xe_bo.c                    | 173 +++++--
 drivers/gpu/drm/xe/xe_bo.h                    |   8 +-
 drivers/gpu/drm/xe/xe_device.c                |   8 +
 drivers/gpu/drm/xe/xe_device_types.h          |   2 +
 drivers/gpu/drm/xe/xe_dma_buf.c               |   2 +-
 drivers/gpu/drm/xe/xe_ggtt.c                  |   2 +-
 drivers/gpu/drm/xe/xe_gt_pagefault.c          |   6 +-
 drivers/gpu/drm/xe/xe_shrinker.c              | 224 ++++++++
 drivers/gpu/drm/xe/xe_shrinker.h              |  18 +
 drivers/gpu/drm/xe/xe_vm.c                    |  18 +-
 include/drm/drm_exec.h                        |  35 +-
 include/drm/ttm/ttm_backup.h                  | 136 +++++
 include/drm/ttm/ttm_bo.h                      |  59 ++-
 include/drm/ttm/ttm_pool.h                    |   5 +
 include/drm/ttm/ttm_resource.h                | 102 +++-
 include/drm/ttm/ttm_tt.h                      |  20 +
 include/linux/dma-resv.h                      |  23 +-
 53 files changed, 2470 insertions(+), 523 deletions(-)
 create mode 100644 drivers/gpu/drm/ttm/ttm_backup_shmem.c
 create mode 100644 drivers/gpu/drm/xe/xe_shrinker.c
 create mode 100644 drivers/gpu/drm/xe/xe_shrinker.h
 create mode 100644 include/drm/ttm/ttm_backup.h

-- 
2.44.0

