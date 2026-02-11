Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53C1FE9E2EA
	for <intel-xe@archiver.kernel.org>; Wed, 11 Feb 2026 11:44:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10E2010E027;
	Wed, 11 Feb 2026 11:44:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MS2GX3KJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6150F10E027
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Feb 2026 11:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770810245; x=1802346245;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PbdLE1MDmE2Xhz00Io1eQ4c5Ka5VVBp0jKesgwB2Ra0=;
 b=MS2GX3KJQWkkj6EmxsL0ir6lfYKJeP9of4bFIXzcQx8WHUYl91paS2F2
 giPIW/sYKxDaWQS0g/GV/Oxx1ClOYileggrUhUjWMLrNU+2c5mhIo8xMp
 yE5BwMhKO+8cY+KTEuk16NUTeYf/IGBCiZrHkAaAy16aO6vtAMMwZMTLf
 rfiwqeMiGN1yHYakHvLYLYDCIXK1r/rNnIaqEzvMfUUXxSIT9hfuquwU9
 TY3EJpDIEDH8M8i5UxDE3V1WjYnmz9x0+FLPFdYW3nrdv85zanqjWku6G
 DgN5xcOiiwLWOOXISGsiR4cTGGdcUxf7W8yh/cYklLWGBdI/TZ+LFBdQ0 w==;
X-CSE-ConnectionGUID: usWMpe6iQguzZkB3OHdgig==
X-CSE-MsgGUID: FUe5sNqBTNaLNw2cCqS+Sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="72049661"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="72049661"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 03:44:05 -0800
X-CSE-ConnectionGUID: DNrsQizyT/ug5c6YSYLLQA==
X-CSE-MsgGUID: iyowngsDRoOQnihG8PbWjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="216732555"
Received: from yadavs-z690i-a-ultra-plus.iind.intel.com ([10.190.216.90])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 03:44:04 -0800
From: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH v2] drm/xe: Only advertise NO_COMPRESSION hint on devices with
 flat CCS
Date: Wed, 11 Feb 2026 17:10:16 +0530
Message-ID: <20260211114015.561461-2-sanjay.kumar.yadav@intel.com>
X-Mailer: git-send-email 2.52.0
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

Devices like CRI have GRAPHICS_VER >= 20 but don't have compression
support their PAT table (xe3p_xpc_pat_table) has no compression-enabled
entries.

Only advertise HAS_NO_COMPRESSION_HINT flag when the device actually has
flat CCS and thus compression capability.

v2:
- Also reject NO_COMPRESSION flag in xe_gem_create_ioctl() when device
  lacks flat CCS support (Matt A)
- Updated commit subject to reflect changes in both xe_query.c and xe_bo.c

Fixes: 78d91ba6bd796 ("drm/xe/uapi: Add NO_COMPRESSION BO flag and query capability")
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>
Cc: Stuart Summers <stuart.summers@intel.com>
Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c    | 3 ++-
 drivers/gpu/drm/xe/xe_query.c | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 8bf16d60b9a5..4b29a442de3e 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -3200,7 +3200,8 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 		bo_flags |= XE_BO_FLAG_SCANOUT;
 
 	if (args->flags & DRM_XE_GEM_CREATE_FLAG_NO_COMPRESSION) {
-		if (XE_IOCTL_DBG(xe, GRAPHICS_VER(xe) < 20))
+		if (XE_IOCTL_DBG(xe, GRAPHICS_VER(xe) < 20 ||
+				 !xe_device_has_flat_ccs(xe)))
 			return -EOPNOTSUPP;
 		bo_flags |= XE_BO_FLAG_NO_COMPRESSION;
 	}
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 34db266b723f..c152ebfbd7d8 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -335,7 +335,7 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
 	if (xe->info.has_usm && IS_ENABLED(CONFIG_DRM_XE_GPUSVM))
 		config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
 			DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR;
-	if (GRAPHICS_VER(xe) >= 20)
+	if (GRAPHICS_VER(xe) >= 20 && xe_device_has_flat_ccs(xe))
 		config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
 			DRM_XE_QUERY_CONFIG_FLAG_HAS_NO_COMPRESSION_HINT;
 	config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
-- 
2.52.0

