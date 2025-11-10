Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 162C4CCFA1A
	for <intel-xe@archiver.kernel.org>; Mon, 10 Nov 2025 23:20:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C71BF10E45A;
	Mon, 10 Nov 2025 23:20:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lvco/Mt3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A13B610E49A
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Nov 2025 23:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762816834; x=1794352834;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IoemOF0/h0kQG8A+E/JfaRlgWIhdbXphLY/bwZYRI/k=;
 b=lvco/Mt3CeQvrZaBOE04L5FjNUWnCdY/2s574W9hjl1VYtz6eJO6hDAF
 wphFfMr/V0uqBQ5PMgxheoczbDcppNdOiXAcU99lPeZtYvE/SjxWigs55
 6fbmWoIUDpGBtT+qU7wx6OEkJDGhjZktsJnMbWid0BL0Ph+CekAdd9u7J
 y33blU/P30QJN2+wBlSo7U9n7r/wQGqjdSajnMvpMjme5V4QGIlA/LiEI
 Ug1/fT2PGqp/cQyi05+ajepZt2jnA7DEreNu1eDJHTOd7F5ooOWGxwFvJ
 kXJQ3s4CPKFfo+NX5cLzlSGcjTpsYt5iIHqPYbiEHr5oKm8WBO0fSNFOd w==;
X-CSE-ConnectionGUID: Wpf2ZQI0RxGXV0yhRdEmIg==
X-CSE-MsgGUID: VmRWRjcLRTWoR23FejFntg==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="75486454"
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="75486454"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 15:20:32 -0800
X-CSE-ConnectionGUID: wRAdbBmvQyOVsVsQryEU1w==
X-CSE-MsgGUID: ax5+NeN7Thqj8tCnGFTZWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="189243999"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 15:20:32 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH v2 17/30] drm/xe: Create scoped cleanup class for
 force_wake_get_any_engine()
Date: Mon, 10 Nov 2025 15:20:35 -0800
Message-ID: <20251110232017.1475869-49-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251110232017.1475869-32-matthew.d.roper@intel.com>
References: <20251110232017.1475869-32-matthew.d.roper@intel.com>
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

force_wake_get_any_engine() is a single-use function to pick any engine
present on the platform and grab its forcewake.  The signature
(returning a boolean success and both the engine pointer and a forcewake
ref by reference) is a bit awkward.  Rewrite it such that the
forcewake ref is the function's return value and the caller can
determine success/failure by checking the engine pointer against NULL.

With this new signature, the function can serve as a scoped cleanup
class constructor, so define the corresponding class.  Note that if we
fail to obtain forcewake (or if the platform somehow has no engines),
the constructor can fail, returning an invalid fw_ref.  In such cases,
fw_ref.fw will be NULL, making it clear that the reference is invalid;
this fact can be used to create a thin wrapper around xe_force_wake_put
that can be used as a destructor for this class.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_drm_client.c | 52 +++++++++++++++++++-----------
 1 file changed, 34 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
index f931ff9b1ec0..9deb258ba204 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.c
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -6,6 +6,7 @@
 
 #include <drm/drm_print.h>
 #include <uapi/drm/xe_drm.h>
+#include <linux/cleanup.h>
 #include <linux/kernel.h>
 #include <linux/slab.h>
 #include <linux/types.h>
@@ -285,34 +286,48 @@ static struct xe_hw_engine *any_engine(struct xe_device *xe)
 	return NULL;
 }
 
-static bool force_wake_get_any_engine(struct xe_device *xe,
-				      struct xe_hw_engine **phwe,
-				      unsigned int *pfw_ref)
+/*
+ * Pick any engine and grab its forcewake.  On error phwe will be NULL and
+ * the returned forcewake reference will be invalid.  Callers should check
+ * phwe against NULL.
+ */
+static struct xe_force_wake_ref force_wake_get_any_engine(struct xe_device *xe,
+							  struct xe_hw_engine **phwe)
 {
 	enum xe_force_wake_domains domain;
-	unsigned int fw_ref;
+	struct xe_force_wake_ref fw_ref = {};
 	struct xe_hw_engine *hwe;
-	struct xe_force_wake *fw;
+
+	*phwe = NULL;
 
 	hwe = any_engine(xe);
 	if (!hwe)
-		return false;
+		return fw_ref;	/* will be invalid */
 
 	domain = xe_hw_engine_to_fw_domain(hwe);
-	fw = gt_to_fw(hwe->gt);
 
-	fw_ref = xe_force_wake_get(fw, domain);
-	if (!xe_force_wake_ref_has_domain(fw_ref, domain)) {
-		xe_force_wake_put(fw, fw_ref);
-		return false;
-	}
+	fw_ref.fw = gt_to_fw(hwe->gt);
+	fw_ref.domains = xe_force_wake_get(fw_ref.fw, domain);
+	if (xe_force_wake_ref_has_domain(fw_ref.domains, domain))
+		*phwe = hwe;	/* valid forcewake */
 
-	*phwe = hwe;
-	*pfw_ref = fw_ref;
+	return fw_ref;
+}
 
-	return true;
+static void drop_fw_if_valid(struct xe_force_wake_ref fw_ref)
+{
+	/*
+	 * If force_wake_get_any_engine() fails, there's no real forcewake
+	 * reference to drop, and fw_ref.fw will be NULL.
+	 */
+	if (fw_ref.fw)
+		xe_force_wake_put(fw_ref.fw, fw_ref.domains);
 }
 
+DEFINE_CLASS(xe_force_wake_any_engine, struct xe_force_wake_ref,
+	     drop_fw_if_valid(_T), force_wake_get_any_engine(xe, phwe),
+	     struct xe_device *xe, struct xe_hw_engine **phwe);
+
 static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
 {
 	unsigned long class, i, gt_id, capacity[XE_ENGINE_CLASS_MAX] = { };
@@ -322,7 +337,7 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
 	struct xe_hw_engine *hwe;
 	struct xe_exec_queue *q;
 	u64 gpu_timestamp;
-	unsigned int fw_ref;
+	struct xe_force_wake_ref fw_ref;
 
 	/*
 	 * RING_TIMESTAMP registers are inaccessible in VF mode.
@@ -340,7 +355,8 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
 		       !atomic_read(&xef->exec_queue.pending_removal));
 
 	xe_pm_runtime_get(xe);
-	if (!force_wake_get_any_engine(xe, &hwe, &fw_ref)) {
+	fw_ref = force_wake_get_any_engine(xe, &hwe);
+	if (!hwe) {
 		xe_pm_runtime_put(xe);
 		return;
 	}
@@ -360,7 +376,7 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
 
 	gpu_timestamp = xe_hw_engine_read_timestamp(hwe);
 
-	xe_force_wake_put(gt_to_fw(hwe->gt), fw_ref);
+	xe_force_wake_put(gt_to_fw(hwe->gt), fw_ref.domains);
 	xe_pm_runtime_put(xe);
 
 	for (class = 0; class < XE_ENGINE_CLASS_MAX; class++) {
-- 
2.51.1

