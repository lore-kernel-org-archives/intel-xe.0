Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 071D310ED65E
	for <intel-xe@archiver.kernel.org>; Fri, 27 Mar 2026 11:49:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B78EB10EC67;
	Fri, 27 Mar 2026 11:49:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TcG+BSeY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB86E10E390
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Mar 2026 11:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774612143; x=1806148143;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Od8QPuaHhh7j0AbrfQcy9kBL3auqNpCDqMe4jMM7FDI=;
 b=TcG+BSeYen3QkP8TWS3Ae5vm1Dj19PLEss8FBpjmjIeTF2qDF8vTEKCg
 6cXQOXLxbc8Y6pGm0fpmXzvYQtkhftIH73e7qGF5PdSBuscIhH3q85tp+
 K2ugS8rohIG83spkuPLXbn8RscNPxl11ewShy5C/vvsiXPuGiXqBu8uca
 7/UbHAuVOrpCyE/5Dn8dzqDgOaqSWl8FImz4Vbvz2B7SVFuYtnRJGQuH2
 XttkPVzg4UvLxy3Yw6jQALuW6K8WIyE7mqcnUcwlY4+Q0eWCx7O75ZeOK
 mO0HULBBpuLCKm4rLqBs9HXeDKnabIWyWSQg+usZKgeUzK+Iee3f2jm8Q w==;
X-CSE-ConnectionGUID: iAKPeb/RQAmT1DFVwHbojQ==
X-CSE-MsgGUID: ApFKWudKReSOx6nDMPDMRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="87157672"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; d="scan'208";a="87157672"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 04:49:02 -0700
X-CSE-ConnectionGUID: rL2HSX/9SPGHWvsuOd/mXg==
X-CSE-MsgGUID: BHR+v/nRRCKKBztqqkGXuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; d="scan'208";a="224335012"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 04:49:01 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, himal.prasad.ghimiray@intel.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [RFC PATCH V6 0/7] Add memory page offlining support
Date: Fri, 27 Mar 2026 17:18:13 +0530
Message-ID: <20260327114829.2678240-9-tejas.upadhyay@intel.com>
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
3. Handle the generated physical address error by reserving addresses 4K page
4. Adds supporting debugfs to automate injection of physcal address error
5. Add buddy block allocation dump for debuggin buddy related issues
6. Add configfs for vram bad page reservation policy
7. Sysfs entry to provide statistics of bad gpu vram pages for user info

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

Tejas Upadhyay (7):
  drm/xe: Link VRAM object with gpu buddy
  drm/gpu: Add gpu_buddy_addr_to_block helper
  drm/xe: Handle physical memory address error
  drm/xe/cri: Add debugfs to inject faulty vram address
  gpu/buddy: Add routine to dump allocated buddy blocks
  drm/xe/configfs: Add vram bad page reservation policy
  drm/xe/cri: Add sysfs interface for bad gpu vram pages

 drivers/gpu/buddy.c                        |  99 +++++
 drivers/gpu/drm/xe/xe_configfs.c           |  64 ++-
 drivers/gpu/drm/xe/xe_configfs.h           |   2 +
 drivers/gpu/drm/xe/xe_debugfs.c            | 170 ++++++++
 drivers/gpu/drm/xe/xe_device.c             |  51 +++
 drivers/gpu/drm/xe/xe_device_sysfs.c       |   7 +
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       | 427 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.h       |   2 +
 drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h |  30 ++
 include/linux/gpu_buddy.h                  |   3 +
 10 files changed, 854 insertions(+), 1 deletion(-)

-- 
2.52.0

