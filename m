Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A5FDC52D6F
	for <intel-xe@archiver.kernel.org>; Wed, 21 Aug 2024 20:56:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39E1B10E460;
	Wed, 21 Aug 2024 20:56:48 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27FED10E413
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Aug 2024 20:56:41 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Matthew Auld <matthew.auld@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH v2 2/3] drm/xe: Use 64K pages for scanout buffers for
 Battlemage
Date: Wed, 21 Aug 2024 22:56:36 +0200
Message-ID: <20240821205637.552424-3-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240821205637.552424-1-maarten.lankhorst@linux.intel.com>
References: <20240821205637.552424-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

Set BMG platform to use 64K pages for display.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 3c34b032ebf41..701a3f7a338c2 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -180,6 +180,13 @@ static const struct xe_graphics_desc graphics_xe2 = {
 	XE2_GFX_FEATURES,
 };
 
+static const struct xe_graphics_desc graphics_bmg = {
+	.name = "Xe2_BMG",
+
+	XE2_GFX_FEATURES,
+	.vram_flags = XE_VRAM_FLAGS_DISPLAY_NEED64K_CCS,
+};
+
 static const struct xe_media_desc media_xem = {
 	.name = "Xe_M",
 	.ver = 12,
@@ -361,7 +368,7 @@ static const struct gmdid_map graphics_ip_map[] = {
 	{ 1270, &graphics_xelpg },
 	{ 1271, &graphics_xelpg },
 	{ 1274, &graphics_xelpg },	/* Xe_LPG+ */
-	{ 2001, &graphics_xe2 },
+	{ 2001, &graphics_bmg },
 	{ 2004, &graphics_xe2 },
 };
 
-- 
2.45.2

