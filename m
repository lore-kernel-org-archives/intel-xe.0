Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32DCBCA0EE0
	for <intel-xe@archiver.kernel.org>; Wed, 13 Aug 2025 10:51:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCE9010E1DE;
	Wed, 13 Aug 2025 10:51:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ewLjlBi5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DFD210E1DE
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Aug 2025 10:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755082309; x=1786618309;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Qt1SYcyST2u+UCfpM71K9fgTMKHb6s3MH/fHhndJfMU=;
 b=ewLjlBi5cHtbitXGhCVxPWIzEELL1YEAmdKgQ1xOpj66KhObn0pm0Oyh
 7viroVijwyeX0z5rVH/cAPpuoBIZSrPRNzDYaFBs63CJQWoi3yj+FVprL
 Pmj4iB565rGkuxbo69gETKIgsmko7wKGN5Ywt2no5Rcs2Nz3Wnzmlfw8w
 0/3Xh84zAuls+/tfciewudUqvxWVi5+8qguXEn7+GMcLpL+XcftvCozQS
 IulH4bPknjc2JLRsKuY3bYwTEqRmY+8sphhMj59PSkU8+v7NKhkTw1vQr
 ix6W3iLn4mtniymMHdyLX8/PUFvuKhCTAfa2Cht3dOP9epYtk8JI9eVN6 A==;
X-CSE-ConnectionGUID: 3wYF5rMWS/OzRJYIuHVM1w==
X-CSE-MsgGUID: dpnJjxEEQrWfGpHLdZ3/IA==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="57449972"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="57449972"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 03:51:48 -0700
X-CSE-ConnectionGUID: imWhgYIbSLm8qnt/G3FBYg==
X-CSE-MsgGUID: Z9ek3PgaSraR/8eeEN6P0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="166068897"
Received: from agladkov-desk.ger.corp.intel.com (HELO fedora)
 ([10.245.245.199])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 03:51:47 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH 00/15] Driver-managed exhaustive eviction
Date: Wed, 13 Aug 2025 12:51:06 +0200
Message-ID: <20250813105121.5945-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.50.1
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

Exhaustive eviction means that every client should in theory be able to
allocate all graphics memory (minus pinned memory). This is done by
evicting other client's memory.

Currently when TTM wants to evict a buffer object it will typically
trylock that buffer object. It may also optionally try a sleeping lock,
but if deadlock resolution kicks in while doing so (the locking
returns -EDEADLK), that is converted to an -ENOMEM and returned to the
caller. If there are multiple clients simultaneously wanting to evict
eachother's buffer objects, there is a chance that clients end
up returning -ENOMEM.

The key to resolving this is that on memory contention, lower
priority clients back off, releasing their buffer object locks and
thereby allow their memory to be evicted. Eventually their priority
will elevate and they will succeed. TTM has long been intending to
implent this using full drm_exec locking during eviction. This means
that when that is implemented, clients wanting to validate memory must
pass the drm_exec context used to lock its buffer object to TTM
validation. Most of this series is making sure that is done, both
on exec-type validation and buffer object creation. The big benefit of
this approach is that it can distinguish between memory types and
avoid lock release rollbacks until it is really necessary. One
drawback is that it can't handle system memory contention resolved
by a shrinker.

However, since TTM has still to implement drm_exec validation, this
series, while preparing for the TTM implementation, takes a different
approach with an outer rw semaphore on top of the drm_exec retry loop.
When a client wants to allocate graphics memory, the lock is taken in
non-exclusive mode. If an OOM is hit, the locks are released and the
outer lock is retaken in exclusive mode. That ensures that on memory
contention, the client will, when the exclusive lock is held, be
the only client trying to allocate memory. It requires, however,
that all clients adhere to the same scheme.

The idea is that when TTM implements drm_exec eviction, the driver-
managed scheme could be retired.

Patch 1 to 3 fixes fixes problems hit while testing.
Patch 4 identifies the code-paths where we need a drm_exec transaction.
Patch 5 introduces the wrapper with the rw-semaphore

The rest of the patches ensure that we wrap graphics memory
allocation in the combined rw-semaphore / drm-exec loop.

As a follow up, additional patches around suspend / resume will
be posted.

Thomas Hellström (15):
  drm/xe/vm: Don't use a pin the vm_resv during validation
  drm/xe/tests/xe_dma_buf: Set the drm_object::dma_buf member
  drm/xe/vm: Clear the scratch_pt pointer on error
  drm/xe: Pass down drm_exec context to validation
  drm/xe: Introduce an xe_validation wrapper around drm_exec
  drm/xe: Convert xe_bo_create_user() for exhaustive eviction
  drm/xe: Convert SVM validation for exhaustive eviction
  drm/xe: Convert existing drm_exec transactions for exhaustive eviction
  drm/xe: Convert the CPU fault handler for exhaustive eviction
  drm/xe/display: Convert __xe_pin_fb_vma()
  drm/xe: Convert xe_dma_buf.c for exhaustive eviction
  drm/xe: Rename ___xe_bo_create_locked()
  drm/xe: Convert xe_bo_create_pin_map_at() for exhaustive eviction
  drm/xe: Convert xe_bo_create_pin_map() for exhaustive eviction
  drm/xe: Convert pinned suspend eviction for exhaustive eviction

 drivers/gpu/drm/xe/Makefile                   |   1 +
 .../compat-i915-headers/gem/i915_gem_stolen.h |  24 +-
 drivers/gpu/drm/xe/display/intel_fbdev_fb.c   |  18 +-
 drivers/gpu/drm/xe/display/xe_dsb_buffer.c    |  10 +-
 drivers/gpu/drm/xe/display/xe_fb_pin.c        |  62 +-
 drivers/gpu/drm/xe/display/xe_hdcp_gsc.c      |   8 +-
 drivers/gpu/drm/xe/display/xe_plane_initial.c |   4 +-
 drivers/gpu/drm/xe/tests/xe_bo.c              |  36 +-
 drivers/gpu/drm/xe/tests/xe_dma_buf.c         |  24 +-
 drivers/gpu/drm/xe/tests/xe_migrate.c         |  66 +-
 drivers/gpu/drm/xe/xe_bo.c                    | 589 ++++++++++++------
 drivers/gpu/drm/xe/xe_bo.h                    |  56 +-
 drivers/gpu/drm/xe/xe_device.c                |   2 +
 drivers/gpu/drm/xe/xe_device_types.h          |   3 +
 drivers/gpu/drm/xe/xe_dma_buf.c               |  70 ++-
 drivers/gpu/drm/xe/xe_eu_stall.c              |   6 +-
 drivers/gpu/drm/xe/xe_exec.c                  |  26 +-
 drivers/gpu/drm/xe/xe_ggtt.c                  |  15 +-
 drivers/gpu/drm/xe/xe_ggtt.h                  |   5 +-
 drivers/gpu/drm/xe/xe_gsc.c                   |   8 +-
 drivers/gpu/drm/xe/xe_gt_pagefault.c          |  24 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |  22 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c |  24 +-
 drivers/gpu/drm/xe/xe_guc_engine_activity.c   |  13 +-
 drivers/gpu/drm/xe/xe_lmtt.c                  |  12 +-
 drivers/gpu/drm/xe/xe_lrc.c                   |   7 +-
 drivers/gpu/drm/xe/xe_migrate.c               |  20 +-
 drivers/gpu/drm/xe/xe_oa.c                    |   6 +-
 drivers/gpu/drm/xe/xe_pt.c                    |  10 +-
 drivers/gpu/drm/xe/xe_pt.h                    |   3 +-
 drivers/gpu/drm/xe/xe_pxp_submit.c            |  34 +-
 drivers/gpu/drm/xe/xe_svm.c                   |  65 +-
 drivers/gpu/drm/xe/xe_validation.c            | 248 ++++++++
 drivers/gpu/drm/xe/xe_validation.h            | 176 ++++++
 drivers/gpu/drm/xe/xe_vm.c                    | 287 +++++----
 drivers/gpu/drm/xe/xe_vm.h                    |  52 +-
 drivers/gpu/drm/xe/xe_vm_types.h              |  32 +-
 37 files changed, 1413 insertions(+), 655 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_validation.c
 create mode 100644 drivers/gpu/drm/xe/xe_validation.h

-- 
2.50.1

