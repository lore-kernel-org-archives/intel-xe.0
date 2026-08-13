Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 348B1C5CFCF
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 00:07:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA0E410E480;
	Thu, 13 Aug 2026 00:06:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kp08kZ2X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C7DF10E488
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Aug 2026 00:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786579619; x=1818115619;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HMIe1Rmi/E6gUij36cO23Rj1uPn6s4tz/1mSPX6GwfE=;
 b=Kp08kZ2XHxI84W2t4kQMjmt5rOYvIss9D3h5A8sp1GxQVBoP8sJQl+DE
 hoywUdwg5Au2UMwICZskOP8DJOVd52ErPwGo3BwFwiHOzgBMx3BNQBguX
 Mopo9wYglw7ht2S3RpxV5hn1RVMqcgTAnUBiofJd63dziFSvj7uv2tt+Z
 tXTACj+dTicrHoEdpKv+3VxpRGzO8e5JPM1vOAkcKmpJrISKu8RM3OGDY
 PPRPIkTQH+nnbxemCBVYhspdSLaK1JHMNScPtpdjGPnj0hm4pK37XWEof
 NxIQlpb5kpfxj9FEoXpYjE/9m2LYYh7rkkSQU0CISJ9IiwR3oxmzW2azv w==;
X-CSE-ConnectionGUID: RB5O9CbETCWrCEyZ9MA4JQ==
X-CSE-MsgGUID: /AzRpdp1TzmVN2eUtq6tUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="89670929"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; d="scan'208";a="89670929"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 17:06:58 -0700
X-CSE-ConnectionGUID: YkxZO7VOT5mZtsn2cOYALA==
X-CSE-MsgGUID: SIGs56y/RvqrqvYGpHld6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; d="scan'208";a="302048061"
Received: from dut4072bmgfrd.fm.intel.com ([10.105.8.119])
 by orviesa001.jf.intel.com with ESMTP; 12 Aug 2026 17:06:58 -0700
From: Zongyao Bai <zongyao.bai@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jia.yao@intel.com, matthew.brost@intel.com,
 Zongyao Bai <zongyao.bai@intel.com>
Subject: [PATCH v5 1/4] drm/xe/forcewake: synchronize engine-cycle access with
 unplug
Date: Thu, 13 Aug 2026 00:06:51 +0000
Message-ID: <20260813000654.2712317-2-zongyao.bai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260813000654.2712317-1-zongyao.bai@intel.com>
References: <20260601213804.707256-1-zongyao.bai@intel.com>
 <20260813000654.2712317-1-zongyao.bai@intel.com>
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

Prepare engine-cycle queries for delayed forcewake release by
protecting their forcewake and MMIO section with drm_dev_enter(). This
lets unplug wait for admitted queries before flushing delayed-release
timers.

Use drm_dev_unplug() on post-registration probe failure to provide the
same synchronization before teardown.

Assisted-by: GitHub-Copilot:gpt-5.6-sol
Signed-off-by: Zongyao Bai <zongyao.bai@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c |  2 +-
 drivers/gpu/drm/xe/xe_query.c  | 34 ++++++++++++++++++++++++++--------
 2 files changed, 27 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 71111ad32465..81b31325e581 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1166,7 +1166,7 @@ int xe_device_probe(struct xe_device *xe)
 
 err_unregister_display:
 	xe_display_unregister(xe);
-	drm_dev_unregister(&xe->drm);
+	drm_dev_unplug(&xe->drm);
 
 	return err;
 }
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index dc975f595368..3c356bc48e2a 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -8,6 +8,7 @@
 #include <linux/nospec.h>
 #include <linux/sched/clock.h>
 
+#include <drm/drm_drv.h>
 #include <drm/ttm/ttm_placement.h>
 #include <generated/xe_wa_oob.h>
 #include <uapi/drm/xe_drm.h>
@@ -123,6 +124,7 @@ query_engine_cycles(struct xe_device *xe,
 	__ktime_func_t cpu_clock;
 	struct xe_hw_engine *hwe;
 	struct xe_gt *gt;
+	int dev_idx, err = 0;
 
 	if (IS_SRIOV_VF(xe))
 		return -EOPNOTSUPP;
@@ -143,28 +145,44 @@ query_engine_cycles(struct xe_device *xe,
 		return -EINVAL;
 
 	eci = &resp.eci;
+	if (!drm_dev_enter(&xe->drm, &dev_idx))
+		return -ENODEV;
+
 	gt = xe_device_get_gt(xe, eci->gt_id);
-	if (!gt)
-		return -EINVAL;
+	if (!gt) {
+		err = -EINVAL;
+		goto out;
+	}
 
-	if (eci->engine_class >= ARRAY_SIZE(user_to_xe_engine_class))
-		return -EINVAL;
+	if (eci->engine_class >= ARRAY_SIZE(user_to_xe_engine_class)) {
+		err = -EINVAL;
+		goto out;
+	}
 
 	hwe = xe_gt_hw_engine(gt, user_to_xe_engine_class[eci->engine_class],
 			      eci->engine_instance, true);
-	if (!hwe)
-		return -EINVAL;
+	if (!hwe) {
+		err = -EINVAL;
+		goto out;
+	}
 
 	fw_domain = xe_hw_engine_to_fw_domain(hwe);
 
 	xe_with_force_wake(fw_ref, gt_to_fw(gt), fw_domain) {
-		if (!xe_force_wake_ref_has_domain(fw_ref.domains, fw_domain))
-			return -EIO;
+		if (!xe_force_wake_ref_has_domain(fw_ref.domains, fw_domain)) {
+			err = -EIO;
+			goto out;
+		}
 
 		hwe_read_timestamp(hwe, &resp.engine_cycles, &resp.cpu_timestamp,
 				   &resp.cpu_delta, cpu_clock);
 	}
 
+out:
+	drm_dev_exit(dev_idx);
+	if (err)
+		return err;
+
 	if (GRAPHICS_VER(xe) >= 20)
 		resp.width = 64;
 	else
-- 
2.43.0

