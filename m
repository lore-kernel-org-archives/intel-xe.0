Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3130D116F1
	for <intel-xe@archiver.kernel.org>; Tue,  2 Dec 2025 02:51:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6491710E512;
	Tue,  2 Dec 2025 02:51:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k0+vDtTR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9418610E513
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Dec 2025 02:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764643879; x=1796179879;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=oQkLMFwqKzYs3tOawq7dZodmKFyG04cEs6VyCO708ic=;
 b=k0+vDtTRNhqayJai0xlAzY7u/mkPVsvK79DGZeLujOKIiVslnvGW2lJI
 X/MTS+uSY3sTrks4l73wmNRdQWYx/c/U73NAbZBSPn0LWYOUSLrDBJTCu
 NsbDjRUGeF1ssTvqxcY/TWKNB3tas3eiLhr2UQkTjNBOlr/odZY/hMuFR
 7hN2NO4ZkIPvF/LXGKykSBp0xhUiFT+65GILYvLgMJ7RrikM1nIs6iNZQ
 e1DHUYlV8dMEZhovHZqdQ09TMo2Ap7KQtH8z236GlzWwkm4ovhb9px9oe
 TtF7H6tjP6EAkSk9nTGmBeRwLGQGTGIxzaU6hUGoSzxHpy2OBkmG7rbN2 A==;
X-CSE-ConnectionGUID: Of0qBDe4R0eN3avJoCHx0A==
X-CSE-MsgGUID: cQ+ePb6HSkCVhNZz1+U01A==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66635555"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="66635555"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 18:51:19 -0800
X-CSE-ConnectionGUID: LV1gqIQYTm+P9U7sH9NMKg==
X-CSE-MsgGUID: 4ETGZKA2RwWKPQvgwgfWuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="194077385"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 18:51:19 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/5] drm/xe/oa: Use explicit struct initialization for struct
 xe_oa_regs
Date: Mon,  1 Dec 2025 18:51:11 -0800
Message-ID: <20251202025115.373546-2-ashutosh.dixit@intel.com>
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

Use explicit struct initialization for struct xe_oa_regs to reduce chance
of error. Also add .oa_mmio_trg field to struct for completeness.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
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

