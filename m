Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53817C3DA4A
	for <intel-xe@archiver.kernel.org>; Mon, 19 Aug 2024 13:31:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21C8D10E270;
	Mon, 19 Aug 2024 13:31:43 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BDD210E26B
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Aug 2024 13:31:40 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 stable@vger.kernel.org
Subject: [PATCH v2 1/3] drm/xe: Read out rawclk_freq for display
Date: Mon, 19 Aug 2024 15:31:35 +0200
Message-ID: <20240819133138.147511-2-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240819133138.147511-1-maarten.lankhorst@linux.intel.com>
References: <20240819133138.147511-1-maarten.lankhorst@linux.intel.com>
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

Failing to read out rawclk makes it impossible to read out backlight,
which results in backlight not working when the backlight is off during
boot, or when reloading the module.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Fixes: 44e694958b95 ("drm/xe/display: Implement display support")
Cc: <stable@vger.kernel.org> # v6.8+
---
 drivers/gpu/drm/xe/display/xe_display.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index 30dfdac9f6fa9..79add15c6c4c7 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -159,6 +159,9 @@ int xe_display_init_noirq(struct xe_device *xe)
 
 	intel_display_device_info_runtime_init(xe);
 
+	RUNTIME_INFO(xe)->rawclk_freq = intel_read_rawclk(xe);
+	drm_dbg(&xe->drm, "rawclk rate: %d kHz\n", RUNTIME_INFO(xe)->rawclk_freq);
+
 	err = intel_display_driver_probe_noirq(xe);
 	if (err) {
 		intel_opregion_cleanup(display);
-- 
2.45.2

