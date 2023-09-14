Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E101EEAA45
	for <intel-xe@archiver.kernel.org>; Thu, 14 Sep 2023 14:19:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFDA310E571;
	Thu, 14 Sep 2023 14:19:13 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A230410E298
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Sep 2023 14:19:09 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Date: Thu, 14 Sep 2023 16:18:53 +0200
Message-Id: <20230914141856.5647-2-dev@lankhorst.se>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230914141856.5647-1-dev@lankhorst.se>
References: <20230914141856.5647-1-dev@lankhorst.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CI 1/4] fixup! drm/xe/display: Implement display support
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
Cc: Maarten Lankhorst <dev@lankhorst.se>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add null check to make cursor magic work.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 3422942a9951..ac0d4474cd88 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -308,6 +308,7 @@ int intel_plane_pin_fb(struct intel_plane_state *plane_state)
 
 void intel_plane_unpin_fb(struct intel_plane_state *old_plane_state)
 {
-	__xe_unpin_fb_vma(old_plane_state->ggtt_vma);
+	if (old_plane_state->ggtt_vma)
+		__xe_unpin_fb_vma(old_plane_state->ggtt_vma);
 	old_plane_state->ggtt_vma = NULL;
 }
-- 
2.40.1

