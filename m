Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10542C77B73
	for <intel-xe@archiver.kernel.org>; Tue,  6 Jun 2023 09:45:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB73B10E324;
	Tue,  6 Jun 2023 09:45:24 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C963610E330
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Jun 2023 09:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686044722; x=1717580722;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2mMRhMgAfO4ylkW8HjNv+RwDfm/y+mKLCrnMHQA65pI=;
 b=RxMk2vlv8IhanYTr84q21aN/z57yL1GsrtpLa+NiRsQwvNC8yqJ/OACE
 v02tFF3YhgMMvFaF9j5EwrN6K5gNBX8S5ZXKM0x0BpG1ltts6npDU2uLs
 KXjx/6Hh88CCA+nQnuB8rn6Recqe6DRBzGnC+IVK5dFkTACeTsvqDDaSA
 WIj9LwZmurHExly0XHkMhFk8wRnS85xSAhk51n3mrPuvGKNV4gXN+mu2g
 q6annWIv/D9ZCceqNth6AkZVhMwsBxOOETwq65L+SvtFss6vslWYM6Qca
 zG5A40pMwHK83BwU+YCXQrOHzld/0M11wNan09EZY6/6Ml1nx+AbguO7K A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="359937030"
X-IronPort-AV: E=Sophos;i="6.00,219,1681196400"; d="scan'208";a="359937030"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 02:45:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="798768982"
X-IronPort-AV: E=Sophos;i="6.00,219,1681196400"; d="scan'208";a="798768982"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by FMSMGA003.fm.intel.com with ESMTP; 06 Jun 2023 02:45:19 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  6 Jun 2023 15:19:29 +0530
Message-Id: <20230606094929.2989914-1-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/1] drm/xe: Report tile count from device query
 api.
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
Cc: Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 1 +
 include/uapi/drm/xe_drm.h     | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index c4165fa3428e..54efbefd663f 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -197,6 +197,7 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
 		hweight_long(xe->info.mem_region_mask);
 	config->info[XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY] =
 		xe_engine_device_get_max_priority(xe);
+	config->info[XE_QUERY_CONFIG_TILE_COUNT] = xe->info.tile_count;
 
 	if (copy_to_user(query_ptr, config, size)) {
 		kfree(config);
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 0ebc50beb5e5..8e552aa55037 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -185,7 +185,8 @@ struct drm_xe_query_config {
 #define XE_QUERY_CONFIG_GT_COUNT		4
 #define XE_QUERY_CONFIG_MEM_REGION_COUNT	5
 #define XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY	6
-#define XE_QUERY_CONFIG_NUM_PARAM		XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY + 1
+#define XE_QUERY_CONFIG_TILE_COUNT		7
+#define XE_QUERY_CONFIG_NUM_PARAM		XE_QUERY_CONFIG_TILE_COUNT + 1
 	__u64 info[];
 };
 
-- 
2.25.1

