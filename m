Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B4B7C3ABCB
	for <intel-xe@archiver.kernel.org>; Mon, 12 May 2025 21:53:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D718F10E072;
	Mon, 12 May 2025 21:53:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NrQ+1I6m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 533CE10E28F
 for <Intel-Xe@lists.freedesktop.org>; Mon, 12 May 2025 21:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747086811; x=1778622811;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tlueHOWvEGHfrM9Wz/o0STOf/ZdTQTqDAGcdgdT55Y4=;
 b=NrQ+1I6m50gMYxFXGMJTS2tVZwotvr8gQ9K3PpXeQk7+yDA8pECrKinQ
 nGH4eypTYnwofBiXBk6VGBsBfjRt8JbB7P3C6jmh3yAPgkamtkCLilUXS
 txMIaC1qLmxCcJpl0RVqvhny2l00XHrPH9la6mWbxW+6+pAGibujbmB+F
 FqR8LvEf/Vxfy+kFfZCsV+yyjI5uoJIkYihWMsl8IDw+blu0rAsAwtCIE
 JeiSLFLABrTM0lk8qF5rhe3QlqFYsP7e8wGIEsyk3WraReAYkmor+zs2w
 BNaGJ2qFC0tT/pGAybSLMv6LANuESzlYAlKYRA2XSht0U9mRBOH9+a+qz w==;
X-CSE-ConnectionGUID: xYPYO3HpS2aEPRyHwyetsg==
X-CSE-MsgGUID: 2UvKdgPWTh+xQNP4UGocGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="48156817"
X-IronPort-AV: E=Sophos;i="6.15,283,1739865600"; d="scan'208";a="48156817"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 14:53:25 -0700
X-CSE-ConnectionGUID: a9jtDKgBTUebGnA+ZLvFWg==
X-CSE-MsgGUID: VqnN6qLzQdCXw1sTbL5DCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,283,1739865600"; d="scan'208";a="142375170"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa005.fm.intel.com with ESMTP; 12 May 2025 14:53:25 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v4 3/4] drm/xe/guc: Rename CONFIG_XE_LARGE_GUC_BUFFER
Date: Mon, 12 May 2025 14:53:23 -0700
Message-ID: <20250512215324.1457009-4-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250512215324.1457009-1-John.C.Harrison@Intel.com>
References: <20250512215324.1457009-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

From: John Harrison <John.C.Harrison@Intel.com>

Rename XE_LARGE_GUC_BUFFER to XE_DEBUG_GUC to allow for more debug
only code (in subsequent patch) without adding more config defines
that each control only a single thing.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/Kconfig.debug | 8 +++++---
 drivers/gpu/drm/xe/xe_guc_log.h  | 2 +-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/Kconfig.debug b/drivers/gpu/drm/xe/Kconfig.debug
index 0d749ed44878..db063a513b1e 100644
--- a/drivers/gpu/drm/xe/Kconfig.debug
+++ b/drivers/gpu/drm/xe/Kconfig.debug
@@ -86,12 +86,14 @@ config DRM_XE_KUNIT_TEST
 
 	  If in doubt, say "N".
 
-config DRM_XE_LARGE_GUC_BUFFER
-        bool "Enable larger guc log buffer"
+config DRM_XE_DEBUG_GUC
+        bool "Enable extra GuC related debug options"
+        depends on DRM_XE_DEBUG
         default n
         help
           Choose this option when debugging guc issues.
-          Buffer should be large enough for complex issues.
+          The GuC log buffer is increased to the maximum allowed, which should
+          be large enough for complex issues.
 
           Recommended for driver developers only.
 
diff --git a/drivers/gpu/drm/xe/xe_guc_log.h b/drivers/gpu/drm/xe/xe_guc_log.h
index 5b896f5fafaf..f1e2b0be90a9 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.h
+++ b/drivers/gpu/drm/xe/xe_guc_log.h
@@ -12,7 +12,7 @@
 struct drm_printer;
 struct xe_device;
 
-#if IS_ENABLED(CONFIG_DRM_XE_LARGE_GUC_BUFFER)
+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG_GUC)
 #define CRASH_BUFFER_SIZE       SZ_1M
 #define DEBUG_BUFFER_SIZE       SZ_8M
 #define CAPTURE_BUFFER_SIZE     SZ_2M
-- 
2.49.0

