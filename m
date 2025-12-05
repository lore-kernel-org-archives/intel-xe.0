Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DA8CD374A9
	for <intel-xe@archiver.kernel.org>; Fri,  5 Dec 2025 21:26:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A748310EBBC;
	Fri,  5 Dec 2025 21:26:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ilbcfrTf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F25B410EA83
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Dec 2025 21:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764969981; x=1796505981;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fNipj87XqvsfgEqMYn1Y2YASFsKMDhFhXvdWJFCCVQ0=;
 b=ilbcfrTfm6P1CzWDXs5/mECR4hnlEFma42Ay5jRBsamhHe/ykMP5yQso
 yEwrpRZ9SGYCrsCqq8I4e6qzu3/Ni21B2p4lH3swm+Hmzl/WkgyvaqnDl
 jeWt5/T/C2RWhbMxRTr7riTvgCfrvNWpxEOWJLadrl5YQG1U2n5lmA2hq
 FlDOvs4IpjuqwxYnqvAp9etuunhESL+UKYHT689GGSMrNcKm4LqgKCZP1
 UL14j+1uAM+6gvvCfEmkEjpfLGs1YLaU9Df5J6eV5ynC8nrBgSwcoW9Yz
 PQ6Te9S4q1UrEgrLlSkoTukN3ON9b89J8Run5NsAL1/zqI/eu/gJ4zEFr w==;
X-CSE-ConnectionGUID: P1Xjac2CS/+pVkXYiy27EA==
X-CSE-MsgGUID: ynp/lpQvS5uQ9xGZCysEmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="66893794"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="66893794"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 13:26:20 -0800
X-CSE-ConnectionGUID: 0xNrJuCbSrS0Fm2cYRAtKA==
X-CSE-MsgGUID: MDXYf2lnRa+B9OcwU/hAqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="195202140"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 13:26:20 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH 2/3] drm/xe/rtp: Whitelist OAMERT MMIO trigger registers
Date: Fri,  5 Dec 2025 13:26:12 -0800
Message-ID: <20251205212613.826224-3-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251205212613.826224-1-ashutosh.dixit@intel.com>
References: <20251205212613.826224-1-ashutosh.dixit@intel.com>
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

Whitelist OAMERT registers to enable userspace to execute MMIO triggers on
OAMERT units. Registers are whitelisted for compute and copy class engines.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_reg_whitelist.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
index da49c69076a47..1391cb6ec9c62 100644
--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
@@ -9,6 +9,7 @@
 #include "regs/xe_gt_regs.h"
 #include "regs/xe_oa_regs.h"
 #include "regs/xe_regs.h"
+#include "xe_device.h"
 #include "xe_gt_types.h"
 #include "xe_gt_printk.h"
 #include "xe_platform_types.h"
@@ -26,6 +27,13 @@ static bool match_not_render(const struct xe_device *xe,
 	return hwe->class != XE_ENGINE_CLASS_RENDER;
 }
 
+static bool match_has_mert(const struct xe_device *xe,
+			   const struct xe_gt *gt,
+			   const struct xe_hw_engine *hwe)
+{
+	return xe_device_has_mert((struct xe_device *)xe);
+}
+
 static const struct xe_rtp_entry_sr register_whitelist[] = {
 	{ XE_RTP_NAME("WaAllowPMDepthAndInvocationCountAccessFromUMD, 1408556865"),
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210), ENGINE_CLASS(RENDER)),
@@ -94,6 +102,9 @@ static const struct xe_rtp_entry_sr register_whitelist[] = {
 			      OAM_STATUS(XE_OAM_SCMI_1_BASE_ADJ), \
 			      OAM_HEAD_POINTER(XE_OAM_SCMI_1_BASE_ADJ))
 
+#define WHITELIST_OA_MERT_MMIO_TRG \
+	WHITELIST_OA_MMIO_TRG(OAMERT_MMIO_TRG, OAMERT_STATUS, OAMERT_HEAD_POINTER)
+
 	{ XE_RTP_NAME("oag_mmio_trg_rcs"),
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, XE_RTP_END_VERSION_UNDEFINED),
 		       ENGINE_CLASS(RENDER)),
@@ -114,6 +125,14 @@ static const struct xe_rtp_entry_sr register_whitelist[] = {
 		       ENGINE_CLASS(VIDEO_ENHANCE)),
 	  XE_RTP_ACTIONS(WHITELIST_OAM_MMIO_TRG)
 	},
+	{ XE_RTP_NAME("oa_mert_mmio_trg_ccs"),
+	  XE_RTP_RULES(FUNC(match_has_mert), ENGINE_CLASS(COMPUTE)),
+	  XE_RTP_ACTIONS(WHITELIST_OA_MERT_MMIO_TRG)
+	},
+	{ XE_RTP_NAME("oa_mert_mmio_trg_bcs"),
+	  XE_RTP_RULES(FUNC(match_has_mert), ENGINE_CLASS(COPY)),
+	  XE_RTP_ACTIONS(WHITELIST_OA_MERT_MMIO_TRG)
+	},
 };
 
 static void whitelist_apply_to_hwe(struct xe_hw_engine *hwe)
-- 
2.48.1

