Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04F7EC4707B
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jan 2024 09:16:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD51210E86E;
	Thu, 11 Jan 2024 09:16:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C276D10E86E
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jan 2024 09:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704964601; x=1736500601;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9umPHHLj4IUh238VjVTHcgAX+so8GUkEixAmNAf3aJM=;
 b=TDzP55o08w9hS4amHYFed4mevNOElPjiaQAso4ZqCoRMU/LWEeo8j/Ex
 RNjmc8g6jioF9XZ+n9sDtAGS7VtCwSU0vFO+sGWqRJ9ShkyQxwHPQCGG3
 vvHtaG4X4LgznjJ2RDju5hHZkBamgyd63xMH12mm7vTrq1+Qs+RfejXI6
 Rv4id0RRgJrM46qLHjcNY74xgk5IwYtT2CN3tTwWu25uXLNMsJZfZxozH
 MYgJPFZ8WXU9F4GNJ3Zmy/r0TTN0wDInqISgkDdQ5KVmYGmLoYAixv7zC
 fakNoVKrf78ccD7/4Z5q3zad8BrFB9/Dj0o0CWO9SouuVY5Np8IqHP1wp Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="397663331"
X-IronPort-AV: E=Sophos;i="6.04,185,1695711600"; d="scan'208";a="397663331"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2024 01:16:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,185,1695711600"; d="scan'208";a="24568522"
Received: from kgdowskx-mobl1.ger.corp.intel.com (HELO
 hazy.ger.corp.intel.com) ([10.249.37.118])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2024 01:16:40 -0800
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [RFC v2 2/4] drm/i915/display: use wakelock in the remaining read
 operations
Date: Thu, 11 Jan 2024 11:16:20 +0200
Message-Id: <20240111091622.1110799-3-luciano.coelho@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240111091622.1110799-1-luciano.coelho@intel.com>
References: <20240111091622.1110799-1-luciano.coelho@intel.com>
MIME-Version: 1.0
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
Cc: jani.nikula@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

In the patch where the framework is implemented, we only add the
wakelock usage in the read-modify-write operations.  This patch brings
in the wakelock implementation to the remaining read operations.  The
idea is to keep these in separate blocks to ease bisections in case
there are any issues.

Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
---
 drivers/gpu/drm/i915/display/intel_de.h | 38 +++++++++++++++++++++++--
 1 file changed, 35 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_de.h b/drivers/gpu/drm/i915/display/intel_de.h
index 0597ddf49f70..c7c00bebb3eb 100644
--- a/drivers/gpu/drm/i915/display/intel_de.h
+++ b/drivers/gpu/drm/i915/display/intel_de.h
@@ -13,26 +13,58 @@
 static inline u32
 intel_de_read(struct drm_i915_private *i915, i915_reg_t reg)
 {
-	return intel_uncore_read(&i915->uncore, reg);
+	u32 val;
+
+	intel_display_wl_get(i915, reg);
+
+	val = intel_uncore_read(&i915->uncore, reg);
+
+	intel_display_wl_put(i915, reg);
+
+	return val;
 }
 
 static inline u8
 intel_de_read8(struct drm_i915_private *i915, i915_reg_t reg)
 {
-	return intel_uncore_read8(&i915->uncore, reg);
+	u8 val;
+
+	intel_display_wl_get(i915, reg);
+
+	val = intel_uncore_read8(&i915->uncore, reg);
+
+	intel_display_wl_put(i915, reg);
+
+	return val;
 }
 
 static inline u64
 intel_de_read64_2x32(struct drm_i915_private *i915,
 		     i915_reg_t lower_reg, i915_reg_t upper_reg)
 {
-	return intel_uncore_read64_2x32(&i915->uncore, lower_reg, upper_reg);
+	u64 val;
+
+	/* Both lower and upper registers will almost certainly be in
+	 * the same range (and very likely one immediately after the
+	 * other), so we can check only the lower one.
+	 */
+	intel_display_wl_get(i915, lower_reg);
+
+	val = intel_uncore_read64_2x32(&i915->uncore, lower_reg, upper_reg);
+
+	intel_display_wl_put(i915, lower_reg);
+
+	return val;
 }
 
 static inline void
 intel_de_posting_read(struct drm_i915_private *i915, i915_reg_t reg)
 {
+	intel_display_wl_get(i915, reg);
+
 	intel_uncore_posting_read(&i915->uncore, reg);
+
+	intel_display_wl_put(i915, reg);
 }
 
 static inline void
-- 
2.39.2

