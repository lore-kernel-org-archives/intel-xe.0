Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F590C4450B
	for <intel-xe@archiver.kernel.org>; Fri, 10 Jul 2026 11:15:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 638A110F87A;
	Fri, 10 Jul 2026 11:15:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="hmOcIZGi";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB32410F875;
 Fri, 10 Jul 2026 11:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1783682099;
 bh=8OOecsLalkhMhzDjTmPYJsSQ2MSjP7aUquCNY+5c6dA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hmOcIZGiOhblnrRrRBHlQns6Y0NjAMUbiQUwmhPj2N3Le3gaPzziUqfa4qR73v4dS
 8hypL4H8xg2+zWf7xDt+yVhjtk+T0WSjcDS/Yg9f7FLs4pJG8yhuaSPKIYmIsU6q4j
 FlKJCYN0xjf7CmIyZ4387fhLLuV+nkvl0aG8qPo6X3nqrc6Wd6yc5KTijHpXBjnaMe
 M8valw5/Ie22UBvuQiiLS0o4rn/0JzhltqB2Gb3ZP6Scn3m8SLl38pZT/1oEO3fNXc
 zhHVS1dXXkGwGVAbQZp4quNWszIWyh8Woo00Ct/GKNd93B7/N9uXCqjU0Xe1fxmwMk
 WJlGqhvY0NC8g==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v2 05/11] drm/xe: Do the initial FB size alignment earlier
Date: Fri, 10 Jul 2026 13:15:32 +0200
Message-ID: <20260710111539.1274555-6-dev@lankhorst.se>
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

For some reason we've split the alignment of 'base' vs. 'size'
to live on separate sides of the xe initial plane PTE readout.
There's no reason for this split, so make things less confusing
by aligning both at the same time.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Link: https://patch.msgid.link/20260511214122.8468-7-ville.syrjala@linux.intel.com
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/display/xe_initial_plane.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_initial_plane.c b/drivers/gpu/drm/xe/display/xe_initial_plane.c
index da04ee66252ad..feb979cca12af 100644
--- a/drivers/gpu/drm/xe/display/xe_initial_plane.c
+++ b/drivers/gpu/drm/xe/display/xe_initial_plane.c
@@ -37,6 +37,10 @@ initial_plane_bo(struct xe_device *xe,
 	flags = XE_BO_FLAG_FORCE_WC | XE_BO_FLAG_GGTT;
 
 	base = round_down(plane_config->base, page_size);
+	size = round_up(plane_config->base + plane_config->size,
+			page_size);
+	size -= base;
+
 	if (IS_DGFX(xe)) {
 		u64 pte = xe_ggtt_read_pte(tile0->mem.ggtt, base);
 
@@ -79,10 +83,6 @@ initial_plane_bo(struct xe_device *xe,
 		}
 	}
 
-	size = round_up(plane_config->base + plane_config->size,
-			page_size);
-	size -= base;
-
 	bo = xe_bo_create_pin_map_at_novm(xe, tile0, size, phys_base,
 					  ttm_bo_type_kernel, flags, 0, false);
 	if (IS_ERR(bo)) {
-- 
2.53.0

