Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E30CE6FE4B
	for <intel-xe@archiver.kernel.org>; Fri,  6 Sep 2024 22:10:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C1A410EB12;
	Fri,  6 Sep 2024 22:10:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="klpxlGs+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9EC910EB12
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Sep 2024 22:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725660621; x=1757196621;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dRXLIqWHQOKbBCCgFvZrOYdkT5x+HkA54P318aWtMaw=;
 b=klpxlGs+yqMuq3+rMDtJ5JSwxC7kogdZig01mbkuh2OlaKAW4woKKHcT
 H/GOtWOjqzsR7WmL8iiLNr80Adof0io05ZfM4DBLfDiTWMvqvIBTHxWJO
 niCs1iSDFe9wZUDErGScvxiR4SOwdwls2aNb22JaP86xuId1hecTPhXG/
 sWBzOxFM9VJFgzwNo3VOLEMtE1MLWsCfxdB/Ke5C5bso7m1pxPtoHtsKi
 RDlJHtLjzhVPX3hGXKNq1eqF9hwSw5PGhZb0x8ZjaPTWKnA7yjX8JX8u+
 kWG1nX46bHXCFLq7c7zXC1hrvtIh6dPtSA3p6HNuR0qC0o/5+vBYM1HW6 Q==;
X-CSE-ConnectionGUID: l1uzdCszTdSKRaYaHvC4jA==
X-CSE-MsgGUID: qhzWjyUVSNCSB4qCHJu2kg==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="24629037"
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="24629037"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 15:10:20 -0700
X-CSE-ConnectionGUID: KZjm5DhHRKaf09sYfPADpg==
X-CSE-MsgGUID: mCghkhvTR7upq/GZIZ3EHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="65874087"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 15:10:21 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Jose Souza <jose.souza@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [PATCH v2] drm/xe/oa: Enable Xe2+ PES disaggregation
Date: Fri,  6 Sep 2024 15:10:10 -0700
Message-ID: <20240906221010.2461123-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
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

Xe2+ PES disaggregation for OAG needs to be enabled to obtain disaggregated
metrics when disaggregated data is needed. There is no uapi impact of this
change.

v2: Minor change to commit message

Bspec: 61101
Fixes: e936f885f1e9 ("drm/xe/oa/uapi: Expose OA stream fd")
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_oa_regs.h | 1 +
 drivers/gpu/drm/xe/xe_oa.c           | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_oa_regs.h b/drivers/gpu/drm/xe/regs/xe_oa_regs.h
index 1189f5a540a82..a9b0091cb7ee1 100644
--- a/drivers/gpu/drm/xe/regs/xe_oa_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_oa_regs.h
@@ -52,6 +52,7 @@
 #define  OAG_OABUFFER_MEMORY_SELECT		REG_BIT(0) /* 0: PPGTT, 1: GGTT */
 
 #define OAG_OACONTROL				XE_REG(0xdaf4)
+#define  OAG_OACONTROL_OA_PES_DISAG_EN		REG_GENMASK(27, 22)
 #define  OAG_OACONTROL_OA_CCS_SELECT_MASK	REG_GENMASK(18, 16)
 #define  OAG_OACONTROL_OA_COUNTER_SEL_MASK	REG_GENMASK(4, 2)
 #define  OAG_OACONTROL_OA_COUNTER_ENABLE	REG_BIT(0)
diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 63286ed8457fa..0369cc016f6ab 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -440,6 +440,10 @@ static void xe_oa_enable(struct xe_oa_stream *stream)
 	val = __format_to_oactrl(format, regs->oa_ctrl_counter_select_mask) |
 		__oa_ccs_select(stream) | OAG_OACONTROL_OA_COUNTER_ENABLE;
 
+	if (GRAPHICS_VER(stream->oa->xe) >= 20 &&
+	    stream->hwe->oa_unit->type == DRM_XE_OA_UNIT_TYPE_OAG)
+		val |= OAG_OACONTROL_OA_PES_DISAG_EN;
+
 	xe_mmio_write32(stream->gt, regs->oa_ctrl, val);
 }
 
-- 
2.41.0

