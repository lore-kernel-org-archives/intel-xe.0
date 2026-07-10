Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B0C2C44501
	for <intel-xe@archiver.kernel.org>; Fri, 10 Jul 2026 11:15:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC18110F87B;
	Fri, 10 Jul 2026 11:15:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="ZbkrlV/h";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5359710F87B;
 Fri, 10 Jul 2026 11:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1783682102;
 bh=q+3zmwocnbtU+hrSwY79ROUqACgOGGFEu709GCKpwCg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZbkrlV/hecA94hCNo6qXPfUDdtrChLoTGdWGZrIjfgurodyUcOWgzctYp41yTh4hQ
 NEU9kWqyo4cUybSkLgkMM8Udl3cLrlwg6Htqhrd2xrVn1Nu4ZYHan8DzmuC7/T7W1v
 bxSbh2ilP68sJf+ipl+D9Z347I2LBgjE10HHTovjJ5OJSHbVoFj/fPxvoFK0QbQW7s
 Z/h2ZCACNwayQjM1cFF2Q5jd5qnoW6ZcFMk/iqVs8xYNJCbMZ+HcZD1SXVn3pk19Tn
 qfccR242ymCQ6R5XmTrK8TF8sJbx8ZrYYPJfzOuw8JL1SpVDTIF+bSLQJvQYFeeLeU
 XXiRWxTJkwQWw==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v2 07/11] drm/xe: Abstract the initial FB PTE checks a bit
Date: Fri, 10 Jul 2026 13:15:34 +0200
Message-ID: <20260710111539.1274555-8-dev@lankhorst.se>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260710111539.1274555-1-dev@lankhorst.se>
References: <20260710111539.1274555-1-dev@lankhorst.se>
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Add a few helpers that allow us to abstract the xe initial FB PTE
check a bit. Still very ad-hoc compared to the nicely abstracted
i915 counterpart, but whatever.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Link: https://patch.msgid.link/20260511214122.8468-10-ville.syrjala@linux.intel.com
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/display/xe_initial_plane.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_initial_plane.c b/drivers/gpu/drm/xe/display/xe_initial_plane.c
index a62e5394c3f7d..1e1962c955890 100644
--- a/drivers/gpu/drm/xe/display/xe_initial_plane.c
+++ b/drivers/gpu/drm/xe/display/xe_initial_plane.c
@@ -19,8 +19,19 @@
 #include "xe_fb_pin.h"
 #include "xe_ggtt.h"
 #include "xe_mmio.h"
+#include "xe_ttm_stolen_mgr.h"
 #include "xe_vram_types.h"
 
+static bool is_pte_local(u64 pte)
+{
+	return pte & XE_GGTT_PTE_DM;
+}
+
+static bool need_pte_local(struct xe_device *xe)
+{
+	return IS_DGFX(xe);
+}
+
 static struct xe_bo *
 initial_plane_bo(struct xe_device *xe,
 		 struct intel_initial_plane_config *plane_config)
@@ -44,13 +55,13 @@ initial_plane_bo(struct xe_device *xe,
 	if (IS_DGFX(xe)) {
 		u64 pte = xe_ggtt_read_pte(tile0->mem.ggtt, base);
 
-		if (!(pte & XE_GGTT_PTE_DM)) {
-			drm_err(&xe->drm,
-				"Initial plane programming missing DM bit\n");
+		if (is_pte_local(pte) != need_pte_local(xe)) {
+			drm_err(&xe->drm, "Initial plane PTE has bad local memory bit\n");
 			return NULL;
 		}
 
 		phys_base = pte & ~(page_size - 1);
+
 		flags |= XE_BO_FLAG_VRAM0;
 
 		/*
-- 
2.53.0

