Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDF74C4167D
	for <intel-xe@archiver.kernel.org>; Mon,  6 Nov 2023 06:48:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7981410E272;
	Mon,  6 Nov 2023 06:48:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F4EA10E270
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Nov 2023 06:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699253336; x=1730789336;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WMMJDQMSaRUL4S4C7IRbnLBHx38on5aOYVKQ5S+727g=;
 b=DVtQb7A09Aeo9rTAUh51pr66CwVGVE+Lh6plW0RbSZMbtooaQHDS59Qw
 oh1d3lOQXR+OexekzUKBm42PjDcBl3n9Rn7BbnqnsbuY8ho80RM4RQ2GN
 CgrPmV3/yuEpE4f3H7Gkk4gpY8UiBFQGAOR4Oxa59OVzfRg8ezpwgasOE
 ql7lUraOSemFqN3x/SvxOVn3vhKKuUBHDadV8sKrddKt9k8Af2ROPdTY5
 qSll9a9SMTSLBp8I7LNILhVmHNTXqbe6Y5P+MXJchiDTWSBOgllEMdZYA
 z8qorgbWUx6piZiBZ5PFra3+/nz2M2btss+Dc9EinyJFq5G7sQNJvcQzk Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="369424631"
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; d="scan'208";a="369424631"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2023 22:48:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; 
   d="scan'208";a="3534610"
Received: from rdegreef-mobl2.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.249.42.181])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2023 22:48:54 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  6 Nov 2023 08:48:29 +0200
Message-Id: <20231106064834.161647-4-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231106064834.161647-1-jouni.hogander@intel.com>
References: <20231106064834.161647-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/8] Revert "drm/xe/display: Append dma_buf
 fences to framebuffer fences"
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
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This reverts commit 7e0573248ae49ffcabe9d2cfb415292ae9a802bd.

Next patch will backport common dma fence handling for Xe and i915 ->
revert this Xe specific patch.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_atomic_plane.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
index 62b6108c4380..e90e96061f48 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
@@ -34,7 +34,6 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_blend.h>
 #include <drm/drm_fourcc.h>
-#include <drm/drm_gem_atomic_helper.h>
 
 #include "i915_config.h"
 #include "i915_reg.h"
@@ -1134,20 +1133,10 @@ intel_prepare_plane_fb(struct drm_plane *_plane,
 
 	return ret;
 #else
-	int ret;
-
 	if (!intel_fb_obj(new_plane_state->hw.fb))
 		return 0;
 
-	ret = intel_plane_pin_fb(new_plane_state);
-	if (ret)
-		return ret;
-
-	ret = drm_gem_plane_helper_prepare_fb(_plane, _new_plane_state);
-	if (ret)
-		intel_plane_unpin_fb(new_plane_state);
-
-	return ret;
+	return intel_plane_pin_fb(new_plane_state);
 #endif
 }
 
-- 
2.34.1

