Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B894C982FA
	for <intel-xe@archiver.kernel.org>; Tue, 22 Sep 2026 23:18:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20EF710EEB8;
	Tue, 22 Sep 2026 23:18:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SXCfBz4+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E43010E942
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Sep 2026 23:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790119087; x=1821655087;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EDpoRJspce9UtAaPJhi1LIJXztrdc/B5USrkysTa7t0=;
 b=SXCfBz4+y4ieVCYWbM8YwLT8Ozs1dPOEw/ZhbuHeyfI4lClJ5tNvsAN7
 jKljqxPjJEsO9NHhdsqEqBzpVrYmIe8Rcjb40ARQWbi5KmhywXMXYESml
 n3VXwiX46XQ75SzDR1VeYHu/WCnf+ni8ObkMW0kRkx+jemiq3UUSB/8VU
 mTJh/lbVB4FMEEngtwy5cFCtsHbWknDcfaYB1nLqxOQOzIA144hs3z6oD
 N9wsxwLQVBYSh/l209dUtU4lnS+A/7xZNH40fErXvbwzFyQ7Txu6GiZJ9
 h3C0QGSXaN0oDgXuo9X7cnsF47ygCzRmwIHh9l1U4VM+kpjbYyRvXCaew g==;
X-CSE-ConnectionGUID: mbMfpfWWQPax8eBX8LLxiQ==
X-CSE-MsgGUID: m/X9n5rCTnevCAjnUe/LKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="101432616"
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; d="scan'208";a="101432616"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 16:18:07 -0700
X-CSE-ConnectionGUID: OHlOaObQSHaTihQp3P1+7A==
X-CSE-MsgGUID: 2iC/BD65SniFezzwj1hwUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; d="scan'208";a="271922764"
Received: from orsosgc001.jf.intel.com ([10.54.56.63])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 16:18:07 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: daniele.ceraolospurio@intel.com, michal.wajdeczko@intel.com,
 aravind.iddamsetty@intel.com, mallesh.koujalagi@intel.com,
 alan.previn.teres.alexis@intel.com, julia.filipchuk@intel.com
Subject: [PATCH v6 2/7] drm/xe/guc: Handle CRASH and EXCEPTION G2H with
 separate helpers
Date: Tue, 22 Sep 2026 16:18:01 -0700
Message-ID: <20260922231758.2695562-11-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260922231758.2695562-9-umesh.nerlige.ramappa@intel.com>
References: <20260922231758.2695562-9-umesh.nerlige.ramappa@intel.com>
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
v2: (Sashiko)
- Don't process the return from the helpers
- Remove unused action parameter
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 5c4733da385c..ea59c1bf0c3f 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -1553,22 +1553,18 @@ static int parse_g2h_event(struct xe_guc_ct *ct, u32 *msg, u32 len)
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
@@ -1772,8 +1768,10 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
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

