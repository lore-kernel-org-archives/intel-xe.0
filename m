Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99DD9C4332F
	for <intel-xe@archiver.kernel.org>; Mon,  6 Nov 2023 06:49:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59D7210E273;
	Mon,  6 Nov 2023 06:49:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA8E010E273
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Nov 2023 06:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699253338; x=1730789338;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1rzTE6UtNq0vz7FDrzWpwsg1348qv6vYNyoAWe5fvPo=;
 b=iJSCOjTwTrsKKmcqGaI9376SbSd18kVy3RRkZ0JUlcEvtFXouBKpkS0m
 8ZVjiO51JkkAYLWqmQNk/kQrpn8HoevXFqwDdDigZCIm8AswmavgnUsye
 0tax4RRjjxkC5R1N/PU1+AywS8ghcAT0mpvMT8+ETYsq4izJxLE/fzHjh
 6Smsz5nVAPJmJH0qHkjZyqoooaRHpds8Oe/GXnrw3cDXbKkYlx9INYZHf
 fDxzihR/LhU99L1bm1vnC3EMDsFmWmdKxQE3+9JQdmXl/Kw1wWTdNgPDq
 JxXFpDE/MveNZ1zAplanN5EF/DmcfIT/F6Mdb9ySx3cugCc9QOP5zwRGd Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="369424641"
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; d="scan'208";a="369424641"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2023 22:48:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; 
   d="scan'208";a="3534626"
Received: from rdegreef-mobl2.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.249.42.181])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2023 22:48:56 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  6 Nov 2023 08:48:30 +0200
Message-Id: <20231106064834.161647-5-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231106064834.161647-1-jouni.hogander@intel.com>
References: <20231106064834.161647-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 4/8] fixup! drm/xe/display: Implement display
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

Intel_prepare_plane_fb is still using i915_gem_fence_wait_priority. Add
emtpy define and it's dependencies for Xe as well.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
index 1e79e996e11d..46652e6c8ff7 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
@@ -206,6 +206,12 @@ static inline void intel_runtime_pm_put(struct xe_runtime_pm *pm, bool wakeref)
 #define intel_uncore_arm_unclaimed_mmio_detection(x) do { } while (0)
 #define i915_sw_fence_commit(x) do { } while (0)
 
+#define I915_PRIORITY_DISPLAY 0
+struct i915_sched_attr {
+	int priority;
+};
+#define i915_gem_fence_wait_priority(fence, attr) do { (void) attr; } while (0)
+
 #define with_intel_runtime_pm(rpm, wf) \
 	for ((wf) = intel_runtime_pm_get(rpm); (wf); \
 	     intel_runtime_pm_put((rpm), (wf)), (wf) = 0)
-- 
2.34.1

