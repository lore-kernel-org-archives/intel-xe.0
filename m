Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99D2DCEE335
	for <intel-xe@archiver.kernel.org>; Wed,  9 Oct 2024 17:21:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6655910E799;
	Wed,  9 Oct 2024 17:21:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A99MuhP6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B05310E797
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Oct 2024 17:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728494504; x=1760030504;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QfeoFxvsMmXakAmTCo9Cqe6RjC6dG/OOZf1Q3KwcYRY=;
 b=A99MuhP66HdG7n8QLl0izG9bD92pSBCn9UPEqbnTUSVa066Otxq8oUz0
 JIZLlmOF4WPQgB66CZ2LtCjzI+yIf1Uh1+/Yk9AVFKdkGkDL7KWfDnbvW
 sRZfabetHLsQFVdFv6/7JBTpcU9ROBkAA/ZyBfQEeL23SllDiTiD3vQ0E
 BGGVYTLkVcIt7eYQzcpBXp4Ow8NuzSbzyAOIT4EVi9B0I0uTxT9yN6XaW
 +i0OP0NUYCkK4lwhZ3y5DjzZgCypHIHVqjGRW/dZpCgCCkueFc7v4CAEM
 tQYo+/OzXYZsuZpFuk1TPVY6uRD99Jygzmr/GXDWIHe1x7p4OZOP+yIUk g==;
X-CSE-ConnectionGUID: CYOKNXgrRHWQfFuQMQkcsA==
X-CSE-MsgGUID: Efrn5DxnRlOkAMPDRBRzgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="27292658"
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; d="scan'208";a="27292658"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 10:21:43 -0700
X-CSE-ConnectionGUID: AVuao+o6T6mgZf66XypT1w==
X-CSE-MsgGUID: n+Oo6dDqSji/Rhth2Iil1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; d="scan'208";a="76265758"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.1.253])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 10:21:42 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 2/5] drm/xe/kunit: Allow to replace
 xe_managed_bo_create_pin_map()
Date: Wed,  9 Oct 2024 19:21:22 +0200
Message-Id: <20241009172125.1539-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20241009172125.1539-1-michal.wajdeczko@intel.com>
References: <20241009172125.1539-1-michal.wajdeczko@intel.com>
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
index 5e8f60a8d431..f4f90fddddc4 100644
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
@@ -1633,6 +1635,8 @@ struct xe_bo *xe_managed_bo_create_pin_map(struct xe_device *xe, struct xe_tile
 	struct xe_bo *bo;
 	int ret;
 
+	KUNIT_STATIC_STUB_REDIRECT(xe_managed_bo_create_pin_map, xe, tile, size, flags);
+
 	bo = xe_bo_create_pin_map(xe, tile, NULL, size, ttm_bo_type_kernel, flags);
 	if (IS_ERR(bo))
 		return bo;
-- 
2.43.0

