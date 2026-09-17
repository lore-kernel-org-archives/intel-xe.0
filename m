Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9134CC982CF
	for <intel-xe@archiver.kernel.org>; Thu, 17 Sep 2026 00:07:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AC0610E370;
	Thu, 17 Sep 2026 00:07:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vmnh7wVl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9292810E370
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Sep 2026 00:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789603625; x=1821139625;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DQx+wdGsgT2Q5RuKtxem5dCxd5jDNNHAF5VRkn/G6Fw=;
 b=Vmnh7wVlzXd0thcXteGuyD4RWxAWgpkXVSCbSSrCWVy6XLAqa8RhvNUT
 QQ+cYcAQY5v9nA6eEiSmkae+GZE/wK/VbXgEGy18dHzD+nqO/bEAU31E5
 QlT0BkT4yLq2N0P5Qmq/RjtFNhfsGEmz96+vKxCiNdUUaMMfgCA0SljhL
 7GYPScmS+mhdDW4LRdcpUcQjiXVoRs83L+BX+2SQS2oQGX85vYVSQFbGx
 USQVjvm8IGVtYUOMPb8rEh141EtXYH0GZg7uRqwqhFUORCrx+x2pzj6rm
 ioy+fwwTYWlSJqzsL+Sq46CAs3T+Q36ebCVki9UkLopFGJV9Zth1yh9qR w==;
X-CSE-ConnectionGUID: k5iZzaX2TOeNmuTiUSOLgA==
X-CSE-MsgGUID: 4PlrC9ClQEi0dCo8GMDiMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="101143920"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="101143920"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 17:07:04 -0700
X-CSE-ConnectionGUID: 7+ZtzKIUTwKLpwrULyJ0Yw==
X-CSE-MsgGUID: mubmCZagQnGVTjehhLz1CA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="267280397"
Received: from dut4072bmgfrd.fm.intel.com ([10.105.8.119])
 by fmviesa009.fm.intel.com with ESMTP; 16 Sep 2026 17:07:03 -0700
From: Zongyao Bai <zongyao.bai@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jia.yao@intel.com,
	Zongyao Bai <zongyao.bai@intel.com>
Subject: [PATCH v6 1/4] drm/xe/forcewake: synchronize engine-cycle access with
 unplug
Date: Thu, 17 Sep 2026 00:06:58 +0000
Message-ID: <20260917000701.1751733-2-zongyao.bai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260917000701.1751733-1-zongyao.bai@intel.com>
References: <20260720221306.1173028-1-zongyao.bai@intel.com>
 <20260917000701.1751733-1-zongyao.bai@intel.com>
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

Engine-cycle queries access engine registers under forcewake. Move engine
lookup and forcewake-protected MMIO access into query_engine_cycles_read(),
enclosed by drm_dev_enter()/drm_dev_exit(). This makes drm_dev_unplug()
wait for admitted queries to drop their forcewake references before
teardown.

Use drm_dev_unplug() instead of drm_dev_unregister() on post-registration
probe failure to provide the same synchronization.

Assisted-by: LLM
Signed-off-by: Zongyao Bai <zongyao.bai@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c |  2 +-
 drivers/gpu/drm/xe/xe_query.c  | 81 +++++++++++++++++++++++-----------
 2 files changed, 56 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 205cb4e7f9e8..5e6dd4a97dc8 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1093,7 +1093,7 @@ int xe_device_probe(struct xe_device *xe)
 
 err_unregister_display:
 	xe_display_unregister(xe);
-	drm_dev_unregister(&xe->drm);
+	drm_dev_unplug(&xe->drm);
 
 	return err;
 }
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index dc975f595368..2ebf0893b4f5 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -8,6 +8,7 @@
 #include <linux/nospec.h>
 #include <linux/sched/clock.h>
 
+#include <drm/drm_drv.h>
 #include <drm/ttm/ttm_placement.h>
 #include <generated/xe_wa_oob.h>
 #include <uapi/drm/xe_drm.h>
@@ -111,18 +112,65 @@ hwe_read_timestamp(struct xe_hw_engine *hwe, u64 *engine_ts, u64 *cpu_ts,
 	*engine_ts = (u64)upper << 32 | lower;
 }
 
+/*
+ * Keep the forcewake scope inside the drm_dev_enter()/drm_dev_exit() section:
+ * drm_dev_unplug() must wait for forcewake release before teardown.
+ */
+static int query_engine_cycles_read(struct xe_device *xe,
+				    struct drm_xe_query_engine_cycles *resp,
+				    __ktime_func_t cpu_clock)
+{
+	struct drm_xe_engine_class_instance *eci = &resp->eci;
+	enum xe_force_wake_domains fw_domain;
+	struct xe_hw_engine *hwe;
+	struct xe_gt *gt;
+	int dev_idx, ret = 0;
+
+	if (!drm_dev_enter(&xe->drm, &dev_idx))
+		return -ENODEV;
+
+	gt = xe_device_get_gt(xe, eci->gt_id);
+	if (!gt) {
+		drm_dev_exit(dev_idx);
+		return -EINVAL;
+	}
+
+	if (eci->engine_class >= ARRAY_SIZE(user_to_xe_engine_class)) {
+		drm_dev_exit(dev_idx);
+		return -EINVAL;
+	}
+
+	hwe = xe_gt_hw_engine(gt, user_to_xe_engine_class[eci->engine_class],
+			      eci->engine_instance, true);
+	if (!hwe) {
+		drm_dev_exit(dev_idx);
+		return -EINVAL;
+	}
+
+	fw_domain = xe_hw_engine_to_fw_domain(hwe);
+
+	xe_with_force_wake(fw_ref, gt_to_fw(gt), fw_domain) {
+		if (xe_force_wake_ref_has_domain(fw_ref.domains, fw_domain))
+			hwe_read_timestamp(hwe, &resp->engine_cycles,
+					   &resp->cpu_timestamp,
+					   &resp->cpu_delta, cpu_clock);
+		else
+			ret = -EIO;
+	}
+
+	drm_dev_exit(dev_idx);
+	return ret;
+}
+
 static int
 query_engine_cycles(struct xe_device *xe,
 		    struct drm_xe_device_query *query)
 {
 	struct drm_xe_query_engine_cycles __user *query_ptr;
-	struct drm_xe_engine_class_instance *eci;
 	struct drm_xe_query_engine_cycles resp;
 	size_t size = sizeof(resp);
-	enum xe_force_wake_domains fw_domain;
 	__ktime_func_t cpu_clock;
-	struct xe_hw_engine *hwe;
-	struct xe_gt *gt;
+	int ret;
 
 	if (IS_SRIOV_VF(xe))
 		return -EOPNOTSUPP;
@@ -142,28 +190,9 @@ query_engine_cycles(struct xe_device *xe,
 	if (!cpu_clock)
 		return -EINVAL;
 
-	eci = &resp.eci;
-	gt = xe_device_get_gt(xe, eci->gt_id);
-	if (!gt)
-		return -EINVAL;
-
-	if (eci->engine_class >= ARRAY_SIZE(user_to_xe_engine_class))
-		return -EINVAL;
-
-	hwe = xe_gt_hw_engine(gt, user_to_xe_engine_class[eci->engine_class],
-			      eci->engine_instance, true);
-	if (!hwe)
-		return -EINVAL;
-
-	fw_domain = xe_hw_engine_to_fw_domain(hwe);
-
-	xe_with_force_wake(fw_ref, gt_to_fw(gt), fw_domain) {
-		if (!xe_force_wake_ref_has_domain(fw_ref.domains, fw_domain))
-			return -EIO;
-
-		hwe_read_timestamp(hwe, &resp.engine_cycles, &resp.cpu_timestamp,
-				   &resp.cpu_delta, cpu_clock);
-	}
+	ret = query_engine_cycles_read(xe, &resp, cpu_clock);
+	if (ret)
+		return ret;
 
 	if (GRAPHICS_VER(xe) >= 20)
 		resp.width = 64;
-- 
2.43.0

