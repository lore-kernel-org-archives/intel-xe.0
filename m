Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D32AC27C78
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jun 2024 04:15:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24D9A10E0E3;
	Thu, 13 Jun 2024 04:15:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XnijTrhE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A2D610E965
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jun 2024 04:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718252032; x=1749788032;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=qWAv5aCjCXiQ/wHZqNRETysakqQz1CqV+r6p4QHVLUU=;
 b=XnijTrhE5gEwXCv6rgjJvulx2I56Q47a1HxoIMV7paXx6ZlRa+vknHih
 pBu332Pu5amfjPThqLsZiEdeWjUJ0SqyV6EgrXnCFLqM0hyveZNlnAOAp
 g5dakhSAq5BwMNFyClMgyoCuFemwM0897lQtLzXKxLns8piuGfp5AJbZm
 jJILtZ9TOiJ19MGFthMSvbp4Sd6ou2P0B5PWaB57BDBmDg8vtaVfBdo6t
 1e4TTyOp0YOZx8IMVN+XcQjy+p62+Vk5XebimfKuS8EmzJZx/rrqc3EBr
 eAlGqApkdRuGxzEzaUHtYYdQ3fNrIK4sUBNj77tZkV1wYTydll6cudZFj A==;
X-CSE-ConnectionGUID: Lv129FVcSzmlJAOE8PwrWA==
X-CSE-MsgGUID: DjW74LxsT5u8ZOw+xj02/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="14847985"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="14847985"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 21:13:49 -0700
X-CSE-ConnectionGUID: l4Jh+hpjRNOWNamF68zueQ==
X-CSE-MsgGUID: 4iJD8/LYTCiWYlo6aoJxeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="40476357"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 21:13:48 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 33/42] drm/xe/svm: Get drm device from drm memory region
Date: Thu, 13 Jun 2024 00:24:20 -0400
Message-Id: <20240613042429.637281-33-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240613042429.637281-1-oak.zeng@intel.com>
References: <20240613042429.637281-1-oak.zeng@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Implement a function xe_mem_region_to_device to
get the drm device which has a specific mem region

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Brian Welty <brian.welty@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/xe/xe_device.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index bb07f5669dbb..bae8ebeda20c 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -9,6 +9,7 @@
 #include <drm/drm_util.h>
 
 #include "xe_device_types.h"
+#include "xe_tile.h"
 
 static inline struct xe_device *to_xe_device(const struct drm_device *dev)
 {
@@ -170,4 +171,11 @@ static inline bool xe_device_wedged(struct xe_device *xe)
 
 void xe_device_declare_wedged(struct xe_device *xe);
 
+static inline struct drm_device *xe_mem_region_to_device(struct drm_mem_region *mr)
+{
+	struct xe_mem_region *xe_mr = container_of(mr, struct xe_mem_region, drm_mr);
+	struct xe_tile *tile = xe_mem_region_to_tile(xe_mr);
+
+	return &tile->xe->drm;
+}
 #endif
-- 
2.26.3

