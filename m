Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0E46CD342C
	for <intel-xe@archiver.kernel.org>; Wed,  6 May 2026 14:12:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95CBD10EDC3;
	Wed,  6 May 2026 14:12:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JCBN5GJq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69FE410EDC4
 for <intel-xe@lists.freedesktop.org>; Wed,  6 May 2026 14:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778076719; x=1809612719;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PZU/vL7x9JaD+3RyM+KNudiTX4jeBN/bee4BuFFH1GI=;
 b=JCBN5GJqKRsj4jbAESNA1+9e9M9F+2Fx/PJylbgEpoZdYXrD6v5ECHua
 SX+wRei/CLj/538yZAjm3Lu+xDksnDhFH8IQx1kbC/3EL27ZCzTapL0I9
 ikLr5hoC0uMYurYanBzxsysaIeij7UrShLzuS9L+nQtx0Jq9ifFuW7bRb
 SpBSdx+Kw216ebUaxFYPWMJu58TR7+64xJlyUeHdtz2WwJMXs13Fm75mA
 EHwnRRKEjYaCeswGuGQokCtBY1M4/WuygoOZC9YhSQtE/BDy+bbk7nzzO
 qAcrHOTUs2IywoOqIL7xWeSXIV6NIjhybfDiHqD4m9nBZpm/ucXba793V w==;
X-CSE-ConnectionGUID: zq+jPHaPR0q5NbYFNkSu4w==
X-CSE-MsgGUID: Ob8n29SpRHWmJ5sr7NiJEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="96577069"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; d="scan'208";a="96577069"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 07:11:59 -0700
X-CSE-ConnectionGUID: A2MVHwKfTKumyCy6vaPsrA==
X-CSE-MsgGUID: SPQAlmHhSSqmNDA0HG0taw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; d="scan'208";a="233057060"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 07:11:57 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, himal.prasad.ghimiray@intel.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [RFC PATCH V9 00/10] Add memory page offlining support
Date: Wed,  6 May 2026 19:41:41 +0530
Message-ID: <20260506141143.4033299-12-tejas.upadhyay@intel.com>
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
1. Link VRAM object with gpu buddy
2. Integrate lockdep for gpu buddy manager
3. Link and track ttm BO's with physical addresses
4. Link LRC BO and its execution Queue
5. Extend BO purge to handle vram pages as well
6. Handle the generated physical address error by reserving addresses 4K page
7. Adds supporting debugfs to automate injection of physcal address error
8. Add buddy block allocation dump for debuggin buddy related issues
9. Add configfs for vram bad page reservation policy
10. Sysfs entry to provide statistics of bad gpu vram pages for user info

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


Tejas Upadhyay (10):
  drm/xe: Link VRAM object with gpu buddy
  [DO_NOT_REVIEW]gpu/buddy: Integrate lockdep for gpu buddy manager
  drm/gpu: Add gpu_buddy_allocated_addr_to_block helper
  drm/xe: Link LRC BO and its execution Queue
  drm/xe: Extend BO purge to handle vram pages as well
  drm/xe: Handle physical memory address error
  drm/xe/cri: Add debugfs to inject faulty vram address
  gpu/buddy: Add routine to dump allocated buddy blocks
  drm/xe/configfs: Add vram bad page reservation policy
  drm/xe/cri: Add sysfs interface for bad gpu vram pages

 drivers/gpu/buddy.c                        | 114 +++++-
 drivers/gpu/drm/drm_buddy.c                |   7 +-
 drivers/gpu/drm/xe/xe_bo.c                 |  16 +-
 drivers/gpu/drm/xe/xe_bo.h                 |   5 +-
 drivers/gpu/drm/xe/xe_bo_types.h           |   3 +
 drivers/gpu/drm/xe/xe_configfs.c           |  64 ++-
 drivers/gpu/drm/xe/xe_configfs.h           |   2 +
 drivers/gpu/drm/xe/xe_debugfs.c            | 171 ++++++++
 drivers/gpu/drm/xe/xe_device_sysfs.c       |   7 +
 drivers/gpu/drm/xe/xe_dma_buf.c            |   3 +
 drivers/gpu/drm/xe/xe_exec_queue.c         |  13 +-
 drivers/gpu/drm/xe/xe_lrc.c                |   1 +
 drivers/gpu/drm/xe/xe_pt.c                 |   3 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       | 429 +++++++++++++++++++--
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.h       |   2 +
 drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h |  32 ++
 include/linux/gpu_buddy.h                  |  44 +++
 17 files changed, 877 insertions(+), 39 deletions(-)

-- 
2.52.0

