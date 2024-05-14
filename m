Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0082C25B79
	for <intel-xe@archiver.kernel.org>; Tue, 14 May 2024 19:01:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39F1710E195;
	Tue, 14 May 2024 19:01:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j70thC8C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3241610E195
 for <intel-xe@lists.freedesktop.org>; Tue, 14 May 2024 19:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715713263; x=1747249263;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=zTDQZz8I65Y29FbzsrQrcVLAA8/z13ISg98JNvKhU+c=;
 b=j70thC8CI5c6uU+owz+CeWZPAAN9eLHsXEJbcie7hW3InKvAziaoF9hv
 vZQyen6nXvl3xb1Ly/zkFoyfmArkzuGcVkXWGg7Ku52FxLwZUNKZcRh+k
 lkkBpwzRGNTsgS1p2CKmWpuzXH0+i4bi9iWF2llLsW6Ct+zsorYMhGeWs
 O8t1SgQxyPUeZGjBwq1GX3mHrcSzT6eWR7xmEoT3M+wvNAmlxVjSLQlaC
 0FLNiJvb/mi5LNqTCweURJC9f+pX9QV2Lzd6V41UgFJE9KcVcrQMQhNcN
 OJoE/GiDyESp44Tfs4LXhmUgLWBSV0x66on7zYemQ70zgKpEeKyAxXovz Q==;
X-CSE-ConnectionGUID: /X6HQoloRBStOX7nefWqCw==
X-CSE-MsgGUID: rciGOKxpQZSFT0sqtFHhnw==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="11523179"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="11523179"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 12:01:03 -0700
X-CSE-ConnectionGUID: ZcRKsk3mTx27Rs9KGyjTQg==
X-CSE-MsgGUID: GuwT9KRKSFOiE09W14hq2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="35565483"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.1.253])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 12:01:02 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 1/8] drm/xe/guc: Add more KLV helper macros
Date: Tue, 14 May 2024 21:00:08 +0200
Message-Id: <20240514190015.2172-2-michal.wajdeczko@intel.com>
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

In upcoming patches we will want to generate some of the KLV keys
from other macros. Add MAKE_GUC_KLV_{KEY|LEN} macros for that and
make sure they will correctly expand provided TAG parameter. Also
fix PREP_GUC_KLV_TAG to also work correctly within other macros.

Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
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

