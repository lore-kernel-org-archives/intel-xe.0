Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75C17C61DA4
	for <intel-xe@archiver.kernel.org>; Thu, 16 Feb 2023 23:17:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54E1310E39B;
	Thu, 16 Feb 2023 23:17:44 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E277E10E39B
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Feb 2023 23:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676589459; x=1708125459;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EqijEC+aFp1w02IUgn8NHLtc0pqut6+eNvFlDAaK6dE=;
 b=QrzAYVy3Kfency6V+D8JnM2OBHFbnwhJ7GtUcrgTYuHpul/V/FIRtYyC
 BXOjKGPNKa8YrwHYItybv44EFQlDX9vVZBc5jGI/HXy3i+C//qs3MlfZV
 N8Fqeo7rz/qX0neZLSNnaneCvKIEBGtBiAs8trmq6tkwNu27dJY29e7ax
 7hHdJfr0GdiMRlFhrapA1vBKn4DQ6U6Reyn9e8CEMC/CTi2E3wrnNiVvw
 sSenyDlgiQGq/tbmaSLDTP+2Dez/Bnky42YbWYwL5h5IUuEsy6V/Du3/1
 DopReWyuV1eYGN24PrNLT0UO57ggPIVqLpHa1XHkvwdYjUNYN/K8wshZ5 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="333220837"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; d="scan'208";a="333220837"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 15:17:39 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="813169213"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; d="scan'208";a="813169213"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 15:17:38 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 16 Feb 2023 15:17:21 -0800
Message-Id: <20230216231724.2246534-4-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230216231724.2246534-1-matthew.d.roper@intel.com>
References: <20230216231724.2246534-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/6] drm/xe/mocs: Drop xe_mocs_info_index
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

The values in the xe_mocs_info_index enum only match old pre-gen12
hardware not supported by the Xe driver.

The only usage of this enum was to set a default value for
info->unused_entries_index, but this is unnecessary since every platform
in the subsequent switch statement sets a proper platform-specific value
(and the XE_MOCS_PTE default doesn't even make sense since the hardware
dropped the "use PAT settings" capability in gen12).

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_mocs.c | 30 ++----------------------------
 1 file changed, 2 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
index ec89ff3ac29b..583e198af88d 100644
--- a/drivers/gpu/drm/xe/xe_mocs.c
+++ b/drivers/gpu/drm/xe/xe_mocs.c
@@ -23,30 +23,6 @@ static inline void mocs_dbg(const struct drm_device *dev,
 { /* noop */ }
 #endif
 
-/*
- * MOCS indexes used for GPU surfaces, defining the cacheability of the
- * surface data and the coherency for this data wrt. CPU vs. GPU accesses.
- */
-enum xe_mocs_info_index {
-	/*
-	 * Not cached anywhere, coherency between CPU and GPU accesses is
-	 * guaranteed.
-	 */
-	XE_MOCS_UNCACHED,
-	/*
-	 * Cacheability and coherency controlled by the kernel automatically
-	 * based on the xxxx  IOCTL setting and the current
-	 * usage of the surface (used for display scanout or not).
-	 */
-	XE_MOCS_PTE,
-	/*
-	 * Cached in all GPU caches available on the platform.
-	 * Coherency between CPU and GPU accesses to the surface is not
-	 * guaranteed without extra synchronization.
-	 */
-	XE_MOCS_CACHED,
-};
-
 enum {
 	HAS_GLOBAL_MOCS = BIT(0),
 	HAS_RENDER_L3CC = BIT(1),
@@ -341,7 +317,6 @@ static unsigned int get_mocs_settings(struct xe_device *xe,
 
 	memset(info, 0, sizeof(struct xe_mocs_info));
 
-	info->unused_entries_index = XE_MOCS_PTE;
 	switch (xe->info.platform) {
 	case XE_PVC:
 		info->size = ARRAY_SIZE(pvc_mocs_desc);
@@ -406,9 +381,8 @@ static unsigned int get_mocs_settings(struct xe_device *xe,
 }
 
 /*
- * Get control_value from MOCS entry taking into account when it's not used
- * then if unused_entries_index is non-zero then its value will be returned
- * otherwise XE_MOCS_PTE's value is returned in this case.
+ * Get control_value from MOCS entry.  If the table entry is not defined, the
+ * settings from unused_entries_index will be returned.
  */
 static u32 get_entry_control(const struct xe_mocs_info *info,
 			     unsigned int index)
-- 
2.39.1

