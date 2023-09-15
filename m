Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65D0CEE645C
	for <intel-xe@archiver.kernel.org>; Fri, 15 Sep 2023 13:23:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E302F10E637;
	Fri, 15 Sep 2023 13:23:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFEF510E628;
 Fri, 15 Sep 2023 13:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694784218; x=1726320218;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DgSWEuNYyI+OpmogR+t65XjPJWc9HlFu0XXsuvQvPtw=;
 b=YVuMl10UBnzwSUue8vzlGUCh9OSuObgH79tLbhw6e2v7/2ANq9aqBW/s
 y18F7hO2vMJSk9BKqsjXoXPvWEP9GxRNe8lIf7cDN+77pxpfl5AmOA0QQ
 J/s27D8iEZsoeupPis/6km5toUUtXKPYtvxiT+gMOCcEnHM5gcrQuNQSO
 qgve8ogl3LXlcIKcxQJ4+5imV4tOAbfGEq6b8bQtHVr2EAO1x3y4M4jeR
 skpAMrp0s8Qu4vvyV1JjGDVu5eF8jRrTj98mFaL2u7zK/dWlz5yEvbzOY
 MVoLxTe/gLanGJuigIhhRGXVl1Zq8/dxBSY7J8PyLkvGN+hPlTh1UH7R+ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="364292135"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; d="scan'208";a="364292135"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 06:23:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="810515424"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; d="scan'208";a="810515424"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 06:23:37 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 15 Sep 2023 06:23:36 -0700
Message-Id: <20230915132346.1845909-5-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230915132346.1845909-1-lucas.demarchi@intel.com>
References: <20230915132346.1845909-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH i-g-t 04/14] lib/gpu_cmds: Fork a
 gen9_fill_surface_state()
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Commit 02c2cf17628b ("lib/[gpu_cmds|intel_bufops]: Enable surface state
mocs setting.") added support for setting the mocs field in the surface
state. However it's not until gen9 that MOCS uses a table, programmed by
the kernel, and only has an index set in the surface state. Previously
it was the specific caching behavior.

As such, it makes no sense to set this field to `I915_MOCS_PTE << 1`: it
will only add garbage to the batch buffer. Solve this by forking a
separate function for gen9 and above, keeping the old behavior for
previous platforms.

Bspec: 12483, 12239, 12236
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/gpu_cmds.c | 55 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/lib/gpu_cmds.c b/lib/gpu_cmds.c
index 0fd8f8213..83d2302f9 100644
--- a/lib/gpu_cmds.c
+++ b/lib/gpu_cmds.c
@@ -136,6 +136,58 @@ gen8_fill_surface_state(struct intel_bb *ibb,
 	struct gen8_surface_state *ss;
 	uint32_t write_domain, read_domain, offset;
 	uint64_t address;
+
+	if (is_dst) {
+		write_domain = read_domain = I915_GEM_DOMAIN_RENDER;
+	} else {
+		write_domain = 0;
+		read_domain = I915_GEM_DOMAIN_SAMPLER;
+	}
+
+	intel_bb_ptr_align(ibb, 64);
+	offset = intel_bb_offset(ibb);
+	ss = intel_bb_ptr(ibb);
+	intel_bb_ptr_add(ibb, 64);
+
+	ss->ss0.surface_type = SURFACE_2D;
+	ss->ss0.surface_format = format;
+	ss->ss0.render_cache_read_write = 1;
+	ss->ss0.vertical_alignment = 1; /* align 4 */
+	ss->ss0.horizontal_alignment = 1; /* align 4 */
+
+	if (buf->tiling == I915_TILING_X)
+		ss->ss0.tiled_mode = 2;
+	else if (buf->tiling == I915_TILING_Y || buf->tiling == I915_TILING_4)
+		ss->ss0.tiled_mode = 3;
+
+	address = intel_bb_offset_reloc(ibb, buf->handle,
+					read_domain, write_domain,
+					offset + 4 * 8, buf->addr.offset);
+
+	ss->ss8.base_addr = (uint32_t) address;
+	ss->ss9.base_addr_hi = address >> 32;
+
+	ss->ss2.height = intel_buf_height(buf) - 1;
+	ss->ss2.width  = intel_buf_width(buf) - 1;
+	ss->ss3.pitch  = buf->surface[0].stride - 1;
+
+	ss->ss7.shader_chanel_select_r = 4;
+	ss->ss7.shader_chanel_select_g = 5;
+	ss->ss7.shader_chanel_select_b = 6;
+	ss->ss7.shader_chanel_select_a = 7;
+
+	return offset;
+}
+
+static uint32_t
+gen9_fill_surface_state(struct intel_bb *ibb,
+			struct intel_buf *buf,
+			uint32_t format,
+			int is_dst)
+{
+	struct gen8_surface_state *ss;
+	uint32_t write_domain, read_domain, offset;
+	uint64_t address;
 	enum intel_buf_mocs mocs = intel_buf_get_mocs(buf);
 
 	if (is_dst) {
@@ -273,6 +325,9 @@ fill_binding_table(struct intel_bb *ibb, struct intel_buf *buf)
 	if (intel_graphics_ver(devid) >= IP_VER(12, 50))
 		binding_table[0] = xehp_fill_surface_state(ibb, buf,
 							   SURFACEFORMAT_R8_UNORM, 1);
+	else if (intel_graphics_ver(devid) >= IP_VER(9, 0))
+		binding_table[0] = gen9_fill_surface_state(ibb, buf,
+							   SURFACEFORMAT_R8_UNORM, 1);
 	else if (intel_graphics_ver(devid) >= IP_VER(8, 0))
 		binding_table[0] = gen8_fill_surface_state(ibb, buf,
 							   SURFACEFORMAT_R8_UNORM, 1);
-- 
2.40.1

