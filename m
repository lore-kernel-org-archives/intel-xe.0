Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 250ABC624D3
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 14:54:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB45410E021;
	Wed,  2 Sep 2026 14:54:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XE4GJSNJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CAAE10E021
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Sep 2026 14:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788360887; x=1819896887;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1AD8bl7LL1KXthPKoUevJ0mqcgA/DLTahpMHTfKXZb8=;
 b=XE4GJSNJpQn6N5KZnKPwhVswX8k2bCMeHGd73lRSJO1xjzR4WfvGN/kk
 59JEnB1yo8wsDl4GsOThF34J8w74CBekqwneNar4GpvThsie/1ccjx285
 G/3loesNwEpajASoPO4r2OOQwivZPx79eQyC5uJ7wp2L8EpLpNmIg3nwR
 dPKNREql2xALACJ7O6eS10yskRBXzo2AWkxEGCqYDdfaKQrP2l5S79u2B
 QK2VQrH+Fzy7h5r0LDHYAytsB7jyvtIjOw647ryYfpZMqq4SIhNal7knH
 z4o5THkPURhkCKwp46qhQ+Lz/d+AtWOTywubiVdiIEjrLsliG1oSiW1j1 w==;
X-CSE-ConnectionGUID: UTWUmhIwRbqBvxusKEIa7Q==
X-CSE-MsgGUID: PJ79uCCpQzi1qaOUekZWMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="92525982"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="92525982"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 07:54:46 -0700
X-CSE-ConnectionGUID: 3CUz2gOZTiakOGpD+eSVKA==
X-CSE-MsgGUID: iIH2lJEfTS+Pt7Y/is1/Hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="263259957"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 07:54:44 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, rodrigo.vivi@intel.com,
 Matthew Brost <matthew.brost@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V20 00/15] Add memory page offlining support
Date: Wed,  2 Sep 2026 20:23:43 +0530
Message-ID: <20260902145343.465686-17-tejas.upadhyay@intel.com>
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
https://patchwork.freedesktop.org/series/170555/#rev3

v20(Sashiko/MattB):
- Retry failed queued pages during xe_ttm_vram_mgr_del()
- xe_bo::q lifecycle fix
- hold down_write while traversing exec_queue list
- fix configfs default value + improve confusing read policy
v19:
- Sashiko review comment closure
- Sliting of making xe_bo_ttm_purge() export and NULL handling
- Remove redundant code in xe_ttm_vram_reserve_page_at_addr()
- Resolve nit comments provided in configfs and debugfs
v18:
- Splitting out the sysfs patch; it will come later once it is redesigned
- Address sashiko reivew comments
- Add debugfs and adjust igt tests and fault injection
v17:
- Rebase on drm-tip
- Enforce CONFIG_FAULT_INJECTION_DEBUG_FS for fault inject
v16:
- Correct sysfs patches with moving code with rcu lock
- In case purge fail let next alloc decide final failure
- Remove addr_to_block API, its being pulled from drm-tip
- Remove some unused code and replace where existing API can be used
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

Tejas Upadhyay (15):
  drm/xe: Link VRAM object with gpu buddy
  drm/xe: Link LRC BO and its execution queue with safe lifetime rules
  drm/xe: Export xe_ttm_bo_purge()
  drm/xe: Handle NULL resource and allow purging of VRAM pages
  drm/xe/bo: Make xe_bo_is_user() public
  drm/xe: Guard teardown paths against purged BOs
  drm/xe/vram: Extract buddy allocation and free helpers
  drm/xe/vram: Add page offline data structures and lifecycle
  drm/xe/vram: Add VRAM page offline fault handler
  drm/xe/configfs: Add disable_vram_page_offline attribute
  drm/xe/ras: Cache disable_vram_page_offline policy at init
  drm/xe/vram: Check disable_vram_page_offline policy in fault handler
  drm/xe: Expose bad VRAM pages via debugfs
  drm/xe/uapi: Expose ban reason in EXEC_QUEUE_GET_PROPERTY_BAN
  drm/xe: Add fault-inject based VRAM page offline injection

 drivers/gpu/drm/xe/xe_bo.c                 |  25 +-
 drivers/gpu/drm/xe/xe_bo.h                 |   2 +
 drivers/gpu/drm/xe/xe_bo_types.h           |   8 +
 drivers/gpu/drm/xe/xe_configfs.c           |  72 ++-
 drivers/gpu/drm/xe/xe_configfs.h           |   2 +
 drivers/gpu/drm/xe/xe_debugfs.c            |  51 ++
 drivers/gpu/drm/xe/xe_debugfs.h            |   2 +
 drivers/gpu/drm/xe/xe_dma_buf.c            |   3 +
 drivers/gpu/drm/xe/xe_drm_ras_types.h      |   3 +
 drivers/gpu/drm/xe/xe_exec_queue.c         |  72 ++-
 drivers/gpu/drm/xe/xe_exec_queue_types.h   |   7 +-
 drivers/gpu/drm/xe/xe_execlist.c           |   4 +-
 drivers/gpu/drm/xe/xe_guc_submit.c         |  36 +-
 drivers/gpu/drm/xe/xe_ras.c                |   9 +
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       | 590 ++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.h       |   4 +
 drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h |  40 ++
 include/uapi/drm/xe_drm.h                  |  18 +-
 18 files changed, 902 insertions(+), 46 deletions(-)

-- 
2.52.0

