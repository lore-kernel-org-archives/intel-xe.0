Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 387C6C25B4F
	for <intel-xe@archiver.kernel.org>; Mon,  6 May 2024 13:38:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A122410FCEE;
	Mon,  6 May 2024 13:38:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="envfnDy/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2C7C10E7C7
 for <intel-xe@lists.freedesktop.org>; Mon,  6 May 2024 13:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715002710; x=1746538710;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Jep0oledEZH0vW0RMPoXAyiFMzPOwQu+WCyp7jkEbXc=;
 b=envfnDy/vlNWk8hN0Pczxf12ZaosOjmKHZRFgTF+QiSNa9pNS2c9L0QZ
 wDXABk+cMgGnnMrMbxGY1UGed+b/g+ZTNcFhMLYzg1/DAT/g2MVWzrZ1B
 UKPpnSOUnuT9O2SxRdeeY56qqNtP2JPUDjAj00zl72D/eYtl5YlAeWKlU
 NYvbc0Ny8X2qwkBvgESc2nQeESYjr0SEVp1Jnjk/UxjLODt5a+p+ZcueZ
 KBqshg4SoHlVf/P7/aHpoZBXhR9VoSYN5hYZCTZymieAkeQVFQAKx+mXA
 /evbImH0EoiQ8dsy4L8oa1br3bWOSEgh4Unc/7IriP0/icVvZbRWMCn5r g==;
X-CSE-ConnectionGUID: d+YhViVZThKJUc3WdgO0IQ==
X-CSE-MsgGUID: q4dWi2e2SdyL3xC5pSErRw==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="21903417"
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; d="scan'208";a="21903417"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 06:38:30 -0700
X-CSE-ConnectionGUID: KaskHSYASeak8AeI3YDl5w==
X-CSE-MsgGUID: xSOOj0VsR1WSiai+oKZHTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; d="scan'208";a="28131662"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.96.165])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 06:38:28 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 1/8] drm/xe/guc: Add more KLV helper macros
Date: Mon,  6 May 2024 15:38:07 +0200
Message-Id: <20240506133814.2571-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240506133814.2571-1-michal.wajdeczko@intel.com>
References: <20240506133814.2571-1-michal.wajdeczko@intel.com>
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

In upcoming patches we will want to generate some of the KLV keys
from other macros. Add MAKE_GUC_KLV_{KEY|LEN} macros for that and
make sure they will correctly expand provided TAG parameter. Also
fix PREP_GUC_KLV_TAG to also work correctly within other macros.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_klv_helpers.h | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_klv_helpers.h b/drivers/gpu/drm/xe/xe_guc_klv_helpers.h
index b835e0ebe6db..c676d21c173b 100644
--- a/drivers/gpu/drm/xe/xe_guc_klv_helpers.h
+++ b/drivers/gpu/drm/xe/xe_guc_klv_helpers.h
@@ -6,6 +6,7 @@
 #ifndef _XE_GUC_KLV_HELPERS_H_
 #define _XE_GUC_KLV_HELPERS_H_
 
+#include <linux/args.h>
 #include <linux/types.h>
 
 struct drm_printer;
@@ -37,6 +38,18 @@ int xe_guc_klv_count(const u32 *klvs, u32 num_dwords);
 	(FIELD_PREP_CONST(GUC_KLV_0_KEY, (key)) | \
 	 FIELD_PREP_CONST(GUC_KLV_0_LEN, (len)))
 
+/**
+ * MAKE_GUC_KLV_KEY - Prepare KLV KEY name based on unique KLV definition tag.
+ * @TAG: unique tag of the KLV definition
+ */
+#define MAKE_GUC_KLV_KEY(TAG) CONCATENATE(CONCATENATE(GUC_KLV_, TAG), _KEY)
+
+/**
+ * MAKE_GUC_KLV_LEN - Prepare KLV LEN name based on unique KLV definition tag.
+ * @TAG: unique tag of the KLV definition
+ */
+#define MAKE_GUC_KLV_LEN(TAG) CONCATENATE(CONCATENATE(GUC_KLV_, TAG), _LEN)
+
 /**
  * PREP_GUC_KLV_TAG - Prepare KLV header value based on unique KLV definition tag.
  * @TAG: unique tag of the KLV definition
@@ -46,6 +59,6 @@ int xe_guc_klv_count(const u32 *klvs, u32 num_dwords);
  * Return: value of the KLV header (u32).
  */
 #define PREP_GUC_KLV_TAG(TAG) \
-	PREP_GUC_KLV_CONST(GUC_KLV_##TAG##_KEY, GUC_KLV_##TAG##_LEN)
+	PREP_GUC_KLV_CONST(MAKE_GUC_KLV_KEY(TAG), MAKE_GUC_KLV_LEN(TAG))
 
 #endif
-- 
2.43.0

