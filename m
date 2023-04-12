Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98711C77B78
	for <intel-xe@archiver.kernel.org>; Wed, 12 Apr 2023 23:29:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A62810E9F3;
	Wed, 12 Apr 2023 23:29:08 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B075C10E9E3
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Apr 2023 23:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681342145; x=1712878145;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=l3s01Cj8G164tcmeJETGDlNToRUnHU44NydY/gcO9Es=;
 b=IjDECMFnrVg24+Pi2a+HeHM+/qsb3lI7zvU2ZUbTD/CXjF+OZY8psi9R
 0NMG4xs5UK7y8natTn1iyosTss/YYdYnZ1UXHFPc4mmhH9pSwaOzUbPuj
 dDM/TWmkc07y2z4n4nzz9kZohKJ1JnY5U/QYxryd5IfV1zxCUUf77LfxV
 24Nz7pFZT5JmX2T+wGItwAgs+vOnSeFhIQUomwnPnJkD0gqon75P2JW1O
 EPHXAnLKvCaxy7dUNc7lf259nclbHurqVH+ThaCr6uRjYqu1rekmbKm+o
 IHUUcWNKixV73hPUVUVYMBQ4K6Su1qmOqibIHhmArt2sXbaWDwds82wJY A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="332747999"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="332747999"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 16:29:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="691712006"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="691712006"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 16:29:03 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 12 Apr 2023 16:28:45 -0700
Message-Id: <20230412232846.3411883-6-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230412232846.3411883-1-lucas.demarchi@intel.com>
References: <20230412232846.3411883-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 5/6] drm/xe: Rename instruction field to avoid
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
 Matt Roper <matthew.d.roper@intel.com>
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

