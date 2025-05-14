Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53468C3ABDA
	for <intel-xe@archiver.kernel.org>; Wed, 14 May 2025 08:12:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E1D110E27C;
	Wed, 14 May 2025 08:12:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JN+xWI3g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AC7710E27C
 for <intel-xe@lists.freedesktop.org>; Wed, 14 May 2025 08:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747210354; x=1778746354;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SqHlHiVKY32RCkHg1KBX4eBVIPQulAIkcHTdhkrrRQ4=;
 b=JN+xWI3gzkcBCgYqZBjChttZaLAHiVdQIcFnAOsaiw1/EapmGyLjfr1o
 JM2s3gSNVlTyatMeMkQY8UP/3tNwEQxYbbpFlYsuLHSSNoC4b/ovnM+t2
 5ZU0RB/r8o5yZW7phO0xtplBa9laCWqjuE4Z2ojLtO6AfGJ96hFxyzd96
 M4V8cMlaEWjPabieRid/H5JMegTCv7Fm+s4RqlI05/79dGARtZeA9Tewt
 +rMTT49kjSRChYlts98DjYfWQHSUIGgcAJgAL8/eFaJYCTawBl7Z8usQd
 4LZRV5mgfjqfr/NeWHSfymRzvJbZXauiAAjXmpsaj59Drd/2h00QU/aet w==;
X-CSE-ConnectionGUID: EXGCRr6bS567Whp0zs+Evg==
X-CSE-MsgGUID: 6XdO5swiTdWMYVbbFS2IyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="48344110"
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; d="scan'208";a="48344110"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 01:12:25 -0700
X-CSE-ConnectionGUID: xFgRc2v2SLK6ECPi0Jr8Gw==
X-CSE-MsgGUID: kbgCqArrQ7C7GkkXXZbIwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; d="scan'208";a="137841735"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 01:12:22 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, karthik.poosa@intel.com
Cc: lucas.demarchi@intel.com, soham.purkait@intel.com,
 ashutosh.dixit@intel.com, riana.tauro@intel.com
Subject: [PATCH 4/4] drm/xe/xe_debugfs: Exposure of Mods residency counter
Date: Wed, 14 May 2025 13:37:21 +0530
Message-Id: <20250514080721.265515-5-soham.purkait@intel.com>
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

Add a debugfs node named mods_residency in order to obtain the ModS
residency counter value.

Signed-off-by: Soham Purkait <soham.purkait@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c | 34 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_debugfs.h |  1 +
 2 files changed, 35 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 66eab5528b92..240cb73800ae 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -238,6 +238,32 @@ static ssize_t g10_residency_show(struct file *f, char __user *ubuf,
 	return simple_read_from_buffer(ubuf, size, pos, buf, len);
 }
 
+static ssize_t mods_residency_show(struct file *f, char __user *ubuf,
+				   size_t size, loff_t *pos)
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
+				xe_mmio_read32(mmio, PUNIT_TELEMETRY_GUID),
+				&reg_val,
+				BMG_MODS_RESIDENCY_OFFSET,
+				sizeof(reg_val));
+
+	drm_warn(&xe->drm, "ModS Residency read from mbx 0x%016llx, ret %d\n",
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
@@ -254,6 +280,11 @@ static const struct file_operations g10_residency_fops = {
 	.read = g10_residency_show,
 };
 
+static const struct file_operations mods_residency_fops = {
+	.owner = THIS_MODULE,
+	.read = mods_residency_show,
+};
+
 void xe_debugfs_register(struct xe_device *xe)
 {
 	struct ttm_device *bdev = &xe->ttm;
@@ -279,6 +310,9 @@ void xe_debugfs_register(struct xe_device *xe)
 
 	debugfs_create_file("g10_residency", 0444, root, xe,
 			    &g10_residency_fops);
+
+	debugfs_create_file("mods_residency", 0444, root, xe,
+			    &mods_residency_fops);
     
 	for (mem_type = XE_PL_VRAM0; mem_type <= XE_PL_VRAM1; ++mem_type) {
 		man = ttm_manager_type(bdev, mem_type);
diff --git a/drivers/gpu/drm/xe/xe_debugfs.h b/drivers/gpu/drm/xe/xe_debugfs.h
index 27fbb8d46471..55ef13662fec 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.h
+++ b/drivers/gpu/drm/xe/xe_debugfs.h
@@ -10,6 +10,7 @@ struct xe_device;
 
 #define BMG_G8_RESIDENCY_OFFSET			(0x540)
 #define BMG_G10_RESIDENCY_OFFSET		(0x548)
+#define BMG_MODS_RESIDENCY_OFFSET		(0x4D0)
 
 #ifdef CONFIG_DEBUG_FS
 void xe_debugfs_register(struct xe_device *xe);
-- 
2.34.1

