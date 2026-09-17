Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2FCCC982D9
	for <intel-xe@archiver.kernel.org>; Thu, 17 Sep 2026 23:59:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65CF310E6DC;
	Thu, 17 Sep 2026 23:59:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dn6+M3V9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ABFF10E00B
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Sep 2026 23:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789689572; x=1821225572;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3auI+zG1R+LG8zawIiW9/3UF+D6xbwFYebALeyQ4b2I=;
 b=dn6+M3V9Xn/tBdETUnpBoSrTa+jK01CqpDKGlp4JkmpLrlnrmymD79Lg
 MCGYYixQftGSvkJUC45TjjhdAPB5LlUXBGT0Lg7c85uP6PiDTytNVQVXn
 3jOwTyEcNUN/P2kMzf3VQmGj2d1wxKd6jkTQgno/9cOWPmD9eNyJjIKj6
 Y4boS+HzsdkvHzvGg1NHuH107gUJKBvuoldt2O2NWjOu1YY7vfLN1JtBi
 zI7ebE1868lYbNizh3JSG+JYM1wsRzuAxKDg/TwQGFZsA1daGk4DhmKuW
 KTSPyFNOtWihxC4eeV2TEfHc3GiT9WmZNbje1QTz5JerXgjHcRQHRQqb7 A==;
X-CSE-ConnectionGUID: HAsP9kUDRHyFdObeZvOqrA==
X-CSE-MsgGUID: QK6IGe/AR063xaM154K5hA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="77727911"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="77727911"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 16:59:31 -0700
X-CSE-ConnectionGUID: YZUrTvAoS72S0EofC3Ed4A==
X-CSE-MsgGUID: b9ajuBrrSy+Pctp2VXXzgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="270788206"
Received: from orsosgc001.jf.intel.com ([10.54.56.63])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 16:59:31 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: daniele.ceraolospurio@intel.com, michal.wajdeczko@intel.com,
 aravind.iddamsetty@intel.com, mallesh.koujalagi@intel.com,
 alan.previn.teres.alexis@intel.com, julia.filipchuk@intel.com
Subject: [PATCH v4 2/7] drm/xe/guc: Handle CRASH and EXCEPTION G2H with
 separate helpers
Date: Thu, 17 Sep 2026 16:59:26 -0700
Message-ID: <20260917235923.1521112-11-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260917235923.1521112-9-umesh.nerlige.ramappa@intel.com>
References: <20260917235923.1521112-9-umesh.nerlige.ramappa@intel.com>
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

Refactor to handle the CRASH and EXCEPTION G2H separately. In the
process drop the else case that existed earlier but was unreachable
code.

Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 5c4733da385c..b3a6aa37808b 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -1553,22 +1553,22 @@ static int parse_g2h_event(struct xe_guc_ct *ct, u32 *msg, u32 len)
 	return 0;
 }
 
-static int guc_crash_process_msg(struct xe_guc_ct *ct, u32 action)
+static int guc_handle_crash_dump_msg(struct xe_guc_ct *ct, u32 action)
 {
-	struct xe_gt *gt = ct_to_gt(ct);
+	xe_gt_err(ct_to_gt(ct), "GuC Crash dump notification\n");
+	CT_DEAD(ct, NULL, CRASH);
+	kick_reset(ct);
 
-	if (action == XE_GUC_ACTION_NOTIFY_CRASH_DUMP_POSTED)
-		xe_gt_err(gt, "GuC Crash dump notification\n");
-	else if (action == XE_GUC_ACTION_NOTIFY_EXCEPTION)
-		xe_gt_err(gt, "GuC Exception notification\n");
-	else
-		xe_gt_err(gt, "Unknown GuC crash notification: 0x%04X\n", action);
+	return -EHOSTDOWN;
+}
 
+static int guc_handle_exception_msg(struct xe_guc_ct *ct, u32 action)
+{
+	xe_gt_err(ct_to_gt(ct), "GuC Exception notification\n");
 	CT_DEAD(ct, NULL, CRASH);
-
 	kick_reset(ct);
 
-	return 0;
+	return -EHOSTDOWN;
 }
 
 static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
@@ -1772,8 +1772,10 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
 		ret = xe_gt_sriov_pf_monitor_process_guc2pf(gt, hxg, hxg_len);
 		break;
 	case XE_GUC_ACTION_NOTIFY_CRASH_DUMP_POSTED:
+		ret = guc_handle_crash_dump_msg(ct, action);
+		break;
 	case XE_GUC_ACTION_NOTIFY_EXCEPTION:
-		ret = guc_crash_process_msg(ct, action);
+		ret = guc_handle_exception_msg(ct, action);
 		break;
 #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
 	case XE_GUC_ACTION_TEST_G2G_RECV:
-- 
2.55.0

