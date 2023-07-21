Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 339C8EB64DD
	for <intel-xe@archiver.kernel.org>; Fri, 21 Jul 2023 17:56:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF34610E6DD;
	Fri, 21 Jul 2023 17:56:06 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C88510E6DD
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Jul 2023 17:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689962165; x=1721498165;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UlsPSHVlOMnrvK8saUPb3WHOXDjZgDJXP4if6MtJRF8=;
 b=cJiqBe6W2duFSNORO0k1ex4+CxLqqR4OVbge0RFBtPQxQQdWheBlySvR
 0pno77GaXYFytEIslzE56gp9PJBf+nt6iDZqMCeTLrcAWL320xm3Rp9Ct
 PaybGM16xQdR7N5RggvhjPog1COOq0BXtKnz6fs1J+ldZT9oQ4ZL80Efc
 z4S6Ja+J0HBegvpdJAmOGuWUsg1qnWS72esFFhVXqb7Q45df428TNkbeQ
 LyajONitkwKIeVKFBz6v76QHIDkeyGp671L9GfQr3MVK/KSLKRnYuh4IM
 O0CaXh9ZhT56evt0ZgXrAnnqBBN2XFawjrUXcf3fESAfvhfxFsNxHJ4mH Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="430873446"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; d="scan'208";a="430873446"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 10:56:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="760037602"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; d="scan'208";a="760037602"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.147])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 10:56:04 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 21 Jul 2023 10:55:59 -0700
Message-ID: <20230721175557.1513250-4-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230721175557.1513250-3-matthew.d.roper@intel.com>
References: <20230721175557.1513250-3-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/2] drm/xe: xe_engine_create_ioctl should check
 gt_count, not tile_count
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

Platforms like MTL only have a single tile, but multiple GTs.
Ensure XE_ENGINE_CREATE accepts engine creation on gt1 on such
platforms.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_engine.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
index 59e0a9e085ba..0102dad16e29 100644
--- a/drivers/gpu/drm/xe/xe_engine.c
+++ b/drivers/gpu/drm/xe/xe_engine.c
@@ -416,7 +416,7 @@ find_hw_engine(struct xe_device *xe,
 	if (eci.engine_class > ARRAY_SIZE(user_to_xe_engine_class))
 		return NULL;
 
-	if (eci.gt_id >= xe->info.tile_count)
+	if (eci.gt_id >= xe->info.gt_count)
 		return NULL;
 
 	idx = array_index_nospec(eci.engine_class,
@@ -539,7 +539,7 @@ int xe_engine_create_ioctl(struct drm_device *dev, void *data,
 	if (XE_IOCTL_DBG(xe, err))
 		return -EFAULT;
 
-	if (XE_IOCTL_DBG(xe, eci[0].gt_id >= xe->info.tile_count))
+	if (XE_IOCTL_DBG(xe, eci[0].gt_id >= xe->info.gt_count))
 		return -EINVAL;
 
 	if (eci[0].engine_class == DRM_XE_ENGINE_CLASS_VM_BIND) {
-- 
2.41.0

