Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76D4EE784AF
	for <intel-xe@archiver.kernel.org>; Mon,  2 Oct 2023 09:16:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B4BE10E26C;
	Mon,  2 Oct 2023 09:16:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E1E010E26C
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Oct 2023 09:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696238159; x=1727774159;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Im2AB/L+FVE6jnpaBdnnxN2mb2WmPPtepkkK5v/DlO8=;
 b=Z9qM/5+RQR/EqKOD6I28G1vXYvTaXL9bJSm2zNnYOef4En36jNWXnUSJ
 eh3JDguex3mEzJEi6xEYtzhd7nLw9XeZg3ZZ2O12rj2o6sodL4ZddOEJN
 Wl+mnyE/t0SEBcY1cb+lUFkOOwd9g7iQI12bDJcCQ2Voad8jM/1ITz89P
 4S/FMWi35Ykb0NT0Nlg1/mni5Y5CFU1qt0MwDjlGqGTWEA2PLHjwd09cU
 qmOgeV2rwHYeM4pCVoKYsRCe5NgUgN1fPUwN7FJTqYGmkCf4evPJN876+
 cBhmk7S51EQD3Ixpo5ig8vHe7mcZpxe5u83dM/SjuDMWKRzQ7nlV/jMVb g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="361985406"
X-IronPort-AV: E=Sophos;i="6.03,193,1694761200"; d="scan'208";a="361985406"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2023 02:15:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="997570367"
X-IronPort-AV: E=Sophos;i="6.03,193,1694761200"; d="scan'208";a="997570367"
Received: from apascali-mobl3.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.251.221.122])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2023 02:15:57 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  2 Oct 2023 12:15:39 +0300
Message-Id: <20231002091542.3696656-2-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231002091542.3696656-1-jouni.hogander@intel.com>
References: <20231002091542.3696656-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 1/4] fixup! drm/xe: Add empty def for
 i915_gem_object_flush_if_display
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

---
 .../xe/compat-i915-headers/gem/i915_gem_object_frontbuffer.h    | 1 -
 drivers/gpu/drm/xe/xe_bo.h                                      | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object_frontbuffer.h b/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object_frontbuffer.h
index 2361a6313308..227965e5f784 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object_frontbuffer.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object_frontbuffer.h
@@ -8,6 +8,5 @@
 
 #define i915_gem_object_get_frontbuffer(obj)		NULL
 #define i915_gem_object_set_frontbuffer(obj, front)	(front)
-#define i915_gem_object_flush_if_display(obj)		((void)(obj))
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 5090bdd1e462..e5e8173433c3 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -316,6 +316,8 @@ static inline unsigned int xe_sg_segment_size(struct device *dev)
 	return round_down(max / 2, PAGE_SIZE);
 }
 
+#define i915_gem_object_flush_if_display(obj)		((void)(obj))
+
 #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
 /**
  * xe_bo_is_mem_type - Whether the bo currently resides in the given
-- 
2.34.1

