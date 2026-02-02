Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88B08E7DF0F
	for <intel-xe@archiver.kernel.org>; Mon,  2 Feb 2026 18:22:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9003890B6;
	Mon,  2 Feb 2026 18:22:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c1X4CYFH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 128F0890B6
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Feb 2026 18:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770056526; x=1801592526;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SmqtiAQ9/JkwLcu5dJ3HMIjINDq4UvEZRCn2B0WmIwY=;
 b=c1X4CYFHjt7ZwZrpNX9Psttg4zQyUVy0eioUbudPUUq56c/cucp0gHfB
 QxbcvUVSa9GdkQvNIUfqsGVMWIIFLUtrZ8KziTbyjkWvHnYNMOsrDY4Aa
 as2usgmSb2Grg3sl2KBWU7ELsYNP/3yUEhmEYrGCRr0t2XO1D8yj0Lu/0
 Ga54u2SHzZ+VqeG1r8JqLXkbTLvWHOsz7HPfT9ZacBnlxuyFwjCoD4c78
 PQvaRv1B/eF1UWedMO+3XV6lQNMxG7Q3tkJX6JYE81IlStH9yvQMK5695
 6GKmIi94jSiO0w1/U4gXZvvvfOtQkeHI64NN8EpKUYpQtzJ2tmmeMPfas w==;
X-CSE-ConnectionGUID: Br1GkuK+QvOvWbSeSP8Xsw==
X-CSE-MsgGUID: dPgGfQ3qQjiRJ/Ojj2ms0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="70424685"
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; d="scan'208";a="70424685"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 10:22:06 -0800
X-CSE-ConnectionGUID: pxcJloi1R4WeZj4RCetp5g==
X-CSE-MsgGUID: 8/as9Q+CQqG9Y5/0X5pzLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; d="scan'208";a="247193985"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by orviesa001.jf.intel.com with ESMTP; 02 Feb 2026 10:22:05 -0800
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v2] drm/xe: Make xe_modparam.force_vram_bar_size signed
Date: Mon,  2 Feb 2026 18:18:54 +0000
Message-ID: <20260202181853.1095736-2-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.50.1
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

