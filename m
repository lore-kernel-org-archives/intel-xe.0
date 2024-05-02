Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 157C9C4345F
	for <intel-xe@archiver.kernel.org>; Thu,  2 May 2024 22:33:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA90910F6AA;
	Thu,  2 May 2024 22:33:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MS1Tx9/n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CAFC1126FB
 for <intel-xe@lists.freedesktop.org>; Thu,  2 May 2024 22:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714689210; x=1746225210;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JAvlyLKikNfnhGAzCt2P77Ru9YJNDz3EJMrvtRZP0xM=;
 b=MS1Tx9/n+IMv72vH2VFaOdwvArtfzvqF3IXdljiJqtlkU8s4NC4t0NQ9
 qH6ZLqY6L4D681x3GjVD6AyWo7QPkZ60nZDsxsxl9HC/sl3Esns3e7CPT
 hT3PUTx1UzoVuoMTjzcm7jFRCKWZo0AfWG6NG1d+hK50V6brVF0Nz5LRo
 ghoIgbL3SHzicBLJz05JVfQta45m74Av0V4rWIkr6xvMo5KZtXNM2fiLP
 ITGsryinTCo40NdNsdu89C9h+9YrVy0W2VEDBPy73fxyKMYMHMC5RVe74
 +FWIwBqRsO5fOYzRjrXqCE1Qr2FlWLsft9OHyXZx6YsBYEehtClpyPt30 g==;
X-CSE-ConnectionGUID: vQ2TGRp+QWKbXCmBN9Zn4g==
X-CSE-MsgGUID: ZYGWvr4UQZmRzbRU4mevxA==
X-IronPort-AV: E=McAfee;i="6600,9927,11062"; a="10312986"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="10312986"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2024 15:33:30 -0700
X-CSE-ConnectionGUID: XoYk9LUhRdmOFWx5rutsuA==
X-CSE-MsgGUID: xxEl52g7S36Uvzd7Y7cNXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="32061567"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.17.255])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2024 15:33:30 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v3 3/3] drm/xe/rtp: Prefer helper macros from xe_args.h
Date: Fri,  3 May 2024 00:33:13 +0200
Message-Id: <20240502223313.2527-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240502223313.2527-1-michal.wajdeczko@intel.com>
References: <20240502223313.2527-1-michal.wajdeczko@intel.com>
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

Some custom implementation can be replaced with generic macros
from the linux/args.h or xe_args.h.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_rtp.h         |  4 ++--
 drivers/gpu/drm/xe/xe_rtp_helpers.h | 26 ++++++++++----------------
 2 files changed, 12 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
index c56fedd126e6..337b1ef1959c 100644
--- a/drivers/gpu/drm/xe/xe_rtp.h
+++ b/drivers/gpu/drm/xe/xe_rtp.h
@@ -341,7 +341,7 @@ struct xe_reg_sr;
  *	};
  */
 #define XE_RTP_RULES(...)							\
-	.n_rules = _XE_COUNT_ARGS(__VA_ARGS__),					\
+	.n_rules = COUNT_ARGS(__VA_ARGS__),					\
 	.rules = (const struct xe_rtp_rule[]) {					\
 		XE_RTP_PASTE_FOREACH(RULE_, COMMA, (__VA_ARGS__))	\
 	}
@@ -366,7 +366,7 @@ struct xe_reg_sr;
  *	};
  */
 #define XE_RTP_ACTIONS(...)							\
-	.n_actions = _XE_COUNT_ARGS(__VA_ARGS__),				\
+	.n_actions = COUNT_ARGS(__VA_ARGS__),					\
 	.actions = (const struct xe_rtp_action[]) {				\
 		XE_RTP_PASTE_FOREACH(ACTION_, COMMA, (__VA_ARGS__))	\
 	}
diff --git a/drivers/gpu/drm/xe/xe_rtp_helpers.h b/drivers/gpu/drm/xe/xe_rtp_helpers.h
index 181b6290fac3..8129d6d9ef37 100644
--- a/drivers/gpu/drm/xe/xe_rtp_helpers.h
+++ b/drivers/gpu/drm/xe/xe_rtp_helpers.h
@@ -10,22 +10,16 @@
 #error "This header is supposed to be included by xe_rtp.h only"
 #endif
 
+#include "xe_args.h"
+
 /*
  * Helper macros - not to be used outside this header.
  */
 #define _XE_ESC(...) __VA_ARGS__
-#define _XE_COUNT_ARGS(...) _XE_ESC(__XE_COUNT_ARGS(__VA_ARGS__, 5, 4, 3, 2, 1,))
-#define __XE_COUNT_ARGS(_, _5, _4, _3, _2, X_, ...) X_
 
-#define _XE_FIRST(...) _XE_ESC(__XE_FIRST(__VA_ARGS__,))
-#define __XE_FIRST(x_, ...) x_
-#define _XE_TUPLE_TAIL(...) _XE_ESC(__XE_TUPLE_TAIL(__VA_ARGS__))
-#define __XE_TUPLE_TAIL(x_, ...) (__VA_ARGS__)
+#define _XE_TUPLE_TAIL(...) (DROP_FIRST(__VA_ARGS__))
 
-#define _XE_DROP_FIRST(x_, ...) __VA_ARGS__
-
-#define _XE_RTP_CONCAT(a, b) __XE_RTP_CONCAT(a, b)
-#define __XE_RTP_CONCAT(a, b) XE_RTP_ ## a ## b
+#define _XE_RTP_CONCAT(a, b) CONCATENATE(XE_RTP_, CONCATENATE(a, b))
 
 #define __XE_RTP_PASTE_SEP_COMMA		,
 #define __XE_RTP_PASTE_SEP_BITWISE_OR		|
@@ -59,11 +53,11 @@
  *
  *	XE_RTP_TEST_FOO BANANA XE_RTP_TEST_BAR
  */
-#define XE_RTP_PASTE_FOREACH(prefix_, sep_, args_) _XE_ESC(_XE_RTP_CONCAT(PASTE_, _XE_COUNT_ARGS args_)(prefix_, sep_, args_))
-#define XE_RTP_PASTE_1(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, _XE_FIRST args_)
-#define XE_RTP_PASTE_2(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, _XE_FIRST args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_1(prefix_, sep_, _XE_TUPLE_TAIL args_)
-#define XE_RTP_PASTE_3(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, _XE_FIRST args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_2(prefix_, sep_, _XE_TUPLE_TAIL args_)
-#define XE_RTP_PASTE_4(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, _XE_FIRST args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_3(prefix_, sep_, _XE_TUPLE_TAIL args_)
+#define XE_RTP_PASTE_FOREACH(prefix_, sep_, args_) _XE_RTP_CONCAT(PASTE_, COUNT_ARGS args_)(prefix_, sep_, args_)
+#define XE_RTP_PASTE_1(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, PICK_FIRST args_)
+#define XE_RTP_PASTE_2(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, PICK_FIRST args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_1(prefix_, sep_, _XE_TUPLE_TAIL args_)
+#define XE_RTP_PASTE_3(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, PICK_FIRST args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_2(prefix_, sep_, _XE_TUPLE_TAIL args_)
+#define XE_RTP_PASTE_4(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, PICK_FIRST args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_3(prefix_, sep_, _XE_TUPLE_TAIL args_)
 
 /*
  * XE_RTP_DROP_CAST - Drop cast to convert a compound statement to a initializer
@@ -76,6 +70,6 @@
  *
  *	{ .a = 10 }
  */
-#define XE_RTP_DROP_CAST(...) _XE_ESC(_XE_DROP_FIRST _XE_ESC __VA_ARGS__)
+#define XE_RTP_DROP_CAST(...) _XE_ESC(DROP_FIRST _XE_ESC __VA_ARGS__)
 
 #endif
-- 
2.43.0

