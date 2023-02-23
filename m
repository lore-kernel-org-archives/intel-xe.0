Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E662C677F1
	for <intel-xe@archiver.kernel.org>; Thu, 23 Feb 2023 18:57:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C8CF10E0E4;
	Thu, 23 Feb 2023 18:57:57 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1959F10E04C
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Feb 2023 18:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677178674; x=1708714674;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WvQa361kOPtZYblt1B9vT0CSVLoZgcYk5lMabpnMFzo=;
 b=fi2EgYgtWgg2jTXbMUCXmop585HOumdqVW2gJRgoRExnliyU9iNodmiD
 lID7+gc6sgQzt5wq0Pk34JeI6EF9rLQV/RnYqdKCoyhDH5e1ZrFY5al/8
 iAP60ukhK4FdNw+Uck3JqQP6ogiPRcTzlu7FHODYP2+zCE1jozRTw7/Bc
 Mj7aJLIR0Mb696MfxPlenPdWedl4yxtDOnDsCHbBZjq4Yvf0cdivERyaP
 o+dUVehWnevkBYfcD+l8DKonAeQlc6TL4rLMLtthTVmWw+7B9Bu1YZ7n7
 TQLtvsuexVzmYgX3lts72MzDJUIYCapaYv0b/JAXUMxFg2/lqKKVG/JSl w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="360793757"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; d="scan'208";a="360793757"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2023 10:57:53 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="782018618"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; d="scan'208";a="782018618"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2023 10:57:53 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 23 Feb 2023 10:57:40 -0800
Message-Id: <20230223185740.3356127-8-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230223185740.3356127-1-matthew.d.roper@intel.com>
References: <20230223185740.3356127-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 7/7] drm/xe/mocs: Drop HAS_RENDER_L3CC flag
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

The HAS_RENDER_L3CC is set unconditionally so there's no need to keep it
as a dedicated flag.  For error checking purposes, we can just make sure
the 'table' field is initialized properly.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_mocs.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
index c019352ba7a8..1781cbfdd0f4 100644
--- a/drivers/gpu/drm/xe/xe_mocs.c
+++ b/drivers/gpu/drm/xe/xe_mocs.c
@@ -25,7 +25,6 @@ static inline void mocs_dbg(const struct drm_device *dev,
 
 enum {
 	HAS_GLOBAL_MOCS = BIT(0),
-	HAS_RENDER_L3CC = BIT(1),
 };
 
 struct xe_mocs_entry {
@@ -440,10 +439,11 @@ static unsigned int get_mocs_settings(struct xe_device *xe,
 	 */
 	XE_WARN_ON(info->unused_entries_index == 0);
 
-	if (XE_WARN_ON(info->size > info->n_entries))
+	if (XE_WARN_ON(info->size > info->n_entries)) {
+		info->table = NULL;
 		return 0;
+	}
 
-	flags = HAS_RENDER_L3CC;
 	if (!IS_DGFX(xe))
 		flags |= HAS_GLOBAL_MOCS;
 
@@ -538,6 +538,6 @@ void xe_mocs_init(struct xe_gt *gt)
 	 * sure the LNCFCMOCSx registers are programmed for the subsequent
 	 * memory transactions including guc transactions
 	 */
-	if (flags & HAS_RENDER_L3CC)
+	if (table.table)
 		init_l3cc_table(gt, &table);
 }
-- 
2.39.1

