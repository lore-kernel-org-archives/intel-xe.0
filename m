Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7459CD3EE8A
	for <intel-xe@archiver.kernel.org>; Thu, 22 Jan 2026 16:28:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F7D810E0D8;
	Thu, 22 Jan 2026 16:28:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cd1YCuQP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64DBC10E0D8
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Jan 2026 16:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769099332; x=1800635332;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SmqtiAQ9/JkwLcu5dJ3HMIjINDq4UvEZRCn2B0WmIwY=;
 b=cd1YCuQPmPwzYxkxH3sbhJRXDjC8fbxNxAJntieZRsZoPVl8vbYqghRE
 o97KbPcAm3IY1TzsYMCDVS7btEmHfYQKazXF/DzzpA/6ma8Km+uxEgjGB
 9vqIs7qb8ZHASA6hV7B/dG+MtP9Dc78w9Yyn+AHNHXGvINyT+8ecT9tnr
 sLbXXzsGF3T/VYYX8vvv13QUDxmLmxir8ZzbLZ3hb9FF4/Qm8Sj8/2MrB
 kriO61lg6IuhHpxkoUoQrIxrK+q/HEUeW58K/y5X7nyBDC2GbsSKXLfeg
 eEM4b5F409T7+/YW9sxb51CT7QnWz4nxvvINdbDPM4QlkBBoH4Q2xb5PF g==;
X-CSE-ConnectionGUID: J0Q115tfT8mHzPvzuP3N2A==
X-CSE-MsgGUID: o3ve+xKfRCe+0gpNgZ2iTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="87760407"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="87760407"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 08:28:52 -0800
X-CSE-ConnectionGUID: EGLuzPEuQ82Wz9t/4gjNKg==
X-CSE-MsgGUID: 5ks7edNeTM2VuYlcBW3khA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="206595211"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by orviesa009.jf.intel.com with ESMTP; 22 Jan 2026 08:28:49 -0800
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v2 1/2] drm/xe: Make xe_modparam.force_vram_bar_size signed
Date: Thu, 22 Jan 2026 16:25:22 +0000
Message-ID: <20260122162520.3150505-5-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260122162520.3150505-4-shuicheng.lin@intel.com>
References: <20260122162520.3150505-4-shuicheng.lin@intel.com>
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

vram_bar_size is registered as an int module parameter and is documented
to accept negative values to disable BAR resizing.
Store it as an int in xe_modparam as well, so negative values work as
intended and the module_param type matches.

Fixes: 80742a1aa26e ("drm/xe: Allow to drop vram resizing")
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_module.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
index 1c75f38ca393..79cb9639c0f3 100644
--- a/drivers/gpu/drm/xe/xe_module.h
+++ b/drivers/gpu/drm/xe/xe_module.h
@@ -12,7 +12,7 @@
 struct xe_modparam {
 	bool force_execlist;
 	bool probe_display;
-	u32 force_vram_bar_size;
+	int force_vram_bar_size;
 	int guc_log_level;
 	char *guc_firmware_path;
 	char *huc_firmware_path;
-- 
2.50.1

