Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 244BAC4345F
	for <intel-xe@archiver.kernel.org>; Sun, 14 Apr 2024 19:02:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF146112324;
	Sun, 14 Apr 2024 19:02:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gfYGOtaO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C064B112323
 for <intel-xe@lists.freedesktop.org>; Sun, 14 Apr 2024 19:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713121324; x=1744657324;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=k6vDbmH7qeAmBzvWtfSeAwfZVCxK+uKCl2aHy0kgTvQ=;
 b=gfYGOtaOYk06RRwZ4XWmDhO4zLQ8JQM+ruroNq3OMeJgDsSGd6Fx1SUP
 fCzpbiEAFqgIm2GNmY1cvcsTUEMZIjOqTogaGRviZMMFwcphyRE2xGPMY
 v0ANya5dfpmu0cH6/1Y8Z6rlDQaKFWXMet6eHYuvOw7p4aCWcuQV57iUx
 Lo1qBtyoHVZXXWMV7vutJt8xfAwgqgafdVky0Q7sdPbCcBNBADgUn/Qtz
 6mNF9+xKS0g6JjUW5gRfAlqfwR3nCMyfUSAtXY74RjV+ZfD+kuzFk1QVV
 CmQd4cq68e1DvrMQfUZLS6NoN8laTjLiCJgum071xAskQMP8X/AZvA5Ey g==;
X-CSE-ConnectionGUID: s33RoI4TSIeAWyJEi7So8g==
X-CSE-MsgGUID: ypIpqgZES9Clc0HoBgRzqw==
X-IronPort-AV: E=McAfee;i="6600,9927,11044"; a="30983594"
X-IronPort-AV: E=Sophos;i="6.07,201,1708416000"; d="scan'208";a="30983594"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2024 12:02:04 -0700
X-CSE-ConnectionGUID: g25TuOQOQIy0j1M6y5mKhw==
X-CSE-MsgGUID: c9QUBPTsR6a1mhSEjeVoiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,201,1708416000"; d="scan'208";a="26383430"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.252.61.42])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2024 12:02:03 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 3/6] drm/xe: Add xe_ttm_vram_get_avail
Date: Sun, 14 Apr 2024 21:01:34 +0200
Message-Id: <20240414190137.1243-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240414190137.1243-1-michal.wajdeczko@intel.com>
References: <20240414190137.1243-1-michal.wajdeczko@intel.com>
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

The PF driver will need to know size of the remaining available
VRAM to estimate fair VRAM allocations that could be used across
all VFs in automatic VFs provisioning mode. Add helper function
for that. We will use it in upcoming patch.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 12 ++++++++++++
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.h |  1 +
 2 files changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 0678faf83212..8a1f460ff20b 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -478,3 +478,15 @@ void xe_ttm_vram_get_used(struct ttm_resource_manager *man,
 	*used_visible = mgr->visible_size - mgr->visible_avail;
 	mutex_unlock(&mgr->lock);
 }
+
+u64 xe_ttm_vram_get_avail(struct ttm_resource_manager *man)
+{
+	struct xe_ttm_vram_mgr *mgr = to_xe_ttm_vram_mgr(man);
+	u64 avail;
+
+	mutex_lock(&mgr->lock);
+	avail =  mgr->mm.avail;
+	mutex_unlock(&mgr->lock);
+
+	return avail;
+}
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
index d184e19a9230..cc76050e376d 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
@@ -25,6 +25,7 @@ int xe_ttm_vram_mgr_alloc_sgt(struct xe_device *xe,
 void xe_ttm_vram_mgr_free_sgt(struct device *dev, enum dma_data_direction dir,
 			      struct sg_table *sgt);
 
+u64 xe_ttm_vram_get_avail(struct ttm_resource_manager *man);
 u64 xe_ttm_vram_get_cpu_visible_size(struct ttm_resource_manager *man);
 void xe_ttm_vram_get_used(struct ttm_resource_manager *man,
 			  u64 *used, u64 *used_visible);
-- 
2.43.0

