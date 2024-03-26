Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 667E8C54E64
	for <intel-xe@archiver.kernel.org>; Mon, 25 Mar 2024 22:12:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23AAE10EB16;
	Mon, 25 Mar 2024 22:12:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EJVpDSqz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9127010EB36
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Mar 2024 22:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711404741; x=1742940741;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=37XHd16kGoPzaMSegVcUWuB/NnPPd+HRaUAi0hvQNB0=;
 b=EJVpDSqzjPch6LXYfQJdv1hxxXsYPFi8DQUKMd5LO1JiP8xAGeqlbzEN
 REsni5BWBpEIM9lZCZYeVjIBUaCgPSGI8/jVjWicApGEpavpVH6nMxOYt
 SVDNxilM12FbK8fHEtMTTrTl5PHk2V388UWVy4IOewBPxNkn5LaBnDt9R
 Yys/syOBQNXA7k9vkTorgJxj82XCdoxCi1GadHqjD8TQ9UhJWnNWjYbPn
 hQvQg7UmgAG+3vqdJxx3eena5sYd68Yh5zp4qsJtFYXyzJlJ7v0zj6fyQ
 ptkOSrRGMCd7rwXflhQaTLUtE0NWedf5xUTeq+5/2lzRe5S/WSACoyeUR A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6562150"
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; 
   d="scan'208";a="6562150"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 15:12:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; d="scan'208";a="53217164"
Received: from saurabhg-nuc10i5fnh.jf.intel.com ([10.165.21.145])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 15:12:19 -0700
From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 akshata.jahagirdar@intel.com
Subject: [PATCH v2 1/1] drm/xe/xe2: Send flat_ccs value in struct
 drm_xe_query_config
Date: Tue, 26 Mar 2024 03:10:31 -0700
Message-Id: <b672be6eea948e332ba58b63d6f8c4c71c37a42b.1711447408.git.akshata.jahagirdar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1711447408.git.akshata.jahagirdar@intel.com>
References: <cover.1711447408.git.akshata.jahagirdar@intel.com>
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

Currently, we don't have any check in IGT testcases if platform supports
compression or not. Send this flat_ccs value as part of the struct
drm_xe_query_config so that we can read this value in the igt testcases
and proceed accordingly.
Fixes: VLK-56136

Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 3 +++
 include/uapi/drm/xe_drm.h     | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index e80321b34918..8a3a3117491c 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -332,6 +332,9 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
 	config->num_params = num_params;
 	config->info[DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID] =
 		xe->info.devid | (xe->info.revid << 16);
+	if (xe->info.has_flat_ccs)
+		config->info[DRM_XE_QUERY_CONFIG_FLAGS] =
+			DRM_XE_QUERY_CONFIG_FLAG_HAS_FLAT_CCS;
 	if (xe_device_get_root_tile(xe)->mem.vram.usable_size)
 		config->info[DRM_XE_QUERY_CONFIG_FLAGS] =
 			DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM;
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index f44a19ae9333..08783234bae1 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -405,6 +405,7 @@ struct drm_xe_query_config {
 #define DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID	0
 #define DRM_XE_QUERY_CONFIG_FLAGS			1
 	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM	(1 << 0)
+	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_FLAT_CCS	(1 << 1)
 #define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
 #define DRM_XE_QUERY_CONFIG_VA_BITS			3
 #define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4
-- 
2.34.1

