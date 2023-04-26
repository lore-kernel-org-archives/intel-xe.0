Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58D08C77B7F
	for <intel-xe@archiver.kernel.org>; Wed, 26 Apr 2023 21:33:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2A2B10EA49;
	Wed, 26 Apr 2023 21:33:19 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF73B10EA45
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Apr 2023 21:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682544776; x=1714080776;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4Sb5XTmg2S8/C79GwEJiaowLnefZvthErJNQv+OmpCc=;
 b=ctIfGXxaR27SSufAfr9LK6BQOmqurpGU37FaFmFbY3Mw4VkGlQ7yqziV
 xa1CEymZkPNyn+YxdatdTfDQS4Ib7BQNoDXxzv15EKyJ7NbsuZwWVPlZj
 A2+HP4Hkhxs9U5+VXAUs6Hnz3tJHxFjJm/PqdqZWtB7zKAUVys/CaRDrR
 tyYN60h1/82z/Xyv3kD3ZJvo862S1H8rDvFnB0QEW/DKWWsqLdkIIv4M7
 M4tvQe96t178pJq/nG4BvEYW41yHE8Qok5mdMJdhtOO+K+iJ2WBH7PnI+
 K/uzNHZeGRSSmj0uVUeec9dTImwHzmaFHiU8AJYmjCe6zepnuhWzhekAU w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="375213088"
X-IronPort-AV: E=Sophos;i="5.99,229,1677571200"; d="scan'208";a="375213088"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2023 14:32:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="644415166"
X-IronPort-AV: E=Sophos;i="5.99,229,1677571200"; d="scan'208";a="644415166"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2023 14:32:55 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 26 Apr 2023 14:32:30 -0700
Message-Id: <20230426213242.1315119-6-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230426213242.1315119-1-lucas.demarchi@intel.com>
References: <20230426213242.1315119-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 05/17] drm/xe: Rename instruction field to
 avoid confusion
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
 Matt Roper <matthew.d.roper@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

There was both BLT_DEPTH_32 and XY_FAST_COLOR_BLT_DEPTH_32 - also add
the prefix to the first to make it clear this is about the FAST_**COPY**
operation. While at it, remove the GEN9_ prefix.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gpu_commands.h | 4 ++--
 drivers/gpu/drm/xe/xe_migrate.c           | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
index 9d6508d74d62..05531d43514f 100644
--- a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
+++ b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
@@ -55,8 +55,8 @@
 #define   XY_FAST_COLOR_BLT_MOCS_MASK	GENMASK(27, 21)
 #define   XY_FAST_COLOR_BLT_MEM_TYPE_SHIFT 31
 
-#define GEN9_XY_FAST_COPY_BLT_CMD	(2 << 29 | 0x42 << 22)
-#define   BLT_DEPTH_32			(3<<24)
+#define XY_FAST_COPY_BLT_CMD		(2 << 29 | 0x42 << 22)
+#define   XY_FAST_COPY_BLT_DEPTH_32	(3<<24)
 
 #define	PVC_MEM_SET_CMD		(2 << 29 | 0x5b << 22)
 #define   PVC_MEM_SET_CMD_LEN_DW	7
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 5acb227f2b5a..f40f47ccb76f 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -518,8 +518,8 @@ static void emit_copy(struct xe_gt *gt, struct xe_bb *bb,
 	XE_BUG_ON(pitch / 4 > S16_MAX);
 	XE_BUG_ON(pitch > U16_MAX);
 
-	bb->cs[bb->len++] = GEN9_XY_FAST_COPY_BLT_CMD | (10 - 2);
-	bb->cs[bb->len++] = BLT_DEPTH_32 | pitch;
+	bb->cs[bb->len++] = XY_FAST_COPY_BLT_CMD | (10 - 2);
+	bb->cs[bb->len++] = XY_FAST_COPY_BLT_DEPTH_32 | pitch;
 	bb->cs[bb->len++] = 0;
 	bb->cs[bb->len++] = (size / pitch) << 16 | pitch / 4;
 	bb->cs[bb->len++] = lower_32_bits(dst_ofs);
-- 
2.40.1

