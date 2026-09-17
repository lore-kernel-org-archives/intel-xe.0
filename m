Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28600C982DB
	for <intel-xe@archiver.kernel.org>; Thu, 17 Sep 2026 23:59:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 928FD10E7AC;
	Thu, 17 Sep 2026 23:59:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OhVcGsjq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93B1B10E51E
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Sep 2026 23:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789689572; x=1821225572;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZhTJt9Dilvf/A91Z32IOxibJ6/ErmcNrfaWkyzL60Jc=;
 b=OhVcGsjqJPlSO92C+IcDtJcjSy7FuoJyhRz2Ho5kq5bNnZF+JXPJk7B9
 uEv0o8/jmKalk02ppTItAUbBU2Z3Pyjee9hj14SgfLYg9raiUsPIfr6Sl
 yXq+FGVdLe1BTJKMbhglqLxuqpn+sPPeGpCefDA9CmFYYEtT1Ol6HbJK7
 uTbibCYVYVywOQ8LfpPn4wCPRTgvw62ygHNb+9nPylYx/moSo8hz897Tt
 aJX/+DnvRUterINX5LJ+ecO62k371Y8qsLB6J4J48oFAgYsI76+JoKTni
 6hloUJejEW/S9JzvrJ3EM0uK5C83j8DUC6G9Xh48jzRJsRrKx0RrMX6Bm Q==;
X-CSE-ConnectionGUID: uThJI7L/Qxy0J/ib8OVx7w==
X-CSE-MsgGUID: W5XizAhMTo6jFVPfKHy4Ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="77727912"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="77727912"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 16:59:31 -0700
X-CSE-ConnectionGUID: F+qwygP5Rle0mKIyDC1nIw==
X-CSE-MsgGUID: gF4ISPD+RX+FtdJiCXFWfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="270788210"
Received: from orsosgc001.jf.intel.com ([10.54.56.63])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 16:59:31 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: daniele.ceraolospurio@intel.com, michal.wajdeczko@intel.com,
 aravind.iddamsetty@intel.com, mallesh.koujalagi@intel.com,
 alan.previn.teres.alexis@intel.com, julia.filipchuk@intel.com
Subject: [PATCH v4 3/7] drm/xe/guc: Make ct_dead_capture available on
 non-debug config
Date: Thu, 17 Sep 2026 16:59:27 -0700
Message-ID: <20260917235923.1521112-12-umesh.nerlige.ramappa@intel.com>
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

Define ct_dead_capture for non-debug as well to simplify future
refactor.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index b3a6aa37808b..3353515aa874 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -59,6 +59,9 @@ static struct xe_device *ct_to_xe(struct xe_guc_ct *ct)
 	return gt_to_xe(ct_to_gt(ct));
 }
 
+#define ct_id(reason_code)  CT_DEAD_##reason_code
+#define CT_DEAD(ct, ctb, reason_code)	ct_dead_capture((ct), (ctb), ct_id(reason_code))
+
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
 enum {
 	/* Internal states, not error conditions */
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
@@ -2376,4 +2369,10 @@ static void ct_dead_worker_func(struct work_struct *w)
 
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

