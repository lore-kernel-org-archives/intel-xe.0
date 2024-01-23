Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83B28C47DDC
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jan 2024 20:45:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41F6A10E617;
	Tue, 23 Jan 2024 20:45:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D5DF10E3F2
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Jan 2024 20:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706042712; x=1737578712;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tXjG9y9Uq/N/rVXLdd7LJZg5AHNbxLUyOYstUlI3Ejs=;
 b=Ie/+nA+Ru8TMAtsY03o+TxrkkEeJrhZ1MB99RvJWXlU1ZPnRu2Mlh408
 4juXJVS+eVe3UbVdiMX7syaw/K5xiEJbhcDf9650SBL0Y/ninEopQe1Jd
 Px+//za+n535ARVpJPebO+0pxcfMlCMLJpahmPijuGCf7ZjMnNfLzjcvD
 kLeczXzu45Oj46sh0QZdUXn+5X7EibLFK77fealIybRMr5ZRWZ0qfms8M
 Fwf5ZjQTageDMW2hjrJg6ejfKQ405Xt9zLKbu2JZzzj4bVs6DxrGh8tHh
 yKRcDp620FLupNKvtEd/IjE9X7HmVLmeyfgL7FfMjhg8oReOKu82SH8aO A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="8319863"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; 
   d="scan'208";a="8319863"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 12:45:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="909421957"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; d="scan'208";a="909421957"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 12:45:09 -0800
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 5/9] drm/xe: Print more device information in devcoredump
Date: Tue, 23 Jan 2024 12:44:50 -0800
Message-ID: <20240123204454.246788-5-jose.souza@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240123204454.246788-1-jose.souza@intel.com>
References: <20240123204454.246788-1-jose.souza@intel.com>
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
Cc: Maarten Lankhorst <dev@lankhorst.se>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

To properly decode batch buffer Mesa tools needs to know what
platform is this one, for now we can do that with PCI id but
already making it future proof by also printing GTs GMD version.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Maarten Lankhorst <dev@lankhorst.se>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c |  2 ++
 drivers/gpu/drm/xe/xe_device.c      | 20 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_device.h      |  2 ++
 3 files changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index fd74dae292433..e701f0d07b676 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -63,6 +63,7 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 				   size_t count, void *data, size_t datalen)
 {
 	struct xe_devcoredump *coredump = data;
+	struct xe_device *xe = coredump_to_xe(coredump);
 	struct xe_devcoredump_snapshot *ss;
 	struct drm_printer p;
 	struct drm_print_iterator iter;
@@ -89,6 +90,7 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 	drm_printf(&p, "Snapshot time: %lld.%09ld\n", ts.tv_sec, ts.tv_nsec);
 	ts = ktime_to_timespec64(ss->boot_time);
 	drm_printf(&p, "Uptime: %lld.%09ld\n", ts.tv_sec, ts.tv_nsec);
+	xe_device_snapshot_print(xe, &p);
 
 	drm_printf(&p, "\n**** GuC CT ****\n");
 	xe_guc_ct_snapshot_print(coredump->snapshot.ct, &p);
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index ab417f4f7d2a7..6faa7865b1aab 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -727,3 +727,23 @@ void xe_device_mem_access_put(struct xe_device *xe)
 
 	xe_assert(xe, ref >= 0);
 }
+
+void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *p)
+{
+	struct xe_gt *gt;
+	u8 id;
+
+	drm_printf(p, "PCI ID: 0x%04x\n", xe->info.devid);
+	drm_printf(p, "PCI revision: 0x%02x\n", xe->info.revid);
+
+	for_each_gt(gt, xe, id) {
+		drm_printf(p, "GT id: %u\n", id);
+		drm_printf(p, "\tType: %s\n",
+			   gt->info.type == XE_GT_TYPE_MAIN ? "main" : "media");
+		drm_printf(p, "\tIP ver: %u.%u.%u\n",
+			   REG_FIELD_GET(GMD_ID_ARCH_MASK, gt->info.gmdid),
+			   REG_FIELD_GET(GMD_ID_RELEASE_MASK, gt->info.gmdid),
+			   REG_FIELD_GET(GMD_ID_REVID, gt->info.gmdid));
+		drm_printf(p, "\tCS reference clock: %u\n", gt->info.reference_clock);
+	}
+}
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index af8ac2e9e2709..270124da1e00e 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -175,4 +175,6 @@ static inline bool xe_device_has_memirq(struct xe_device *xe)
 
 u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size);
 
+void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *p);
+
 #endif
-- 
2.43.0

