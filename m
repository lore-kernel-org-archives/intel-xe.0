Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 841A1EB64DB
	for <intel-xe@archiver.kernel.org>; Wed, 14 Jun 2023 20:52:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36CD010E46A;
	Wed, 14 Jun 2023 20:52:17 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADA7B10E469
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Jun 2023 20:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686775932; x=1718311932;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ieqslX8jWT0JUGfypkgWON00otbUABvEyOes9c6/RHU=;
 b=GAwwc8T7SvaTihRd+xSJsT3gBuol30LtSkYEFCaTKOLwEI0lClLclknf
 Cla+3PiWROC9OaIR30C+8hS0B6MKpsvLIq8MGFo/UxWdcrbKiXmQJn1IJ
 Rq74nJ/2YA91ol0NpwsgjH60WNb4dSCzVWdw/NLyc+K+Y6fKYtzElRlxI
 Tk93UbrKxXL0fZM/PcKHO9GiXp0Gj+pMl2TV+sgnLUJepBTe8w8giRuis
 ij6U6IkBctC/63uP5RAmCoEWDpaaovK2lM1PY4v/ikhvvpanivi4evE0d
 4okDmOmvtZA4k3o10wpMOoNQaqKHOS9JhTZRW6mWaDphYgQJomOt1DQFk w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="343432000"
X-IronPort-AV: E=Sophos;i="6.00,243,1681196400"; d="scan'208";a="343432000"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2023 13:52:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="712206066"
X-IronPort-AV: E=Sophos;i="6.00,243,1681196400"; d="scan'208";a="712206066"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.147])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2023 13:52:08 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 14 Jun 2023 13:51:59 -0700
Message-Id: <20230614205202.3376752-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230614205202.3376752-1-matthew.d.roper@intel.com>
References: <20230614205202.3376752-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/4] drm/xe: Return GMD_ID revid properly
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

peek_gmdid() returns the IP version, not the raw value of the GMD_ID
register.  Make sure we extract and return the rev_id field as well so
that it can be used to determine the IP steppings properly.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 2991cf5365d5..7926c2fa1433 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -392,23 +392,27 @@ find_subplatform(const struct xe_device *xe, const struct xe_device_desc *desc)
 	return NULL;
 }
 
-static u32 peek_gmdid(struct xe_device *xe, u32 gmdid_offset)
+static void peek_gmdid(struct xe_device *xe, u32 gmdid_offset, u32 *ver, u32 *revid)
 {
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 	void __iomem *map = pci_iomap_range(pdev, 0, gmdid_offset, sizeof(u32));
-	u32 ver;
+	u32 val;
 
 	if (!map) {
 		drm_err(&xe->drm, "Failed to read GMD_ID (%#x) from PCI BAR.\n",
 			gmdid_offset);
-		return 0;
+		*ver = 0;
+		*revid = 0;
+
+		return;
 	}
 
-	ver = ioread32(map);
+	val = ioread32(map);
 	pci_iounmap(pdev, map);
 
-	return REG_FIELD_GET(GMD_ID_ARCH_MASK, ver) * 100 +
-		REG_FIELD_GET(GMD_ID_RELEASE_MASK, ver);
+	*ver = REG_FIELD_GET(GMD_ID_ARCH_MASK, val) * 100 +
+		REG_FIELD_GET(GMD_ID_RELEASE_MASK, val);
+	*revid = REG_FIELD_GET(GMD_ID_REVID, val);
 }
 
 /*
@@ -444,8 +448,7 @@ static void handle_gmdid(struct xe_device *xe,
 {
 	u32 ver;
 
-	ver = peek_gmdid(xe, GMD_ID.addr);
-	*graphics_revid = REG_FIELD_GET(GMD_ID_REVID, ver);
+	peek_gmdid(xe, GMD_ID.addr, &ver, graphics_revid);
 	for (int i = 0; i < ARRAY_SIZE(graphics_ip_map); i++) {
 		if (ver == graphics_ip_map[i].ver) {
 			xe->info.graphics_verx100 = ver;
@@ -460,8 +463,8 @@ static void handle_gmdid(struct xe_device *xe,
 			ver / 100, ver % 100);
 	}
 
-	ver = peek_gmdid(xe, GMD_ID.addr + 0x380000);
-	*media_revid = REG_FIELD_GET(GMD_ID_REVID, ver);
+	peek_gmdid(xe, GMD_ID.addr + 0x380000, &ver, media_revid);
+
 	for (int i = 0; i < ARRAY_SIZE(media_ip_map); i++) {
 		if (ver == media_ip_map[i].ver) {
 			xe->info.media_verx100 = ver;
-- 
2.40.1

