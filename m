Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA72CC10DCE
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 07:56:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B85EA10EA13;
	Fri,  8 Dec 2023 07:56:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF2B310EA0D
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 07:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702022207; x=1733558207;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JM61r2/kwVBCaZasFZdh1RzdxgdjjyHEd+GVwVHTe9s=;
 b=YQrALQhPvgJczj4nOase7NRYXagzXSd5noxBKNw9lov8M8Mk1ONnMsDc
 e9MqAzX0iazzOX5m+iWEqlekVjMFNxWKdYfN9+zwCITuDctwK7SuHYT55
 szRKlBVpZvDP8wWUGTze9/wKWtWautxlWoogrUqVCFA0POS3wewtYS3y6
 7GTqpPzvT2a4uHI/q3y+BdFFJ3Iy8zMXlIDBr2tkZB769khxvkHXhEGg5
 PLnhu7LKMPn+pQvwCwLKkMo3mNBeXAZi8FXRoc0uXTzHiCMc0B481wSTo
 Puzc5sVjrn0adwWnDXfnBi4Z1LpxqxoTH4lol3hm0p8+Ql0SbFXke6h3d Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="391542415"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; d="scan'208";a="391542415"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 23:56:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="838044743"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; d="scan'208";a="838044743"
Received: from cannonro-mobl.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.252.63.126])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 23:56:46 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 8/9] fixup! drm/xe/display: Implement display support
Date: Fri,  8 Dec 2023 09:56:09 +0200
Message-Id: <20231208075610.3005795-9-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231208075610.3005795-1-jouni.hogander@intel.com>
References: <20231208075610.3005795-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Define I915_TILING_X and I915_TILING_Y as 0 This way we get rid of
remaining ifdefs in skl_universal_plane.c.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
index 23f2d037c313..a20d2638ea7a 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
@@ -9,6 +9,12 @@
 #include <uapi/drm/i915_drm.h>
 #include <drm/drm_mm.h>
 
+/* We don't want these from i915_drm.h in case of Xe */
+#undef I915_TILING_X
+#undef I915_TILING_Y
+#define I915_TILING_X 0
+#define I915_TILING_Y 0
+
 struct xe_bo;
 
 struct i915_vma {
-- 
2.34.1

