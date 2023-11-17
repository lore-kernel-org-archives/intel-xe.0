Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B74CCC197A0
	for <intel-xe@archiver.kernel.org>; Fri, 17 Nov 2023 17:41:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DDD710E2FC;
	Fri, 17 Nov 2023 17:41:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E306A10E2FC
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Nov 2023 17:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700242868; x=1731778868;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hBwaIAm+4csz77hUAf3SR8eGfnwkMeHoC8Ir4/IfMMk=;
 b=B3d4ZUVlgjtWo92AWQ8RuQ+v1Toa0wH7LRAMNeo+0+0EW8uzCvPx0Fwn
 RlQ3Fzl7m+cAZvh5Fk8zDgCUDleinc13CGrxFFcrr6cnDDGC2JFULh3Fn
 IKsyOPiQJHdW9dx12+3k2G2Af4i2PGzasaFQlk0aMcNhmU2s/oZ7ZyP00
 mzJMiZHZZt/SoKxEJqD8cZ34aGILlCE8tb1nd7O/Q26gfgfELmWfbgEM7
 9R2Gvd8+O9o1NSR9gPTQmr+vesyfTT30Oa3OF/FY4OaGi70QNNE0OGF0F
 Za72FEW4uNKrEccVQW+4/hLtbfR3cGGjWPSsPWREGeFnkibrpJS8Yov+5 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="4484541"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="4484541"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 09:41:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; d="scan'208";a="13979365"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 09:41:07 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 17 Nov 2023 09:40:47 -0800
Message-Id: <20231117174049.527192-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/3] drm/xe: Fold GEN11_MOCS_ENTRIES into
 gen12_mocs_desc
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

GEN11_MOCS_ENTRIES datest back from importing the table from the i915
module. The macro was used so the it could be maintained in a single
place and platforms would just override with additional entries.

With the platforms supported by xe, each of them is just defining
individual tables without re-using this define. Move it inside
gen12_mocs_desc that is the only user.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_mocs.c | 228 +++++++++++++++++------------------
 1 file changed, 112 insertions(+), 116 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
index 46e999257862..a072fbccc693 100644
--- a/drivers/gpu/drm/xe/xe_mocs.c
+++ b/drivers/gpu/drm/xe/xe_mocs.c
@@ -149,123 +149,87 @@ struct xe_mocs_info {
  *       For TGL/RKL, all the unspecified MOCS indexes are mapped to L3 UC.
  */
 
-#define GEN11_MOCS_ENTRIES \
-	/* Entries 0 and 1 are defined per-platform */ \
-	/* Base - L3 + LLC */ \
-	MOCS_ENTRY(2, \
-		LE_3_WB | LE_TC_1_LLC | LE_LRUM(3), \
-		L3_3_WB), \
-	/* Base - Uncached */ \
-	MOCS_ENTRY(3, \
-		LE_1_UC | LE_TC_1_LLC, \
-		L3_1_UC), \
-	/* Base - L3 */ \
-	MOCS_ENTRY(4, \
-		LE_1_UC | LE_TC_1_LLC, \
-		L3_3_WB), \
-	/* Base - LLC */ \
-	MOCS_ENTRY(5, \
-		LE_3_WB | LE_TC_1_LLC | LE_LRUM(3), \
-		L3_1_UC), \
-	/* Age 0 - LLC */ \
-	MOCS_ENTRY(6, \
-		LE_3_WB | LE_TC_1_LLC | LE_LRUM(1), \
-		L3_1_UC), \
-	/* Age 0 - L3 + LLC */ \
-	MOCS_ENTRY(7, \
-		LE_3_WB | LE_TC_1_LLC | LE_LRUM(1), \
-		L3_3_WB), \
-	/* Age: Don't Chg. - LLC */ \
-	MOCS_ENTRY(8, \
-		LE_3_WB | LE_TC_1_LLC | LE_LRUM(2), \
-		L3_1_UC), \
-	/* Age: Don't Chg. - L3 + LLC */ \
-	MOCS_ENTRY(9, \
-		LE_3_WB | LE_TC_1_LLC | LE_LRUM(2), \
-		L3_3_WB), \
-	/* No AOM - LLC */ \
-	MOCS_ENTRY(10, \
-		LE_3_WB | LE_TC_1_LLC | LE_LRUM(3) | LE_AOM(1), \
-		L3_1_UC), \
-	/* No AOM - L3 + LLC */ \
-	MOCS_ENTRY(11, \
-		LE_3_WB | LE_TC_1_LLC | LE_LRUM(3) | LE_AOM(1), \
-		L3_3_WB), \
-	/* No AOM; Age 0 - LLC */ \
-	MOCS_ENTRY(12, \
-		LE_3_WB | LE_TC_1_LLC | LE_LRUM(1) | LE_AOM(1), \
-		L3_1_UC), \
-	/* No AOM; Age 0 - L3 + LLC */ \
-	MOCS_ENTRY(13, \
-		LE_3_WB | LE_TC_1_LLC | LE_LRUM(1) | LE_AOM(1), \
-		L3_3_WB), \
-	/* No AOM; Age:DC - LLC */ \
-	MOCS_ENTRY(14, \
-		LE_3_WB | LE_TC_1_LLC | LE_LRUM(2) | LE_AOM(1), \
-		L3_1_UC), \
-	/* No AOM; Age:DC - L3 + LLC */ \
-	MOCS_ENTRY(15, \
-		LE_3_WB | LE_TC_1_LLC | LE_LRUM(2) | LE_AOM(1), \
-		L3_3_WB), \
-	/* Self-Snoop - L3 + LLC */ \
-	MOCS_ENTRY(18, \
-		LE_3_WB | LE_TC_1_LLC | LE_LRUM(3) | LE_SSE(3), \
-		L3_3_WB), \
-	/* Skip Caching - L3 + LLC(12.5%) */ \
-	MOCS_ENTRY(19, \
-		LE_3_WB | LE_TC_1_LLC | LE_LRUM(3) | LE_SCC(7), \
-		L3_3_WB), \
-	/* Skip Caching - L3 + LLC(25%) */ \
-	MOCS_ENTRY(20, \
-		LE_3_WB | LE_TC_1_LLC | LE_LRUM(3) | LE_SCC(3), \
-		L3_3_WB), \
-	/* Skip Caching - L3 + LLC(50%) */ \
-	MOCS_ENTRY(21, \
-		LE_3_WB | LE_TC_1_LLC | LE_LRUM(3) | LE_SCC(1), \
-		L3_3_WB), \
-	/* Skip Caching - L3 + LLC(75%) */ \
-	MOCS_ENTRY(22, \
-		LE_3_WB | LE_TC_1_LLC | LE_LRUM(3) | LE_RSC(1) | LE_SCC(3), \
-		L3_3_WB), \
-	/* Skip Caching - L3 + LLC(87.5%) */ \
-	MOCS_ENTRY(23, \
-		LE_3_WB | LE_TC_1_LLC | LE_LRUM(3) | LE_RSC(1) | LE_SCC(7), \
-		L3_3_WB), \
-	/* HW Reserved - SW program but never use */ \
-	MOCS_ENTRY(62, \
-		LE_3_WB | LE_TC_1_LLC | LE_LRUM(3), \
-		L3_1_UC), \
-	/* HW Reserved - SW program but never use */ \
-	MOCS_ENTRY(63, \
-		LE_3_WB | LE_TC_1_LLC | LE_LRUM(3), \
-		L3_1_UC)
-
-static const struct xe_mocs_entry dg1_mocs_desc[] = {
-	/* UC */
-	MOCS_ENTRY(1, 0, L3_1_UC),
-	/* WB - L3 */
-	MOCS_ENTRY(5, 0, L3_3_WB),
-	/* WB - L3 50% */
-	MOCS_ENTRY(6, 0, L3_ESC(1) | L3_SCC(1) | L3_3_WB),
-	/* WB - L3 25% */
-	MOCS_ENTRY(7, 0, L3_ESC(1) | L3_SCC(3) | L3_3_WB),
-	/* WB - L3 12.5% */
-	MOCS_ENTRY(8, 0, L3_ESC(1) | L3_SCC(7) | L3_3_WB),
-
-	/* HDC:L1 + L3 */
-	MOCS_ENTRY(48, 0, L3_3_WB),
-	/* HDC:L1 */
-	MOCS_ENTRY(49, 0, L3_1_UC),
-
-	/* HW Reserved */
-	MOCS_ENTRY(60, 0, L3_1_UC),
-	MOCS_ENTRY(61, 0, L3_1_UC),
-	MOCS_ENTRY(62, 0, L3_1_UC),
-	MOCS_ENTRY(63, 0, L3_1_UC),
-};
-
 static const struct xe_mocs_entry gen12_mocs_desc[] = {
-	GEN11_MOCS_ENTRIES,
+	/* Base - L3 + LLC */
+	MOCS_ENTRY(2,
+		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(3),
+		   L3_3_WB),
+	/* Base - Uncached */
+	MOCS_ENTRY(3,
+		   LE_1_UC | LE_TC_1_LLC,
+		   L3_1_UC),
+	/* Base - L3 */
+	MOCS_ENTRY(4,
+		   LE_1_UC | LE_TC_1_LLC,
+		   L3_3_WB),
+	/* Base - LLC */
+	MOCS_ENTRY(5,
+		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(3),
+		   L3_1_UC),
+	/* Age 0 - LLC */
+	MOCS_ENTRY(6,
+		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(1),
+		   L3_1_UC),
+	/* Age 0 - L3 + LLC */
+	MOCS_ENTRY(7,
+		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(1),
+		   L3_3_WB),
+	/* Age: Don't Chg. - LLC */
+	MOCS_ENTRY(8,
+		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(2),
+		   L3_1_UC),
+	/* Age: Don't Chg. - L3 + LLC */
+	MOCS_ENTRY(9,
+		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(2),
+		   L3_3_WB),
+	/* No AOM - LLC */
+	MOCS_ENTRY(10,
+		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(3) | LE_AOM(1),
+		   L3_1_UC),
+	/* No AOM - L3 + LLC */
+	MOCS_ENTRY(11,
+		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(3) | LE_AOM(1),
+		   L3_3_WB),
+	/* No AOM; Age 0 - LLC */
+	MOCS_ENTRY(12,
+		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(1) | LE_AOM(1),
+		   L3_1_UC),
+	/* No AOM; Age 0 - L3 + LLC */
+	MOCS_ENTRY(13,
+		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(1) | LE_AOM(1),
+		   L3_3_WB),
+	/* No AOM; Age:DC - LLC */
+	MOCS_ENTRY(14,
+		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(2) | LE_AOM(1),
+		   L3_1_UC),
+	/* No AOM; Age:DC - L3 + LLC */
+	MOCS_ENTRY(15,
+		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(2) | LE_AOM(1),
+		   L3_3_WB),
+	/* Self-Snoop - L3 + LLC */
+	MOCS_ENTRY(18,
+		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(3) | LE_SSE(3),
+		   L3_3_WB),
+	/* Skip Caching - L3 + LLC(12.5%) */
+	MOCS_ENTRY(19,
+		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(3) | LE_SCC(7),
+		   L3_3_WB),
+	/* Skip Caching - L3 + LLC(25%) */
+	MOCS_ENTRY(20,
+		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(3) | LE_SCC(3),
+		   L3_3_WB),
+	/* Skip Caching - L3 + LLC(50%) */
+	MOCS_ENTRY(21,
+		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(3) | LE_SCC(1),
+		   L3_3_WB),
+	/* Skip Caching - L3 + LLC(75%) */
+	MOCS_ENTRY(22,
+		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(3) | LE_RSC(1) | LE_SCC(3),
+		   L3_3_WB),
+	/* Skip Caching - L3 + LLC(87.5%) */
+	MOCS_ENTRY(23,
+		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(3) | LE_RSC(1) | LE_SCC(7),
+		   L3_3_WB),
 	/* Implicitly enable L1 - HDC:L1 + L3 + LLC */
 	MOCS_ENTRY(48,
 		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(3),
@@ -290,6 +254,38 @@ static const struct xe_mocs_entry gen12_mocs_desc[] = {
 	MOCS_ENTRY(61,
 		   LE_1_UC | LE_TC_1_LLC,
 		   L3_3_WB),
+	/* HW Reserved - SW program but never use */
+	MOCS_ENTRY(62,
+		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(3),
+		   L3_1_UC),
+	/* HW Reserved - SW program but never use */
+	MOCS_ENTRY(63,
+		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(3),
+		   L3_1_UC)
+};
+
+static const struct xe_mocs_entry dg1_mocs_desc[] = {
+	/* UC */
+	MOCS_ENTRY(1, 0, L3_1_UC),
+	/* WB - L3 */
+	MOCS_ENTRY(5, 0, L3_3_WB),
+	/* WB - L3 50% */
+	MOCS_ENTRY(6, 0, L3_ESC(1) | L3_SCC(1) | L3_3_WB),
+	/* WB - L3 25% */
+	MOCS_ENTRY(7, 0, L3_ESC(1) | L3_SCC(3) | L3_3_WB),
+	/* WB - L3 12.5% */
+	MOCS_ENTRY(8, 0, L3_ESC(1) | L3_SCC(7) | L3_3_WB),
+
+	/* HDC:L1 + L3 */
+	MOCS_ENTRY(48, 0, L3_3_WB),
+	/* HDC:L1 */
+	MOCS_ENTRY(49, 0, L3_1_UC),
+
+	/* HW Reserved */
+	MOCS_ENTRY(60, 0, L3_1_UC),
+	MOCS_ENTRY(61, 0, L3_1_UC),
+	MOCS_ENTRY(62, 0, L3_1_UC),
+	MOCS_ENTRY(63, 0, L3_1_UC),
 };
 
 static const struct xe_mocs_entry dg2_mocs_desc[] = {
-- 
2.40.1

