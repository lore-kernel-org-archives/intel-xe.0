Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57A93C624A4
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 16:16:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0823F10E140;
	Thu,  3 Sep 2026 16:16:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i7G3e4S0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DBEF10E140
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 16:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788452173; x=1819988173;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kbi5zbXCO4coOYk+8Re6DzLI/Be0vPmhSiA42OmaD/E=;
 b=i7G3e4S0crwXyl63KyZcFibEGlnLp37UVOBTFp+/92z8jC9Lzdky9vyu
 ViNjvQ2hkuXTu68q3qu4yR7uwQ0hfrmoi2WPo/Q0S5cdcb5bhvJJ2LNbv
 NLrfPsywViNBy23cJm+vQeh8C1Cjwqg13H1yaT38EOeOcCKYMFbDG76Tq
 4xd9zDUo5y56pRzj5lNVDYA2Mc7TjY6jk/rlEgb/M72THq6DOw/uthJVU
 JuLCGc7RkbaUZbyzsqW5qtU/vhvnnSEJJo6rWH9RsYIoNfIQENL6F4qFr
 OjcTlVzd97NNSZGLY24Skckwcp/s0y4zkosOv9B4NYa3t5Qn1UP7bpQle g==;
X-CSE-ConnectionGUID: Icb4XuWGSxW0q4wGMpBe/Q==
X-CSE-MsgGUID: TXJ9ZY0+Rj6raBJTrywxlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="114486980"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="114486980"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 09:16:13 -0700
X-CSE-ConnectionGUID: MWEKZesWRY+AesSRpAJ92Q==
X-CSE-MsgGUID: x0P8lDIuRwOnFRJKhhNw6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="268461427"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 09:16:11 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, rodrigo.vivi@intel.com,
 Matthew Brost <matthew.brost@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V21 00/15] Add memory page offlining support
Date: Thu,  3 Sep 2026 21:45:53 +0530
Message-ID: <20260903161553.528932-17-tejas.upadhyay@intel.com>
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

v21(Sashiko/MattB):
- Immediately offline pages if already free
- With that remove some redundant code
- Guard with lock before access to tbo
- Add kernel doc in debugfs
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
  drm/xe: Link VRAM resource allocation with gpu buddy
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
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       | 600 ++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.h       |   3 +
 drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h |  40 ++
 include/uapi/drm/xe_drm.h                  |  18 +-
 18 files changed, 911 insertions(+), 46 deletions(-)

-- 
2.52.0

