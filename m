Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 250D6E8FDCB
	for <intel-xe@archiver.kernel.org>; Wed,  4 Oct 2023 03:10:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D837110E34D;
	Wed,  4 Oct 2023 03:10:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C40F110E323;
 Wed,  4 Oct 2023 03:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696389007; x=1727925007;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kfFjoMhCwiCCodhw4GgmpQ7S25ICty1eYFEDqTPmXI4=;
 b=evEeRdAVreZCNYespPS/zpEGMRLqi/aCymX9vXU91zhb2W2GTaahmxhF
 Xo++c4rmnsyI33cFp/Fp4Y45RLvf9oq+M3a3D4LuNn8hSxHhU3HNbbOUy
 pmoK1jnCzP60wg3+9zontfcwfGjREdzXjsY0LNc2Vw1UXVLaEQeJGRdjc
 8YTW2HTXKRw2J5qk/rNqhxkZOB3Ba9Q2RigEnE2tJqxTOfxLYri43G8DU
 GAQo0iRE8yj7NiNMGRpGsFu9SdGmKGC+aZFlutg3IQVnoaYIWGfEI1nI3
 +RRw/1tGFawsLv8adbVYOvJY3MUL9iMG7exyJyVMlhiM/PpuDHfeSEkW7 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="363308413"
X-IronPort-AV: E=Sophos;i="6.03,199,1694761200"; d="scan'208";a="363308413"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 20:10:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="894760429"
X-IronPort-AV: E=Sophos;i="6.03,199,1694761200"; d="scan'208";a="894760429"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 20:08:40 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  3 Oct 2023 20:10:23 -0700
Message-Id: <20231004031023.3444455-14-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231004031023.3444455-1-lucas.demarchi@intel.com>
References: <20231004031023.3444455-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH i-g-t v2 13/13] lib/intel_blt: Support xe2 in
 ctrl-surf-copy command
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
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Xe2 ctrl-surf-copy command varies significantly from gen12. Create a new
struct and function to fill the data, sharing the rest of the logic in
emit_blt_ctrl_surf_copy().

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/intel_blt.c | 128 ++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 107 insertions(+), 21 deletions(-)

diff --git a/lib/intel_blt.c b/lib/intel_blt.c
index 0d00f0fbc..81b765548 100644
--- a/lib/intel_blt.c
+++ b/lib/intel_blt.c
@@ -998,6 +998,65 @@ struct gen12_ctrl_surf_copy_data {
 	} dw04;
 };
 
+struct xe2_ctrl_surf_copy_data {
+	struct {
+		uint32_t length:			BITRANGE(0, 7);
+		uint32_t rsvd0:				BITRANGE(8, 8);
+		uint32_t size_of_ctrl_copy:		BITRANGE(9, 18);
+		uint32_t rsvd1:				BITRANGE(19, 19);
+		uint32_t dst_access_type:		BITRANGE(20, 20);
+		uint32_t src_access_type:		BITRANGE(21, 21);
+		uint32_t opcode:			BITRANGE(22, 28);
+		uint32_t client:			BITRANGE(29, 31);
+	} dw00;
+
+	struct {
+		uint32_t src_address_lo;
+	} dw01;
+
+	struct {
+		uint32_t src_address_hi:		BITRANGE(0, 24);
+		uint32_t pxp:				BITRANGE(25, 27);
+		uint32_t src_mocs_index:		BITRANGE(28, 31);
+	} dw02;
+
+	struct {
+		uint32_t dst_address_lo;
+	} dw03;
+
+	struct {
+		uint32_t dst_address_hi:		BITRANGE(0, 24);
+		uint32_t pxp:				BITRANGE(25, 27);
+		uint32_t dst_mocs_index:		BITRANGE(28, 31);
+	} dw04;
+};
+
+union ctrl_surf_copy_data {
+	struct gen12_ctrl_surf_copy_data gen12;
+	struct xe2_ctrl_surf_copy_data xe2;
+};
+
+static void xe2_dump_bb_surf_ctrl_cmd(const struct xe2_ctrl_surf_copy_data *data)
+{
+	uint32_t *cmd = (uint32_t *) data;
+
+	igt_info("details:\n");
+	igt_info(" dw00: [%08x] <client: 0x%x, opcode: 0x%x, "
+		 "src/dst access type: <%d, %d>, size of ctrl copy: %u, length: %d>\n",
+		 cmd[0],
+		 data->dw00.client, data->dw00.opcode,
+		 data->dw00.src_access_type, data->dw00.dst_access_type,
+		 data->dw00.size_of_ctrl_copy, data->dw00.length);
+	igt_info(" dw01: [%08x] src offset lo (0x%x)\n",
+		 cmd[1], data->dw01.src_address_lo);
+	igt_info(" dw02: [%08x] src offset hi (0x%x), src mocs idx: %u\n",
+		 cmd[2], data->dw02.src_address_hi, data->dw02.src_mocs_index);
+	igt_info(" dw03: [%08x] dst offset lo (0x%x)\n",
+		 cmd[3], data->dw03.dst_address_lo);
+	igt_info(" dw04: [%08x] dst offset hi (0x%x), src mocs idx: %u\n",
+		 cmd[4], data->dw04.dst_address_hi, data->dw04.dst_mocs_index);
+}
+
 static void dump_bb_surf_ctrl_cmd(const struct gen12_ctrl_surf_copy_data *data)
 {
 	uint32_t *cmd = (uint32_t *) data;
@@ -1056,7 +1115,9 @@ uint64_t emit_blt_ctrl_surf_copy(int fd,
 				 uint64_t bb_pos,
 				 bool emit_bbe)
 {
-	struct gen12_ctrl_surf_copy_data data = {};
+	unsigned int ip_ver = intel_graphics_ver(intel_get_drm_devid(fd));
+	union ctrl_surf_copy_data data = { };
+	size_t data_sz;
 	uint64_t dst_offset, src_offset, bb_offset, alignment;
 	uint32_t bbe = MI_BATCH_BUFFER_END;
 	uint32_t *bb;
@@ -1065,33 +1126,55 @@ uint64_t emit_blt_ctrl_surf_copy(int fd,
 	igt_assert_f(surf, "ctrl-surf-copy requires data to do ctrl-surf-copy blit\n");
 
 	alignment = max_t(uint64_t, get_default_alignment(fd, surf->driver), 1ull << 16);
-
-	data.dw00.client = 0x2;
-	data.dw00.opcode = 0x48;
-	data.dw00.src_access_type = surf->src.access_type;
-	data.dw00.dst_access_type = surf->dst.access_type;
-
-	/* Ensure dst has size capable to keep src ccs aux */
-	data.dw00.size_of_ctrl_copy = __ccs_size(surf) / CCS_RATIO - 1;
-	data.dw00.length = 0x3;
-
 	src_offset = get_offset(ahnd, surf->src.handle, surf->src.size, alignment);
 	dst_offset = get_offset(ahnd, surf->dst.handle, surf->dst.size, alignment);
 	bb_offset = get_offset(ahnd, surf->bb.handle, surf->bb.size, alignment);
 
-	data.dw01.src_address_lo = src_offset;
-	data.dw02.src_address_hi = src_offset >> 32;
-	data.dw02.src_mocs_index = surf->src.mocs_index;
+	if (ip_ver >= IP_VER(20, 0)) {
+		data.xe2.dw00.client = 0x2;
+		data.xe2.dw00.opcode = 0x48;
+		data.xe2.dw00.src_access_type = surf->src.access_type;
+		data.xe2.dw00.dst_access_type = surf->dst.access_type;
+
+		/* Ensure dst has size capable to keep src ccs aux */
+		data.xe2.dw00.size_of_ctrl_copy = __ccs_size(surf) / CCS_RATIO - 1;
+		data.xe2.dw00.length = 0x3;
+
+		data.xe2.dw01.src_address_lo = src_offset;
+		data.xe2.dw02.src_address_hi = src_offset >> 32;
+		data.xe2.dw02.src_mocs_index = surf->src.mocs_index;
+
+		data.xe2.dw03.dst_address_lo = dst_offset;
+		data.xe2.dw04.dst_address_hi = dst_offset >> 32;
+		data.xe2.dw04.dst_mocs_index = surf->dst.mocs_index;
+
+		data_sz = sizeof(data.xe2);
+	} else {
+		data.gen12.dw00.client = 0x2;
+		data.gen12.dw00.opcode = 0x48;
+		data.gen12.dw00.src_access_type = surf->src.access_type;
+		data.gen12.dw00.dst_access_type = surf->dst.access_type;
+
+		/* Ensure dst has size capable to keep src ccs aux */
+		data.gen12.dw00.size_of_ctrl_copy = __ccs_size(surf) / CCS_RATIO - 1;
+		data.gen12.dw00.length = 0x3;
+
+		data.gen12.dw01.src_address_lo = src_offset;
+		data.gen12.dw02.src_address_hi = src_offset >> 32;
+		data.gen12.dw02.src_mocs_index = surf->src.mocs_index;
+
+		data.gen12.dw03.dst_address_lo = dst_offset;
+		data.gen12.dw04.dst_address_hi = dst_offset >> 32;
+		data.gen12.dw04.dst_mocs_index = surf->dst.mocs_index;
 
-	data.dw03.dst_address_lo = dst_offset;
-	data.dw04.dst_address_hi = dst_offset >> 32;
-	data.dw04.dst_mocs_index = surf->dst.mocs_index;
+		data_sz = sizeof(data.gen12);
+	}
 
 	bb = bo_map(fd, surf->bb.handle, surf->bb.size, surf->driver);
 
-	igt_assert(bb_pos + sizeof(data) < surf->bb.size);
-	memcpy(bb + bb_pos, &data, sizeof(data));
-	bb_pos += sizeof(data);
+	igt_assert(bb_pos + data_sz < surf->bb.size);
+	memcpy(bb + bb_pos, &data, data_sz);
+	bb_pos += data_sz;
 
 	if (emit_bbe) {
 		igt_assert(bb_pos + sizeof(uint32_t) < surf->bb.size);
@@ -1105,7 +1188,10 @@ uint64_t emit_blt_ctrl_surf_copy(int fd,
 			 ", bb offset: %" PRIx64 "\n",
 			 src_offset, dst_offset, bb_offset);
 
-		dump_bb_surf_ctrl_cmd(&data);
+		if (ip_ver >= IP_VER(20, 0))
+			xe2_dump_bb_surf_ctrl_cmd(&data.xe2);
+		else
+			dump_bb_surf_ctrl_cmd(&data.gen12);
 	}
 
 	munmap(bb, surf->bb.size);
-- 
2.40.1

