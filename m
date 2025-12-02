Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 634B2D11700
	for <intel-xe@archiver.kernel.org>; Tue,  2 Dec 2025 02:51:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F17D10E514;
	Tue,  2 Dec 2025 02:51:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nL4ynZA/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E5E010E513
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Dec 2025 02:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764643880; x=1796179880;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=O+8EJBiyq2EFpLl2TY98ezdJIMW7K3Gi+D95E6VhDRo=;
 b=nL4ynZA/0GVe5ydNSSLYaIddTnSxHLLOq0zQAtWEgtwebGfPwsCL3Zzs
 Ur+MgPRawJB8lOA1eqEHpXT+Wg7AeLpYU4iTiOJm31gKdUn9y6PViFu8d
 z3z4cX72/iUeneziOr9SW8jOrnCQGTasXM4m0V6OJ40yxS8LQ0C00Dsar
 wSSZ2DIMoy71QYYZvADZYg9i/wNy8NWiKgD1CSa8Lpp91zjnx1+9NEA+j
 gjCGeB2f1hNn0A0dvzjVzkLVmeKP5PJ2hakkWP9Wvgp1IxVroDYSZDaF2
 /Fbs6xNewVoIjyOpHNOlZGag9WN6js6ksaPXjIXxRVi9kN0FBvj39/YYd Q==;
X-CSE-ConnectionGUID: n3k8KugISamZrHIkEzjvVg==
X-CSE-MsgGUID: Pr1S84+rQ/Os6QrKd4c8Mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66635559"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="66635559"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 18:51:19 -0800
X-CSE-ConnectionGUID: nLeaAIYVSIOGtyezBPEyig==
X-CSE-MsgGUID: LQkweYXpT6SV5C+jc5ZNQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="194077389"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 18:51:19 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 5/5] drm/xe/rtp: Whitelist OAM MMIO trigger registers
Date: Mon,  1 Dec 2025 18:51:15 -0800
Message-ID: <20251202025115.373546-6-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251202025115.373546-1-ashutosh.dixit@intel.com>
References: <20251202025115.373546-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Whitelist OAM registers to enable userspace to execute MMIO triggers on OAM
units.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_oa_regs.h  |  8 ++++++++
 drivers/gpu/drm/xe/xe_oa.c            |  7 +++----
 drivers/gpu/drm/xe/xe_reg_whitelist.c | 21 +++++++++++++++++++++
 3 files changed, 32 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_oa_regs.h b/drivers/gpu/drm/xe/regs/xe_oa_regs.h
index e693a50706f84..1d7908fc0ebae 100644
--- a/drivers/gpu/drm/xe/regs/xe_oa_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_oa_regs.h
@@ -100,4 +100,12 @@
 #define OAM_COMPRESSION_T3_CONTROL		XE_REG(0x1c2e00)
 #define  OAM_LAT_MEASURE_ENABLE			REG_BIT(4)
 
+/* Actual address is MEDIA_GT_GSI_OFFSET + the base addr below */
+#define XE_OAM_SAG_BASE				0x13000
+#define XE_OAM_SCMI_0_BASE			0x14000
+#define XE_OAM_SCMI_1_BASE			0x14800
+#define XE_OAM_SAG_BASE_ADJ			(MEDIA_GT_GSI_OFFSET + 0x13000)
+#define XE_OAM_SCMI_0_BASE_ADJ			(MEDIA_GT_GSI_OFFSET + 0x14000)
+#define XE_OAM_SCMI_1_BASE_ADJ			(MEDIA_GT_GSI_OFFSET + 0x14800)
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index d63c04e2d4922..cc48663c2b48f 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -2601,11 +2601,10 @@ static struct xe_oa_regs __oag_regs(void)
 
 static void __xe_oa_init_oa_units(struct xe_gt *gt)
 {
-	/* Actual address is MEDIA_GT_GSI_OFFSET + oam_base_addr[i] */
 	const u32 oam_base_addr[] = {
-		[XE_OAM_UNIT_SAG]    = 0x13000,
-		[XE_OAM_UNIT_SCMI_0] = 0x14000,
-		[XE_OAM_UNIT_SCMI_1] = 0x14800,
+		[XE_OAM_UNIT_SAG]    = XE_OAM_SAG_BASE,
+		[XE_OAM_UNIT_SCMI_0] = XE_OAM_SCMI_0_BASE,
+		[XE_OAM_UNIT_SCMI_1] = XE_OAM_SCMI_1_BASE,
 	};
 	int i, num_units = gt->oa.num_oa_units;
 
diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
index e8e47aa16a5df..da49c69076a47 100644
--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
@@ -83,6 +83,17 @@ static const struct xe_rtp_entry_sr register_whitelist[] = {
 #define WHITELIST_OAG_MMIO_TRG \
 	WHITELIST_OA_MMIO_TRG(OAG_MMIOTRIGGER, OAG_OASTATUS, OAG_OAHEADPTR)
 
+#define WHITELIST_OAM_MMIO_TRG \
+	WHITELIST_OA_MMIO_TRG(OAM_MMIO_TRG(XE_OAM_SAG_BASE_ADJ), \
+			      OAM_STATUS(XE_OAM_SAG_BASE_ADJ), \
+			      OAM_HEAD_POINTER(XE_OAM_SAG_BASE_ADJ)), \
+	WHITELIST_OA_MMIO_TRG(OAM_MMIO_TRG(XE_OAM_SCMI_0_BASE_ADJ), \
+			      OAM_STATUS(XE_OAM_SCMI_0_BASE_ADJ), \
+			      OAM_HEAD_POINTER(XE_OAM_SCMI_0_BASE_ADJ)), \
+	WHITELIST_OA_MMIO_TRG(OAM_MMIO_TRG(XE_OAM_SCMI_1_BASE_ADJ), \
+			      OAM_STATUS(XE_OAM_SCMI_1_BASE_ADJ), \
+			      OAM_HEAD_POINTER(XE_OAM_SCMI_1_BASE_ADJ))
+
 	{ XE_RTP_NAME("oag_mmio_trg_rcs"),
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, XE_RTP_END_VERSION_UNDEFINED),
 		       ENGINE_CLASS(RENDER)),
@@ -93,6 +104,16 @@ static const struct xe_rtp_entry_sr register_whitelist[] = {
 		       ENGINE_CLASS(COMPUTE)),
 	  XE_RTP_ACTIONS(WHITELIST_OAG_MMIO_TRG)
 	},
+	{ XE_RTP_NAME("oam_mmio_trg_vcs"),
+	  XE_RTP_RULES(MEDIA_VERSION_RANGE(1300, XE_RTP_END_VERSION_UNDEFINED),
+		       ENGINE_CLASS(VIDEO_DECODE)),
+	  XE_RTP_ACTIONS(WHITELIST_OAM_MMIO_TRG)
+	},
+	{ XE_RTP_NAME("oam_mmio_trg_vecs"),
+	  XE_RTP_RULES(MEDIA_VERSION_RANGE(1300, XE_RTP_END_VERSION_UNDEFINED),
+		       ENGINE_CLASS(VIDEO_ENHANCE)),
+	  XE_RTP_ACTIONS(WHITELIST_OAM_MMIO_TRG)
+	},
 };
 
 static void whitelist_apply_to_hwe(struct xe_hw_engine *hwe)
-- 
2.48.1

