Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40591CDB47E
	for <intel-xe@archiver.kernel.org>; Fri, 13 Oct 2023 15:15:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06D5E10E17D;
	Fri, 13 Oct 2023 15:15:00 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3705510E17D
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Oct 2023 15:14:59 +0000 (UTC)
From: maarten.lankhorst@linux.intel.com
To: intel-xe@lists.freedesktop.org
Date: Fri, 13 Oct 2023 17:14:52 +0200
Message-Id: <20231013151452.52457-1-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/display: Handle NULL ggtt_vma unpinning.
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

From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Makes cursor patches work on xe. Probably best to commit to xe as well.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 2c36e5032433..48d394e152d8 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -324,6 +324,7 @@ int intel_plane_pin_fb(struct intel_plane_state *plane_state)
 
 void intel_plane_unpin_fb(struct intel_plane_state *old_plane_state)
 {
-	__xe_unpin_fb_vma(old_plane_state->ggtt_vma);
+	if (old_plane_state->ggtt_vma)
+		__xe_unpin_fb_vma(old_plane_state->ggtt_vma);
 	old_plane_state->ggtt_vma = NULL;
 }
-- 
2.40.1

