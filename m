Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91D06E743E1
	for <intel-xe@archiver.kernel.org>; Fri, 29 Sep 2023 04:44:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BA4410E0DD;
	Fri, 29 Sep 2023 04:44:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DCC110E0E0
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Sep 2023 04:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695962654; x=1727498654;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PZxU2+ep05gVA8DkhAVBRLzpPUfEqw/KpIxvYJBlFVQ=;
 b=BCxxkiDvnWqqpMey+ZKjuy6Y/5cmudLj6DjmWW6TGOp/4AjfZSeyrINL
 gsGulAwpVoqJzaPrIU8uaNIP8212nnvOI+Cwm+LU2XLzAuKrP1chJuN3A
 ummwbrwfl51UoeZUqnoVxZwGnBBYbCPgzy96l8ncPKi2Ou2FWdzEo8RK7
 Gd2qhuguijpzYsNY7ZHVvfQIDfpwJTLFbfZRUkzvv2l7J2r14V+djpbZ7
 LblW/LwvL8Gl+jOUnpMigTmLMyz+N5Y16/+ukGT3kw5/lyO0+UAxu916l
 D6XW4vM3hqHqjuP52ThPdupCeS1veZQPwmjnZXRs0uRN8lzXxL7qHMF3M g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="361608390"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; d="scan'208";a="361608390"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 21:44:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="923503051"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; d="scan'208";a="923503051"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 21:44:13 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 28 Sep 2023 21:43:49 -0700
Message-Id: <20230929044351.3145468-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230929044351.3145468-1-lucas.demarchi@intel.com>
References: <20230929044351.3145468-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/4] drm/xe: Rename MEM_SET instruction
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

PVC_MS_* doesn't reflect the real name of the instruction. Rename
it to follow the nmae used in the bspec.

Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Haridhar Kalvala <haridhar.kalvala@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gpu_commands.h | 6 +++---
 drivers/gpu/drm/xe/xe_migrate.c           | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
index 1ee8d46d92d9..1fdf2e4f1c9f 100644
--- a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
+++ b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
@@ -60,10 +60,10 @@
 
 #define	PVC_MEM_SET_CMD		(2 << 29 | 0x5b << 22)
 #define   PVC_MEM_SET_CMD_LEN_DW	7
-#define   PVC_MS_MATRIX			REG_BIT(17)
-#define   PVC_MS_DATA_FIELD		GENMASK(31, 24)
+#define   PVC_MEM_SET_MATRIX		REG_BIT(17)
+#define   PVC_MEM_SET_DATA_FIELD	GENMASK(31, 24)
 /* Bspec lists field as [6:0], but index alone is from [6:1] */
-#define   PVC_MS_MOCS_INDEX_MASK	GENMASK(6, 1)
+#define   PVC_MEM_SET_MOCS_INDEX_MASK	GENMASK(6, 1)
 
 #define GFX_OP_PIPE_CONTROL(len)	((0x3<<29)|(0x3<<27)|(0x2<<24)|((len)-2))
 
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 1d1e4076b29d..2e6ce2daf414 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -809,13 +809,13 @@ static void emit_clear_link_copy(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs
 	u32 mocs = gt->mocs.uc_index;
 	u32 len = PVC_MEM_SET_CMD_LEN_DW;
 
-	*cs++ = PVC_MEM_SET_CMD | PVC_MS_MATRIX | (len - 2);
+	*cs++ = PVC_MEM_SET_CMD | PVC_MEM_SET_MATRIX | (len - 2);
 	*cs++ = pitch - 1;
 	*cs++ = (size / pitch) - 1;
 	*cs++ = pitch - 1;
 	*cs++ = lower_32_bits(src_ofs);
 	*cs++ = upper_32_bits(src_ofs);
-	*cs++ = FIELD_PREP(PVC_MS_MOCS_INDEX_MASK, mocs);
+	*cs++ = FIELD_PREP(PVC_MEM_SET_MOCS_INDEX_MASK, mocs);
 
 	xe_gt_assert(gt, cs - bb->cs == len + bb->len);
 
-- 
2.40.1

