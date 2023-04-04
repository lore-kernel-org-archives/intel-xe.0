Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FEDEC761AF
	for <intel-xe@archiver.kernel.org>; Tue,  4 Apr 2023 01:42:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3818010E2A8;
	Tue,  4 Apr 2023 01:42:32 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F67D10E2A8
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Apr 2023 01:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680572551; x=1712108551;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ohgvzernShgZK8t6C+EWQ6iaID4vrIRbPLoNEBKFYSc=;
 b=KnhHev0mpgbmrsAveWMvjbMky8xffvPsDIg7oNSKbjzWwxzeFGMkIEbQ
 KiYgH7M+A71E90PfpX1dd6LnnR5MqtOpAljTNq6Gk+ynwr/qZarjzjmo8
 w1pKDhKKntcsU9GXAeG72YQmAnDSRhKekV7HVXQdF1Yf4blxYQfGHmJhx
 Fa9ZI43SvlYfaSx2OYerDKDvEBE8y+5j/dLXro/Z9yNMpvGpBvL1JHEZp
 naYiqkbdcprbkKCQ98OJNJHUJARS3/sZibHGys6xAbSwQO9HLBo1KBLQ+
 m8Wuiz2FajP0soKzh13fI9qmSdinvXayBuqe/jULGfGpWVLmg7VpPQw1Q w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="322456413"
X-IronPort-AV: E=Sophos;i="5.98,316,1673942400"; d="scan'208";a="322456413"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 18:42:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="755470820"
X-IronPort-AV: E=Sophos;i="5.98,316,1673942400"; d="scan'208";a="755470820"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 18:42:30 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon,  3 Apr 2023 18:42:20 -0700
Message-Id: <20230404014228.3738347-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v5 0/8] Port Xe to use GPUVA and implement NULL
 VM binds
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

GPUVA is common code written primarily by Danilo with the idea being a
common place to track GPUVAs (VMAs in Xe) within an address space (VMs
in Xe), track all the GPUVAs attached to GEMs, and a common way
implement VM binds / unbinds with MMAP / MUNMAP semantics via creating
operation lists. All of this adds up to a common way to implement VK
sparse bindings.

This series pulls in the GPUVA code written by Danilo plus some small
fixes by myself into 1 large patch. Once the GPUVA makes it upstream, we
can rebase and drop this patch. I believe what lands upstream should be
nearly identical to this patch at least from an API perspective. 

The last three patches port Xe to GPUVA and add support for NULL VM binds
(writes dropped, read zero, VK sparse support). An example of the
semantics of this is below.

MAP 0x0000-0x8000 to NULL 	- 0x0000-0x8000 writes dropped + read zero
MAP 0x4000-0x5000 to a GEM 	- 0x0000-0x4000, 0x5000-0x8000 writes dropped + read zero; 0x4000-0x5000 mapped to a GEM
UNMAP 0x3000-0x6000		- 0x0000-0x3000, 0x6000-0x8000 writes dropped + read zero
UNMAP 0x0000-0x8000		- Nothing mapped

No changins to existing behavior, rather just new functionality./

v2: Fix CI build failure
v3: Export mas_preallocate, add patch to avoid rebinds
v5: Bug fixes, rebase, xe_vma size optimizations

Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Danilo Krummrich (2):
  maple_tree: split up MA_STATE() macro
  drm: manager to keep track of GPUs VA mappings

Matthew Brost (6):
  maple_tree: Export mas_preallocate
  drm/xe: Port Xe to GPUVA
  drm/xe: NULL binding implementation
  drm/xe: Avoid doing rebinds
  drm/xe: Reduce the number list links in xe_vma
  drm/xe: Optimize size of xe_vma allocation

 Documentation/gpu/drm-mm.rst                |   31 +
 drivers/gpu/drm/Makefile                    |    1 +
 drivers/gpu/drm/drm_debugfs.c               |   56 +
 drivers/gpu/drm/drm_gem.c                   |    3 +
 drivers/gpu/drm/drm_gpuva_mgr.c             | 1890 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_bo.c                  |   10 +-
 drivers/gpu/drm/xe/xe_bo.h                  |    1 +
 drivers/gpu/drm/xe/xe_device.c              |    2 +-
 drivers/gpu/drm/xe/xe_exec.c                |    4 +-
 drivers/gpu/drm/xe/xe_gt_pagefault.c        |   29 +-
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |   14 +-
 drivers/gpu/drm/xe/xe_guc_ct.c              |    6 +-
 drivers/gpu/drm/xe/xe_migrate.c             |    8 +-
 drivers/gpu/drm/xe/xe_pt.c                  |  176 +-
 drivers/gpu/drm/xe/xe_trace.h               |   10 +-
 drivers/gpu/drm/xe/xe_vm.c                  | 1947 +++++++++----------
 drivers/gpu/drm/xe/xe_vm.h                  |   76 +-
 drivers/gpu/drm/xe/xe_vm_madvise.c          |   87 +-
 drivers/gpu/drm/xe/xe_vm_types.h            |  276 ++-
 include/drm/drm_debugfs.h                   |   24 +
 include/drm/drm_drv.h                       |    7 +
 include/drm/drm_gem.h                       |   75 +
 include/drm/drm_gpuva_mgr.h                 |  734 +++++++
 include/linux/maple_tree.h                  |    7 +-
 include/uapi/drm/xe_drm.h                   |    8 +
 lib/maple_tree.c                            |    1 +
 26 files changed, 4203 insertions(+), 1280 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_gpuva_mgr.c
 create mode 100644 include/drm/drm_gpuva_mgr.h

-- 
2.34.1

