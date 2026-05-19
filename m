Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 987EECD5BA4
	for <intel-xe@archiver.kernel.org>; Tue, 19 May 2026 12:28:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CD5C10EC98;
	Tue, 19 May 2026 12:28:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JKKYN766";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76C0910EC96
 for <intel-xe@lists.freedesktop.org>; Tue, 19 May 2026 12:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779193727; x=1810729727;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NiIY7QBhOo/3mRb3bnCB5R6KLvqLDaY6n3oz8c9AlR8=;
 b=JKKYN766/A/gg+h7HLiCET6/exFx5p6KjqDVGlrmAAEKeeORTLgZBj8f
 QBBRblkCX30vALdKkXHVe+Y/hNiNWO9z5qf/2V04zayBEK43hj3fE5igG
 CbWwReCIrRcRf4NkQ2WWbDXXexgRnrmHNdH2RzluS1wNn1a782yRbqVFT
 HZ5OTm5NSqt67I36qjibGnhH2Qzj4itsL0adhaNCR00vOVV6UBL3uNgok
 64a9txUfh0BY3KpTMgTlxoJTV2X6McVNa2Stq1YuupUgYTBOmVpNZvp4d
 xY5aHP0S55K7TpvTzOnZ1fjAZFC/NfPwd/xOTLLfLTg8bX2VVucbSGIgb g==;
X-CSE-ConnectionGUID: qRuSXEYLQhW4vpWbkxo7kg==
X-CSE-MsgGUID: A16x8q+jSC+oNdasAG1FCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="79919419"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="79919419"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 05:28:47 -0700
X-CSE-ConnectionGUID: wDqAW1teSduS0z2IMOQL2w==
X-CSE-MsgGUID: 45fDJ0VjTmiXs9ISt09TzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="263261537"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 05:28:45 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, himal.prasad.ghimiray@intel.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V10 00/10] Add memory page offlining support
Date: Tue, 19 May 2026 17:58:15 +0530
Message-ID: <20260519122817.45770-12-tejas.upadhyay@intel.com>
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
  drm/buddy: Integrate lockdep annotations for gpu buddy manager
  drm/gpu: Add gpu_buddy_allocated_addr_to_block helper
  drm/xe: Link LRC BO and its execution Queue
  drm/xe: Extend BO purge to handle vram pages as well
  drm/xe: Handle physical memory address error
  drm/xe/cri: Add debugfs to inject faulty vram address
  gpu/buddy: Add routine to dump allocated buddy blocks
  drm/xe/configfs: Add vram bad page reservation policy
  drm/xe/cri: Add sysfs interface for bad gpu vram pages

 drivers/gpu/buddy.c                        | 107 ++++++
 drivers/gpu/drm/drm_buddy.c                |   1 +
 drivers/gpu/drm/xe/xe_bo.c                 |  16 +-
 drivers/gpu/drm/xe/xe_bo.h                 |   5 +-
 drivers/gpu/drm/xe/xe_bo_types.h           |   3 +
 drivers/gpu/drm/xe/xe_configfs.c           |  64 ++-
 drivers/gpu/drm/xe/xe_configfs.h           |   2 +
 drivers/gpu/drm/xe/xe_debugfs.c            | 168 ++++++++
 drivers/gpu/drm/xe/xe_device_sysfs.c       |   7 +
 drivers/gpu/drm/xe/xe_dma_buf.c            |   3 +
 drivers/gpu/drm/xe/xe_exec_queue.c         |  13 +-
 drivers/gpu/drm/xe/xe_lrc.c                |   1 +
 drivers/gpu/drm/xe/xe_pt.c                 |   3 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       | 427 +++++++++++++++++++--
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.h       |   2 +
 drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h |  32 ++
 include/linux/gpu_buddy.h                  |  44 +++
 17 files changed, 863 insertions(+), 35 deletions(-)

-- 
2.52.0

