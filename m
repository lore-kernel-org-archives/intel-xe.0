Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63C3FC64ED6
	for <intel-xe@archiver.kernel.org>; Wed,  1 Mar 2023 10:26:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EFA710E203;
	Wed,  1 Mar 2023 10:26:12 +0000 (UTC)
X-Greylist: delayed 86913 seconds by postgrey-1.36 at gabe;
 Wed, 01 Mar 2023 10:26:09 UTC
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1D6310E203
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Mar 2023 10:26:09 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  1 Mar 2023 11:26:03 +0100
Message-Id: <20230301102603.113614-1-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Add missing cursor offsets
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
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Missed this when implementing display support. This allows the cursor
to work properly on any pipe other than A.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/xe/regs/xe_regs.h | 4 ++++
 drivers/gpu/drm/xe/xe_pci.c       | 6 ++++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
index 2e7fbdedb5eb..c1c829c23df1 100644
--- a/drivers/gpu/drm/xe/regs/xe_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_regs.h
@@ -69,6 +69,10 @@
 #define PIPE_D_OFFSET				0x73000
 #define PIPE_DSI0_OFFSET			0x7b000
 #define PIPE_DSI1_OFFSET			0x7b800
+#define CURSOR_A_OFFSET				0x70080
+#define CURSOR_B_OFFSET				0x71080
+#define CURSOR_C_OFFSET				0x72080
+#define CURSOR_D_OFFSET				0x73080
 
 #define SOFTWARE_FLAGS_SPR33			_MMIO(0x4f084)
 
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 11dc0de66101..a0802c288a94 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -95,6 +95,12 @@ struct xe_device_desc {
 			[TRANSCODER_DSI_0] = PIPE_DSI0_OFFSET, \
 			[TRANSCODER_DSI_1] = PIPE_DSI1_OFFSET, \
 		}, \
+		.cursor_offsets = { \
+			[PIPE_A] = CURSOR_A_OFFSET, \
+			[PIPE_B] = CURSOR_B_OFFSET, \
+			[PIPE_C] = CURSOR_C_OFFSET, \
+			[PIPE_D] = CURSOR_D_OFFSET, \
+		}, \
 		.trans_offsets = { \
 			[TRANSCODER_A] = TRANSCODER_A_OFFSET, \
 			[TRANSCODER_B] = TRANSCODER_B_OFFSET, \
-- 
2.34.1

