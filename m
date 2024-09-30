Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48016CE8373
	for <intel-xe@archiver.kernel.org>; Mon, 30 Sep 2024 16:41:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1420710E552;
	Mon, 30 Sep 2024 16:41:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WidZt6/y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D91110E552
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Sep 2024 16:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727714469; x=1759250469;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zrA+rGGdrCGznhVGqvWvu3Epp/dXHbeE6+cHzpN4RqY=;
 b=WidZt6/ypapWMB3Cix9G3IRfnQmjRmrdnge75uIF9mqgpZS/6q1QnHLK
 u6+DvVCIUuQD9Ox14oLabgTFXQn3EmitxAXYKc71qOhvQRRjcEQ8hYaro
 363i62cN2jihVjJQch1+701ExhtIsx11ilGk6EOZ+LWVpPpn3p1VnOpZt
 9b8EWTysKkOrhV3A/jNhk6kVDQzHSNJvdCHQMjVU09j44bwy0DvdEoOJ0
 3I3GfReovTxFC5TNoo5UecnEQC+Tu7GbWy9ezUzfBGcWSduTsLREAKcPs
 n/fhn8o9iIcI6a7p7c/VfXb5U014sNXvNKBjV3qoxBM7ExFVag0qNf5CE g==;
X-CSE-ConnectionGUID: iu8ssxU5TXSetiIQ3tKvfA==
X-CSE-MsgGUID: b2fPLVUOQsSPxSIP2kAKRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="30519901"
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="30519901"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 09:41:09 -0700
X-CSE-ConnectionGUID: i0F5YgJrTt20uA89iFDQYw==
X-CSE-MsgGUID: 3QxmcGZ7TVOum49N8Dkppg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="74152415"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.136])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 09:41:06 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH] drm/xe/compat: remove unused i915_gpu_error.h
Date: Mon, 30 Sep 2024 19:40:52 +0300
Message-Id: <20240930164052.3862911-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

The last user of the compat header was removed in commit d6b933912df0
("drm/i915/dmc: convert intel_dmc_print_error_state() to drm_printer").

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 .../drm/xe/compat-i915-headers/i915_gpu_error.h | 17 -----------------
 1 file changed, 17 deletions(-)
 delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_gpu_error.h

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_gpu_error.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_gpu_error.h
deleted file mode 100644
index 98e9dd78f670..000000000000
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_gpu_error.h
+++ /dev/null
@@ -1,17 +0,0 @@
-/* SPDX-License-Identifier: MIT */
-/*
- * Copyright © 2023 Intel Corporation
- */
-
-#ifndef _I915_GPU_ERROR_H_
-#define _I915_GPU_ERROR_H_
-
-struct drm_i915_error_state_buf;
-
-__printf(2, 3)
-static inline void
-i915_error_printf(struct drm_i915_error_state_buf *e, const char *f, ...)
-{
-}
-
-#endif
-- 
2.39.5

