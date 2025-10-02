Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3B7DCAC5B0
	for <intel-xe@archiver.kernel.org>; Thu,  2 Oct 2025 14:25:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C51910E7FB;
	Thu,  2 Oct 2025 14:25:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="s5LiIKDz";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6F4910E7F9
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Oct 2025 14:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=x/i39UqgLRNLJWHO49rswInOsCPNxeySS8nPJh7fgwk=; b=s5LiIKDzEKIXJEnSQGVPzghENV
 c3bCdyq2Sm9zmKHqDLI8lJzfLwK3CbW3SxQgMTSXxGBofxZzaKqufYwu+TIYvAeJvGtDydvGk2Q58
 Qt/wUfbOXEsBKZJke28620u2ICTHXhrQsooFFGHF9M572IrGxpeAbuaAQoFxrXNXppZobRpWfxPFa
 ZNApX5/Bm8fNewV2JUf7hZgeSwXnX8Mzt2/gn8G5MstIapvwOdfkar2PiC6MFuj0JFngLqBQZUb5c
 6goOKioZDcfawR/53i2Hr4036MtpcRjI0VtniGI4iNtKJyR2I9Hj2pstjOROUWWlnoQZX/1nlCJ7x
 X3YQ+r4A==;
Received: from [84.66.36.92] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1v4KF9-003Q1q-V1
 for <intel-xe@lists.freedesktop.org>; Thu, 02 Oct 2025 16:25:16 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 12/13] mocs 0 uncached
Date: Thu,  2 Oct 2025 15:24:50 +0100
Message-ID: <20251002142453.25574-13-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20251002142453.25574-1-tvrtko.ursulin@igalia.com>
References: <20251002142453.25574-1-tvrtko.ursulin@igalia.com>
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

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/gpu/drm/xe/xe_mocs.c | 247 +++++++++++++++++++----------------
 1 file changed, 133 insertions(+), 114 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
index 7b68c22ff7bb..2b497f2bc51c 100644
--- a/drivers/gpu/drm/xe/xe_mocs.c
+++ b/drivers/gpu/drm/xe/xe_mocs.c
@@ -142,119 +142,131 @@ struct xe_mocs_info {
  * variants with better coherency in the future if more entries are needed.
  */
 
-static const struct xe_mocs_entry gen12_mocs_desc[] = {
-	/* Base - L3 + LLC */
-	MOCS_ENTRY(2,
-		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(3),
-		   L3_3_WB),
-	/* Base - Uncached */
-	MOCS_ENTRY(3,
-		   LE_1_UC | LE_TC_1_LLC,
-		   L3_1_UC),
-	/* Base - L3 */
-	MOCS_ENTRY(4,
-		   LE_1_UC | LE_TC_1_LLC,
-		   L3_3_WB),
-	/* Base - LLC */
-	MOCS_ENTRY(5,
-		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(3),
-		   L3_1_UC),
-	/* Age 0 - LLC */
-	MOCS_ENTRY(6,
-		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(1),
-		   L3_1_UC),
-	/* Age 0 - L3 + LLC */
-	MOCS_ENTRY(7,
-		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(1),
-		   L3_3_WB),
-	/* Age: Don't Chg. - LLC */
-	MOCS_ENTRY(8,
-		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(2),
-		   L3_1_UC),
-	/* Age: Don't Chg. - L3 + LLC */
-	MOCS_ENTRY(9,
-		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(2),
-		   L3_3_WB),
-	/* No AOM - LLC */
-	MOCS_ENTRY(10,
-		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(3) | LE_AOM(1),
-		   L3_1_UC),
-	/* No AOM - L3 + LLC */
-	MOCS_ENTRY(11,
-		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(3) | LE_AOM(1),
-		   L3_3_WB),
-	/* No AOM; Age 0 - LLC */
-	MOCS_ENTRY(12,
-		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(1) | LE_AOM(1),
-		   L3_1_UC),
-	/* No AOM; Age 0 - L3 + LLC */
-	MOCS_ENTRY(13,
-		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(1) | LE_AOM(1),
-		   L3_3_WB),
-	/* No AOM; Age:DC - LLC */
-	MOCS_ENTRY(14,
-		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(2) | LE_AOM(1),
-		   L3_1_UC),
-	/* No AOM; Age:DC - L3 + LLC */
-	MOCS_ENTRY(15,
-		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(2) | LE_AOM(1),
-		   L3_3_WB),
-	/* Self-Snoop - L3 + LLC */
-	MOCS_ENTRY(18,
-		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(3) | LE_SSE(3),
-		   L3_3_WB),
-	/* Skip Caching - L3 + LLC(12.5%) */
-	MOCS_ENTRY(19,
-		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(3) | LE_SCC(7),
-		   L3_3_WB),
-	/* Skip Caching - L3 + LLC(25%) */
-	MOCS_ENTRY(20,
-		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(3) | LE_SCC(3),
-		   L3_3_WB),
-	/* Skip Caching - L3 + LLC(50%) */
-	MOCS_ENTRY(21,
-		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(3) | LE_SCC(1),
-		   L3_3_WB),
-	/* Skip Caching - L3 + LLC(75%) */
-	MOCS_ENTRY(22,
-		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(3) | LE_RSC(1) | LE_SCC(3),
-		   L3_3_WB),
-	/* Skip Caching - L3 + LLC(87.5%) */
-	MOCS_ENTRY(23,
-		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(3) | LE_RSC(1) | LE_SCC(7),
-		   L3_3_WB),
-	/* Implicitly enable L1 - HDC:L1 + L3 + LLC */
-	MOCS_ENTRY(48,
-		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(3),
-		   L3_3_WB),
-	/* Implicitly enable L1 - HDC:L1 + L3 */
-	MOCS_ENTRY(49,
-		   LE_1_UC | LE_TC_1_LLC,
-		   L3_3_WB),
-	/* Implicitly enable L1 - HDC:L1 + LLC */
-	MOCS_ENTRY(50,
-		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(3),
-		   L3_1_UC),
-	/* Implicitly enable L1 - HDC:L1 */
-	MOCS_ENTRY(51,
-		   LE_1_UC | LE_TC_1_LLC,
-		   L3_1_UC),
-	/* HW Special Case (CCS) */
-	MOCS_ENTRY(60,
-		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(3),
-		   L3_1_UC),
-	/* HW Special Case (Displayable) */
-	MOCS_ENTRY(61,
-		   LE_1_UC | LE_TC_1_LLC,
-		   L3_3_WB),
-	/* HW Reserved - SW program but never use */
-	MOCS_ENTRY(62,
-		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(3),
-		   L3_1_UC),
-	/* HW Reserved - SW program but never use */
-	MOCS_ENTRY(63,
-		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(3),
+#define GEN12_MOCS_ENTRIES \
+	/* Base - L3 + LLC */ \
+	MOCS_ENTRY(2, \
+		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(3), \
+		   L3_3_WB), \
+	/* Base - Uncached */ \
+	MOCS_ENTRY(3, \
+		   LE_1_UC | LE_TC_1_LLC, \
+		   L3_1_UC), \
+	/* Base - L3 */ \
+	MOCS_ENTRY(4, \
+		   LE_1_UC | LE_TC_1_LLC, \
+		   L3_3_WB), \
+	/* Base - LLC */ \
+	MOCS_ENTRY(5, \
+		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(3), \
+		   L3_1_UC), \
+	/* Age 0 - LLC */ \
+	MOCS_ENTRY(6, \
+		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(1), \
+		   L3_1_UC), \
+	/* Age 0 - L3 + LLC */ \
+	MOCS_ENTRY(7, \
+		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(1), \
+		   L3_3_WB), \
+	/* Age: Don't Chg. - LLC */ \
+	MOCS_ENTRY(8, \
+		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(2), \
+		   L3_1_UC), \
+	/* Age: Don't Chg. - L3 + LLC */ \
+	MOCS_ENTRY(9, \
+		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(2), \
+		   L3_3_WB), \
+	/* No AOM - LLC */ \
+	MOCS_ENTRY(10, \
+		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(3) | LE_AOM(1), \
+		   L3_1_UC), \
+	/* No AOM - L3 + LLC */ \
+	MOCS_ENTRY(11, \
+		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(3) | LE_AOM(1), \
+		   L3_3_WB), \
+	/* No AOM; Age 0 - LLC */ \
+	MOCS_ENTRY(12, \
+		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(1) | LE_AOM(1), \
+		   L3_1_UC), \
+	/* No AOM; Age 0 - L3 + LLC */ \
+	MOCS_ENTRY(13, \
+		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(1) | LE_AOM(1), \
+		   L3_3_WB), \
+	/* No AOM; Age:DC - LLC */ \
+	MOCS_ENTRY(14, \
+		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(2) | LE_AOM(1), \
+		   L3_1_UC), \
+	/* No AOM; Age:DC - L3 + LLC */ \
+	MOCS_ENTRY(15, \
+		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(2) | LE_AOM(1), \
+		   L3_3_WB), \
+	/* Self-Snoop - L3 + LLC */ \
+	MOCS_ENTRY(18, \
+		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(3) | LE_SSE(3), \
+		   L3_3_WB), \
+	/* Skip Caching - L3 + LLC(12.5%) */ \
+	MOCS_ENTRY(19, \
+		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(3) | LE_SCC(7), \
+		   L3_3_WB), \
+	/* Skip Caching - L3 + LLC(25%) */ \
+	MOCS_ENTRY(20, \
+		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(3) | LE_SCC(3), \
+		   L3_3_WB), \
+	/* Skip Caching - L3 + LLC(50%) */ \
+	MOCS_ENTRY(21, \
+		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(3) | LE_SCC(1), \
+		   L3_3_WB), \
+	/* Skip Caching - L3 + LLC(75%) */ \
+	MOCS_ENTRY(22, \
+		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(3) | LE_RSC(1) | LE_SCC(3), \
+		   L3_3_WB), \
+	/* Skip Caching - L3 + LLC(87.5%) */ \
+	MOCS_ENTRY(23, \
+		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(3) | LE_RSC(1) | LE_SCC(7), \
+		   L3_3_WB), \
+	/* Implicitly enable L1 - HDC:L1 + L3 + LLC */ \
+	MOCS_ENTRY(48, \
+		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(3), \
+		   L3_3_WB), \
+	/* Implicitly enable L1 - HDC:L1 + L3 */ \
+	MOCS_ENTRY(49, \
+		   LE_1_UC | LE_TC_1_LLC, \
+		   L3_3_WB), \
+	/* Implicitly enable L1 - HDC:L1 + LLC */ \
+	MOCS_ENTRY(50, \
+		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(3), \
+		   L3_1_UC), \
+	/* Implicitly enable L1 - HDC:L1 */ \
+	MOCS_ENTRY(51, \
+		   LE_1_UC | LE_TC_1_LLC, \
+		   L3_1_UC), \
+	/* HW Special Case (CCS) */ \
+	MOCS_ENTRY(60, \
+		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(3), \
+		   L3_1_UC), \
+	/* HW Special Case (Displayable) */ \
+	MOCS_ENTRY(61, \
+		   LE_1_UC | LE_TC_1_LLC, \
+		   L3_3_WB), \
+	/* HW Reserved - SW program but never use */ \
+	MOCS_ENTRY(62, \
+		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(3), \
+		   L3_1_UC), \
+	/* HW Reserved - SW program but never use */ \
+	MOCS_ENTRY(63, \
+		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(3), \
 		   L3_1_UC)
+
+static const struct xe_mocs_entry gen12_mocs_desc[] = {
+	GEN12_MOCS_ENTRIES,
+};
+
+static const struct xe_mocs_entry adl_mocs_desc[] = {
+	GEN12_MOCS_ENTRIES,
+
+	/* Undocumented CCS HW behaviour - Uncached */
+	MOCS_ENTRY(0,
+		   LE_1_UC | LE_TC_1_LLC,
+		   L3_1_UC),
 };
 
 static bool regs_are_mcr(struct xe_gt *gt)
@@ -626,12 +638,19 @@ static unsigned int get_mocs_settings(struct xe_device *xe,
 		break;
 	case XE_TIGERLAKE:
 	case XE_ROCKETLAKE:
+		info->ops = &xelp_mocs_ops;
+		info->table_size  = ARRAY_SIZE(gen12_mocs_desc);
+		info->table = gen12_mocs_desc;
+		info->num_mocs_regs = XELP_NUM_MOCS_ENTRIES;
+		info->uc_index = 3;
+		info->unused_entries_index = 2;
+		break;
 	case XE_ALDERLAKE_S:
 	case XE_ALDERLAKE_P:
 	case XE_ALDERLAKE_N:
 		info->ops = &xelp_mocs_ops;
-		info->table_size  = ARRAY_SIZE(gen12_mocs_desc);
-		info->table = gen12_mocs_desc;
+		info->table_size  = ARRAY_SIZE(adl_mocs_desc);
+		info->table = adl_mocs_desc;
 		info->num_mocs_regs = XELP_NUM_MOCS_ENTRIES;
 		info->uc_index = 3;
 		info->unused_entries_index = 2;
-- 
2.48.0

