Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC1A6C6FD1F
	for <intel-xe@archiver.kernel.org>; Wed, 20 Mar 2024 18:40:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A03B810FED9;
	Wed, 20 Mar 2024 18:40:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AUw/TBTt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95C5D10FED9
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Mar 2024 18:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710960007; x=1742496007;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=mr8uXFmsqkKVJJSeRhqMlCRLKluwX3drPbxw6raREFQ=;
 b=AUw/TBTtLaulN24e6VqMHVsPS96hko1X2juKprWDeg8Xf8sGxHZ0G/hl
 6KFvmCmeaHaKXLDt8Gx/LrSXlwIhqbNY+O/92XqS+bGsokHNGycW/NB+I
 kOHB0OdBrCwg/B4GdVyQEioH5s0ZQN0+Fm8G+W+iuLHlGRJMm9MeGNAak
 WiZaztjH//1EPlgKHxAMK3Gp9/hCO5TOzhU2xb0OKpv7i0c7jq8kSMbit
 5YqKt1qs8H7TV/oeHh91OOhzc7MHzOA8mM5es0Xv49UOmXqHuVf6MuLY2
 ilVWt2oUeJxK8xuPDcrXoLiJpu8ZK4Ve0jMV0fn7zmRTcmjnUJklQssiN w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="28382683"
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; d="scan'208";a="28382683"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 11:33:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; d="scan'208";a="14262462"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 11:33:22 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI  3/8] drm/xe: Introduce helper to get tile from memory region
Date: Wed, 20 Mar 2024 14:45:37 -0400
Message-Id: <20240320184542.2239076-3-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240320184542.2239076-1-oak.zeng@intel.com>
References: <20240320184542.2239076-1-oak.zeng@intel.com>
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

Introduce a simple helper to retrieve tile from memory region

v1: move the function to xe_device.h (Matt)
    improve commit message, add kerneldoc (Thomas)

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/xe/xe_device.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index d413bc2c6be5..3f74c460bb14 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -176,4 +176,13 @@ void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *p);
 u64 xe_device_canonicalize_addr(struct xe_device *xe, u64 address);
 u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address);
 
+/**
+ * xe_mem_region_to_tile() - retrieve tile from memory region
+ * @mr: the memory region we retrieve tile from
+ */
+static inline struct xe_tile *xe_mem_region_to_tile(struct xe_mem_region *mr)
+{
+	return container_of(mr, struct xe_tile, mem.vram);
+}
+
 #endif
-- 
2.26.3

