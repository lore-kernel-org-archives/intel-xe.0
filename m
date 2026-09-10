Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 829FEC88E41
	for <intel-xe@archiver.kernel.org>; Thu, 10 Sep 2026 21:33:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D6CE10EA17;
	Thu, 10 Sep 2026 21:33:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mpUnE9IL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 212F610EA17
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Sep 2026 21:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789076037; x=1820612037;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Mc9rk6LbXIaj1D1WwoXNIjRJxKSxVBXCbd3mzHRRI98=;
 b=mpUnE9ILipqK3lBh3rtGRLmdYYVYxg4XPL3fwfR1E/aGDQPSnpGjvMPb
 758HN8KWPu95lDcZXrXbxmOletgsZLbM9XvS7Tlrsdp/K7lzzJzpxnuqe
 fRSh9JWq1aioShoFuaNeAFRMa65z4Sr/NXiaysnpdFmXgj3W5nRlN7kfW
 WL79HEUi4rRlqPJiZW/qFCcYcCqwXtN2KCdt1kHeWu9eJXmIG5vZDQh5D
 F9yDcmrfNqDgj2D+eMjx5IvPjvRivg/y/77RE5JCkWGkbT5XAEnYfyVWZ
 N6DwfYnrL14T+71fyLmbkKbhJazPvy0OaYHvenE3GZUlp5UdPRy+rvcdu g==;
X-CSE-ConnectionGUID: CnbXn2YVT2GjgrcPx4jDkw==
X-CSE-MsgGUID: XPMDvfnXTdq6w69VroO7MA==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="100133460"
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; d="scan'208";a="100133460"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 14:33:57 -0700
X-CSE-ConnectionGUID: Tcli2WL2SF2D8kquWNXmAg==
X-CSE-MsgGUID: 35V7pcKJQFy9ZXaXzt6rkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; d="scan'208";a="275525662"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.16])
 by orviesa004.jf.intel.com with ESMTP; 10 Sep 2026 14:33:56 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v2 2/2] drm/xe: Poll GT for C6 before D3
Date: Thu, 10 Sep 2026 14:28:23 -0700
Message-Id: <20260910212823.2358362-2-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20260910212823.2358362-1-vinay.belgaumkar@intel.com>
References: <20260910212823.2358362-1-vinay.belgaumkar@intel.com>
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

Check if GTs are in C6 before transitioning to D3. PM subsystem can
retry if this is not the case. This ensures some component is not
accessing the GT when D3 state is forced. This check can be added
to the runtime idle check since it helps to check for pending
forcewakes as well before we poll for GT C6.

v2: Force resume when we cancel suspend due to C6 check (Sashiko)

Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_idle.c | 37 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_idle.h |  1 +
 drivers/gpu/drm/xe/xe_pci.c     |  9 ++++++++
 drivers/gpu/drm/xe/xe_pm.c      |  4 ++++
 4 files changed, 51 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
index c208d7563e36..e077f9a13473 100644
--- a/drivers/gpu/drm/xe/xe_gt_idle.c
+++ b/drivers/gpu/drm/xe/xe_gt_idle.c
@@ -8,10 +8,12 @@
 #include <drm/drm_managed.h>
 
 #include <generated/xe_wa_oob.h>
+#include <linux/iopoll.h>
 #include "xe_force_wake.h"
 #include "xe_device.h"
 #include "xe_gt.h"
 #include "xe_gt_idle.h"
+#include "xe_gt_printk.h"
 #include "xe_gt_sysfs.h"
 #include "xe_guc_pc.h"
 #include "regs/xe_gt_regs.h"
@@ -451,3 +453,38 @@ int xe_gt_idle_disable_c6(struct xe_gt *gt)
 
 	return 0;
 }
+
+static int wait_for_gt_c6_state(struct xe_gt *gt,
+				u16 timeout_ms)
+{
+	struct xe_guc_pc *pc = &gt->uc.guc.pc;
+	enum xe_gt_idle_state state;
+
+	return poll_timeout_us(state = gt->gtidle.idle_status(pc),
+			       state == GT_IDLE_C6,
+			       20,
+			       timeout_ms * USEC_PER_MSEC,
+			       false);
+}
+
+/**
+ * xe_gt_idle_wait_for_c6 - Poll for GT C6
+ * @gt: GT object
+ * @timeout_ms: wait time in ms
+ *
+ * This function polls for GT C6 state
+ *
+ * Return: 0 on success, -EAGAIN otherwise
+ */
+int xe_gt_idle_wait_for_c6(struct xe_gt *gt, u16 timeout_ms)
+{
+	if (IS_SRIOV_VF(gt_to_xe(gt)))
+		return 0;
+
+	if (wait_for_gt_c6_state(gt, timeout_ms)) {
+		xe_gt_dbg(gt, "GT is not in C6\n");
+		return -EAGAIN;
+	}
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/xe/xe_gt_idle.h b/drivers/gpu/drm/xe/xe_gt_idle.h
index 9c34a155e102..74d6bd167fab 100644
--- a/drivers/gpu/drm/xe/xe_gt_idle.h
+++ b/drivers/gpu/drm/xe/xe_gt_idle.h
@@ -18,5 +18,6 @@ void xe_gt_idle_enable_pg(struct xe_gt *gt);
 void xe_gt_idle_disable_pg(struct xe_gt *gt);
 int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p);
 u64 xe_gt_idle_residency_msec(struct xe_gt_idle *gtidle);
+int xe_gt_idle_wait_for_c6(struct xe_gt *gt, u16 timeout_ms);
 
 #endif /* _XE_GT_IDLE_H_ */
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index a79d928ad75a..ca7898cce2aa 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -1343,6 +1343,15 @@ static int xe_pci_suspend(struct device *dev)
 	 */
 	d3cold_toggle(pdev, D3COLD_ENABLE);
 
+	err = xe_pm_check_runtime_idle(xe);
+	if (err) {
+		err = xe_pm_runtime_resume(xe);
+		if (err) {
+			drm_err(&xe->drm, "Resume failed after suspend was canceled");
+			return err;
+		}
+	}
+
 	pci_save_state(pdev);
 	pci_disable_device(pdev);
 	pci_set_power_state(pdev, PCI_D3cold);
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index e8d4cdbaef88..04529a242998 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -1046,6 +1046,10 @@ int xe_pm_check_runtime_idle(struct xe_device *xe)
 		if (xe_force_wake_any_bit_set(gt_to_fw(gt), XE_FW_DOMAIN_ID_GT))
 			return -EBUSY;
 
+	for_each_gt(gt, xe, id)
+		if (xe_gt_idle_wait_for_c6(gt, 200))
+			return -EAGAIN;
+
 	return 0;
 }
 
-- 
2.38.1

