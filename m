Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 476E0C04FDF
	for <intel-xe@archiver.kernel.org>; Fri, 11 Aug 2023 16:08:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C39F10E6B5;
	Fri, 11 Aug 2023 16:08:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5A5410E6AF
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Aug 2023 16:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691770126; x=1723306126;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6+Tx02nd+iJLVsmpzNCBZpYLmNbpXKZonjSGLGazBFM=;
 b=Vw8/XhLC7IewN1JAeSeE/k66+iKZS7FmOQgO0W3ZFqH3+pqfHbj9mY+A
 CvmN3LdrET66uN38hGeBKJk1UrbkSDGTHzEIqe+Q8W/mKpV+pqLS84V6X
 RvEHKOc7+7w5EDIbgXxnVcuaz1MriNua4L8uoVwHB5DP9NInPQEgRy5dx
 Qxfkm4XBUQOvvwn+O58L7Di3I9Hp0bXmVujoACa9Hs3mPxbUyDflP3LFZ
 8HYWP0ZnXBUFvvqTe1QXvahbkcQmM/MK1S/twNlOEfaJkdn4IPACMp/W9
 dFYGPoUywBy+FeHB9MsFmXMHX2cDvJc0iNMprOEJB0M8UJS36Vv5nqzV1 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="438044326"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; d="scan'208";a="438044326"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2023 09:06:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="726300454"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; d="scan'208";a="726300454"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2023 09:06:27 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 11 Aug 2023 09:06:08 -0700
Message-Id: <20230811160618.477297-6-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230811160618.477297-1-lucas.demarchi@intel.com>
References: <20230811160618.477297-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 05/15] drm/xe/xe2: Update context image layouts
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
Cc: Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Matt Roper <matthew.d.roper@intel.com>

Engine register state layout has changed a bit on Xe2.  We'll also
explicitly define a BCS layout to ensure BLIT_SWCTL and BLIT_CCTL are
included.

Bspec: 65182, 60184, 55793
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 76 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 74 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index a6479deb62376..896744d4e847d 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -423,6 +423,69 @@ static const u8 mtl_rcs_offsets[] = {
 	END
 };
 
+#define XE2_CTX_COMMON \
+	NOP(1),                 /* [0x00] */ \
+	LRI(15, POSTED),        /* [0x01] */ \
+	REG16(0x244),           /* [0x02] CTXT_SR_CTL */ \
+	REG(0x034),             /* [0x04] RING_BUFFER_HEAD */ \
+	REG(0x030),             /* [0x06] RING_BUFFER_TAIL */ \
+	REG(0x038),             /* [0x08] RING_BUFFER_START */ \
+	REG(0x03c),             /* [0x0a] RING_BUFFER_CONTROL */ \
+	REG(0x168),             /* [0x0c] BB_ADDR_UDW */ \
+	REG(0x140),             /* [0x0e] BB_ADDR */ \
+	REG(0x110),             /* [0x10] BB_STATE */ \
+	REG(0x1c0),             /* [0x12] BB_PER_CTX_PTR */ \
+	REG(0x1c4),             /* [0x14] RCS_INDIRECT_CTX */ \
+	REG(0x1c8),             /* [0x16] RCS_INDIRECT_CTX_OFFSET */ \
+	REG(0x180),             /* [0x18] CCID */ \
+	REG16(0x2b4),           /* [0x1a] SEMAPHORE_TOKEN */ \
+	REG(0x120),             /* [0x1c] PRT_BB_STATE */ \
+	REG(0x124),             /* [0x1e] PRT_BB_STATE_UDW */ \
+	\
+	NOP(1),                 /* [0x20] */ \
+	LRI(9, POSTED),         /* [0x21] */ \
+	REG16(0x3a8),           /* [0x22] CTX_TIMESTAMP */ \
+	REG16(0x3ac),           /* [0x24] CTX_TIMESTAMP_UDW */ \
+	REG(0x108),             /* [0x26] INDIRECT_RING_STATE */ \
+	REG16(0x284),           /* [0x28] dummy reg */ \
+	REG16(0x280),           /* [0x2a] CS_ACC_CTR_THOLD */ \
+	REG16(0x27c),           /* [0x2c] CS_CTX_SYS_PASID */ \
+	REG16(0x278),           /* [0x2e] CS_CTX_ASID */ \
+	REG16(0x274),           /* [0x30] PTBP_UDW */ \
+	REG16(0x270)            /* [0x32] PTBP_LDW */
+
+static const u8 xe2_rcs_offsets[] = {
+	XE2_CTX_COMMON,
+
+	NOP(2),                 /* [0x34] */
+	LRI(2, POSTED),         /* [0x36] */
+	REG16(0x5a8),           /* [0x37] CONTEXT_SCHEDULING_ATTRIBUTES */
+	REG16(0x5ac),           /* [0x39] PREEMPTION_STATUS */
+
+	NOP(6),                 /* [0x41] */
+	LRI(1, 0),              /* [0x47] */
+	REG(0x0c8),             /* [0x48] R_PWR_CLK_STATE */
+
+	END
+};
+
+static const u8 xe2_bcs_offsets[] = {
+	XE2_CTX_COMMON,
+
+	NOP(4 + 8 + 1),         /* [0x34] */
+	LRI(2, POSTED),         /* [0x41] */
+	REG16(0x200),           /* [0x42] BCS_SWCTRL */
+	REG16(0x204),           /* [0x44] BLIT_CCTL */
+
+	END
+};
+
+static const u8 xe2_xcs_offsets[] = {
+	XE2_CTX_COMMON,
+
+	END
+};
+
 #undef END
 #undef REG16
 #undef REG
@@ -432,7 +495,9 @@ static const u8 mtl_rcs_offsets[] = {
 static const u8 *reg_offsets(struct xe_device *xe, enum xe_engine_class class)
 {
 	if (class == XE_ENGINE_CLASS_RENDER) {
-		if (GRAPHICS_VERx100(xe) >= 1270)
+		if (GRAPHICS_VER(xe) >= 20)
+			return xe2_rcs_offsets;
+		else if (GRAPHICS_VERx100(xe) >= 1270)
 			return mtl_rcs_offsets;
 		else if (GRAPHICS_VERx100(xe) >= 1255)
 			return dg2_rcs_offsets;
@@ -440,8 +505,15 @@ static const u8 *reg_offsets(struct xe_device *xe, enum xe_engine_class class)
 			return xehp_rcs_offsets;
 		else
 			return gen12_rcs_offsets;
+	} else if (class == XE_ENGINE_CLASS_COPY) {
+		if (GRAPHICS_VER(xe) >= 20)
+			return xe2_bcs_offsets;
+		else
+			return gen12_xcs_offsets;
 	} else {
-		if (GRAPHICS_VERx100(xe) >= 1255)
+		if (GRAPHICS_VER(xe) >= 20)
+			return xe2_xcs_offsets;
+		else if (GRAPHICS_VERx100(xe) >= 1255)
 			return dg2_xcs_offsets;
 		else
 			return gen12_xcs_offsets;
-- 
2.40.1

