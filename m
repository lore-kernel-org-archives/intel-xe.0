Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56AC1C55174
	for <intel-xe@archiver.kernel.org>; Wed,  5 Aug 2026 10:13:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E821510EDC2;
	Wed,  5 Aug 2026 10:13:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OZ2PVG+y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70B4010EDC2
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Aug 2026 10:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785924788; x=1817460788;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iSbd7cDl7pLs/QxFi/f7TlAvKWEHm1sAkiE739O4r2g=;
 b=OZ2PVG+yKQG5jCrdpeuHrweODehCV6zxpk5J/GrffzlK4EhFn2b8rbpH
 v4ZEeRFBgyb0iXwAtlW3LkiPwZWCkQ1HmPanc9OHtyzIE+c+0Sc8F8rIP
 rSNym3FlzZZ/FCLwZFs13bECJziHXbDlz6lvpMA/S/cCZgeB7/LysmNpe
 wYNM/58nQ7h5/uY3kiZiZCaiu2p1VGyuoII7laWI8nlYMZCvpCpgTFoZZ
 E2bvH3ZqF7DO+HLQ/Docq9xUnMbDTNFuu59T2TZ7H8r/AfbZ87c1QEREJ
 4ol/mqlMZRL3x15PX9Owc9OiZtzsKgYPSCbdGlpyH8TmMZvf+gyivDOQE Q==;
X-CSE-ConnectionGUID: gsHt9vJCSx6RolSeI7GT8Q==
X-CSE-MsgGUID: 1HWGFLB2S9W6glE8RtC+nA==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="85619740"
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; d="scan'208";a="85619740"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2026 03:13:07 -0700
X-CSE-ConnectionGUID: WixlzjGwTw+Vzr3wkp2o9A==
X-CSE-MsgGUID: d+eTCsJHSPOVbQRAGgACJA==
X-ExtLoop1: 1
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2026 03:13:04 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 michael.j.ruhl@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH] drm/xe/xe_debugfs: Expose G-State and PCIe link state debugfs
 for CRI
Date: Wed,  5 Aug 2026 15:52:26 +0530
Message-Id: <20260805102226.1764-1-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
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

Expose G-State and PCIe link state through debugfs for CRI. The PMT
offsets for these metrics are identical to those used on BMG, so
remove the BMG_ prefix from the corresponding offset macros to make
them platform-agnostic.

Also enable these debugfs support on all dGPU platforms from BMG onward.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_pmt.h | 20 ++++++++++----------
 drivers/gpu/drm/xe/xe_debugfs.c  | 20 ++++++++++----------
 2 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_pmt.h b/drivers/gpu/drm/xe/regs/xe_pmt.h
index a62ab05c6b4c..54df1c8a9f8f 100644
--- a/drivers/gpu/drm/xe/regs/xe_pmt.h
+++ b/drivers/gpu/drm/xe/regs/xe_pmt.h
@@ -20,15 +20,15 @@
 #define BMG_TELEMETRY_BASE_OFFSET	0xE0000
 #define BMG_TELEMETRY_OFFSET		(SOC_BASE + BMG_TELEMETRY_BASE_OFFSET)
 
-#define BMG_MODS_RESIDENCY_OFFSET		(0x4D0)
-#define BMG_G2_RESIDENCY_OFFSET		(0x530)
-#define BMG_G6_RESIDENCY_OFFSET		(0x538)
-#define BMG_G7_RESIDENCY_OFFSET		(0x4B0)
-#define BMG_G8_RESIDENCY_OFFSET		(0x540)
-#define BMG_G10_RESIDENCY_OFFSET		(0x548)
-
-#define BMG_PCIE_LINK_L0_RESIDENCY_OFFSET	(0x570)
-#define BMG_PCIE_LINK_L1_RESIDENCY_OFFSET	(0x578)
-#define BMG_PCIE_LINK_L1_2_RESIDENCY_OFFSET	(0x580)
+#define MODS_RESIDENCY_OFFSET		(0x4D0)
+#define G2_RESIDENCY_OFFSET		(0x530)
+#define G6_RESIDENCY_OFFSET		(0x538)
+#define G7_RESIDENCY_OFFSET		(0x4B0)
+#define G8_RESIDENCY_OFFSET		(0x540)
+#define G10_RESIDENCY_OFFSET		(0x548)
+
+#define PCIE_LINK_L0_RESIDENCY_OFFSET	(0x570)
+#define PCIE_LINK_L1_RESIDENCY_OFFSET	(0x578)
+#define PCIE_LINK_L1_2_RESIDENCY_OFFSET	(0x580)
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 8de78cd0aa03..9cc104046756 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -241,12 +241,12 @@ static int dgfx_pkg_residencies_show(struct seq_file *m, void *data)
 		u32 offset;
 		const char *name;
 	} residencies[] = {
-		{BMG_G2_RESIDENCY_OFFSET, "Package G2"},
-		{BMG_G6_RESIDENCY_OFFSET, "Package G6"},
-		{BMG_G7_RESIDENCY_OFFSET, "Package G7"},
-		{BMG_G8_RESIDENCY_OFFSET, "Package G8"},
-		{BMG_G10_RESIDENCY_OFFSET, "Package G10"},
-		{BMG_MODS_RESIDENCY_OFFSET, "Package ModS"}
+		{G2_RESIDENCY_OFFSET, "Package G2"},
+		{G6_RESIDENCY_OFFSET, "Package G6"},
+		{G7_RESIDENCY_OFFSET, "Package G7"},
+		{G8_RESIDENCY_OFFSET, "Package G8"},
+		{G10_RESIDENCY_OFFSET, "Package G10"},
+		{MODS_RESIDENCY_OFFSET, "Package ModS"}
 	};
 
 	for (int i = 0; i < ARRAY_SIZE(residencies); i++)
@@ -270,9 +270,9 @@ static int dgfx_pcie_link_residencies_show(struct seq_file *m, void *data)
 		u32 offset;
 		const char *name;
 	} residencies[] = {
-		{BMG_PCIE_LINK_L0_RESIDENCY_OFFSET, "PCIE LINK L0 RESIDENCY"},
-		{BMG_PCIE_LINK_L1_RESIDENCY_OFFSET, "PCIE LINK L1 RESIDENCY"},
-		{BMG_PCIE_LINK_L1_2_RESIDENCY_OFFSET, "PCIE LINK L1.2 RESIDENCY"}
+		{PCIE_LINK_L0_RESIDENCY_OFFSET, "PCIE LINK L0 RESIDENCY"},
+		{PCIE_LINK_L1_RESIDENCY_OFFSET, "PCIE LINK L1 RESIDENCY"},
+		{PCIE_LINK_L1_2_RESIDENCY_OFFSET, "PCIE LINK L1.2 RESIDENCY"}
 	};
 
 	for (int i = 0; i < ARRAY_SIZE(residencies); i++)
@@ -695,7 +695,7 @@ void xe_debugfs_register(struct xe_device *xe)
 				 ARRAY_SIZE(debugfs_list),
 				 root, minor);
 
-	if (xe->info.platform == XE_BATTLEMAGE && !IS_SRIOV_VF(xe)) {
+	if (IS_DGFX(xe) && xe->info.platform >= XE_BATTLEMAGE && !IS_SRIOV_VF(xe)) {
 		drm_debugfs_create_files(debugfs_residencies,
 					 ARRAY_SIZE(debugfs_residencies),
 					 root, minor);
-- 
2.25.1

