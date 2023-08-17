Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FD9BC678DC
	for <intel-xe@archiver.kernel.org>; Thu, 17 Aug 2023 23:04:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18ADD10E254;
	Thu, 17 Aug 2023 23:04:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5741E10E254
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Aug 2023 23:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692313456; x=1723849456;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bwANae1CheUdvxkK3FZnZV4i7AIm3482VM4EYw84rcw=;
 b=Lh+r9NnalQMg5AVXdPIdmL1+vy620gp7rcdlqPoZCSPd0YeLuCzSxFxe
 EveB/IvMFoSgu3SjX9TOumzLp5NXQlKg2rz1ED7+6HMaxLEYSpf7bzAkU
 NDSpptIqHDNXa4ITrU6Co4d8ON/dYjxYMjIGJ+EQlfNCVGgGVKBFLrww/
 YQ+oVLof+W4w/eQsFsyv5/6A5JwtteZf6X9Gwk56IPoQwx8jFHuWe/Ary
 n2aRfNPKDYGDIVGrn6xaj/ZoU5YGdivuUDcNKYPrjeWwvAMAdDMLB7OHC
 uHLlxz6UixEzeJGKzkF0EACWnYbLZIe6VH8QdRTRjKAO8tmGt9qxQmH4k g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="375736163"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; d="scan'208";a="375736163"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 16:04:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="734827924"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; d="scan'208";a="734827924"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.147])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 16:04:15 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 17 Aug 2023 16:04:11 -0700
Message-ID: <20230817230407.909816-9-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230817230407.909816-6-matthew.d.roper@intel.com>
References: <20230817230407.909816-6-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/4] fixup! drm/xe/display: Implement display
 support
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
index 234df629af8d..d64d34181790 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
@@ -136,7 +136,6 @@ static inline struct drm_i915_private *kdev_to_i915(struct device *kdev)
 #define IS_ADLP_RPLU(xe) ((xe)->info.subplatform == XE_SUBPLATFORM_ADLP_RPLU)
 #define IS_ICL_WITH_PORT_F(xe) (xe && 0)
 #define HAS_FLAT_CCS(xe) (xe_device_has_flat_ccs(xe))
-#define HAS_4TILE(xe) ((xe)->info.has_4tile)
 #define to_intel_bo(x) gem_to_xe_bo((x))
 #define mkwrite_device_info(xe) (INTEL_INFO(xe))
 
-- 
2.41.0

