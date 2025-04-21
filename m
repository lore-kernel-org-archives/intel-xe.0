Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E25FEC369AB
	for <intel-xe@archiver.kernel.org>; Mon, 21 Apr 2025 05:59:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C81110E04B;
	Mon, 21 Apr 2025 05:59:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lsJuGGF7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52AC710E04B
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Apr 2025 05:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745215146; x=1776751146;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LFSjXqvxzc4KR18u1YJnnHoOpwYUGcgES4OH2fpq668=;
 b=lsJuGGF7Qq6tCUyHb5rOLkk1DDhnrbRRyl973vJwYcmLAeIwA4t3aqco
 9ifH0xOtYLRQgQniER8ibuJJnNfX2bp9kVSsXhdrfonjx8WyfaYn5mqmP
 Okmzs9AhbZSY+Q7l0XSMgxjRqPyaqsSdBgTi5uC04J8cWZlq5KPtgdVMQ
 fqxjctQnV1Djg/NazNcq5t191IQCav78Tbv8ghzflSMMOrmr96oKDigOY
 uOc+FtMz+Lkyh7pokeK99bCm+uAjUoTH3mTqVFuya1bJ+Uyz12vgvezlH
 fysX+j1qaJV8yNnGq5pk7hRidq8gOzLnc6vx2F2jPIM5OMacDq+38KY0R Q==;
X-CSE-ConnectionGUID: avzqQ6KpTcuH5b9ENT9F5w==
X-CSE-MsgGUID: puZf87JXR+Sio8odGDDoxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11409"; a="46451070"
X-IronPort-AV: E=Sophos;i="6.15,227,1739865600"; d="scan'208";a="46451070"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2025 22:59:06 -0700
X-CSE-ConnectionGUID: h9ZFb21NTyqyI6ePTS78pw==
X-CSE-MsgGUID: or8PzfsCSJ+1VFi8/O9xdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,227,1739865600"; d="scan'208";a="131554128"
Received: from hchegond-ivm1.jf.intel.com ([10.165.21.208])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2025 22:59:06 -0700
From: Harish Chegondi <harish.chegondi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com, matthew.s.atwood@intel.com,
 Harish Chegondi <harish.chegondi@intel.com>
Subject: [PATCH 1/1] drm/xe/eustall: Do not support EU stall on SRIOV VF
Date: Sun, 20 Apr 2025 22:59:01 -0700
Message-ID: <10db5d1c7e17aadca7078ff74575b7ffc0d5d6b8.1745215022.git.harish.chegondi@intel.com>
X-Mailer: git-send-email 2.48.1
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

EU stall sampling is not supported on SRIOV VF. Do not
initialize or open EU stall stream on SRIOV VF.

Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
---
 drivers/gpu/drm/xe/xe_eu_stall.c | 3 +++
 drivers/gpu/drm/xe/xe_eu_stall.h | 3 ++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
index f2bb9168967c..64788277ea52 100644
--- a/drivers/gpu/drm/xe/xe_eu_stall.c
+++ b/drivers/gpu/drm/xe/xe_eu_stall.c
@@ -208,6 +208,9 @@ int xe_eu_stall_init(struct xe_gt *gt)
 	struct xe_device *xe = gt_to_xe(gt);
 	int ret;
 
+	if (!xe_eu_stall_supported_on_platform(xe))
+		return 0;
+
 	gt->eu_stall = kzalloc(sizeof(*gt->eu_stall), GFP_KERNEL);
 	if (!gt->eu_stall) {
 		ret = -ENOMEM;
diff --git a/drivers/gpu/drm/xe/xe_eu_stall.h b/drivers/gpu/drm/xe/xe_eu_stall.h
index ed9d0f233566..d1c76e503799 100644
--- a/drivers/gpu/drm/xe/xe_eu_stall.h
+++ b/drivers/gpu/drm/xe/xe_eu_stall.h
@@ -7,6 +7,7 @@
 #define __XE_EU_STALL_H__
 
 #include "xe_gt_types.h"
+#include "xe_sriov.h"
 
 size_t xe_eu_stall_get_per_xecore_buf_size(void);
 size_t xe_eu_stall_data_record_size(struct xe_device *xe);
@@ -19,6 +20,6 @@ int xe_eu_stall_stream_open(struct drm_device *dev,
 
 static inline bool xe_eu_stall_supported_on_platform(struct xe_device *xe)
 {
-	return xe->info.platform == XE_PVC || GRAPHICS_VER(xe) >= 20;
+	return !IS_SRIOV_VF(xe) && (xe->info.platform == XE_PVC || GRAPHICS_VER(xe) >= 20);
 }
 #endif
-- 
2.48.1

