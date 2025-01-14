Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9D60C02183
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jan 2025 18:00:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 906E810E45E;
	Tue, 14 Jan 2025 18:00:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WsZ7kq7q";
	dkim-atps=neutral
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B26810E45E
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Jan 2025 18:00:10 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-2ef714374c0so54369a91.0
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Jan 2025 10:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736877550; x=1737482350; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fwZ4MR1apgzK20nR55LqndhLt0zlCVcF4ME80eCHHNY=;
 b=WsZ7kq7qKqKC1R5PGCSo2lJi8BRq8FLVKZiLZckwgcbLsE84EY1gOt5Abvczw3ihr/
 wee9T/+pN1tBWQNiLQ+qpFhGVCGfe5mI+IgBPFjhjaRDGvL4GAn4LC3LisjeJSL9RVv1
 ktcYQtFhJwQCmlh78j2hWYLMJgoaG6f+y4B5O68gzq7rgXNGDCmsR9q7K2OvmZKyxArV
 0eD6M8WTDdVP7LqzouBYOFbtnlMcXXv07/oFWoZnNogy5KvCRlNCpkXbs9tRfANo3jbP
 3yBq4tORpaXHm21YBEb31OvdUK9YZgaKP2uou/cNG6MFwQ/cOh1VnneV7VLsn4yeSZD1
 GG/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736877550; x=1737482350;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fwZ4MR1apgzK20nR55LqndhLt0zlCVcF4ME80eCHHNY=;
 b=pDUhG0LGdDkW8RIKZGSN5QNX0pXaGVK9qWeAZGrAJMdTzkg5uhxB0tPNyX2y38zoh2
 CJ1Z0jf1SAi35cR/S40bOXdlpNVjR3UydJeqOr8LneSET0Yq6qjKO8EV1q8w3fgHr3QL
 l5cas1T6gogki/mlBuXLidTpjl8Q1srFWzvTItZufVzaPeWQ37L+se79C6VIzR/5JV0N
 3eN73sAC0qfh0SFou9gg4Lah2SR6uZr5v8+WdMfu5U4+eGWAU9//lnILnZU26LQbM14Y
 vHhv/1WwSjGKGtuECiNJrzAYkTDAoBd4CnXSdUXut4J/oY4EY3fhsWm7BiwK4Ajq9cLO
 5Vaw==
X-Gm-Message-State: AOJu0YznuPszAGzaE7hbJjao2QJngZfDpyOLMQNeB4ZDFNdRgqGSqPBd
 PketjzAR8wKRBvWCsZYqkMTyHmgbaKNLLIUKSjiHQte2oIoBfDBvA6wFE4pi
X-Gm-Gg: ASbGncsfYAT9NXNemZIPxAwdw0TTIrn0IUPWWfLHL2JcEy46dx+8g81EdwGIq6od7ld
 3SG+biEn9qsrxMrUZngnxyHAvXZk5gT2fk/k1ky0Wxmb1rPuvmg3IjLVM47LyUZ8+TNiaXSkwoo
 us42NX3Xqhi/0XKLJlDIRWJzspf2nL7UOzwz+cJoGKAHdIXhrbL4zhcw4dfD+iiEB+nIsbUxwZe
 MVuc1KToLjir3j3Otijno4gbjW5oW5GHeBzMm6d6BbmSp6gXYaJkZxL75vY2w==
X-Google-Smtp-Source: AGHT+IEri1V66XIfWiPYY6qOA87ObWC53gvUGovhld3J9ByYIlSo+33G4SXu1ve5K7JazNWfaMIVuQ==
X-Received: by 2002:a17:90b:4ed0:b0:2ee:edae:775 with SMTP id
 98e67ed59e1d1-2f55831577dmr29744491a91.3.1736877549932; 
 Tue, 14 Jan 2025 09:59:09 -0800 (PST)
Received: from localhost ([192.55.54.41]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f54a289118sm13148685a91.13.2025.01.14.09.59.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2025 09:59:09 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: intel-xe@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH 1/2] drm/xe/display: Move dpt allocation to helper
Date: Tue, 14 Jan 2025 20:04:02 +0200
Message-ID: <20250114180403.896587-1-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.45.2
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

Simplify __xe_pin_fb_vma_dpt() by moving dpt allocation into helper.
This also fixes bug where dpt could have been allocated from system
memory when on dgfx.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c | 67 +++++++++++++++++---------
 1 file changed, 43 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 9fa51b84737c..c28885316986 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -77,6 +77,47 @@ write_dpt_remapped(struct xe_bo *bo, struct iosys_map *map, u32 *dpt_ofs,
 	*dpt_ofs = ALIGN(*dpt_ofs, 4096);
 }
 
+static struct xe_bo *xe_alloc_dpt_bo(struct xe_device *xe,
+				     struct xe_tile *tile0, u64 size,
+				     u64 physical_alignment)
+{
+	struct xe_bo *dpt;
+
+	/*
+	 * If DGFX: try VRAM0 only
+	 */
+	if (IS_DGFX(xe)) {
+		dpt = xe_bo_create_pin_map_at_aligned(xe, tile0, NULL,
+						      size, ~0ull,
+						      ttm_bo_type_kernel,
+						      XE_BO_FLAG_VRAM0 |
+						      XE_BO_FLAG_GGTT |
+						      XE_BO_FLAG_PAGETABLE,
+						      physical_alignment);
+	} else {
+		/*
+		 * For IGFX: first try STOLEN. on fail try SYSTEM.
+		 */
+		dpt = xe_bo_create_pin_map_at_aligned(xe, tile0, NULL,
+						      size, ~0ull,
+						      ttm_bo_type_kernel,
+						      XE_BO_FLAG_STOLEN |
+						      XE_BO_FLAG_GGTT |
+						      XE_BO_FLAG_PAGETABLE,
+						      physical_alignment);
+		if (IS_ERR(dpt)) {
+			dpt = xe_bo_create_pin_map_at_aligned(xe, tile0, NULL,
+							      size, ~0ull,
+							      ttm_bo_type_kernel,
+							      XE_BO_FLAG_SYSTEM |
+							      XE_BO_FLAG_GGTT |
+							      XE_BO_FLAG_PAGETABLE,
+							      physical_alignment);
+		}
+	}
+	return dpt;
+}
+
 static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
 			       const struct i915_gtt_view *view,
 			       struct i915_vma *vma,
@@ -99,30 +140,8 @@ static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
 		dpt_size = ALIGN(intel_rotation_info_size(&view->rotated) * 8,
 				 XE_PAGE_SIZE);
 
-	if (IS_DGFX(xe))
-		dpt = xe_bo_create_pin_map_at_aligned(xe, tile0, NULL,
-						      dpt_size, ~0ull,
-						      ttm_bo_type_kernel,
-						      XE_BO_FLAG_VRAM0 |
-						      XE_BO_FLAG_GGTT |
-						      XE_BO_FLAG_PAGETABLE,
-						      physical_alignment);
-	else
-		dpt = xe_bo_create_pin_map_at_aligned(xe, tile0, NULL,
-						      dpt_size,  ~0ull,
-						      ttm_bo_type_kernel,
-						      XE_BO_FLAG_STOLEN |
-						      XE_BO_FLAG_GGTT |
-						      XE_BO_FLAG_PAGETABLE,
-						      physical_alignment);
-	if (IS_ERR(dpt))
-		dpt = xe_bo_create_pin_map_at_aligned(xe, tile0, NULL,
-						      dpt_size,  ~0ull,
-						      ttm_bo_type_kernel,
-						      XE_BO_FLAG_SYSTEM |
-						      XE_BO_FLAG_GGTT |
-						      XE_BO_FLAG_PAGETABLE,
-						      physical_alignment);
+	dpt = xe_alloc_dpt_bo(xe, tile0, dpt_size, physical_alignment);
+
 	if (IS_ERR(dpt))
 		return PTR_ERR(dpt);
 
-- 
2.45.2

