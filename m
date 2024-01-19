Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C1F4C47DD7
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jan 2024 00:16:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9D8F10E959;
	Fri, 19 Jan 2024 00:16:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A9DE10E948
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jan 2024 00:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705623368; x=1737159368;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vz4OCbWhrFUTCExvZvUaOvITQXbo37ZpszhG6b/Xnas=;
 b=VVtT2jgaauDZxBpT8aePd3sz3ppFnwG4aQ2D1k5EPCIKiA9gRCmIxftj
 eFQ5ewn6lIMU1l8OVRIC2lcgu9Okq4ZHXj8ruSuF0pg9kPr+qs7klbNv7
 GfEUc/EiSpiYH9wG3jhH5fHYansNGGM+DMVOjNurBg1cVLysM6Q9B0I45
 9h4WK88vlitjl5dgbNJqFE0n2AGxNsN7ojmxaddhEKxsqheZtf76mBJ4Z
 RxVyyl2/zyJKzp3tc/4aPsZSF9fyFnOUmNiRP/dnbTthyCfV69nbK5FRB
 0kSivkFwTy5OPimAPUZ3Xg11TbLJGjJuy1UQGEp80KRGjj6PQQbaNN/aK g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="404373184"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; d="scan'208";a="404373184"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 16:16:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="818923994"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; d="scan'208";a="818923994"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 16:16:05 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 3/5] drm/xe/display: Avoid calling readq()
Date: Thu, 18 Jan 2024 16:16:10 -0800
Message-Id: <20240119001612.2991381-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240119001612.2991381-1-lucas.demarchi@intel.com>
References: <20240119001612.2991381-1-lucas.demarchi@intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

readq() is not available in 32bits and i915_gem_object_read_from_page()
is supposed to allow reading arbitrary sizes determined by the `size`
argument. Currently the only caller only passes a size == 8 so the second
problem is not that big. Migrate to calling memcpy()/memcpy_fromio() to allow
possible changes in the display side and to fix the build on 32b architectures.

v2: Use memcpy/memcpy_fromio directly rather than using iosys-map with
    the same size == 8 bytes restriction (Matt Roper)

Fixes: 44e694958b95 ("drm/xe/display: Implement display support")
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 .../drm/xe/compat-i915-headers/gem/i915_gem_object.h  | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h b/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h
index 5f19550cc845..68d9f6116bdf 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h
@@ -35,12 +35,10 @@ static inline int i915_gem_object_read_from_page(struct xe_bo *bo,
 					  u32 ofs, u64 *ptr, u32 size)
 {
 	struct ttm_bo_kmap_obj map;
-	void *virtual;
+	void *src;
 	bool is_iomem;
 	int ret;
 
-	XE_WARN_ON(size != 8);
-
 	ret = xe_bo_lock(bo, true);
 	if (ret)
 		return ret;
@@ -50,11 +48,12 @@ static inline int i915_gem_object_read_from_page(struct xe_bo *bo,
 		goto out_unlock;
 
 	ofs &= ~PAGE_MASK;
-	virtual = ttm_kmap_obj_virtual(&map, &is_iomem);
+	src = ttm_kmap_obj_virtual(&map, &is_iomem);
+	src += ofs;
 	if (is_iomem)
-		*ptr = readq((void __iomem *)(virtual + ofs));
+		memcpy_fromio(ptr, (void __iomem *)src, size);
 	else
-		*ptr = *(u64 *)(virtual + ofs);
+		memcpy(ptr, src, size);
 
 	ttm_bo_kunmap(&map);
 out_unlock:
-- 
2.40.1

