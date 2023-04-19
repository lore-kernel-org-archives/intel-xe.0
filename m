Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92E3FC6FD18
	for <intel-xe@archiver.kernel.org>; Wed, 19 Apr 2023 09:09:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45C5610E8EE;
	Wed, 19 Apr 2023 09:09:22 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FAB510E8EE
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Apr 2023 09:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681895361; x=1713431361;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=P65AkI9A00sYHQPwpAt8bIveylmrYwBhURhNlGKuSp4=;
 b=KLT7LVAKjkWXG76Eb3qW+sqBeYyX/z/Wzj9pksGOSH6f1onEn/fqkUUj
 Tt384yxroYifo+SPKzVLUt+GUzCZjZ3dNxMJBR2GmeSW8J/hhJcQ2cTR1
 DgyrpIkLYLDUAGktVfEoyk8iHr6uCys/SPr/SDDO9F4K51vDJ5en41cEv
 8/rdCKyhWp/0HSsSf5pczxmk9D/xIr1WklBPvKikOAqXf6qUXfGhwkn8A
 z1dHeqr4JqozRdWrOrWeNhaIrerrK6dBI86WrndWnnukI1lrSIOSXlYWw
 UOuZBtpNUP5dJaRbgcHZ8gxudXpVayZpzJTF1jsfxPzG8AEmpdIU3iJmw w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="348149572"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="348149572"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 02:09:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="780794181"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="780794181"
Received: from rtauro-desk.iind.intel.com ([10.190.239.41])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 02:09:18 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 19 Apr 2023 14:39:33 +0530
Message-Id: <20230419090933.289818-1-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/guc_pc: Reorder forcewake and
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

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 5a8d827ba770..f71f6b3df38a 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -370,6 +370,7 @@ static ssize_t freq_act_show(struct device *dev,
 	u32 freq;
 	ssize_t ret;
 
+	xe_device_mem_access_get(gt_to_xe(gt));
 	/*
 	 * When in RC6, actual frequency is 0. Let's block RC6 so we are able
 	 * to verify that our freq requests are really happening.
@@ -378,8 +379,6 @@ static ssize_t freq_act_show(struct device *dev,
 	if (ret)
 		return ret;
 
-	xe_device_mem_access_get(gt_to_xe(gt));
-
 	if (xe->info.platform == XE_METEORLAKE) {
 		freq = xe_mmio_read32(gt, MTL_MIRROR_TARGET_WP1.reg);
 		freq = REG_FIELD_GET(MTL_CAGF_MASK, freq);
@@ -388,11 +387,10 @@ static ssize_t freq_act_show(struct device *dev,
 		freq = REG_FIELD_GET(GEN12_CAGF_MASK, freq);
 	}
 
-	xe_device_mem_access_put(gt_to_xe(gt));
-
 	ret = sysfs_emit(buf, "%d\n", decode_freq(freq));
 
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+	xe_device_mem_access_put(gt_to_xe(gt));
 	return ret;
 }
 static DEVICE_ATTR_RO(freq_act);
@@ -405,6 +403,7 @@ static ssize_t freq_cur_show(struct device *dev,
 	u32 freq;
 	ssize_t ret;
 
+	xe_device_mem_access_get(gt_to_xe(gt));
 	/*
 	 * GuC SLPC plays with cur freq request when GuCRC is enabled
 	 * Block RC6 for a more reliable read.
@@ -413,14 +412,13 @@ static ssize_t freq_cur_show(struct device *dev,
 	if (ret)
 		return ret;
 
-	xe_device_mem_access_get(gt_to_xe(gt));
 	freq = xe_mmio_read32(gt, GEN6_RPNSWREQ.reg);
-	xe_device_mem_access_put(gt_to_xe(gt));
 
 	freq = REG_FIELD_GET(REQ_RATIO_MASK, freq);
 	ret = sysfs_emit(buf, "%d\n", decode_freq(freq));
 
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+	xe_device_mem_access_put(gt_to_xe(gt));
 	return ret;
 }
 static DEVICE_ATTR_RO(freq_cur);
@@ -610,17 +608,16 @@ static ssize_t rc6_residency_show(struct device *dev,
 	u32 reg;
 	ssize_t ret;
 
+	xe_device_mem_access_get(pc_to_xe(pc));
 	ret = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	if (ret)
 		return ret;
 
-	xe_device_mem_access_get(pc_to_xe(pc));
 	reg = xe_mmio_read32(gt, GEN6_GT_GFX_RC6.reg);
-	xe_device_mem_access_put(pc_to_xe(pc));
-
 	ret = sysfs_emit(buff, "%u\n", reg);
 
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+	xe_device_mem_access_put(pc_to_xe(pc));
 	return ret;
 }
 static DEVICE_ATTR_RO(rc6_residency);
-- 
2.40.0

