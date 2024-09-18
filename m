Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42C21C35FE7
	for <intel-xe@archiver.kernel.org>; Wed, 18 Sep 2024 05:40:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BECA10E52D;
	Wed, 18 Sep 2024 05:40:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="n4EBKzvc";
	dkim-atps=neutral
Received: from mail02.habana.ai (habanamailrelay02.habana.ai [62.90.112.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFA9B10E529
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Sep 2024 05:39:57 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1726637991; bh=dsR5CEez5usTluNwkdvQQaHSNDtp9zQitV7Ds5wsIso=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=n4EBKzvcBkF/tf5r/oP2yNo3ubXXRYJoZiDtudT8AVwNc8X3s5i0MeQewKuw62XZH
 7/rB7d8jzaKL1CiZ7BtxOvK9cIOTre2NM8zVU/sbY0VejVx04fE4uP+W9dAu5vhTp7
 KLKlXxh246KPWS1M7ftIjeypSB1Gjk/VoRgIeD9N+GW5n9eRaFh0Taq9Aeq+65FVYI
 47u4V0F2HxgvsWjL/9UPoyw8uoUrNXe4RvPswe9HBUFhP4qG+5hNbaWKaGcEB9iJaq
 70uv/Y/fgzXGi8w8bPGBlr7useXB1x83EwHGIaEYshs7qsvS90Ua3flkcJpWKfi3I1
 VHa+ZzsoOVAGw==
Received: from illevi-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by illevi-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP
 id 48I5di4F1331834; Wed, 18 Sep 2024 08:39:45 +0300
From: Ilia Levi <illevi@habana.ai>
To: intel-xe@lists.freedesktop.org
Cc: ilia.levi@intel.com, michal.wajdeczko@intel.com, jonathan.cavitt@intel.com,
 koby.elbaz@intel.com, yaron.avizrat@intel.com
Subject: [PATCH v6 1/5] drm/xe: Introduce dedicated config for memirq debug
Date: Wed, 18 Sep 2024 08:39:38 +0300
Message-ID: <20240918053942.1331811-2-illevi@habana.ai>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240918053942.1331811-1-illevi@habana.ai>
References: <20240918053942.1331811-1-illevi@habana.ai>
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

From: Ilia Levi <ilia.levi@intel.com>

Separate config for debugging memory based interrupts (memirq)
infrastructure.

Signed-off-by: Ilia Levi <ilia.levi@intel.com>
---
 drivers/gpu/drm/xe/Kconfig.debug | 12 ++++++++++++
 drivers/gpu/drm/xe/xe_memirq.c   | 29 +++++++++++++++++++----------
 2 files changed, 31 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/Kconfig.debug b/drivers/gpu/drm/xe/Kconfig.debug
index bc177368af6c..2de0de41b8dd 100644
--- a/drivers/gpu/drm/xe/Kconfig.debug
+++ b/drivers/gpu/drm/xe/Kconfig.debug
@@ -40,9 +40,21 @@ config DRM_XE_DEBUG_VM
 
 	  If in doubt, say "N".
 
+config DRM_XE_DEBUG_MEMIRQ
+	bool "Enable extra memirq debugging"
+	default n
+	help
+	  Choose this option to enable additional debugging info for
+	  memory based interrupts.
+
+	  Recommended for driver developers only.
+
+	  If in doubt, say "N".
+
 config DRM_XE_DEBUG_SRIOV
 	bool "Enable extra SR-IOV debugging"
 	default n
+	select DRM_XE_DEBUG_MEMIRQ
 	help
 	  Enable extra SR-IOV debugging info.
 
diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
index 95b6e9d7b7db..ecb4870c3356 100644
--- a/drivers/gpu/drm/xe/xe_memirq.c
+++ b/drivers/gpu/drm/xe/xe_memirq.c
@@ -20,10 +20,21 @@
 #include "xe_map.h"
 #include "xe_memirq.h"
 #include "xe_sriov.h"
-#include "xe_sriov_printk.h"
 
 #define memirq_assert(m, condition)	xe_tile_assert(memirq_to_tile(m), condition)
-#define memirq_debug(m, msg...)		xe_sriov_dbg_verbose(memirq_to_xe(m), "MEMIRQ: " msg)
+#define memirq_printk(m, _level, _fmt, ...)			\
+	drm_##_level(&memirq_to_xe(m)->drm, "MEMIRQ%u: " _fmt,	\
+		     memirq_to_tile(m)->id, ##__VA_ARGS__)
+
+#ifdef CONFIG_DRM_XE_DEBUG_MEMIRQ
+#define memirq_debug(m, _fmt, ...)	memirq_printk(m, dbg, _fmt, ##__VA_ARGS__)
+#else
+#define memirq_debug(...)
+#endif
+
+#define memirq_err(m, _fmt, ...)	memirq_printk(m, err, _fmt, ##__VA_ARGS__)
+#define memirq_err_ratelimited(m, _fmt, ...)	\
+	memirq_printk(m, err_ratelimited, _fmt, ##__VA_ARGS__)
 
 static struct xe_tile *memirq_to_tile(struct xe_memirq *memirq)
 {
@@ -157,8 +168,7 @@ static int memirq_alloc_pages(struct xe_memirq *memirq)
 	return drmm_add_action_or_reset(&xe->drm, __release_xe_bo, memirq->bo);
 
 out:
-	xe_sriov_err(memirq_to_xe(memirq),
-		     "Failed to allocate memirq page (%pe)\n", ERR_PTR(err));
+	memirq_err(memirq, "Failed to allocate memirq page (%pe)\n", ERR_PTR(err));
 	return err;
 }
 
@@ -299,9 +309,8 @@ int xe_memirq_init_guc(struct xe_memirq *memirq, struct xe_guc *guc)
 	return 0;
 
 failed:
-	xe_sriov_err(memirq_to_xe(memirq),
-		     "Failed to setup report pages in %s (%pe)\n",
-		     guc_name(guc), ERR_PTR(err));
+	memirq_err(memirq, "Failed to setup report pages in %s (%pe)\n",
+		   guc_name(guc), ERR_PTR(err));
 	return err;
 }
 
@@ -349,9 +358,9 @@ static bool memirq_received(struct xe_memirq *memirq, struct iosys_map *vector,
 	value = iosys_map_rd(vector, offset, u8);
 	if (value) {
 		if (value != 0xff)
-			xe_sriov_err_ratelimited(memirq_to_xe(memirq),
-						 "Unexpected memirq value %#x from %s at %u\n",
-						 value, name, offset);
+			memirq_err_ratelimited(memirq,
+					       "Unexpected memirq value %#x from %s at %u\n",
+					       value, name, offset);
 		iosys_map_wr(vector, offset, u8, 0x00);
 	}
 
-- 
2.43.2

