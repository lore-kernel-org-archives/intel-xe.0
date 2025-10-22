Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C5E5CCF9E0
	for <intel-xe@archiver.kernel.org>; Wed, 22 Oct 2025 05:18:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02B2810E6AC;
	Wed, 22 Oct 2025 05:18:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HeDkBpdP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4432710E6A6
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Oct 2025 05:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761110318; x=1792646318;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=E2SUKfCXiI+8C4ERc2u/4xl4chXZFtjhoIE6Rol5qoA=;
 b=HeDkBpdPzoAtdxAh3YoBpFw/mHvoc4zN7YRB2Obs1D1FTgN3zxTsbxCf
 GbvNAqAyhFQQOF7IWkt/Xi6igiW32twHpoewQHt/yGVBPwUVAnmYHViLh
 fbG+2vqU/lMksG6QSwBqt/4/F6LihBoNM00zjm54Cy7ZPNWRFu+itgkeH
 yvIt03ntWG/w/5W6G3O60jqX4ylXkLbVDf/U+fCo8BgCRBucl2N/KKtmX
 Dw9/5Lhm4eiWhNg37GQIFkBkAACbIfKch0N/dxn9ZXVxMO3Aa9QGrIqW7
 xLm+WKYQrhhha0hZn/fyiku/uvFvKG40/dm9WeyMMXDBJKalNBA9rp8zX Q==;
X-CSE-ConnectionGUID: ykDy1qeASf6/3HYtKthDWA==
X-CSE-MsgGUID: y4A1Cdr7R6SvMeHq7WUJ1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67083973"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="67083973"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 22:18:37 -0700
X-CSE-ConnectionGUID: heFAJHh/S6WxEpYzwcYuDg==
X-CSE-MsgGUID: i/Ypkf9IR26ofwNxaizDww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="220959688"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 22:18:37 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH 03/12] drm/xe/cri: Setup MOCS table
Date: Tue, 21 Oct 2025 22:17:35 -0700
Message-ID: <20251021-cri-v1-3-bf11e61d9f49@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251021-cri-v1-0-bf11e61d9f49@intel.com>
References: <20251021-cri-v1-0-bf11e61d9f49@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-bd47d
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

From: Matt Roper <matthew.d.roper@intel.com>

CRI has a new MOCS table, but uses the same general ops as other Xe2/Xe3
platforms.

Bspec: 71582
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_mocs.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
index e8ec4114302e5..6613d3b48a844 100644
--- a/drivers/gpu/drm/xe/xe_mocs.c
+++ b/drivers/gpu/drm/xe/xe_mocs.c
@@ -568,6 +568,23 @@ static const struct xe_mocs_ops xe2_mocs_ops = {
 	.dump = xe2_mocs_dump,
 };
 
+/*
+ * Note that the "L3" and "L4" register fields actually control the L2 and L3
+ * caches respectively on this platform.
+ */
+static const struct xe_mocs_entry xe3p_xpc_mocs_table[] = {
+	/* Defer to PAT */
+	MOCS_ENTRY(0, XE2_L3_0_WB | L4_3_UC, 0),
+	/* UC */
+	MOCS_ENTRY(1, IG_PAT | XE2_L3_3_UC | L4_3_UC, 0),
+	/* L2 */
+	MOCS_ENTRY(2, IG_PAT | XE2_L3_0_WB | L4_3_UC, 0),
+	/* L3 */
+	MOCS_ENTRY(3, IG_PAT | XE2_L3_3_UC | L4_0_WB, 0),
+	/* L2 + L3 */
+	MOCS_ENTRY(4, IG_PAT | XE2_L3_0_WB | L4_0_WB, 0),
+};
+
 static unsigned int get_mocs_settings(struct xe_device *xe,
 				      struct xe_mocs_info *info)
 {
@@ -576,6 +593,15 @@ static unsigned int get_mocs_settings(struct xe_device *xe,
 	memset(info, 0, sizeof(struct xe_mocs_info));
 
 	switch (xe->info.platform) {
+	case XE_CRESCENTISLAND:
+		info->ops = &xe2_mocs_ops;
+		info->table_size = ARRAY_SIZE(xe3p_xpc_mocs_table);
+		info->table = xe3p_xpc_mocs_table;
+		info->num_mocs_regs = XE2_NUM_MOCS_ENTRIES;
+		info->uc_index = 1;
+		info->wb_index = 4;
+		info->unused_entries_index = 4;
+		break;
 	case XE_NOVALAKE_S:
 	case XE_PANTHERLAKE:
 	case XE_LUNARLAKE:

-- 
2.51.0

