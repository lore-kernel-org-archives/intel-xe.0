Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E24E1C43458
	for <intel-xe@archiver.kernel.org>; Tue,  7 Jul 2026 13:06:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A595B10ECE6;
	Tue,  7 Jul 2026 13:06:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hf/7q+eR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 191C610ECE6
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Jul 2026 13:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783429602; x=1814965602;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=34jFkjCpck2IkbqFmCgfVCSR8JZYHMMvDZycnDEqBvk=;
 b=hf/7q+eRaH3KDYdsV12Vca+paXxZfCeeTdyIDpnVw4wdjHEwzhmVN30z
 gKYuDSjrkwIeOjjh3WJaSB13OADUTEypyvwEunaXmiGRqwtYA05ri+GHf
 5wbuDXNbXpWR51CRBX0xV9Z6QsMjsj4BSAvTnsfQS/QPWS4BOHQA+Tg2/
 UDlbqWao/EnUoSjMaH+w4pf93B9lQCZ23sl7PTIGECmV/JPt0BVDQSa8W
 H6JFRz4Hm7q5gXagvvFlmZfv+AcyKSMVJK5DHlXyHNovGSfoK/lh72VRE
 argchPw1ksssIcyFcJ3OgWyppnqOjoCTyk+TJB7rNE9FXP8yx4+P31Hol Q==;
X-CSE-ConnectionGUID: P4TvdfEBRv6hq2cL+vXpdw==
X-CSE-MsgGUID: dnIsUMe7R6+jTLWteVkb2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="84050107"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="84050107"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2026 06:06:41 -0700
X-CSE-ConnectionGUID: 994h1EADT7mpijTneKAohA==
X-CSE-MsgGUID: sViuQxU7Qii56C7uOfHTkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="250006184"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2026 06:06:39 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V11 00/11] Add memory page offlining support
Date: Tue,  7 Jul 2026 18:36:13 +0530
Message-ID: <20260707130617.970638-13-tejas.upadhyay@intel.com>
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
2. Link and track ttm BO's with physical addresses
3. Link LRC BO and its execution Queue
4. Extend BO purge to handle vram pages as well
5. Handle the generated physical address error by reserving addresses 4K page
6. Adds supporting debugfs to automate injection of physcal address error
7. Add buddy block allocation dump for debuggin buddy related issues
8. Add configfs for vram bad page reservation policy
9. Sysfs entry to provide statistics of bad gpu vram pages for user info
10. Expose ban reason in EXEC_QUEUE_GET_PROPERTY_BAN
11. Add soft/hard offline mode for VRAM page retirement

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

IGT tests for testing this feature standalone core memory side:
https://patchwork.freedesktop.org/patch/714751/

Tejas Upadhyay (11):
  drm/xe: Link VRAM object with gpu buddy
  drm/gpu: Add gpu_buddy_allocated_addr_to_block helper
  drm/xe: Link LRC BO and its execution Queue
  drm/xe: Extend BO purge to handle vram pages as well
  drm/xe: Handle physical memory address error
  drm/xe/cri: Add debugfs to inject faulty vram address
  gpu/buddy: Add routine to dump allocated buddy blocks
  drm/xe/configfs: Add vram bad page reservation policy
  drm/xe/cri: Add sysfs interface for bad gpu vram pages
  drm/xe/uapi: Expose ban reason in EXEC_QUEUE_GET_PROPERTY_BAN
  drm/xe: Add soft/hard offline mode for VRAM page retirement

 drivers/gpu/buddy.c                        |  96 +++++
 drivers/gpu/drm/xe/xe_bo.c                 |  16 +-
 drivers/gpu/drm/xe/xe_bo.h                 |   5 +-
 drivers/gpu/drm/xe/xe_bo_types.h           |   3 +
 drivers/gpu/drm/xe/xe_configfs.c           |  64 ++-
 drivers/gpu/drm/xe/xe_configfs.h           |   2 +
 drivers/gpu/drm/xe/xe_debugfs.c            | 168 ++++++++
 drivers/gpu/drm/xe/xe_device_sysfs.c       |   7 +
 drivers/gpu/drm/xe/xe_dma_buf.c            |   3 +
 drivers/gpu/drm/xe/xe_exec_queue.c         |  13 +-
 drivers/gpu/drm/xe/xe_exec_queue_types.h   |   7 +-
 drivers/gpu/drm/xe/xe_execlist.c           |   4 +-
 drivers/gpu/drm/xe/xe_guc_submit.c         |  24 +-
 drivers/gpu/drm/xe/xe_lrc.c                |   1 +
 drivers/gpu/drm/xe/xe_pt.c                 |   3 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       | 441 +++++++++++++++++++--
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.h       |   2 +
 drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h |  44 ++
 include/linux/gpu_buddy.h                  |   3 +
 include/uapi/drm/xe_drm.h                  |  12 +-
 20 files changed, 873 insertions(+), 45 deletions(-)

-- 
2.52.0

