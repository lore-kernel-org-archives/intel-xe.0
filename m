Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6201DC5B56A
	for <intel-xe@archiver.kernel.org>; Tue, 11 Aug 2026 12:40:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CDD610EB87;
	Tue, 11 Aug 2026 12:40:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kd2GZBv/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B80F310EB87
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Aug 2026 12:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786452034; x=1817988034;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MP117xeU86zP/94unPgzl7mytcTU9E9WXDR79oKdvp4=;
 b=kd2GZBv/Lm58zN3EUegkhxeNnaqdx+n4h7r0vNnKbW7lmj70U79vhP2x
 8icGGUFxT9brBAw7vgaXYelbD0ZXUaMJL5Dkab086mAZkayfBFE5Ir8dC
 SZ0cw6xNK4jbM6LavFztGHOolBO3FB8C+X9MynTx+z6XDpSdpj/OHip7d
 nhWKOLq12QgRzmyfT138JngVzozhCh4HXfLawudb0/dTkgrWcX9iNhD1S
 aawOHyXJpNmCc+ixaDrLloyDbaCIojwjZm8Q/RBhGIJIPo3Dh/JHpT80c
 d8dfaOIYvo3Nu+QFz3c7pTjPJTdR4rgQqLebTg9a/RftV1SXz+pRrNNPH w==;
X-CSE-ConnectionGUID: DH/7QrhhTiGCL/SKGSd/uQ==
X-CSE-MsgGUID: Ojw2yCfaTzizuZb7AjcTEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="86912986"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="86912986"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 05:40:33 -0700
X-CSE-ConnectionGUID: qsxRJCuCQwyngCoVZAQWYQ==
X-CSE-MsgGUID: 5j7RDVFNS8WgeT/GW+07Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="265329842"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 05:40:32 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V15 00/14] Add memory page offlining support
Date: Tue, 11 Aug 2026 18:10:04 +0530
Message-ID: <20260811124016.3614699-16-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
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

This functionality represents a significant step in making
the xe driver gracefully handle hardware memory degradation.
By integrating with the DRM Buddy allocator, the driver
can permanently "carve out" faulty memory so it isn't reused
by subsequent allocations.

IGT tests for testing this via injecting simple single address and
duplicate address fault to unit test functionality:
https://patchwork.freedesktop.org/patch/740601/

v15:
- Split few big patches into small
- Avoid vram_mgr lock in sysfs
- fix missing queue_pages counter increment
v14:
- Solve sashiko reviews
- Remove SOFT->HARD offline patch, decision is taken based on -EEXIST
- Dump gpu buddy allocated patch dropped
v13:
- Add fault inject and remove standlone debugfs
v12:
- Fix Sashiko review comments
v11:
- Add BAN reason for UMD to know about offlining
- Add support for soft offline mode
- Rebase and remove dummy lockdep annotation patch, as it merged from upstream
v10:
- Remove RFC
v7:
- Improve debugfs warning messages
- Use scope_guard for locking(MattB)
- Adapt addition of queue member of LRC BO(MattB)
- Extend and use xe_ttm_bo_purge API for vram pages(MattB)
- Handle dma_buf_map requests for native and remote(MattB)
- Address if in never initialized block, set block to NULL
- Add lockdep in gpu buddy (MattB)
- Correct allocated_addr_to_block logic (MattA)
V6:
- Add more specific tests to noncritical bo sections
- Handle smooth exit of user created exec queues
- Break code and make purge specific static API
V5:
- Sysfs "max_pages" addition
- Reset block->private NULL post purge
- Remove wedge, return -EIO to system controller will initiate reset
- Add debugfs tests to trigger different test scenarios manually and via igt
- Rename addr_to_tbo to addr_to_block and move under gpu/buddy.c
V4: API reworks, add configfs for policy reservation and apply config everywhere
V3: use res_to_mem_region to avoid use of block->private (MattA)
V2:
- some fixes and clean up on errors
- Added xe_vram_addr_to_region helper to avoid other use of block->private(MattB)

Tejas Upadhyay (14):
  drm/xe: Link VRAM object with gpu buddy
  [DO_NOT_MERGE]drm/gpu: Add gpu_buddy_allocated_addr_to_block helper
  drm/xe: Link LRC BO and its execution Queue
  drm/xe: Extend BO purge to handle vram pages as well
  drm/xe/bo: Make xe_bo_is_user() public
  drm/xe: Guard teardown paths against purged BOs
  drm/xe/vram: Extract buddy alloc and free helpers
  drm/xe/vram: Add page offline data structures and lifecycle
  drm/xe/vram: Add VRAM page offline fault handler
  drm/xe/configfs: Add vram bad page reservation policy
  drm/xe/vram: Use RCU for lock-free sysfs reads of bad page lists
  drm/xe: Add sysfs interface for bad gpu vram pages
  drm/xe/uapi: Expose ban reason in EXEC_QUEUE_GET_PROPERTY_BAN
  drm/xe: Add fault-inject based VRAM page offline injection

 drivers/gpu/buddy.c                        |  53 ++
 drivers/gpu/drm/xe/xe_bo.c                 |  13 +-
 drivers/gpu/drm/xe/xe_bo.h                 |   5 +-
 drivers/gpu/drm/xe/xe_bo_types.h           |   3 +
 drivers/gpu/drm/xe/xe_configfs.c           |  64 ++-
 drivers/gpu/drm/xe/xe_configfs.h           |   2 +
 drivers/gpu/drm/xe/xe_debugfs.c            |  50 ++
 drivers/gpu/drm/xe/xe_debugfs.h            |   2 +
 drivers/gpu/drm/xe/xe_device_sysfs.c       |   7 +
 drivers/gpu/drm/xe/xe_dma_buf.c            |   3 +
 drivers/gpu/drm/xe/xe_exec_queue.c         |  14 +-
 drivers/gpu/drm/xe/xe_exec_queue_types.h   |   7 +-
 drivers/gpu/drm/xe/xe_execlist.c           |   4 +-
 drivers/gpu/drm/xe/xe_guc_submit.c         |  32 +-
 drivers/gpu/drm/xe/xe_lrc.c                |   1 +
 drivers/gpu/drm/xe/xe_pt.c                 |   3 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       | 608 ++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.h       |   3 +
 drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h |  30 +
 include/linux/gpu_buddy.h                  |   2 +
 include/uapi/drm/xe_drm.h                  |  12 +-
 21 files changed, 873 insertions(+), 45 deletions(-)

-- 
2.52.0

