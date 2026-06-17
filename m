Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27B8ACD98E2
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jun 2026 15:14:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC954891A3;
	Wed, 17 Jun 2026 15:14:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TFfiV5H9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 018CE891A3
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jun 2026 15:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781709276; x=1813245276;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FBh9QudtVW48UUeNFn0b7AVZtQ4CIKMsk8iMZREBssA=;
 b=TFfiV5H9xwfMN3DHvllYFMkt+yQu6j/Rzye9SUR6qrs/tERGuSyMsKMG
 8PQglTDHOLBbaJqiF/IxbAJb32RvNl/NCRvVagKCBynnZ5YgrRHERI5O7
 Q0NbZlsZVgeIRx+1d4OLL8ojPNrSYUkubNSeCPF4n+tjr1zpgTaOx9Je6
 rUqkEamJ+yAeiTE5loun0sMQaDqbiIdg18ga+X8ENyKhNKAnQgL8XuZeY
 mR+miggE0SxX2+Eu2wNw6WWZo8ZzI/ha8718MT0+BliYStQTVTABVbA+o
 K8MIRlyHC53ioeeiW4UDM2oFnJqlkAIS3GPYPj0/A5RwYloExIvR4bSkk w==;
X-CSE-ConnectionGUID: PocrSOXsShmkycnJSpMP5g==
X-CSE-MsgGUID: saUhJ0bNSFWGNlavFUKLvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="93880479"
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="93880479"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 08:14:35 -0700
X-CSE-ConnectionGUID: G8IQNQB3RA6P455POdj7rQ==
X-CSE-MsgGUID: VKmBnod1Sf6aaPtHBKtncA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="247209426"
Received: from hanvin-mobl3.amr.corp.intel.com (HELO josouza-mobl7.intel.com)
 ([10.124.222.2])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 08:14:34 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Subject: [PATCH] drm/xe/uapi: Add flag to tell if VM_GET_PROPERTY_FAULTS is
 supported
Date: Wed, 17 Jun 2026 08:14:19 -0700
Message-ID: <20260617151419.101546-1-jose.souza@intel.com>
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

Not all Xe versions support this feature and not every device supported by Xe
supports this feature, so this flag is needed to make UMD's life easier.

Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 2 ++
 include/uapi/drm/xe_drm.h     | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index dc975f595368..1a51fc1e0e83 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -359,6 +359,8 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
 	config->info[DRM_XE_QUERY_CONFIG_VA_BITS] = xe->info.va_bits;
 	config->info[DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY] =
 		xe_exec_queue_device_get_max_priority(xe);
+	config->info[DRM_XE_QUERY_CONFIG_FLAG_HAS_VM_GET_PROPERTY_FAULTS] =
+		xe->info.has_usm;
 
 	if (copy_to_user(query_ptr, config, size)) {
 		kfree(config);
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

