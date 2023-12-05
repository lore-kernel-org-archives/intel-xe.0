Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CF6EC4167B
	for <intel-xe@archiver.kernel.org>; Tue,  5 Dec 2023 11:27:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 093A6891AA;
	Tue,  5 Dec 2023 11:27:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07B0110E50B
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Dec 2023 11:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701775661; x=1733311661;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fi3jhXQp19yU4AVlCuRxW5dc/Lo7wZCXZbHPVH/p32I=;
 b=UZYVfWLOb03n1Cb8Goo7c7SE1gvdY2rpsmC2a8OoOrROKZ7ONYc62BnJ
 XST5bsjiyvADn01F3DQpdAwq6VYp910RdZJi2h2VVN5VS22qThbOCU8Fr
 VKfAdxddRwWYz5WLMahz2NrwW4MAc+VW++FueSCi9O+QAj5nU5EkV++Se
 7btglrukotzf6qZQKgQaiWG2EMwLq82zrfiy6si/capmR6zF0DlSdqVGq
 3X75SLpf95mFd/gGsmge8qTwKGbmOrgttk0W2MgQCIshYjqdKBxOkZaEl
 JNTTltFSHMHzbhKFQw/UUjR+p0x4e4QcFqz7zvj+Rhzvt2SRLxFWmHMSm w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="396675994"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; d="scan'208";a="396675994"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 03:27:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="774606566"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; d="scan'208";a="774606566"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.249.33.227])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 03:27:39 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  5 Dec 2023 13:27:16 +0200
Message-Id: <20231205112717.1349830-9-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231205112717.1349830-1-jouni.hogander@intel.com>
References: <20231205112717.1349830-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 8/9] fixup! drm/xe/display: Implement display
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

Adding i915_gem_object_is_tiled and i915_gem_object_is_userptr for
intel_fb.c.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 .../xe/compat-i915-headers/gem/i915_gem_object.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h b/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h
index 3b305c291cdd..996b4f4f27dc 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h
@@ -6,6 +6,22 @@
 #ifndef _I915_GEM_OBJECT_H_
 #define _I915_GEM_OBJECT_H_
 
+#include <linux/types.h>
+
+#include "xe_bo.h"
+
 #define i915_gem_object_is_shmem(obj) ((obj)->flags & XE_BO_CREATE_SYSTEM_BIT)
 
+static inline bool i915_gem_object_is_tiled(const struct xe_bo *bo)
+{
+	/* legacy tiling is unused */
+	return false;
+}
+
+static inline bool i915_gem_object_is_userptr(const struct xe_bo *bo)
+{
+	/* legacy tiling is unused */
+	return false;
+}
+
 #endif
-- 
2.34.1

