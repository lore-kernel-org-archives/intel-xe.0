Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C3BBEE4998
	for <intel-xe@archiver.kernel.org>; Fri, 18 Aug 2023 22:08:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FDF510E57D;
	Fri, 18 Aug 2023 22:08:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C63C10E106
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Aug 2023 22:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692396512; x=1723932512;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mtTEFqj0nT35u/78nTZgq1sP+YOLF+MfRuLGnkdxqUk=;
 b=QErpWC+Nn6eVjk5ebt+yHKvYZ3j5Q+DQf2Ircyi0FZIe3jeHwkewHKVI
 iO86GrgoHMd2EJHm5SLR/qfbNlKR3G2j2tcFAyvVpzliedPIOZEu8cmd2
 AZp+hXnRXpL7LrMkl+OsCUsZJ+sVE1NvBHf3haOgcJc48IwkA2UddA6uu
 2g7zXj/JBQIG9/XkMDZ4TDoQu4bGyv16uP6nvoHfAIVOfk8VAWhOUKBRa
 57Xp98OWmhWjhzjaypG22FPj+Mn2kCzz3I1iq3/iIfuzOFgsSevnyT7cj
 Y5Vs7nMJv7C6OZ6lvpP8L+7gcPzIVoBCeEALcrAwoqpx8HG7fG8qs0rxT A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="439592987"
X-IronPort-AV: E=Sophos;i="6.01,184,1684825200"; d="scan'208";a="439592987"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2023 15:08:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="728758189"
X-IronPort-AV: E=Sophos;i="6.01,184,1684825200"; d="scan'208";a="728758189"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2023 15:08:31 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 18 Aug 2023 15:08:14 -0700
Message-Id: <20230818220824.700519-6-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230818220824.700519-1-lucas.demarchi@intel.com>
References: <20230818220824.700519-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 05/15] drm/xe/xe2: Update context image layouts
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

From: Matt Roper <matthew.d.roper@intel.com>

Engine register state layout has changed a bit on Xe2.  We'll also
explicitly define a BCS layout to ensure BLIT_SWCTL and BLIT_CCTL are
included.

Bspec: 65182, 60184, 55793
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 76 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 74 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 7c15c55964a8..2b4219c38359 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -424,6 +424,69 @@ static const u8 mtl_rcs_offsets[] = {
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
@@ -433,7 +496,9 @@ static const u8 mtl_rcs_offsets[] = {
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
@@ -441,8 +506,15 @@ static const u8 *reg_offsets(struct xe_device *xe, enum xe_engine_class class)
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

