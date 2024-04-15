Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 538EAC4345F
	for <intel-xe@archiver.kernel.org>; Mon, 15 Apr 2024 17:39:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07CD511273E;
	Mon, 15 Apr 2024 17:39:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jg19a+Rk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0E6811273F
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Apr 2024 17:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713202789; x=1744738789;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=9H31M0k6tAOx8ENv4LmKvrjquYZsBGZVgT3VGMJLfCI=;
 b=jg19a+RkHA9KARjngDSHHG8CnWX80t1xCnYSxXyqNyM63gwz6JdiF4Q7
 jps3j20KxDRV7R5DpZVSbqkZ9xUYy5Qbw7bdHFxg9mwHMeyuFcL9CCUvX
 GH0UofIrvth/QY+72ZcZk6Ms03856rYaqiVaFYYLPJiBlt3VNIICo2FIi
 d7EXDs7YkZjKAc6MsnvOQbLce8YZdUbCDQhQhHwHZwvOCenmx+S8a2XCA
 uZJ1tk/39uTN1MMD3YKFB8pJp/RNzw9zod1F+LFvsHwxKwznN//NUiav9
 /oGwpxnBn7nY9T8C3UcdNo/pvZBzAxQID4rXZj3zk/qy2RUyBWEwgjQdQ Q==;
X-CSE-ConnectionGUID: lvuOALJ1QmSmX9EsXMSEEA==
X-CSE-MsgGUID: MSCAnt1WQLiQWkKItADAHg==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="19998704"
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; d="scan'208";a="19998704"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 10:39:49 -0700
X-CSE-ConnectionGUID: xBV6ZBSPSN2tjmIdgNyWaw==
X-CSE-MsgGUID: 0nDf+CWIT0ChCLDDCSDZBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; d="scan'208";a="22082771"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.252.45.29])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 10:39:48 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 3/6] drm/xe: Add xe_ttm_vram_get_avail
Date: Mon, 15 Apr 2024 19:39:34 +0200
Message-Id: <20240415173937.1287-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240415173937.1287-1-michal.wajdeczko@intel.com>
References: <20240415173937.1287-1-michal.wajdeczko@intel.com>
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

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
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

