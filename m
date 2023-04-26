Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05867C7618E
	for <intel-xe@archiver.kernel.org>; Wed, 26 Apr 2023 21:33:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1E0B10E335;
	Wed, 26 Apr 2023 21:33:10 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0A1710EA49
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Apr 2023 21:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682544776; x=1714080776;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=l4Kl4Wq5h9irPMjrh5IhR5LUtRkmwSF/Ww9Ui5G1d4E=;
 b=NSip9AeGGwSyv+DfMVWaHXYIs7avL9vjaAjRYbyNjpgRZprQX0MQg53+
 TFp5TgFKGbVOIGszjtdNhEHZF6BGHs9dMhTQkM3zvB17sXUFA2N8eR/ex
 F4wk9QxKMdKIJ/hP0UoocnZX7+ZhLMSZUDVON6vq29Wi0KUL67oE3p4Vn
 KngttxT2Sf8R9okhjw9C6F844tUGblTYwjbh6ZfmJOyOwGgbbMGqjfaxW
 /vsmUCOiELpDa95VZOFmZYJjf41P8nFVyz10/Bpvz9zgFAMpP9CC3oWQc
 GQCSH19Azjv2IQ/zlNkLTEVj9+CoK3IjxiSy7PiZT3V+UTTP7F2iWbFzN w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="375213089"
X-IronPort-AV: E=Sophos;i="5.99,229,1677571200"; d="scan'208";a="375213089"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2023 14:32:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="644415169"
X-IronPort-AV: E=Sophos;i="5.99,229,1677571200"; d="scan'208";a="644415169"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2023 14:32:55 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 26 Apr 2023 14:32:31 -0700
Message-Id: <20230426213242.1315119-7-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230426213242.1315119-1-lucas.demarchi@intel.com>
References: <20230426213242.1315119-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 06/17] drm/xe/guc: Rename GEN11_SOFT_SCRATCH
 for clarity
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

That register is a completely different register, it's not the same as
SOFT_SCRATCH for GEN11 and beyond. Rename to to the same name as the
bspec uses, including the new variant for media. Also, move the
definitions to the guc header.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c     | 26 +++++++++++---------------
 drivers/gpu/drm/xe/xe_guc_reg.h |  9 ++++++---
 2 files changed, 17 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index ee71b969bcbf..ff2df4f30e97 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -622,9 +622,6 @@ int xe_guc_auth_huc(struct xe_guc *guc, u32 rsa_addr)
 	return xe_guc_ct_send_block(&guc->ct, action, ARRAY_SIZE(action));
 }
 
-#define MEDIA_SOFT_SCRATCH(n)           _MMIO(0x190310 + (n) * 4)
-#define MEDIA_SOFT_SCRATCH_COUNT        4
-
 int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
 			  u32 len, u32 *response_buf)
 {
@@ -632,15 +629,17 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
 	struct xe_gt *gt = guc_to_gt(guc);
 	u32 header, reply;
 	u32 reply_reg = xe_gt_is_media_type(gt) ?
-		MEDIA_SOFT_SCRATCH(0).reg : GEN11_SOFT_SCRATCH(0).reg;
+		MED_VF_SW_FLAG(0).reg : VF_SW_FLAG(0).reg;
+	const u32 LAST_INDEX = VF_SW_FLAG_COUNT;
 	int ret;
 	int i;
 
-	BUILD_BUG_ON(GEN11_SOFT_SCRATCH_COUNT != MEDIA_SOFT_SCRATCH_COUNT);
+	BUILD_BUG_ON(VF_SW_FLAG_COUNT != MED_VF_SW_FLAG_COUNT);
+
 	XE_BUG_ON(guc->ct.enabled);
 	XE_BUG_ON(!len);
-	XE_BUG_ON(len > GEN11_SOFT_SCRATCH_COUNT);
-	XE_BUG_ON(len > MEDIA_SOFT_SCRATCH_COUNT);
+	XE_BUG_ON(len > VF_SW_FLAG_COUNT);
+	XE_BUG_ON(len > MED_VF_SW_FLAG_COUNT);
 	XE_BUG_ON(FIELD_GET(GUC_HXG_MSG_0_ORIGIN, request[0]) !=
 		  GUC_HXG_ORIGIN_HOST);
 	XE_BUG_ON(FIELD_GET(GUC_HXG_MSG_0_TYPE, request[0]) !=
@@ -650,17 +649,14 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
 	/* Not in critical data-path, just do if else for GT type */
 	if (xe_gt_is_media_type(gt)) {
 		for (i = 0; i < len; ++i)
-			xe_mmio_write32(gt, MEDIA_SOFT_SCRATCH(i).reg,
+			xe_mmio_write32(gt, MED_VF_SW_FLAG(i).reg,
 					request[i]);
-#define LAST_INDEX	MEDIA_SOFT_SCRATCH_COUNT - 1
-		xe_mmio_read32(gt, MEDIA_SOFT_SCRATCH(LAST_INDEX).reg);
+		xe_mmio_read32(gt, MED_VF_SW_FLAG(LAST_INDEX).reg);
 	} else {
 		for (i = 0; i < len; ++i)
-			xe_mmio_write32(gt, GEN11_SOFT_SCRATCH(i).reg,
+			xe_mmio_write32(gt, VF_SW_FLAG(i).reg,
 					request[i]);
-#undef LAST_INDEX
-#define LAST_INDEX	GEN11_SOFT_SCRATCH_COUNT - 1
-		xe_mmio_read32(gt, GEN11_SOFT_SCRATCH(LAST_INDEX).reg);
+		xe_mmio_read32(gt, VF_SW_FLAG(LAST_INDEX).reg);
 	}
 
 	xe_guc_notify(guc);
@@ -724,7 +720,7 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
 	if (response_buf) {
 		response_buf[0] = header;
 
-		for (i = 1; i < GEN11_SOFT_SCRATCH_COUNT; i++)
+		for (i = 1; i < VF_SW_FLAG_COUNT; i++)
 			response_buf[i] =
 				xe_mmio_read32(gt, reply_reg + i * sizeof(u32));
 	}
diff --git a/drivers/gpu/drm/xe/xe_guc_reg.h b/drivers/gpu/drm/xe/xe_guc_reg.h
index efd60c186bbc..0cd38d51cc60 100644
--- a/drivers/gpu/drm/xe/xe_guc_reg.h
+++ b/drivers/gpu/drm/xe/xe_guc_reg.h
@@ -35,9 +35,6 @@
 #define SOFT_SCRATCH(n)			_MMIO(0xc180 + (n) * 4)
 #define SOFT_SCRATCH_COUNT		16
 
-#define GEN11_SOFT_SCRATCH(n)		_MMIO(0x190240 + (n) * 4)
-#define GEN11_SOFT_SCRATCH_COUNT	4
-
 #define UOS_RSA_SCRATCH(i)		_MMIO(0xc200 + (i) * 4)
 #define UOS_RSA_SCRATCH_COUNT		64
 
@@ -130,6 +127,12 @@ struct guc_doorbell_info {
 #define GUC_WD_VECS_IER			_MMIO(0xC558)
 #define GUC_PM_P24C_IER			_MMIO(0xC55C)
 
+#define VF_SW_FLAG(n)			_MMIO(0x190240 + (n) * 4)
+#define VF_SW_FLAG_COUNT		4
+
+#define MED_VF_SW_FLAG(n)		_MMIO(0x190310 + (n) * 4)
+#define MED_VF_SW_FLAG_COUNT		4
+
 /* GuC Interrupt Vector */
 #define GUC_INTR_GUC2HOST		BIT(15)
 #define GUC_INTR_EXEC_ERROR		BIT(14)
-- 
2.40.1

