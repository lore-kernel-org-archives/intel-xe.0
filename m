Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13EC8E8FDC6
	for <intel-xe@archiver.kernel.org>; Wed,  4 Oct 2023 03:10:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91F6910E338;
	Wed,  4 Oct 2023 03:10:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33F1F10E08A;
 Wed,  4 Oct 2023 03:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696389006; x=1727925006;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=k/5TUrmR9kF289mw4X3ZXbAiPpZc5wx7tIr6+jCXzfc=;
 b=bY/fcS1BDV8GoZofUZG6s+NV8vNfJF//WuyC3c84eBztQrsj9ltL/KhA
 I/2SZGSW1ZWBZX5HIJ3F9tpV9utPe71TgJPthPv/zVrCtuqz6CQl9osmY
 fUY+HI+sOa9SzOd+wtWWXVZ0D08BR+S+Evcm5yf87ksvdSdpPSghW/PUG
 njv0SjcrslDjJHA1t2j4vsdxGIsr5ObBICDNyG2AkVqYWVG2taXA4OOKD
 FzGo/kYJGu2Fw94X/HYux84v5vEK0prs/dhGd2t2xmPXHVs4VtH9aW4nv
 1cGKtGRJEztAQkpAV+v1xJikTaq1jj1rPS55dZBXxTfQ23fGTK0wT38DK g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="363308404"
X-IronPort-AV: E=Sophos;i="6.03,199,1694761200"; d="scan'208";a="363308404"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 20:10:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="894760399"
X-IronPort-AV: E=Sophos;i="6.03,199,1694761200"; d="scan'208";a="894760399"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 20:08:39 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  3 Oct 2023 20:10:18 -0700
Message-Id: <20231004031023.3444455-9-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231004031023.3444455-1-lucas.demarchi@intel.com>
References: <20231004031023.3444455-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH i-g-t v2 08/13] lib/intel_mocs: Add Xe2 mocs
 indexes
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add WB and UC mocs indexes for Xe2 architecture and later.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/intel_mocs.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/lib/intel_mocs.c b/lib/intel_mocs.c
index 6a4ec25e4..d9de16932 100644
--- a/lib/intel_mocs.c
+++ b/lib/intel_mocs.c
@@ -14,6 +14,8 @@
 #define MTL_MOCS_WB_IDX				10
 #define GEN12_MOCS_UC_IDX			3
 #define GEN12_MOCS_WB_IDX			2
+#define XE2_MOCS_UC_IDX				3
+#define XE2_MOCS_WB_IDX				1
 #define XY_BLOCK_COPY_BLT_MOCS_SHIFT		21
 #define XY_CTRL_SURF_COPY_BLT_MOCS_SHIFT	25
 
@@ -33,7 +35,10 @@ static void get_mocs_index(int fd, struct drm_intel_mocs_index *mocs)
 	 * This helper function is providing current UC as well
 	 * as WB MOCS index based on platform.
 	 */
-	if (IS_METEORLAKE(devid)) {
+	if (intel_graphics_ver(devid) >= IP_VER(20, 0)) {
+		mocs->uc_index = XE2_MOCS_UC_IDX;
+		mocs->wb_index = XE2_MOCS_WB_IDX;
+	} else if (IS_METEORLAKE(devid)) {
 		mocs->uc_index = MTL_MOCS_UC_IDX;
 		mocs->wb_index = MTL_MOCS_WB_IDX;
 	} else if (IS_DG2(devid)) {
-- 
2.40.1

