Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21279C4167B
	for <intel-xe@archiver.kernel.org>; Mon,  6 Nov 2023 06:48:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA46110E26E;
	Mon,  6 Nov 2023 06:48:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9A3310E26E
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Nov 2023 06:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699253332; x=1730789332;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gH1CIwSxn2db0C6hn0lodARQ51xNupVMzbnmcWo0yMA=;
 b=PiVodZTZT0glxf8lEgIDySoai/Rou/LKff7F1AfP4yHaAhYdxObUvoPt
 tM4FFo7B8+EHKQHHxneIFh6uhzDsBWIcEiHG/wUJitMc6cs/N66N68byD
 X7zCuKEVx3qrGq4qYhz/8m7Cy7WYxc8l3/JTqSbrNthPknHYhUMzplOCS
 nnxyWXjPv5VpzOrWOdDyXU8i4rR/5+p75zMY+xDfjtfGD74DTieTe+jE9
 nlNM1JCvoMMQx1nl5yUNbInHApbIaacwEK6N63mmuGRO3jZp/FhYJa/SE
 pUXaMM3E5j6RQ+zo9xvmMOY9yuBIpfcyPQ/kbRssTuNsll3TC4asYKnTI A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="369424622"
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; d="scan'208";a="369424622"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2023 22:48:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; 
   d="scan'208";a="3534585"
Received: from rdegreef-mobl2.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.249.42.181])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2023 22:48:50 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  6 Nov 2023 08:48:27 +0200
Message-Id: <20231106064834.161647-2-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231106064834.161647-1-jouni.hogander@intel.com>
References: <20231106064834.161647-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/8] fixup! drm/xe/display: Implement display
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

Using i915_fence_timeout causes linking error as i915_fence_context_timeout
doesn't exist for Xe. Return just MAX_SCHEDULE_TIMEOUT.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/xe/compat-i915-headers/i915_config.h | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_config.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_config.h
index 10e18b036489..e835bea08d1b 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_config.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_config.h
@@ -6,18 +6,14 @@
 #ifndef __I915_CONFIG_H__
 #define __I915_CONFIG_H__
 
-#include <linux/types.h>
-#include <linux/limits.h>
+#include <linux/sched.h>
 
 struct drm_i915_private;
 
-unsigned long i915_fence_context_timeout(const struct drm_i915_private *i915,
-					 u64 context);
-
 static inline unsigned long
 i915_fence_timeout(const struct drm_i915_private *i915)
 {
-	return i915_fence_context_timeout(i915, U64_MAX);
+	return MAX_SCHEDULE_TIMEOUT;
 }
 
 #endif /* __I915_CONFIG_H__ */
-- 
2.34.1

