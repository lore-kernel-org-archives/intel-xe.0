Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C596C77B72
	for <intel-xe@archiver.kernel.org>; Thu, 20 Apr 2023 05:56:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2A9410E258;
	Thu, 20 Apr 2023 05:56:30 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 392DD10E258
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Apr 2023 05:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681970188; x=1713506188;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GLE7xVYygs4GeuN/hpG7UQzhnssyO+zL8ldO57fxu0A=;
 b=GDnimc3Z4Q2OxYwausbKWG02FuYWYcwrxIAyDnX5fr+Mu+3ri2cjxGy+
 Eqp8E8PahbYCafnl14X1BJzHYRWIFd7fjefuLrnSrHYACRH/RQrTtdyXP
 LuOSkEAsoI1VGcHDCrCZ5x1+SjPnwIa4LtYiZOnvPo0VGDRlr+7UNYrGd
 iKOR3pxTugSCiiip9xQgVKn1MT5EKBGu2P0iPrRmh93bnwLLDzL2oqWX3
 +YJdxoBjmXPOvW7QRblk/Rwuq3nclc+Ssxb0YJ8xCYFieqKhY34lbGETQ
 OghLcElyFziymF8TlzpwWth7lLR8C1aPtMbNFvCP8RhZXKACRTMuypojV Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="329817650"
X-IronPort-AV: E=Sophos;i="5.99,211,1677571200"; d="scan'208";a="329817650"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 22:56:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="642020866"
X-IronPort-AV: E=Sophos;i="5.99,211,1677571200"; d="scan'208";a="642020866"
Received: from rtauro-desk.iind.intel.com ([10.190.239.41])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 22:56:24 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 20 Apr 2023 11:26:48 +0530
Message-Id: <20230420055648.323567-1-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2] drm/xe/guc_pc: Reorder forcewake and
 xe_pm_runtime calls
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
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

When the device is runtime suspended, reading some of the sysfs
entries under device/gt#/ causes a resume error
This is due to the ordering of pm_runtime and forcewake calls.
Reorder to wake up using xe_pm_runtime_get and then forcewake

v2: add goto statements (Rodrigo)

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 5a8d827ba770..b853831b342b 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -370,15 +370,14 @@ static ssize_t freq_act_show(struct device *dev,
 	u32 freq;
 	ssize_t ret;
 
+	xe_device_mem_access_get(gt_to_xe(gt));
 	/*
 	 * When in RC6, actual frequency is 0. Let's block RC6 so we are able
 	 * to verify that our freq requests are really happening.
 	 */
 	ret = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	if (ret)
-		return ret;
-
-	xe_device_mem_access_get(gt_to_xe(gt));
+		goto out;
 
 	if (xe->info.platform == XE_METEORLAKE) {
 		freq = xe_mmio_read32(gt, MTL_MIRROR_TARGET_WP1.reg);
@@ -388,11 +387,11 @@ static ssize_t freq_act_show(struct device *dev,
 		freq = REG_FIELD_GET(GEN12_CAGF_MASK, freq);
 	}
 
-	xe_device_mem_access_put(gt_to_xe(gt));
-
 	ret = sysfs_emit(buf, "%d\n", decode_freq(freq));
 
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+out:
+	xe_device_mem_access_put(gt_to_xe(gt));
 	return ret;
 }
 static DEVICE_ATTR_RO(freq_act);
@@ -405,22 +404,23 @@ static ssize_t freq_cur_show(struct device *dev,
 	u32 freq;
 	ssize_t ret;
 
+	xe_device_mem_access_get(gt_to_xe(gt));
 	/*
 	 * GuC SLPC plays with cur freq request when GuCRC is enabled
 	 * Block RC6 for a more reliable read.
 	 */
 	ret = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	if (ret)
-		return ret;
+		goto out;
 
-	xe_device_mem_access_get(gt_to_xe(gt));
 	freq = xe_mmio_read32(gt, GEN6_RPNSWREQ.reg);
-	xe_device_mem_access_put(gt_to_xe(gt));
 
 	freq = REG_FIELD_GET(REQ_RATIO_MASK, freq);
 	ret = sysfs_emit(buf, "%d\n", decode_freq(freq));
 
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+out:
+	xe_device_mem_access_put(gt_to_xe(gt));
 	return ret;
 }
 static DEVICE_ATTR_RO(freq_cur);
@@ -610,17 +610,17 @@ static ssize_t rc6_residency_show(struct device *dev,
 	u32 reg;
 	ssize_t ret;
 
+	xe_device_mem_access_get(pc_to_xe(pc));
 	ret = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	if (ret)
-		return ret;
+		goto out;
 
-	xe_device_mem_access_get(pc_to_xe(pc));
 	reg = xe_mmio_read32(gt, GEN6_GT_GFX_RC6.reg);
-	xe_device_mem_access_put(pc_to_xe(pc));
-
 	ret = sysfs_emit(buff, "%u\n", reg);
 
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+out:
+	xe_device_mem_access_put(pc_to_xe(pc));
 	return ret;
 }
 static DEVICE_ATTR_RO(rc6_residency);
-- 
2.40.0

