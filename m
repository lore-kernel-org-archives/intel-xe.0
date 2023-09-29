Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEAEFE743E7
	for <intel-xe@archiver.kernel.org>; Fri, 29 Sep 2023 04:44:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 486FE10E0E0;
	Fri, 29 Sep 2023 04:44:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8487310E0D9
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Sep 2023 04:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695962654; x=1727498654;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZKFh+ZXKLkcVyW5YrINQKaYgvvEdWdwVBZbjVJl2oUY=;
 b=AY4RXC7/roZwX9xnMUT9Ayu0+lzKDaZH2oFDMB/VlIN5d5Cx940H+OPr
 gnJ+FQ57EwOKKcemtfQB03K3F6NlMNkK3CgHNalLkwB5onEeJ0Eoxfk4u
 rZ2RQGJ3/+Azco/NuyXBofp7QyBKnMmdrsgrjaiUaNp+M5ADvnz8KfNU6
 4O4XKzMT8R3YYTwsJV9QRGVk9wQZH35DZDVtGzgIKn698rXxeUyyqgzeI
 RO1SVqxN42Z7VjxiwntQ5+KaatGRPZaWHsvr9Yjg5AYdk+BRMCJsRQ8eV
 TxjSEYLlqqOA8i6MgJOxPc6rqhQ0fccZQJY8UyLxA7xqt/ZZyLFOFVmUm g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="361608392"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; d="scan'208";a="361608392"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 21:44:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="923503054"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; d="scan'208";a="923503054"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 21:44:13 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 28 Sep 2023 21:43:50 -0700
Message-Id: <20230929044351.3145468-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230929044351.3145468-1-lucas.demarchi@intel.com>
References: <20230929044351.3145468-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/4] drm/xe/xe2: Set tile y bits in
 XY_FAST_COPY_BLT
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Haridhar Kalvala <haridhar.kalvala@intel.com>

Set bits 30 and 31 of XY_FAST_COPY_BLT for xe2 platforms. Its setting
Tile-Y for source and destination.

Bspec: 57567
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Haridhar Kalvala <haridhar.kalvala@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gpu_commands.h | 2 ++
 drivers/gpu/drm/xe/xe_migrate.c           | 9 ++++++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
index 1fdf2e4f1c9f..cc7b56763f10 100644
--- a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
+++ b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
@@ -57,6 +57,8 @@
 
 #define XY_FAST_COPY_BLT_CMD		(2 << 29 | 0x42 << 22)
 #define   XY_FAST_COPY_BLT_DEPTH_32	(3<<24)
+#define   XY_FAST_COPY_BLT_D1_SRC_TILE4	REG_BIT(31)
+#define   XY_FAST_COPY_BLT_D1_DST_TILE4	REG_BIT(30)
 
 #define	PVC_MEM_SET_CMD		(2 << 29 | 0x5b << 22)
 #define   PVC_MEM_SET_CMD_LEN_DW	7
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 2e6ce2daf414..b682d34bc1e5 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -543,12 +543,19 @@ static void emit_copy(struct xe_gt *gt, struct xe_bb *bb,
 		      u64 src_ofs, u64 dst_ofs, unsigned int size,
 		      unsigned int pitch)
 {
+	struct xe_device *xe = gt_to_xe(gt);
+
 	xe_gt_assert(gt, size / pitch <= S16_MAX);
 	xe_gt_assert(gt, pitch / 4 <= S16_MAX);
 	xe_gt_assert(gt, pitch <= U16_MAX);
 
 	bb->cs[bb->len++] = XY_FAST_COPY_BLT_CMD | (10 - 2);
-	bb->cs[bb->len++] = XY_FAST_COPY_BLT_DEPTH_32 | pitch;
+	if (GRAPHICS_VER(xe) >= 20)
+		bb->cs[bb->len++] = XY_FAST_COPY_BLT_DEPTH_32 | pitch |
+				    XY_FAST_COPY_BLT_D1_SRC_TILE4 |
+				    XY_FAST_COPY_BLT_D1_DST_TILE4;
+	else
+		bb->cs[bb->len++] = XY_FAST_COPY_BLT_DEPTH_32 | pitch;
 	bb->cs[bb->len++] = 0;
 	bb->cs[bb->len++] = (size / pitch) << 16 | pitch / 4;
 	bb->cs[bb->len++] = lower_32_bits(dst_ofs);
-- 
2.40.1

