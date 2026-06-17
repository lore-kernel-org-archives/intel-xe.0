Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFCD3CD98E4
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jun 2026 15:25:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8789110EC60;
	Wed, 17 Jun 2026 15:25:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j90MVNsM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B502310EC60
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jun 2026 15:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781709915; x=1813245915;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9CExdmKltgJygTtOA27Lel7Qe6kG4SyPrI5IlhC/ass=;
 b=j90MVNsMwYoCyZXfCXZYi3HGsSUXEtA90+IpupzeQSFNOCLmeQC5bxFV
 Y75Oj2SbqBaoD4+Q1aj9DU1l89gU67Ei4WPQPuPmkdTpRQawuSK08j+7E
 DQOh57izweQ6LoizYx+nka05/K7kfDU3RyWBL/nWVW3MAWfX+U9i/QPz7
 wJaSwbPACaPUOrc65qmF034a9brqdWRQ+m3royRptzgghuUnAIOnnvHQe
 cZY0y4fQJ7G2Wp8NPnGh+CP9RF5Woz/6X55+ST/AP2qonNRQ0t93E7bIh
 3jEDfnxYflbnYI10cVWw2ZwMm7ih/H6W9EdQZHtifgaEpXn9TMoiKI/xv A==;
X-CSE-ConnectionGUID: KWHhe/x8T2enRepJ7vgpYw==
X-CSE-MsgGUID: P7MQJGsCRGiUMATNrLH7CQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="93625162"
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="93625162"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 08:25:15 -0700
X-CSE-ConnectionGUID: 8FrVtOguQjmhgD7ZLtbqGQ==
X-CSE-MsgGUID: SKOF4C3NT/esOWNSesOA5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="243731837"
Received: from hanvin-mobl3.amr.corp.intel.com (HELO josouza-mobl7.intel.com)
 ([10.124.222.2])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 08:25:14 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Subject: [PATCH v2] drm/xe/uapi: Add flag to tell if VM_GET_PROPERTY_FAULTS is
 supported
Date: Wed, 17 Jun 2026 08:25:00 -0700
Message-ID: <20260617152500.108597-1-jose.souza@intel.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Not all Xe versions or Xe-supported devices support this feature, so this
flag is required to make the UMD's life easier.

v2:
- DRM_XE_QUERY_CONFIG_FLAG_HAS_VM_GET_PROPERTY_FAULTS should be set on
info[DRM_XE_QUERY_CONFIG_FLAGS].

Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 4 ++++
 include/uapi/drm/xe_drm.h     | 1 +
 2 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index dc975f595368..f187a264756a 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -354,6 +354,10 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
 		DRM_XE_QUERY_CONFIG_FLAG_HAS_DISABLE_STATE_CACHE_PERF_FIX;
 	config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
 		DRM_XE_QUERY_CONFIG_FLAG_HAS_PURGING_SUPPORT;
+	if (xe->info.has_usm) {
+		config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
+			DRM_XE_QUERY_CONFIG_FLAG_HAS_VM_GET_PROPERTY_FAULTS;
+	}
 	config->info[DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT] =
 		xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K;
 	config->info[DRM_XE_QUERY_CONFIG_VA_BITS] = xe->info.va_bits;
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 48e9f1fdb78d..67b4d371a038 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -434,6 +434,7 @@ struct drm_xe_query_config {
 	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_NO_COMPRESSION_HINT (1 << 3)
 	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_DISABLE_STATE_CACHE_PERF_FIX	(1 << 4)
 	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_PURGING_SUPPORT    (1 << 5)
+	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_VM_GET_PROPERTY_FAULTS	(1 << 6)
 #define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
 #define DRM_XE_QUERY_CONFIG_VA_BITS			3
 #define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4
-- 
2.54.0

