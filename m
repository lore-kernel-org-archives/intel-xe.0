Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B80A9CA1013
	for <intel-xe@archiver.kernel.org>; Mon,  8 Sep 2025 10:13:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7740510E4B8;
	Mon,  8 Sep 2025 10:13:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FiBpA/q8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3516F10E4B8
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Sep 2025 10:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757326388; x=1788862388;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ywLAx65LrsmmuEzkM0Qn3+QE2fK6VCNZPmHg/c65qkQ=;
 b=FiBpA/q8LVDMwIhNOihMHgid9D45d/rttVMXniyfjNdWviImHCN5YUgt
 GJ0WuQyMEZAOvmCV8grII0DFXfyuY7bUNzvrTFlT73/AtQfq1nmlvJ89z
 nNwyw4Or0ecKdstKwk2G6bbw0TZK1gZ+t8lcQ8eCAM4yYYK1tlUwEC2ld
 4guU/RwlS5Jl943pBVEvGdOQA4nvoxo008ApVDGN0dhFWB+kSrtC6uir1
 5YOmgV0Vpw5BaUlzpRfE0MPZD4W6wbIO8YQ5ze5eTc9cDqUAy7aDxREZw
 F8KYk4AdQsp6scIggPU+nZvM4e5ssdzrbdvkPHH9L6y6KChykjSEX3lsr A==;
X-CSE-ConnectionGUID: Azw/BUpETTCiDMCHC7o56w==
X-CSE-MsgGUID: 1Krbo3rQS/yxFmDCLMVPjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11546"; a="85022806"
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; d="scan'208";a="85022806"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 03:13:08 -0700
X-CSE-ConnectionGUID: K2ur+p9kRrWqbZKePk31ZQ==
X-CSE-MsgGUID: zoWfoLUOR8eK1sYoELUVSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; d="scan'208";a="172673587"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO fedora) ([10.245.244.9])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 03:13:07 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH v6 00/13] Driver-managed exhaustive eviction
Date: Mon,  8 Sep 2025 12:12:33 +0200
Message-ID: <20250908101246.65025-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.51.0
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
evicting other clients' memory.

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
implement this using full drm_exec locking during eviction. This means
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

Patch 1 identifies the code-paths where we need a drm_exec transaction.
Patch 2 introduces the wrapper with the rw-semaphore

The rest of the patches ensure that we wrap graphics memory
allocation in the combined rw-semaphore / drm-exec loop.

As a follow up, additional patches around suspend / resume will
be posted.

The backing store allocation functions now typically requires the caller
to indicate whether to sleep interruptible. That requires the caller to
be able to take care of the resulting error codes if interrupted.
(-EINTR or -ERESTARTSYS). Where it's obvious that the caller can do that
or where other interruptible waits are called, the series enables
interruptible waiting. In other functions a follow-up audit has to
be made to enable interruptible waiting where possible.

v2: (Highlights)
- Fix a number of issues discovered during review.
- Rework the signature of xe_validation_guart (Matt Brost)
- Rework the CPU fault handler (Matt Brost)
v3: (Highlights)
- Rebase on the gpu_madvise series. Mainly causing conflicts in
  the CPU fault handler.
- Additional rework in the CPU fault handler.
- Add patch 13
- Various fixes following review comments (Matt Brost)
v4: (CI fixes)
- i915_gem_stolen_insert_node_in_range() failed. The needed
  functionality is very similar to that of pv_provision_vf_lmem()
  and psmi_alloc_object(): Create pinned but not mapped. So
  Collect those changes into a separate patch. (CI).
- Fix struct xe_validation_ctx kerneldoc. (CI).
v5:
- Disallow CPU faulting of imported buffer objects (Matt Brost).
- Don't select caching mode for kernel bos (CI).
v6:
- Rebase.

Thomas Hellström (13):
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
  drm/xe: Rework instances of variants of xe_bo_create_locked()
  drm/xe: Convert pinned suspend eviction for exhaustive eviction

 drivers/gpu/drm/xe/Makefile                   |   1 +
 .../compat-i915-headers/gem/i915_gem_stolen.h |  13 +-
 drivers/gpu/drm/xe/display/intel_fbdev_fb.c   |  18 +-
 drivers/gpu/drm/xe/display/xe_dsb_buffer.c    |  10 +-
 drivers/gpu/drm/xe/display/xe_fb_pin.c        |  71 +-
 drivers/gpu/drm/xe/display/xe_hdcp_gsc.c      |   8 +-
 drivers/gpu/drm/xe/display/xe_plane_initial.c |   4 +-
 drivers/gpu/drm/xe/tests/xe_bo.c              |  36 +-
 drivers/gpu/drm/xe/tests/xe_dma_buf.c         |  16 +-
 drivers/gpu/drm/xe/tests/xe_migrate.c         |  66 +-
 drivers/gpu/drm/xe/xe_bo.c                    | 827 +++++++++++++-----
 drivers/gpu/drm/xe/xe_bo.h                    |  62 +-
 drivers/gpu/drm/xe/xe_device.c                |   2 +
 drivers/gpu/drm/xe/xe_device_types.h          |   3 +
 drivers/gpu/drm/xe/xe_dma_buf.c               |  72 +-
 drivers/gpu/drm/xe/xe_eu_stall.c              |   5 +-
 drivers/gpu/drm/xe/xe_exec.c                  |  26 +-
 drivers/gpu/drm/xe/xe_ggtt.c                  |  15 +-
 drivers/gpu/drm/xe/xe_ggtt.h                  |   5 +-
 drivers/gpu/drm/xe/xe_gsc.c                   |   8 +-
 drivers/gpu/drm/xe/xe_gt_pagefault.c          |  28 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |  21 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c |  24 +-
 drivers/gpu/drm/xe/xe_guc_engine_activity.c   |  13 +-
 drivers/gpu/drm/xe/xe_lmtt.c                  |  12 +-
 drivers/gpu/drm/xe/xe_lrc.c                   |   7 +-
 drivers/gpu/drm/xe/xe_migrate.c               |  20 +-
 drivers/gpu/drm/xe/xe_oa.c                    |   6 +-
 drivers/gpu/drm/xe/xe_psmi.c                  |  24 +-
 drivers/gpu/drm/xe/xe_pt.c                    |  10 +-
 drivers/gpu/drm/xe/xe_pt.h                    |   3 +-
 drivers/gpu/drm/xe/xe_pxp_submit.c            |  34 +-
 drivers/gpu/drm/xe/xe_svm.c                   | 101 ++-
 drivers/gpu/drm/xe/xe_validation.c            | 278 ++++++
 drivers/gpu/drm/xe/xe_validation.h            | 192 ++++
 drivers/gpu/drm/xe/xe_vm.c                    | 291 +++---
 drivers/gpu/drm/xe/xe_vm.h                    |  38 +-
 drivers/gpu/drm/xe/xe_vm_types.h              |  32 +-
 38 files changed, 1708 insertions(+), 694 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_validation.c
 create mode 100644 drivers/gpu/drm/xe/xe_validation.h

-- 
2.51.0

