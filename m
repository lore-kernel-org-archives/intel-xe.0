Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB342CA1005
	for <intel-xe@archiver.kernel.org>; Tue,  2 Sep 2025 12:40:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C23D10E6CE;
	Tue,  2 Sep 2025 12:40:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W805tT6i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D13810E32C
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Sep 2025 12:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756816857; x=1788352857;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mdtMLIZElfHLreaQC0/9s2VwG9QeFGEyG+Op8CZ/EGo=;
 b=W805tT6i7lUlit1IuIrrjm3rhAzj2cdGg6vAqTLviJ3Qk+2oqJWBfMbS
 xVi+7Pxar9nKms7+QjP8G6lpK0MQaDKL5MwE0lJBEE3KBCOBrdm24PgeC
 o0BD6Q7fJhDRTqmEEDuNlone6f/duZlRB9RA9eOg0DowPvNT81dJbkxgg
 r7KsB8dv04ZcFnkeOXeZEw5ly2CFn0HaOYJN+2z4SWDfSz7xO4tgVBZA6
 +iB3shbA1gzGkaVDgg5hDwBwYfmsDYi2+9h0wxXsmU9X7hETXWCVdvHI+
 VvgaveWThQrZAstGqJfEEwxjPvsZeSPHxhQE5WZFQmCR2VbI9SLpNPSwm A==;
X-CSE-ConnectionGUID: w27r7fN4QG+fvKBagxoD/A==
X-CSE-MsgGUID: 8nuBDtcUSr+gJBaS9UIobA==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="59157305"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; d="scan'208";a="59157305"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 05:40:57 -0700
X-CSE-ConnectionGUID: XHG78C9jRi2KEnULHPWjHg==
X-CSE-MsgGUID: x3zzQiE3RL2fvxyrUf9j3A==
X-ExtLoop1: 1
Received: from dalessan-mobl3.ger.corp.intel.com (HELO fedora)
 ([10.245.245.33])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 05:40:55 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v4 00/13] Driver-managed exhaustive eviction 
Date: Tue,  2 Sep 2025 14:40:08 +0200
Message-ID: <20250902124021.70211-1-thomas.hellstrom@linux.intel.com>
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
 drivers/gpu/drm/xe/xe_bo.c                    | 809 +++++++++++++-----
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
 drivers/gpu/drm/xe/xe_svm.c                   |  97 ++-
 drivers/gpu/drm/xe/xe_validation.c            | 278 ++++++
 drivers/gpu/drm/xe/xe_validation.h            | 192 +++++
 drivers/gpu/drm/xe/xe_vm.c                    | 291 ++++---
 drivers/gpu/drm/xe/xe_vm.h                    |  38 +-
 drivers/gpu/drm/xe/xe_vm_types.h              |  32 +-
 38 files changed, 1685 insertions(+), 695 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_validation.c
 create mode 100644 drivers/gpu/drm/xe/xe_validation.h

-- 
2.50.1

