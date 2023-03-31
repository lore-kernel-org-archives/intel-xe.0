Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2228FC761AF
	for <intel-xe@archiver.kernel.org>; Fri, 31 Mar 2023 10:24:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEE3110F1C9;
	Fri, 31 Mar 2023 10:24:33 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7753C10F1C9
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Mar 2023 10:24:28 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 31 Mar 2023 12:24:17 +0200
Message-Id: <20230331102419.521392-5-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230331102419.521392-1-maarten.lankhorst@linux.intel.com>
References: <20230331102419.521392-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 4/6] drm/xe: Fix XE_LPDP and meteorlake display
 info.
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

MTL has modular FIA, and LPDP also has FBC on pipe B.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_display.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
index e9b3997c4028..64e65b29d8de 100644
--- a/drivers/gpu/drm/xe/xe_display.c
+++ b/drivers/gpu/drm/xe/xe_display.c
@@ -475,8 +475,8 @@ __diag_ignore_all("-Woverride-init", "Allow field overrides in table");
 	XE_LPD,								\
 	.ver = 14,							\
 	.has_cdclk_crawl = 1,						\
-	.has_cdclk_squash = 1
-
+	.has_cdclk_squash = 1,						\
+	.fbc_mask = BIT(INTEL_FBC_A) | BIT(INTEL_FBC_B)
 
 void xe_display_info_init(struct xe_device *xe)
 {
@@ -513,7 +513,10 @@ void xe_display_info_init(struct xe_device *xe)
 		};
 		break;
 	case XE_METEORLAKE:
-		xe->info.display = (struct xe_device_display_info) { XE_LPDP };
+		xe->info.display = (struct xe_device_display_info) {
+			XE_LPDP,
+			.has_modular_fia = 1,
+		};
 		break;
 	default:
 		drm_dbg(&xe->drm, "No display IP, skipping\n");
-- 
2.34.1

