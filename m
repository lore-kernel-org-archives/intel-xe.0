Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71778C7EE21
	for <intel-xe@archiver.kernel.org>; Fri, 21 Apr 2023 22:33:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2CA910EA72;
	Fri, 21 Apr 2023 22:33:16 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB11D10E3B9
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Apr 2023 22:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682116394; x=1713652394;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=l3s01Cj8G164tcmeJETGDlNToRUnHU44NydY/gcO9Es=;
 b=hfQEkjzE789Q8trvhp2guPlSnntqzRC7i4XkiZ+L6WI6GQQBv2k8F4qD
 tgUT62EF0AF53O6I01dzsDwgwPAnx51sm0HG8o27/3Qw4YDNEMJ0Nk1Wh
 O8G1q/BB2Hic6LKFVoGjyaLXm5STjGrRp71RfA1evN8TQgGckwQXCZIUp
 LWF1uvgVCFiXkYVLBRmXOBkFC5F3cCnqpzkHL7RqPHKiLSNG5M6RZCZyL
 t+3bpakJIkcGFaRz/ORaRllPwmViOsrimPZftfjglzcMTvamiupIv3sWs
 MFmxtzhoobAWvBxwtLTOKdkzVS6AGptvuvNhImUwOpQm0DFgEHi2Yn1EA A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="325693743"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; d="scan'208";a="325693743"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 15:33:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="722913740"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; d="scan'208";a="722913740"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 15:33:12 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 21 Apr 2023 15:32:46 -0700
Message-Id: <20230421223258.128781-6-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230421223258.128781-1-lucas.demarchi@intel.com>
References: <20230421223258.128781-1-lucas.demarchi@intel.com>
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

