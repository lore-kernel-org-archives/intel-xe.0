Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9B4EC27C44
	for <intel-xe@archiver.kernel.org>; Tue, 28 May 2024 12:34:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A39DB10E2E7;
	Tue, 28 May 2024 12:34:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F5OmQhgs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8F2A10E171
 for <intel-xe@lists.freedesktop.org>; Tue, 28 May 2024 12:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716899638; x=1748435638;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+jlGtbAkhuU2rFYMx21WLEyyz6frdHVw8CJGEws0YsY=;
 b=F5OmQhgsZO/S5oeEwUXUQuIm+t9gfhAvvE+ZjSmillwuNDP3mclkiQSS
 zfinwXBqcw5sOvE03Z2xtraqXSK3SjY2Me0OiGIkY09+0vNwVj5jUEZiS
 SWCN9zHCudY4eyye7EbrDTbkH2oXs+W9dWYtRQWKSIs5x2yei0EMV9u0S
 VuEQVq3w+vBiF9L4pAaYxwTA4SOVLpjDkk4KXIIOaWNyt08iJXQrBGMpa
 P30xBy59AXvmmJRNJ2IX6LQRNDXy8WSfLzbGM7lIadmRq+1n1KKnC9YrE
 H2QmxNccXT2eN0HFtLW4gK/aKQ8gomgVajG66WySTTgjNMljpBLqI8IHP A==;
X-CSE-ConnectionGUID: o9TwEPdKSOWidbcUKvi4UA==
X-CSE-MsgGUID: WTbrGh2fS0GNNsYRSMGHFA==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13064987"
X-IronPort-AV: E=Sophos;i="6.08,195,1712646000"; d="scan'208";a="13064987"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 05:33:56 -0700
X-CSE-ConnectionGUID: BCOwk3TnTROepC4tqTkX8A==
X-CSE-MsgGUID: uxDiLsIrTdKSzze0EMlOiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,195,1712646000"; d="scan'208";a="39880333"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO fedora..)
 ([10.245.244.233])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 05:33:54 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI v5 00/20] xe bo shrinker and exhaustive eviction
Date: Tue, 28 May 2024 14:33:21 +0200
Message-ID: <20240528123343.169970-1-thomas.hellstrom@linux.intel.com>
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
v5:
- Test an alternative approach for trylocking

Thomas Hellström (20):
  drm/ttm: Allow TTM LRU list nodes of different types
  drm/ttm: Slightly clean up LRU list iteration
  drm/ttm: Use LRU hitches
  drm/ttm, drm/amdgpu, drm/xe: Consider hitch moves within bulk sublist
    moves
  drm/ttm: Provide a generic LRU walker helper
  drm/ttm: Use the LRU walker helper for swapping
  drm/ttm: Use the LRU walker for eviction
  drm/ttm: Add a virtual base class for graphics memory backup
  drm/ttm/pool: Provide a helper to shrink pages
  drm/ttm: Use fault-injection to test error paths
  drm/ttm, drm/xe: Add a shrinker for xe bos
  dma-buf/dma-resv: Introduce dma_resv_trylock_ctx()
  drm/exec: Add a snapshot capability
  drm/exec: Introduce an evict mode
  drm/ttm: Support drm_exec locking for eviction and swapping
  drm/ttm: Convert ttm vm to using drm_exec
  drm/xe: Use drm_exec for fault locking
  drm/exec: Introduce drm_exec_sanitize_for_trylock
  drm/ttm: Use drm_exec_trylock for bo initialization
  drm/xe: Initial support for drm exec locking during validate

 drivers/gpu/drm/Kconfig                    |  10 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c    |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c     |   4 +
 drivers/gpu/drm/drm_exec.c                 | 210 ++++++++-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c    |   4 +-
 drivers/gpu/drm/nouveau/nouveau_gem.c      |   4 +-
 drivers/gpu/drm/radeon/radeon_gem.c        |   4 +-
 drivers/gpu/drm/ttm/Makefile               |   2 +-
 drivers/gpu/drm/ttm/ttm_backup_shmem.c     | 137 ++++++
 drivers/gpu/drm/ttm/ttm_bo.c               | 517 +++++++++++----------
 drivers/gpu/drm/ttm/ttm_bo_util.c          | 241 ++++++++++
 drivers/gpu/drm/ttm/ttm_bo_vm.c            | 101 ++--
 drivers/gpu/drm/ttm/ttm_device.c           |  29 +-
 drivers/gpu/drm/ttm/ttm_pool.c             | 412 +++++++++++++++-
 drivers/gpu/drm/ttm/ttm_resource.c         | 264 ++++++++---
 drivers/gpu/drm/ttm/ttm_tt.c               |  37 ++
 drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c |   6 +-
 drivers/gpu/drm/xe/Makefile                |   1 +
 drivers/gpu/drm/xe/display/xe_fb_pin.c     |   2 +-
 drivers/gpu/drm/xe/tests/xe_bo.c           | 124 ++++-
 drivers/gpu/drm/xe/tests/xe_bo_test.c      |   1 +
 drivers/gpu/drm/xe/tests/xe_bo_test.h      |   1 +
 drivers/gpu/drm/xe/tests/xe_dma_buf.c      |   4 +-
 drivers/gpu/drm/xe/tests/xe_migrate.c      |   2 +-
 drivers/gpu/drm/xe/xe_bo.c                 | 173 +++++--
 drivers/gpu/drm/xe/xe_bo.h                 |   8 +-
 drivers/gpu/drm/xe/xe_device.c             |   8 +
 drivers/gpu/drm/xe/xe_device_types.h       |   2 +
 drivers/gpu/drm/xe/xe_dma_buf.c            |   2 +-
 drivers/gpu/drm/xe/xe_ggtt.c               |   2 +-
 drivers/gpu/drm/xe/xe_gt_pagefault.c       |   2 +-
 drivers/gpu/drm/xe/xe_shrinker.c           | 224 +++++++++
 drivers/gpu/drm/xe/xe_shrinker.h           |  18 +
 drivers/gpu/drm/xe/xe_vm.c                 |   8 +-
 include/drm/drm_exec.h                     |  39 +-
 include/drm/ttm/ttm_backup.h               | 136 ++++++
 include/drm/ttm/ttm_bo.h                   |  59 ++-
 include/drm/ttm/ttm_pool.h                 |   5 +
 include/drm/ttm/ttm_resource.h             |  99 +++-
 include/drm/ttm/ttm_tt.h                   |  20 +
 include/linux/dma-resv.h                   |  23 +-
 41 files changed, 2480 insertions(+), 469 deletions(-)
 create mode 100644 drivers/gpu/drm/ttm/ttm_backup_shmem.c
 create mode 100644 drivers/gpu/drm/xe/xe_shrinker.c
 create mode 100644 drivers/gpu/drm/xe/xe_shrinker.h
 create mode 100644 include/drm/ttm/ttm_backup.h

-- 
2.44.0

