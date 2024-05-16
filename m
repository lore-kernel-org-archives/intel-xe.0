Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 425FAC25B7A
	for <intel-xe@archiver.kernel.org>; Thu, 16 May 2024 06:44:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDA6610E3E5;
	Thu, 16 May 2024 06:44:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CC7Oju3e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE59C10E37F
 for <intel-xe@lists.freedesktop.org>; Thu, 16 May 2024 06:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715841861; x=1747377861;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LJR/7yKld4H7XvKXUfql5By2ZKBStqdsz5XiHZMIsbc=;
 b=CC7Oju3ed5RYLMX1gIyByVKx0R/ctFnpX16RmOpZx/5nuXvuHfdL5rfX
 jYyAQuXSY93h+MPzpBtgCbqdALYDDlsCp2n8juhdnHuvF3bk6ku6RCbDy
 ezTYH3bGml1bWAxorao0R/SrXdukhdEGqZJMzdCR+TrrR4S97uifYUdpB
 OQcPsp30u1TkTgc9nhKL7b3gFhY7A2FKN2CtPdOkjk60jOTaXFw2EsTq4
 Zvg4Zl8sXbBaMUqFfRY+WegDAPWnQdi3CfHJODNty2aPBx3DOtwI+n5mU
 J1RLcnokmfk7dN6pWFRrB5o27PLXCFDlNpdYta2b5bMZN7512xsUnM1w8 A==;
X-CSE-ConnectionGUID: E+JXRSEGRA2eLqYvL8gNjg==
X-CSE-MsgGUID: +aAX6XYeRZue9UqNEqjHTQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="11878086"
X-IronPort-AV: E=Sophos;i="6.08,163,1712646000"; d="scan'208";a="11878086"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 23:44:20 -0700
X-CSE-ConnectionGUID: yPlejgOHQ7yGYQ731v8q5w==
X-CSE-MsgGUID: WSrR1QiCRRqeeSH3ZZ/ORQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,163,1712646000"; d="scan'208";a="35880784"
Received: from mklonows-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.188])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 23:44:19 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI v2 00/21] xe bo shrinker and exhaustive eviction
Date: Thu, 16 May 2024 08:43:48 +0200
Message-ID: <20240516064410.22151-1-thomas.hellstrom@linux.intel.com>
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

Thomas Hellström (21):
  drm/ttm: Allow TTM LRU list nodes of different types
  drm/ttm: Slightly clean up LRU list iteration
  drm/ttm: Use LRU hitches
  drm/ttm, drm/amdgpu, drm/xe: Consider hitch moves within bulk sublist
    moves
  drm/exec: Rework contended locking
  drm/ttm: Provide a generic LRU walker helper
  drm/ttm: Use restartable LRU and sleeping locks for swapping.
  drm/ttm: sleeping evict lock.
  drm/ttm: Add a virtual base class for graphics memory backup
  drm/ttm/pool: Provide a helper to shrink pages.
  drm/ttm: Use fault-injection to test error paths
  drm/ttm, drm/xe: Add a shrinker for xe bos
  dma-buf/dma-resv: Introduce dma_resv_trylock_ctx()
  drm/exec: drm_exec_trylock()
  drm/exec: Add a snapshot capability.
  drm/exec: Introduce an evict mode
  drm/ttm: Support drm_exec locking for eviction and swapping
  drm/ttm: Convert ttm vm to using drm_exec.
  drm/xe: Use drm_exec for fault locking
  drm/ttm: Use drm_exec_trylock for bo initialization
  drm/xe: Initial support for drm exec locking during validate.

 drivers/gpu/drm/Kconfig                      |  10 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c       |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c      |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c      |  12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c      |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_seq64.c    |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c       |   4 +
 drivers/gpu/drm/drm_exec.c                   | 169 ++++++-
 drivers/gpu/drm/drm_gpuvm.c                  |   8 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c      |   4 +-
 drivers/gpu/drm/nouveau/nouveau_gem.c        |   4 +-
 drivers/gpu/drm/nouveau/nouveau_uvmm.c       |   2 +-
 drivers/gpu/drm/radeon/radeon_gem.c          |   4 +-
 drivers/gpu/drm/tests/drm_exec_test.c        |  12 +-
 drivers/gpu/drm/ttm/Makefile                 |   2 +-
 drivers/gpu/drm/ttm/ttm_backup_shmem.c       | 137 ++++++
 drivers/gpu/drm/ttm/ttm_bo.c                 | 468 +++++++++----------
 drivers/gpu/drm/ttm/ttm_bo_util.c            | 266 +++++++++++
 drivers/gpu/drm/ttm/ttm_bo_vm.c              | 101 ++--
 drivers/gpu/drm/ttm/ttm_device.c             |  29 +-
 drivers/gpu/drm/ttm/ttm_pool.c               | 412 +++++++++++++++-
 drivers/gpu/drm/ttm/ttm_resource.c           | 265 ++++++++---
 drivers/gpu/drm/ttm/ttm_tt.c                 |  37 ++
 drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c   |   6 +-
 drivers/gpu/drm/xe/Makefile                  |   1 +
 drivers/gpu/drm/xe/display/xe_fb_pin.c       |   2 +-
 drivers/gpu/drm/xe/tests/xe_bo.c             | 124 ++++-
 drivers/gpu/drm/xe/tests/xe_bo_test.c        |   1 +
 drivers/gpu/drm/xe/tests/xe_bo_test.h        |   1 +
 drivers/gpu/drm/xe/tests/xe_dma_buf.c        |   4 +-
 drivers/gpu/drm/xe/tests/xe_migrate.c        |   2 +-
 drivers/gpu/drm/xe/xe_bo.c                   | 173 +++++--
 drivers/gpu/drm/xe/xe_bo.h                   |   8 +-
 drivers/gpu/drm/xe/xe_device.c               |   8 +
 drivers/gpu/drm/xe/xe_device_types.h         |   2 +
 drivers/gpu/drm/xe/xe_dma_buf.c              |   2 +-
 drivers/gpu/drm/xe/xe_ggtt.c                 |   2 +-
 drivers/gpu/drm/xe/xe_gt_pagefault.c         |   6 +-
 drivers/gpu/drm/xe/xe_shrinker.c             | 224 +++++++++
 drivers/gpu/drm/xe/xe_shrinker.h             |  18 +
 drivers/gpu/drm/xe/xe_vm.c                   |  18 +-
 include/drm/drm_exec.h                       |  35 +-
 include/drm/ttm/ttm_backup.h                 | 136 ++++++
 include/drm/ttm/ttm_bo.h                     |  59 ++-
 include/drm/ttm/ttm_pool.h                   |   5 +
 include/drm/ttm/ttm_resource.h               | 102 +++-
 include/drm/ttm/ttm_tt.h                     |  20 +
 include/linux/dma-resv.h                     |  23 +-
 49 files changed, 2447 insertions(+), 511 deletions(-)
 create mode 100644 drivers/gpu/drm/ttm/ttm_backup_shmem.c
 create mode 100644 drivers/gpu/drm/xe/xe_shrinker.c
 create mode 100644 drivers/gpu/drm/xe/xe_shrinker.h
 create mode 100644 include/drm/ttm/ttm_backup.h

-- 
2.44.0

