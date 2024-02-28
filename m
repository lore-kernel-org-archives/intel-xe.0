Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 531D2C54E55
	for <intel-xe@archiver.kernel.org>; Wed, 28 Feb 2024 06:10:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0921D10E4A4;
	Wed, 28 Feb 2024 06:10:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PXcRt/Y7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C556D10E350
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Feb 2024 06:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709100626; x=1740636626;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EhRjnPgA7l5U1RQbcvUMmGtOTr7rkr7jcaF4gjEKIj0=;
 b=PXcRt/Y7dw8+e2noCnO4AmKzu8ffHxFfkPDeKUe2i85H4wmcqeyfyIzp
 KgIqyGYsAtrWu/lLhsv6npzjeFmgz+5diMGlRGGJYv8WKnaKlwoTVzI6h
 kkwI0ADKHYFe1fdqrD88saQppgp+pJH4FLqjxmujNmt4uQWQ4qLxQPOPJ
 3/d/fBxslV+HfrtuOlZlXxoeidZGlU3T6uIDdVTvjHpFxhBPYNd8WotrG
 9aphNd+XgziDY11xBOv/gm3ZXpaB3PAw7aVFkRRMHhycewzV5cY40KRWe
 rOEp+RCgDD/r+0c6crbluf5la0+aiDV6YGyKt3YtZKc6RopsQ2t+PUQ4l Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="25950323"
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; d="scan'208";a="25950323"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2024 22:10:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="7290297"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2024 22:10:25 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Ruthuvikas Ravikumar <ruthuvikas.ravikumar@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 5/5] drm/xe/mocs: Fix DG2 kunit
Date: Tue, 27 Feb 2024 22:10:48 -0800
Message-ID: <20240228061048.3661978-6-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240228061048.3661978-1-lucas.demarchi@intel.com>
References: <20240228061048.3661978-1-lucas.demarchi@intel.com>
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

LNCFCMOCS31[31:16] is read-only for DG2 and MTL, so it's not possible to
check set it. While trying to set doesn't cause any issue, later when
it's read back to check if the value got correctly recorded causes the
test to fail. Now that test is reliable for an odd number of entries,
reduce it so the last entry is ignored.

Bspec: 55267
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1253
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1233
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_mocs.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
index 60ab34fd213fb..f56f630fa29d0 100644
--- a/drivers/gpu/drm/xe/xe_mocs.c
+++ b/drivers/gpu/drm/xe/xe_mocs.c
@@ -72,7 +72,7 @@ struct xe_mocs_info {
 /* Helper defines */
 #define XELP_NUM_MOCS_ENTRIES	64  /* 63-64 are reserved, but configured. */
 #define PVC_NUM_MOCS_ENTRIES	3
-#define MTL_NUM_MOCS_ENTRIES    16
+#define MTL_NUM_MOCS_ENTRIES	16
 #define XE2_NUM_MOCS_ENTRIES	16
 
 /* (e)LLC caching options */
@@ -401,7 +401,11 @@ static unsigned int get_mocs_settings(struct xe_device *xe,
 		info->size = ARRAY_SIZE(dg2_mocs_desc);
 		info->table = dg2_mocs_desc;
 		info->uc_index = 1;
-		info->n_entries = XELP_NUM_MOCS_ENTRIES;
+		/*
+		 * Last entry is RO on hardware, don't bother with what was
+		 * written when checking later
+		 */
+		info->n_entries = XELP_NUM_MOCS_ENTRIES - 1;
 		info->unused_entries_index = 3;
 		break;
 	case XE_DG1:
-- 
2.43.0

