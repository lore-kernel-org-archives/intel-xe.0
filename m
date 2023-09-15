Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 367DFEE645F
	for <intel-xe@archiver.kernel.org>; Fri, 15 Sep 2023 13:23:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C76FF10E640;
	Fri, 15 Sep 2023 13:23:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB76510E633;
 Fri, 15 Sep 2023 13:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694784219; x=1726320219;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HHikwuJz0sESWDwg31rLVm0XK86a9qkj6fyLjFUtGM0=;
 b=cf30EP13zHS4G6fcVGAdMVZE79N4X/ctvsX765u/7LPUGW0UOd1QYs2e
 nfkT2sfrGJid9MQ6ZNm3sU0Uz/biC9j9dqawDtR5yKEOGyGiFY6SzEE9g
 WmPtlCYIKFAyY5X2+h1l/uxUBLhnCdXYNH2+LrHg07wJE/UL31cC71V83
 PqHFnjKS+GTg0IIcR9sYRs/xBUO8G5qlRNVtgRgEEiqjhu2JAcDN+9JxD
 oGMmzR3e7ceWh9XBFflTu4LFOJIIQyW5ttgHn76kt4Q7jRjYtOhxc/B7Y
 OAn+7VEFcaiaXXUvyDTysTMicRDtzGfEXNYLPHZ9EIqYs8CTs2qbFcdpN A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="364292146"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; d="scan'208";a="364292146"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 06:23:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="810515458"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; d="scan'208";a="810515458"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 06:23:39 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 15 Sep 2023 06:23:45 -0700
Message-Id: <20230915132346.1845909-14-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230915132346.1845909-1-lucas.demarchi@intel.com>
References: <20230915132346.1845909-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH i-g-t 13/14] lib/intel_blt: Support xe2 in
 xy-fast-copy command
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

Xe2 xy-fast-copy command is slightly different, with dw01 and dw07
having a few differences: 1) different bitrange for mocs (it was
previously absent in dw07); 2) no dst_memory, src_memory;
3) hardcoded dst_type_y and src_type_y to 1.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/intel_blt.c | 76 +++++++++++++++++++++++++++++++++++--------------
 1 file changed, 55 insertions(+), 21 deletions(-)

diff --git a/lib/intel_blt.c b/lib/intel_blt.c
index 0658d67f4..508c2de46 100644
--- a/lib/intel_blt.c
+++ b/lib/intel_blt.c
@@ -1149,16 +1149,27 @@ struct gen12_fast_copy_data {
 		uint32_t client:			BITRANGE(29, 31);
 	} dw00;
 
-	struct {
-		uint32_t dst_pitch:			BITRANGE(0, 15);
-		uint32_t rsvd1:				BITRANGE(16, 23);
-		uint32_t color_depth:			BITRANGE(24, 26);
-		uint32_t rsvd0:				BITRANGE(27, 27);
-		uint32_t dst_memory:			BITRANGE(28, 28);
-		uint32_t src_memory:			BITRANGE(29, 29);
-		uint32_t dst_type_y:			BITRANGE(30, 30);
-		uint32_t src_type_y:			BITRANGE(31, 31);
-	} dw01;
+	union {
+		struct {
+			uint32_t dst_pitch:			BITRANGE(0, 15);
+			uint32_t rsvd1:				BITRANGE(16, 23);
+			uint32_t color_depth:			BITRANGE(24, 26);
+			uint32_t rsvd0:				BITRANGE(27, 27);
+			uint32_t dst_memory:			BITRANGE(28, 28);
+			uint32_t src_memory:			BITRANGE(29, 29);
+			uint32_t dst_type_y:			BITRANGE(30, 30);
+			uint32_t src_type_y:			BITRANGE(31, 31);
+		} dw01;
+		struct {
+			uint32_t dst_pitch:			BITRANGE(0, 15);
+			uint32_t rsvd1:				BITRANGE(16, 19);
+			uint32_t dst_mocs:			BITRANGE(20, 23);
+			uint32_t color_depth:			BITRANGE(24, 26);
+			uint32_t rsvd0:				BITRANGE(27, 29);
+			uint32_t dst_type_y_mb1:		BITRANGE(30, 30);
+			uint32_t src_type_y_mb1:		BITRANGE(31, 31);
+		} dw01_xe2;
+	};
 
 	struct {
 		int32_t dst_x1:				BITRANGE(0, 15);
@@ -1183,10 +1194,18 @@ struct gen12_fast_copy_data {
 		int32_t src_y1:				BITRANGE(16, 31);
 	} dw06;
 
-	struct {
-		uint32_t src_pitch:			BITRANGE(0, 15);
-		uint32_t rsvd0:				BITRANGE(16, 31);
-	} dw07;
+	union {
+		struct {
+			uint32_t src_pitch:			BITRANGE(0, 15);
+			uint32_t rsvd0:				BITRANGE(16, 31);
+		} dw07;
+		struct {
+			uint32_t src_pitch:			BITRANGE(0, 15);
+			uint32_t rsvd0:				BITRANGE(16, 19);
+			uint32_t src_mocs:			BITRANGE(20, 23);
+			uint32_t rsvd1:				BITRANGE(24, 31);
+		} dw07_xe2;
+	};
 
 	struct {
 		uint32_t src_address_lo;
@@ -1285,11 +1304,13 @@ uint64_t emit_blt_fast_copy(int fd,
 			    uint64_t bb_pos,
 			    bool emit_bbe)
 {
+	unsigned int ip_ver = intel_graphics_ver(intel_get_drm_devid(fd));
 	struct gen12_fast_copy_data data = {};
 	uint64_t dst_offset, src_offset, bb_offset, alignment;
 	uint32_t bbe = MI_BATCH_BUFFER_END;
 	uint32_t *bb;
 
+
 	alignment = get_default_alignment(fd, blt->driver);
 
 	data.dw00.client = 0x2;
@@ -1298,12 +1319,20 @@ uint64_t emit_blt_fast_copy(int fd,
 	data.dw00.src_tiling = __fast_tiling(blt->src.tiling);
 	data.dw00.length = 8;
 
-	data.dw01.dst_pitch = blt->dst.pitch;
-	data.dw01.color_depth = __fast_color_depth(blt->color_depth);
-	data.dw01.dst_memory = __memory_type(blt->fd, blt->driver, blt->dst.region);
-	data.dw01.src_memory = __memory_type(blt->fd, blt->driver, blt->src.region);
-	data.dw01.dst_type_y = __new_tile_y_type(blt->dst.tiling) ? 1 : 0;
-	data.dw01.src_type_y = __new_tile_y_type(blt->src.tiling) ? 1 : 0;
+	if (ip_ver >= IP_VER(20, 0)) {
+		data.dw01_xe2.dst_pitch = blt->dst.pitch;
+		data.dw01_xe2.dst_mocs = blt->dst.mocs;
+		data.dw01_xe2.color_depth = __fast_color_depth(blt->color_depth);
+		data.dw01_xe2.dst_type_y_mb1 = 1;
+		data.dw01_xe2.src_type_y_mb1 = 1;
+	} else {
+		data.dw01.dst_pitch = blt->dst.pitch;
+		data.dw01.color_depth = __fast_color_depth(blt->color_depth);
+		data.dw01.dst_memory = __memory_type(blt->fd, blt->driver, blt->dst.region);
+		data.dw01.src_memory = __memory_type(blt->fd, blt->driver, blt->src.region);
+		data.dw01.dst_type_y = __new_tile_y_type(blt->dst.tiling) ? 1 : 0;
+		data.dw01.src_type_y = __new_tile_y_type(blt->src.tiling) ? 1 : 0;
+	}
 
 	data.dw02.dst_x1 = blt->dst.x1;
 	data.dw02.dst_y1 = blt->dst.y1;
@@ -1323,7 +1352,12 @@ uint64_t emit_blt_fast_copy(int fd,
 	data.dw06.src_x1 = blt->src.x1;
 	data.dw06.src_y1 = blt->src.y1;
 
-	data.dw07.src_pitch = blt->src.pitch;
+	if (ip_ver >= IP_VER(20, 0)) {
+		data.dw07_xe2.src_pitch = blt->src.pitch;
+		data.dw07_xe2.src_mocs = blt->src.mocs;
+	} else {
+		data.dw07.src_pitch = blt->src.pitch;
+	}
 
 	data.dw08.src_address_lo = src_offset;
 	data.dw09.src_address_hi = src_offset >> 32;
-- 
2.40.1

