Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A39ACA9EC5
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 23:29:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A379210E6B2;
	Mon, 12 Oct 2026 23:29:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F85A10E6B1
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 23:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791847761; x=1823383761;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8Bwia4j7ryDnk73cJotiBAU8OVfCqSjXlq0KIPQlHdo=;
 b=MrTkY+qwCCUTGufMLzEth/acGNqg90jqlOk8I9wdS1B/5edOqiecIKXj
 gwpII/JfX+vG0s+HMGtSkepNu2/Ed5Ao2PN36qMfXHN7y7zEbPvsoAdRm
 jJDvL/R3R3fx8jzh8Do/37Fpr/XPqILYjCR8RPpqRcH/XD58CkcAcdok5
 l2olXCxJ2WH38Gq0wNyCLwMqgL9sAKJRQCTK4z8xJbziDJ8PVw26CI7v0
 hzK9BaIECL1SMNqa6bVP7Fa5pe9V0NgE/986ooBf1cw8nKlJwL7/CYgUv
 oujbdmVQX8FQJ2AEMl6al6i0fbedCav6O0qjGGDTFNyQ1Aad20JDhrD0K g==;
X-CSE-ConnectionGUID: jkcGd8obTVmrm9B+3adZZw==
X-CSE-MsgGUID: 3ACSsfEXTiW9DXD8/vx4WQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="450711"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="450711"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 16:29:16 -0700
X-CSE-ConnectionGUID: zBVFwerQSniBmSLS8t9SMw==
X-CSE-MsgGUID: Mo9dWoynQky2FHDW54ibeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="1337839"
Received: from orsosgc001.jf.intel.com ([10.54.56.63])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 16:29:16 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: daniele.ceraolospurio@intel.com, aravind.iddamsetty@intel.com,
 mallesh.koujalagi@intel.com, alan.previn.teres.alexis@intel.com,
 julia.filipchuk@intel.com, michal.wajdeczko@intel.com
Subject: [PATCH v7 2/7] drm/xe/guc: Handle CRASH and EXCEPTION G2H with
 separate helpers
Date: Mon, 12 Oct 2026 16:29:10 -0700
Message-ID: <20261012232907.83649-11-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261012232907.83649-9-umesh.nerlige.ramappa@intel.com>
References: <20261012232907.83649-9-umesh.nerlige.ramappa@intel.com>
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

guc_crash_process_msg() handles both crash and exception notifications
from GuC, but ends up rechecking the type of notification. It also has
an else case that is not reachable.

Since notification type is already known by the caller, remove
guc_crash_process_msg() and handle the CRASH and EXCEPTION G2H
separately, so the duplicate check is avaoided.

Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
v2: Add 'why' to commit message (Daniele)
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index da5ce97484b8..7c2a45fe8ad2 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -1568,22 +1568,18 @@ static int parse_g2h_event(struct xe_guc_ct *ct, u32 *msg, u32 len)
 	return 0;
 }
 
-static int guc_crash_process_msg(struct xe_guc_ct *ct, u32 action)
+static void guc_handle_crash_dump_msg(struct xe_guc_ct *ct)
 {
-	struct xe_gt *gt = ct_to_gt(ct);
-
-	if (action == XE_GUC_ACTION_NOTIFY_CRASH_DUMP_POSTED)
-		xe_gt_err(gt, "GuC Crash dump notification\n");
-	else if (action == XE_GUC_ACTION_NOTIFY_EXCEPTION)
-		xe_gt_err(gt, "GuC Exception notification\n");
-	else
-		xe_gt_err(gt, "Unknown GuC crash notification: 0x%04X\n", action);
-
+	xe_gt_err(ct_to_gt(ct), "GuC Crash dump notification\n");
 	CT_DEAD(ct, NULL, CRASH);
-
 	kick_reset(ct);
+}
 
-	return 0;
+static void guc_handle_exception_msg(struct xe_guc_ct *ct)
+{
+	xe_gt_err(ct_to_gt(ct), "GuC Exception notification\n");
+	CT_DEAD(ct, NULL, CRASH);
+	kick_reset(ct);
 }
 
 static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
@@ -1787,8 +1783,10 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
 		ret = xe_gt_sriov_pf_monitor_process_guc2pf(gt, hxg, hxg_len);
 		break;
 	case XE_GUC_ACTION_NOTIFY_CRASH_DUMP_POSTED:
+		guc_handle_crash_dump_msg(ct);
+		break;
 	case XE_GUC_ACTION_NOTIFY_EXCEPTION:
-		ret = guc_crash_process_msg(ct, action);
+		guc_handle_exception_msg(ct);
 		break;
 #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
 	case XE_GUC_ACTION_TEST_G2G_RECV:
-- 
2.55.0

