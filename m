Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5402BD1037B
	for <intel-xe@archiver.kernel.org>; Wed, 26 Nov 2025 03:52:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FB2510E509;
	Wed, 26 Nov 2025 03:52:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CfYPS+6P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89D8E10E502
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Nov 2025 03:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764129145; x=1795665145;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Dq+2KOfUk66v2xcXo7Dhsoev+mgdv43CM8ybHFKhnG4=;
 b=CfYPS+6PdbYNnbfDxbDPzjMPQuoYbmMu9B4QkGCJydAhCFRZoYJ3dCWg
 mSz4A+4etrkSuJpcMK1hJ/1IAuTOqRNx/0JGbEBQdXm93uqi0lSo1fi+V
 vUNr1cHFWs2RGlKE+71YU/cGutRNG8X05cvXeO1IdFHySzR/0UlAVHDf3
 efcVD0NpVXz0Rm8Bg6cQ1k+bxAOo2APNEEImD/CrX8WlrFnfDxA4a7eIy
 mNOOAoLh1tLZHkKRWJt6ZyJNZ7U+bMF4hv7d//w/qBgqBzIYtRvjksYlE
 Dooj25Frn+YbqDE9ONWj+Uy1QBihCfPjTPEGtOA+YTYkYkyuGdcp4mMex A==;
X-CSE-ConnectionGUID: Ooj7ADe4Q+6S94GGoHNlJA==
X-CSE-MsgGUID: V18wpTHGTh6VluqgkQ0Kwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="76778734"
X-IronPort-AV: E=Sophos;i="6.20,227,1758610800"; d="scan'208";a="76778734"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 19:52:25 -0800
X-CSE-ConnectionGUID: XyRkxTE1SOSsfvO/7p3Ccw==
X-CSE-MsgGUID: mD4Gb9gUR1SmlUNL+79xjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,227,1758610800"; d="scan'208";a="193260122"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 19:52:25 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH 1/5] drm/xe/oa: Use explicit struct initialization for struct
 xe_oa_regs
Date: Tue, 25 Nov 2025 19:52:16 -0800
Message-ID: <20251126035220.13089-2-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251126035220.13089-1-ashutosh.dixit@intel.com>
References: <20251126035220.13089-1-ashutosh.dixit@intel.com>
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

Use explicit struct initialization for struct xe_oa_regs to reduce chance
of error. Also add .oa_mmio_trg field to struct for completeness.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c       | 38 +++++++++++++++++---------------
 drivers/gpu/drm/xe/xe_oa_types.h |  1 +
 2 files changed, 21 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 890c363282ae6..75db5530cb557 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -2566,30 +2566,32 @@ static u32 __hwe_oa_unit(struct xe_hw_engine *hwe)
 static struct xe_oa_regs __oam_regs(u32 base)
 {
 	return (struct xe_oa_regs) {
-		base,
-		OAM_HEAD_POINTER(base),
-		OAM_TAIL_POINTER(base),
-		OAM_BUFFER(base),
-		OAM_CONTEXT_CONTROL(base),
-		OAM_CONTROL(base),
-		OAM_DEBUG(base),
-		OAM_STATUS(base),
-		OAM_CONTROL_COUNTER_SEL_MASK,
+		.base		= base,
+		.oa_head_ptr	= OAM_HEAD_POINTER(base),
+		.oa_tail_ptr	= OAM_TAIL_POINTER(base),
+		.oa_buffer	= OAM_BUFFER(base),
+		.oa_ctx_ctrl	= OAM_CONTEXT_CONTROL(base),
+		.oa_ctrl	= OAM_CONTROL(base),
+		.oa_debug	= OAM_DEBUG(base),
+		.oa_status	= OAM_STATUS(base),
+		.oa_mmio_trg	= OAM_MMIO_TRG(base),
+		.oa_ctrl_counter_select_mask = OAM_CONTROL_COUNTER_SEL_MASK,
 	};
 }
 
 static struct xe_oa_regs __oag_regs(void)
 {
 	return (struct xe_oa_regs) {
-		0,
-		OAG_OAHEADPTR,
-		OAG_OATAILPTR,
-		OAG_OABUFFER,
-		OAG_OAGLBCTXCTRL,
-		OAG_OACONTROL,
-		OAG_OA_DEBUG,
-		OAG_OASTATUS,
-		OAG_OACONTROL_OA_COUNTER_SEL_MASK,
+		.base		= 0,
+		.oa_head_ptr	= OAG_OAHEADPTR,
+		.oa_tail_ptr	= OAG_OATAILPTR,
+		.oa_buffer	= OAG_OABUFFER,
+		.oa_ctx_ctrl	= OAG_OAGLBCTXCTRL,
+		.oa_ctrl	= OAG_OACONTROL,
+		.oa_debug	= OAG_OA_DEBUG,
+		.oa_status	= OAG_OASTATUS,
+		.oa_mmio_trg	= OAG_MMIOTRIGGER,
+		.oa_ctrl_counter_select_mask = OAG_OACONTROL_OA_COUNTER_SEL_MASK,
 	};
 }
 
diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
index cf080f4121893..08cc8d7c22158 100644
--- a/drivers/gpu/drm/xe/xe_oa_types.h
+++ b/drivers/gpu/drm/xe/xe_oa_types.h
@@ -87,6 +87,7 @@ struct xe_oa_regs {
 	struct xe_reg oa_ctrl;
 	struct xe_reg oa_debug;
 	struct xe_reg oa_status;
+	struct xe_reg oa_mmio_trg;
 	u32 oa_ctrl_counter_select_mask;
 };
 
-- 
2.48.1

