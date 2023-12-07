Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EA33C10F05
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 13:01:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31D0010E8A0;
	Thu,  7 Dec 2023 13:01:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 895C910E1CD
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 13:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701954067; x=1733490067;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cLRMVcQUo3j2Sb1RS2RVdvWoKBS/U0q7wC9P7Z4Iuu0=;
 b=bvd0xCdJj76i8Cw9ASNcUfONMhi6yroDhQXNmhie8EYARBmgwYKiqF+i
 fS0MZnwVfJUgFFFv5hUmo4YUQY3T1McHPEUNzovyi+FlIaQtAlPR211EH
 PapzcFhYQTBauwe/ata3GXtwsvdgfFCJhcS9rGBg4ngpfmV5y37MVXEos
 JOKyFZAvH4aNwMJzHR3Znsf99IfM/SSOQ98YRrizRuUNiDoqEBhOBnNSt
 u2K4DmLz0CpQ0wuYiD3+I4F5fo7euWdiJhc3sHapLi9j4wlHwZCnC1FGM
 DCd7YMZoST/OHDA2KTVBsQCdJKEf4b2yTbFjNgRR90OGfGcvC0beYPKtp g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="1308971"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="1308971"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 05:01:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="721454181"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="721454181"
Received: from rlgreyi-mobl.amr.corp.intel.com (HELO jhogande-mobl1.intel.com)
 ([10.252.46.17])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 05:01:04 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 3/9] fixup! drm/xe/display: Implement display support
Date: Thu,  7 Dec 2023 15:00:40 +0200
Message-Id: <20231207130046.2350822-4-jouni.hogander@intel.com>
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

We need to add i915_gem_object_get_dma_address stub to build
intel_cursor.h.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 .../gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h b/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h
index 3b305c291cdd..b991069b5cb3 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h
@@ -6,6 +6,15 @@
 #ifndef _I915_GEM_OBJECT_H_
 #define _I915_GEM_OBJECT_H_
 
+#include "xe_bo.h"
+
 #define i915_gem_object_is_shmem(obj) ((obj)->flags & XE_BO_CREATE_SYSTEM_BIT)
 
+static inline dma_addr_t i915_gem_object_get_dma_address(const struct xe_bo *bo, pgoff_t n)
+{
+	/* Should never be called */
+	WARN_ON(1);
+	return n;
+}
+
 #endif
-- 
2.34.1

