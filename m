Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB022C4167B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 07:56:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B380D10EA0A;
	Fri,  8 Dec 2023 07:56:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C38AE10EA05
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 07:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702022199; x=1733558199;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HyE+NDIFx64bBGD7evCtnwjocf0F3D+4p4VFGDD75f4=;
 b=SnVPWifU2UY3XJari3qKmeDMvQpI5n8iZ2zgFROAmj33R5C1pc0IIATe
 fMcufZ8vHUxLrqLrKTmkdg2pgJcgmjVvDGhH/jTaZnloYaLRdycsrL1zq
 vBzOsVc3rBjUQ8NjrtlbqnjiaOQjvLbG5NavBvR0dJEtjnlgXBxzPdhh8
 fVH72P1H320jG7SxlnvvBsvRJdX/GL78DbwcLvG0v+cfrI5zDw3espTAV
 u1X3XDf+QfaR0+zxbBlakx6ZYtW3WxRJfKhvh2lWFZyZLARtw3vdFze6v
 dftPhQJI2+WekJKAldZkmpe2QjQKbp2CLNaguokovs6o5ehAA7QjhKX99 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="391542410"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; d="scan'208";a="391542410"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 23:56:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="838044726"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; d="scan'208";a="838044726"
Received: from cannonro-mobl.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.252.63.126])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 23:56:38 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 3/9] fixup! drm/xe/display: Implement display support
Date: Fri,  8 Dec 2023 09:56:04 +0200
Message-Id: <20231208075610.3005795-4-jouni.hogander@intel.com>
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

We need to add i915_gem_object_get_dma_address stub to build
intel_cursor.h.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 .../gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h   | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h b/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h
index 996b4f4f27dc..d226c29f0e6a 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h
@@ -12,6 +12,13 @@
 
 #define i915_gem_object_is_shmem(obj) ((obj)->flags & XE_BO_CREATE_SYSTEM_BIT)
 
+static inline dma_addr_t i915_gem_object_get_dma_address(const struct xe_bo *bo, pgoff_t n)
+{
+	/* Should never be called */
+	WARN_ON(1);
+	return n;
+}
+
 static inline bool i915_gem_object_is_tiled(const struct xe_bo *bo)
 {
 	/* legacy tiling is unused */
-- 
2.34.1

