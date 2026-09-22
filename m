Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F76EC98304
	for <intel-xe@archiver.kernel.org>; Tue, 22 Sep 2026 23:18:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 084D610EEB5;
	Tue, 22 Sep 2026 23:18:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZGXc5lma";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAE3910E942
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Sep 2026 23:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790119088; x=1821655088;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bg19VI3O4tct6Hi9vwf1ZFasG0p2QHF/qC8E5XMcHYM=;
 b=ZGXc5lma4SdGA/aRqrW1CNnvDWuMmkLTMHFWfpmRNQRSsce17X/X5tOc
 WkN/Bpm69f8QlLhHklHzsNOR7BX4YUu8+Z7cpIpye3hA6SHdtE0qCkKwp
 tW0U+tffrTCOuzf8dBDdfPQ3iHZAzvHrjfTPSYR767fQVoJ2UmI6MvZk5
 LkDgjfUqqf+0IPbq5nymQFIUZqfdUyBDMR2aDU+S9XJ9DAIbI/Awtf4Uv
 PI7yovgCg9pXxgGhzAY3y5yr3TdkLkgcXWc65tz3NC+LTIeJxnRcWQg94
 0NSMSnqz0O1uSoznymkDpi4/4gpYv4GWrdACK/DryuezZPLCiKAlw6NL1 Q==;
X-CSE-ConnectionGUID: gHb7T1/rRya+fdt2x6vjNg==
X-CSE-MsgGUID: MLUY8sllRviFlIGY5oyEOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="101432617"
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; d="scan'208";a="101432617"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 16:18:07 -0700
X-CSE-ConnectionGUID: BhJL2TGFRiywX0BMTDgJpQ==
X-CSE-MsgGUID: 3xRrNxttTTe5ecYkU/a7Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; d="scan'208";a="271922769"
Received: from orsosgc001.jf.intel.com ([10.54.56.63])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 16:18:07 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: daniele.ceraolospurio@intel.com, michal.wajdeczko@intel.com,
 aravind.iddamsetty@intel.com, mallesh.koujalagi@intel.com,
 alan.previn.teres.alexis@intel.com, julia.filipchuk@intel.com
Subject: [PATCH v6 3/7] drm/xe/guc: Make ct_dead_capture available on
 non-debug config
Date: Tue, 22 Sep 2026 16:18:02 -0700
Message-ID: <20260922231758.2695562-12-umesh.nerlige.ramappa@intel.com>
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

Define ct_dead_capture for non-debug as well to simplify future
refactor.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
v2: Fix CI build failure
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index ea59c1bf0c3f..9d9bb3028d52 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -59,7 +59,10 @@ static struct xe_device *ct_to_xe(struct xe_guc_ct *ct)
 	return gt_to_xe(ct_to_gt(ct));
 }
 
-#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
+#define ct_id(reason_code)  CT_DEAD_##reason_code
+#define CT_DEAD(ct, ctb, reason_code)	ct_dead_capture((ct), (ctb), ct_id(reason_code))
+static void ct_dead_capture(struct xe_guc_ct *ct, struct guc_ctb *ctb, u32 reason_code);
+
 enum {
 	/* Internal states, not error conditions */
 	CT_DEAD_STATE_REARM,			/* 0x0001 */
@@ -82,8 +85,8 @@ enum {
 	CT_DEAD_CRASH,				/* 0x8000 */
 };
 
+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
 static void ct_dead_worker_func(struct work_struct *w);
-static void ct_dead_capture(struct xe_guc_ct *ct, struct guc_ctb *ctb, u32 reason_code);
 
 static void ct_dead_fini(struct xe_guc_ct *ct)
 {
@@ -162,9 +165,6 @@ static void fast_req_track(struct xe_guc_ct *ct, u16 fence, u16 action)
 	ct->fast_req[slot].fence = fence;
 	ct->fast_req[slot].action = action;
 }
-
-#define CT_DEAD(ct, ctb, reason_code)	ct_dead_capture((ct), (ctb), CT_DEAD_##reason_code)
-
 #else
 
 static void ct_dead_fini(struct xe_guc_ct *ct) { }
@@ -173,13 +173,6 @@ static void ct_dead_init(struct xe_guc_ct *ct) { }
 static void fast_req_report(struct xe_guc_ct *ct, u16 fence) { }
 static void fast_req_track(struct xe_guc_ct *ct, u16 fence, u16 action) { }
 
-#define CT_DEAD(ct, ctb, reason)			\
-	do {						\
-		struct guc_ctb *_ctb = (ctb);		\
-		if (_ctb)				\
-			_ctb->info.broken = true;	\
-	} while (0)
-
 #endif
 
 /* Used when a CT send wants to block and / or receive data */
@@ -2372,4 +2365,10 @@ static void ct_dead_worker_func(struct work_struct *w)
 
 	spin_unlock_irq(&ct->dead.lock);
 }
+#else
+static void ct_dead_capture(struct xe_guc_ct *ct, struct guc_ctb *ctb, u32 reason_code)
+{
+	if (ctb)
+		ctb->info.broken = true;
+}
 #endif
-- 
2.55.0

