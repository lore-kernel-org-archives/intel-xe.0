Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EA23C46CD2
	for <intel-xe@archiver.kernel.org>; Wed, 27 Dec 2023 23:59:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 015B510E243;
	Wed, 27 Dec 2023 23:59:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51EFD10E1D6
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Dec 2023 23:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703721555; x=1735257555;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=UEQexz4529hjlBGEc/XrwH1OQtTGUiU3ZgLlSbHcoQU=;
 b=iPP66H2KNF6byWz+rkywoqm6bo9RLsbG4wHpnNQVMoiPbncAtHjTzrRT
 pSVTTmJPDEdq6vHVYnXQF+Je0T94OnIL2eoMge+aqTFzSaWNclJzzYdmo
 rVS9UH4xEbgmZANpZOWx7m7QFGeTvy71CvH8tkWHxp3ADuYCgXNKd2B3P
 X5ynYMOnMPOJVIA3mPpkf98ogYm0bJJmE8Da4fccGgsK2VOKAj7WcC9zR
 i0rvSOXiQC+FyX/JKkh5JS1Hv2tR2KEOJkdh5xym5gzZ9VySXU8+rtDhF
 qai+DqAXkbqcIbsGyzQE5x+0gp+EjEYCg55Zykii5DIQiHhTUF0fzLEEG g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="3329161"
X-IronPort-AV: E=Sophos;i="6.04,310,1695711600"; 
   d="scan'208";a="3329161"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Dec 2023 15:59:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="754589894"
X-IronPort-AV: E=Sophos;i="6.04,310,1695711600"; d="scan'208";a="754589894"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.132.129])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Dec 2023 15:59:14 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 10/10] drm/xe/guc: Start handling GuC Relay event messages
Date: Thu, 28 Dec 2023 00:58:38 +0100
Message-Id: <20231227235838.212-11-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20231227235838.212-1-michal.wajdeczko@intel.com>
References: <20231227235838.212-1-michal.wajdeczko@intel.com>
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

GuC Relay infrastructure is ready, start handling relay messages
from the GuC to unblock testing on the live system.

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

