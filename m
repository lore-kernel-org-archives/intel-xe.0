Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49C31CEACDC
	for <intel-xe@archiver.kernel.org>; Fri, 14 Nov 2025 21:43:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D441310EB2F;
	Fri, 14 Nov 2025 21:43:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ahGak4Bm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B03A10EB2F
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Nov 2025 21:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763156630; x=1794692630;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tiJMnQSXU4F8gdmASs9IRa6ugAquRxdQDaEtXg5Rg2M=;
 b=ahGak4BmcniFHZJXeYWA8Zk+IGnrlylTSrPkwpCPA7j5BUahrxie837u
 YfR03NqvlCJHnZHbQWCSQ2DcvshzhtBjxfY5Uw/5TyUr+UjHx8i8ZpzNz
 RgCMHrrv+959kR11Gu8LcYOH3onL7xiA2AoftCYP+GoE8Nbloo+Qr3ets
 GcDFzzZVoiF4IBUK0hErGYbAziAgpJM3OzH0uLiXpyHZs8VmJ1J00oCNa
 e/cWtoIkNDEtRlc6/QWXngoH8NFTUv3RTGEQujUgrixesOjv61RjUtLSw
 pNAZ0Oyoha+9rxZRGcTgLWl/SiEKGqe7/dbi06YDDaeEmiFDOogJBNTjm A==;
X-CSE-ConnectionGUID: WUFYyEHUSzSNfMOSbN9tZg==
X-CSE-MsgGUID: 4TLOnV81T36KI9Tzat6xCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="82648315"
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="82648315"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 13:43:49 -0800
X-CSE-ConnectionGUID: pn0PR+5YS3esOhJ/fnHlKw==
X-CSE-MsgGUID: lmeRoxUPQq+F78FeNE3aZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="190308315"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 13:43:48 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH v3 14/27] drm/xe: Return forcewake reference type from
 force_wake_get_any_engine()
Date: Fri, 14 Nov 2025 13:43:50 -0800
Message-ID: <20251114214335.2388972-43-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251114214335.2388972-29-matthew.d.roper@intel.com>
References: <20251114214335.2388972-29-matthew.d.roper@intel.com>
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

Adjust the signature of force_wake_get_any_engine() such that it returns
a 'struct xe_force_wake_ref' rather than a boolean success/failure.
Failure cases are now recognized by inspecting the hardware engine
returned by reference; a NULL hwe indicates that no engine's forcewake
could be obtained.

These changes will make it cleaner and easier to incorporate scope-based
cleanup in force_wake_get_any_engine()'s caller in a future patch.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_drm_client.c | 38 +++++++++++++++---------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
index f931ff9b1ec0..78551832723b 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.c
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -285,32 +285,31 @@ static struct xe_hw_engine *any_engine(struct xe_device *xe)
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
+	fw_ref = xe_force_wake_constructor(gt_to_fw(hwe->gt), domain);
+	if (xe_force_wake_ref_has_domain(fw_ref.domains, domain))
+		*phwe = hwe;	/* valid forcewake */
 
-	*phwe = hwe;
-	*pfw_ref = fw_ref;
-
-	return true;
+	return fw_ref;
 }
 
 static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
@@ -322,7 +321,7 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
 	struct xe_hw_engine *hwe;
 	struct xe_exec_queue *q;
 	u64 gpu_timestamp;
-	unsigned int fw_ref;
+	struct xe_force_wake_ref fw_ref;
 
 	/*
 	 * RING_TIMESTAMP registers are inaccessible in VF mode.
@@ -340,7 +339,8 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
 		       !atomic_read(&xef->exec_queue.pending_removal));
 
 	xe_pm_runtime_get(xe);
-	if (!force_wake_get_any_engine(xe, &hwe, &fw_ref)) {
+	fw_ref = force_wake_get_any_engine(xe, &hwe);
+	if (!hwe) {
 		xe_pm_runtime_put(xe);
 		return;
 	}
@@ -360,7 +360,7 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
 
 	gpu_timestamp = xe_hw_engine_read_timestamp(hwe);
 
-	xe_force_wake_put(gt_to_fw(hwe->gt), fw_ref);
+	xe_force_wake_put(gt_to_fw(hwe->gt), fw_ref.domains);
 	xe_pm_runtime_put(xe);
 
 	for (class = 0; class < XE_ENGINE_CLASS_MAX; class++) {
-- 
2.51.1

