Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBA5AC77B7A
	for <intel-xe@archiver.kernel.org>; Wed, 19 Apr 2023 07:45:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A365010E8C4;
	Wed, 19 Apr 2023 07:45:03 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4C8310E8E1
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Apr 2023 07:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681890297; x=1713426297;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=l3s01Cj8G164tcmeJETGDlNToRUnHU44NydY/gcO9Es=;
 b=FFB16i3I94yorCn3cpeqDl8GqVnRZJOxBRVID0e89VfoOp+wXKTBK028
 chgRTMAVXI0FSF81seiGgdbx+WTnj+21b6DcxKa6XYehFy07PnqIYaYDS
 MgdkRAM+VlKcd3AbqbG3cbxEkNvJWeghQ5JHCuH8FOKITYatqCsI02SeQ
 JTVbXtnsw5YYv4Vb+d4mLXXcEIlJMCQVv/0AzauMrLdltcNksv1pnaukj
 o5uKe0gr6ILuQ0lZo+j9f3VAthaq/QWI67gSCFqw/5dfFMBj38dXPdBsC
 My0N8oC6VvaEBLX6D6mAOczYbGA+VjhcJQiaKtxqfk7pPIOuVB9IoTztl A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="334186113"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="334186113"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 00:44:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="693951877"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="693951877"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 00:44:56 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 19 Apr 2023 00:44:28 -0700
Message-Id: <20230419074440.4006398-6-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230419074440.4006398-1-lucas.demarchi@intel.com>
References: <20230419074440.4006398-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 05/17] drm/xe: Rename instruction field to avoid
 confusion
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
2.39.0

