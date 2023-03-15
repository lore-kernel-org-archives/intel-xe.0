Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46C86C6FD1D
	for <intel-xe@archiver.kernel.org>; Wed, 15 Mar 2023 23:19:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19C3310E067;
	Wed, 15 Mar 2023 23:19:23 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1682210E013
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Mar 2023 23:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678922361; x=1710458361;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nnwyUkn2or5WY+AC1cqW5rdYThm1u027MT6xSp3+Ggs=;
 b=gbGGsXJVnLODjhNgyxf96lpf0rSjj7vzKsQ68ZqUWDb0L3nQOy/5D4PR
 QJzJwcAuDuw8636WAipx0tVW5mgxc2sU3C2CPO302ZVMIJjDlEEenc7pF
 fI1TgcSLg2bk4ZXW00EfoxL3clcpSMd0Ok/GCZk/HY02wLE9lTrc4mRvs
 LqkUra3dzcnpbXBgscw2N3FXPyQcauqaZ20TT00PAtTyrof6X8i58yRzb
 sNzcHJCz000ost6xi+xIuftbkfNDv85sZJkLm5WzzL34Rv9BrFPL2eJ/l
 /VrksegbBO48sNUcFpbXb7NU51iWIpoBapHxA10rYtfa6MJzcamXHDR2u Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="317490999"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; d="scan'208";a="317490999"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2023 16:19:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="790018434"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; d="scan'208";a="790018434"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2023 16:19:17 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 15 Mar 2023 16:19:14 -0700
Message-Id: <20230315231920.4095284-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/6] Port Xe to use GPUVA and implement NULL VM
 binds
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
Cc: paulo.r.zanoni@intel.com, lionel.g.landwerlin@intel.com, dakr@redhat.com
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

Signed-off-by: Matthew Brost <matthew.brost@intel.com>


Danilo Krummrich (1):
  maple_tree: split up MA_STATE() macro

Matthew Brost (4):
  maple_tree: Export mas_preallocate
  drm/xe: Port Xe to GPUVA
  drm/xe: NULL binding implementation
  drm/xe: Avoid doing rebinds

Signed-off-by: Danilo Krummrich (1):
  drm: manager to keep track of GPUs VA mappings

 Documentation/gpu/drm-mm.rst                |   31 +
 drivers/gpu/drm/Makefile                    |    1 +
 drivers/gpu/drm/drm_debugfs.c               |   56 +
 drivers/gpu/drm/drm_gem.c                   |    3 +
 drivers/gpu/drm/drm_gpuva_mgr.c             | 1891 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_bo.c                  |   10 +-
 drivers/gpu/drm/xe/xe_bo.h                  |    1 +
 drivers/gpu/drm/xe/xe_device.c              |    2 +-
 drivers/gpu/drm/xe/xe_exec.c                |    4 +-
 drivers/gpu/drm/xe/xe_gt_pagefault.c        |   27 +-
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |   14 +-
 drivers/gpu/drm/xe/xe_guc_ct.c              |    6 +-
 drivers/gpu/drm/xe/xe_migrate.c             |    5 +-
 drivers/gpu/drm/xe/xe_pt.c                  |  181 +-
 drivers/gpu/drm/xe/xe_trace.h               |   10 +-
 drivers/gpu/drm/xe/xe_vm.c                  | 1910 +++++++++----------
 drivers/gpu/drm/xe/xe_vm.h                  |   76 +-
 drivers/gpu/drm/xe/xe_vm_madvise.c          |   87 +-
 drivers/gpu/drm/xe/xe_vm_types.h            |  165 +-
 include/drm/drm_debugfs.h                   |   23 +
 include/drm/drm_drv.h                       |    7 +
 include/drm/drm_gem.h                       |   75 +
 include/drm/drm_gpuva_mgr.h                 |  735 +++++++
 include/linux/maple_tree.h                  |    7 +-
 include/uapi/drm/xe_drm.h                   |    8 +
 lib/maple_tree.c                            |    1 +
 26 files changed, 4124 insertions(+), 1212 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_gpuva_mgr.c
 create mode 100644 include/drm/drm_gpuva_mgr.h

-- 
2.34.1

