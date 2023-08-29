Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D462EC71153
	for <intel-xe@archiver.kernel.org>; Tue, 29 Aug 2023 23:31:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95E1F10E4A2;
	Tue, 29 Aug 2023 23:31:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 376FF10E4A2
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Aug 2023 23:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693351864; x=1724887864;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hcA5Gm+yQNnQAaoVr6F13QJta+aDAlny3BIKE43LBDM=;
 b=VWGoZmdlddsFn8wbHnzV419Cdq1xFG7KnzpDc75XMmdsybDJ59DcGunI
 1zXyXTEut2OWBQueWLXcc76iPCT2E9FZi4tfBkdyHLXiAqGN5n82f4I9S
 5YchOBaPO3r9Kn6FGndmk3kpxuXVsD1aRXcb9JxdD7MQVAGNBQB3QJF/U
 ixtrc23mm9OsAVYVGrPq4PxRGN02BKin+qYov0aMFXyhN94TgDfxaGtoB
 uMwWa0UrhozfKd9DEGDdeiCtPSXEowWHPdlSPRvX5sl4DmXQwyCG5hEEE
 tL/vbhvtHawnxL23GKDH0t7v3v/48jBbvAXW00RM9QlbkZ9+PQBimP0KV w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="439454321"
X-IronPort-AV: E=Sophos;i="6.02,211,1688454000"; d="scan'208";a="439454321"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 16:31:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="829011893"
X-IronPort-AV: E=Sophos;i="6.02,211,1688454000"; d="scan'208";a="829011893"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 16:31:02 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 29 Aug 2023 16:30:53 -0700
Message-ID: <20230829233053.2264563-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] fixup! drm/xe/guc: Report submission version of
 GuC firmware
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

Major GuC versions greater than 70 will have the submission version in
the herader irrespective of their minor version number.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index e2f42f1bc89a..37ad238148b0 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -252,7 +252,7 @@ static void guc_read_css_info(struct xe_uc_fw *uc_fw, struct uc_css_header *css)
 	XE_WARN_ON(uc_fw->type != XE_UC_FW_TYPE_GUC);
 	XE_WARN_ON(uc_fw->major_ver_found < 70);
 
-	if (uc_fw->minor_ver_found >= 6) {
+	if (uc_fw->major_ver_found > 70 || uc_fw->minor_ver_found >= 6) {
 		/* v70.6.0 adds CSS header support */
 		guc->submission_state.version.major =
 			FIELD_GET(CSS_SW_VERSION_UC_MAJOR,
-- 
2.41.0

