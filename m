Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4510C2BB85
	for <intel-xe@archiver.kernel.org>; Wed, 12 Jun 2024 02:15:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AEBE10E772;
	Wed, 12 Jun 2024 02:15:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="anQLyaR6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1886310E77A
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Jun 2024 02:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718158540; x=1749694540;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=qWAv5aCjCXiQ/wHZqNRETysakqQz1CqV+r6p4QHVLUU=;
 b=anQLyaR6pDpjf4GAmFPOuEBmP2A2GFYS/Bbk9NukX2gkmdlFcuE77TIk
 5Ezv09D/TX2cX/zvolEVjajlWc3sDjgAqVYTGmHrlIGUi1oIOCUlvYrf5
 nqVzxNbs6W2Vx9Jne9Zt2Gev/moX2hxYvfY9spV5Ajsq+sq79gpKegTK3
 GlLwdy6Pm+4dUOmknLgANiKXp0oB2MLxAxM21fR9WcuJAESJDqKeLp2IL
 qSNP+CseO6ipCCyHgTxoL9S3P5LINoGWTrkbhq2IdXHKlZG4KBINjYn6d
 zVxQAD7WuCBGdXnyc1ejm0tvQ+zuKOjnqt24WsFbmKg29rnhRbanD65yH Q==;
X-CSE-ConnectionGUID: bhMFT4lPTKq3Pwg3eeRqhQ==
X-CSE-MsgGUID: yRnorT0QQB6h43zDLj7VyA==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="37427818"
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; d="scan'208";a="37427818"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 19:15:27 -0700
X-CSE-ConnectionGUID: jQJC70F7SbKEAE9I4W1pZw==
X-CSE-MsgGUID: AXgVwAeZScqmYmGlzqZ8tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; d="scan'208";a="44763653"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 19:15:27 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 34/43] drm/xe/svm: Get drm device from drm memory region
Date: Tue, 11 Jun 2024 22:25:56 -0400
Message-Id: <20240612022605.385062-34-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240612022605.385062-1-oak.zeng@intel.com>
References: <20240612022605.385062-1-oak.zeng@intel.com>
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

