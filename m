Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B046FCAC592
	for <intel-xe@archiver.kernel.org>; Mon, 15 Sep 2025 21:48:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FBA110E5B9;
	Mon, 15 Sep 2025 21:48:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IV+0+sjh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79CC910E5B9
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Sep 2025 21:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757972884; x=1789508884;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+TwDTi4GTy3AoCuslgzoTJnwXFVZfE7qX8DHIOd5j9c=;
 b=IV+0+sjhzpKEZS86SgYJNDj6Ype5a2gU6MCzfqDL1rbeMYrCUiTw7kuQ
 f/CviXTRIpvJZR3fkwRpHtFtdIS1qR1+gewy5JsT27GM4B+xdnleRLGHH
 ISwf9zUaSrJLKMVHmLpsK8C7M1nqtbacaCKvHJysNPswSEURiWOMBu8S/
 KVKgutDxW+7NkZJro/pqcNGQvVLfi9INYj/xjmVMxxz+e7SYW7fh9GAfn
 saZdj/sOqCQfYtCB26I0NoCdyQcWlEyBpuXkjdHB/OvQJIXrs5xTSicZf
 SOlbmzKYhUjJhgQYnH8Eh15OBjJjMPcPDAivbD6HE9Lnplcg/waJCwio6 w==;
X-CSE-ConnectionGUID: uyibq7gPQq6l/mdHRElyFQ==
X-CSE-MsgGUID: QQ+34h/7RKa3oxWG+tq3LQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="60388792"
X-IronPort-AV: E=Sophos;i="6.18,267,1751266800"; d="scan'208";a="60388792"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 14:48:04 -0700
X-CSE-ConnectionGUID: V/Fp2WEySxSfiE2jRqspHg==
X-CSE-MsgGUID: biQgb5tzQ1esnLmEPeRcJA==
X-ExtLoop1: 1
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by fmviesa003.fm.intel.com with ESMTP; 15 Sep 2025 14:48:02 -0700
From: Zongyao Bai <zongyao.bai@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zongyao Bai <zongyao.bai@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Stuart Summers <stuart.summers@intel.com>,
 Shuicheng Lin <shuicheng.lin@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v3 2/2] drm/xe/xe_device_sysfs: Remove sysfs unconditionally
 while clean sysfs entries
Date: Tue, 16 Sep 2025 05:47:16 +0800
Message-Id: <20250915214716.1327379-3-zongyao.bai@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250915214716.1327379-1-zongyao.bai@intel.com>
References: <20250910183233.3971054-1-zongyao.bai@intel.com>
 <20250915214716.1327379-1-zongyao.bai@intel.com>
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

xe_device_sysfs_fini() and late_bind_remove_files():
  Adjust the remove order of sysfs entries to follow LIFO.
  Remove configuration and status checking,
  call the sysfs removal unconditionally.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Stuart Summers <stuart.summers@intel.com>
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Zongyao Bai <zongyao.bai@intel.com>
---
 drivers/gpu/drm/xe/xe_device_sysfs.c | 32 ++++++----------------------
 1 file changed, 6 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
index e5e3c56ea53c..693bfda1cfa6 100644
--- a/drivers/gpu/drm/xe/xe_device_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
@@ -184,25 +184,8 @@ static int late_bind_create_files(struct device *dev)
 
 static void late_bind_remove_files(struct device *dev)
 {
-	struct xe_device *xe = pdev_to_xe_device(to_pci_dev(dev));
-	struct xe_tile *root = xe_device_get_root_tile(xe);
-	u32 cap = 0;
-	int ret;
-
-	xe_pm_runtime_get(xe);
-
-	ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_CAPABILITY_STATUS, 0),
-			    &cap, NULL);
-	if (ret)
-		goto out;
-
-	if (REG_FIELD_GET(V1_FAN_SUPPORTED, cap))
-		sysfs_remove_file(&dev->kobj, &dev_attr_lb_fan_control_version.attr);
-
-	if (REG_FIELD_GET(VR_PARAMS_SUPPORTED, cap))
-		sysfs_remove_file(&dev->kobj, &dev_attr_lb_voltage_regulator_version.attr);
-out:
-	xe_pm_runtime_put(xe);
+	sysfs_remove_file(&dev->kobj, &dev_attr_lb_voltage_regulator_version.attr);
+	sysfs_remove_file(&dev->kobj, &dev_attr_lb_fan_control_version.attr);
 }
 
 /**
@@ -287,14 +270,11 @@ static const struct attribute *auto_link_downgrade_attrs[] = {
 static void xe_device_sysfs_fini(void *arg)
 {
 	struct xe_device *xe = arg;
+	struct device *dev = xe->drm.dev;
 
-	if (xe->d3cold.capable)
-		sysfs_remove_file(&xe->drm.dev->kobj, &dev_attr_vram_d3cold_threshold.attr);
-
-	if (xe->info.platform == XE_BATTLEMAGE) {
-		sysfs_remove_files(&xe->drm.dev->kobj, auto_link_downgrade_attrs);
-		late_bind_remove_files(xe->drm.dev);
-	}
+    late_bind_remove_files(dev);
+    sysfs_remove_files(&dev->kobj, auto_link_downgrade_attrs);
+    sysfs_remove_file(&dev->kobj, &dev_attr_vram_d3cold_threshold.attr);
 }
 
 int xe_device_sysfs_init(struct xe_device *xe)
-- 
2.34.1

