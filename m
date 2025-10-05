Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AFC6CAC5BB
	for <intel-xe@archiver.kernel.org>; Sun,  5 Oct 2025 13:36:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3272389E01;
	Sun,  5 Oct 2025 13:36:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R/V3x+UO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8A52899E9
 for <intel-xe@lists.freedesktop.org>; Sun,  5 Oct 2025 13:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759671412; x=1791207412;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Bq2EIhWw8Pa3JnsbU1d06jz1nHP5BJhv99bCaoYPe20=;
 b=R/V3x+UOGOHr7Yg1SsZwT+l8wkfGsZzz4KKLP+FBAAaplamVJKhOdg9P
 ALLbUTlTSxm4EdvJ7TT9E4F5VtqioBM6y4hK2S0uY2iZLg/yyXJMeUWWV
 ML1T/HXVKu8mdW1RO8j/F1AodLShACKVtTlb4cNohgbU8Bj+72VZ6dnbg
 JfWIAO7GZioQtnA/X0EaChLIRDMbvE4atHlB2qf/FFT04OhhriDWSMxWf
 Orb2N6iuM7yalT8IzoUqB6V/AypoVz57HlYkmRLoP15WBlxqPMFa98KMx
 bbBBDArXJ1fwTJ0YaZG45QcaFIP92SnhTC/ueAjk9IzCq36KQEgzKGqVg Q==;
X-CSE-ConnectionGUID: rdDl/WeESFG5UudH3O/CcQ==
X-CSE-MsgGUID: kc+6AhzsTEyF38N7W1gLMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11573"; a="61779318"
X-IronPort-AV: E=Sophos;i="6.18,318,1751266800"; d="scan'208";a="61779318"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2025 06:36:51 -0700
X-CSE-ConnectionGUID: HnY3fTDGTAKG3EV3kjUY3g==
X-CSE-MsgGUID: ks8XbTcASiagGXyTkdjYVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,318,1751266800"; d="scan'208";a="179348596"
Received: from smanmadh-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.117.173])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2025 06:36:50 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 1/4] drm/xe: Update SRIOV printk macros
Date: Sun,  5 Oct 2025 15:36:37 +0200
Message-ID: <20251005133641.2651-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251005133641.2651-1-michal.wajdeczko@intel.com>
References: <20251005133641.2651-1-michal.wajdeczko@intel.com>
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

Recently we introduced xe-based printk macros, use them instead
of plain drm-based ones.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_sriov_printk.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sriov_printk.h b/drivers/gpu/drm/xe/xe_sriov_printk.h
index 117e1d541692..4c6b5c3d2190 100644
--- a/drivers/gpu/drm/xe/xe_sriov_printk.h
+++ b/drivers/gpu/drm/xe/xe_sriov_printk.h
@@ -1,22 +1,22 @@
 /* SPDX-License-Identifier: MIT */
 /*
- * Copyright © 2023 Intel Corporation
+ * Copyright © 2023-2025 Intel Corporation
  */
 
 #ifndef _XE_SRIOV_PRINTK_H_
 #define _XE_SRIOV_PRINTK_H_
 
-#include <drm/drm_print.h>
-
-#include "xe_device_types.h"
-#include "xe_sriov_types.h"
+#include "xe_printk.h"
 
 #define xe_sriov_printk_prefix(xe) \
 	((xe)->sriov.__mode == XE_SRIOV_MODE_PF ? "PF: " : \
 	 (xe)->sriov.__mode == XE_SRIOV_MODE_VF ? "VF: " : "")
 
+#define __XE_SRIOV_PRINTK_FMT(_xe, _fmt, _args...)	\
+	"%s" _fmt, xe_sriov_printk_prefix(_xe), ##_args
+
 #define xe_sriov_printk(xe, _level, fmt, ...) \
-	drm_##_level(&(xe)->drm, "%s" fmt, xe_sriov_printk_prefix(xe), ##__VA_ARGS__)
+	xe_##_level((xe), __XE_SRIOV_PRINTK_FMT((xe), fmt, ##__VA_ARGS__))
 
 #define xe_sriov_err(xe, fmt, ...) \
 	xe_sriov_printk((xe), err, fmt, ##__VA_ARGS__)
-- 
2.47.1

