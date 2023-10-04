Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13B8AE8FDC7
	for <intel-xe@archiver.kernel.org>; Wed,  4 Oct 2023 03:10:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C656510E342;
	Wed,  4 Oct 2023 03:10:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F73C10E0B8;
 Wed,  4 Oct 2023 03:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696389007; x=1727925007;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=e0t9zLw35RUgWN2vdut0MNQV9MAzt3AXtKYwuUmmCXE=;
 b=OKWWMt2Lk9DJmwAqp3PhjswP7oUB1sVKNQ51I7xTtx3JYX3VzMpg3mmg
 5gvOvLoobybCBh/bjOMj0otuGin6LabFefgyI9Z5Ix7d6o5rc1LjnVEJ9
 wWzx+jkRnIOqjhkr4mTWG1xUKE7f5ESUD9pubt9blHa+gEjLcHnXWp+rw
 xckZxhMb+UicJc8SH4T0iYkZLxmYonqXP0+eNx09eq/X3DWXmjK/fvPVm
 sAJ9UiEJw4vgkVBlIEdLnl4A/MaVn+bqcZ6gqiA7Bk4fSHjlL9HMV/7BG
 QUoYXJMxZVXDsisqCKwQqQcFGawIMzrsqhXyA/Uf8+3Zx8hP1+ikkH73h w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="363308411"
X-IronPort-AV: E=Sophos;i="6.03,199,1694761200"; d="scan'208";a="363308411"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 20:10:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="894760420"
X-IronPort-AV: E=Sophos;i="6.03,199,1694761200"; d="scan'208";a="894760420"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 20:08:40 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  3 Oct 2023 20:10:21 -0700
Message-Id: <20231004031023.3444455-12-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231004031023.3444455-1-lucas.demarchi@intel.com>
References: <20231004031023.3444455-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH i-g-t v2 11/13] lib/intel_blt: Support Xe2 in
 xy-block-copy command
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

Xe2 block-copy command is slightly different, with dw01 and dw02
having a few differences: 1) different bitrange for mocs; 2) no
ctrl_surface_type, aux_mode or compression.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/intel_blt.c | 111 +++++++++++++++++++++++++++++++-----------------
 1 file changed, 73 insertions(+), 38 deletions(-)

diff --git a/lib/intel_blt.c b/lib/intel_blt.c
index d1aa0872c..4e0fe6320 100644
--- a/lib/intel_blt.c
+++ b/lib/intel_blt.c
@@ -55,15 +55,26 @@ struct gen12_block_copy_data {
 		uint32_t client:			BITRANGE(29, 31);
 	} dw00;
 
-	struct {
-		uint32_t dst_pitch:			BITRANGE(0, 17);
-		uint32_t dst_aux_mode:			BITRANGE(18, 20);
-		uint32_t pxp:				BITRANGE(21, 21);
-		uint32_t dst_mocs_index:		BITRANGE(22, 27);
-		uint32_t dst_ctrl_surface_type:		BITRANGE(28, 28);
-		uint32_t dst_compression:		BITRANGE(29, 29);
-		uint32_t dst_tiling:			BITRANGE(30, 31);
-	} dw01;
+	union {
+		struct {
+			uint32_t dst_pitch:			BITRANGE(0, 17);
+			uint32_t dst_aux_mode:			BITRANGE(18, 20);
+			uint32_t pxp:				BITRANGE(21, 21);
+			uint32_t dst_mocs_index:		BITRANGE(22, 27);
+			uint32_t dst_ctrl_surface_type:		BITRANGE(28, 28);
+			uint32_t dst_compression:		BITRANGE(29, 29);
+			uint32_t dst_tiling:			BITRANGE(30, 31);
+		} dw01;
+		struct {
+			uint32_t dst_pitch:			BITRANGE(0, 17);
+			uint32_t dst_aux_mode:			BITRANGE(18, 20);
+			uint32_t pxp:				BITRANGE(21, 21);
+			uint32_t dst_mocs_index:		BITRANGE(22, 27);
+			uint32_t dst_ctrl_surface_type:		BITRANGE(28, 28);
+			uint32_t dst_compression:		BITRANGE(29, 29);
+			uint32_t dst_tiling:			BITRANGE(30, 31);
+		} dw01_xe2;
+	};
 
 	struct {
 		int32_t dst_x1:				BITRANGE(0, 15);
@@ -96,15 +107,26 @@ struct gen12_block_copy_data {
 		int32_t src_y1:				BITRANGE(16, 31);
 	} dw07;
 
-	struct {
-		uint32_t src_pitch:			BITRANGE(0, 17);
-		uint32_t src_aux_mode:			BITRANGE(18, 20);
-		uint32_t pxp:				BITRANGE(21, 21);
-		uint32_t src_mocs_index:		BITRANGE(22, 27);
-		uint32_t src_ctrl_surface_type:		BITRANGE(28, 28);
-		uint32_t src_compression:		BITRANGE(29, 29);
-		uint32_t src_tiling:			BITRANGE(30, 31);
-	} dw08;
+	union {
+		struct {
+			uint32_t src_pitch:			BITRANGE(0, 17);
+			uint32_t src_aux_mode:			BITRANGE(18, 20);
+			uint32_t pxp:				BITRANGE(21, 21);
+			uint32_t src_mocs_index:		BITRANGE(22, 27);
+			uint32_t src_ctrl_surface_type:		BITRANGE(28, 28);
+			uint32_t src_compression:		BITRANGE(29, 29);
+			uint32_t src_tiling:			BITRANGE(30, 31);
+		} dw08;
+		struct {
+			uint32_t src_pitch:			BITRANGE(0, 17);
+			uint32_t pad0:				BITRANGE(18, 20);
+			uint32_t pxp:				BITRANGE(21, 21);
+			uint32_t pad1:				BITRANGE(22, 23);
+			uint32_t src_mocs_index:		BITRANGE(24, 27);
+			uint32_t pad2:				BITRANGE(28, 29);
+			uint32_t src_tiling:			BITRANGE(30, 31);
+		} dw08_xe2;
+	};
 
 	struct {
 		uint32_t src_address_lo;
@@ -553,7 +575,7 @@ static bool __new_tile_y_type(enum blt_tiling_type tiling)
 static void fill_data(struct gen12_block_copy_data *data,
 		      const struct blt_copy_data *blt,
 		      uint64_t src_offset, uint64_t dst_offset,
-		      bool extended_command)
+		      bool extended_command, unsigned int ip_ver)
 {
 	data->dw00.client = 0x2;
 	data->dw00.opcode = 0x41;
@@ -561,18 +583,24 @@ static void fill_data(struct gen12_block_copy_data *data,
 	data->dw00.special_mode = __special_mode(blt);
 	data->dw00.length = extended_command ? 20 : 10;
 
-	if (__special_mode(blt) == SM_FULL_RESOLVE)
-		data->dw01.dst_aux_mode = __aux_mode(blt->fd, blt->driver, &blt->src);
-	else
-		data->dw01.dst_aux_mode = __aux_mode(blt->fd, blt->driver, &blt->dst);
-	data->dw01.dst_pitch = blt->dst.pitch - 1;
+	if (ip_ver >= IP_VER(20, 0)) {
+		data->dw01_xe2.dst_pitch = blt->dst.pitch - 1;
+		data->dw01_xe2.dst_mocs_index = blt->dst.mocs_index;
+		data->dw01_xe2.dst_tiling = __block_tiling(blt->dst.tiling);
+	} else {
+		if (__special_mode(blt) == SM_FULL_RESOLVE)
+			data->dw01.dst_aux_mode = __aux_mode(blt->fd, blt->driver, &blt->src);
+		else
+			data->dw01.dst_aux_mode = __aux_mode(blt->fd, blt->driver, &blt->dst);
+		data->dw01.dst_pitch = blt->dst.pitch - 1;
 
-	data->dw01.dst_mocs_index = blt->dst.mocs_index;
-	data->dw01.dst_compression = blt->dst.compression;
-	data->dw01.dst_tiling = __block_tiling(blt->dst.tiling);
+		data->dw01.dst_mocs_index = blt->dst.mocs_index;
+		data->dw01.dst_compression = blt->dst.compression;
+		data->dw01.dst_tiling = __block_tiling(blt->dst.tiling);
 
-	if (blt->dst.compression)
-		data->dw01.dst_ctrl_surface_type = blt->dst.compression_type;
+		if (blt->dst.compression)
+			data->dw01.dst_ctrl_surface_type = blt->dst.compression_type;
+	}
 
 	data->dw02.dst_x1 = blt->dst.x1;
 	data->dw02.dst_y1 = blt->dst.y1;
@@ -590,14 +618,20 @@ static void fill_data(struct gen12_block_copy_data *data,
 	data->dw07.src_x1 = blt->src.x1;
 	data->dw07.src_y1 = blt->src.y1;
 
-	data->dw08.src_pitch = blt->src.pitch - 1;
-	data->dw08.src_aux_mode = __aux_mode(blt->fd, blt->driver, &blt->src);
-	data->dw08.src_mocs_index = blt->src.mocs_index;
-	data->dw08.src_compression = blt->src.compression;
-	data->dw08.src_tiling = __block_tiling(blt->src.tiling);
-
-	if (blt->src.compression)
-		data->dw08.src_ctrl_surface_type = blt->src.compression_type;
+	if (ip_ver >= IP_VER(20, 0)) {
+		data->dw08_xe2.src_pitch = blt->src.pitch - 1;
+		data->dw08_xe2.src_mocs_index = blt->src.mocs_index;
+		data->dw08_xe2.src_tiling = __block_tiling(blt->src.tiling);
+	} else {
+		data->dw08.src_pitch = blt->src.pitch - 1;
+		data->dw08.src_aux_mode = __aux_mode(blt->fd, blt->driver, &blt->src);
+		data->dw08.src_mocs_index = blt->src.mocs_index;
+		data->dw08.src_compression = blt->src.compression;
+		data->dw08.src_tiling = __block_tiling(blt->src.tiling);
+
+		if (blt->src.compression)
+			data->dw08.src_ctrl_surface_type = blt->src.compression_type;
+	}
 
 	data->dw09.src_address_lo = src_offset;
 	data->dw10.src_address_hi = src_offset >> 32;
@@ -802,6 +836,7 @@ uint64_t emit_blt_block_copy(int fd,
 			     uint64_t bb_pos,
 			     bool emit_bbe)
 {
+	unsigned int ip_ver = intel_graphics_ver(intel_get_drm_devid(fd));
 	struct gen12_block_copy_data data = {};
 	struct gen12_block_copy_data_ext dext = {};
 	uint64_t dst_offset, src_offset, bb_offset, alignment;
@@ -818,7 +853,7 @@ uint64_t emit_blt_block_copy(int fd,
 		     + blt->dst.plane_offset;
 	bb_offset = get_offset(ahnd, blt->bb.handle, blt->bb.size, alignment);
 
-	fill_data(&data, blt, src_offset, dst_offset, ext);
+	fill_data(&data, blt, src_offset, dst_offset, ext, ip_ver);
 
 	bb = bo_map(fd, blt->bb.handle, blt->bb.size, blt->driver);
 
-- 
2.40.1

