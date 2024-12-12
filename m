Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FC19E77180
	for <intel-xe@archiver.kernel.org>; Thu, 12 Dec 2024 01:02:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B55310ECA0;
	Thu, 12 Dec 2024 01:02:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jtnzT0+2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DFE310E2DC
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Dec 2024 01:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733965334; x=1765501334;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=c5huQFdWzeQl+KZUi1RRkD9/viv3YAZKcyYgYEBBrqE=;
 b=jtnzT0+2Z5Ofbxlw+JpgdNUbz4yb8+lJNSU6tTeN2drRNK0z3nQaf0Vq
 zh3EpWATJjVe3Gc3IPkpEbe1e3nIWtmYzeJ9Szznux0KwI1/goQo3fxJ1
 xD0Oh8m9NjUe1/YdUdOQ+2yJe5WDi/EXrjLI4jtkgcZ5BltyDDNtTkZeD
 wY7zLqqWrivGWHy5cToSfSVgDVH/FG9m7PjNQgkwqTycIydpC0XqVSXJ/
 3Ha76klIFZ3ZXPP1lRhPWWgA/hodyMsLhJHoqQVs6E9Hj1bvC7r5xJYnE
 l19PPbkS3eUfOcrYJ+P4J3RdkqRTqWf4rKrk3XEXQTITl5njo36E7V9RL Q==;
X-CSE-ConnectionGUID: KMN3RbksQNe02J0jj0vdfQ==
X-CSE-MsgGUID: odWNxQcSSVyUqErjG5ycSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="45379815"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="45379815"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 17:02:14 -0800
X-CSE-ConnectionGUID: /3Aum3pDSsS2tJ2acXRQEA==
X-CSE-MsgGUID: hI3x9oJ6RD+RDi+wfcIRYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; d="scan'208";a="126856697"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.80.89])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 17:02:13 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 12/13] drm/xe/kunit: Allow to replace
 xe_managed_bo_create_pin_map()
Date: Thu, 12 Dec 2024 02:01:40 +0100
Message-Id: <20241212010141.389-13-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20241212010141.389-1-michal.wajdeczko@intel.com>
References: <20241212010141.389-1-michal.wajdeczko@intel.com>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

We want to use replacement functions in upcoming kunit tests.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 283cd0294570..3ec5d24e5dd0 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -15,6 +15,8 @@
 #include <drm/ttm/ttm_tt.h>
 #include <uapi/drm/xe_drm.h>
 
+#include <kunit/static_stub.h>
+
 #include "xe_device.h"
 #include "xe_dma_buf.h"
 #include "xe_drm_client.h"
@@ -1773,6 +1775,8 @@ struct xe_bo *xe_managed_bo_create_pin_map(struct xe_device *xe, struct xe_tile
 	struct xe_bo *bo;
 	int ret;
 
+	KUNIT_STATIC_STUB_REDIRECT(xe_managed_bo_create_pin_map, xe, tile, size, flags);
+
 	bo = xe_bo_create_pin_map(xe, tile, NULL, size, ttm_bo_type_kernel, flags);
 	if (IS_ERR(bo))
 		return bo;
-- 
2.47.1

