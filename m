Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97B18C64ED8
	for <intel-xe@archiver.kernel.org>; Thu, 23 Feb 2023 18:57:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77F7110E0DE;
	Thu, 23 Feb 2023 18:57:56 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8D9810E076
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Feb 2023 18:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677178673; x=1708714673;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oi+b7r11NuK+14CqVO5wkKHffUK1moJNJ/eM/M5itw4=;
 b=nRMZn1RZkoyWZnHbgscJN5gMSi4sLsjMbTGf/6qqbZ2EKBzuISyY80cX
 UsNrswATPUguYfK1mYsTJtQXyjbMgn8Nh3vcTNiPDZjoOxufcnfIxmJSl
 b3KfWMVIL425SgF9vkbDYCu2tRcCpmenHiNMRhe2izix0Het8xUCEeQaJ
 FL6Ux9pjWDvqCF3I5Fwzt/w6FO2qMItzoCxgh8HL+Bg9O1zjlgdKWx5ED
 L9+3DTXV2ARCw4aIwo/wDdQurdEM6a/aHPh2hzgqUV5UJl6TbKwSLVIyY
 HeOJBGON0cIiWBO0cqGuY/YsJA2jAuKa9XsFzXQNZ5N0auywvv2bBRjpu Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="360793752"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; d="scan'208";a="360793752"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2023 10:57:53 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="782018607"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; d="scan'208";a="782018607"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2023 10:57:53 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 23 Feb 2023 10:57:36 -0800
Message-Id: <20230223185740.3356127-4-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230223185740.3356127-1-matthew.d.roper@intel.com>
References: <20230223185740.3356127-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 3/7] drm/xe/mocs: Drop xe_mocs_info_index
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The values in the xe_mocs_info_index enum only match old pre-gen12
hardware not supported by the Xe driver.

The only usage of this enum was to set a default value for
info->unused_entries_index, but this is unnecessary since every platform
in the subsequent switch statement sets a proper platform-specific value
(and the XE_MOCS_PTE default doesn't even make sense since the hardware
dropped the "use PAT settings" capability in gen12).

v2:
 - Add a check that unusued_entries_index is non-zero; even for
   platforms where this is a valid table entry, it's never the one we
   want this value assigned to.  (Lucas)

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_mocs.c | 40 +++++++++++-------------------------
 1 file changed, 12 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
index ec89ff3ac29b..05b8a9967f0a 100644
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
@@ -395,6 +370,16 @@ static unsigned int get_mocs_settings(struct xe_device *xe,
 		return 0;
 	}
 
+	/*
+	 * Index 0 is a reserved/unused table entry on most platforms, but
+	 * even on those where it does represent a legitimate MOCS entry, it
+	 * never represents the "most cached, least coherent" behavior we want
+	 * to populate undefined table rows with.  So if unused_entries_index
+	 * is still 0 at this point, we'll assume that it was omitted by
+	 * mistake in the switch statement above.
+	 */
+	XE_WARN_ON(info->unused_entries_index == 0);
+
 	if (XE_WARN_ON(info->size > info->n_entries))
 		return 0;
 
@@ -406,9 +391,8 @@ static unsigned int get_mocs_settings(struct xe_device *xe,
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

