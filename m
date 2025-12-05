Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4FF3D37484
	for <intel-xe@archiver.kernel.org>; Fri,  5 Dec 2025 19:08:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D5AB10EB9E;
	Fri,  5 Dec 2025 19:08:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JPiLfJVt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A70610EB9E
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Dec 2025 19:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764961699; x=1796497699;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pYdkb3n8v/XTYzqyR1s2pUuDRnhcJIROSSdK6rm8Zvs=;
 b=JPiLfJVt3m42bkD8Shb/w+knV5R/ZR2TflTEDBimVB6zr/C3ZTrunwuY
 rpBs8zuJGeyGpbHOfjdDwVe7yhdOxRoUjTPNb7/ZLQtUzcYixqipj1oAh
 M4VSjUIuzuPhKRXdpo+8cotujsZeWWxSy2XZcsYxM0Hxe5Y5pV07QxplS
 dCmnXNpzI6gJuEjGIYV1b/a9547bwlnRultXjv25Eb840/bvB6Pe6Cn1C
 I+1mYZ0MFJ/ovuVGw6rQ3tjBRPZjKXHuXFU6nTYQEtiHoTZ9mFLVlpxz0
 UKqhSa26oJ4JUJFAMCtS/dOvmB09af96NFWQxTszk7Vu4P4U33u++0RGW Q==;
X-CSE-ConnectionGUID: lIMEIS8qR2GHr6Ly1oYYDA==
X-CSE-MsgGUID: OR7qsYA1Qz+8lOn64Btnhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="66188616"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="66188616"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 11:08:19 -0800
X-CSE-ConnectionGUID: Jg6Ybz9zRkqq/+ibs+z9NA==
X-CSE-MsgGUID: Tfu/6xFgR5WAoytBU2bUhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="226013750"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by orviesa002.jf.intel.com with ESMTP; 05 Dec 2025 11:08:16 -0800
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Koen Koning <koen.koning@intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>, stable@vger.kernel.org,
 Matthew Brost <matthew.brost@intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>, Carl Zhang <carl.zhang@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Ivan Briano <ivan.briano@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH 1/3] drm/xe/exec: Limit num_syncs to prevent oversized
 allocations
Date: Fri,  5 Dec 2025 19:05:08 +0000
Message-ID: <20251205190506.2426471-6-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251205190506.2426471-5-shuicheng.lin@intel.com>
References: <20251205190506.2426471-5-shuicheng.lin@intel.com>
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

The exec ioctl allows userspace to specify an arbitrary num_syncs
value. Without bounds checking, a very large num_syncs can force
an excessively large allocation, leading to kernel warnings from
the page allocator as below.

Introduce XE_MAX_SYNCS (set to 1024) and reject any request
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

v2: Add "Reported-by" and Cc stable kernels.
v3: Change XE_MAX_SYNCS from 64 to 1024. (Matt & Ashutosh)

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6450
Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Reported-by: Koen Koning <koen.koning@intel.com>
Reported-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
Cc: <stable@vger.kernel.org> # v6.12+
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Michal Mrozek <michal.mrozek@intel.com>
Cc: Carl Zhang <carl.zhang@intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>
Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: Ivan Briano <ivan.briano@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_exec.c | 5 +++++
 include/uapi/drm/xe_drm.h    | 1 +
 2 files changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index 4d81210e41f5..fdc7d410defa 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -162,6 +162,11 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	}
 
 	if (args->num_syncs) {
+		if (XE_IOCTL_DBG(xe, args->num_syncs > XE_MAX_SYNCS)) {
+			err = -EINVAL;
+			goto err_exec_queue;
+		}
+
 		syncs = kcalloc(args->num_syncs, sizeof(*syncs), GFP_KERNEL);
 		if (!syncs) {
 			err = -ENOMEM;
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 876a076fa6c0..ae040989fca8 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1237,6 +1237,7 @@ struct drm_xe_vm_bind {
 	/** @pad2: MBZ */
 	__u32 pad2;
 
+#define XE_MAX_SYNCS 1024
 	/** @num_syncs: amount of syncs to wait on */
 	__u32 num_syncs;
 
-- 
2.50.1

