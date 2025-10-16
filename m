Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D71EFCCD194
	for <intel-xe@archiver.kernel.org>; Thu, 16 Oct 2025 07:57:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FEB910E1C1;
	Thu, 16 Oct 2025 07:57:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="BtC9Y2n+";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26FE310E1C1
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Oct 2025 07:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1760601436;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CII+sl4XbFl4h6waLoiNpBqfCMPAO4UtKuaYneS8fQM=;
 b=BtC9Y2n+lLSilwemX9qu/+sAycqFAWzUm8xI3BDSjYprQ0ZTzA1Tdy8SqfFWiX8nWg2HGs
 gnoIIMPDdOvWyvVGq+3uQIJIAnywqY7jwBXF6mn1FCFI/G7kI6qk81lyKl+4YK5l/Npl8g
 9JBgeD8gjuSht512A31sgJZGb9GPHjU=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-682-MMzJBjEBN9-x7bnPbuKefQ-1; Thu,
 16 Oct 2025 03:57:15 -0400
X-MC-Unique: MMzJBjEBN9-x7bnPbuKefQ-1
X-Mimecast-MFC-AGG-ID: MMzJBjEBN9-x7bnPbuKefQ_1760601434
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id AB11718002DD; Thu, 16 Oct 2025 07:57:13 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.45.225.133])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 97B8830001A2; Thu, 16 Oct 2025 07:57:11 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>, Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH v3 2/2] drm/xe/display: Make panic support work on vram.
Date: Thu, 16 Oct 2025 09:52:31 +0200
Message-ID: <20251016075701.379023-3-jfalempe@redhat.com>
In-Reply-To: <20251016075701.379023-1-jfalempe@redhat.com>
References: <20251016075701.379023-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Ru36I3P8h1e5Enk0G4eEslcA05i-3Hhw7q2bz0KQNCM_1760601434
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
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

From: Maarten Lankhorst <dev@lankhorst.se>

Add a special path for VRAM using xe_res iterators to ensure a panic
screen is shown on VRAM as well.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
Acked-by: Jocelyn Falempe <jfalempe@redhat.com>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/xe/display/xe_panic.c | 50 +++++++++++++++++++--------
 1 file changed, 36 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_panic.c b/drivers/gpu/drm/xe/display/xe_panic.c
index f32b23338331..df663286092a 100644
--- a/drivers/gpu/drm/xe/display/xe_panic.c
+++ b/drivers/gpu/drm/xe/display/xe_panic.c
@@ -8,20 +8,23 @@
 #include "intel_fb.h"
 #include "intel_panic.h"
 #include "xe_bo.h"
+#include "xe_res_cursor.h"
 
 struct intel_panic {
-	struct page **pages;
+	struct xe_res_cursor res;
+	struct iosys_map vmap;
+
 	int page;
-	void *vaddr;
 };
 
 static void xe_panic_kunmap(struct intel_panic *panic)
 {
-	if (panic->vaddr) {
-		drm_clflush_virt_range(panic->vaddr, PAGE_SIZE);
-		kunmap_local(panic->vaddr);
-		panic->vaddr = NULL;
+	if (!panic->vmap.is_iomem && iosys_map_is_set(&panic->vmap)) {
+		drm_clflush_virt_range(panic->vmap.vaddr, PAGE_SIZE);
+		kunmap_local(panic->vmap.vaddr);
 	}
+	iosys_map_clear(&panic->vmap);
+	panic->page = -1;
 }
 
 /*
@@ -46,15 +49,29 @@ static void xe_panic_page_set_pixel(struct drm_scanout_buffer *sb, unsigned int
 	new_page = offset >> PAGE_SHIFT;
 	offset = offset % PAGE_SIZE;
 	if (new_page != panic->page) {
-		xe_panic_kunmap(panic);
+		if (xe_bo_is_vram(bo)) {
+			/* Display is always mapped on root tile */
+			struct xe_vram_region *vram = xe_bo_device(bo)->mem.vram;
+
+			if (panic->page < 0 || new_page < panic->page) {
+				xe_res_first(bo->ttm.resource, new_page * PAGE_SIZE,
+					     bo->ttm.base.size - new_page * PAGE_SIZE, &panic->res);
+			} else {
+				xe_res_next(&panic->res, PAGE_SIZE * (new_page - panic->page));
+			}
+			iosys_map_set_vaddr_iomem(&panic->vmap,
+						  vram->mapping + panic->res.start);
+		} else {
+			xe_panic_kunmap(panic);
+			iosys_map_set_vaddr(&panic->vmap,
+					    ttm_bo_kmap_try_from_panic(&bo->ttm,
+								       new_page));
+		}
 		panic->page = new_page;
-		panic->vaddr = ttm_bo_kmap_try_from_panic(&bo->ttm,
-							  panic->page);
-	}
-	if (panic->vaddr) {
-		u32 *pix = panic->vaddr + offset;
-		*pix = color;
 	}
+
+	if (iosys_map_is_set(&panic->vmap))
+		iosys_map_wr(&panic->vmap, offset, u32, color);
 }
 
 struct intel_panic *intel_panic_alloc(void)
@@ -68,6 +85,12 @@ struct intel_panic *intel_panic_alloc(void)
 
 int intel_panic_setup(struct intel_panic *panic, struct drm_scanout_buffer *sb)
 {
+	struct intel_framebuffer *fb = (struct intel_framebuffer *)sb->private;
+	struct xe_bo *bo = gem_to_xe_bo(intel_fb_bo(&fb->base));
+
+	if (xe_bo_is_vram(bo) && !xe_bo_is_visible_vram(bo))
+		return -ENODEV;
+
 	panic->page = -1;
 	sb->set_pixel = xe_panic_page_set_pixel;
 	return 0;
@@ -76,5 +99,4 @@ int intel_panic_setup(struct intel_panic *panic, struct drm_scanout_buffer *sb)
 void intel_panic_finish(struct intel_panic *panic)
 {
 	xe_panic_kunmap(panic);
-	panic->page = -1;
 }
-- 
2.51.0

