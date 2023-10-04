Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50CC5E8FDDB
	for <intel-xe@archiver.kernel.org>; Wed,  4 Oct 2023 08:48:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15D8B10E347;
	Wed,  4 Oct 2023 08:48:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E368510E348
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Oct 2023 08:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696409318; x=1727945318;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=X1hkRKN1hh2LfHNB0JxlQFRYHCXgaGbpXQXH+yKvFwY=;
 b=HWYAl5MAzCLgn0oYhvoUc5Hkmu4jeErWI5mzvANtiqeCddBlHaLn+Bvw
 eKwXo+bSglbeS0z0dRqXpIntQX0loFE1vXAIeu9qjBKlSiBZR6b/VMBKj
 KKuSTChgXS4DC6fOvkVz++E59sXWIg0ZqX24TLv0gG7aiQyxlfrqzqP1C
 xJLW2KIWEesL35x3R5cWz7cKzbIH68A7hNo2KzEH0n8hRfiwbIQwlYxnE
 VUBeSOWQs9Xbg8r0ryqkJQ+pV7WyfZ8apXIMZIGGN36P31O4z3h1taJoc
 tP5ILqf1ddhgHQSCuv1eXNeHIZjN1kvTCpBMOpU4PxNZXIjmWVDLNbw2K w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="383009278"
X-IronPort-AV: E=Sophos;i="6.03,199,1694761200"; d="scan'208";a="383009278"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 01:48:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="727927464"
X-IronPort-AV: E=Sophos;i="6.03,199,1694761200"; d="scan'208";a="727927464"
Received: from rahul-super-server.iind.intel.com ([10.145.169.69])
 by orsmga006.jf.intel.com with ESMTP; 04 Oct 2023 01:48:36 -0700
From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
To: intel-xe@lists.freedesktop.org, janga.rahul.kumar@intel.com,
 ramadevi.gandi@intel.com
Date: Wed,  4 Oct 2023 14:21:38 +0530
Message-Id: <20231004085138.1825175-1-janga.rahul.kumar@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Extend query ioctl to expose tile count
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

Tile count can be queried by UMD's using the query ioctl.
VM bind ioctl has tile mask param whose valid range can be
determined based on the tile count info.

Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 2 ++
 include/uapi/drm/xe_drm.h     | 3 ++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index a951205100fe..ada1f26dc1d9 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -200,6 +200,8 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
 		hweight_long(xe->info.mem_region_mask);
 	config->info[XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY] =
 		xe_exec_queue_device_get_max_priority(xe);
+	config->info[XE_QUERY_CONFIG_TILE_COUNT] =
+		xe->info.tile_count;
 
 	if (copy_to_user(query_ptr, config, size)) {
 		kfree(config);
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index d48d8e3c898c..1d207b5398ae 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -257,7 +257,8 @@ struct drm_xe_query_config {
 #define XE_QUERY_CONFIG_GT_COUNT		4
 #define XE_QUERY_CONFIG_MEM_REGION_COUNT	5
 #define XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY	6
-#define XE_QUERY_CONFIG_NUM_PARAM		(XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY + 1)
+#define XE_QUERY_CONFIG_TILE_COUNT		7
+#define XE_QUERY_CONFIG_NUM_PARAM		(XE_QUERY_CONFIG_TILE_COUNT + 1)
 	/** @info: array of elements containing the config info */
 	__u64 info[];
 };
-- 
2.25.1

