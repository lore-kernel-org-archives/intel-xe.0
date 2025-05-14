Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAFB7C3ABDA
	for <intel-xe@archiver.kernel.org>; Wed, 14 May 2025 08:12:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8597610E241;
	Wed, 14 May 2025 08:12:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F1N6YqrI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6800310E241
 for <intel-xe@lists.freedesktop.org>; Wed, 14 May 2025 08:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747210343; x=1778746343;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DRaqupnXLwnSG4Iwezp4BbiD40husL6ZnnhDvdznxgk=;
 b=F1N6YqrIK+TaGJrsXCHHlze95Irbe1nYtjQgkUPE0+qADYxRG9p4UViF
 SP3gsWUBjFIPGVlHhWVcjbPAgAWdDQP/26G9oMecJFinSICZ9pE06gnL6
 SPgqPsGVcAINPNSPnqcdQuz+wbgrCQa+3LVyZi9jHn/xl/9gNiWLYefc6
 Qv1oGLb3xt6VZgxOK1jZZGewTiyBvnPjWzuZYBe4N1by3hq8O6R1L3Xbv
 aj4duzHYmC7IX3F45KMGFNyshrgPekxHQUmy7OUsQ5b+xyvjxUJ8nJOle
 pJtgRDRmXCBKQgYZz/8TRLb5n4Isxw097i3Mg7dIY9USvi6HS5xhMlxKF A==;
X-CSE-ConnectionGUID: KCUAKg7eQtiGSaQczv5e5w==
X-CSE-MsgGUID: FiHCKjlJRq+07Zz896ZhmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="48344097"
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; d="scan'208";a="48344097"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 01:12:23 -0700
X-CSE-ConnectionGUID: rj+46DSURe23g99weEmXHg==
X-CSE-MsgGUID: RA0J76W+Qf6OCGFo8Hc7Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; d="scan'208";a="137841717"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 01:12:20 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, karthik.poosa@intel.com
Cc: lucas.demarchi@intel.com, soham.purkait@intel.com,
 ashutosh.dixit@intel.com, riana.tauro@intel.com
Subject: [PATCH 3/4] drm/xe/xe_debugfs: Exposure of G10 residency counter
Date: Wed, 14 May 2025 13:37:20 +0530
Message-Id: <20250514080721.265515-4-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250514080721.265515-1-soham.purkait@intel.com>
References: <20250514080721.265515-1-soham.purkait@intel.com>
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

Add a debugfs node named g10_residency in order to obtain the G10
residency counter value.

Signed-off-by: Soham Purkait <soham.purkait@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c | 32 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_debugfs.h |  1 +
 2 files changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index f9ab6a03af29..66eab5528b92 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -214,6 +214,30 @@ static ssize_t g8_residency_show(struct file *f, char __user *ubuf,
 	return simple_read_from_buffer(ubuf, size, pos, buf, len);
 }
 
+static ssize_t g10_residency_show(struct file *f, char __user *ubuf,
+				  size_t size, loff_t *pos)
+{
+	u64 reg_val;
+	char buf[32];
+	int len = 0;
+	int ret = 0;
+	struct xe_device *xe;
+	struct xe_mmio *mmio;
+
+	xe = file_inode(f)->i_private;
+	mmio = xe_root_tile_mmio(xe);
+	ret = xe_pmt_telem_read(to_pci_dev(xe->drm.dev),
+				xe_mmio_read32(mmio, PUNIT_TELEMETRY_GUID), &reg_val, BMG_G10_RESIDENCY_OFFSET,
+				sizeof(reg_val));
+
+	drm_warn(&xe->drm, "G10 Residency read from mbx 0x%016llx, ret %d\n",
+		 reg_val, ret);
+
+	len = scnprintf(buf, sizeof(buf), "%llu\n", reg_val);
+
+	return simple_read_from_buffer(ubuf, size, pos, buf, len);
+}
+
 static const struct file_operations wedged_mode_fops = {
 	.owner = THIS_MODULE,
 	.read = wedged_mode_show,
@@ -225,6 +249,11 @@ static const struct file_operations g8_residency_fops = {
 	.read = g8_residency_show,
 };
 
+static const struct file_operations g10_residency_fops = {
+	.owner = THIS_MODULE,
+	.read = g10_residency_show,
+};
+
 void xe_debugfs_register(struct xe_device *xe)
 {
 	struct ttm_device *bdev = &xe->ttm;
@@ -248,6 +277,9 @@ void xe_debugfs_register(struct xe_device *xe)
 	debugfs_create_file("g8_residency", 0444, root, xe,
 			    &g8_residency_fops);
 
+	debugfs_create_file("g10_residency", 0444, root, xe,
+			    &g10_residency_fops);
+    
 	for (mem_type = XE_PL_VRAM0; mem_type <= XE_PL_VRAM1; ++mem_type) {
 		man = ttm_manager_type(bdev, mem_type);
 
diff --git a/drivers/gpu/drm/xe/xe_debugfs.h b/drivers/gpu/drm/xe/xe_debugfs.h
index 86868a3cd379..27fbb8d46471 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.h
+++ b/drivers/gpu/drm/xe/xe_debugfs.h
@@ -9,6 +9,7 @@
 struct xe_device;
 
 #define BMG_G8_RESIDENCY_OFFSET			(0x540)
+#define BMG_G10_RESIDENCY_OFFSET		(0x548)
 
 #ifdef CONFIG_DEBUG_FS
 void xe_debugfs_register(struct xe_device *xe);
-- 
2.34.1

