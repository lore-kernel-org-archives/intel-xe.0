Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F5B0E7718C
	for <intel-xe@archiver.kernel.org>; Fri, 20 Dec 2024 19:42:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0459710F047;
	Fri, 20 Dec 2024 19:42:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i7MCTbwR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF64410E011
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Dec 2024 19:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734723753; x=1766259753;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+yTyY/5MyxIk879NUn3P5t1sxdbCGgj4oLC6x/QTfjU=;
 b=i7MCTbwRyyZR0XdTkjJHOdAOFc0JfNXzOLF6jonGLmftjuMmjdDkukSO
 M/MibSC88rLrnfWd3DDhHPQZjN/+kbqzAsYF3IXX+Kz/v6PR2DnBvpDMs
 zSPOPbIq+S15xf7F5RF6mnZcqgcLqMhFKlz+AuppfQ4wrBpluRSpmt23u
 Yg0Kh6FczMscgRe9ZPkE/+knPc6p+oJnMVF1FJQXKllnTBHb9V+FiEaui
 ZToB9gdkXZjyeQCp1VFdcfB9Ea8c1t0Pkpwh7BaGIJfmM2wYqSv1o+/Cx
 gx6r183NqGWhJnIawc6TNTwmME8K/NHtfjwr4p8ARdweFdUb/u2ghB7l/ g==;
X-CSE-ConnectionGUID: 7Klc9KJ6S2iDr5uCBgj1mQ==
X-CSE-MsgGUID: knRBoBdPQ8S+bQ74b9N+dg==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="38965226"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; d="scan'208";a="38965226"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 11:42:33 -0800
X-CSE-ConnectionGUID: JkkJBqHpQ6yeiNZzPbTAhA==
X-CSE-MsgGUID: aeleXj1mS8mQrSj4zb5Kbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="99075507"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.5.201])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 11:42:31 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v2 10/11] drm/xe/kunit: Allow to replace
 xe_managed_bo_create_pin_map()
Date: Fri, 20 Dec 2024 20:42:03 +0100
Message-Id: <20241220194205.995-11-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20241220194205.995-1-michal.wajdeczko@intel.com>
References: <20241220194205.995-1-michal.wajdeczko@intel.com>
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
index e6c896ad5602..32ec026df429 100644
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
@@ -1781,6 +1783,8 @@ struct xe_bo *xe_managed_bo_create_pin_map(struct xe_device *xe, struct xe_tile
 	struct xe_bo *bo;
 	int ret;
 
+	KUNIT_STATIC_STUB_REDIRECT(xe_managed_bo_create_pin_map, xe, tile, size, flags);
+
 	bo = xe_bo_create_pin_map(xe, tile, NULL, size, ttm_bo_type_kernel, flags);
 	if (IS_ERR(bo))
 		return bo;
-- 
2.47.1

