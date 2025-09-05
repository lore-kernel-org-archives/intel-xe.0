Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2539CA0FED
	for <intel-xe@archiver.kernel.org>; Fri,  5 Sep 2025 21:38:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 887F410E364;
	Fri,  5 Sep 2025 21:38:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fx8RaDhw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0C7710E364
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Sep 2025 21:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757108281; x=1788644281;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=h459WXBb44ArR7mc5EKKyZDF6BrgrK8sTcI3Mm97iV4=;
 b=Fx8RaDhwUXDO7Ov2s1DosZpwfumOd11l65p1ukxJGh9Un4S23O2t165m
 FkXqvyQpBdCqqNnzoNiHFoQqNHC+BRsYrsLTgdEg6ywvRVXQjJ4OpkZ35
 p+9n6aH54y9chR7P3MIfcDIsmJmiqFXcdebWi91pv+56ajNp440Qs92YK
 6E0t07tuCYqR4zjgxrTb9keEaP4Cp5MQIxNu5zNQUsoq6sWhboNMcuO4D
 0iuJTmgBX3d8DrCgeZcb/G5+kRz/lAwj0kKADZXPx1oTQPB3IIkLZ+t7Q
 d9wd9NWDMpRxaxL+9eF1OjvuRJCPWKoGZS81690yMy+hOoCTmKkk7tMGo A==;
X-CSE-ConnectionGUID: MregfzhVQEmdN4/7rUNvYA==
X-CSE-MsgGUID: 7F1EHOgTQRW3uiGkdLULPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11544"; a="62094550"
X-IronPort-AV: E=Sophos;i="6.18,242,1751266800"; d="scan'208";a="62094550"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 14:38:01 -0700
X-CSE-ConnectionGUID: Ol4r2x27Qnm0E9srszzjLQ==
X-CSE-MsgGUID: OSRrmGX3QbyBGLxCq2O1MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,242,1751266800"; d="scan'208";a="195920387"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by fmviesa002.fm.intel.com with ESMTP; 05 Sep 2025 14:38:00 -0700
From: Zongyao Bai <zongyao.bai@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: shuicheng.lin@intel.com,
	Zongyao Bai <zongyao.bai@intel.com>
Subject: [PATCH] drm/xe/xe_device_sysfs: add cleanup action in
 xe_device_sysfs_init
Date: Sat,  6 Sep 2025 05:37:38 +0800
Message-Id: <20250905213738.2936785-1-zongyao.bai@intel.com>
X-Mailer: git-send-email 2.34.1
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

xe_device_sysfs_fini(): switch the order of late_bind_remove_files
and sysfs_remove_files to follow the rule that files create latest
deleted first.(LIFO)

xe_device_sysfs_init(): on partial failure, any sysfs files created
before the failure will be cleaned up via xe_device_sysfs_fini,
ensuring no leaked sysfs entries
Add function description comments for xe_device_sysfs_init().

Fixes: 0e414bf7ad01 ("drm/xe: Expose PCIe link downgrade attributes")
Signed-off-by: Zongyao Bai <zongyao.bai@intel.com>
---
 drivers/gpu/drm/xe/xe_device_sysfs.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
index 6ee422594b56..27b6d90a0009 100644
--- a/drivers/gpu/drm/xe/xe_device_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
@@ -292,11 +292,23 @@ static void xe_device_sysfs_fini(void *arg)
 		sysfs_remove_file(&xe->drm.dev->kobj, &dev_attr_vram_d3cold_threshold.attr);
 
 	if (xe->info.platform == XE_BATTLEMAGE) {
-		sysfs_remove_files(&xe->drm.dev->kobj, auto_link_downgrade_attrs);
 		late_bind_remove_files(xe->drm.dev);
+		sysfs_remove_files(&xe->drm.dev->kobj, auto_link_downgrade_attrs);
 	}
 }
 
+/**
+ * xe_device_sysfs_init - Initialize sysfs attributes for the Xe device
+ * @xe: Pointer to the Xe device structure
+ *
+ * Creates and registers sysfs attributes for device-specific controls and status,
+ * including VRAM D3cold threshold and PCIe link downgrade capabilities, depending
+ * on device capabilities and platform type.
+ *
+ * On partial failure, any sysfs files created before the failure will be cleaned up
+ * via xe_device_sysfs_fini.
+ */
+
 int xe_device_sysfs_init(struct xe_device *xe)
 {
 	struct device *dev = xe->drm.dev;
@@ -310,12 +322,16 @@ int xe_device_sysfs_init(struct xe_device *xe)
 
 	if (xe->info.platform == XE_BATTLEMAGE) {
 		ret = sysfs_create_files(&dev->kobj, auto_link_downgrade_attrs);
-		if (ret)
+		if (ret) {
+			xe_device_sysfs_fini(xe);
 			return ret;
+		}
 
 		ret = late_bind_create_files(dev);
-		if (ret)
+		if (ret) {
+			xe_device_sysfs_fini(xe);
 			return ret;
+		}
 	}
 
 	return devm_add_action_or_reset(dev, xe_device_sysfs_fini, xe);
-- 
2.34.1

