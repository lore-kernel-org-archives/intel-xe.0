Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F65ECCF2C4
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 20:44:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 079641129D7;
	Fri, 16 Oct 2026 20:44:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F7161129D0
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Oct 2026 20:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792183449; x=1823719449;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UTrSBJqfPnNgIwtaLE/tfbIwD+Q2bTsXMpFwnTY/QT0=;
 b=Y214evqGH6VtoZnhRGp0hR9JOpw+R7jaA34tVFZswOc3oF6xLvpF1N3T
 Dki5+0ziN+cBJqX+D0c7dvK5EsnLF7fdnzHs/GW4/BexwdUM2EAJwYnA3
 cnrIMtkrcRlX3q/D1kzxo77sfKi45QyProTwIUFiqxExbH+Fv2mh+VdPh
 9aleopLTyMs5xVNFgIlPMaAXAy/+aMjzMiRW+1cJfK3OX+L6oWcLLqRU0
 sMT/D/8Hidhbr1DsqS6G5DIk0fdfXKXU70x4ISxOyxRwViWsjPMY7LLKt
 L6+rajN7YJjX3scISb2eYKT+4IU8FWN/Ae96KB3F0BZs6XDJ69f4E9tTG w==;
X-CSE-ConnectionGUID: qtnTNzWsTLeazM6lYbkdbQ==
X-CSE-MsgGUID: /ZDxrSGOTt2JKn6jN6mN5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11937"; a="1074533"
X-IronPort-AV: E=Sophos;i="6.27,162,1787036400"; 
   d="scan'208";a="1074533"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 13:44:04 -0700
X-CSE-ConnectionGUID: 5ReDVs2kSt2cHrtyalzKTw==
X-CSE-MsgGUID: Zqpa+GKvSEqWdMwbJ9D1hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,162,1787036400"; 
   d="scan'208";a="3784141"
Received: from orsosgc001.jf.intel.com ([10.54.56.63])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 13:44:04 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: daniele.ceraolospurio@intel.com, dnyaneshwar.bhadane@intel.com,
 michal.wajdeczko@intel.com, jesus.narvaez@intel.com
Subject: [PATCH v8 3/7] drm/xe/guc: Make ct_dead_capture available on
 non-debug config
Date: Fri, 16 Oct 2026 13:43:58 -0700
Message-ID: <20261016204354.364846-12-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261016204354.364846-9-umesh.nerlige.ramappa@intel.com>
References: <20261016204354.364846-9-umesh.nerlige.ramappa@intel.com>
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
refactor. Rename it to process_ct_dead since non-debug mode does not
capture anything.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
v2: Fix CI build failure

v3: (Daniele)
- Reorder defines
- s/ct_id/ct_error_id/
- s/ct_dead_capture/process_ct_dead/

v4: Resolve rebase conflict (Dnyaneshwar)
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 41c940a42d7f..8cc220a0a207 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -59,7 +59,6 @@ static struct xe_device *ct_to_xe(struct xe_guc_ct *ct)
 	return gt_to_xe(ct_to_gt(ct));
 }
 
-#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
 enum {
 	/* Internal states, not error conditions */
 	CT_DEAD_STATE_REARM,			/* 0x0001 */
@@ -82,8 +81,12 @@ enum {
 	CT_DEAD_CRASH,				/* 0x8000 */
 };
 
+#define ct_error_id(reason_code)  CT_DEAD_##reason_code
+static void process_ct_dead(struct xe_guc_ct *ct, struct guc_ctb *ctb, u32 reason_code);
+#define CT_DEAD(ct, ctb, reason_code)	process_ct_dead((ct), (ctb), ct_error_id(reason_code))
+
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
@@ -2283,7 +2276,7 @@ ALLOW_ERROR_INJECTION(xe_is_injection_active, ERRNO);
 int xe_is_injection_active(void) { return 0; }
 #endif
 
-static void ct_dead_capture(struct xe_guc_ct *ct, struct guc_ctb *ctb, u32 reason_code)
+static void process_ct_dead(struct xe_guc_ct *ct, struct guc_ctb *ctb, u32 reason_code)
 {
 	struct xe_guc_log_snapshot *snapshot_log;
 	struct xe_guc_ct_snapshot *snapshot_ct;
@@ -2396,4 +2389,10 @@ static void ct_dead_worker_func(struct work_struct *w)
 	xe_guc_log_snapshot_free(snapshot_log);
 	xe_guc_ct_snapshot_free(snapshot_ct);
 }
+#else
+static void process_ct_dead(struct xe_guc_ct *ct, struct guc_ctb *ctb, u32 reason_code)
+{
+	if (ctb)
+		ctb->info.broken = true;
+}
 #endif
-- 
2.55.0

