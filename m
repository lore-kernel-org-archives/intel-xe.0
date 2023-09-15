Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8C51EE645D
	for <intel-xe@archiver.kernel.org>; Fri, 15 Sep 2023 13:23:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4778D10E62E;
	Fri, 15 Sep 2023 13:23:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C22F510E631;
 Fri, 15 Sep 2023 13:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694784219; x=1726320219;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dM5JV+SF/OJlT/5eacKRZ6QYwel8lV0sfuxYTRMKX4U=;
 b=OaClbS86uRIi/RubTjKj7LWjbVHF9vkfsephpNAxGMNHK0uqlT7ZAyGV
 whuCH2WdTuz+vWx6WnNvUeOPCHlZHx7K2fr0ZvVkM0B+GzU/blSwS1FIE
 WqY1bxp8O0vrGzwLf3PmqMDG4uEkddIr6tPFALSGZ4xUXgX/W4BpXAhOc
 4YKm7EOjyre5ckkcPa+k2q3lC2xNTOKVQx6Q8VGmhD2oT7rRSQ2EKaiq3
 si6x5qbUwoLN6/F9UwzeGvgolY5Pmq1I4/Curectk/5x83qB0wD5lXiJk
 RKtLOGdrSB0IN2vTuQvqr9T3dDtg9GIqFv3wQT4cbEAjsQcAUxS5pw+U8 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="364292145"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; d="scan'208";a="364292145"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 06:23:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="810515455"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; d="scan'208";a="810515455"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 06:23:39 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 15 Sep 2023 06:23:44 -0700
Message-Id: <20230915132346.1845909-13-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230915132346.1845909-1-lucas.demarchi@intel.com>
References: <20230915132346.1845909-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH i-g-t 12/14] lib/intel_blt: Support Xe2 in
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
---
 lib/intel_blt.c | 107 +++++++++++++++++++++++++++++++-----------------
 1 file changed, 69 insertions(+), 38 deletions(-)

diff --git a/lib/intel_blt.c b/lib/intel_blt.c
index 9f8e3dea3..0658d67f4 100644
--- a/lib/intel_blt.c
+++ b/lib/intel_blt.c
@@ -55,15 +55,24 @@ struct gen12_block_copy_data {
 		uint32_t client:			BITRANGE(29, 31);
 	} dw00;
 
-	struct {
-		uint32_t dst_pitch:			BITRANGE(0, 17);
-		uint32_t dst_aux_mode:			BITRANGE(18, 20);
-		uint32_t pad:				BITRANGE(21, 21);
-		uint32_t dst_mocs:			BITRANGE(22, 27);
-		uint32_t dst_ctrl_surface_type:		BITRANGE(28, 28);
-		uint32_t dst_compression:		BITRANGE(29, 29);
-		uint32_t dst_tiling:			BITRANGE(30, 31);
-	} dw01;
+	union {
+		struct {
+			uint32_t dst_pitch:			BITRANGE(0, 17);
+			uint32_t dst_aux_mode:			BITRANGE(18, 20);
+			uint32_t pad:				BITRANGE(21, 21);
+			uint32_t dst_mocs:			BITRANGE(22, 27);
+			uint32_t dst_ctrl_surface_type:		BITRANGE(28, 28);
+			uint32_t dst_compression:		BITRANGE(29, 29);
+			uint32_t dst_tiling:			BITRANGE(30, 31);
+		} dw01;
+		struct {
+			uint32_t dst_pitch:			BITRANGE(0, 17);
+			uint32_t pad0:				BITRANGE(18, 23);
+			uint32_t dst_mocs:			BITRANGE(24, 27);
+			uint32_t pad1:				BITRANGE(28, 29);
+			uint32_t dst_tiling:			BITRANGE(30, 31);
+		} dw01_xe2;
+	};
 
 	struct {
 		int32_t dst_x1:				BITRANGE(0, 15);
@@ -96,15 +105,24 @@ struct gen12_block_copy_data {
 		int32_t src_y1:				BITRANGE(16, 31);
 	} dw07;
 
-	struct {
-		uint32_t src_pitch:			BITRANGE(0, 17);
-		uint32_t src_aux_mode:			BITRANGE(18, 20);
-		uint32_t pad:				BITRANGE(21, 21);
-		uint32_t src_mocs:			BITRANGE(22, 27);
-		uint32_t src_ctrl_surface_type:		BITRANGE(28, 28);
-		uint32_t src_compression:		BITRANGE(29, 29);
-		uint32_t src_tiling:			BITRANGE(30, 31);
-	} dw08;
+	union {
+		struct {
+			uint32_t src_pitch:			BITRANGE(0, 17);
+			uint32_t src_aux_mode:			BITRANGE(18, 20);
+			uint32_t pad:				BITRANGE(21, 21);
+			uint32_t src_mocs:			BITRANGE(22, 27);
+			uint32_t src_ctrl_surface_type:		BITRANGE(28, 28);
+			uint32_t src_compression:		BITRANGE(29, 29);
+			uint32_t src_tiling:			BITRANGE(30, 31);
+		} dw08;
+		struct {
+			uint32_t src_pitch:			BITRANGE(0, 17);
+			uint32_t pad0:				BITRANGE(18, 23);
+			uint32_t src_mocs:			BITRANGE(24, 27);
+			uint32_t pad1:				BITRANGE(28, 29);
+			uint32_t src_tiling:			BITRANGE(30, 31);
+		} dw08_xe2;
+	};
 
 	struct {
 		uint32_t src_address_lo;
@@ -521,7 +539,7 @@ static bool __new_tile_y_type(enum blt_tiling_type tiling)
 static void fill_data(struct gen12_block_copy_data *data,
 		      const struct blt_copy_data *blt,
 		      uint64_t src_offset, uint64_t dst_offset,
-		      bool extended_command)
+		      bool extended_command, unsigned int ip_ver)
 {
 	data->dw00.client = 0x2;
 	data->dw00.opcode = 0x41;
@@ -529,18 +547,24 @@ static void fill_data(struct gen12_block_copy_data *data,
 	data->dw00.special_mode = __special_mode(blt);
 	data->dw00.length = extended_command ? 20 : 10;
 
-	if (__special_mode(blt) == SM_FULL_RESOLVE)
-		data->dw01.dst_aux_mode = __aux_mode(blt->fd, blt->driver, &blt->src);
-	else
-		data->dw01.dst_aux_mode = __aux_mode(blt->fd, blt->driver, &blt->dst);
-	data->dw01.dst_pitch = blt->dst.pitch - 1;
+	if (ip_ver >= IP_VER(20, 0)) {
+		data->dw01_xe2.dst_pitch = blt->dst.pitch - 1;
+		data->dw01_xe2.dst_mocs = blt->dst.mocs;
+		data->dw01_xe2.dst_tiling = __block_tiling(blt->dst.tiling);
+	} else {
+		if (__special_mode(blt) == SM_FULL_RESOLVE)
+			data->dw01.dst_aux_mode = __aux_mode(blt->fd, blt->driver, &blt->src);
+		else
+			data->dw01.dst_aux_mode = __aux_mode(blt->fd, blt->driver, &blt->dst);
+		data->dw01.dst_pitch = blt->dst.pitch - 1;
 
-	data->dw01.dst_mocs = blt->dst.mocs;
-	data->dw01.dst_compression = blt->dst.compression;
-	data->dw01.dst_tiling = __block_tiling(blt->dst.tiling);
+		data->dw01.dst_mocs = blt->dst.mocs;
+		data->dw01.dst_compression = blt->dst.compression;
+		data->dw01.dst_tiling = __block_tiling(blt->dst.tiling);
 
-	if (blt->dst.compression)
-		data->dw01.dst_ctrl_surface_type = blt->dst.compression_type;
+		if (blt->dst.compression)
+			data->dw01.dst_ctrl_surface_type = blt->dst.compression_type;
+	}
 
 	data->dw02.dst_x1 = blt->dst.x1;
 	data->dw02.dst_y1 = blt->dst.y1;
@@ -558,14 +582,20 @@ static void fill_data(struct gen12_block_copy_data *data,
 	data->dw07.src_x1 = blt->src.x1;
 	data->dw07.src_y1 = blt->src.y1;
 
-	data->dw08.src_pitch = blt->src.pitch - 1;
-	data->dw08.src_aux_mode = __aux_mode(blt->fd, blt->driver, &blt->src);
-	data->dw08.src_mocs = blt->src.mocs;
-	data->dw08.src_compression = blt->src.compression;
-	data->dw08.src_tiling = __block_tiling(blt->src.tiling);
-
-	if (blt->src.compression)
-		data->dw08.src_ctrl_surface_type = blt->src.compression_type;
+	if (ip_ver >= IP_VER(20, 0)) {
+		data->dw08_xe2.src_pitch = blt->src.pitch - 1;
+		data->dw08_xe2.src_mocs = blt->src.mocs;
+		data->dw08_xe2.src_tiling = __block_tiling(blt->src.tiling);
+	} else {
+		data->dw08.src_pitch = blt->src.pitch - 1;
+		data->dw08.src_aux_mode = __aux_mode(blt->fd, blt->driver, &blt->src);
+		data->dw08.src_mocs = blt->src.mocs;
+		data->dw08.src_compression = blt->src.compression;
+		data->dw08.src_tiling = __block_tiling(blt->src.tiling);
+
+		if (blt->src.compression)
+			data->dw08.src_ctrl_surface_type = blt->src.compression_type;
+	}
 
 	data->dw09.src_address_lo = src_offset;
 	data->dw10.src_address_hi = src_offset >> 32;
@@ -770,6 +800,7 @@ uint64_t emit_blt_block_copy(int fd,
 			     uint64_t bb_pos,
 			     bool emit_bbe)
 {
+	unsigned int ip_ver = intel_graphics_ver(intel_get_drm_devid(fd));
 	struct gen12_block_copy_data data = {};
 	struct gen12_block_copy_data_ext dext = {};
 	uint64_t dst_offset, src_offset, bb_offset, alignment;
@@ -786,7 +817,7 @@ uint64_t emit_blt_block_copy(int fd,
 		     + blt->dst.plane_offset;
 	bb_offset = get_offset(ahnd, blt->bb.handle, blt->bb.size, alignment);
 
-	fill_data(&data, blt, src_offset, dst_offset, ext);
+	fill_data(&data, blt, src_offset, dst_offset, ext, ip_ver);
 
 	bb = bo_map(fd, blt->bb.handle, blt->bb.size, blt->driver);
 
-- 
2.40.1

