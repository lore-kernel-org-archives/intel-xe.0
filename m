Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34E96C47255
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jan 2024 22:20:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBD9E10E571;
	Thu,  4 Jan 2024 22:20:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69D3810E570
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Jan 2024 22:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704406852; x=1735942852;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=C/jH4WmJ1u7cK5t3oOVdJztx0U2qtQabbeYEe+xOAnM=;
 b=Fuyk7bd6rQFNfwMePlBJzrJpNxCJHKs5+ieAfsRzzhdE0pqxQPLchzsI
 0nyYtwCH9PzASZWZHFBJjUvOUiKxlTKnaqGidXeZwqrvp4V3uRu2DIOst
 2pHb+BYdwiFAUuGXI8WMiHvZEXm4Wy7XifBK9vpe52cSFDPLR+yFUSHA2
 fds26VRO6D5+kZvmSf80cnQZ8/bwULLPDzgSOWvP/ipcquCatQFBxVPS+
 8lVck5/0ohflcUCLfoE2fQQC71fXankxjrhVsJSWjeEDGZ+dXvW/lcYZc
 fZQjWLfgQ+hlbdMK2aDGLMDFqIWCS9cMSg7fulHBZoWC+9s0BUdReVVAB A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="428546891"
X-IronPort-AV: E=Sophos;i="6.04,332,1695711600"; d="scan'208";a="428546891"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2024 14:20:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="784022821"
X-IronPort-AV: E=Sophos;i="6.04,332,1695711600"; d="scan'208";a="784022821"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.149.125])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2024 14:20:51 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 10/10] drm/xe/guc: Start handling GuC Relay event messages
Date: Thu,  4 Jan 2024 23:20:31 +0100
Message-Id: <20240104222031.277-11-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240104222031.277-1-michal.wajdeczko@intel.com>
References: <20240104222031.277-1-michal.wajdeczko@intel.com>
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

GuC Relay infrastructure is ready, start handling relay messages
from the GuC to unblock testing on the live system.

Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 8f208267ffc6..c29f095aa1b9 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -14,6 +14,7 @@
 #include <drm/drm_managed.h>
 
 #include "abi/guc_actions_abi.h"
+#include "abi/guc_actions_sriov_abi.h"
 #include "abi/guc_klvs_abi.h"
 #include "xe_bo.h"
 #include "xe_device.h"
@@ -22,6 +23,7 @@
 #include "xe_gt_printk.h"
 #include "xe_gt_tlb_invalidation.h"
 #include "xe_guc.h"
+#include "xe_guc_relay.h"
 #include "xe_guc_submit.h"
 #include "xe_map.h"
 #include "xe_pm.h"
@@ -969,6 +971,12 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
 		ret = xe_guc_access_counter_notify_handler(guc, payload,
 							   adj_len);
 		break;
+	case XE_GUC_ACTION_GUC2PF_RELAY_FROM_VF:
+		ret = xe_guc_relay_process_guc2pf(&guc->relay, payload, adj_len);
+		break;
+	case XE_GUC_ACTION_GUC2VF_RELAY_FROM_PF:
+		ret = xe_guc_relay_process_guc2vf(&guc->relay, payload, adj_len);
+		break;
 	default:
 		drm_err(&xe->drm, "unexpected action 0x%04x\n", action);
 	}
-- 
2.25.1

