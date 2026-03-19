Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AFAC1075265
	for <intel-xe@archiver.kernel.org>; Thu, 19 Mar 2026 06:53:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D136510E137;
	Thu, 19 Mar 2026 06:53:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O3ON28U3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFDF910E137
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Mar 2026 06:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773903236; x=1805439236;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xq4kjPz+FXSayqDtaP+aE2J9LMVVdXcgDVpHyl7CYpM=;
 b=O3ON28U3p6539GANJXNwEKlLpXQ5aNsqNpmLe7e63otdJFAV5SLn1Jz2
 eVv1IBFGHh8viS6ruV47PiNmFPn3U7JnYNyGPfiyFpH94a9rYS2s2y/Jy
 aNDy2rRNBX+2ii4xv1uswx/vpALJxwjCmDwqcW/SNbKP2U6cZY7UMwTB4
 QcrLbB0Ap5XoQn3I7fZHwT76+gu624BRYf8FTbHefKvx+sJOXU0y6w/e+
 9Cbh2Wj+oAc8joM3mHNU8MYLO7oxCiT7aSuMtwfqBdjk3JBbP7/m7DWg5
 KrV1TBmmKW0EBmJF8TZLaXtRqANvNKySSvincTHSzMbdoN9mnqKSPjo8m g==;
X-CSE-ConnectionGUID: IOeZYlpXQPe8tVjHH78p8Q==
X-CSE-MsgGUID: 3hXDdjbtTIafwiHyuECvQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="75045672"
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; d="scan'208";a="75045672"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 23:53:55 -0700
X-CSE-ConnectionGUID: OhbfSqCRTPSkQ+IVVfUk5Q==
X-CSE-MsgGUID: +6izhAaKQFOGK4ECbvcl5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; d="scan'208";a="227571219"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 23:53:53 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, himal.prasad.ghimiray@intel.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [RFC PATCH V5 0/7] Add memory page offlining support
Date: Thu, 19 Mar 2026 12:23:39 +0530
Message-ID: <20260319065340.2531231-9-tejas.upadhyay@intel.com>
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
        MEMPAGE_OFFLINE_KERNEL_NONCRITICAL_ALLOCATED = 2,
        MEMPAGE_OFFLINE_KERNEL_CRITICAL_ALLOCATED = 3,
        MEMPAGE_OFFLINE_RESERVED = 4,
};

Results (in dmesg for each mode):
[  +0.000206] [IGT] xe_mempage_offline: executing
[  +0.056152] [IGT] xe_mempage_offline: starting subtest unallocated
[  +1.552685] xe 0000:03:00.0: [drm] offline mode 0 passed
[  +0.000224] [IGT] xe_mempage_offline: finished subtest unallocated, SUCCESS
[  +0.001421] [IGT] xe_mempage_offline: starting subtest user-allocated
[  +1.566528] xe 0000:03:00.0: [drm] offline mode 1 passed
[  +0.000376] [IGT] xe_mempage_offline: finished subtest user-allocated, SUCCESS
[  +0.001510] [IGT] xe_mempage_offline: starting subtest noncritical-allocated
[  +1.581090] xe 0000:03:00.0: [drm] offline mode 2 passed
[  +0.006687] [IGT] xe_mempage_offline: finished subtest noncritical-allocated, SUCCESS
[  +0.001392] [IGT] xe_mempage_offline: starting subtest critical-allocated
[  +1.562544] xe 0000:03:00.0: [drm] xe_ttm_vram_reserve_page_at_addr: corrupt addr: 0x2f6884000 in critical kernel bo, request reset
[  +0.000008] xe 0000:03:00.0: [drm] offline mode 3 passed
[  +0.000212] [IGT] xe_mempage_offline: finished subtest critical-allocated, SUCCESS
[  +0.001370] [IGT] xe_mempage_offline: starting subtest reserved
[  +0.001249] xe 0000:03:00.0: [drm] *ERROR* xe_ttm_vram_handle_addr_fault:693 addr:2fd800000 error requesting SBR
[  +0.010246] xe 0000:03:00.0: [drm] offline mode 4 passed
[  +0.000179] [IGT] xe_mempage_offline: finished subtest reserved, SUCCESS
[  +0.001795] [IGT] xe_mempage_offline: exiting, ret=0


Tejas Upadhyay (7):
  drm/xe: Link VRAM object with gpu buddy
  drm/gpu: Add gpu_buddy_addr_to_block helper
  drm/xe: Handle physical memory address error
  drm/xe/cri: Add debugfs to inject  faulty vram address
  gpu/buddy: Add routine to dump allocated buddy blocks
  drm/xe/configfs: Add vram bad page reservation policy
  drm/xe/cri: Add sysfs interface for bad gpu vram pages

 drivers/gpu/buddy.c                        |  99 +++++++
 drivers/gpu/drm/xe/xe_configfs.c           |  64 ++++-
 drivers/gpu/drm/xe/xe_configfs.h           |   2 +
 drivers/gpu/drm/xe/xe_debugfs.c            | 154 ++++++++++
 drivers/gpu/drm/xe/xe_device.c             |  51 ++++
 drivers/gpu/drm/xe/xe_device_sysfs.c       |   7 +
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       | 320 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.h       |   2 +
 drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h |  30 ++
 include/linux/gpu_buddy.h                  |   3 +
 10 files changed, 731 insertions(+), 1 deletion(-)

-- 
2.52.0

