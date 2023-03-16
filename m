Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57745C6FD19
	for <intel-xe@archiver.kernel.org>; Thu, 16 Mar 2023 11:08:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04FD410E099;
	Thu, 16 Mar 2023 11:08:06 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C5B610E099
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Mar 2023 11:08:04 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 16 Mar 2023 12:07:52 +0100
Message-Id: <20230316110752.129831-1-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Fix Alderlake-P and DG2 display info
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

DG2 has cdclk squash, without which we calculate the CDCLK wrongly.
Alderlake-P is LPD, not gen 12 display.

With those fixed, display should work on both and all problems that were
uncovered by testing done from rebasing are fixed.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_display.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
index f28553be858d..54ec8ba5d3f3 100644
--- a/drivers/gpu/drm/xe/xe_display.c
+++ b/drivers/gpu/drm/xe/xe_display.c
@@ -482,19 +482,27 @@ void xe_display_info_init(struct xe_device *xe)
 		xe->info.display = (struct xe_device_display_info) { GEN12_DISPLAY };
 		break;
 	case XE_ALDERLAKE_S:
-	case XE_ALDERLAKE_P:
 		xe->info.display = (struct xe_device_display_info) {
 			GEN12_DISPLAY,
 			.has_hti = 1,
 			.has_psr_hw_tracking = 0,
 		};
 		break;
+	case XE_ALDERLAKE_P:
+		xe->info.display = (struct xe_device_display_info) {
+			XE_LPD,
+			.has_cdclk_crawl = 1,
+			.has_modular_fia = 1,
+			.has_psr_hw_tracking = 0,
+		};
+		break;
 	case XE_DG2:
 		xe->info.display = (struct xe_device_display_info) {
 			XE_LPD,
 			.cpu_transcoder_mask =
 				BIT(TRANSCODER_A) | BIT(TRANSCODER_B) |
 				BIT(TRANSCODER_C) | BIT(TRANSCODER_D),
+			.has_cdclk_squash = 1,
 		};
 		break;
 	case XE_METEORLAKE:
-- 
2.34.1

