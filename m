Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40670E8FDC9
	for <intel-xe@archiver.kernel.org>; Wed,  4 Oct 2023 03:10:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B77B10E346;
	Wed,  4 Oct 2023 03:10:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2793010E323;
 Wed,  4 Oct 2023 03:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696389007; x=1727925007;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fXo2Xdmte4AwFEzXLA+1DpKhrdL7DB15YWhBwLijEb4=;
 b=IL9Wi32ZqhgpF6rMyGYM3hpeNSTwCpDIMqI0e+ADw8LmNMTpLdysvFHW
 rLgCpnhm2cYAT+jGLr6351Pp5hshf7HQYtO4bxpv40XfeKMSYHvPBO7ZL
 ezF21SD/kcuTDJFfbaB2UAjq+r+rSuOBzXK+ar316+Sq9cFqqz/TWchMs
 5NG1T5uOAqwHBfnbRZ8fgIUBmwyH1noknj2bWKqGFCoLcMtSOn8TgJmnw
 Pz0fTCjiUHuZIHK12yJarEMSQ0cqQ8txQNxEQX1pK1wYle6fpX2m9I96m
 8H8b3bky2I3GouAcV/eKWQbSHJztulA3JNUr57jXqX6De78CbAShN+57+ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="363308402"
X-IronPort-AV: E=Sophos;i="6.03,199,1694761200"; d="scan'208";a="363308402"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 20:10:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="894760378"
X-IronPort-AV: E=Sophos;i="6.03,199,1694761200"; d="scan'208";a="894760378"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 20:08:39 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  3 Oct 2023 20:10:16 -0700
Message-Id: <20231004031023.3444455-7-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231004031023.3444455-1-lucas.demarchi@intel.com>
References: <20231004031023.3444455-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH i-g-t v2 06/13] lib: Fork gen9_media.h
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Fork gen9_media.h from gen8_media.h with the gen9 definitions that were
in that header and with a new struct gen9_surface_state. Although the
surface state is the same as for gen8, the meaning of at least mocs is
different. As a follow up the mocs definition will change for gen9 and
above.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 docs/reference/igt-gpu-tools/meson.build |   1 +
 lib/gen8_media.h                         |  14 ---
 lib/gen9_media.h                         | 143 +++++++++++++++++++++++
 lib/gpu_cmds.c                           |   4 +-
 lib/gpu_cmds.h                           |   1 +
 lib/intel_compute.c                      |   1 +
 lib/media_fill.c                         |   1 +
 7 files changed, 149 insertions(+), 16 deletions(-)
 create mode 100644 lib/gen9_media.h

diff --git a/docs/reference/igt-gpu-tools/meson.build b/docs/reference/igt-gpu-tools/meson.build
index 513385b4b..d5db95e40 100644
--- a/docs/reference/igt-gpu-tools/meson.build
+++ b/docs/reference/igt-gpu-tools/meson.build
@@ -6,6 +6,7 @@ ignore_headers = [
 	'gen7_render.h',
 	'gen8_media.h',
 	'gen8_render.h',
+	'gen9_media.h',
 	'gpgpu_fill.h',
 	'i830_reg.h',
 	'i915_3d.h',
diff --git a/lib/gen8_media.h b/lib/gen8_media.h
index 07ea2ac03..c1807629e 100644
--- a/lib/gen8_media.h
+++ b/lib/gen8_media.h
@@ -207,18 +207,4 @@ struct gen8_surface_state
 	} ss15;
 };
 
-
-#define GEN9_PIPELINE_SELECTION_MASK		(3 << 8)
-
-/*  If enabled, it will force awake media enginee and the following instructions
- *  will require that the media enginee is awake.
- */
-#define GEN9_FORCE_MEDIA_AWAKE_DISABLE		(0 << 5)
-#define GEN9_FORCE_MEDIA_AWAKE_ENABLE		(1 << 5)
-#define GEN9_FORCE_MEDIA_AWAKE_MASK		(1 << 13)
-
-#define GEN9_SAMPLER_DOP_GATE_DISABLE		(0 << 4)
-#define GEN9_SAMPLER_DOP_GATE_ENABLE		(1 << 4)
-#define GEN9_SAMPLER_DOP_GATE_MASK		(1 << 12)
-
 #endif /* GEN8_MEDIA_H */
diff --git a/lib/gen9_media.h b/lib/gen9_media.h
new file mode 100644
index 000000000..414001dfd
--- /dev/null
+++ b/lib/gen9_media.h
@@ -0,0 +1,143 @@
+#ifndef GEN9_MEDIA_H
+#define GEN9_MEDIA_H
+
+#include <stdint.h>
+#include "surfaceformat.h"
+#include "gen4_render.h"
+
+#define GEN9_PIPELINE_SELECTION_MASK		(3 << 8)
+
+/*  If enabled, it will force awake media enginee and the following instructions
+ *  will require that the media enginee is awake.
+ */
+#define GEN9_FORCE_MEDIA_AWAKE_DISABLE		(0 << 5)
+#define GEN9_FORCE_MEDIA_AWAKE_ENABLE		(1 << 5)
+#define GEN9_FORCE_MEDIA_AWAKE_MASK		(1 << 13)
+
+#define GEN9_SAMPLER_DOP_GATE_DISABLE		(0 << 4)
+#define GEN9_SAMPLER_DOP_GATE_ENABLE		(1 << 4)
+#define GEN9_SAMPLER_DOP_GATE_MASK		(1 << 12)
+
+struct gen9_surface_state
+{
+	struct {
+		uint32_t cube_pos_z:1;
+		uint32_t cube_neg_z:1;
+		uint32_t cube_pos_y:1;
+		uint32_t cube_neg_y:1;
+		uint32_t cube_pos_x:1;
+		uint32_t cube_neg_x:1;
+		uint32_t media_boundary_pixel_mode:2;
+		uint32_t render_cache_read_write:1;
+		uint32_t sampler_l2_bypass_disable:1;
+		uint32_t vert_line_stride_ofs:1;
+		uint32_t vert_line_stride:1;
+		uint32_t tiled_mode:2;
+		uint32_t horizontal_alignment:2;
+		uint32_t vertical_alignment:2;
+		uint32_t surface_format:9;     /**< BRW_SURFACEFORMAT_x */
+		uint32_t pad0:1;
+		uint32_t is_array:1;
+		uint32_t surface_type:3;       /**< BRW_SURFACE_1D/2D/3D/CUBE */
+	} ss0;
+
+	struct {
+		uint32_t qpitch:15;
+		uint32_t pad1:4;
+		uint32_t base_mip_level:5;
+		uint32_t memory_object_control:7;
+		uint32_t pad0:1;
+	} ss1;
+
+	struct {
+		uint32_t width:14;
+		uint32_t pad1:2;
+		uint32_t height:14;
+		uint32_t pad0:2;
+	} ss2;
+
+	struct {
+		uint32_t pitch:18;
+		uint32_t pad:3;
+		uint32_t depth:11;
+	} ss3;
+
+	struct {
+		uint32_t multisample_position_palette_index:3;
+		uint32_t num_multisamples:3;
+		uint32_t multisampled_surface_storage_format:1;
+		uint32_t render_target_view_extent:11;
+		uint32_t min_array_elt:11;
+		uint32_t rotation:2;
+		uint32_t force_ncmp_reduce_type:1;
+	} ss4;
+
+	struct {
+		uint32_t mip_count:4;
+		uint32_t min_lod:4;
+		uint32_t pad3:6;
+		uint32_t coherency_type:1;
+		uint32_t pad2:5;
+		uint32_t ewa_disable_for_cube:1;
+		uint32_t y_offset:3;
+		uint32_t pad0:1;
+		uint32_t x_offset:7;
+	} ss5;
+
+	struct {
+		uint32_t pad; /* Multisample Control Surface stuff */
+	} ss6;
+
+	struct {
+		uint32_t resource_min_lod:12;
+
+		/* Only on Haswell */
+		uint32_t pad0:4;
+		uint32_t shader_chanel_select_a:3;
+		uint32_t shader_chanel_select_b:3;
+		uint32_t shader_chanel_select_g:3;
+		uint32_t shader_chanel_select_r:3;
+
+		uint32_t alpha_clear_color:1;
+		uint32_t blue_clear_color:1;
+		uint32_t green_clear_color:1;
+		uint32_t red_clear_color:1;
+	} ss7;
+
+	struct {
+		uint32_t base_addr;
+	} ss8;
+
+	struct {
+		uint32_t base_addr_hi:16;
+		uint32_t pad0:16;
+	} ss9;
+
+	struct {
+		uint32_t pad0:12;
+		uint32_t aux_base_addr:20;
+	} ss10;
+
+	struct {
+		uint32_t aux_base_addr_hi:16;
+		uint32_t pad:16;
+	} ss11;
+
+	struct {
+		uint32_t hiz_depth_clear_value;
+	} ss12;
+
+	struct {
+		uint32_t reserved;
+	} ss13;
+
+	struct {
+		uint32_t reserved;
+	} ss14;
+
+	struct {
+		uint32_t reserved;
+	} ss15;
+};
+
+#endif /* GEN9_MEDIA_H */
diff --git a/lib/gpu_cmds.c b/lib/gpu_cmds.c
index e53580e65..61b18d20d 100644
--- a/lib/gpu_cmds.c
+++ b/lib/gpu_cmds.c
@@ -191,7 +191,7 @@ gen9_fill_surface_state(struct intel_bb *ibb,
 			uint32_t format,
 			int is_dst)
 {
-	struct gen8_surface_state *ss;
+	struct gen9_surface_state *ss;
 	uint32_t write_domain, read_domain, offset;
 	uint64_t address;
 	enum intel_buf_mocs mocs = intel_buf_get_mocs(buf);
@@ -252,7 +252,7 @@ gen11_fill_surface_state(struct intel_bb *ibb,
 			 uint32_t horizontal_alignment,
 			 int is_dst)
 {
-	struct gen8_surface_state *ss;
+	struct gen9_surface_state *ss;
 	uint32_t write_domain, read_domain, offset;
 	uint64_t address;
 	enum intel_buf_mocs mocs = intel_buf_get_mocs(buf);
diff --git a/lib/gpu_cmds.h b/lib/gpu_cmds.h
index 5ac007cc4..348c6c945 100644
--- a/lib/gpu_cmds.h
+++ b/lib/gpu_cmds.h
@@ -30,6 +30,7 @@
 #include "media_fill.h"
 #include "gen7_media.h"
 #include "gen8_media.h"
+#include "gen9_media.h"
 #include "xehp_media.h"
 #include "intel_reg.h"
 #include "drmtest.h"
diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index 0c30f39c1..9109df540 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -12,6 +12,7 @@
 #include "igt.h"
 #include "gen7_media.h"
 #include "gen8_media.h"
+#include "gen9_media.h"
 #include "intel_compute.h"
 #include "lib/igt_syncobj.h"
 #include "lib/intel_reg.h"
diff --git a/lib/media_fill.c b/lib/media_fill.c
index 2520995d9..88d83061a 100644
--- a/lib/media_fill.c
+++ b/lib/media_fill.c
@@ -27,6 +27,7 @@
 #include "media_fill.h"
 #include "gen7_media.h"
 #include "gen8_media.h"
+#include "gen9_media.h"
 #include "intel_reg.h"
 #include "drmtest.h"
 #include "gpu_cmds.h"
-- 
2.40.1

