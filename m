Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91420C6FD1D
	for <intel-xe@archiver.kernel.org>; Thu, 23 Mar 2023 08:51:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5652710E358;
	Thu, 23 Mar 2023 08:51:00 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA30810E358
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Mar 2023 08:50:57 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 23 Mar 2023 09:50:52 +0100
Message-Id: <20230323085052.153697-1-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Rename intel_de.h to xe_de.h
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

Rename intel_de.h to xe_de.h in order to remove #include_next,
and change the ifdef guard to be the same as the rest of xe headers.

This is consistent with the other files that are inside xe/display,
and implement xe specific behavior.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_de.h            | 2 +-
 drivers/gpu/drm/xe/display/{intel_de.h => xe_de.h} | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename drivers/gpu/drm/xe/display/{intel_de.h => xe_de.h} (97%)

diff --git a/drivers/gpu/drm/i915/display/intel_de.h b/drivers/gpu/drm/i915/display/intel_de.h
index 5c223ff6b3ec..267b1108abbb 100644
--- a/drivers/gpu/drm/i915/display/intel_de.h
+++ b/drivers/gpu/drm/i915/display/intel_de.h
@@ -4,7 +4,7 @@
  */
 
 #ifdef BUILD_FOR_XE
-#include_next "intel_de.h"
+#include "xe_de.h"
 #else
 #ifndef __INTEL_DE_H__
 #define __INTEL_DE_H__
diff --git a/drivers/gpu/drm/xe/display/intel_de.h b/drivers/gpu/drm/xe/display/xe_de.h
similarity index 97%
rename from drivers/gpu/drm/xe/display/intel_de.h
rename to drivers/gpu/drm/xe/display/xe_de.h
index 0d0504b483ef..9f92fdb4159a 100644
--- a/drivers/gpu/drm/xe/display/intel_de.h
+++ b/drivers/gpu/drm/xe/display/xe_de.h
@@ -1,10 +1,10 @@
 /* SPDX-License-Identifier: MIT */
 /*
- * Copyright © 2019 Intel Corporation
+ * Copyright © 2019-2022 Intel Corporation
  */
 
-#ifndef __INTEL_DE_H__
-#define __INTEL_DE_H__
+#ifndef _XE_DE_H_
+#define _XE_DE_H_
 
 #include "i915_drv.h"
 #include "xe_mmio.h"
@@ -159,4 +159,4 @@ static inline int intel_de_pcode_request(struct drm_i915_private *i915, u32 mbox
 				timeout_base_ms);
 }
 
-#endif /* __INTEL_DE_H__ */
+#endif
-- 
2.34.1

