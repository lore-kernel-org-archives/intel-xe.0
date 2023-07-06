Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7AD2EB64D9
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jul 2023 14:27:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8078C10E402;
	Thu,  6 Jul 2023 14:27:49 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0124310E412
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jul 2023 14:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688653668; x=1720189668;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FzzLvY85POJ/xFoD6yWtNuttYiB4eElTVIARAgUQfic=;
 b=exheQb27JoZpNm1WE79tVo39GNUCtXwQZGrtVVhaO/utzVnDk6568B+T
 vBoVJQ75eMWToL1eFW/KgvNVRqiG+CujEs54NbyzOYbAXuq2htuJP7Qsq
 4SqlvsPWGefytuDMD8mMEZ+H10wcv31y5sQiSggdquGN/AheQfoFb+XF8
 tskMy2MPxEyirbvpgyZRc/dPc6s361kDKiCrcZeAIvmG368xxIRTnnemj
 Lu5XfJfgthN+RCPmah82ovaPeFqU+tHoJxh0o2DriOCJuHiPw2zR8bau+
 cbKrZNx3dv7o4Sy9KfLf4aO9UUfWl3xBg6zrMIkQXLBOiVp34FpoyPFWw w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="427293297"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; d="scan'208";a="427293297"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2023 07:27:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="1050115782"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; d="scan'208";a="1050115782"
Received: from rblanarx-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.249.33.198])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2023 07:27:46 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  6 Jul 2023 14:27:27 +0000
Message-Id: <20230706142728.6-2-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230706142728.6-1-francois.dugast@intel.com>
References: <20230706142728.6-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/2] fixup! drm/xe: Introduce a new DRM driver
 for Intel GPUs
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
Cc: Francois Dugast <francois.dugast@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Fix some SPDX license identifier warnings reported by checkpatch.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_map.h   | 2 +-
 drivers/gpu/drm/xe/xe_trace.c | 2 +-
 drivers/gpu/drm/xe/xe_trace.h | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_map.h b/drivers/gpu/drm/xe/xe_map.h
index 032c2e8b5438..f62e0c8b67ab 100644
--- a/drivers/gpu/drm/xe/xe_map.h
+++ b/drivers/gpu/drm/xe/xe_map.h
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: MIT
+/* SPDX-License-Identifier: MIT */
 /*
  * Copyright © 2022 Intel Corporation
  */
diff --git a/drivers/gpu/drm/xe/xe_trace.c b/drivers/gpu/drm/xe/xe_trace.c
index 1026fb37f75b..70c8a5f1a9ca 100644
--- a/drivers/gpu/drm/xe/xe_trace.c
+++ b/drivers/gpu/drm/xe/xe_trace.c
@@ -1,4 +1,4 @@
-// SPDX-Liense-Identifier: GPL-2.0
+// SPDX-License-Identifier: MIT
 /*
  * Copyright © 2022 Intel Corporation
  */
diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
index 02861c26e145..b92ad4ab1c79 100644
--- a/drivers/gpu/drm/xe/xe_trace.h
+++ b/drivers/gpu/drm/xe/xe_trace.h
@@ -1,4 +1,4 @@
-/* SPDX-Liense-Identifier: GPL-2.0 */
+/* SPDX-License-Identifier: MIT */
 /*
  * Copyright © 2022 Intel Corporation
  */
-- 
2.34.1

