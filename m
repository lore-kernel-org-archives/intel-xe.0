Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0035AC83005
	for <intel-xe@archiver.kernel.org>; Sun, 11 Jun 2023 22:25:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95D9D10E13C;
	Sun, 11 Jun 2023 22:25:02 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AD2910E14C
 for <intel-xe@lists.freedesktop.org>; Sun, 11 Jun 2023 22:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686522300; x=1718058300;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GUxTP6BSs67kdzz7Y/O3yh+FLG3jVlWiii9OhOhkl+k=;
 b=QUB3BUr9gTkGsv+ZWu1TLypeOpUOo2y7HKTio3aiwGtuxOt+M7AJsIn1
 VErBTKwH33xaCD9FyXN7GnB9xBoMCyj5YrpwJuddhj+dx8O3M7c0aYtlh
 UFwT2kSqr4arSu0N1VJIOi9Uwax2zq+5rmYtUHqHxxvvc1+rDM1Y086dv
 9XNbbBj7mwO5rXKRtQh8eUK9ehNBmA1f+8KA0mhfXgKMjoVXFWRvnkl9X
 5dfX1EaivlJt1AwR7q4uCv3pLFZTaCSQEu5CPqcPz+5ObjtTk/tb3qVnH
 ZS3x8UvCYRBjgZqnEDdFazasThd0s21JtMbGYdIv6fdLDpOJTpxB/rCgK g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="347552651"
X-IronPort-AV: E=Sophos;i="6.00,235,1681196400"; d="scan'208";a="347552651"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2023 15:24:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="957778759"
X-IronPort-AV: E=Sophos;i="6.00,235,1681196400"; d="scan'208";a="957778759"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2023 15:24:59 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Sun, 11 Jun 2023 15:24:47 -0700
Message-Id: <20230611222447.2837573-5-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230611222447.2837573-1-lucas.demarchi@intel.com>
References: <20230611222447.2837573-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 5/5] drm/xe: Fix GMD_ID to revid
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
variables to make clear what are the assigned values.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c       | 29 ++++++++++++++++-------------
 drivers/gpu/drm/xe/xe_pci_types.h |  2 +-
 2 files changed, 17 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index bd1f59b49928..06d9d21c7cd3 100644
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
+	*graphics_revid = REG_FIELD_GET(GMD_ID_REVID, gmdid);
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
+	*media_revid = REG_FIELD_GET(GMD_ID_REVID, gmdid);
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

