Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E0B6CFA457
	for <intel-xe@archiver.kernel.org>; Thu, 20 Nov 2025 23:45:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E25EA10E7D9;
	Thu, 20 Nov 2025 23:45:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G4jTo6eA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BEAF10E7D9
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Nov 2025 23:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763682326; x=1795218326;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9lIHYCSTcRSR/s8JLmeMZzpnXSlwApdKoObVN6CQO8g=;
 b=G4jTo6eAka3UEpLAO/BLLlt5l4KWL23loInKIFdw3f8o+67coQbBe6l6
 wOHe+LjSdEUs5nT0qlZXvo+V17UAJAWFOnIZ2INb5QzZg3q1I41IdFSHB
 qGMjvcdxlTvD+GI2HomcM7Jyf38w8aEHv1A8kJSUUQvPEo1ChjJ2d9BeJ
 qbQUOrWonYAyON3o4/mpIXYdIVU7XPtghbXWe/zkwZEynNfSeRSoDz2Oc
 816q+TN+49CqWhiyJ2YItJGYxL9PmKokE+3aQNePRipir0yZAnj4UVD6m
 S82ZkPNq2dpbhxYnAFY0ThI2PEArYHQWVXyXtx6oru1qjrpPNEEfSvBru Q==;
X-CSE-ConnectionGUID: 1AGoZyVdSDS68uX+5YlO2A==
X-CSE-MsgGUID: PHtj9U5XS0C2IR5am01WLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65807606"
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; d="scan'208";a="65807606"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 15:45:26 -0800
X-CSE-ConnectionGUID: Gkdc8KvBRWGwAjAKTsqJzQ==
X-CSE-MsgGUID: I1IUKRo5TwauwdkgmFtCRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; d="scan'208";a="214877069"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by fmviesa002.fm.intel.com with ESMTP; 20 Nov 2025 15:45:24 -0800
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Koen Koning <koen.koning@intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>, stable@vger.kernel.org,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 1/2] drm/xe: Silence allocation warnings for sync arrays
Date: Thu, 20 Nov 2025 23:42:55 +0000
Message-ID: <20251120234254.427452-5-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251120234254.427452-4-shuicheng.lin@intel.com>
References: <20251120234254.427452-4-shuicheng.lin@intel.com>
MIME-Version: 1.0
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

args->num_syncs comes from userspace and may be large or fuzzed.
When kcalloc() attempts a large allocation, the allocator may emit
warning like below, even though the driver already returns -ENOMEM
safely.

Suppress it by using __GFP_NOWARN when allocating the sync array.

"
WARNING: CPU: 0 PID: 1217 at mm/page_alloc.c:5124 __alloc_frozen_pages_noprof+0x2f8/0x2180 mm/page_alloc.c:5124
...
Call Trace:
 <TASK>
 alloc_pages_mpol+0xe4/0x330 mm/mempolicy.c:2416
 ___kmalloc_large_node+0xd8/0x110 mm/slub.c:4317
 __kmalloc_large_node_noprof+0x18/0xe0 mm/slub.c:4348
 __do_kmalloc_node mm/slub.c:4364 [inline]
 __kmalloc_noprof+0x3d4/0x4b0 mm/slub.c:4388
 kmalloc_noprof include/linux/slab.h:909 [inline]
 kmalloc_array_noprof include/linux/slab.h:948 [inline]
 xe_exec_ioctl+0xa47/0x1e70 drivers/gpu/drm/xe/xe_exec.c:158
 drm_ioctl_kernel+0x1f1/0x3e0 drivers/gpu/drm/drm_ioctl.c:797
 drm_ioctl+0x5e7/0xc50 drivers/gpu/drm/drm_ioctl.c:894
 xe_drm_ioctl+0x10b/0x170 drivers/gpu/drm/xe/xe_device.c:224
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:598 [inline]
 __se_sys_ioctl fs/ioctl.c:584 [inline]
 __x64_sys_ioctl+0x18b/0x210 fs/ioctl.c:584
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xbb/0x380 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
...
"

Reported-by: Koen Koning <koen.koning@intel.com>
Reported-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6450
Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Cc: <stable@vger.kernel.org> # v6.12+
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_exec.c | 3 ++-
 drivers/gpu/drm/xe/xe_vm.c   | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index 4d81210e41f5..7ef78a94e168 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -162,7 +162,8 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	}
 
 	if (args->num_syncs) {
-		syncs = kcalloc(args->num_syncs, sizeof(*syncs), GFP_KERNEL);
+		syncs = kcalloc(args->num_syncs, sizeof(*syncs),
+				GFP_KERNEL | __GFP_NOWARN);
 		if (!syncs) {
 			err = -ENOMEM;
 			goto err_exec_queue;
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index f9989a7a710c..8cebf7285640 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3640,7 +3640,8 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	}
 
 	if (args->num_syncs) {
-		syncs = kcalloc(args->num_syncs, sizeof(*syncs), GFP_KERNEL);
+		syncs = kcalloc(args->num_syncs, sizeof(*syncs),
+				GFP_KERNEL | __GFP_NOWARN);
 		if (!syncs) {
 			err = -ENOMEM;
 			goto put_obj;
-- 
2.49.0

