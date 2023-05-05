Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA2F8C77B7C
	for <intel-xe@archiver.kernel.org>; Fri,  5 May 2023 08:31:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B439F10E5A7;
	Fri,  5 May 2023 08:31:17 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0368710E5A7
 for <intel-xe@lists.freedesktop.org>; Fri,  5 May 2023 08:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683275476; x=1714811476;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WVINniGxMKT5DiNKTZ0X0VgwjIjqfxzoryMqA//Gu0M=;
 b=VCzW1tML4M8q2IZ0z5wUx2kLwNNH6ziXe2FYgeegdGDW41/jUmwGlX8X
 d6HMg1Qc5WSa6nGcF6a4YxHtdUkrcJ7t49Q9HiKW7qXsEXpphnQK/l6QR
 3YtFWqStlMS5SeyoMEWiD/SIreoWe0G2rmhG6FBUS+MACajB8x+L7l6ZW
 iZOoJL4cb5wW4Jk6QWUdpm5fNsewl+nM1gihirL0Z8R6HydEKKz10qx2o
 1zjpMZO0/49PXjzag2VXE2MNe2qJeSo/cAKzwWrPOAFdCWxdYp0/QsvlD
 SUn1Ca4YPba5oP7veIbAF1ogsrhBm/6bAHKzkbLj65F38q6Xcvgf1iQt9 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="328783315"
X-IronPort-AV: E=Sophos;i="5.99,251,1677571200"; d="scan'208";a="328783315"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2023 01:31:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="943749634"
X-IronPort-AV: E=Sophos;i="5.99,251,1677571200"; d="scan'208";a="943749634"
Received: from pklosowski.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.252.36.178])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2023 01:31:13 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  5 May 2023 11:29:50 +0300
Message-Id: <20230505082956.2247875-15-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230505082956.2247875-1-jouni.hogander@intel.com>
References: <20230505082956.2247875-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC PATCH 14/20] drm/xe: Add function to clear scanout
 flag
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
Cc: jani.nikula@intel.com,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 ville.syrjala@linux.intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add function to clear scanout flag. This will be called by frontbuffer
tracking code.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
index c40bb27ac72a..dec11721ef6a 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
@@ -4,11 +4,22 @@
 #include <uapi/drm/i915_drm.h>
 #include <drm/drm_mm.h>
 
-struct xe_bo;
+#include <xe_bo.h>
+#include <xe_bo_types.h>
 
 struct i915_vma {
 	struct xe_bo *bo, *dpt;
 	struct drm_mm_node node;
 };
 
+static inline void i915_ggtt_clear_scanout(struct xe_bo *bo)
+{
+	int ret;
+
+	ret = ttm_bo_reserve(&bo->ttm, true, false, NULL);
+	XE_WARN_ON(ret);
+	bo->flags &= ~XE_BO_SCANOUT_BIT;
+	ttm_bo_unreserve(&bo->ttm);
+}
+
 #endif
-- 
2.34.1

