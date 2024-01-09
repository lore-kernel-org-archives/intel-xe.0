Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61724C47077
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jan 2024 23:50:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C9F710E528;
	Tue,  9 Jan 2024 23:50:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11B3810E528
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jan 2024 23:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704844239; x=1736380239;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UVGJjMzUnD/nzNZ54a4akLQlalJtdwl2dVpMQqzAEkM=;
 b=CpvvNfCyn3YyEEJoC+jpbZPbKyFHQsRQAoA5CaHpak8tDXz/MWUn3hu1
 aRjI7M/VyhW3nt/noXVNY4zZLmUXP5YSEbhRC8Nnlh5U6OY9cyUzwpw2Z
 qxgy+3axNqKgEzPRIHY1pDDMol73WqxWIo3/AIjjpGpf54e2SioVrcpPQ
 fUWxBqPjTOeZA6cpHaYDJKAX+POho5z5UWq5Lv6X2EqzNMamYqqIkC915
 kEgIXJM3zLmMsFyidGt6GMi8adCch1l8/6AKXjAO8ZoValB4rtWFP9rvY
 SLb1yMKRIt2CHsa7VkaYIS0Fz9a0i4NJzuUp6d9PB2tAmVRXoUXLWezeV w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="11845380"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="11845380"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 15:50:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="23742113"
Received: from pallavim-desk.iind.intel.com ([10.145.162.180])
 by orviesa002.jf.intel.com with ESMTP; 09 Jan 2024 15:50:37 -0800
From: Pallavi Mishra <pallavi.mishra@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 3/3] drm/xe: Add CLOS specific initializations
Date: Wed, 10 Jan 2024 05:27:58 +0530
Message-Id: <20240109235758.1432987-4-pallavi.mishra@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240109235758.1432987-1-pallavi.mishra@intel.com>
References: <20240109235758.1432987-1-pallavi.mishra@intel.com>
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

Handle CLOS specific initializations and PAT
CLOS compatibility check.

Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 15 ++++++++++++++
 drivers/gpu/drm/xe/xe_pat.c    | 36 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pat.h    |  9 +++++++++
 drivers/gpu/drm/xe/xe_vm.c     | 12 ++++++++++++
 4 files changed, 72 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 004e65544e8d..4e3d4f2c0f9b 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -43,6 +43,7 @@
 #include "xe_vm.h"
 #include "xe_wait_user_fence.h"
 #include "xe_hwmon.h"
+#include "xe_clos.h"
 
 #ifdef CONFIG_LOCKDEP
 struct lockdep_map xe_device_mem_access_lockdep_map = {
@@ -81,6 +82,7 @@ static int xe_file_open(struct drm_device *dev, struct drm_file *file)
 	xe->clients.count++;
 	spin_unlock(&xe->clients.lock);
 
+	init_client_clos(xef);
 	file->driver_priv = xef;
 	return 0;
 }
@@ -101,6 +103,9 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
 		xe_exec_queue_kill(q);
 		xe_exec_queue_put(q);
 	}
+
+	uninit_client_clos(xef);
+
 	mutex_unlock(&xef->exec_queue.lock);
 	xa_destroy(&xef->exec_queue.xa);
 	mutex_destroy(&xef->exec_queue.lock);
@@ -138,6 +143,12 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
 			  DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(XE_WAIT_USER_FENCE, xe_wait_user_fence_ioctl,
 			  DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(XE_CLOS_RESERVE, xe_clos_reserve_ioctl,
+			  DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(XE_CLOS_FREE, xe_clos_free_ioctl,
+			  DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(XE_CLOS_SET_WAYS, xe_clos_set_ways_ioctl,
+			  DRM_RENDER_ALLOW),
 };
 
 static const struct file_operations xe_driver_fops = {
@@ -542,6 +553,8 @@ int xe_device_probe(struct xe_device *xe)
 
 	xe_hwmon_register(xe);
 
+	init_device_clos(xe);
+
 	err = drmm_add_action_or_reset(&xe->drm, xe_device_sanitize, xe);
 	if (err)
 		return err;
@@ -574,6 +587,8 @@ void xe_device_remove(struct xe_device *xe)
 
 	xe_heci_gsc_fini(xe);
 
+	uninit_device_clos(xe);
+
 	xe_irq_shutdown(xe);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index 1ff6bc79e7d4..ccdefba0f2f3 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -45,6 +45,14 @@
 #define XELP_PAT_WC				REG_FIELD_PREP(XELP_MEM_TYPE_MASK, 1)
 #define XELP_PAT_UC				REG_FIELD_PREP(XELP_MEM_TYPE_MASK, 0)
 
+#define XE2_PAT_CLOS1                          ((1 << 20)|(1 << 21)|(1 << 22)|(1 << 23))
+#define XE2_PAT_CLOS2                          ((1 << 24)|(1 << 25)|(1 << 26)|(1 << 27))
+#define XE2_PAT_CLOS3                          ((1 << 28)|(1 << 29)|(1 << 30)|(1 << 31))
+
+#define XEPVC_PAT_CLOS1                                ((1 << 4)|(1 << 5))
+#define XEPVC_PAT_CLOS2                                ((1 << 6)|(1 << 7))
+
+
 static const char *XELP_MEM_TYPE_STR_MAP[] = { "UC", "WC", "WT", "WB" };
 
 struct xe_pat_ops {
@@ -148,6 +156,34 @@ u16 xe_pat_index_get_coh_mode(struct xe_device *xe, u16 pat_index)
 	return xe->pat.table[pat_index].coh_mode;
 }
 
+int xe_pat_index_clos_check(struct xe_device *xe, u16 pat_index, u16 clos_index)
+{
+	WARN_ON(pat_index >= xe->pat.n_entries);
+
+	int err = 0;
+
+	switch (clos_index) {
+	case 1:
+		if (!(((1 << pat_index) & XE2_PAT_CLOS1)
+			|| (1 << pat_index & XEPVC_PAT_CLOS1)))
+			err = -EINVAL;
+		break;
+	case 2:
+		if (!(((1 << pat_index) & XE2_PAT_CLOS2)
+			|| (1 << pat_index & XEPVC_PAT_CLOS2)))
+			err = -EINVAL;
+		break;
+	case 3:
+		if (!((1 << pat_index) & XE2_PAT_CLOS3))
+			err = -EINVAL;
+		break;
+	default:
+		drm_err(&xe->drm, "Unsupported CLOS value\n");
+			err = -EINVAL;
+	}
+	return err;
+}
+
 static void program_pat(struct xe_gt *gt, const struct xe_pat_table_entry table[],
 			int n_entries)
 {
diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h
index fa0dfbe525cd..afac06bc425f 100644
--- a/drivers/gpu/drm/xe/xe_pat.h
+++ b/drivers/gpu/drm/xe/xe_pat.h
@@ -58,4 +58,13 @@ void xe_pat_dump(struct xe_gt *gt, struct drm_printer *p);
  */
 u16 xe_pat_index_get_coh_mode(struct xe_device *xe, u16 pat_index);
 
+/**
+ * xe_pat_index_clos_check - check whether clos has been reserved for
+ * chosen pat_index.
+ * @xe: xe device
+ * @pat_index: The pat_index to query
+ * @clos_index: clos index to compare
+ */
+int xe_pat_index_clos_check(struct xe_device *xe, u16 pat_index, u16 clos_index);
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 1ca917b8315c..8e8c0302c8a0 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2800,6 +2800,18 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
 			err = -EINVAL;
 			goto free_bind_ops;
 		}
+
+		/* check whether Clos has been reserved for chosen pat */
+		if ((GRAPHICS_VER(xe) >= 20 && (pat_index > 19)) || (xe->info.platform == XE_PVC && (pat_index > 3))) {
+			mutex_lock(&xe->cache_resv.clos_mutex);
+			err = xe_pat_index_clos_check(xe, pat_index, xe->cache_resv.clos_index);
+			if (err) {
+				mutex_unlock(&xe->cache_resv.clos_mutex);
+				goto free_bind_ops;
+			}
+			mutex_unlock(&xe->cache_resv.clos_mutex);
+		}
+
 	}
 
 	return 0;
-- 
2.25.1

