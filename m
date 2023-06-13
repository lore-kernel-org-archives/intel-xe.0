Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D403EB64D8
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jun 2023 18:04:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FAB110E3D4;
	Tue, 13 Jun 2023 18:04:17 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7FDB10E3D4
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jun 2023 18:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686679454; x=1718215454;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sd5Ya5rn2aKMf5I0vT8SqDROKzr+eY7roFW2hzILsMk=;
 b=Lu/hdkC7ChQWt41rT3k4N8Ufi9C446vQDLgrISMXYNrGiQpK8ZrT9DRZ
 rfuDi+rTNxbQwIfmzTjSYPB6XsO/UGEZnyGLDRgpdBrRAhlLY941Y7FAM
 1/B3BDnUMgFiIvBXv4CfN8jLh64a8MuVH+b0P0Qm0a/C6JJAMqtwEAng7
 tCf4wigDZdD6uu46+sl7zAZgnCV3+NfvZsIOyEM4vJUB8v5vaMf3D8lT4
 mWDalQHL4IXTlYTsngWCCETMHj9Nh7NqJHMHJ+ynh/YrjQCRsiyUfi3iG
 n6V8RuBJKSJvq6aUAmfQR0gggk+XpKGsWMymYbOkAYBbEeyzdGv/+rXgY Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="422009680"
X-IronPort-AV: E=Sophos;i="6.00,240,1681196400"; d="scan'208";a="422009680"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2023 11:04:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="744775627"
X-IronPort-AV: E=Sophos;i="6.00,240,1681196400"; d="scan'208";a="744775627"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2023 11:04:13 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 13 Jun 2023 11:03:56 -0700
Message-Id: <20230613180356.2906441-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230613180356.2906441-1-lucas.demarchi@intel.com>
References: <20230613180356.2906441-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 2/2] drm/xe: Fix GMD_ID to revid
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

In order to calculate revid, let peek_gmdid() return the raw value of
the register, then calculate arch, release and rev. Also rename the
variables to make clear what are the as signed values.

While at it, add _MASK suffix to GMD_ID_REVID for consistency with the
other fields.

v2: Add _MASK suffix to GMD_ID_REVID (Gustavo)

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  2 +-
 drivers/gpu/drm/xe/xe_pci.c          | 29 +++++++++++++++-------------
 drivers/gpu/drm/xe/xe_pci_types.h    |  2 +-
 3 files changed, 18 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 0f920175526e..5b2ba95b0696 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -32,7 +32,7 @@
 #define GMD_ID					XE_REG(0xd8c)
 #define   GMD_ID_ARCH_MASK			REG_GENMASK(31, 22)
 #define   GMD_ID_RELEASE_MASK			REG_GENMASK(21, 14)
-#define   GMD_ID_REVID				REG_GENMASK(5, 0)
+#define   GMD_ID_REVID_MASK			REG_GENMASK(5, 0)
 
 #define FORCEWAKE_ACK_GT_MTL			XE_REG(0xdfc)
 
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index bd1f59b49928..c71d8f223d35 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -407,8 +407,7 @@ static u32 peek_gmdid(struct xe_device *xe, u32 gmdid_offset)
 	ver = ioread32(map);
 	pci_iounmap(pdev, map);
 
-	return REG_FIELD_GET(GMD_ID_ARCH_MASK, ver) * 100 +
-		REG_FIELD_GET(GMD_ID_RELEASE_MASK, ver);
+	return ver;
 }
 
 /*
@@ -442,13 +441,15 @@ static void handle_gmdid(struct xe_device *xe,
 			 u32 *graphics_revid,
 			 u32 *media_revid)
 {
-	u32 ver;
+	u32 verx100, gmdid;
 
-	ver = peek_gmdid(xe, GMD_ID.addr);
-	*graphics_revid = REG_FIELD_GET(GMD_ID_REVID, ver);
+	gmdid = peek_gmdid(xe, GMD_ID.addr);
+	verx100 = REG_FIELD_GET(GMD_ID_ARCH_MASK, gmdid) * 100 +
+		  REG_FIELD_GET(GMD_ID_RELEASE_MASK, gmdid);
+	*graphics_revid = REG_FIELD_GET(GMD_ID_REVID_MASK, gmdid);
 	for (int i = 0; i < ARRAY_SIZE(graphics_ip_map); i++) {
-		if (ver == graphics_ip_map[i].ver) {
-			xe->info.graphics_verx100 = ver;
+		if (verx100 == graphics_ip_map[i].verx100) {
+			xe->info.graphics_verx100 = verx100;
 			*graphics = graphics_ip_map[i].ip;
 
 			break;
@@ -457,14 +458,16 @@ static void handle_gmdid(struct xe_device *xe,
 
 	if (!xe->info.graphics_verx100) {
 		drm_err(&xe->drm, "Hardware reports unknown graphics version %u.%02u\n",
-			ver / 100, ver % 100);
+			verx100 / 100, verx100 % 100);
 	}
 
-	ver = peek_gmdid(xe, GMD_ID.addr + 0x380000);
-	*media_revid = REG_FIELD_GET(GMD_ID_REVID, ver);
+	gmdid = peek_gmdid(xe, GMD_ID.addr + 0x380000);
+	verx100 = REG_FIELD_GET(GMD_ID_ARCH_MASK, gmdid) * 100 +
+		  REG_FIELD_GET(GMD_ID_RELEASE_MASK, gmdid);
+	*media_revid = REG_FIELD_GET(GMD_ID_REVID_MASK, gmdid);
 	for (int i = 0; i < ARRAY_SIZE(media_ip_map); i++) {
-		if (ver == media_ip_map[i].ver) {
-			xe->info.media_verx100 = ver;
+		if (verx100 == media_ip_map[i].verx100) {
+			xe->info.media_verx100 = verx100;
 			*media = media_ip_map[i].ip;
 
 			break;
@@ -473,7 +476,7 @@ static void handle_gmdid(struct xe_device *xe,
 
 	if (!xe->info.media_verx100) {
 		drm_err(&xe->drm, "Hardware reports unknown media version %u.%02u\n",
-			ver / 100, ver % 100);
+			verx100 / 100, verx100 % 100);
 	}
 }
 
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index ba31b933eb8e..70858836cc5b 100644
--- a/drivers/gpu/drm/xe/xe_pci_types.h
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -37,7 +37,7 @@ struct xe_media_desc {
 };
 
 struct gmdid_map {
-	unsigned int ver;
+	unsigned int verx100;
 	const void *ip;
 };
 
-- 
2.40.1

