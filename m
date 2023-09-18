Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD6C3CD37B0
	for <intel-xe@archiver.kernel.org>; Mon, 18 Sep 2023 07:01:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9582110E1B0;
	Mon, 18 Sep 2023 07:01:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64DA310E1B0
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Sep 2023 07:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695020513; x=1726556513;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VcxnV9+U9Z9smRwyOXehURuzDTYud62fgtgtNKuETbc=;
 b=ajwwcxfHvKbTIw+rmazUtn0aAhLdKWsYCv3SxssogydpGTD7Wz+VTerf
 R8jMZqfHxVXt1d3fP3Fy8I6Oc7mYHXxWBUrQ63b1Pu+GYkQfx6k5Ohriz
 ZDwDzlw97uJAHsgbSdy57jVKFhGC4iQ+aSEi7TmTEc0QtsA+a9muvz1Ln
 JFLckxMrG8BP4OlKzLPaCh0lhY56j9zwHfBsRM4ep75OSKojhah7Pzw2h
 u5PfK4hmAot5YBerd1RwzJ8S3j4kIAF3uwDhmyu0SkmnrgJbN/Rogt9fX
 ymCNHDYf16oiYXgGg87ltEo81M+dC2bnwoJ2XPvdGz9noRs78Q7yE2Q/a w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="382325272"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; d="scan'208";a="382325272"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 00:01:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="695420488"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; d="scan'208";a="695420488"
Received: from pjfarr-mobl2.ger.corp.intel.com (HELO jhogande-mobl1.intel.com)
 ([10.251.218.135])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 00:01:43 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 18 Sep 2023 10:01:00 +0300
Message-Id: <20230918070100.1387082-5-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230918070100.1387082-1-jouni.hogander@intel.com>
References: <20230918070100.1387082-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 4/4] fixup! drm/xe/display: Implement display
 support
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

xe_runtime_pm changed to intel_runtime_pm.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
index 03ac39efba38..2d5d8be52f88 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
@@ -156,7 +156,7 @@ static inline struct drm_i915_private *kdev_to_i915(struct device *kdev)
 
 #include "intel_wakeref.h"
 
-static inline bool intel_runtime_pm_get(struct xe_runtime_pm *pm)
+static inline bool intel_runtime_pm_get(struct intel_runtime_pm *pm)
 {
 	struct xe_device *xe = container_of(pm, struct xe_device, runtime_pm);
 
@@ -167,21 +167,21 @@ static inline bool intel_runtime_pm_get(struct xe_runtime_pm *pm)
 	return true;
 }
 
-static inline bool intel_runtime_pm_get_if_in_use(struct xe_runtime_pm *pm)
+static inline bool intel_runtime_pm_get_if_in_use(struct intel_runtime_pm *pm)
 {
 	struct xe_device *xe = container_of(pm, struct xe_device, runtime_pm);
 
 	return xe_pm_runtime_get_if_active(xe);
 }
 
-static inline void intel_runtime_pm_put_unchecked(struct xe_runtime_pm *pm)
+static inline void intel_runtime_pm_put_unchecked(struct intel_runtime_pm *pm)
 {
 	struct xe_device *xe = container_of(pm, struct xe_device, runtime_pm);
 
 	xe_pm_runtime_put(xe);
 }
 
-static inline void intel_runtime_pm_put(struct xe_runtime_pm *pm, bool wakeref)
+static inline void intel_runtime_pm_put(struct intel_runtime_pm *pm, bool wakeref)
 {
 	if (wakeref)
 		intel_runtime_pm_put_unchecked(pm);
-- 
2.34.1

