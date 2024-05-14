Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A81EC41513
	for <intel-xe@archiver.kernel.org>; Tue, 14 May 2024 19:01:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B373510E686;
	Tue, 14 May 2024 19:01:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iJTvpnpb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 258F010E4B0
 for <intel-xe@lists.freedesktop.org>; Tue, 14 May 2024 19:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715713265; x=1747249265;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=W0/FBgM6q37WpCj6RxY+MnDAMPxDAS4HBCXBS6d+sig=;
 b=iJTvpnpbR2A/WIBnKTPOdLv6ZfLHyJQCFRLGki/ZAlS204qXeTFy0uQ0
 8rfFXEGpg5qmSFQ1R4nzmjxisaHdU+Mq1JYZ8hnq+gEgtljHdmeRnV34J
 2JHdZLyi4C+Eu4OekMjOpUpFiHiKwqpR7qzXVyFvJZ0PWkusv75CuYRyn
 8V9/xlF9i97+RqSJX/KfwH0TVWG7bylM6FtMA7th+w1CrHX5Tq4cGuakC
 6xsaDk7z299cde29HTw7CYZv5ZXff8BMqx4Ynwpd+QEJqZT+FxBPI7LHi
 JfeEMc1kduMbBqz7ko+v8RbnzdhHYIdo5jFHAstj9ch2/in4jm9R5Lhht w==;
X-CSE-ConnectionGUID: eyv9/jTxQEWO7+ppSVaT9w==
X-CSE-MsgGUID: NmgpKB1RQva8tiEjTu4S4A==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="11523181"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="11523181"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 12:01:05 -0700
X-CSE-ConnectionGUID: NpLl530jQDG/xkSUAyZbHA==
X-CSE-MsgGUID: 86614pYzSlCxWZuqyIrpzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="35565508"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.1.253])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 12:01:04 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 3/8] drm/xe/guc: Add support for threshold KLVs in
 to_string() helper
Date: Tue, 14 May 2024 21:00:10 +0200
Message-Id: <20240514190015.2172-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240514190015.2172-1-michal.wajdeczko@intel.com>
References: <20240514190015.2172-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Use MAKE_XE_GUC_KLV_THRESHOLDS_SET to generate missing conversion
of threshold KLV keys to string.

Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
v2: improve readability of generated case statements (Piotr)
---
 drivers/gpu/drm/xe/xe_guc_klv_helpers.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
index ceca949932a0..9d99fe266d97 100644
--- a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
+++ b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
@@ -8,6 +8,7 @@
 
 #include "abi/guc_klvs_abi.h"
 #include "xe_guc_klv_helpers.h"
+#include "xe_guc_klv_thresholds_set.h"
 
 #define make_u64(hi, lo) ((u64)((u64)(u32)(hi) << 32 | (u32)(lo)))
 
@@ -48,6 +49,17 @@ const char *xe_guc_klv_key_to_string(u16 key)
 		return "begin_db_id";
 	case GUC_KLV_VF_CFG_BEGIN_CONTEXT_ID_KEY:
 		return "begin_ctx_id";
+
+	/* VF CFG threshold keys */
+#define define_threshold_key_to_string_case(TAG, NAME, ...)	\
+								\
+	case MAKE_GUC_KLV_VF_CFG_THRESHOLD_KEY(TAG):		\
+		return #NAME;
+
+	/* private: auto-generated case statements */
+	MAKE_XE_GUC_KLV_THRESHOLDS_SET(define_threshold_key_to_string_case)
+#undef define_threshold_key_to_string_case
+
 	default:
 		return "(unknown)";
 	}
-- 
2.43.0

