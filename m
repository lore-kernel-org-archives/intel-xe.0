Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5933BC10DC3
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 13:01:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2857410E8A7;
	Thu,  7 Dec 2023 13:01:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3E6110E8A1
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 13:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701954075; x=1733490075;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0Sfk26LcVl7/a8meufbx2x5iYJXG9t2PUMLjwL9ryqw=;
 b=Dx/B26nWdX7o28efeGsod0P4q76I6ZMz0RHB2C06QCqURKU4LUtRcTN6
 zs5Swdg/rBFcT6N8yLzxliREQS/edSP3GTL082SH2fdANE9PouogsldSE
 4tnLyqcYreSKMhrpLSpSvKWSDqXQfzCJz46IKCCEDwXK0zAFWcNUqNde3
 vl6OgYRSSgJoIjtxI0+TvTgOvYc+nw4X+RPRT9YEqTweLMNCxk3DjH8TS
 sWV84ev0quxQHeOp5xp6hAHMXKmEfWM3q3W/GF+KGkzBAnw5cO3jOBwPj
 5vjwWKMjQXeCtW/I1LqYl4NE8Es2JBF+7xL84Bxpq+EK9cNREzBJY0Da5 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="1308998"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="1308998"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 05:01:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="721454248"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="721454248"
Received: from rlgreyi-mobl.amr.corp.intel.com (HELO jhogande-mobl1.intel.com)
 ([10.252.46.17])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 05:01:13 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 8/9] fixup! drm/xe/display: Implement display support
Date: Thu,  7 Dec 2023 15:00:45 +0200
Message-Id: <20231207130046.2350822-9-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231207130046.2350822-1-jouni.hogander@intel.com>
References: <20231207130046.2350822-1-jouni.hogander@intel.com>
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

