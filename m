Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84023C4450A
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jul 2026 16:27:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3BFB10EDF5;
	Tue, 14 Jul 2026 16:27:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="oUP+dnEZ";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4CAC10E466;
 Tue, 14 Jul 2026 16:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1784046459;
 bh=Uh1I9AQT/zD14G3G7nTtXol2UYt5hVDXgBO6hfs7sRA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oUP+dnEZxOx/X69YpfY7r7dKnoSfvIMxqFmQ9QhumN4/V63CsntDuKZcp4Lip8fdz
 ieZw2hN4c2D6+78aTn/SxmrtG8v78EqRSpPER2spqqNkZZRD10n98xbxS351GIFN6S
 1XvuudfP5qtmcPaFXEhCCRjeYJnKDM0trHoE6gIO6IUNSgCTr76Diyodmr2YjRqLy6
 /uJBGw0368DkvJC24fHXBS2nV1rNbZvloFUX49lxP1STfIU6woqcWAqKyypU5myrxs
 FPaRBqtY+n4J71W9FwzYwgSPluOQQTOsXqSOo8XSP3jEgbio0nW/Ip0lIwUuxhL/Lm
 a8lY+EQkBmvPQ==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
	Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH 4/7] drm/xe/display: Reserve the original GGTT space before
 creating a bo
Date: Tue, 14 Jul 2026 18:28:21 +0200
Message-ID: <20260714162824.2063637-5-dev@lankhorst.se>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260714162824.2063637-1-dev@lankhorst.se>
References: <20260714162824.2063637-1-dev@lankhorst.se>
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

Annotate the original area of the framebuffer as reserved in the GGTT
before creating a new GGTT entry. This allows us to remove the
range restrictions of GGTT in xe_bo_create_pin_map_at_novm().

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/display/xe_initial_plane.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/xe/display/xe_initial_plane.c b/drivers/gpu/drm/xe/display/xe_initial_plane.c
index 0f86b73036d03..8127384fa5bdf 100644
--- a/drivers/gpu/drm/xe/display/xe_initial_plane.c
+++ b/drivers/gpu/drm/xe/display/xe_initial_plane.c
@@ -46,6 +46,7 @@ initial_plane_bo(struct xe_device *xe,
 	resource_size_t phys_base;
 	u32 base, size, flags;
 	u64 page_size = xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K;
+	struct xe_ggtt_node *original_ggtt_node;
 
 	if (plane_config->size == 0)
 		return NULL;
@@ -111,8 +112,21 @@ initial_plane_bo(struct xe_device *xe,
 		}
 	}
 
+	if (base + size <= xe_ggtt_start(tile0->mem.ggtt))
+		original_ggtt_node = NULL;
+	else if (base < xe_ggtt_start(tile0->mem.ggtt))
+		original_ggtt_node = xe_ggtt_insert_node_at(tile0->mem.ggtt, size - xe_ggtt_start(tile0->mem.ggtt), page_size, 0, base + size);
+	else
+		original_ggtt_node = xe_ggtt_insert_node_at(tile0->mem.ggtt, size, page_size, base, base + size);
+
+	if (IS_ERR(original_ggtt_node))
+		return NULL;
+
 	bo = xe_bo_create_pin_map_at_novm(xe, tile0, size, phys_base,
 					  ttm_bo_type_kernel, flags, 0, false);
+	if (original_ggtt_node)
+		xe_ggtt_node_remove_noclear(original_ggtt_node);
+
 	if (IS_ERR(bo)) {
 		drm_dbg_kms(&xe->drm,
 			    "Failed to create bo phys_base=%pa size %u with flags %x: %li\n",
-- 
2.53.0

