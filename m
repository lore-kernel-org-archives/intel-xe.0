Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3B87C44508
	for <intel-xe@archiver.kernel.org>; Fri, 10 Jul 2026 11:15:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51A1E10F86C;
	Fri, 10 Jul 2026 11:15:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="lq8mV1ON";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57F1910F85E;
 Fri, 10 Jul 2026 11:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1783682098;
 bh=3JVk7Ii6bOZK+y7mCUOxJrpfJz6aU21nRzuk0gjuZyM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lq8mV1ONDjuVe/t5TJWHZEoQjxtm+FwkOaFKxcy+ReQAwXm1yR39gymP+i8yhFoLB
 +po6x/zRI/4Flw5sOMRa9ZHpD6wreu0NtNZoFi3nQA3b7RjgP9Q/pP0KMiya2MMAWC
 VGGLi5R5uwWAPxKPkVIS5zdgafuU/nlWH58skG/L1k539dNHral76YKo5GCx+FNlvq
 g692NcBDrW5g2ffucAK0uQYM/UJoIrR/yqAh6E9pBORAfNaVP4ZL4+6Hkvs5oXAIqL
 DxiQ5LIqSXjKujbdTIV9j3V/h5LYjwY2rXh1/ZQFdNMwno25C52vQdtcfZUGaCVSyJ
 2iioXjL/TZ43w==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v2 04/11] drm/i915: Use drm_dbg_kms() for initial FB debugs
Date: Fri, 10 Jul 2026 13:15:31 +0200
Message-ID: <20260710111539.1274555-5-dev@lankhorst.se>
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

The initial FB stuff is ultimately about display stuff, so
use the proper display specific debug level for it.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Link: https://patch.msgid.link/20260511214122.8468-6-ville.syrjala@linux.intel.com
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/i915/i915_initial_plane.c     |  4 ++--
 drivers/gpu/drm/xe/display/xe_initial_plane.c | 12 ++++++------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_initial_plane.c b/drivers/gpu/drm/i915/i915_initial_plane.c
index 4902c07486640..08d94f3a1584a 100644
--- a/drivers/gpu/drm/i915/i915_initial_plane.c
+++ b/drivers/gpu/drm/i915/i915_initial_plane.c
@@ -69,8 +69,8 @@ initial_plane_phys(struct drm_i915_private *i915,
 		return false;
 	}
 
-	drm_dbg(&i915->drm, "Using dma_addr=%pa, based on initial plane programming\n",
-		&dma_addr);
+	drm_dbg_kms(&i915->drm, "Using dma_addr=%pa, based on initial plane programming\n",
+		    &dma_addr);
 
 	*out_phys_base = dma_addr - mem->region.start;
 	*out_mem = mem;
diff --git a/drivers/gpu/drm/xe/display/xe_initial_plane.c b/drivers/gpu/drm/xe/display/xe_initial_plane.c
index 02b46cc3b6df9..da04ee66252ad 100644
--- a/drivers/gpu/drm/xe/display/xe_initial_plane.c
+++ b/drivers/gpu/drm/xe/display/xe_initial_plane.c
@@ -60,9 +60,9 @@ initial_plane_bo(struct xe_device *xe,
 			return NULL;
 		}
 
-		drm_dbg(&xe->drm,
-			"Using phys_base=%pa, based on initial plane programming\n",
-			&phys_base);
+		drm_dbg_kms(&xe->drm,
+			    "Using phys_base=%pa, based on initial plane programming\n",
+			    &phys_base);
 	} else {
 		struct ttm_resource_manager *stolen = ttm_manager_type(&xe->ttm, XE_PL_STOLEN);
 
@@ -86,9 +86,9 @@ initial_plane_bo(struct xe_device *xe,
 	bo = xe_bo_create_pin_map_at_novm(xe, tile0, size, phys_base,
 					  ttm_bo_type_kernel, flags, 0, false);
 	if (IS_ERR(bo)) {
-		drm_dbg(&xe->drm,
-			"Failed to create bo phys_base=%pa size %u with flags %x: %li\n",
-			&phys_base, size, flags, PTR_ERR(bo));
+		drm_dbg_kms(&xe->drm,
+			    "Failed to create bo phys_base=%pa size %u with flags %x: %li\n",
+			    &phys_base, size, flags, PTR_ERR(bo));
 		return NULL;
 	}
 
-- 
2.53.0

