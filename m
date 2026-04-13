Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 439D4F34C4E
	for <intel-xe@archiver.kernel.org>; Mon, 13 Apr 2026 13:16:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F148010E43A;
	Mon, 13 Apr 2026 13:16:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kD0NE32R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C143A10E43A
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Apr 2026 13:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776086214; x=1807622214;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XkW1aBoXUBO+ypUdWnCDpPf4X9tCL1jkaM//OedVFSo=;
 b=kD0NE32RQqyvomWOqoYSKgfAPie/t55mqAgMgJgsg5V6GZEoY8NjOxPn
 hKAAYSHLU/jzxnxhmh7k/RxXsyJ+qlf6KDVfyGMdFuACgTKUpd6Po8yAl
 bmoCJRMCG8oa63KNVWZHUD+naeu1O/lAFQVs0PVMWBwsyqPruVNBmlm7t
 0TOyx4/ZTcKRbo1pbvZzZxwTLd2JKmM8isKB78Vf8SYS+KRLqbiXRcosh
 ishDKDwlLDClB3hFGk3yZcXpdEPL4P0d02jWUXRg/Fpxa0cstqyh0hTtY
 uHhxJe0nf45UL9jYKWhk+N8Wrrftioz2hOzgjlToHG0YX8TtOZYRFc4yQ g==;
X-CSE-ConnectionGUID: fnUVZxZfRwymy26ZXTBeBg==
X-CSE-MsgGUID: UPSUBCDzQRiClmF7qIAEbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="77037294"
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; d="scan'208";a="77037294"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 06:16:54 -0700
X-CSE-ConnectionGUID: 3D93uP+7TFSEmf1SuRliBQ==
X-CSE-MsgGUID: 8/Piq+f/TqyUz5JPLWF2Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; d="scan'208";a="260224292"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 06:16:51 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, himal.prasad.ghimiray@intel.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [RFC PATCH V7 0/9] Add memory page offlining support
Date: Mon, 13 Apr 2026 18:46:21 +0530
Message-ID: <20260413131623.2891528-11-tejas.upadhyay@intel.com>
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

This series adds memory page offlining support with following:
1. drm/xe/svm: Use xe_vram_addr_to_region, avoid block->private usage
2. Link and track ttm BO's with physical addresses
3. Link LRC BO and its execution Queue
4. Extend BO purge to handle vram pages as well
5. Handle the generated physical address error by reserving addresses 4K page
6. Adds supporting debugfs to automate injection of physcal address error
7. Add buddy block allocation dump for debuggin buddy related issues
8. Add configfs for vram bad page reservation policy
9. Sysfs entry to provide statistics of bad gpu vram pages for user info

v7:
- Improve debugfs warning messages
- Use scope_guard for locking(MattB)
- Adapt addition of queue member of LRC BO(MattB)
- Extend and use xe_ttm_bo_purge API for vram pages(MattB)
- Handle dma_buf_map requests for native and remote(MattB)
- Address if in never initialized block, set block to NULL
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
- Added xe_vram_addr_to_region helper to avoid other use of block->private (MattB)

Debugfs shows test of different scenarios,
echo 0 > /sys/kernel/debug/dri/bdf/invalid_addr_vram0
where 0 is below address types to be tested,
enum mempage_offline_mode {
        MEMPAGE_OFFLINE_UNALLOCATED = 0,
        MEMPAGE_OFFLINE_USER_ALLOCATED = 1,
        MEMPAGE_OFFLINE_KERNEL_USER_GGTT_ALLOCATED = 2,
        MEMPAGE_OFFLINE_KERNEL_USER_PPGTT_ALLOCATED = 3,
        MEMPAGE_OFFLINE_KERNEL_CRITICAL_ALLOCATED = 4,
        MEMPAGE_OFFLINE_RESERVED = 5,
};

IGT tests for testing this feature:
https://patchwork.freedesktop.org/patch/714751/

Results of above tests:
Using IGT_SRANDOM=1774610050 for randomisation
Opened device: /dev/dri/card0
Starting subtest: unallocated
Subtest unallocated: SUCCESS (1.834s)
Starting subtest: user-allocated
Subtest user-allocated: SUCCESS (1.832s)
Starting subtest: user-ggtt-allocated
Subtest user-ggtt-allocated: SUCCESS (1.871s)
Starting subtest: user-ppgtt-allocated
Subtest user-ppgtt-allocated: SUCCESS (1.843s)
Starting subtest: critical-allocated
Subtest critical-allocated: SUCCESS (1.824s)
Starting subtest: reserved
Subtest reserved: SUCCESS (0.032s)

Tejas Upadhyay (9):
  drm/xe: Link VRAM object with gpu buddy
  drm/gpu: Add gpu_buddy_addr_to_block helper
  drm/xe: Link LRC BO and its execution Queue
  drm/xe: Extend BO purge to handle vram pages as well
  drm/xe: Handle physical memory address error
  drm/xe/cri: Add debugfs to inject faulty vram address
  gpu/buddy: Add routine to dump allocated buddy blocks
  drm/xe/configfs: Add vram bad page reservation policy
  drm/xe/cri: Add sysfs interface for bad gpu vram pages

 drivers/gpu/buddy.c                        |  99 ++++++
 drivers/gpu/drm/xe/xe_bo.c                 |  16 +-
 drivers/gpu/drm/xe/xe_bo.h                 |   5 +-
 drivers/gpu/drm/xe/xe_bo_types.h           |   3 +
 drivers/gpu/drm/xe/xe_configfs.c           |  64 +++-
 drivers/gpu/drm/xe/xe_configfs.h           |   2 +
 drivers/gpu/drm/xe/xe_debugfs.c            | 171 ++++++++++
 drivers/gpu/drm/xe/xe_device.c             |  51 +++
 drivers/gpu/drm/xe/xe_device_sysfs.c       |   7 +
 drivers/gpu/drm/xe/xe_dma_buf.c            |   3 +
 drivers/gpu/drm/xe/xe_exec_queue.c         |  10 +-
 drivers/gpu/drm/xe/xe_pt.c                 |   3 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       | 361 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.h       |   2 +
 drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h |  32 ++
 include/linux/gpu_buddy.h                  |   3 +
 16 files changed, 821 insertions(+), 11 deletions(-)

-- 
2.52.0

