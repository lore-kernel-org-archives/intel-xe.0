Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DCF8D767F2
	for <intel-xe@archiver.kernel.org>; Thu, 31 Oct 2024 18:10:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27A5510E435;
	Thu, 31 Oct 2024 18:10:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mMQtRZiN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3125B10E435
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Oct 2024 18:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730398223; x=1761934223;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2UtGyq/lRvOedV6NogXlhOKXVU2SqJ38dULZ3utOG9I=;
 b=mMQtRZiNb2JJUFXOpWFklUx7XcrPyiqW54/D2XMnojQKEEdPwYYXGl9w
 iJmfgIHmFRs+DAoUHjXj5Jpd9R9GZTKU8C+H67jSdL+Ynri9cmnFcli52
 MPxXDVItq3Gw54fHE9IPn5Cl+5hZJnU8HQHoKE9dzZU2nqYnHcFT1Z0Wy
 pLR51VQItCTanaEaaw07+1QJgAIX9rLMvvYAFBsk4l5sF728Y9Io2Lndu
 jS0RB02KnO5bHy46d7ng161jLHfLn2h21ltpVCThajbNBZuY0AwJq8tK0
 Yq039l3gwtrZ9LJ+L64nRuiEomD/pGFFhZdjMhL50qQHlbiFQl01/+NUq g==;
X-CSE-ConnectionGUID: a5gtSDn3Rk6fIGBwRGIXCw==
X-CSE-MsgGUID: FBrvlFJcR0uLa824HGBieg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41255871"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="41255871"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 11:10:22 -0700
X-CSE-ConnectionGUID: Kg6WGw+kSKOjbBfEEL9THQ==
X-CSE-MsgGUID: +wacAEwPR3eODrWkxZYV9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; d="scan'208";a="86637575"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 11:10:22 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com
Subject: [PATCH v6 5/8] drm/xe/display: Update intel_bo_read_from_page to use
 ttm_bo_access
Date: Thu, 31 Oct 2024 11:10:45 -0700
Message-Id: <20241031181048.2948948-6-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241031181048.2948948-1-matthew.brost@intel.com>
References: <20241031181048.2948948-1-matthew.brost@intel.com>
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

Don't open code vmap of a BO, use ttm_bo_access helper which is safe for
non-contiguous BOs and non-visible BOs.

Suggested-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/display/intel_bo.c | 25 +------------------------
 1 file changed, 1 insertion(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/intel_bo.c b/drivers/gpu/drm/xe/display/intel_bo.c
index 9f54fad0f1c0..43141964f6f2 100644
--- a/drivers/gpu/drm/xe/display/intel_bo.c
+++ b/drivers/gpu/drm/xe/display/intel_bo.c
@@ -40,31 +40,8 @@ int intel_bo_fb_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
 int intel_bo_read_from_page(struct drm_gem_object *obj, u64 offset, void *dst, int size)
 {
 	struct xe_bo *bo = gem_to_xe_bo(obj);
-	struct ttm_bo_kmap_obj map;
-	void *src;
-	bool is_iomem;
-	int ret;
 
-	ret = xe_bo_lock(bo, true);
-	if (ret)
-		return ret;
-
-	ret = ttm_bo_kmap(&bo->ttm, offset >> PAGE_SHIFT, 1, &map);
-	if (ret)
-		goto out_unlock;
-
-	offset &= ~PAGE_MASK;
-	src = ttm_kmap_obj_virtual(&map, &is_iomem);
-	src += offset;
-	if (is_iomem)
-		memcpy_fromio(dst, (void __iomem *)src, size);
-	else
-		memcpy(dst, src, size);
-
-	ttm_bo_kunmap(&map);
-out_unlock:
-	xe_bo_unlock(bo);
-	return ret;
+	return ttm_bo_access(&bo->ttm, offset, dst, size, 0);
 }
 
 struct intel_frontbuffer *intel_bo_get_frontbuffer(struct drm_gem_object *obj)
-- 
2.34.1

