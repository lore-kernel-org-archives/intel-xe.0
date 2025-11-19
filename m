Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C27C0CEE35E
	for <intel-xe@archiver.kernel.org>; Wed, 19 Nov 2025 02:34:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7791110E556;
	Wed, 19 Nov 2025 02:34:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oLGZ9z4V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F333110E556
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Nov 2025 02:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763519671; x=1795055671;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1fxs4CoKC0tGWPuzDqy3frhmkc2WE5gKk7iThgxQYSA=;
 b=oLGZ9z4V1tsLJyFWhtflXN3i7KcRcPw+7kfGau6270GwydxLcSu46nI+
 uhxvqVake1Qyv8zOOzbpfyo+l9ZPBwUEwa566ksZLCTQEmGNlSikkDx2r
 Ty7fC1/nJ5zQARUv+uQkPt22BrEz+S4ed4T6uvtJfGdpiDKU9Xe7Bde7t
 jh/yifLO3ACMAfflZzDJf9Qnfs24S9ZirIhZaUKKfkIghyc6yPIyYGvVA
 O1ulRtAa6NjuF6e7yp4jhnUVwSQrAT847g8u2K18hkqEZN29Xxm9hF0Pm
 EUOTo0yw2NBz5+vtmAdW6fw+Lyl+zbYvq7+nswzhkad11GqMA0038Vpk6 A==;
X-CSE-ConnectionGUID: KO8sadCqSj+d8lSc/oa8Qw==
X-CSE-MsgGUID: MW1LHSpKSoGZ872CF8G0+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="88207124"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; d="scan'208";a="88207124"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 18:34:30 -0800
X-CSE-ConnectionGUID: po8cN3e8T0aQtq6MQmKoUA==
X-CSE-MsgGUID: bUwBI9O8RMGst5UaLh5C0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; d="scan'208";a="196058013"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by orviesa005.jf.intel.com with ESMTP; 18 Nov 2025 18:34:29 -0800
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe/exec: Validate num_syncs to prevent oversized
 allocations
Date: Wed, 19 Nov 2025 02:31:04 +0000
Message-ID: <20251119023103.90241-2-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.49.0
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

The exec ioctl allows userspace to specify an arbitrary num_syncs
value. Without bounds checking, a very large num_syncs can force
an excessively large allocation, leading to kernel warnings from
the page allocator as below.

Introduce XE_EXEC_MAX_SYNCS (set to 64) and reject any request
exceeding this limit.

"
------------[ cut here ]------------
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

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6450
Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_exec.c | 5 +++++
 include/uapi/drm/xe_drm.h    | 1 +
 2 files changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index 4d81210e41f5..01c56fd95d5b 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -162,6 +162,11 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	}
 
 	if (args->num_syncs) {
+		if (XE_IOCTL_DBG(xe, args->num_syncs > XE_EXEC_MAX_SYNCS)) {
+			err = -EINVAL;
+			goto err_exec_queue;
+		}
+
 		syncs = kcalloc(args->num_syncs, sizeof(*syncs), GFP_KERNEL);
 		if (!syncs) {
 			err = -ENOMEM;
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 47853659a705..1901ca26621a 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1463,6 +1463,7 @@ struct drm_xe_exec {
 	/** @exec_queue_id: Exec queue ID for the batch buffer */
 	__u32 exec_queue_id;
 
+#define XE_EXEC_MAX_SYNCS 64
 	/** @num_syncs: Amount of struct drm_xe_sync in array. */
 	__u32 num_syncs;
 
-- 
2.49.0

