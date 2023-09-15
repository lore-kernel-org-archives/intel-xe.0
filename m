Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0E24EE6455
	for <intel-xe@archiver.kernel.org>; Fri, 15 Sep 2023 10:57:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D8E610E61B;
	Fri, 15 Sep 2023 10:57:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1577810E61A
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Sep 2023 10:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694775464; x=1726311464;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GHcorrX7Y7JDatoCBCU3MvhceW4XOeZt/9c2m41VMeU=;
 b=b4RG+JhX04Et+55orlxxa6MaNLn3o9Ufocyae/BWYwC29y59ndoyg3yJ
 kFRfnkuxVW0UHDufKEUDyitG/1GlMW8oeKzR/FXn2KWm7zoWXUs0v0I2V
 pwtYPiEpsFNR6N8waFQvhFZbI7XQ6hBABd1F44Y3fO5RFzCQeyeMBerHu
 WZkokYJZsFrSkIvo0PGjecUiKtoTSOWITK/COYd5zBLGNBP3Wnb80LxmA
 WXAp2kCY7CEYRo/vqv4cP41eDelVvdlAZ4sQyUyEfOFPgnbrz6pa5BZxM
 rbNiRPwBO6sX4rRgDCUYakhuq9x6ZbkzT9ycy0Nj3kvze+MTe/3xHi3Ss w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="379140145"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; d="scan'208";a="379140145"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 03:57:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="835171655"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; d="scan'208";a="835171655"
Received: from cohrs-mobl1.ger.corp.intel.com (HELO jhogande-mobl1.intel.com)
 ([10.252.48.100])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 03:57:42 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 15 Sep 2023 13:57:24 +0300
Message-Id: <20230915105724.1025509-7-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230915105724.1025509-1-jouni.hogander@intel.com>
References: <20230915105724.1025509-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 6/6] fixup! drm/xe: Add frontbuffer setter/getter
 for xe_bo
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

i915 frontbuffer setter and getter are moved into separate header file. We
need to do same for Xe frontbuffer setter and getter.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 .../gem/i915_gem_object_frontbuffer.h                | 12 ++++++++++++
 drivers/gpu/drm/xe/xe_bo.h                           |  3 ---
 2 files changed, 12 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object_frontbuffer.h

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object_frontbuffer.h b/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object_frontbuffer.h
new file mode 100644
index 000000000000..227965e5f784
--- /dev/null
+++ b/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object_frontbuffer.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2022 Intel Corporation
+ */
+
+#ifndef _I915_GEM_OBJECT_H_
+#define _I915_GEM_OBJECT_H_
+
+#define i915_gem_object_get_frontbuffer(obj)		NULL
+#define i915_gem_object_set_frontbuffer(obj, front)	(front)
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 4a68d869b3b5..9097bcc13209 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -305,9 +305,6 @@ static inline unsigned int xe_sg_segment_size(struct device *dev)
 	return round_down(max / 2, PAGE_SIZE);
 }
 
-#define i915_gem_object_get_frontbuffer(obj)		NULL
-#define i915_gem_object_set_frontbuffer(obj, front)	(front)
-
 #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
 /**
  * xe_bo_is_mem_type - Whether the bo currently resides in the given
-- 
2.34.1

