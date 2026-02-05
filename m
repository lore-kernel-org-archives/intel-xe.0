Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C25AE9128E
	for <intel-xe@archiver.kernel.org>; Thu,  5 Feb 2026 08:24:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A490410E365;
	Thu,  5 Feb 2026 08:24:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cShmYA4g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2A1710E365
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Feb 2026 08:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770279866; x=1801815866;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=067jFYVB0lMSLUQRbPS/56WrL+xb43YpqAev9P0QjXU=;
 b=cShmYA4gnkhQjE3NIX8Hu7H4qGIHS5cX0WqcSb0Ry2R9FZfI42OJ5vj7
 898MQP0/VWwle3NDV39ljAXEfRWSADRx56qAT8aIKfWkFv/xb1qHEJNn2
 HA2Z/DeCERtkv7db7niCKGjXCCX/PJpeG9yWV8KSqgaT5g24C0l5kdAOu
 58/kWR6wDKPDyh0CNsUXo+lANo0sJAk55FVDvxSwkxUrxFB/IjhMNI1Ph
 oU2YX1aG/SvVbT3rfuy2GvZiN6enkDhHarlSrpjNWJ8idjLrZzeCpyWbT
 FQFtqWJUMzXumepFmq0GpdApKugoPPNHis6Ur4vK1bKAvGALYbEh2FYpY w==;
X-CSE-ConnectionGUID: aoWgdtH+RmSWiiiT4a2+TQ==
X-CSE-MsgGUID: xU+PVWooTA2ko45Du6b3pQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="70669055"
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="70669055"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 00:24:25 -0800
X-CSE-ConnectionGUID: 0JPPV4vNTfmQiXc+WbmLkw==
X-CSE-MsgGUID: T9bgKsMiR9evdjxRnrn70g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="214604684"
Received: from yadavs-z690i-a-ultra-plus.iind.intel.com ([10.190.216.90])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 00:24:24 -0800
From: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH] drm/xe/query: Only advertise NO_COMPRESSION hint on devices
 with flat CCS
Date: Thu,  5 Feb 2026 13:50:49 +0530
Message-ID: <20260205082048.2988738-2-sanjay.kumar.yadav@intel.com>
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

Fixes: 78d91ba6bd796 ("drm/xe/uapi: Add NO_COMPRESSION BO flag and query capability")
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>
Cc: Stuart Summers <stuart.summers@intel.com>
Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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

